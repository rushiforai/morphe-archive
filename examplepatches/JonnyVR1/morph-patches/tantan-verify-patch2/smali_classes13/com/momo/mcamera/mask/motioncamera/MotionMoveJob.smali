.class public Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private animationB:Landroid/animation/ValueAnimator;

.field private animationL:Landroid/animation/ValueAnimator;

.field private animationR:Landroid/animation/ValueAnimator;

.field private animationT:Landroid/animation/ValueAnimator;

.field private dstRectF:Landroid/graphics/RectF;

.field private handler:Landroid/os/Handler;

.field private regionChangedListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

.field private set:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/RectF;

    .line 16
    .line 17
    const/high16 v1, -0x40800000    # -1.0f

    .line 18
    .line 19
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 23
    .line 24
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private removeAnimAllListener()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationT:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationL:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationR:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 20
    .line 21
    .line 22
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationB:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 27
    .line 28
    .line 29
    :cond_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    if-eqz p0, :cond_4

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 34
    .line 35
    .line 36
    :cond_4
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$2;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->regionChangedListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 13
    .line 14
    return-void
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MotionFilter"

    .line 5
    .line 6
    const-string v0, "onAnimationCancel."

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->removeAnimAllListener()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MotionFilter"

    .line 5
    .line 6
    const-string v0, "onAnimationEnd."

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->removeAnimAllListener()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "MotionFilter"

    .line 5
    .line 6
    const-string p1, "onAnimationStart."

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationT:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    if-ne p1, v1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 16
    .line 17
    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationL:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 25
    .line 26
    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationR:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    if-ne p1, v1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 34
    .line 35
    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationB:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    if-ne p1, v1, :cond_3

    .line 41
    .line 42
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 43
    .line 44
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 45
    .line 46
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 47
    .line 48
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 49
    .line 50
    const/high16 v1, -0x40800000    # -1.0f

    .line 51
    .line 52
    cmpl-float v0, v0, v1

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 57
    .line 58
    cmpl-float v0, v0, v1

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    iget v0, p1, Landroid/graphics/RectF;->right:F

    .line 63
    .line 64
    cmpl-float v0, v0, v1

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 69
    .line 70
    cmpl-float p1, p1, v1

    .line 71
    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    new-instance p1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v0, "onAnimationUpdate \u56db\u4e2a\u503c\u90fd\u66f4\u65b0\u5b8c\uff0c\u53ef\u4ee5\u505a\u4e00\u6b21\u7ed8\u5236. rectF="

    .line 77
    .line 78
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/graphics/RectF;->toShortString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string v0, "MotionFilter"

    .line 95
    .line 96
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->regionChangedListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 106
    .line 107
    iget v3, v0, Landroid/graphics/RectF;->top:F

    .line 108
    .line 109
    iget v4, v0, Landroid/graphics/RectF;->right:F

    .line 110
    .line 111
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 112
    .line 113
    invoke-interface {p1, v2, v3, v4, v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;->onCropRegionChanged(FFFF)V

    .line 114
    .line 115
    .line 116
    :cond_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->dstRectF:Landroid/graphics/RectF;

    .line 117
    .line 118
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 119
    .line 120
    .line 121
    :cond_5
    return-void
.end method

.method public setCropRegionChangedListener(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->regionChangedListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 2
    .line 3
    return-void
.end method

.method public start(FLandroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 9

    .line 1
    iget v0, p2, Landroid/graphics/RectF;->top:F

    .line 2
    .line 3
    iget v1, p3, Landroid/graphics/RectF;->top:F

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    aput v0, v3, v4

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput v1, v3, v0

    .line 13
    .line 14
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationT:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    iget v3, p3, Landroid/graphics/RectF;->left:F

    .line 23
    .line 24
    new-array v5, v2, [F

    .line 25
    .line 26
    aput v1, v5, v4

    .line 27
    .line 28
    aput v3, v5, v0

    .line 29
    .line 30
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationL:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 37
    .line 38
    iget v3, p3, Landroid/graphics/RectF;->right:F

    .line 39
    .line 40
    new-array v5, v2, [F

    .line 41
    .line 42
    aput v1, v5, v4

    .line 43
    .line 44
    aput v3, v5, v0

    .line 45
    .line 46
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationR:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    iget v1, p2, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    iget v3, p3, Landroid/graphics/RectF;->bottom:F

    .line 55
    .line 56
    new-array v5, v2, [F

    .line 57
    .line 58
    aput v1, v5, v4

    .line 59
    .line 60
    aput v3, v5, v0

    .line 61
    .line 62
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationB:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationT:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationL:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationR:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationB:Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 91
    .line 92
    mul-float/2addr p1, v3

    .line 93
    float-to-long v5, p1

    .line 94
    invoke-virtual {v1, v5, v6}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    new-instance v3, Lcom/momo/mcamera/mask/motioncamera/MotionCameraInterpolator;

    .line 100
    .line 101
    const/4 v5, 0x0

    .line 102
    const/high16 v6, 0x3f800000    # 1.0f

    .line 103
    .line 104
    const/high16 v7, 0x3f000000    # 0.5f

    .line 105
    .line 106
    invoke-direct {v3, v7, v5, v7, v6}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraInterpolator;-><init>(FFFF)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 113
    .line 114
    invoke-virtual {v1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->set:Landroid/animation/AnimatorSet;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationT:Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    iget-object v5, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationL:Landroid/animation/ValueAnimator;

    .line 122
    .line 123
    iget-object v6, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationR:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    iget-object v7, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->animationB:Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    const/4 v8, 0x4

    .line 128
    new-array v8, v8, [Landroid/animation/Animator;

    .line 129
    .line 130
    aput-object v3, v8, v4

    .line 131
    .line 132
    aput-object v5, v8, v0

    .line 133
    .line 134
    aput-object v6, v8, v2

    .line 135
    .line 136
    const/4 v0, 0x3

    .line 137
    aput-object v7, v8, v0

    .line 138
    .line 139
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v1, "MotionMoveJob start, duration="

    .line 145
    .line 146
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string p1, ", rect="

    .line 153
    .line 154
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Landroid/graphics/RectF;->toShortString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string p1, ", dstRect="

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p3}, Landroid/graphics/RectF;->toShortString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    const-string p2, "MotionFilter"

    .line 181
    .line 182
    invoke-static {p2, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->handler:Landroid/os/Handler;

    .line 186
    .line 187
    new-instance p2, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$1;

    .line 188
    .line 189
    invoke-direct {p2, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$1;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 193
    .line 194
    .line 195
    return-void
.end method
