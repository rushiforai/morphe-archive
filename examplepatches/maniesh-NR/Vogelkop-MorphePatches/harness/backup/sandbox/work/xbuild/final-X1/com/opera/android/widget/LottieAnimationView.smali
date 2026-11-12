.class public Lcom/opera/android/widget/LottieAnimationView;
.super Ln2d;
.source "SourceFile"


# static fields
.field public static final synthetic s:I


# instance fields
.field public final o:Lws8;

.field public p:Z

.field public final q:I

.field public r:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2}, Ln2d;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    new-instance p1, Lws8;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lws8;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/widget/LottieAnimationView;->o:Lws8;

    .line 32
    new-instance p1, Lkc;

    const/16 p2, 0x11

    invoke-direct {p1, p0, p2}, Lkc;-><init>(Ljava/lang/Object;B)V

    const/4 p2, -0x1

    .line 33
    iput p2, p0, Lcom/opera/android/widget/LottieAnimationView;->q:I

    .line 34
    iget-object p0, p0, Ln2d;->d:Lf3d;

    .line 35
    iget-object p0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {p0, p1}, Lp3d;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Ln2d;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lws8;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lws8;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/widget/LottieAnimationView;->o:Lws8;

    new-instance p1, Lkc;

    const/16 p2, 0x11

    invoke-direct {p1, p0, p2}, Lkc;-><init>(Ljava/lang/Object;B)V

    const/4 p2, -0x1

    iput p2, p0, Lcom/opera/android/widget/LottieAnimationView;->q:I

    iget-object p0, p0, Ln2d;->d:Lf3d;

    iget-object p0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {p0, p1}, Lp3d;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public static r(Lp2d;)Z
    .registers 3

    iget-object p0, p0, Lp2d;->d:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh3d;

    iget v1, v0, Lh3d;->a:I

    iget v0, v0, Lh3d;->b:I

    mul-int/2addr v1, v0

    const/high16 v0, 0x1000000

    if-le v1, v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_21
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final f()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Ln2d;->h:Z

    iget-object v1, p0, Ln2d;->d:Lf3d;

    invoke-virtual {v1}, Lf3d;->j()V

    iput-boolean v0, p0, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    return-void
.end method

.method public final h()V
    .registers 3

    iget-object v0, p0, Ln2d;->j:Ljava/util/HashSet;

    sget-object v1, Ll2d;->f:Ll2d;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ln2d;->d:Lf3d;

    invoke-virtual {v0}, Lf3d;->k()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Ln2d;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    iget-object p0, p0, Lcom/opera/android/widget/LottieAnimationView;->o:Lws8;

    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    iget-object p0, p0, Lcom/opera/android/widget/LottieAnimationView;->o:Lws8;

    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 p1, -0x1

    iget v0, p0, Lcom/opera/android/widget/LottieAnimationView;->q:I

    if-eq v0, p1, :cond_3b

    iget-object p0, p0, Ln2d;->d:Lf3d;

    invoke-virtual {p0}, Lf3d;->i()Z

    move-result p1

    if-eqz p1, :cond_3b

    iget-object p1, p0, Lf3d;->b:Lp3d;

    iget p1, p1, Lp3d;->h:F

    float-to-int p1, p1

    if-le p1, v0, :cond_3b

    iget-object p1, p0, Lf3d;->b:Lp3d;

    invoke-virtual {p1}, Lp3d;->e()F

    move-result p1

    int-to-float v1, v0

    cmpl-float p1, p1, v1

    if-eqz p1, :cond_3b

    iget-object p1, p0, Lf3d;->a:Lp2d;

    if-nez p1, :cond_32

    iget-object p1, p0, Lf3d;->e:Ljava/util/ArrayList;

    new-instance v1, Lc3d;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lc3d;-><init>(Lf3d;IB)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_32
    iget-object p0, p0, Lf3d;->b:Lp3d;

    iget p1, p0, Lp3d;->k:F

    float-to-int p1, p1

    int-to-float p1, p1

    invoke-virtual {p0, v1, p1}, Lp3d;->l(FF)V

    :cond_3b
    return-void
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Ln2d;->j:Ljava/util/HashSet;

    sget-object v1, Ll2d;->f:Ll2d;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ln2d;->d:Lf3d;

    iget-object v1, v0, Lf3d;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, v0, Lf3d;->b:Lp3d;

    invoke-virtual {v1}, Lp3d;->cancel()V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-nez v1, :cond_1c

    const/4 v1, 0x1

    iput v1, v0, Lf3d;->E:I

    :cond_1c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    return-void
.end method

.method public final s(IIILjava/lang/Runnable;)V
    .registers 5

    iput-object p4, p0, Lcom/opera/android/widget/LottieAnimationView;->r:Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->f()V

    invoke-virtual {p0, p1}, Ln2d;->p(I)V

    iget-object p1, p0, Ln2d;->d:Lf3d;

    invoke-virtual {p1, p2, p3}, Lf3d;->q(II)V

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    return-void
.end method

.method public final t(Lk2d;Ljava/lang/Runnable;)V
    .registers 5

    iget v0, p1, Lk2d;->c:I

    iget-short v1, p1, Lk2d;->a:S

    iget-short p1, p1, Lk2d;->b:S

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    return-void
.end method
