.class public Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "SourceFile"


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->g:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->h:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->i:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->j:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->k:Z

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->i:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    add-int/2addr v0, v1

    .line 9
    :goto_0
    if-ge v0, p2, :cond_3

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/16 v4, 0x8

    .line 20
    .line 21
    if-ne v2, v4, :cond_0

    .line 22
    .line 23
    move-object v2, p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, v3, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChild(Landroid/view/View;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 34
    .line 35
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->g:I

    .line 36
    .line 37
    add-int/2addr v4, v2

    .line 38
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 39
    .line 40
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 44
    .line 45
    sub-int v2, v4, v2

    .line 46
    .line 47
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 48
    .line 49
    sub-int/2addr v2, v5

    .line 50
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->e:I

    .line 51
    .line 52
    sub-int v7, v4, v5

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    move v5, v2

    .line 56
    move-object v2, p0

    .line 57
    invoke-virtual/range {v2 .. v7}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 58
    .line 59
    .line 60
    add-int/lit8 p0, p2, -0x1

    .line 61
    .line 62
    if-ne v0, p0, :cond_1

    .line 63
    .line 64
    iget p0, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 65
    .line 66
    iput p0, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->h:I

    .line 67
    .line 68
    iput-boolean v1, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->j:Z

    .line 69
    .line 70
    :cond_1
    iget p0, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->d:I

    .line 71
    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 75
    .line 76
    iget v4, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c:I

    .line 77
    .line 78
    add-int/2addr p0, v4

    .line 79
    if-le v3, p0, :cond_2

    .line 80
    .line 81
    iput v0, v2, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->i:I

    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 85
    .line 86
    move-object p0, v2

    .line 87
    goto :goto_0

    .line 88
    :cond_3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->j:Z

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->d:I

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->e:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f:I

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->g:I

    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->i:I

    .line 18
    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->h:I

    .line 20
    .line 21
    return-void
.end method

.method public canScrollVertically()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->f(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public f(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->k:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->j:Z

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager$a;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager$a;-><init>(Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const-wide/16 v2, 0xa

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-wide/16 v2, 0xc8

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestLayout()V

    .line 34
    .line 35
    .line 36
    return-void
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

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->d:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->e:I

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 8
    .line 9
    if-gez v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    add-int v2, v0, p1

    .line 13
    .line 14
    if-gtz v2, :cond_2

    .line 15
    .line 16
    neg-int p1, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_2
    if-lez p1, :cond_4

    .line 19
    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->h:I

    .line 21
    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->d:I

    .line 25
    .line 26
    sub-int v4, v2, v3

    .line 27
    .line 28
    if-le v0, v4, :cond_3

    .line 29
    .line 30
    return v1

    .line 31
    :cond_3
    add-int v1, v0, p1

    .line 32
    .line 33
    sub-int v4, v2, v3

    .line 34
    .line 35
    if-lt v1, v4, :cond_4

    .line 36
    .line 37
    sub-int/2addr v2, v3

    .line 38
    sub-int p1, v2, v0

    .line 39
    .line 40
    :cond_4
    :goto_0
    add-int/2addr v0, p1

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c:I

    .line 44
    .line 45
    if-lt v0, v1, :cond_5

    .line 46
    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->c:I

    .line 48
    .line 49
    :cond_5
    neg-int v0, p1

    .line 50
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenVertical(I)V

    .line 51
    .line 52
    .line 53
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->j:Z

    .line 54
    .line 55
    if-nez v0, :cond_7

    .line 56
    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->g:I

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->d:I

    .line 60
    .line 61
    if-lt v0, v1, :cond_6

    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->b:I

    .line 64
    .line 65
    sub-int/2addr v0, v1

    .line 66
    if-le v2, v0, :cond_7

    .line 67
    .line 68
    :cond_6
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 69
    .line 70
    .line 71
    :cond_7
    return p1
.end method
