.class public Lcom/opera/android/custom_views/ToolbarProgressBar;
.super Lcom/opera/android/custom_views/SmoothProgressBar;
.source "SourceFile"

# interfaces
.implements Lw6f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/opera/android/custom_views/SmoothProgressBar;",
        "Lw6f;"
    }
.end annotation


# instance fields
.field public e:I

.field public f:Landroid/animation/ObjectAnimator;

.field public g:Landroid/animation/ObjectAnimator;

.field public final h:Lh7f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/SmoothProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->h:Lh7f;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    instance-of p2, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz p2, :cond_26

    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    const/high16 p2, 0x1020000

    invoke-virtual {p0, p2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_26

    invoke-virtual {p0, p1, p1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_26
    return-void
.end method

.method public static synthetic b(Lcom/opera/android/custom_views/ToolbarProgressBar;)V
    .registers 2

    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/opera/android/custom_views/SmoothProgressBar;->setProgress(I)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lotl;

    iget-object p0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->h:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lotl;

    iget-object p0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->h:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(I)V
    .registers 5

    invoke-super {p0, p1}, Lcom/opera/android/custom_views/SmoothProgressBar;->a(I)V

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_d

    move p1, v2

    goto :goto_e

    :cond_d
    move p1, v1

    :goto_e
    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_19

    move v1, v2

    :cond_19
    if-nez p1, :cond_22

    if-eqz v1, :cond_22

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    :cond_22
    if-eqz p1, :cond_32

    if-nez v1, :cond_32

    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    if-nez p1, :cond_2d

    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->c()V

    :cond_2d
    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    :cond_32
    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->e()V

    return-void
.end method

.method public final c()V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    :cond_f
    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    :cond_1e
    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_5a

    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    invoke-static {p0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    const-wide/16 v3, 0x96

    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    iget-object v1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    sget-object v5, Lvgb;->b:Lgfc;

    invoke-virtual {v1, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-array v0, v0, [F

    fill-array-data v0, :array_62

    invoke-static {p0, v2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    sget-object v1, Lvgb;->a:Lyp8;

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    new-instance v1, Lkc;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :array_5a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_62
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    :cond_7
    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    :cond_e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setIndeterminate(Z)V

    invoke-super {p0, v0}, Lcom/opera/android/custom_views/SmoothProgressBar;->setProgress(I)V

    return-void
.end method

.method public final e()V
    .registers 3

    iget v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->e:I

    if-eqz v0, :cond_8

    invoke-super {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_8
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    if-gtz v0, :cond_17

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    if-nez v0, :cond_17

    const/16 v0, 0x8

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v1, v0, :cond_40

    invoke-super {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->h:Lh7f;

    if-eqz p0, :cond_40

    new-instance v1, Lg7f;

    invoke-direct {v1, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_2a
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_40

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lotl;

    if-nez v0, :cond_3c

    invoke-interface {p0}, Lotl;->b()V

    goto :goto_2a

    :cond_3c
    invoke-interface {p0}, Lotl;->a()V

    goto :goto_2a

    :cond_40
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->c()V

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotY(F)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Lcom/opera/android/custom_views/SmoothProgressBar;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final declared-synchronized setIndeterminate(Z)V
    .registers 3

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_19

    if-ne p1, v0, :cond_9

    monitor-exit p0

    return-void

    :cond_9
    const/4 v0, 0x0

    :try_start_a
    invoke-super {p0, v0}, Lcom/opera/android/custom_views/SmoothProgressBar;->a(I)V

    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->e()V

    iput-boolean v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_19

    monitor-exit p0

    return-void

    :goto_17
    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_19

    throw p1

    :catchall_19
    move-exception p1

    goto :goto_17
.end method

.method public final declared-synchronized setProgress(I)V
    .registers 5

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-gtz v0, :cond_1b

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/animation/Animator;->isStarted()Z

    move-result v0

    if-nez v0, :cond_1b

    :cond_19
    move v0, v2

    goto :goto_1c

    :cond_1b
    move v0, v1

    :goto_1c
    if-gtz p1, :cond_1f

    move v1, v2

    :cond_1f
    if-lez p1, :cond_24

    invoke-super {p0, p1}, Lcom/opera/android/custom_views/SmoothProgressBar;->setProgress(I)V

    :cond_24
    if-eq v0, v1, :cond_45

    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    if-eqz p1, :cond_2e

    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->g:Landroid/animation/ObjectAnimator;

    if-nez p1, :cond_31

    :cond_2e
    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->c()V

    :cond_31
    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_3e

    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    :cond_3e
    if-eqz v1, :cond_45

    iget-object p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V
    :try_end_45
    .catchall {:try_start_1 .. :try_end_45} :catchall_49

    :cond_45
    monitor-exit p0

    return-void

    :goto_47
    :try_start_47
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_49

    throw p1

    :catchall_49
    move-exception p1

    goto :goto_47
.end method

.method public final setVisibility(I)V
    .registers 2

    iput p1, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->e:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->e()V

    return-void
.end method
