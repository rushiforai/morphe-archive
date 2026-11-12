.class public Lcom/opera/android/custom_views/AnchoringViewGroup;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public final a:[I

.field public final b:Landroid/graphics/Rect;

.field public final c:Landroid/graphics/Rect;

.field public final d:Lj21;

.field public e:Lbp;


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

    const/4 p1, 0x2

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->a:[I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->b:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->c:Landroid/graphics/Rect;

    new-instance p1, Lj21;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lj21;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->d:Lj21;

    return-void
.end method


# virtual methods
.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    instance-of v0, p1, Lk21;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    new-instance p0, Lk21;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Lk21;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v1, Lkhh;->b:[I

    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, v0, Lk21;->a:I

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 26
    instance-of p0, p1, Lk21;

    if-eqz p0, :cond_10

    new-instance p0, Lk21;

    check-cast p1, Lk21;

    .line 27
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    iget p1, p1, Lk21;->a:I

    iput p1, p0, Lk21;->a:I

    return-object p0

    .line 29
    :cond_10
    new-instance p0, Lk21;

    .line 30
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public final measureChild(Landroid/view/View;II)V
    .registers 11

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lk21;

    iget v1, v0, Lk21;->a:I

    if-lez v1, :cond_16

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    :cond_16
    iget-object v1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    if-eqz v1, :cond_56

    iget-object v1, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->c:Landroid/graphics/Rect;

    iget v2, v1, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->b:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v2, v4

    iget v4, v3, Landroid/graphics/Rect;->right:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, v1, Landroid/graphics/Rect;->top:I

    iget v6, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    sub-int/2addr v5, v6

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v3, v1

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    :cond_56
    const/high16 v1, -0x80000000

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    add-int/2addr v3, v2

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {p2, v3, v2}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p2

    invoke-static {p3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p0

    add-int/2addr p0, v1

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p3, p0, v0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p0

    invoke-virtual {p1, p2, p0}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    if-eqz v0, :cond_14

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/custom_views/AnchoringViewGroup;->d:Lj21;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_14
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    iget-object v2, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->a:[I

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->c:Landroid/graphics/Rect;

    if-eqz v1, :cond_41

    iget-object v1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v1, v2}, Landroid/view/View;->getLocationInWindow([I)V

    aget v6, v2, v4

    aget v7, v2, v3

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v8

    add-int/2addr v8, v6

    aget v9, v2, v3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v1, v9

    invoke-virtual {v5, v6, v7, v8, v1}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v1, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v1, Lbp;->a:I

    invoke-virtual {v5, v4, v1}, Landroid/graphics/Rect;->inset(II)V

    iget-object v1, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v5, v1, v4}, Landroid/graphics/Rect;->inset(II)V

    iget-object v1, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_41
    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationInWindow([I)V

    aget v1, v2, v4

    aget v6, v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v7, v1

    aget v2, v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v8, v2

    iget-object v2, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->b:Landroid/graphics/Rect;

    invoke-virtual {v2, v1, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    sub-int v1, p4, p2

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v1, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    sub-int v7, p5, p3

    invoke-static {v7, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v0, v1, v6}, Landroid/view/ViewGroup;->measureChildren(II)V

    move v1, v4

    :goto_6b
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v1, v6, :cond_14f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_14b

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    iget-object v7, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    if-nez v7, :cond_92

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {v6, v4, v4, v7, v8}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_14b

    :cond_92
    iget v7, v5, Landroid/graphics/Rect;->left:I

    iget v8, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v8

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, v2, Landroid/graphics/Rect;->right:I

    iget v9, v5, Landroid/graphics/Rect;->right:I

    sub-int/2addr v8, v9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    sub-int/2addr v8, v9

    iget v9, v5, Landroid/graphics/Rect;->top:I

    iget v10, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v10

    sub-int/2addr v9, v10

    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    iget v11, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v11

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v11

    sub-int/2addr v10, v11

    iget-object v11, v0, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v12

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v13

    const/4 v14, 0x3

    if-ge v12, v13, :cond_c9

    const/4 v12, 0x5

    goto :goto_ca

    :cond_c9
    move v12, v14

    :goto_ca
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v13

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v15

    const/16 v3, 0x30

    if-ge v13, v15, :cond_d9

    const/16 v13, 0x50

    goto :goto_da

    :cond_d9
    move v13, v3

    :goto_da
    or-int/2addr v12, v13

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v11, v11, Lbp;->b:Ljava/lang/Object;

    check-cast v11, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v11}, Landroid/view/View;->getLayoutDirection()I

    move-result v11

    invoke-static {v12, v11}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v11

    and-int/lit8 v12, v11, 0x7

    if-eqz v12, :cond_f0

    if-ne v12, v14, :cond_f6

    :cond_f0
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    if-ge v7, v13, :cond_102

    :cond_f6
    if-eqz v12, :cond_100

    if-eq v12, v14, :cond_100

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v12

    if-ge v8, v12, :cond_104

    :cond_100
    if-le v7, v8, :cond_104

    :cond_102
    const/4 v7, 0x1

    goto :goto_105

    :cond_104
    move v7, v4

    :goto_105
    and-int/lit8 v11, v11, 0x70

    if-eqz v11, :cond_10b

    if-ne v11, v3, :cond_111

    :cond_10b
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    if-ge v9, v8, :cond_11d

    :cond_111
    if-eqz v11, :cond_11b

    if-eq v11, v3, :cond_11b

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    if-ge v10, v3, :cond_11f

    :cond_11b
    if-le v9, v10, :cond_11f

    :cond_11d
    const/4 v3, 0x1

    goto :goto_120

    :cond_11f
    move v3, v4

    :goto_120
    if-eqz v7, :cond_12a

    iget v7, v5, Landroid/graphics/Rect;->left:I

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    sub-int/2addr v7, v8

    goto :goto_12c

    :cond_12a
    iget v7, v5, Landroid/graphics/Rect;->right:I

    :goto_12c
    if-eqz v3, :cond_136

    iget v3, v5, Landroid/graphics/Rect;->top:I

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    sub-int/2addr v3, v8

    goto :goto_138

    :cond_136
    iget v3, v5, Landroid/graphics/Rect;->bottom:I

    :goto_138
    iget v8, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v8

    iget v8, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v8

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v7

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int/2addr v9, v3

    invoke-virtual {v6, v7, v3, v8, v9}, Landroid/view/View;->layout(IIII)V

    :cond_14b
    :goto_14b
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_6b

    :cond_14f
    return-void
.end method
