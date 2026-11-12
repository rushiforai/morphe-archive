.class public Lcom/opera/android/favorites/FavoriteFolderRootView;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Li3j;

.field public final c:[I

.field public final d:Landroid/graphics/Rect;

.field public e:Lbn7;

.field public f:Landroid/view/View;

.field public g:Z


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

    const/4 p2, 0x2

    new-array p2, p2, [I

    iput-object p2, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->c:[I

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->d:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07023f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->a:I

    return-void
.end method


# virtual methods
.method public final a()Landroid/animation/ValueAnimator;
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->e:Lbn7;

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    const/4 v2, 0x2

    div-int/2addr v1, v2

    add-int/2addr v1, v0

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iget-object v3, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/2addr v3, v2

    add-int/2addr v3, v0

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->d:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    sub-int/2addr v4, v1

    int-to-float v1, v4

    const v4, 0x3dccccd0    # 0.100000024f

    mul-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    move-result p0

    sub-int/2addr p0, v3

    int-to-float p0, p0

    mul-float/2addr p0, v4

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const v0, 0x3f666666    # 0.9f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x64

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    new-array p0, v2, [F

    fill-array-data p0, :array_68

    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    return-object p0

    nop

    :array_68
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final b(Lbn7;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->d:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    iput-object p1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->e:Lbn7;

    return-void

    :cond_b
    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v3, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    const/high16 v4, 0x3f000000    # 0.5f

    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    const v4, 0x3f59999a    # 0.85f

    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleY(F)V

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    sub-int/2addr v4, v2

    int-to-float v2, v4

    const v4, 0x3e199998    # 0.14999998f

    mul-float/2addr v2, v4

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    sub-int/2addr v0, v3

    int-to-float v0, v0

    mul-float/2addr v0, v4

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    iget-object p0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x96

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object v0, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final c()Lixj;
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance p0, Lixj;

    const/16 v0, 0x2710

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2, v2}, Lixj;-><init>(ILandroid/graphics/Rect;II)V

    return-object p0

    :cond_10
    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->b:Li3j;

    invoke-virtual {v0}, Li3j;->c()Lixj;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_1d

    return-object v0

    :cond_1d
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lixj;->b(Landroid/view/View;)Lr9b;

    move-result-object p0

    invoke-virtual {v0, p0}, Lixj;->a(Lr9b;)Lixj;

    move-result-object p0

    return-object p0
.end method

.method public final d(IILixj;)V
    .registers 7

    iget v0, p3, Lixj;->c:I

    iget v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->a:I

    add-int/2addr v0, v1

    iget v2, p3, Lixj;->d:I

    add-int/2addr v2, v1

    iget-object p0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    shl-int/lit8 v1, v1, 0x1

    sub-int/2addr p1, v1

    iget p3, p3, Lixj;->a:I

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/high16 p3, -0x80000000

    invoke-static {p1, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    sub-int/2addr p2, v0

    sub-int/2addr p2, v2

    invoke-static {p2, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 10

    invoke-virtual {p0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->c()Lixj;

    move-result-object v0

    if-eqz p1, :cond_b

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    invoke-virtual {p0, p4, p5, v0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->d(IILixj;)V

    :cond_b
    iget p1, v0, Lixj;->c:I

    iget-object p2, v0, Lixj;->b:Landroid/graphics/Rect;

    iget p3, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->a:I

    add-int/2addr p1, p3

    iget p4, v0, Lixj;->d:I

    add-int/2addr p4, p3

    iget-object p5, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getMeasuredWidth()I

    move-result p5

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    if-eqz p2, :cond_5b

    iget-object v1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->c:[I

    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    iget-object v2, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->d:Landroid/graphics/Rect;

    invoke-virtual {v2, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    const/4 p2, 0x0

    aget p2, v1, p2

    neg-int p2, p2

    const/4 v3, 0x1

    aget v1, v1, v3

    neg-int v1, v1

    invoke-virtual {v2, p2, v1}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result p2

    div-int/lit8 v1, p5, 0x2

    sub-int/2addr p2, v1

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    div-int/lit8 v2, v0, 0x2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v2, p3

    sub-int/2addr v2, p5

    invoke-static {p2, p3, v2}, Lnb6;->j(III)I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p3

    sub-int/2addr p3, p4

    sub-int/2addr p3, v0

    invoke-static {v1, p1, p3}, Lnb6;->j(III)I

    move-result p1

    goto :goto_6c

    :cond_5b
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p2

    sub-int/2addr p2, p5

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p3

    sub-int/2addr p3, v0

    sub-int/2addr p3, p4

    sub-int/2addr p3, p1

    div-int/lit8 p3, p3, 0x2

    add-int/2addr p1, p3

    :goto_6c
    iget-boolean p3, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->g:Z

    if-nez p3, :cond_77

    iget-object p3, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->f:Landroid/view/View;

    add-int/2addr p5, p2

    add-int/2addr v0, p1

    invoke-virtual {p3, p2, p1, p5, v0}, Landroid/view/View;->layout(IIII)V

    :cond_77
    iget-object p1, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->e:Lbn7;

    if-eqz p1, :cond_81

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/opera/android/favorites/FavoriteFolderRootView;->e:Lbn7;

    invoke-virtual {p0, p1}, Lcom/opera/android/favorites/FavoriteFolderRootView;->b(Lbn7;)V

    :cond_81
    return-void
.end method

.method public final onMeasure(II)V
    .registers 4

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->c()Lixj;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->d(IILixj;)V

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
