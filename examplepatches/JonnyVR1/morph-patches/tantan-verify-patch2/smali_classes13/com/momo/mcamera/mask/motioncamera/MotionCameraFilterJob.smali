.class public Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;
    }
.end annotation


# instance fields
.field private mAnimation:Landroid/animation/ValueAnimator;

.field private mHandler:Landroid/os/Handler;

.field private mListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;


# direct methods
.method public constructor <init>(FFF)V
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
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mHandler:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    aput p2, v0, v1

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    aput p3, v0, p2

    .line 23
    .line 24
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iput-object p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    const/high16 p3, 0x447a0000    # 1000.0f

    .line 31
    .line 32
    mul-float/2addr p1, p3

    .line 33
    float-to-long v0, p1

    .line 34
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance p2, Lcom/momo/mcamera/mask/motioncamera/MotionCameraInterpolator;

    .line 40
    .line 41
    const/4 p3, 0x0

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    .line 43
    .line 44
    const/high16 v1, 0x3f000000    # 0.5f

    .line 45
    .line 46
    invoke-direct {p2, v1, p3, v1, v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraInterpolator;-><init>(FFFF)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public isRunning()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;->onJobEnd()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;->onJobEnd()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mAnimation:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;->onScaleChanged(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setMotionFilterJobListener(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mListener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$1;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
