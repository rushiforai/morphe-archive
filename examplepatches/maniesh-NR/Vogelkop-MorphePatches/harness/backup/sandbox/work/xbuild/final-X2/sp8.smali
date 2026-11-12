.class public final Lsp8;
.super Lqtj;
.source "SourceFile"


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;


# virtual methods
.method public final attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    iput-object p1, p0, Lsp8;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-super {p0, p1}, Lqtj;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final createScroller(Landroidx/recyclerview/widget/f;)Luph;
    .registers 4

    instance-of v0, p1, Ltph;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lsp8;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_a

    :cond_8
    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lrp8;

    invoke-direct {v1, p0, p1, v0}, Lrp8;-><init>(Lsp8;Landroidx/recyclerview/widget/f;Landroid/content/Context;)V

    return-object v1
.end method

.method public final findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;
    .registers 8

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_2b

    instance-of v1, p1, Lcom/google/android/material/carousel/CarouselLayoutManager;

    if-eqz v1, :cond_2b

    move-object v1, p1

    check-cast v1, Lcom/google/android/material/carousel/CarouselLayoutManager;

    const/4 v2, 0x0

    const v3, 0x7fffffff

    :goto_12
    if-ge v2, p0, :cond_2b

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/google/android/material/carousel/CarouselLayoutManager;->y(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v3, :cond_28

    move-object v0, v4

    move v3, v5

    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_2b
    return-object v0
.end method

.method public final findTargetSnapPosition(Landroidx/recyclerview/widget/f;II)I
    .registers 15

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result p0

    const/4 v0, -0x1

    if-eqz p0, :cond_87

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, -0x80000000

    const v5, 0x7fffffff

    move v7, v3

    move v6, v5

    move v5, v4

    move-object v4, v2

    :goto_16
    if-ge v7, v1, :cond_38

    invoke-virtual {p1, v7}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_35

    move-object v9, p1

    check-cast v9, Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v9, v8}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/google/android/material/carousel/CarouselLayoutManager;->y(I)I

    move-result v9

    if-gtz v9, :cond_2f

    if-le v9, v5, :cond_2f

    move-object v4, v8

    move v5, v9

    :cond_2f
    if-ltz v9, :cond_35

    if-ge v9, v6, :cond_35

    move-object v2, v8

    move v6, v9

    :cond_35
    add-int/lit8 v7, v7, 0x1

    goto :goto_16

    :cond_38
    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v1

    const/4 v5, 0x1

    if-eqz v1, :cond_42

    if-lez p2, :cond_46

    goto :goto_44

    :cond_42
    if-lez p3, :cond_46

    :goto_44
    move p2, v5

    goto :goto_47

    :cond_46
    move p2, v3

    :goto_47
    if-eqz p2, :cond_52

    if-eqz v2, :cond_50

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result p0

    return p0

    :cond_50
    move-object v2, v4

    goto :goto_59

    :cond_52
    if-eqz v4, :cond_59

    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result p0

    return p0

    :cond_59
    :goto_59
    if-eqz v2, :cond_87

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result p3

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result v1

    instance-of v2, p1, Ltph;

    if-eqz v2, :cond_7e

    check-cast p1, Ltph;

    sub-int/2addr v1, v5

    invoke-interface {p1, v1}, Ltph;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p1

    if-eqz p1, :cond_7e

    iget v1, p1, Landroid/graphics/PointF;->x:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_7d

    iget p1, p1, Landroid/graphics/PointF;->y:F

    cmpg-float p1, p1, v2

    if-gez p1, :cond_7e

    :cond_7d
    move v3, v5

    :cond_7e
    if-ne v3, p2, :cond_81

    move v5, v0

    :cond_81
    add-int/2addr p3, v5

    if-ltz p3, :cond_87

    if-ge p3, p0, :cond_87

    return p3

    :cond_87
    return v0
.end method
