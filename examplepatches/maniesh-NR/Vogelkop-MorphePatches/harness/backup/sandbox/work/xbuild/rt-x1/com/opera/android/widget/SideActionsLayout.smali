.class public Lcom/opera/android/widget/SideActionsLayout;
.super Lq2c;
.source "SourceFile"


# instance fields
.field public final c:Lyqa;

.field public d:Lmij;

.field public e:Lmij;

.field public f:Lmij;

.field public g:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ll2c;

    invoke-direct {v0, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lq2c;->a:Ll2c;

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lq2c;->b:Lfr;

    if-eqz p1, :cond_15

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_15
    new-instance p1, Lyqa;

    const/16 p2, 0x16

    invoke-direct {p1, p2}, Lyqa;-><init>(B)V

    iput-object p1, p0, Lcom/opera/android/widget/SideActionsLayout;->c:Lyqa;

    return-void
.end method


# virtual methods
.method public final e()I
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    invoke-virtual {v0}, Lmij;->c()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lmij;->c()I

    move-result v1

    add-int/2addr v0, v1

    :cond_f
    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    sget v2, Lmij;->e:I

    invoke-virtual {v1}, Lmij;->b()F

    move-result v1

    iget-object p0, p0, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz p0, :cond_26

    invoke-virtual {p0}, Lmij;->b()F

    move-result p0

    add-float/2addr p0, v1

    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    move-result v1

    :cond_26
    sub-float/2addr v2, v1

    const/4 p0, 0x0

    mul-float/2addr v2, p0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final f(Lmij;IIIZ)V
    .registers 11

    iget-object v0, p1, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    if-eq p1, v0, :cond_15

    iget-object p0, p0, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    if-eq p1, p0, :cond_15

    const/4 p0, 0x0

    goto :goto_16

    :cond_15
    const/4 p0, 0x1

    :goto_16
    iget-object v0, p1, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p1}, Lmij;->c()I

    move-result v1

    iget-object v2, p1, Lmij;->a:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iget-object v3, p1, Lmij;->a:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p1, Lmij;->a:Landroid/view/View;

    if-ne p5, p0, :cond_3e

    add-int/2addr p2, v1

    sub-int/2addr p2, v2

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr p2, p0

    goto :goto_49

    :cond_3e
    sub-int/2addr p4, v1

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int p2, p4, p0

    :goto_49
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p3, p0

    iget-object p0, p1, Lmij;->a:Landroid/view/View;

    add-int/2addr v2, p2

    add-int/2addr v3, p3

    invoke-virtual {p0, p2, p3, v2, v3}, Landroid/view/View;->layout(IIII)V

    return-void
.end method

.method public final forceLayout()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->forceLayout()V

    iget-object p0, p0, Lcom/opera/android/widget/SideActionsLayout;->c:Lyqa;

    if-eqz p0, :cond_10

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Point;

    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0, v0}, Landroid/graphics/Point;->set(II)V

    :cond_10
    return-void
.end method

.method public final g(Lmij;II)V
    .registers 12

    iget-object v0, p1, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_b

    return-void

    :cond_b
    iget-object v3, p1, Lmij;->a:Landroid/view/View;

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move v4, p2

    move v6, p3

    invoke-virtual/range {v2 .. v7}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    return-void
.end method

