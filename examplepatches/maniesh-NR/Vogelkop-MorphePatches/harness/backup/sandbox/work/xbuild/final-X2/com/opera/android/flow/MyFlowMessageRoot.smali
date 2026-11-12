.class public Lcom/opera/android/flow/MyFlowMessageRoot;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static final synthetic l:I


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Li7f;

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:I

.field public j:Z

.field public k:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Li7f;

    invoke-direct {p2}, Li7f;-><init>()V

    iput-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    iput v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->j:Z

    const/high16 p2, 0x41c00000    # 24.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->a:I

    const/high16 p2, 0x43980000    # 304.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->b:I

    new-instance p1, Llzb;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_3b

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_3b
    invoke-virtual {p1, p0}, Llzb;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a(ZZ)V
    .registers 7

    if-nez p2, :cond_c

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    :cond_c
    iget-boolean v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->j:Z

    if-ne p1, v0, :cond_11

    return-void

    :cond_11
    iget-object v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_28

    :cond_23
    if-eqz v0, :cond_27

    move v0, v3

    goto :goto_28

    :cond_27
    move v0, v2

    :goto_28
    iput-boolean p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->j:Z

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    if-eqz p2, :cond_6a

    if-eqz p1, :cond_32

    move v2, v3

    :cond_32
    const/4 p2, 0x2

    new-array p2, p2, [F

    const/4 v1, 0x0

    aput v0, p2, v1

    const/4 v0, 0x1

    aput v2, p2, v0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0xc8

    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    sget-object v0, Llf1;->n:Lfci;

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    new-instance v0, Lnl2;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    new-instance v0, Lin8;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1}, Lin8;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :cond_6a
    iget-object p0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    if-eqz p1, :cond_6f

    move v2, v3

    :cond_6f
    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public final b(I)V
    .registers 4

    iget v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    if-eq p1, v0, :cond_36

    iput p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    iget-object p0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :cond_f
    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lob9;

    iget v1, v0, Lob9;->a:I

    if-ne v1, p1, :cond_23

    iget-boolean v1, v0, Lob9;->c:Z

    if-nez v1, :cond_f

    :cond_23
    const/4 v1, 0x1

    iput-boolean v1, v0, Lob9;->c:Z

    iput p1, v0, Lob9;->a:I

    iget-object v0, v0, Lob9;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_f

    invoke-static {p1, v0}, Lob9;->b(ILandroid/view/View;)V

    goto :goto_f

    :cond_36
    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 7

    iget v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    if-eqz v0, :cond_12

    const/4 v1, 0x1

    if-eq v0, v1, :cond_f

    const/4 v1, 0x2

    if-eq v0, v1, :cond_c

    const/4 v0, 0x0

    goto :goto_14

    :cond_c
    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->f:Landroid/graphics/drawable/Drawable;

    goto :goto_14

    :cond_f
    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->d:Landroid/graphics/drawable/Drawable;

    goto :goto_14

    :cond_12
    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->e:Landroid/graphics/drawable/Drawable;

    :goto_14
    if-eqz v0, :cond_34

    iget-object v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    iget-object v3, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_34
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final drawableStateChanged()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 8

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    iget p3, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    const/4 p5, 0x0

    const/4 v0, 0x1

    if-ne p3, v0, :cond_c

    move p3, v0

    goto :goto_d

    :cond_c
    move p3, p5

    :goto_d
    if-nez p1, :cond_12

    if-nez p3, :cond_15

    goto :goto_14

    :cond_12
    if-eqz p3, :cond_15

    :goto_14
    move v0, p5

    :cond_15
    sub-int/2addr p4, p2

    if-eqz v0, :cond_21

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    sub-int p1, p4, p1

    goto :goto_22

    :cond_21
    move p1, p5

    :goto_22
    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    add-int/2addr p3, p1

    iget-object v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p2, p1, p5, p3, v1}, Landroid/view/View;->layout(IIII)V

    if-eqz v0, :cond_3c

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    sub-int p5, p4, p1

    :cond_3c
    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    add-int/2addr p3, p5

    iget-object p0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    add-int/2addr p0, p1

    invoke-virtual {p2, p5, p1, p3, p0}, Landroid/view/View;->layout(IIII)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->a:I

    sub-int v0, p1, v0

    iget v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->b:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/high16 v1, -0x80000000

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    iget-object p2, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->g:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->k:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_33

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_3b

    :cond_33
    iget-boolean v1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->j:Z

    if-eqz v1, :cond_3a

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_3b

    :cond_3a
    const/4 v1, 0x0

    :goto_3b
    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v0, p2

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
