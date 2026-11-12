.class public Lcom/opera/android/custom_views/FadingRecyclerView;
.super Lcom/opera/android/custom_views/RecyclerViewForScreenshot;
.source "SourceFile"

# interfaces
.implements La6n;
.implements Lnij;


# static fields
.field public static final synthetic V0:I


# instance fields
.field public final I0:Lz5n;

.field public final J0:Luuj;

.field public K0:I

.field public L0:F

.field public final M0:Landroid/graphics/Paint;

.field public N0:Lm9f;

.field public O0:Lg00;

.field public final P0:Z

.field public final Q0:Z

.field public R0:Z

.field public S0:Z

.field public T0:Z

.field public U0:Lw3a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/theme/ThemeableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    iput-object v1, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->G0:Landroidx/recyclerview/widget/e;

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->K0:I

    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->M0:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0707ed

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    shl-int/2addr v3, v2

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lf03;->D(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v1, Lpc5;

    const/16 v3, 0xb

    invoke-direct {v1, p0, v3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_50

    invoke-static {v3, p0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_50
    new-instance v1, Lz5n;

    invoke-direct {v1, p0, p1, p2}, Lz5n;-><init>(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    sget-object v1, Lkhh;->U:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_5d
    invoke-virtual {v1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-nez v3, :cond_6f

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3
    :try_end_69
    .catchall {:try_start_5d .. :try_end_69} :catchall_c1

    if-nez v3, :cond_6f

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_90

    :cond_6f
    const/high16 v3, -0x1000000

    :try_start_71
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    new-instance v6, Luuj;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object p0, v6, Luuj;->b:Ljava/lang/Object;

    iput v4, v6, Luuj;->a:I

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, v6, Luuj;->c:Ljava/lang/Object;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V
    :try_end_8c
    .catchall {:try_start_71 .. :try_end_8c} :catchall_c1

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    move-object v4, v6

    :goto_90
    iput-object v4, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->J0:Luuj;

    sget-object v1, Lkhh;->m:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->P0:Z

    const/4 p2, 0x3

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    if-eqz p2, :cond_b9

    new-instance p2, Lm9f;

    invoke-direct {p2, p0}, Lm9f;-><init>(Landroid/view/ViewGroup;)V

    iput-object p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->Q0:Z

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    goto :goto_bd

    :cond_b9
    iput-boolean v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->Q0:Z

    iput-boolean v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    :goto_bd
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_c1
    move-exception p0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public static N0(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    add-int/2addr v2, v1

    div-int/lit8 v1, v0, 0x2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result p0

    new-instance v2, Landroid/graphics/Rect;

    add-int/2addr v0, v1

    const/4 v3, 0x0

    invoke-direct {v2, v1, p0, v0, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v2
.end method


# virtual methods
.method public final a(Lg00;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->O0:Lg00;

    return-void
.end method

.method public final c()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iput-boolean v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->U0:Lw3a;

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->U0:Lw3a;

    invoke-virtual {p0, p1}, Lw3a;->draw(Landroid/graphics/Canvas;)V

    :cond_18
    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 26

    move-object/from16 v2, p0

    invoke-super/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->draw(Landroid/graphics/Canvas;)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-object v0, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->J0:Luuj;

    if-eqz v0, :cond_7e

    iget-object v1, v0, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    iget v6, v0, Luuj;->a:I

    div-int/lit8 v9, v6, 0x2

    rem-int/lit8 v6, v6, 0x2

    if-nez v6, :cond_25

    move v6, v9

    goto :goto_27

    :cond_25
    add-int/lit8 v6, v9, 0x1

    :goto_27
    move v10, v8

    :cond_28
    :goto_28
    if-ge v10, v3, :cond_7e

    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    if-ge v10, v3, :cond_37

    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    goto :goto_38

    :cond_37
    move-object v12, v7

    :goto_38
    const v13, 0x7f0a0ca2

    invoke-virtual {v11, v13}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_48

    check-cast v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    goto :goto_49

    :cond_48
    move v13, v8

    :goto_49
    if-eqz v13, :cond_28

    if-eqz v12, :cond_28

    const v13, 0x7f0a0ca3

    invoke-virtual {v12, v13}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_5d

    check-cast v12, Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    goto :goto_5e

    :cond_5d
    move v12, v8

    :goto_5e
    if-eqz v12, :cond_28

    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v11

    int-to-float v13, v4

    sub-int v12, v11, v9

    int-to-float v14, v12

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v12

    sub-int/2addr v12, v5

    int-to-float v15, v12

    add-int/2addr v11, v6

    int-to-float v11, v11

    iget-object v12, v0, Luuj;->c:Ljava/lang/Object;

    move-object/from16 v17, v12

    check-cast v17, Landroid/graphics/Paint;

    move-object/from16 v12, p1

    move/from16 v16, v11

    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_28

    :cond_7e
    invoke-virtual {v2}, Landroid/view/View;->getLeftFadingEdgeStrength()F

    move-result v3

    invoke-virtual {v2}, Lcom/opera/android/custom_views/FadingRecyclerView;->getTopFadingEdgeStrength()F

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getRightFadingEdgeStrength()F

    move-result v5

    invoke-virtual {v2}, Lcom/opera/android/custom_views/FadingRecyclerView;->getBottomFadingEdgeStrength()F

    move-result v6

    iget-object v0, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v6}, Lz5n;->a(Landroid/graphics/Canvas;Landroid/view/View;FFFF)V

    iget-boolean v0, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->P0:Z

    if-eqz v0, :cond_11d

    iget v0, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->L0:F

    iget v1, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->K0:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_11d

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lez v3, :cond_11d

    iget-object v3, v2, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/f;->findViewByPosition(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_11d

    const/4 v5, 0x0

    cmpl-float v5, v0, v5

    if-eqz v5, :cond_be

    if-lez v5, :cond_b8

    add-int/lit8 v1, v1, 0x1

    goto :goto_ba

    :cond_b8
    add-int/lit8 v1, v1, -0x1

    :goto_ba
    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/f;->findViewByPosition(I)Landroid/view/View;

    move-result-object v7

    :cond_be
    invoke-static {v4}, Lcom/opera/android/custom_views/FadingRecyclerView;->N0(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    if-nez v7, :cond_d8

    iget v3, v1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v4, v3

    iget v3, v1, Landroid/graphics/Rect;->top:I

    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v6

    add-int/2addr v6, v4

    invoke-direct {v5, v4, v3, v6, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_dc

    :cond_d8
    invoke-static {v7}, Lcom/opera/android/custom_views/FadingRecyclerView;->N0(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v5

    :goto_dc
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    invoke-static {v3, v4, v0}, Lcs5;->O(FFF)F

    move-result v3

    float-to-int v3, v3

    iget v4, v1, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    iget v6, v5, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    invoke-static {v4, v6, v0}, Lcs5;->O(FFF)F

    move-result v4

    float-to-int v4, v4

    div-int/lit8 v6, v3, 0x2

    sub-int/2addr v4, v6

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-static {v1, v5, v0}, Lcs5;->O(FFF)F

    move-result v0

    float-to-int v0, v0

    int-to-float v1, v4

    int-to-float v0, v0

    add-int/2addr v4, v3

    int-to-float v3, v4

    iget-object v2, v2, Lcom/opera/android/custom_views/FadingRecyclerView;->M0:Landroid/graphics/Paint;

    move/from16 v22, v0

    move-object/from16 v18, p1

    move/from16 v20, v0

    move/from16 v19, v1

    move-object/from16 v23, v2

    move/from16 v21, v3

    invoke-virtual/range {v18 .. v23}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_11d
    return-void
.end method

.method public final f()V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    iget-boolean v0, p0, Lz5n;->n:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    return-void

    :cond_8
    iput-boolean v1, p0, Lz5n;->n:Z

    iget-object p0, p0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final getBottomFadingEdgeStrength()F
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_9

    const/4 p0, 0x0

    return p0

    :cond_9
    invoke-super {p0}, Landroid/view/View;->getBottomFadingEdgeStrength()F

    move-result p0

    return p0
.end method

.method public final getHorizontalFadingEdgeLength()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    iget p0, p0, Lz5n;->f:I

    return p0
.end method

.method public final getTopFadingEdgeStrength()F
    .registers 2

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result v0

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    iget p0, p0, Lz5n;->f:I

    if-ge v0, p0, :cond_14

    int-to-float v0, v0

    int-to-float p0, p0

    div-float/2addr v0, p0

    return v0

    :cond_14
    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_17
    invoke-super {p0}, Landroid/view/View;->getTopFadingEdgeStrength()F

    move-result p0

    return p0
.end method

.method public final getVerticalFadingEdgeLength()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    iget p0, p0, Lz5n;->f:I

    return p0
.end method

.method public final h(Landroid/content/res/ColorStateList;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    iput-object p1, v0, Lz5n;->r:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->onAttachedToWindow()V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lm9f;->f()V

    :cond_a
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lm9f;->h()V

    :cond_a
    return-void
.end method

.method public onMeasure(II)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    iget-boolean v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->Q0:Z

    iget-object v2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->I0:Lz5n;

    const/4 v3, 0x0

    if-eqz v0, :cond_40

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    invoke-virtual {v0}, Lm9f;->e()I

    move-result v0

    const/4 v4, 0x1

    if-lez v0, :cond_1a

    move v5, v4

    goto :goto_1b

    :cond_1a
    move v5, v3

    :goto_1b
    iput-boolean v4, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->R0:Z

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {p0, v0, v6, v0, v7}, Landroid/view/View;->setPadding(IIII)V

    iput-boolean v3, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->R0:Z

    if-eqz v1, :cond_30

    if-lez v0, :cond_30

    move v1, v4

    goto :goto_31

    :cond_30
    move v1, v3

    :goto_31
    invoke-virtual {v2, v1}, Lz5n;->f(Z)V

    iget-boolean v1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    if-eqz v1, :cond_3b

    if-lez v0, :cond_3b

    move v3, v4

    :cond_3b
    invoke-virtual {v2, v3}, Lz5n;->e(Z)V

    move v3, v5

    goto :goto_4c

    :cond_40
    if-eqz v1, :cond_45

    invoke-virtual {v2, v3}, Lz5n;->f(Z)V

    :cond_45
    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->S0:Z

    if-eqz v0, :cond_4c

    invoke-virtual {v2, v3}, Lz5n;->e(Z)V

    :cond_4c
    :goto_4c
    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->onMeasure(II)V

    iget-boolean p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->T0:Z

    if-eq v3, p1, :cond_5c

    iput-boolean v3, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->T0:Z

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->O0:Lg00;

    if-eqz p0, :cond_5c

    invoke-virtual {p0, v3}, Lg00;->a(Z)V

    :cond_5c
    return-void
.end method

.method public final requestLayout()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->R0:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void
.end method