.method public final h(ZZ)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p0

    if-eqz p0, :cond_f

    if-eqz p2, :cond_f

    const/4 p0, 0x0

    invoke-virtual {v0, p1, p0}, Lmij;->a(ZZ)V

    return-void

    :cond_f
    const/4 p0, 0x1

    invoke-virtual {v0, p1, p0}, Lmij;->a(ZZ)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 7

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-eq v0, v4, :cond_35

    const/4 v5, 0x4

    if-ne v0, v5, :cond_51

    new-instance v0, Lmij;

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, v3}, Lmij;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    new-instance v0, Lmij;

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v2}, Lmij;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    new-instance v0, Lmij;

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lmij;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    goto :goto_51

    :cond_35
    new-instance v0, Lmij;

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, v3}, Lmij;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    new-instance v0, Lmij;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lmij;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    :cond_51
    :goto_51
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 15

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p1

    sub-int v4, p4, p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    sub-int/2addr p5, p1

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_20

    invoke-virtual {p0}, Lcom/opera/android/widget/SideActionsLayout;->e()I

    move-result p1

    goto :goto_38

    :cond_20
    iget-object p1, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    invoke-virtual {p1}, Lmij;->c()I

    move-result p1

    iget-object p2, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    sget p3, Lmij;->e:I

    invoke-virtual {p2}, Lmij;->b()F

    move-result p2

    const/high16 p3, 0x3f800000    # 1.0f

    sub-float/2addr p3, p2

    const/4 p2, 0x0

    mul-float/2addr p3, p2

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p2

    add-int/2addr p1, p2

    :goto_38
    iget-object p2, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object p3, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    iget-object p4, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result p4

    add-int/2addr p1, v2

    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, v0

    sub-int/2addr p5, v6

    sub-int/2addr p5, p4

    div-int/lit8 p5, p5, 0x2

    add-int/2addr p5, v6

    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p5, p2

    iget-object p2, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    add-int/2addr p3, p1

    add-int/2addr p4, p5

    invoke-virtual {p2, p1, p5, p3, p4}, Landroid/view/View;->layout(IIII)V

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    xor-int/lit8 v8, p1, 0x1

    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    move-object v0, p0

    move v3, v6

    move v5, v8

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/widget/SideActionsLayout;->f(Lmij;IIIZ)V

    move-object v3, v0

    iget-object p0, v3, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    if-eqz p0, :cond_98

    iget-object p0, v3, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    iget-object p0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    const/16 p2, 0x8

    if-eq p0, p2, :cond_88

    iget-object p0, v3, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    if-nez p1, :cond_8b

    iget-object p0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v2

    :cond_88
    :goto_88
    move v5, v2

    move v7, v4

    goto :goto_92

    :cond_8b
    iget-object p0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v4

    goto :goto_88

    :goto_92
    iget-object v4, v3, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    invoke-virtual/range {v3 .. v8}, Lcom/opera/android/widget/SideActionsLayout;->f(Lmij;IIIZ)V

    goto :goto_9a

    :cond_98
    move v5, v2

    move v7, v4

    :goto_9a
    iget-object v4, v3, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    invoke-virtual/range {v3 .. v8}, Lcom/opera/android/widget/SideActionsLayout;->f(Lmij;IIIZ)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 15

    iget-object v0, p0, Lcom/opera/android/widget/SideActionsLayout;->c:Lyqa;

    iget-object v1, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Point;

    iget-object v2, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Point;

    iget v3, v1, Landroid/graphics/Point;->x:I

    if-ne p1, v3, :cond_14

    iget v1, v1, Landroid/graphics/Point;->y:I

    if-ne p2, v1, :cond_14

    move-object v1, v2

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    if-eqz v1, :cond_1f

    iget p1, v1, Landroid/graphics/Point;->x:I

    iget p2, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_1f
    invoke-virtual {p0}, Lq2c;->d()V

    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->d:Lmij;

    invoke-virtual {p0, v1, p1, p2}, Lcom/opera/android/widget/SideActionsLayout;->g(Lmij;II)V

    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->e:Lmij;

    if-eqz v1, :cond_2e

    invoke-virtual {p0, v1, p1, p2}, Lcom/opera/android/widget/SideActionsLayout;->g(Lmij;II)V

    :cond_2e
    iget-object v1, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    invoke-virtual {p0, v1, p1, p2}, Lcom/opera/android/widget/SideActionsLayout;->g(Lmij;II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/opera/android/widget/SideActionsLayout;->e()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    invoke-virtual {v4}, Lmij;->c()I

    move-result v4

    iget-object v5, p0, Lcom/opera/android/widget/SideActionsLayout;->f:Lmij;

    sget v6, Lmij;->e:I

    invoke-virtual {v5}, Lmij;->b()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v6, v5

    const/4 v5, 0x0

    mul-float/2addr v6, v5

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v5

    add-int/2addr v5, v4

    add-int v9, v5, v3

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    iget-object v7, p0, Lcom/opera/android/widget/SideActionsLayout;->g:Landroid/view/View;

    const/4 v11, 0x0

    move-object v6, p0

    move v10, p2

    invoke-virtual/range {v6 .. v11}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    invoke-static {v10}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p0

    if-nez p0, :cond_97

    const/4 p0, 0x0

    move p2, p0

    :goto_6b
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge p0, v3, :cond_8c

    invoke-virtual {v6, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v3, v5

    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, v4

    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result p2

    add-int/lit8 p0, p0, 0x1

    goto :goto_6b

    :cond_8c
    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result p0

    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    add-int/2addr v3, p0

    add-int/2addr v3, p2

    goto :goto_9b

    :cond_97
    invoke-static {v10}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    :goto_9b
    invoke-virtual {v6, v1, v3}, Landroid/view/View;->setMeasuredDimension(II)V

    iget-object p0, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Point;

    invoke-virtual {p0, p1, v10}, Landroid/graphics/Point;->set(II)V

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Point;->set(II)V

    return-void
.end method

.method public final requestLayout()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    iget-object p0, p0, Lcom/opera/android/widget/SideActionsLayout;->c:Lyqa;

    if-eqz p0, :cond_10

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Point;

    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0, v0}, Landroid/graphics/Point;->set(II)V

    :cond_10
    return-void
.end method
