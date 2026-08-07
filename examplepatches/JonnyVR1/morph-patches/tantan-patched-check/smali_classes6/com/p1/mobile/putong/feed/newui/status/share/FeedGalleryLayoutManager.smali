.class public Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$z$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;,
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;,
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;,
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;,
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;,
        Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

.field public g:Landroidx/recyclerview/widget/o;

.field public h:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;

.field public i:Z

.field public j:I

.field public k:Landroidx/recyclerview/widget/r;

.field public l:Landroidx/recyclerview/widget/r;

.field public m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

.field public n:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;

.field public o:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->d:I

    .line 13
    .line 14
    new-instance v1, Landroidx/recyclerview/widget/o;

    .line 15
    .line 16
    invoke-direct {v1}, Landroidx/recyclerview/widget/o;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->g:Landroidx/recyclerview/widget/o;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;Ll/f5h;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->h:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->i:Z

    .line 30
    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->i:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;)Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->n:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;)Landroidx/recyclerview/widget/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->g:Landroidx/recyclerview/widget/o;

    return-object p0
.end method

.method private h(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 10
    .line 11
    if-ge p1, p0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->n:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;

    .line 2
    .line 3
    return-void
.end method

.method public canScrollHorizontally()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

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

.method public canScrollVertically()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

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

.method public checkLayoutParams(Landroidx/recyclerview/widget/RecyclerView$p;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    .line 2
    .line 3
    return p0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->h(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    new-instance v0, Landroid/graphics/PointF;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 8
    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    int-to-float p0, p1

    .line 20
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 21
    .line 22
    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    int-to-float p0, p1

    .line 28
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    return-object v0
.end method

.method public f(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->o:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->g:Landroidx/recyclerview/widget/o;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/w;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->h:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "The attach RecycleView must not null!!"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final g(Landroid/view/View;F)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/r;->i()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/r;->m()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v1, v2

    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/recyclerview/widget/r;->m()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/2addr v1, v0

    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    div-int/lit8 p0, p0, 0x2

    .line 30
    .line 31
    int-to-float p0, p0

    .line 32
    sub-float/2addr p0, p2

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    :goto_0
    int-to-float p1, p1

    .line 38
    add-float/2addr p0, p1

    .line 39
    int-to-float p1, v1

    .line 40
    sub-float/2addr p0, p1

    .line 41
    float-to-int p0, p0

    .line 42
    return p0

    .line 43
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    div-int/lit8 p0, p0, 0x2

    .line 48
    .line 49
    int-to-float p0, p0

    .line 50
    sub-float/2addr p0, p2

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    goto :goto_0
.end method

.method public generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$p;
    .locals 3

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    .line 9
    .line 10
    invoke-direct {p0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;-><init>(II)V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    .line 15
    .line 16
    invoke-direct {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;-><init>(II)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroidx/recyclerview/widget/RecyclerView$p;
    .locals 0

    .line 19
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/recyclerview/widget/RecyclerView$p;
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$d;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final i(Landroid/view/View;F)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->g(Landroid/view/View;F)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    :goto_0
    int-to-float p1, p2

    .line 19
    const/high16 p2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    mul-float/2addr p1, p2

    .line 22
    int-to-float p0, p0

    .line 23
    div-float/2addr p1, p0

    .line 24
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/high16 p1, -0x40800000    # -1.0f

    .line 29
    .line 30
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView$v;III)V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge p2, v2, :cond_1

    .line 15
    .line 16
    if-ge p3, p4, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, v4, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    int-to-float v5, v5

    .line 42
    sub-int v6, v1, v2

    .line 43
    .line 44
    int-to-float v6, v6

    .line 45
    const/high16 v7, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v6, v7

    .line 48
    add-float/2addr v5, v6

    .line 49
    float-to-int v5, v5

    .line 50
    add-int/2addr v2, v5

    .line 51
    add-int/2addr v3, p3

    .line 52
    invoke-virtual {v0, v5, p3, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 53
    .line 54
    .line 55
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    iget v6, v0, Landroid/graphics/Rect;->top:I

    .line 58
    .line 59
    iget v7, v0, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    iget v8, v0, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    move-object v3, p0

    .line 64
    invoke-virtual/range {v3 .. v8}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 65
    .line 66
    .line 67
    iget p3, v0, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    iput p2, v3, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 70
    .line 71
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    if-nez p0, :cond_0

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 88
    .line 89
    invoke-virtual {p0, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 98
    .line 99
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    check-cast p0, Landroid/graphics/Rect;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 106
    .line 107
    .line 108
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 109
    .line 110
    move-object p0, v3

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->o(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->p(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    :goto_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-ge p1, p2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

    .line 35
    .line 36
    int-to-float v1, p3

    .line 37
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->i(Landroid/view/View;F)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-interface {v0, p0, p2, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;->a(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;Landroid/view/View;F)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    :goto_2
    return-void
.end method

.method public final l(Landroidx/recyclerview/widget/RecyclerView$v;III)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    if-ltz p2, :cond_1

    .line 11
    .line 12
    if-le p3, p4, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v3, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v3, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    int-to-float v5, v5

    .line 38
    sub-int v6, v1, v4

    .line 39
    .line 40
    int-to-float v6, v6

    .line 41
    const/high16 v7, 0x40000000    # 2.0f

    .line 42
    .line 43
    div-float/2addr v6, v7

    .line 44
    add-float/2addr v5, v6

    .line 45
    float-to-int v5, v5

    .line 46
    sub-int v2, p3, v2

    .line 47
    .line 48
    add-int/2addr v4, v5

    .line 49
    invoke-virtual {v0, v2, v5, p3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 50
    .line 51
    .line 52
    iget v4, v0, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    iget v5, v0, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iget v6, v0, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    move-object v2, p0

    .line 61
    invoke-virtual/range {v2 .. v7}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 62
    .line 63
    .line 64
    iget p3, v0, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    iput p2, v2, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    if-nez p0, :cond_0

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 85
    .line 86
    invoke-virtual {p0, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    add-int/lit8 p2, p2, -0x1

    .line 106
    .line 107
    move-object p0, v2

    .line 108
    goto :goto_0

    .line 109
    :cond_1
    return-void
.end method

.method public final m(Landroidx/recyclerview/widget/RecyclerView$v;III)V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge p2, v2, :cond_1

    .line 15
    .line 16
    if-ge p3, p4, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, v4, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    int-to-float v5, v5

    .line 42
    sub-int v6, v1, v3

    .line 43
    .line 44
    int-to-float v6, v6

    .line 45
    const/high16 v7, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v6, v7

    .line 48
    add-float/2addr v5, v6

    .line 49
    float-to-int v5, v5

    .line 50
    add-int/2addr v2, p3

    .line 51
    add-int/2addr v3, v5

    .line 52
    invoke-virtual {v0, p3, v5, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 53
    .line 54
    .line 55
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    iget v6, v0, Landroid/graphics/Rect;->top:I

    .line 58
    .line 59
    iget v7, v0, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    iget v8, v0, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    move-object v3, p0

    .line 64
    invoke-virtual/range {v3 .. v8}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 65
    .line 66
    .line 67
    iget p3, v0, Landroid/graphics/Rect;->right:I

    .line 68
    .line 69
    iput p2, v3, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 70
    .line 71
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    if-nez p0, :cond_0

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 88
    .line 89
    invoke-virtual {p0, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 98
    .line 99
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    check-cast p0, Landroid/graphics/Rect;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 106
    .line 107
    .line 108
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 109
    .line 110
    move-object p0, v3

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/RecyclerView$v;III)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    if-ltz p2, :cond_1

    .line 11
    .line 12
    if-le p3, p4, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v3, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v3, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    int-to-float v5, v5

    .line 38
    sub-int v6, v1, v2

    .line 39
    .line 40
    int-to-float v6, v6

    .line 41
    const/high16 v7, 0x40000000    # 2.0f

    .line 42
    .line 43
    div-float/2addr v6, v7

    .line 44
    add-float/2addr v5, v6

    .line 45
    float-to-int v5, v5

    .line 46
    sub-int v4, p3, v4

    .line 47
    .line 48
    add-int/2addr v2, v5

    .line 49
    invoke-virtual {v0, v5, v4, v2, p3}, Landroid/graphics/Rect;->set(IIII)V

    .line 50
    .line 51
    .line 52
    iget v4, v0, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    iget v5, v0, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iget v6, v0, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    move-object v2, p0

    .line 61
    invoke-virtual/range {v2 .. v7}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 62
    .line 63
    .line 64
    iget p3, v0, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    iput p2, v2, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    if-nez p0, :cond_0

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 85
    .line 86
    invoke-virtual {p0, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    add-int/lit8 p2, p2, -0x1

    .line 106
    .line 107
    move-object p0, v2

    .line 108
    goto :goto_0

    .line 109
    :cond_1
    return-void
.end method

.method public final o(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/recyclerview/widget/r;->m()I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroidx/recyclerview/widget/r;->i()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v9, 0x0

    .line 26
    if-lez v1, :cond_2

    .line 27
    .line 28
    if-ltz p3, :cond_0

    .line 29
    .line 30
    move v1, v9

    .line 31
    move v2, v1

    .line 32
    :goto_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-ge v1, v3, :cond_2

    .line 37
    .line 38
    add-int v3, v1, v2

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedRight(Landroid/view/View;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int v4, v4, p3

    .line 49
    .line 50
    if-ge v4, v7, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0, v3, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 53
    .line 54
    .line 55
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 56
    .line 57
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    iput v3, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 60
    .line 61
    add-int/lit8 v2, v2, -0x1

    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    add-int/lit8 v1, v1, -0x1

    .line 71
    .line 72
    :goto_1
    if-ltz v1, :cond_2

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedLeft(Landroid/view/View;)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    sub-int v3, v3, p3

    .line 83
    .line 84
    if-le v3, v8, :cond_1

    .line 85
    .line 86
    invoke-virtual {v0, v2, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 87
    .line 88
    .line 89
    iget v2, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 90
    .line 91
    add-int/lit8 v2, v2, -0x1

    .line 92
    .line 93
    iput v2, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 94
    .line 95
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    const/high16 v11, 0x40000000    # 2.0f

    .line 105
    .line 106
    const/4 v12, -0x1

    .line 107
    if-ltz p3, :cond_6

    .line 108
    .line 109
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    add-int/lit8 v1, v1, -0x1

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedRight(Landroid/view/View;)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    move v7, v2

    .line 136
    goto :goto_2

    .line 137
    :cond_3
    move v7, v1

    .line 138
    move v1, v12

    .line 139
    :goto_2
    move v13, v7

    .line 140
    :goto_3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-ge v13, v2, :cond_9

    .line 145
    .line 146
    add-int v2, v8, p3

    .line 147
    .line 148
    if-ge v1, v2, :cond_9

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 155
    .line 156
    invoke-virtual {v2, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Landroid/graphics/Rect;

    .line 161
    .line 162
    invoke-virtual {v6, v13}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    if-nez v2, :cond_4

    .line 170
    .line 171
    new-instance v2, Landroid/graphics/Rect;

    .line 172
    .line 173
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 181
    .line 182
    invoke-virtual {v4, v13, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    move-object v14, v2

    .line 186
    invoke-virtual {v0, v3, v9, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    int-to-float v5, v5

    .line 202
    sub-int v15, v10, v4

    .line 203
    .line 204
    int-to-float v15, v15

    .line 205
    div-float/2addr v15, v11

    .line 206
    add-float/2addr v5, v15

    .line 207
    float-to-int v5, v5

    .line 208
    if-ne v1, v12, :cond_5

    .line 209
    .line 210
    if-nez v7, :cond_5

    .line 211
    .line 212
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    int-to-float v1, v1

    .line 217
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 218
    .line 219
    .line 220
    move-result v15

    .line 221
    sub-int/2addr v15, v2

    .line 222
    int-to-float v15, v15

    .line 223
    div-float/2addr v15, v11

    .line 224
    add-float/2addr v1, v15

    .line 225
    float-to-int v1, v1

    .line 226
    add-int/2addr v2, v1

    .line 227
    add-int/2addr v4, v5

    .line 228
    invoke-virtual {v14, v1, v5, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 229
    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_5
    add-int/2addr v2, v1

    .line 233
    add-int/2addr v4, v5

    .line 234
    invoke-virtual {v14, v1, v5, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 235
    .line 236
    .line 237
    :goto_4
    iget v2, v14, Landroid/graphics/Rect;->left:I

    .line 238
    .line 239
    move-object v1, v3

    .line 240
    iget v3, v14, Landroid/graphics/Rect;->top:I

    .line 241
    .line 242
    iget v4, v14, Landroid/graphics/Rect;->right:I

    .line 243
    .line 244
    iget v5, v14, Landroid/graphics/Rect;->bottom:I

    .line 245
    .line 246
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 247
    .line 248
    .line 249
    iget v1, v14, Landroid/graphics/Rect;->right:I

    .line 250
    .line 251
    iput v13, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 252
    .line 253
    add-int/lit8 v13, v13, 0x1

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_6
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    if-lez v2, :cond_7

    .line 261
    .line 262
    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    add-int/lit8 v2, v2, -0x1

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedLeft(Landroid/view/View;)I

    .line 273
    .line 274
    .line 275
    move-result v12

    .line 276
    move v1, v2

    .line 277
    :cond_7
    move v8, v1

    .line 278
    :goto_5
    if-ltz v8, :cond_9

    .line 279
    .line 280
    add-int v1, v7, p3

    .line 281
    .line 282
    if-le v12, v1, :cond_9

    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 289
    .line 290
    invoke-virtual {v1, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    check-cast v1, Landroid/graphics/Rect;

    .line 295
    .line 296
    move-object v2, v1

    .line 297
    invoke-virtual {v6, v8}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    invoke-virtual {v0, v1, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 302
    .line 303
    .line 304
    if-nez v2, :cond_8

    .line 305
    .line 306
    new-instance v2, Landroid/graphics/Rect;

    .line 307
    .line 308
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 316
    .line 317
    invoke-virtual {v3, v8, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    :cond_8
    move-object v13, v2

    .line 321
    invoke-virtual {v0, v1, v9, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    int-to-float v4, v4

    .line 337
    sub-int v5, v10, v3

    .line 338
    .line 339
    int-to-float v5, v5

    .line 340
    div-float/2addr v5, v11

    .line 341
    add-float/2addr v4, v5

    .line 342
    float-to-int v4, v4

    .line 343
    sub-int v2, v12, v2

    .line 344
    .line 345
    add-int/2addr v3, v4

    .line 346
    invoke-virtual {v13, v2, v4, v12, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 347
    .line 348
    .line 349
    iget v2, v13, Landroid/graphics/Rect;->left:I

    .line 350
    .line 351
    iget v3, v13, Landroid/graphics/Rect;->top:I

    .line 352
    .line 353
    iget v4, v13, Landroid/graphics/Rect;->right:I

    .line 354
    .line 355
    iget v5, v13, Landroid/graphics/Rect;->bottom:I

    .line 356
    .line 357
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 358
    .line 359
    .line 360
    iget v12, v13, Landroid/graphics/Rect;->left:I

    .line 361
    .line 362
    iput v8, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 363
    .line 364
    add-int/lit8 v8, v8, -0x1

    .line 365
    .line 366
    goto :goto_5

    .line 367
    :cond_9
    return-void
.end method

.method public onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->x()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->b()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    :goto_0
    return-void

    .line 34
    :cond_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->b()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->x()V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    add-int/lit8 v2, v2, -0x1

    .line 61
    .line 62
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->q(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final p(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/recyclerview/widget/r;->m()I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroidx/recyclerview/widget/r;->i()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v9, 0x0

    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    if-ltz p3, :cond_0

    .line 29
    .line 30
    move v1, v9

    .line 31
    move v2, v1

    .line 32
    :goto_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-ge v1, v3, :cond_1

    .line 37
    .line 38
    add-int v3, v1, v2

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int v4, v4, p3

    .line 49
    .line 50
    if-ge v4, v7, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0, v3, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 53
    .line 54
    .line 55
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 56
    .line 57
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    iput v3, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 60
    .line 61
    add-int/lit8 v2, v2, -0x1

    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    add-int/lit8 v1, v1, -0x1

    .line 71
    .line 72
    :goto_1
    if-ltz v1, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    sub-int v3, v3, p3

    .line 83
    .line 84
    if-le v3, v8, :cond_1

    .line 85
    .line 86
    invoke-virtual {v0, v2, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 87
    .line 88
    .line 89
    iget v2, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 90
    .line 91
    add-int/lit8 v2, v2, -0x1

    .line 92
    .line 93
    iput v2, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 94
    .line 95
    add-int/lit8 v1, v1, -0x1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    const/high16 v11, 0x40000000    # 2.0f

    .line 105
    .line 106
    const/4 v12, -0x1

    .line 107
    if-ltz p3, :cond_5

    .line 108
    .line 109
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_2

    .line 114
    .line 115
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    add-int/lit8 v1, v1, -0x1

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    move v7, v2

    .line 136
    goto :goto_2

    .line 137
    :cond_2
    move v7, v1

    .line 138
    move v1, v12

    .line 139
    :goto_2
    move v13, v7

    .line 140
    :goto_3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-ge v13, v2, :cond_8

    .line 145
    .line 146
    add-int v2, v8, p3

    .line 147
    .line 148
    if-ge v1, v2, :cond_8

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 155
    .line 156
    invoke-virtual {v2, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Landroid/graphics/Rect;

    .line 161
    .line 162
    invoke-virtual {v6, v13}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    if-nez v2, :cond_3

    .line 170
    .line 171
    new-instance v2, Landroid/graphics/Rect;

    .line 172
    .line 173
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 181
    .line 182
    invoke-virtual {v4, v13, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    move-object v14, v2

    .line 186
    invoke-virtual {v0, v3, v9, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    int-to-float v5, v5

    .line 202
    sub-int v15, v10, v2

    .line 203
    .line 204
    int-to-float v15, v15

    .line 205
    div-float/2addr v15, v11

    .line 206
    add-float/2addr v5, v15

    .line 207
    float-to-int v5, v5

    .line 208
    if-ne v1, v12, :cond_4

    .line 209
    .line 210
    if-nez v7, :cond_4

    .line 211
    .line 212
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    int-to-float v1, v1

    .line 217
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 218
    .line 219
    .line 220
    move-result v15

    .line 221
    sub-int/2addr v15, v4

    .line 222
    int-to-float v15, v15

    .line 223
    div-float/2addr v15, v11

    .line 224
    add-float/2addr v1, v15

    .line 225
    float-to-int v1, v1

    .line 226
    add-int/2addr v2, v5

    .line 227
    add-int/2addr v4, v1

    .line 228
    invoke-virtual {v14, v5, v1, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 229
    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_4
    add-int/2addr v2, v5

    .line 233
    add-int/2addr v4, v1

    .line 234
    invoke-virtual {v14, v5, v1, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 235
    .line 236
    .line 237
    :goto_4
    iget v2, v14, Landroid/graphics/Rect;->left:I

    .line 238
    .line 239
    move-object v1, v3

    .line 240
    iget v3, v14, Landroid/graphics/Rect;->top:I

    .line 241
    .line 242
    iget v4, v14, Landroid/graphics/Rect;->right:I

    .line 243
    .line 244
    iget v5, v14, Landroid/graphics/Rect;->bottom:I

    .line 245
    .line 246
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 247
    .line 248
    .line 249
    iget v1, v14, Landroid/graphics/Rect;->bottom:I

    .line 250
    .line 251
    iput v13, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 252
    .line 253
    add-int/lit8 v13, v13, 0x1

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    if-lez v2, :cond_6

    .line 261
    .line 262
    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    add-int/lit8 v2, v2, -0x1

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 273
    .line 274
    .line 275
    move-result v12

    .line 276
    move v1, v2

    .line 277
    :cond_6
    move v8, v1

    .line 278
    :goto_5
    if-ltz v8, :cond_8

    .line 279
    .line 280
    add-int v1, v7, p3

    .line 281
    .line 282
    if-le v12, v1, :cond_8

    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 289
    .line 290
    invoke-virtual {v1, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    check-cast v1, Landroid/graphics/Rect;

    .line 295
    .line 296
    move-object v2, v1

    .line 297
    invoke-virtual {v6, v8}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    invoke-virtual {v0, v1, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 302
    .line 303
    .line 304
    if-nez v2, :cond_7

    .line 305
    .line 306
    new-instance v2, Landroid/graphics/Rect;

    .line 307
    .line 308
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 316
    .line 317
    invoke-virtual {v3, v8, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    :cond_7
    move-object v13, v2

    .line 321
    invoke-virtual {v0, v1, v9, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    int-to-float v4, v4

    .line 337
    sub-int v5, v10, v2

    .line 338
    .line 339
    int-to-float v5, v5

    .line 340
    div-float/2addr v5, v11

    .line 341
    add-float/2addr v4, v5

    .line 342
    float-to-int v4, v4

    .line 343
    sub-int v3, v12, v3

    .line 344
    .line 345
    add-int/2addr v2, v4

    .line 346
    invoke-virtual {v13, v4, v3, v2, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 347
    .line 348
    .line 349
    iget v2, v13, Landroid/graphics/Rect;->left:I

    .line 350
    .line 351
    iget v3, v13, Landroid/graphics/Rect;->top:I

    .line 352
    .line 353
    iget v4, v13, Landroid/graphics/Rect;->right:I

    .line 354
    .line 355
    iget v5, v13, Landroid/graphics/Rect;->bottom:I

    .line 356
    .line 357
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 358
    .line 359
    .line 360
    iget v12, v13, Landroid/graphics/Rect;->top:I

    .line 361
    .line 362
    iput v8, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 363
    .line 364
    add-int/lit8 v8, v8, -0x1

    .line 365
    .line 366
    goto :goto_5

    .line 367
    :cond_8
    return-void
.end method

.method public final q(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->r(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    move p1, p2

    .line 18
    :goto_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge p1, v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

    .line 29
    .line 30
    int-to-float v2, p3

    .line 31
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->i(Landroid/view/View;F)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-interface {v1, p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;->a(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;Landroid/view/View;F)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->h:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->o:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$b;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final r(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 11

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2}, Landroidx/recyclerview/widget/r;->m()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroidx/recyclerview/widget/r;->i()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 21
    .line 22
    new-instance v2, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 32
    .line 33
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual {p0, v6, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v6, v4, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    int-to-float v7, v7

    .line 57
    sub-int/2addr v3, v5

    .line 58
    int-to-float v3, v3

    .line 59
    const/high16 v8, 0x40000000    # 2.0f

    .line 60
    .line 61
    div-float/2addr v3, v8

    .line 62
    add-float/2addr v7, v3

    .line 63
    float-to-int v3, v7

    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    int-to-float v7, v7

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 70
    .line 71
    .line 72
    move-result v9

    .line 73
    sub-int/2addr v9, v4

    .line 74
    int-to-float v9, v9

    .line 75
    div-float/2addr v9, v8

    .line 76
    add-float/2addr v7, v9

    .line 77
    float-to-int v7, v7

    .line 78
    add-int/2addr v4, v7

    .line 79
    add-int/2addr v5, v3

    .line 80
    invoke-virtual {v2, v7, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 81
    .line 82
    .line 83
    iget v7, v2, Landroid/graphics/Rect;->left:I

    .line 84
    .line 85
    iget v8, v2, Landroid/graphics/Rect;->top:I

    .line 86
    .line 87
    iget v9, v2, Landroid/graphics/Rect;->right:I

    .line 88
    .line 89
    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    .line 90
    .line 91
    move-object v5, p0

    .line 92
    invoke-virtual/range {v5 .. v10}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    if-nez p0, :cond_0

    .line 106
    .line 107
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 112
    .line 113
    invoke-virtual {p0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {p0, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 130
    .line 131
    .line 132
    :goto_0
    iput v1, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 133
    .line 134
    iput v1, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 135
    .line 136
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedLeft(Landroid/view/View;)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedRight(Landroid/view/View;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iget v2, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 145
    .line 146
    add-int/lit8 v2, v2, -0x1

    .line 147
    .line 148
    invoke-virtual {v5, p1, v2, p0, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->l(Landroidx/recyclerview/widget/RecyclerView$v;III)V

    .line 149
    .line 150
    .line 151
    iget p0, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 152
    .line 153
    add-int/lit8 p0, p0, 0x1

    .line 154
    .line 155
    invoke-virtual {v5, p1, p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;III)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final s(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 11

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2}, Landroidx/recyclerview/widget/r;->m()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroidx/recyclerview/widget/r;->i()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 21
    .line 22
    new-instance v2, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->t()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 32
    .line 33
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual {p0, v6, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v6, v4, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    int-to-float v7, v7

    .line 57
    sub-int/2addr v3, v4

    .line 58
    int-to-float v3, v3

    .line 59
    const/high16 v8, 0x40000000    # 2.0f

    .line 60
    .line 61
    div-float/2addr v3, v8

    .line 62
    add-float/2addr v7, v3

    .line 63
    float-to-int v3, v7

    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    int-to-float v7, v7

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->w()I

    .line 70
    .line 71
    .line 72
    move-result v9

    .line 73
    sub-int/2addr v9, v5

    .line 74
    int-to-float v9, v9

    .line 75
    div-float/2addr v9, v8

    .line 76
    add-float/2addr v7, v9

    .line 77
    float-to-int v7, v7

    .line 78
    add-int/2addr v4, v3

    .line 79
    add-int/2addr v5, v7

    .line 80
    invoke-virtual {v2, v3, v7, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 81
    .line 82
    .line 83
    iget v7, v2, Landroid/graphics/Rect;->left:I

    .line 84
    .line 85
    iget v8, v2, Landroid/graphics/Rect;->top:I

    .line 86
    .line 87
    iget v9, v2, Landroid/graphics/Rect;->right:I

    .line 88
    .line 89
    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    .line 90
    .line 91
    move-object v5, p0

    .line 92
    invoke-virtual/range {v5 .. v10}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecorated(Landroid/view/View;IIII)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    if-nez p0, :cond_0

    .line 106
    .line 107
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 112
    .line 113
    invoke-virtual {p0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {p0, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 130
    .line 131
    .line 132
    :goto_0
    iput v1, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 133
    .line 134
    iput v1, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 135
    .line 136
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iget v2, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 145
    .line 146
    add-int/lit8 v2, v2, -0x1

    .line 147
    .line 148
    invoke-virtual {v5, p1, v2, p0, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->n(Landroidx/recyclerview/widget/RecyclerView$v;III)V

    .line 149
    .line 150
    .line 151
    iget p0, v5, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 152
    .line 153
    add-int/lit8 p0, p0, 0x1

    .line 154
    .line 155
    invoke-virtual {v5, p1, p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$v;III)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    neg-int v0, p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroidx/recyclerview/widget/r;->i()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Landroidx/recyclerview/widget/r;->m()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    sub-int/2addr v2, v3

    .line 30
    div-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Landroidx/recyclerview/widget/r;->m()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    add-int/2addr v2, v3

    .line 41
    if-lez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    add-int/lit8 v4, v4, -0x1

    .line 62
    .line 63
    if-ne v3, v4, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/lit8 v0, v0, -0x1

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    sub-int/2addr v3, v4

    .line 84
    div-int/lit8 v3, v3, 0x2

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr v3, v0

    .line 91
    sub-int/2addr v3, v2

    .line 92
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    :goto_0
    neg-int v0, p1

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 103
    .line 104
    if-nez v3, :cond_2

    .line 105
    .line 106
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    sub-int/2addr v3, v4

    .line 119
    div-int/lit8 v3, v3, 0x2

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr v3, v0

    .line 126
    sub-int/2addr v3, v2

    .line 127
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    goto :goto_0

    .line 136
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    neg-int v1, v0

    .line 141
    iput v1, p1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->b:I

    .line 142
    .line 143
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->k(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenHorizontal(I)V

    .line 147
    .line 148
    .line 149
    :cond_3
    :goto_2
    return v1
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    neg-int v0, p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroidx/recyclerview/widget/r;->i()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Landroidx/recyclerview/widget/r;->m()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    sub-int/2addr v2, v3

    .line 30
    div-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->u()Landroidx/recyclerview/widget/r;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Landroidx/recyclerview/widget/r;->m()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    add-int/2addr v2, v3

    .line 41
    if-lez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    add-int/lit8 v4, v4, -0x1

    .line 62
    .line 63
    if-ne v3, v4, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/lit8 v0, v0, -0x1

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    sub-int/2addr v3, v4

    .line 84
    div-int/lit8 v3, v3, 0x2

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr v3, v0

    .line 91
    sub-int/2addr v3, v2

    .line 92
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    :goto_0
    neg-int v0, p1

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 103
    .line 104
    if-nez v3, :cond_2

    .line 105
    .line 106
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    sub-int/2addr v3, v4

    .line 119
    div-int/lit8 v3, v3, 0x2

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr v3, v0

    .line 126
    sub-int/2addr v3, v2

    .line 127
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    goto :goto_0

    .line 136
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    neg-int v1, v0

    .line 141
    iput v1, p1, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->b:I

    .line 142
    .line 143
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->k(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenVertical(I)V

    .line 147
    .line 148
    .line 149
    :cond_3
    :goto_2
    return v1
.end method

.method public smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 0

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$z;->setTargetPosition(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$z;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final t()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingLeft()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public u()Landroidx/recyclerview/widget/r;
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->j:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->k:Landroidx/recyclerview/widget/r;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Landroidx/recyclerview/widget/r;->a(Landroidx/recyclerview/widget/RecyclerView$o;)Landroidx/recyclerview/widget/r;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->k:Landroidx/recyclerview/widget/r;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->k:Landroidx/recyclerview/widget/r;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->l:Landroidx/recyclerview/widget/r;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-static {p0}, Landroidx/recyclerview/widget/r;->c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroidx/recyclerview/widget/r;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->l:Landroidx/recyclerview/widget/r;

    .line 27
    .line 28
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->l:Landroidx/recyclerview/widget/r;

    .line 29
    .line 30
    return-object p0
.end method

.method public v()Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->f:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->f:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->f:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 13
    .line 14
    return-object p0
.end method

.method public final w()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public final x()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->f:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->d:I

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 16
    .line 17
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    add-int/lit8 v3, v3, -0x1

    .line 29
    .line 30
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->c:I

    .line 35
    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->a:I

    .line 37
    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->b:I

    .line 39
    .line 40
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->d:I

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->e:Landroid/view/View;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->e:Landroid/view/View;

    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->m:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;

    .line 2
    .line 3
    return-void
.end method
