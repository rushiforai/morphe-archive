.class public final Lpg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public final a:Ls03;

.field public b:D

.field public c:J

.field public final d:Landroid/animation/ValueAnimator;

.field public final synthetic e:Lqg7;


# direct methods
.method public constructor <init>(Lqg7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpg7;->e:Lqg7;

    new-instance p1, Ls03;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Ls03;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lpg7;->a:Ls03;

    new-array p1, v0, [F

    fill-array-data p1, :array_24

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lpg7;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-wide/16 v0, 0x2710

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    return-void

    :array_24
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lpg7;->e:Lqg7;

    iget-object v1, v0, Lqg7;->p:Lre7;

    iget-object v2, p0, Lpg7;->d:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Lre7;->m()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result p0

    if-nez p0, :cond_1f

    iget-object p0, v0, Lqg7;->p:Lre7;

    invoke-virtual {p0}, Lre7;->m()Z

    move-result p0

    if-eqz p0, :cond_1f

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    :cond_1f
    return-void

    :cond_20
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lpg7;->b:D

    return-void
.end method

.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 2

    iget-object p0, p0, Lpg7;->a:Ls03;

    iget-boolean p1, p0, Ls03;->b:Z

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x1

    iput-boolean p1, p0, Ls03;->b:Z

    iget-object p1, p0, Ls03;->c:Ljava/lang/Object;

    check-cast p1, Lpg7;

    iget-object p1, p1, Lpg7;->e:Lqg7;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 13

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lpg7;->c:J

    sub-long v2, v0, v2

    iget-object p1, p0, Lpg7;->e:Lqg7;

    iget-object v4, p1, Lqg7;->p:Lre7;

    iget-wide v5, v4, Lre7;->i:J

    iget-wide v7, p0, Lpg7;->b:D

    const-wide/16 v9, 0x0

    cmpl-double v7, v7, v9

    if-eqz v7, :cond_27

    invoke-virtual {v4}, Lre7;->m()Z

    move-result v4

    if-eqz v4, :cond_27

    iget-wide v7, p0, Lpg7;->b:D

    long-to-double v4, v5

    sub-double/2addr v4, v7

    const-wide/high16 v9, 0x4024000000000000L    # 10.0

    div-double/2addr v4, v9

    add-double/2addr v4, v7

    iput-wide v4, p0, Lpg7;->b:D

    goto :goto_2a

    :cond_27
    long-to-double v4, v5

    iput-wide v4, p0, Lpg7;->b:D

    :goto_2a
    const-wide/16 v4, 0x32

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3d

    iput-wide v0, p0, Lpg7;->c:J

    iget-object v0, p1, Lqg7;->p:Lre7;

    invoke-virtual {p1, v0}, Lqg7;->l0(Lre7;)V

    iget-object p0, p0, Lpg7;->a:Ls03;

    iget-boolean p1, p0, Ls03;->b:Z

    if-eqz p1, :cond_3e

    :cond_3d
    return-void

    :cond_3e
    const/4 p1, 0x1

    iput-boolean p1, p0, Ls03;->b:Z

    iget-object p1, p0, Ls03;->c:Ljava/lang/Object;

    check-cast p1, Lpg7;

    iget-object p1, p1, Lpg7;->e:Lqg7;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
