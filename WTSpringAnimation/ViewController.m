//
//  ViewController.m
//  WTSpringAnimation
//
//  Created by 王涛 on 2018/4/24.
//  Copyright © 2018年 王涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 60)];
    animationView.backgroundColor = [UIColor redColor];
    [self.view.layer addSublayer:animationView.layer];
    [self addDirAnimation:animationView];
}

- (void)addDirAnimation:(UIView *)view {
//    view.bounds.size.x
//    CATransition *transition = [CATransition animation];
//    transition.duration = 6.0;
//    transition.type = kCATransitionMoveIn;
//    transition.subtype = kCATransitionFromLeft;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.duration = 6.0;
//    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 0, 60)];
//    animation.byValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 100, 60)];;
    animation.fromValue = @(0);
    animation.byValue = @(1);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view.layer addAnimation:animation forKey:@"nodeColor"];
//        [view.layer addAnimation:transition forKey:@"node"];
    });
}

- (void)addAnimation:(UIView *)view {
//    NSArray *startPosition = @[@1,@20,@20];
//    NSArray *endPosition = @[@100,@20,@20];
//    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"position"];
//    springAnimation.damping = 1.0;
//    springAnimation.mass = 5.0;
//    springAnimation.removedOnCompletion = NO;
//
////    springAnimation.fillMode = kCAFillModeBoth;
//    springAnimation.initialVelocity = 0;
//    springAnimation.duration = 4.0;
//    springAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake([startPosition[0] integerValue], [startPosition[2] integerValue])];
//    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake([endPosition[0] integerValue], [endPosition[2] integerValue])];
//    springAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [view.layer addAnimation:springAnimation forKey:@"springAnimation"];
    
        NSArray *startPosition = @[@1,@20,@20];
        NSArray *endPosition = @[@100,@20,@20];
    CGFloat duration = 3.0;
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    CGFloat currentTy = 20;
    animation.duration = duration;
    
    animation.values = @[@([endPosition[0] integerValue]), @([startPosition[0] integerValue]), @([startPosition[0] integerValue] +[endPosition[0] integerValue]/2), @([startPosition[0] integerValue]), @([startPosition[0] integerValue] +[endPosition[0] integerValue]/4), @([startPosition[0] integerValue]),@([startPosition[0] integerValue] +[endPosition[0] integerValue]/6), @([startPosition[0] integerValue])];
    
    animation.keyTimes = @[@(0), @(0.5), @(1.05), @(1.5), @(2.0), @(2.05),@(2.5), @(3.0)];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.repeatCount = 1;
        [view.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
//    [CAKeyframeAnimation anima]
}

@end
