.class public Lcom/opera/android/startpage/common/SnappingRecyclerView;
.super Lcom/opera/android/theme/ThemeableRecyclerView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/theme/ThemeableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final O(II)Z
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    const/4 v1, 0x0

    if-eqz v0, :cond_9c

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->isLayoutSuppressed()Z

    move-result v0

    if-nez v0, :cond_9c

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v2, v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_9d

    if-eqz v0, :cond_9d

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    if-ge v0, v2, :cond_22

    move p1, v1

    :cond_22
    if-eqz p1, :cond_9c

    int-to-float v0, p1

    int-to-float v2, p2

    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedPreFling(FF)Z

    move-result v3

    if-nez v3, :cond_9c

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedFling(FFZ)Z

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v2

    if-nez v2, :cond_3d

    if-lez p1, :cond_44

    goto :goto_3f

    :cond_3d
    if-gez p1, :cond_44

    :goto_3f
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    goto :goto_48

    :cond_44
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    :goto_48
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v2

    if-le v2, v3, :cond_9c

    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->N(IZ)Landroidx/recyclerview/widget/i;

    move-result-object v2

    if-eqz v2, :cond_69

    iget-object v2, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    if-ge v2, v4, :cond_69

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->O(II)Z

    move-result p0

    return p0

    :cond_69
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p1

    sub-int/2addr p1, v3

    invoke-static {v0, v1, p1}, Lcs5;->t(III)I

    move-result p1

    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz p2, :cond_9b

    instance-of v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v0, :cond_9b

    invoke-virtual {p2}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_9b

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/f;->findViewByPosition(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_9b

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    sub-int/2addr v0, p1

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-virtual {p0, p2, v1, v1}, Landroidx/recyclerview/widget/RecyclerView;->G0(IIZ)V

    :cond_9b
    return v3

    :cond_9c
    return v1

    :cond_9d
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->O(II)Z

    move-result p0

    return p0
.end method

.method public final canScrollHorizontally(I)Z
    .registers 3

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-super {p0, p1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method
