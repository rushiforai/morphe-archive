.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:I

.field public g:Z

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/String;

.field public l:I

.field public m:I

.field public n:Ljava/lang/String;

.field public o:Ll/gt4;

.field public final p:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public q:Landroid/animation/ValueAnimator;

.field public r:Landroidx/recyclerview/widget/RecyclerView$a0;

.field public s:I

.field public t:I

.field public u:J

.field public v:I

.field public w:Ll/x20;

.field public x:I


# direct methods
.method public constructor <init>(Ll/y20;Ll/gt4;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/gt4;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e:Z

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j:Z

    .line 16
    .line 17
    const-string v1, "scroll_init"

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->m:I

    .line 22
    .line 23
    new-instance v1, Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s:I

    .line 32
    .line 33
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->t:I

    .line 34
    .line 35
    const-wide/16 v1, 0x0

    .line 36
    .line 37
    iput-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u:J

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->v:I

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->h:Ll/y20;

    .line 42
    .line 43
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->x(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j:Z

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    return-void
.end method


# virtual methods
.method public A(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->w:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final C(Landroidx/recyclerview/widget/RecyclerView$v;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$v;->k()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 17
    .line 18
    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0, v2, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public final D(Landroidx/recyclerview/widget/RecyclerView$v;I)V
    .locals 7

    .line 1
    add-int/lit8 v3, p2, -0x1

    .line 2
    .line 3
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 7
    .line 8
    const/4 v5, 0x1

    .line 9
    const/4 v6, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    move v4, p2

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->z(Landroidx/recyclerview/widget/RecyclerView$v;IIIZZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final E(Landroidx/recyclerview/widget/RecyclerView$v;I)V
    .locals 7

    .line 1
    const/4 v3, 0x0

    .line 2
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v6, 0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v4, p2

    .line 13
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->z(Landroidx/recyclerview/widget/RecyclerView$v;IIIZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "scroll_init"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "scroll_end"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->h:Ll/y20;

    .line 17
    .line 18
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestLayout()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final G(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g(ILandroidx/recyclerview/widget/RecyclerView$v;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-gtz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p2, 0x1

    .line 9
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j:Z

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l:I

    .line 13
    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->m:I

    .line 15
    .line 16
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    if-eqz p3, :cond_1

    .line 19
    .line 20
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    :cond_1
    filled-new-array {p2, p1}, [I

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    div-int/lit8 p1, p1, 0x5

    .line 42
    .line 43
    mul-int/lit8 p1, p1, 0xc

    .line 44
    .line 45
    const/16 p3, 0x64

    .line 46
    .line 47
    if-ge p1, p3, :cond_2

    .line 48
    .line 49
    :goto_0
    move p1, p3

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/16 p3, 0x3e8

    .line 52
    .line 53
    if-le p1, p3, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    :goto_1
    int-to-long v0, p1

    .line 57
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    .line 63
    .line 64
    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance p2, Ll/ey4;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/ey4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;

    .line 83
    .line 84
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final H(Landroidx/recyclerview/widget/RecyclerView$v;IIZ)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 6
    .line 7
    :goto_0
    sub-int/2addr v0, v1

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :goto_1
    const/4 v1, 0x0

    .line 13
    if-lez v0, :cond_2

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    if-le p2, v2, :cond_2

    .line 17
    .line 18
    if-ge p2, p3, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p0, v2, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    if-eqz p4, :cond_1

    .line 33
    .line 34
    add-int/lit8 p2, p2, -0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    if-gtz v0, :cond_3

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_3
    return v1
.end method

.method public final I(Landroidx/recyclerview/widget/RecyclerView$v;I)Z
    .locals 4

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-le p2, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 8
    .line 9
    move v2, v1

    .line 10
    :goto_0
    if-ltz v0, :cond_1

    .line 11
    .line 12
    if-ge v2, p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {p0, v3, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    sub-int/2addr v0, v3

    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-ltz v0, :cond_2

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_2
    return v1
.end method

.method public canScrollVertically()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final g(ILandroidx/recyclerview/widget/RecyclerView$v;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 2
    .line 3
    sub-int v1, p1, v0

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 6
    .line 7
    neg-int v2, v2

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    add-int/lit8 v1, p1, 0x1

    .line 13
    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/2addr v2, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return v2
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

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final i()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/gt4;->e0()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/gt4;->e0()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->n:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public isAutoMeasureEnabled()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->v:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->v:I

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u:J

    .line 16
    .line 17
    const-wide/16 v2, 0x1

    .line 18
    .line 19
    add-long/2addr v0, v2

    .line 20
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u:J

    .line 21
    .line 22
    const-wide/16 v2, 0x3

    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-ltz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "scroll_init"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const-string p1, "scroll_anim_end"

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "scroll_end"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const-string v4, "scroll_anim_end"

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    const/4 v6, -0x1

    .line 20
    sparse-switch v1, :sswitch_data_0

    .line 21
    .line 22
    .line 23
    :goto_0
    move v0, v6

    .line 24
    goto :goto_1

    .line 25
    :sswitch_0
    const-string v1, "delete_item_anim"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v0, 0x2

    .line 35
    goto :goto_1

    .line 36
    :sswitch_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v5

    .line 44
    goto :goto_1

    .line 45
    :sswitch_2
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v0, v3

    .line 53
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 54
    .line 55
    .line 56
    goto :goto_3

    .line 57
    :pswitch_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s:I

    .line 58
    .line 59
    if-ltz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    sub-int/2addr p2, v5

    .line 66
    if-le v0, p2, :cond_5

    .line 67
    .line 68
    :cond_3
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r:Landroidx/recyclerview/widget/RecyclerView$a0;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    sub-int/2addr v0, v5

    .line 77
    if-ge p2, v0, :cond_4

    .line 78
    .line 79
    const-string p2, "idle"

    .line 80
    .line 81
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    :goto_2
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->t:I

    .line 87
    .line 88
    if-ne p2, v6, :cond_6

    .line 89
    .line 90
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s:I

    .line 91
    .line 92
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->t:I

    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_1
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 100
    .line 101
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 105
    .line 106
    if-nez v0, :cond_6

    .line 107
    .line 108
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j:Z

    .line 109
    .line 110
    if-nez v0, :cond_6

    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 113
    .line 114
    if-nez v0, :cond_6

    .line 115
    .line 116
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    sub-int/2addr v0, v5

    .line 121
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 122
    .line 123
    if-le v0, v1, :cond_6

    .line 124
    .line 125
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    sub-int/2addr v0, v5

    .line 130
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->G(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V

    .line 131
    .line 132
    .line 133
    :cond_6
    :goto_3
    return-void

    .line 134
    nop

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x7d55521 -> :sswitch_2
        0x3f87069 -> :sswitch_1
        0x56209a29 -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final l(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;IZ)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r:Landroidx/recyclerview/widget/RecyclerView$a0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;IZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->C(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final m(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;IZ)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "scroll_anim_end"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l:I

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->m:I

    .line 32
    .line 33
    sub-int/2addr v0, v1

    .line 34
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o(ILandroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 39
    .line 40
    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l:I

    .line 42
    .line 43
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->m:I

    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->I(Landroidx/recyclerview/widget/RecyclerView$v;I)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->E(Landroidx/recyclerview/widget/RecyclerView$v;I)V

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e:Z

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e:Z

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 62
    .line 63
    const-string v2, "scroll_end"

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "scroll_init"

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    :cond_2
    move-object v1, p0

    .line 82
    move-object v2, p1

    .line 83
    goto :goto_1

    .line 84
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 85
    .line 86
    if-nez v1, :cond_4

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 89
    .line 90
    if-nez v1, :cond_4

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 93
    .line 94
    if-nez v1, :cond_4

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 97
    .line 98
    if-nez v1, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->E(Landroidx/recyclerview/widget/RecyclerView$v;I)V

    .line 101
    .line 102
    .line 103
    :goto_0
    move-object v1, p0

    .line 104
    move-object v2, p1

    .line 105
    goto :goto_2

    .line 106
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->w()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_5

    .line 111
    .line 112
    const/16 v1, 0xb9

    .line 113
    .line 114
    if-le v5, v1, :cond_5

    .line 115
    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 117
    .line 118
    const/16 v2, 0xf

    .line 119
    .line 120
    if-ge v1, v2, :cond_5

    .line 121
    .line 122
    invoke-virtual {p0, p1, v1, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->H(Landroidx/recyclerview/widget/RecyclerView$v;IIZ)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->E(Landroidx/recyclerview/widget/RecyclerView$v;I)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    const/4 v3, 0x0

    .line 133
    const/4 v7, 0x1

    .line 134
    move-object v1, p0

    .line 135
    move-object v2, p1

    .line 136
    move v4, p3

    .line 137
    move v6, p4

    .line 138
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->z(Landroidx/recyclerview/widget/RecyclerView$v;IIIZZ)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v2, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->y(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :goto_1
    invoke-virtual {v1, v2, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->D(Landroidx/recyclerview/widget/RecyclerView$v;I)V

    .line 146
    .line 147
    .line 148
    :goto_2
    invoke-virtual {v1, v2, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "scroll_anim_end"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->n:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/16 v0, 0xf

    .line 44
    .line 45
    if-le p1, v0, :cond_2

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 54
    .line 55
    if-le p1, v0, :cond_2

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    :goto_0
    const/16 v1, 0x14

    .line 59
    .line 60
    if-ge p1, v1, :cond_2

    .line 61
    .line 62
    if-ltz v0, :cond_1

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o:Ll/gt4;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/gt4;->e0()Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->n:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 87
    .line 88
    return v0

    .line 89
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 90
    .line 91
    add-int/lit8 p1, p1, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 95
    .line 96
    return p0
.end method

.method public final o(ILandroidx/recyclerview/widget/RecyclerView$v;I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gez p1, :cond_7

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-lt p3, v1, :cond_5

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 26
    .line 27
    add-int/2addr p3, v1

    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 29
    .line 30
    if-gtz v1, :cond_1

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 33
    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 35
    .line 36
    add-int/2addr p1, p3

    .line 37
    return p1

    .line 38
    :cond_1
    :goto_0
    if-lez p3, :cond_4

    .line 39
    .line 40
    if-gtz v1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-le p2, p3, :cond_2

    .line 47
    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 49
    .line 50
    sub-int/2addr p3, p2

    .line 51
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 52
    .line 53
    return p1

    .line 54
    :cond_2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 55
    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 57
    .line 58
    add-int/2addr p1, p3

    .line 59
    return p1

    .line 60
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 61
    .line 62
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    sub-int/2addr p3, v2

    .line 67
    goto :goto_0

    .line 68
    :cond_4
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 69
    .line 70
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 71
    .line 72
    return p1

    .line 73
    :cond_5
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 74
    .line 75
    if-gez p2, :cond_6

    .line 76
    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 78
    .line 79
    :cond_6
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 80
    .line 81
    add-int/2addr p2, p3

    .line 82
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 83
    .line 84
    return p1

    .line 85
    :cond_7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 86
    .line 87
    add-int/lit8 p3, p3, -0x1

    .line 88
    .line 89
    if-ne v1, p3, :cond_8

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 92
    .line 93
    if-nez v1, :cond_8

    .line 94
    .line 95
    return v0

    .line 96
    :cond_8
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-lt p1, v1, :cond_d

    .line 103
    .line 104
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 105
    .line 106
    add-int/2addr v1, p1

    .line 107
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 108
    .line 109
    if-lt v2, p3, :cond_9

    .line 110
    .line 111
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 112
    .line 113
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 114
    .line 115
    sub-int/2addr p1, v1

    .line 116
    return p1

    .line 117
    :cond_9
    :goto_1
    if-lez v1, :cond_c

    .line 118
    .line 119
    if-lt v2, p3, :cond_b

    .line 120
    .line 121
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-le p2, v1, :cond_a

    .line 126
    .line 127
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 128
    .line 129
    sub-int/2addr v1, p2

    .line 130
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 131
    .line 132
    return p1

    .line 133
    :cond_a
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 134
    .line 135
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 136
    .line 137
    sub-int/2addr p1, v1

    .line 138
    return p1

    .line 139
    :cond_b
    add-int/lit8 v2, v2, 0x1

    .line 140
    .line 141
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->s(Landroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    sub-int/2addr v1, v3

    .line 146
    goto :goto_1

    .line 147
    :cond_c
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 148
    .line 149
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 150
    .line 151
    return p1

    .line 152
    :cond_d
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 153
    .line 154
    if-le p2, p3, :cond_e

    .line 155
    .line 156
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 157
    .line 158
    :cond_e
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 159
    .line 160
    add-int/2addr p2, p1

    .line 161
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 162
    .line 163
    return p1
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleAllViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->n(Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->x:I

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->x:I

    .line 32
    .line 33
    move v0, v1

    .line 34
    :cond_1
    const/4 v1, 0x1

    .line 35
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string p2, "onLayoutChildren error:"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "[live][chat]"

    .line 59
    .line 60
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    const-string v0, "idle"

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez p1, :cond_3

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r:Landroidx/recyclerview/widget/RecyclerView$a0;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-ltz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sub-int/2addr p1, v1

    .line 24
    if-ge v2, p1, :cond_1

    .line 25
    .line 26
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->v()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->w:Ll/x20;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-interface {p1}, Ll/x20;->call()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i()V

    .line 45
    .line 46
    .line 47
    const-string p1, "scroll_anim_end"

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 50
    .line 51
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->h:Ll/y20;

    .line 54
    .line 55
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 64
    .line 65
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 66
    .line 67
    return-void
.end method

.method public p(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->t()Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr p1, v1

    .line 14
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr p1, v0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->x:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final q(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 12
    .line 13
    add-int/2addr p0, p1

    .line 14
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 15
    .line 16
    add-int/2addr p0, p1

    .line 17
    return p0
.end method

.method public final r(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 12
    .line 13
    add-int/2addr p0, p1

    .line 14
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 15
    .line 16
    add-int/2addr p0, p1

    .line 17
    return p0
.end method

.method public final s(Landroidx/recyclerview/widget/RecyclerView$v;I)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p0, p1, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return p0

    .line 14
    :catch_0
    return v0
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->h()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 17
    .line 18
    if-eqz v1, :cond_4

    .line 19
    .line 20
    :cond_0
    const/4 v1, 0x1

    .line 21
    if-lez p1, :cond_1

    .line 22
    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 24
    .line 25
    if-lez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    sub-int/2addr v3, v1

    .line 32
    if-ne v2, v3, :cond_1

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {p0, p1, p2, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->o(ILandroidx/recyclerview/widget/RecyclerView$v;I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-lez p1, :cond_2

    .line 56
    .line 57
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 61
    .line 62
    :goto_0
    if-lez p1, :cond_3

    .line 63
    .line 64
    move v0, v1

    .line 65
    :cond_3
    invoke-virtual {p0, p2, p3, v3, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;IZ)V

    .line 66
    .line 67
    .line 68
    return v2

    .line 69
    :cond_4
    :goto_1
    return v0
.end method

.method public t()Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public final u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p:Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-virtual {p0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    return-object v0
.end method

.method public v()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->k:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "idle"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic x(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->l:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestLayout()V

    .line 14
    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->i:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final y(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 7

    .line 1
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    if-lez v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 13
    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1, v6, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q(Landroid/view/View;)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    neg-int v3, v2

    .line 35
    const/4 v5, 0x0

    .line 36
    const/4 v2, 0x0

    .line 37
    move-object v0, p0

    .line 38
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 42
    .line 43
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    add-int/lit8 v2, v2, -0x1

    .line 48
    .line 49
    if-ge v1, v2, :cond_1

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 52
    .line 53
    if-lez v1, :cond_1

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v1, v6, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q(Landroid/view/View;)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 76
    .line 77
    add-int v5, v3, v2

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    move-object v0, p0

    .line 81
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public final z(Landroidx/recyclerview/widget/RecyclerView$v;IIIZZ)V
    .locals 9

    .line 1
    if-ge p3, p4, :cond_8

    .line 2
    .line 3
    if-gez p3, :cond_0

    .line 4
    .line 5
    goto/16 :goto_5

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->u(Landroidx/recyclerview/widget/RecyclerView$v;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v1, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->r(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->q(Landroid/view/View;)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v7, 0x1

    .line 24
    if-eqz p5, :cond_2

    .line 25
    .line 26
    add-int v2, p2, v6

    .line 27
    .line 28
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 32
    .line 33
    if-ge v2, v3, :cond_1

    .line 34
    .line 35
    :goto_0
    move v0, v7

    .line 36
    :cond_1
    move v8, v0

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    add-int v2, p2, v6

    .line 39
    .line 40
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 41
    .line 42
    add-int/2addr v2, v3

    .line 43
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 44
    .line 45
    if-ge v2, v3, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :goto_1
    if-eqz p6, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    if-eqz p5, :cond_3

    .line 54
    .line 55
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 56
    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 58
    .line 59
    sub-int/2addr v0, v2

    .line 60
    sub-int v5, v0, p2

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    sub-int v3, v5, v6

    .line 64
    .line 65
    move-object v0, p0

    .line 66
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_3
    move-object v0, p0

    .line 71
    iget p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 72
    .line 73
    add-int v3, p0, p2

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    add-int v5, v3, v6

    .line 77
    .line 78
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    move-object v0, p0

    .line 83
    :goto_2
    if-eqz v8, :cond_6

    .line 84
    .line 85
    add-int/2addr p2, v6

    .line 86
    if-eqz p5, :cond_5

    .line 87
    .line 88
    sub-int/2addr p3, v7

    .line 89
    :goto_3
    move-object p0, v0

    .line 90
    goto :goto_4

    .line 91
    :cond_5
    add-int/2addr p3, v7

    .line 92
    goto :goto_3

    .line 93
    :goto_4
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->z(Landroidx/recyclerview/widget/RecyclerView$v;IIIZZ)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_6
    if-eqz p5, :cond_7

    .line 98
    .line 99
    add-int/2addr p2, v6

    .line 100
    iget p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 101
    .line 102
    add-int/2addr p2, p0

    .line 103
    iget p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 104
    .line 105
    sub-int/2addr p2, p0

    .line 106
    neg-int p0, p2

    .line 107
    iput p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 108
    .line 109
    iput p3, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c:I

    .line 110
    .line 111
    return-void

    .line 112
    :cond_7
    add-int/2addr p2, v6

    .line 113
    iget p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->a:I

    .line 114
    .line 115
    add-int/2addr p2, p0

    .line 116
    iget p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f:I

    .line 117
    .line 118
    sub-int/2addr p2, p0

    .line 119
    neg-int p0, p2

    .line 120
    iput p0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->b:I

    .line 121
    .line 122
    iput p3, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->d:I

    .line 123
    .line 124
    :cond_8
    :goto_5
    return-void
.end method
