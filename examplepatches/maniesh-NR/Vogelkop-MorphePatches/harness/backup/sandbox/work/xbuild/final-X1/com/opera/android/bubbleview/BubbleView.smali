.class public Lcom/opera/android/bubbleview/BubbleView;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static final synthetic D:I


# instance fields
.field public A:I

.field public final B:Lj21;

.field public final C:Lml2;

.field public final a:Lcom/opera/android/custom_views/StylingImageView;

.field public final b:Lcom/opera/android/custom_views/StylingImageView;

.field public final c:Lcom/opera/android/custom_views/StylingImageView;

.field public final d:Lcom/opera/android/custom_views/StylingImageView;

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public m:F

.field public n:Lhxj;

.field public final o:[I

.field public final p:Landroid/graphics/Rect;

.field public final q:Landroid/graphics/Rect;

.field public final r:Landroid/graphics/Rect;

.field public final s:Landroid/graphics/Rect;

.field public t:Lxz3;

.field public u:Landroid/view/View;

.field public v:Llz3;

.field public w:Llz3;

.field public x:Z

.field public y:Z

.field public z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11
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

    const/4 v1, 0x2

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->o:[I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->p:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->q:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->r:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->s:Landroid/graphics/Rect;

    new-instance v2, Lj21;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lj21;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->B:Lj21;

    new-instance v2, Lml2;

    invoke-direct {v2, p0, v1}, Lml2;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->C:Lml2;

    const/high16 v2, 0x3fc00000    # 1.5f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    iput v2, p0, Lcom/opera/android/bubbleview/BubbleView;->g:I

    new-instance v2, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v4, 0x0

    invoke-direct {v2, p1, v4}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v5, Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {v5, p1, v4}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v5, p0, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v6, Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {v6, p1, v4}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v6, p0, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v7, Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {v7, p1, v4}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v7, p0, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    sget-object v2, Lkhh;->f:[I

    invoke-virtual {p1, p2, v2, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0700ad

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const/4 v4, 0x3

    invoke-virtual {p2, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/bubbleview/BubbleView;->h:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0700ab

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/bubbleview/BubbleView;->e:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0700ac

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/bubbleview/BubbleView;->f:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0700ae

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const/4 v4, 0x7

    invoke-virtual {p2, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/bubbleview/BubbleView;->i:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x7f0700af

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    const/16 v2, 0x8

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bubbleview/BubbleView;->j:I

    const/4 p1, 0x4

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    const p1, 0x7f040203

    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bubbleview/BubbleView;->A:I

    const/4 p1, 0x5

    invoke-virtual {p2, p1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bubbleview/BubbleView;->k:I

    const/4 p1, 0x6

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bubbleview/BubbleView;->l:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;J)V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->p:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    new-instance v0, Lxz3;

    invoke-direct {v0, p0, p2, p3, p1}, Lxz3;-><init>(Lcom/opera/android/bubbleview/BubbleView;JLjava/lang/Runnable;)V

    iput-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->t:Lxz3;

    return-void

    :cond_10
    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v3, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    const/high16 v4, 0x3f000000    # 0.5f

    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    const v4, 0x3f59999a    # 0.85f

    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleY(F)V

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    sub-int/2addr v4, v2

    int-to-float v2, v4

    const v4, 0x3e199998    # 0.14999998f

    mul-float/2addr v2, v4

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    sub-int/2addr v0, v3

    int-to-float v0, v0

    mul-float/2addr v0, v4

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v3, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    iget-object p1, p0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v3, 0x2

    div-long/2addr p2, v3

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    iget-object p1, p0, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setPivotY(F)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    iget-object p1, p0, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v1}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final b()V
    .registers 13

    iget v0, p0, Lcom/opera/android/bubbleview/BubbleView;->A:I

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v2, p0, Lcom/opera/android/bubbleview/BubbleView;->A:I

    invoke-static {v2, v0}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_11

    :cond_10
    move-object v0, v1

    :goto_11
    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    if-eq v2, v0, :cond_1e

    iput-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1e

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->s:Landroid/graphics/Rect;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    :cond_1e
    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    iget v3, p0, Lcom/opera/android/bubbleview/BubbleView;->h:I

    if-eqz v0, :cond_34

    new-instance v0, Lzz3;

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    iget-object v4, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    int-to-float v5, v3

    invoke-direct {v0, v1, v4, v5}, Lzz3;-><init>(Landroid/view/View;Landroid/graphics/drawable/Drawable;F)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_37

    :cond_34
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_37
    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_3c

    return-void

    :cond_3c
    new-instance v4, Lyz3;

    iget v0, p0, Lcom/opera/android/bubbleview/BubbleView;->g:I

    int-to-float v9, v0

    move v8, v9

    iget-object v9, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Lcom/opera/android/bubbleview/BubbleView;->d(Lcom/opera/android/custom_views/StylingImageView;)Landroid/graphics/Point;

    move-result-object v10

    iget v5, p0, Lcom/opera/android/bubbleview/BubbleView;->f:I

    iget v6, p0, Lcom/opera/android/bubbleview/BubbleView;->e:I

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v10}, Lyz3;-><init>(IIIFLandroid/graphics/drawable/Drawable;Landroid/graphics/Point;)V

    move v9, v8

    invoke-virtual {v0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget v1, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    new-instance v5, Lyz3;

    iget-object v10, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Lcom/opera/android/bubbleview/BubbleView;->d(Lcom/opera/android/custom_views/StylingImageView;)Landroid/graphics/Point;

    move-result-object v11

    iget v6, p0, Lcom/opera/android/bubbleview/BubbleView;->f:I

    iget v7, p0, Lcom/opera/android/bubbleview/BubbleView;->e:I

    const/4 v8, 0x3

    invoke-direct/range {v5 .. v11}, Lyz3;-><init>(IIIFLandroid/graphics/drawable/Drawable;Landroid/graphics/Point;)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget v1, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    new-instance v5, Lyz3;

    iget-object v10, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Lcom/opera/android/bubbleview/BubbleView;->d(Lcom/opera/android/custom_views/StylingImageView;)Landroid/graphics/Point;

    move-result-object v11

    iget v6, p0, Lcom/opera/android/bubbleview/BubbleView;->e:I

    iget v7, p0, Lcom/opera/android/bubbleview/BubbleView;->f:I

    const/4 v8, 0x0

    invoke-direct/range {v5 .. v11}, Lyz3;-><init>(IIIFLandroid/graphics/drawable/Drawable;Landroid/graphics/Point;)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget v1, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    new-instance v5, Lyz3;

    iget-object v10, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Lcom/opera/android/bubbleview/BubbleView;->d(Lcom/opera/android/custom_views/StylingImageView;)Landroid/graphics/Point;

    move-result-object v11

    iget v6, p0, Lcom/opera/android/bubbleview/BubbleView;->e:I

    iget v7, p0, Lcom/opera/android/bubbleview/BubbleView;->f:I

    const/4 v8, 0x2

    invoke-direct/range {v5 .. v11}, Lyz3;-><init>(IIIFLandroid/graphics/drawable/Drawable;Landroid/graphics/Point;)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget v1, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    new-instance v1, Lzz3;

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    iget-object v4, p0, Lcom/opera/android/bubbleview/BubbleView;->z:Landroid/graphics/drawable/Drawable;

    int-to-float v3, v3

    invoke-direct {v1, v2, v4, v3}, Lzz3;-><init>(Landroid/view/View;Landroid/graphics/drawable/Drawable;F)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    iget p0, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method public final c()Z
    .registers 8

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->e()Lixj;

    move-result-object v0

    iget-object v1, v0, Lixj;->b:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->q:Landroid/graphics/Rect;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_4c

    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v3

    const/4 v5, 0x1

    if-nez v3, :cond_26

    iget-boolean v3, p0, Lcom/opera/android/bubbleview/BubbleView;->y:Z

    if-nez v3, :cond_26

    iput-boolean v5, p0, Lcom/opera/android/bubbleview/BubbleView;->y:Z

    new-instance v3, Lfv2;

    const/16 v6, 0x19

    invoke-direct {v3, p0, v6}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v3}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_26
    iget-object v3, p0, Lcom/opera/android/bubbleview/BubbleView;->r:Landroid/graphics/Rect;

    if-nez v1, :cond_3a

    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0, v4}, Lcom/opera/android/bubbleview/BubbleView;->g(Z)V

    :cond_33
    invoke-virtual {v2}, Landroid/graphics/Rect;->setEmpty()V

    invoke-virtual {v3}, Landroid/graphics/Rect;->setEmpty()V

    return v4

    :cond_3a
    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object v0, v0, Lixj;->h:Landroid/graphics/Rect;

    if-eqz v0, :cond_45

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_48

    :cond_45
    invoke-virtual {v3}, Landroid/graphics/Rect;->setEmpty()V

    :goto_48
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return v5

    :cond_4c
    return v4
.end method

.method public final d(Lcom/opera/android/custom_views/StylingImageView;)Landroid/graphics/Point;
    .registers 5

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    sub-int/2addr v1, v2

    neg-int v1, v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    iget-object p0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    sub-int/2addr p1, p0

    neg-int p0, p1

    invoke-static {p0, v2}, Ljava/lang/Math;->min(II)I

    move-result p0

    iput p0, v0, Landroid/graphics/Point;->y:I

    return-object v0
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_36

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->v:Llz3;

    const/4 v2, 0x0

    if-eqz v0, :cond_35

    iget-object v3, p0, Lcom/opera/android/bubbleview/BubbleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_16

    move p0, v2

    goto :goto_2f

    :cond_16
    iget-object v4, p0, Lcom/opera/android/bubbleview/BubbleView;->o:[I

    invoke-virtual {p0, v4}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    float-to-int p0, p0

    aget v5, v4, v2

    add-int/2addr p0, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    aget v4, v4, v1

    add-int/2addr p1, v4

    invoke-virtual {v3, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p0

    :goto_2f
    invoke-virtual {v0, p0}, Llz3;->d(Z)Z

    move-result p0

    if-nez p0, :cond_36

    :cond_35
    return v2

    :cond_36
    return v1
.end method

.method public final e()Lixj;
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
    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->n:Lhxj;

    invoke-interface {v0}, Lhxj;->c()Lixj;

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

.method public final f(ILixj;)V
    .registers 5

    iget v0, p0, Lcom/opera/android/bubbleview/BubbleView;->j:I

    shl-int/lit8 v0, v0, 0x1

    sub-int/2addr p1, v0

    iget-object v0, p2, Lixj;->b:Landroid/graphics/Rect;

    if-eqz v0, :cond_22

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    sub-int v1, p1, v1

    iget v0, v0, Landroid/graphics/Rect;->top:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p2, Lixj;->b:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    add-int/2addr v1, v0

    sub-int/2addr p1, v1

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr p1, v0

    :cond_22
    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    iget p2, p2, Lixj;->a:I

    iget p0, p0, Lcom/opera/android/bubbleview/BubbleView;->i:I

    shl-int/lit8 p0, p0, 0x1

    sub-int/2addr p2, p0

    const/high16 p0, -0x80000000

    invoke-static {p2, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-static {p1, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    invoke-virtual {v0, p2, p0}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final g(Z)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/bubbleview/BubbleView;->x:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/bubbleview/BubbleView;->x:Z

    new-instance v0, Lgh2;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->q:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->B:Lj21;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/bubbleview/BubbleView;->C:Lml2;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->B:Lj21;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/bubbleview/BubbleView;->C:Lml2;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/bubbleview/BubbleView;->g(Z)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a026e

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    new-instance v1, Lu7;

    const/16 v2, 0x19

    invoke-direct {v1, p0, v2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 27

    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/opera/android/bubbleview/BubbleView;->e()Lixj;

    move-result-object v1

    if-eqz p1, :cond_d

    sub-int v2, p5, p3

    invoke-virtual {v0, v2, v1}, Lcom/opera/android/bubbleview/BubbleView;->f(ILixj;)V

    :cond_d
    iget-object v2, v1, Lixj;->b:Landroid/graphics/Rect;

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, v0, Lcom/opera/android/bubbleview/BubbleView;->p:Landroid/graphics/Rect;

    if-eqz v2, :cond_27

    iget-object v6, v0, Lcom/opera/android/bubbleview/BubbleView;->o:[I

    invoke-virtual {v0, v6}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-virtual {v5, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    aget v7, v6, v4

    neg-int v7, v7

    aget v6, v6, v3

    neg-int v6, v6

    invoke-virtual {v5, v7, v6}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_32

    :cond_27
    sub-int v6, p4, p2

    div-int/lit8 v6, v6, 0x2

    sub-int v7, p5, p3

    div-int/lit8 v7, v7, 0x2

    invoke-virtual {v5, v6, v7, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    :goto_32
    iget v6, v1, Lixj;->e:I

    iget v7, v0, Lcom/opera/android/bubbleview/BubbleView;->j:I

    iget v8, v0, Lcom/opera/android/bubbleview/BubbleView;->i:I

    iget-object v9, v0, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v10, v0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v11, v0, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v12, v0, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    const/4 v13, 0x4

    if-eq v6, v3, :cond_f1

    const/4 v14, 0x3

    if-eq v6, v14, :cond_f1

    iget-object v1, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iget-object v3, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    div-int/lit8 v14, v3, 0x2

    sub-int/2addr v6, v14

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v14

    sub-int/2addr v14, v7

    sub-int/2addr v14, v3

    invoke-static {v6, v7, v14}, Lnb6;->j(III)I

    move-result v6

    add-int/2addr v8, v1

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v8

    iget v8, v5, Landroid/graphics/Rect;->left:I

    if-ge v7, v8, :cond_74

    sub-int/2addr v8, v1

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    sub-int/2addr v8, v7

    goto :goto_7b

    :cond_74
    iget v7, v5, Landroid/graphics/Rect;->right:I

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v7

    :goto_7b
    iget-object v7, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    add-int/2addr v1, v8

    add-int/2addr v3, v6

    invoke-virtual {v7, v8, v6, v1, v3}, Landroid/view/View;->layout(IIII)V

    iget-object v3, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    iget v6, v5, Landroid/graphics/Rect;->left:I

    if-gt v3, v6, :cond_8e

    if-nez v2, :cond_94

    :cond_8e
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    move-result v3

    if-eqz v3, :cond_b0

    :cond_94
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v3, v6

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    add-int/2addr v6, v1

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v7, v3

    invoke-virtual {v11, v1, v3, v6, v7}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {v11, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_b3

    :cond_b0
    invoke-virtual {v11, v13}, Landroid/view/View;->setVisibility(I)V

    :goto_b3
    iget-object v1, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget v3, v5, Landroid/graphics/Rect;->right:I

    if-lt v1, v3, :cond_bf

    if-nez v2, :cond_c5

    :cond_bf
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_e6

    :cond_c5
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    sub-int/2addr v8, v1

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v8

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {v12, v8, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {v12, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e9

    :cond_e6
    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    :goto_e9
    invoke-virtual {v10, v13}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v13}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2bc

    :cond_f1
    iget-object v14, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    iget-object v15, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v15}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v16

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v17

    iget-boolean v4, v1, Lixj;->g:Z

    iget v3, v1, Lixj;->c:I

    invoke-static {v7, v3, v15, v13}, Lvep;->k(IIII)I

    move-result v3

    move-object/from16 v18, v2

    iget v2, v5, Landroid/graphics/Rect;->top:I

    if-ge v3, v2, :cond_119

    const/4 v3, 0x1

    goto :goto_11a

    :cond_119
    const/4 v3, 0x0

    :goto_11a
    sub-int v19, v16, v7

    move/from16 p2, v3

    iget v3, v1, Lixj;->d:I

    sub-int v19, v19, v3

    sub-int v19, v19, v15

    sub-int v3, v19, v17

    move/from16 v19, v4

    iget v4, v5, Landroid/graphics/Rect;->bottom:I

    if-le v3, v4, :cond_130

    const/16 p3, 0x1

    :goto_12e
    const/4 v3, 0x1

    goto :goto_133

    :cond_130
    const/16 p3, 0x0

    goto :goto_12e

    :goto_133
    if-ne v6, v3, :cond_175

    if-eqz p3, :cond_143

    add-int v4, v4, v17

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto/16 :goto_1c5

    :cond_143
    if-eqz p2, :cond_151

    sub-int/2addr v2, v15

    sub-int/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto/16 :goto_1c5

    :cond_151
    if-nez v19, :cond_1b4

    sub-int v16, v16, v7

    sub-int v16, v16, v15

    sub-int v3, v16, v17

    if-le v3, v4, :cond_166

    add-int v4, v4, v17

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_166
    add-int/2addr v7, v15

    add-int/2addr v7, v13

    if-ge v7, v2, :cond_1b4

    sub-int/2addr v2, v15

    sub-int/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_175
    if-eqz p2, :cond_182

    sub-int/2addr v2, v15

    sub-int/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_182
    if-eqz p3, :cond_18f

    add-int v4, v4, v17

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_18f
    if-nez v19, :cond_1b4

    add-int v3, v7, v15

    add-int/2addr v3, v13

    if-ge v3, v2, :cond_1a1

    sub-int/2addr v2, v15

    sub-int/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_1a1
    sub-int v16, v16, v7

    sub-int v16, v16, v15

    sub-int v2, v16, v17

    if-le v2, v4, :cond_1b4

    add-int v4, v4, v17

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_1b4
    if-eqz v19, :cond_1bb

    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    move-result-object v2

    goto :goto_1c5

    :cond_1bb
    add-int v4, v4, v17

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v2

    :goto_1c5
    invoke-virtual {v2}, Ljava/util/Optional;->isPresent()Z

    move-result v3

    if-nez v3, :cond_1cf

    const/4 v3, 0x0

    :goto_1cc
    const/4 v4, 0x4

    goto/16 :goto_2af

    :cond_1cf
    invoke-virtual {v2}, Ljava/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v15, v2

    iget v3, v5, Landroid/graphics/Rect;->top:I

    iget v4, v0, Lcom/opera/android/bubbleview/BubbleView;->h:I

    if-gt v15, v3, :cond_1e2

    if-nez v18, :cond_1e8

    :cond_1e2
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    move-result v3

    if-eqz v3, :cond_219

    :cond_1e8
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v3, v6

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    add-int/2addr v6, v3

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v7, v15

    invoke-virtual {v9, v3, v15, v6, v7}, Landroid/view/View;->layout(IIII)V

    const/4 v7, 0x0

    invoke-virtual {v9, v7}, Landroid/view/View;->setVisibility(I)V

    sub-int/2addr v3, v4

    invoke-static {v8, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v6, v4

    sub-int/2addr v7, v6

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v8

    move/from16 v20, v8

    move v8, v3

    move/from16 v3, v20

    goto :goto_21e

    :cond_219
    const/4 v3, 0x4

    invoke-virtual {v9, v3}, Landroid/view/View;->setVisibility(I)V

    move v3, v8

    :goto_21e
    iget v6, v5, Landroid/graphics/Rect;->bottom:I

    if-lt v2, v6, :cond_224

    if-nez v18, :cond_22a

    :cond_224
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    move-result v6

    if-eqz v6, :cond_261

    :cond_22a
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    sub-int/2addr v6, v7

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    sub-int v13, v2, v13

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    move/from16 v17, v4

    add-int v4, v16, v13

    invoke-virtual {v10, v6, v13, v7, v4}, Landroid/view/View;->layout(IIII)V

    const/4 v4, 0x0

    invoke-virtual {v10, v4}, Landroid/view/View;->setVisibility(I)V

    sub-int v6, v6, v17

    invoke-static {v8, v6}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int v7, v7, v17

    sub-int/2addr v4, v7

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_265

    :cond_261
    const/4 v4, 0x4

    invoke-virtual {v10, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_265
    iget-boolean v1, v1, Lixj;->f:Z

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    iget-object v5, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    iget v6, v0, Lcom/opera/android/bubbleview/BubbleView;->l:I

    iget v7, v0, Lcom/opera/android/bubbleview/BubbleView;->k:I

    const/4 v13, 0x1

    if-eq v7, v13, :cond_295

    const v13, 0x800003

    if-eq v7, v13, :cond_291

    const v13, 0x800005

    if-eq v7, v13, :cond_288

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    if-eqz v1, :cond_29b

    goto :goto_29a

    :cond_288
    if-eqz v1, :cond_28e

    :goto_28a
    neg-int v1, v6

    add-int v6, v1, v4

    goto :goto_29c

    :cond_28e
    sub-int/2addr v4, v5

    add-int/2addr v6, v4

    goto :goto_29c

    :cond_291
    if-eqz v1, :cond_29b

    sub-int/2addr v4, v5

    goto :goto_28a

    :cond_295
    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    if-eqz v1, :cond_29b

    :goto_29a
    neg-int v6, v6

    :cond_29b
    add-int/2addr v6, v4

    :goto_29c
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int/2addr v1, v3

    sub-int/2addr v1, v14

    invoke-static {v6, v8, v1}, Lnb6;->j(III)I

    move-result v1

    iget-object v3, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    add-int/2addr v14, v1

    invoke-virtual {v3, v1, v2, v14, v15}, Landroid/view/View;->layout(IIII)V

    const/4 v3, 0x1

    goto/16 :goto_1cc

    :goto_2af
    invoke-virtual {v12, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v11, v4}, Landroid/view/View;->setVisibility(I)V

    if-nez v3, :cond_2bc

    const/4 v13, 0x1

    invoke-virtual {v0, v13}, Lcom/opera/android/bubbleview/BubbleView;->g(Z)V

    return-void

    :cond_2bc
    :goto_2bc
    iget-object v1, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, v0, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, v0, Lcom/opera/android/bubbleview/BubbleView;->s:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2dd

    iget v1, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, v3, Landroid/graphics/Rect;->bottom:I

    :cond_2dd
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2ec

    iget v1, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, v3, Landroid/graphics/Rect;->bottom:I

    :cond_2ec
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2fb

    iget v1, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, v3, Landroid/graphics/Rect;->right:I

    :cond_2fb
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_30a

    iget v1, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, v3, Landroid/graphics/Rect;->right:I

    :cond_30a
    invoke-virtual {v0}, Lcom/opera/android/bubbleview/BubbleView;->b()V

    iget-object v1, v0, Lcom/opera/android/bubbleview/BubbleView;->t:Lxz3;

    if-eqz v1, :cond_317

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/opera/android/bubbleview/BubbleView;->t:Lxz3;

    invoke-virtual {v1}, Lxz3;->run()V

    :cond_317
    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    iget-object v0, p0, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->e()Lixj;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/opera/android/bubbleview/BubbleView;->f(ILixj;)V

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
