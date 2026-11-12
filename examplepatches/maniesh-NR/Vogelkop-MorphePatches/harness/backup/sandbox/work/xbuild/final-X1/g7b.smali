.class public final Lg7b;
.super Landroid/widget/ScrollView;
.source "SourceFile"


# instance fields
.field public final a:Ltz4;

.field public final b:Lho3;

.field public final c:Lkc;

.field public final d:Landroid/view/animation/DecelerateInterpolator;

.field public e:B

.field public f:Landroid/animation/AnimatorSet;

.field public g:I

.field public h:F

.field public i:I

.field public j:I

.field public k:I

.field public l:Z

.field public m:Lorg/chromium/content_public/browser/WebContents;

.field public n:Z

.field public final o:Lt5d;

.field public final p:Lf7b;

.field public final q:Ljava/util/ArrayList;

.field public final r:Ljava/util/ArrayDeque;

.field public final s:Landroid/widget/LinearLayout;

.field public t:I

.field public u:I

.field public v:I

.field public w:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lt5d;Lcom/opera/android/browser/chromium/ChromiumContent;Lb7f;)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ltz4;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ltz4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lg7b;->a:Ltz4;

    const/4 v0, 0x0

    iput-byte v0, p0, Lg7b;->e:B

    new-instance v1, Lho3;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lho3;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lg7b;->b:Lho3;

    new-instance v1, Lkc;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, v2}, Lkc;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lg7b;->c:Lkc;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v1, p0, Lg7b;->d:Landroid/view/animation/DecelerateInterpolator;

    new-instance v1, Lyy4;

    invoke-direct {v1, p0}, Lyy4;-><init>(Lg7b;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lg7b;->q:Ljava/util/ArrayList;

    invoke-virtual {p2, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    new-instance p2, Lf7b;

    invoke-direct {p2, p0, p3}, Lf7b;-><init>(Lg7b;Lb7f;)V

    iput-object p2, p0, Lg7b;->p:Lf7b;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    new-instance p2, Landroid/widget/LinearLayout;

    invoke-direct {p2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lg7b;->s:Landroid/widget/LinearLayout;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p3, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Ljava/util/ArrayDeque;

    invoke-direct {p2}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p2, p0, Lg7b;->r:Ljava/util/ArrayDeque;

    iput-object p1, p0, Lg7b;->o:Lt5d;

    new-instance p0, Landroid/widget/FrameLayout;

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 12

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    move p1, v0

    goto :goto_8

    :cond_5
    iget p1, p0, Lg7b;->j:I

    int-to-float p1, p1

    :goto_8
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v2, p0, Lg7b;->j:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x437a0000    # 250.0f

    mul-float/2addr v1, v2

    float-to-long v1, v1

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v3

    const/4 v4, 0x2

    new-array v5, v4, [F

    const/4 v6, 0x0

    aput v3, v5, v6

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    aput v3, v5, v7

    const-string v3, "alpha"

    invoke-static {v3, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    filled-new-array {v3}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    invoke-static {p0, v3}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v5

    new-array v8, v4, [F

    aput v5, v8, v6

    aput v0, v8, v7

    const-string v0, "translationX"

    invoke-static {v0, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v5

    new-array v8, v4, [F

    aput v5, v8, v6

    aput p1, v8, v7

    const-string p1, "translationY"

    invoke-static {p1, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    filled-new-array {p1}, [Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v5, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    const-wide/16 v8, 0x0

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-virtual {v5, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v1, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/animation/Animator;

    aput-object v3, v2, v6

    aput-object v0, v2, v7

    aput-object p1, v2, v4

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p1, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lg7b;->c:Lkc;

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lg7b;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p0, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public final b(ZIIII)V
    .registers 9

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    move v0, v1

    :goto_a
    sget-object v2, Lxvb;->b:Lxvb;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_22

    invoke-static {v2}, Lj14;->o(Landroid/view/View;)I

    move-result v2

    if-lez v2, :cond_22

    if-eqz v0, :cond_2b

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2b

    :cond_22
    if-nez v0, :cond_2b

    iget-boolean v0, p0, Lg7b;->n:Z

    if-nez v0, :cond_2b

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2b
    :goto_2b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_33

    move v0, v1

    goto :goto_3d

    :cond_33
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_3d
    iget v2, p0, Lg7b;->g:I

    if-eq v2, v0, :cond_4c

    iput v0, p0, Lg7b;->g:I

    iput-byte v1, p0, Lg7b;->e:B

    iget-object v0, p0, Lg7b;->f:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    :cond_4c
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lg7b;->j:I

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_6a

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, p0, Lg7b;->j:I

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v2, v0

    add-int/2addr v2, v1

    iput v2, p0, Lg7b;->j:I

    :cond_6a
    invoke-super/range {p0 .. p5}, Landroid/widget/ScrollView;->onLayout(ZIIII)V

    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 10

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lg7b;->w:Landroid/graphics/Paint;

    if-nez v0, :cond_20

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lg7b;->w:Landroid/graphics/Paint;

    iget-object v1, p0, Lg7b;->o:Lt5d;

    const v2, 0x7f0601f5

    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x40000000    # 2.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_36

    const/4 v0, 0x1

    goto :goto_37

    :cond_36
    const/4 v0, 0x2

    :goto_37
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    int-to-float v4, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v5, v1

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    add-int/2addr v1, v0

    int-to-float v6, v1

    iget-object v7, p0, Lg7b;->w:Landroid/graphics/Paint;

    const/4 v3, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_4e
    return-void
.end method

.method public final gatherTransparentRegion(Landroid/graphics/Region;)Z
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setTranslationY(F)V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->gatherTransparentRegion(Landroid/graphics/Region;)Z

    move-result p1

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    return p1
.end method

.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-boolean v0, p0, Lg7b;->n:Z

    if-nez v0, :cond_20

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_22

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_20
    return-void

    nop

    :array_22
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onHoverEvent(Landroid/view/MotionEvent;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const/4 p0, 0x1

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-virtual/range {p0 .. p5}, Lg7b;->b(ZIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    iget-object p2, p0, Lg7b;->s:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    iget p3, p0, Lg7b;->u:I

    if-eq p3, p2, :cond_1a

    sub-int p3, p2, p1

    iget p4, p0, Lg7b;->v:I

    sub-int/2addr p3, p4

    const/4 p4, 0x0

    invoke-virtual {p0, p4, p3}, Landroid/view/View;->scrollTo(II)V

    :cond_1a
    iput p1, p0, Lg7b;->t:I

    iput p2, p0, Lg7b;->u:I

    sub-int/2addr p2, p1

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result p1

    sub-int/2addr p2, p1

    iput p2, p0, Lg7b;->v:I

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    iget-object p1, p0, Lg7b;->s:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    if-le p1, p2, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    invoke-virtual {p0}, Landroid/view/View;->isVerticalScrollBarEnabled()Z

    move-result p2

    if-eq p1, p2, :cond_1b

    invoke-virtual {p0, p1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    :cond_1b
    return-void
.end method

.method public final onScrollChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onScrollChanged(IIII)V

    iget p1, p0, Lg7b;->u:I

    iget p2, p0, Lg7b;->t:I

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lg7b;->v:I

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 p0, 0x1

    return p0
.end method
