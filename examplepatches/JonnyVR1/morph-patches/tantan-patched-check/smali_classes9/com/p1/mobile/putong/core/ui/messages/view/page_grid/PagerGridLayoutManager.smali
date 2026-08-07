.class public Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$z$b;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Z

.field public p:Landroidx/recyclerview/widget/RecyclerView;

.field public q:I

.field public r:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView$v;Landroid/graphics/Rect;I)V
    .locals 6

    .line 1
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c(I)Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p2, p3}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j:I

    .line 23
    .line 24
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k:I

    .line 25
    .line 26
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 34
    .line 35
    iget p2, p3, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 38
    .line 39
    sub-int/2addr p2, v0

    .line 40
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 41
    .line 42
    add-int/2addr p2, v0

    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int v2, p2, v0

    .line 48
    .line 49
    iget p2, p3, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 52
    .line 53
    sub-int/2addr p2, v0

    .line 54
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 55
    .line 56
    add-int/2addr p2, v0

    .line 57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int v3, p2, v0

    .line 62
    .line 63
    iget p2, p3, Landroid/graphics/Rect;->right:I

    .line 64
    .line 65
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 66
    .line 67
    sub-int/2addr p2, v0

    .line 68
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 69
    .line 70
    sub-int/2addr p2, v0

    .line 71
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int v4, p2, v0

    .line 76
    .line 77
    iget p2, p3, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 80
    .line 81
    sub-int/2addr p2, p3

    .line 82
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 83
    .line 84
    sub-int/2addr p2, p1

    .line 85
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    add-int v5, p2, p1

    .line 90
    .line 91
    move-object v0, p0

    .line 92
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final c(I)Landroid/graphics/Rect;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->g:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/graphics/Rect;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 17
    .line 18
    div-int v1, p1, v1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->canScrollHorizontally()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    mul-int/2addr v2, v1

    .line 32
    move v6, v3

    .line 33
    move v3, v2

    .line 34
    move v2, v6

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    mul-int/2addr v2, v1

    .line 41
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 42
    .line 43
    rem-int v1, p1, v1

    .line 44
    .line 45
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e:I

    .line 46
    .line 47
    div-int v5, v1, v4

    .line 48
    .line 49
    mul-int/2addr v4, v5

    .line 50
    sub-int/2addr v1, v4

    .line 51
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 52
    .line 53
    mul-int/2addr v1, v4

    .line 54
    add-int/2addr v3, v1

    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 56
    .line 57
    mul-int/2addr v5, v1

    .line 58
    add-int/2addr v2, v5

    .line 59
    iput v3, v0, Landroid/graphics/Rect;->left:I

    .line 60
    .line 61
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 62
    .line 63
    add-int/2addr v3, v4

    .line 64
    iput v3, v0, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    add-int/2addr v2, v1

    .line 67
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->g:Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-object v0
.end method

