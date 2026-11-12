.class public Lcom/google/android/material/chip/ChipGroup;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public d:I

.field public e:I

.field public final f:I

.field public g:Lvx4;

.field public final h:Lev4;

.field public final i:I

.field public final j:Lwx4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11

    const v0, 0x7f150871

    const v4, 0x7f0401b9

    invoke-static {p1, p2, v4, v0}, Lwxe;->g0(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, v4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/chip/ChipGroup;->c:Z

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    sget-object v1, Lihh;->q:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v7, 0x1

    invoke-virtual {p1, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/chip/ChipGroup;->a:I

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/chip/ChipGroup;->b:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Lev4;

    invoke-direct {p1, v0}, Lev4;-><init>(B)V

    iput-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    new-instance v1, Lwx4;

    invoke-direct {v1, p0, v0}, Lwx4;-><init>(Landroid/view/ViewGroup;B)V

    iput-object v1, p0, Lcom/google/android/material/chip/ChipGroup;->j:Lwx4;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f150871

    new-array v6, v0, [I

    sget-object v3, Lihh;->g:[I

    move-object v2, p2

    invoke-static/range {v1 .. v6}, Lscd;->a0(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iget v3, p0, Lcom/google/android/material/chip/ChipGroup;->e:I

    if-eq v3, v2, :cond_5c

    iput v2, p0, Lcom/google/android/material/chip/ChipGroup;->e:I

    iput v2, p0, Lcom/google/android/material/chip/ChipGroup;->b:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_5c
    const/4 v2, 0x3

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iget v2, p0, Lcom/google/android/material/chip/ChipGroup;->f:I

    if-eq v2, v1, :cond_6c

    iput v1, p0, Lcom/google/android/material/chip/ChipGroup;->f:I

    iput v1, p0, Lcom/google/android/material/chip/ChipGroup;->a:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_6c
    const/4 v1, 0x5

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/material/chip/ChipGroup;->c:Z

    const/4 v1, 0x6

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iget-boolean v2, p1, Lev4;->b:Z

    if-eq v2, v1, :cond_a7

    iput-boolean v1, p1, Lev4;->b:Z

    iget-object v1, p1, Lev4;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    iget-object v2, p1, Lev4;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_92
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1, v3, v0}, Lev4;->n(Lcom/google/android/material/chip/Chip;Z)Z

    goto :goto_92

    :cond_a2
    if-nez v1, :cond_a7

    invoke-virtual {p1}, Lev4;->h()V

    :cond_a7
    const/4 p1, 0x4

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iget-object v1, p0, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    iput-boolean p1, v1, Lev4;->c:Z

    const/4 p1, -0x1

    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/chip/ChipGroup;->i:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    new-instance p2, Ltw2;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v0}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lev4;->f:Ljava/lang/Object;

    iget-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->j:Lwx4;

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    return-void
.end method


# virtual methods
.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p0

    if-eqz p0, :cond_c

    instance-of p0, p1, Lux4;

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    new-instance p0, Lux4;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    new-instance v0, Lux4;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 10
    new-instance p0, Lux4;

    .line 11
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const/4 v0, -0x1

    iget v1, p0, Lcom/google/android/material/chip/ChipGroup;->i:I

    if-eq v1, v0, :cond_23

    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    iget-object v0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/chip/Chip;

    if-eqz v0, :cond_23

    invoke-virtual {p0, v0}, Lev4;->c(Lcom/google/android/material/chip/Chip;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lev4;->h()V

    :cond_23
    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    new-instance v0, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    invoke-direct {v0, p1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-boolean p1, p0, Lcom/google/android/material/chip/ChipGroup;->c:Z

    const/4 v1, 0x0

    if-eqz p1, :cond_2c

    move p1, v1

    move v2, p1

    :goto_f
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_2d

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Lcom/google/android/material/chip/Chip;

    if-eqz v3, :cond_29

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_29

    add-int/lit8 v2, v2, 0x1

    :cond_29
    add-int/lit8 p1, p1, 0x1

    goto :goto_f

    :cond_2c
    const/4 v2, -0x1

    :cond_2d
    iget p1, p0, Lcom/google/android/material/chip/ChipGroup;->d:I

    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    iget-boolean p0, p0, Lev4;->b:Z

    if-eqz p0, :cond_37

    const/4 p0, 0x1

    goto :goto_38

    :cond_37
    const/4 p0, 0x2

    :goto_38
    invoke-static {p1, v2, p0, v1}, Lu59;->M(IIIZ)Lu59;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->v(Lu59;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 22

    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_c

    iput v2, v0, Lcom/google/android/material/chip/ChipGroup;->d:I

    return-void

    :cond_c
    const/4 v1, 0x1

    iput v1, v0, Lcom/google/android/material/chip/ChipGroup;->d:I

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    if-ne v3, v1, :cond_17

    move v3, v1

    goto :goto_18

    :cond_17
    move v3, v2

    :goto_18
    if-eqz v3, :cond_23

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    goto :goto_2b

    :cond_23
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    :goto_2b
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    move v8, v2

    move v9, v4

    move v7, v6

    :goto_32
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v10

    if-ge v8, v10, :cond_be

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v11

    const/16 v12, 0x8

    const v13, 0x7f0a0910

    if-ne v11, v12, :cond_52

    const/4 v11, -0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v13, v11}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    move/from16 p1, v1

    goto :goto_b7

    :cond_52
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    instance-of v12, v11, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v12, :cond_65

    check-cast v11, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v11}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v12

    invoke-virtual {v11}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v11

    goto :goto_67

    :cond_65
    move v11, v2

    move v12, v11

    :goto_67
    add-int v14, v9, v12

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v15, v14

    sub-int v14, p4, p2

    move/from16 p1, v1

    sub-int v1, v14, v5

    iget-boolean v2, v0, Lcom/google/android/material/chip/ChipGroup;->c:Z

    if-nez v2, :cond_8d

    if-le v15, v1, :cond_8d

    add-int v1, v4, v12

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int v15, v2, v1

    iget v1, v0, Lcom/google/android/material/chip/ChipGroup;->a:I

    add-int v7, v6, v1

    iget v1, v0, Lcom/google/android/material/chip/ChipGroup;->d:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/material/chip/ChipGroup;->d:I

    move v9, v4

    :cond_8d
    iget v1, v0, Lcom/google/android/material/chip/ChipGroup;->d:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v13, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, v7

    if-eqz v3, :cond_a7

    sub-int v2, v14, v15

    sub-int/2addr v14, v9

    sub-int/2addr v14, v12

    invoke-virtual {v10, v2, v7, v14, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_ac

    :cond_a7
    add-int v2, v9, v12

    invoke-virtual {v10, v2, v7, v15, v1}, Landroid/view/View;->layout(IIII)V

    :goto_ac
    add-int/2addr v12, v11

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v12

    iget v6, v0, Lcom/google/android/material/chip/ChipGroup;->b:I

    add-int/2addr v2, v6

    add-int/2addr v9, v2

    move v6, v1

    :goto_b7
    add-int/lit8 v8, v8, 0x1

    move/from16 v1, p1

    const/4 v2, 0x0

    goto/16 :goto_32

    :cond_be
    return-void
.end method

.method public final onMeasure(II)V
    .registers 22

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    const/high16 v6, -0x80000000

    if-eq v2, v6, :cond_1e

    if-eq v2, v5, :cond_1e

    const v7, 0x7fffffff

    goto :goto_1f

    :cond_1e
    move v7, v1

    :goto_1f
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    sub-int/2addr v7, v10

    move v11, v9

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_2f
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v14

    if-ge v12, v14, :cond_9a

    invoke-virtual {v0, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    move-result v15

    const/16 v10, 0x8

    if-eq v15, v10, :cond_97

    move/from16 v10, p1

    move/from16 v15, p2

    invoke-virtual {v0, v14, v10, v15}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v6, :cond_57

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_59

    :cond_57
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_59
    add-int v16, v8, v6

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    move/from16 v18, v5

    add-int v5, v17, v16

    if-le v5, v7, :cond_71

    iget-boolean v5, v0, Lcom/google/android/material/chip/ChipGroup;->c:Z

    if-nez v5, :cond_71

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    iget v5, v0, Lcom/google/android/material/chip/ChipGroup;->a:I

    add-int v11, v9, v5

    :cond_71
    add-int v5, v8, v6

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    add-int/2addr v9, v5

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v11

    if-le v9, v13, :cond_80

    move v13, v9

    :cond_80
    add-int v6, v6, v18

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    add-int/2addr v9, v6

    iget v6, v0, Lcom/google/android/material/chip/ChipGroup;->b:I

    add-int/2addr v9, v6

    add-int/2addr v9, v8

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne v12, v6, :cond_95

    add-int v13, v13, v18

    :cond_95
    move v8, v9

    move v9, v5

    :cond_97
    add-int/lit8 v12, v12, 0x1

    goto :goto_2f

    :cond_9a
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    add-int/2addr v5, v13

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    add-int/2addr v6, v9

    const/high16 v7, -0x80000000

    const/high16 v8, 0x40000000    # 2.0f

    if-eq v2, v7, :cond_ae

    if-eq v2, v8, :cond_b2

    move v1, v5

    goto :goto_b2

    :cond_ae
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    :cond_b2
    :goto_b2
    if-eq v4, v7, :cond_b8

    if-eq v4, v8, :cond_bc

    move v3, v6

    goto :goto_bc

    :cond_b8
    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_bc
    :goto_bc
    invoke-virtual {v0, v1, v3}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .registers 2

    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup;->j:Lwx4;

    iput-object p1, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method
