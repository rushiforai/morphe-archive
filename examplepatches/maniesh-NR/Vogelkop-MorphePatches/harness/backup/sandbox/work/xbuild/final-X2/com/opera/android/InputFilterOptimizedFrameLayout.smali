.class public Lcom/opera/android/InputFilterOptimizedFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/util/ArrayList;


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

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x7fffffff

    iput p1, p0, Lcom/opera/android/InputFilterOptimizedFrameLayout;->a:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/InputFilterOptimizedFrameLayout;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-static {p1}, Lcom/opera/android/InputFilterFrameLayout;->d(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-static {p0, p0, v0, p1}, Lfan;->b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-static {p0, p0, v0, v1}, Lfan;->b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    invoke-super {p0, p1}, Landroid/view/View;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onMeasure(II)V
    .registers 25

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    iget v3, v0, Lcom/opera/android/InputFilterOptimizedFrameLayout;->a:I

    if-le v2, v3, :cond_15

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    goto :goto_17

    :cond_15
    move/from16 v2, p2

    :goto_17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    const/high16 v6, 0x40000000    # 2.0f

    if-ne v4, v6, :cond_2b

    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    if-ne v4, v6, :cond_2b

    const/4 v4, 0x0

    goto :goto_2c

    :cond_2b
    const/4 v4, 0x1

    :goto_2c
    iget-object v8, v0, Lcom/opera/android/InputFilterOptimizedFrameLayout;->b:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v11

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v12

    const/4 v6, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_45
    if-ge v13, v3, :cond_e6

    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasureAllChildren()Z

    move-result v17

    if-nez v17, :cond_61

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v7

    move/from16 v18, v3

    const/16 v3, 0x8

    if-ne v7, v3, :cond_63

    move/from16 v19, v4

    move/from16 v20, v9

    goto/16 :goto_dc

    :cond_61
    move/from16 v18, v3

    :cond_63
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    add-int v7, v9, v10

    move/from16 v19, v4

    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v7, v4

    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int/2addr v7, v4

    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-static {v1, v7, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v4

    add-int v7, v11, v12

    move/from16 v20, v7

    iget v7, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int v7, v20, v7

    move/from16 v20, v7

    iget v7, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int v7, v20, v7

    move/from16 v20, v9

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    invoke-static {v2, v7, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v7

    invoke-virtual {v5, v4, v7}, Landroid/view/View;->measure(II)V

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    move/from16 v21, v9

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int v9, v21, v9

    move/from16 v21, v9

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int v9, v21, v9

    invoke-static {v14, v9}, Ljava/lang/Math;->max(II)I

    move-result v14

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    move/from16 v21, v9

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int v9, v21, v9

    move/from16 v21, v9

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int v9, v21, v9

    invoke-static {v15, v9}, Ljava/lang/Math;->max(II)I

    move-result v15

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredState()I

    move-result v9

    invoke-static {v6, v9}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v6

    if-eqz v19, :cond_d8

    iget v9, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    move/from16 v21, v6

    const/4 v6, -0x1

    if-eq v9, v6, :cond_cf

    iget v3, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    if-ne v3, v6, :cond_da

    :cond_cf
    new-instance v3, Ljrf;

    invoke-direct {v3, v5, v4, v7}, Ljrf;-><init>(Landroid/view/View;II)V

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_da

    :cond_d8
    move/from16 v21, v6

    :cond_da
    :goto_da
    move/from16 v6, v21

    :goto_dc
    add-int/lit8 v13, v13, 0x1

    move/from16 v3, v18

    move/from16 v4, v19

    move/from16 v9, v20

    goto/16 :goto_45

    :cond_e6
    move/from16 v20, v9

    add-int v9, v20, v10

    add-int/2addr v14, v9

    add-int v3, v11, v12

    add-int/2addr v15, v3

    invoke-virtual {v0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    move-result v4

    invoke-static {v15, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    move-result v5

    invoke-static {v14, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v7, :cond_114

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v13

    invoke-static {v4, v13}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    :cond_114
    invoke-static {v5, v1, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v5

    shl-int/lit8 v6, v6, 0x10

    invoke-static {v4, v2, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v4

    invoke-virtual {v0, v5, v4}, Landroid/view/View;->setMeasuredDimension(II)V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_198

    const/4 v5, 0x0

    :goto_129
    if-ge v5, v4, :cond_198

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljrf;

    iget-object v7, v6, Ljrf;->a:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v15, -0x1

    if-ne v14, v15, :cond_157

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v14, v14, v20

    sub-int/2addr v14, v10

    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v14, v15

    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v14, v15

    const/4 v15, 0x0

    invoke-static {v15, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    const/high16 v15, 0x40000000    # 2.0f

    invoke-static {v14, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    goto :goto_161

    :cond_157
    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v15, v9

    iget v0, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v15, v0

    invoke-static {v1, v15, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v14

    :goto_161
    iget v0, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v15, -0x1

    if-ne v0, v15, :cond_17e

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr v0, v11

    sub-int/2addr v0, v12

    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v0, v15

    iget v13, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v0, v13

    const/4 v15, 0x0

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v13, 0x40000000    # 2.0f

    invoke-static {v0, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    goto :goto_188

    :cond_17e
    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v15, v3

    iget v13, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v15, v13

    invoke-static {v2, v15, v0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    :goto_188
    iget v13, v6, Ljrf;->b:I

    if-ne v13, v14, :cond_190

    iget v6, v6, Ljrf;->c:I

    if-eq v6, v0, :cond_193

    :cond_190
    invoke-virtual {v7, v14, v0}, Landroid/view/View;->measure(II)V

    :cond_193
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    goto :goto_129

    :cond_198
    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/view/View;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object p2

    if-nez p2, :cond_21

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-static {p0, p0, v0, p1}, Lfan;->b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/16 p1, 0x3e8

    invoke-static {p0, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p0

    return-object p0

    :cond_21
    return-object p2
.end method