.method public canScrollHorizontally()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public canScrollVertically()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->a:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h(I)[I

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    aget p1, p0, p1

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    aget p0, p0, p1

    .line 18
    .line 19
    int-to-float p0, p0

    .line 20
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 21
    .line 22
    return-object v0
.end method

.method public final e()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->canScrollVertically()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 13
    .line 14
    if-lez p0, :cond_3

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    div-int v1, p0, v0

    .line 20
    .line 21
    rem-int/2addr p0, v0

    .line 22
    div-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    if-le p0, v0, :cond_3

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 32
    .line 33
    if-lez p0, :cond_3

    .line 34
    .line 35
    if-gtz v0, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    div-int v1, p0, v0

    .line 39
    .line 40
    rem-int/2addr p0, v0

    .line 41
    div-int/lit8 v0, v0, 0x2

    .line 42
    .line 43
    if-le p0, v0, :cond_3

    .line 44
    .line 45
    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    :cond_3
    :goto_1
    return v1
.end method

.method public final f(I)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 2
    .line 3
    div-int/2addr p1, p0

    .line 4
    return p1
.end method

.method public final g(I)[I
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->canScrollHorizontally()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    mul-int/2addr p1, p0

    .line 21
    aput p1, v0, v3

    .line 22
    .line 23
    aput v3, v0, v2

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    aput v3, v0, v3

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    mul-int/2addr p1, p0

    .line 33
    aput p1, v0, v2

    .line 34
    .line 35
    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$p;
    .locals 1

    .line 1
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public h(I)[I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->g(I)[I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    aget v0, p1, v0

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 9
    .line 10
    sub-int/2addr v0, v1

    .line 11
    const/4 v1, 0x1

    .line 12
    aget p1, p1, v1

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 15
    .line 16
    sub-int/2addr p1, p0

    .line 17
    filled-new-array {v0, p1}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final i()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 14
    .line 15
    div-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 21
    .line 22
    rem-int/2addr v1, p0

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    :cond_1
    return v0
.end method

.method public final j()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingBottom()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public final k()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public final m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p2, Landroid/graphics/Rect;

    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 18
    .line 19
    sub-int/2addr v1, v2

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 25
    .line 26
    add-int/2addr v2, v3

    .line 27
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 28
    .line 29
    add-int/2addr v2, v3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 35
    .line 36
    add-int/2addr v3, v4

    .line 37
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 38
    .line 39
    add-int/2addr v3, v4

    .line 40
    invoke-direct {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->l:I

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m:I

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    add-int/2addr v1, v2

    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/Rect;->intersect(IIII)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 69
    .line 70
    mul-int/2addr v0, v1

    .line 71
    mul-int/lit8 v3, v1, 0x2

    .line 72
    .line 73
    sub-int/2addr v0, v3

    .line 74
    if-gez v0, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    move v2, v0

    .line 78
    :goto_0
    mul-int/lit8 v1, v1, 0x4

    .line 79
    .line 80
    add-int/2addr v1, v2

    .line 81
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-le v1, v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    :cond_2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 92
    .line 93
    .line 94
    if-eqz p3, :cond_3

    .line 95
    .line 96
    :goto_1
    if-ge v2, v1, :cond_4

    .line 97
    .line 98
    invoke-virtual {p0, p1, p2, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$v;Landroid/graphics/Rect;I)V

    .line 99
    .line 100
    .line 101
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 105
    .line 106
    :goto_2
    if-lt v1, v2, :cond_4

    .line 107
    .line 108
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$v;Landroid/graphics/Rect;I)V

    .line 109
    .line 110
    .line 111
    add-int/lit8 v1, v1, -0x1

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public n(I)V
    .locals 4

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->q:I

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->canScrollVertically()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    mul-int/2addr v0, p1

    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 26
    .line 27
    sub-int/2addr v0, v2

    .line 28
    move v2, v0

    .line 29
    move v0, v1

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    mul-int/2addr v0, p1

    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 37
    .line 38
    sub-int/2addr v0, v2

    .line 39
    move v2, v1

    .line 40
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {v3, v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_1
    return-void
.end method

.method public final o(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->q:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$v;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    return-void
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_a

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_4

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleAllViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->o(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->o(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 51
    .line 52
    div-int/2addr v0, v2

    .line 53
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 58
    .line 59
    rem-int/2addr v2, v3

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->canScrollHorizontally()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/4 v3, 0x1

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    sub-int/2addr v0, v3

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    mul-int/2addr v0, v2

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->l:I

    .line 78
    .line 79
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m:I

    .line 80
    .line 81
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 82
    .line 83
    if-le v2, v0, :cond_4

    .line 84
    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->l:I

    .line 89
    .line 90
    sub-int/2addr v0, v3

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    mul-int/2addr v0, v2

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m:I

    .line 97
    .line 98
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 99
    .line 100
    if-le v2, v0, :cond_4

    .line 101
    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 103
    .line 104
    :cond_4
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 105
    .line 106
    if-gtz v0, :cond_5

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e:I

    .line 113
    .line 114
    div-int/2addr v0, v2

    .line 115
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 116
    .line 117
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 118
    .line 119
    if-gtz v0, :cond_6

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->d:I

    .line 126
    .line 127
    div-int/2addr v0, v2

    .line 128
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 129
    .line 130
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->h:I

    .line 135
    .line 136
    sub-int/2addr v0, v2

    .line 137
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j:I

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j()I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i:I

    .line 144
    .line 145
    sub-int/2addr v0, v2

    .line 146
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k:I

    .line 147
    .line 148
    move v0, v1

    .line 149
    :goto_1
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 150
    .line 151
    mul-int/lit8 v2, v2, 0x2

    .line 152
    .line 153
    if-ge v0, v2, :cond_7

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c(I)Landroid/graphics/Rect;

    .line 156
    .line 157
    .line 158
    add-int/lit8 v0, v0, 0x1

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_7
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 162
    .line 163
    if-nez v0, :cond_9

    .line 164
    .line 165
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 166
    .line 167
    if-nez v0, :cond_9

    .line 168
    .line 169
    :goto_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 170
    .line 171
    if-ge v1, v0, :cond_9

    .line 172
    .line 173
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-lt v1, v0, :cond_8

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_8
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->j:I

    .line 188
    .line 189
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->k:I

    .line 190
    .line 191
    invoke-virtual {p0, v0, v2, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v1, v1, 0x1

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_9
    :goto_3
    invoke-virtual {p0, p1, p2, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V

    .line 198
    .line 199
    .line 200
    :cond_a
    :goto_4
    return-void
.end method

.method public onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->i()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->o(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onMeasure(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->onMeasure(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-static {p4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    invoke-static {p4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    const/high16 v0, 0x40000000    # 2.0f

    .line 21
    .line 22
    if-eq p2, v0, :cond_0

    .line 23
    .line 24
    if-lez p1, :cond_0

    .line 25
    .line 26
    move p2, v0

    .line 27
    :cond_0
    if-eq p4, v0, :cond_1

    .line 28
    .line 29
    if-lez p3, :cond_1

    .line 30
    .line 31
    move p4, v0

    .line 32
    :cond_1
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p3, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->setMeasuredDimension(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->n:I

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onScrollStateChanged(I)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final p(IZ)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->r:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->l()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->r:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    if-nez p2, :cond_2

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->r:I

    .line 18
    .line 19
    :cond_2
    :goto_0
    return-void
.end method

.method public q(I)V
    .locals 3

    .line 1
    if-ltz p1, :cond_4

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->q:I

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int v1, p1, v0

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x3

    .line 24
    if-le v1, v2, :cond_3

    .line 25
    .line 26
    if-le p1, v0, :cond_2

    .line 27
    .line 28
    add-int/lit8 v0, p1, -0x3

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->n(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    if-ge p1, v0, :cond_3

    .line 35
    .line 36
    add-int/lit8 v0, p1, 0x3

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->n(I)V

    .line 39
    .line 40
    .line 41
    :cond_3
    :goto_0
    new-instance v0, Ll/gf60;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ll/gf60;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f:I

    .line 49
    .line 50
    mul-int/2addr p1, v1

    .line 51
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$z;->setTargetPosition(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$z;)V

    .line 55
    .line 56
    .line 57
    :cond_4
    :goto_1
    return-void
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 2
    .line 3
    add-int v1, v0, p1

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->l:I

    .line 6
    .line 7
    if-le v1, v2, :cond_0

    .line 8
    .line 9
    sub-int p1, v2, v0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-gez v1, :cond_1

    .line 13
    .line 14
    rsub-int/lit8 p1, v0, 0x0

    .line 15
    .line 16
    :cond_1
    :goto_0
    add-int/2addr v0, p1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->b:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 25
    .line 26
    .line 27
    neg-int v0, p1

    .line 28
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenHorizontal(I)V

    .line 29
    .line 30
    .line 31
    if-lez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V

    .line 34
    .line 35
    .line 36
    return p1

    .line 37
    :cond_2
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V

    .line 39
    .line 40
    .line 41
    return p1
.end method

.method public scrollToPosition(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->n(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 2
    .line 3
    add-int v1, v0, p1

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m:I

    .line 6
    .line 7
    if-le v1, v2, :cond_0

    .line 8
    .line 9
    sub-int p1, v2, v0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-gez v1, :cond_1

    .line 13
    .line 14
    rsub-int/lit8 p1, v0, 0x0

    .line 15
    .line 16
    :cond_1
    :goto_0
    add-int/2addr v0, p1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->c:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->e()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->p(IZ)V

    .line 25
    .line 26
    .line 27
    neg-int v0, p1

    .line 28
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenVertical(I)V

    .line 29
    .line 30
    .line 31
    if-lez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V

    .line 34
    .line 35
    .line 36
    return p1

    .line 37
    :cond_2
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;Z)V

    .line 39
    .line 40
    .line 41
    return p1
.end method

.method public smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->f(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/page_grid/PagerGridLayoutManager;->q(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
