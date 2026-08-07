.class public Ll/cbd0;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public j:Ll/d9d0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/cbd0;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cbd0;->i0(Ll/d3q;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/d9d0;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic g0(Ll/ycd0;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic h0(Ll/scd0;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public final synthetic i0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cbd0;->j:Ll/d9d0;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public j0(Ll/scd0;Z)V
    .locals 2

    .line 1
    iput-boolean p2, p1, Ll/scd0;->i:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/yad0;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/yad0;-><init>(Ll/scd0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p1, Ll/scd0;->e:Ljava/util/List;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    if-ltz v0, :cond_1

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    iget-object v1, p1, Ll/scd0;->e:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v1}, Ll/v9d0;->s(Ljava/util/List;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {p2, v0, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object p1, p1, Ll/scd0;->e:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_1

    .line 54
    .line 55
    if-ltz v0, :cond_1

    .line 56
    .line 57
    iget-object p2, p1, Ll/scd0;->e:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {p2}, Ll/v9d0;->u(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 63
    .line 64
    iget-object v1, p1, Ll/scd0;->e:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v1}, Ll/v9d0;->s(Ljava/util/List;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {p2, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    add-int/lit8 v0, v0, 0x1

    .line 74
    .line 75
    iget-object p1, p1, Ll/scd0;->e:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public k0(Ll/d9d0;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Ll/cbd0;->j:Ll/d9d0;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    if-eq p1, v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 13
    .line 14
    new-instance v3, Ll/zad0;

    .line 15
    .line 16
    invoke-direct {v3, p0}, Ll/zad0;-><init>(Ll/cbd0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    iget-object v3, p0, Ll/cbd0;->j:Ll/d9d0;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    iput-boolean v4, v3, Ll/e9d0;->b:Z

    .line 29
    .line 30
    invoke-virtual {p0, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 34
    .line 35
    new-instance v3, Ll/abd0;

    .line 36
    .line 37
    invoke-direct {v3, p1}, Ll/abd0;-><init>(Ll/d9d0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-ltz v2, :cond_1

    .line 45
    .line 46
    iget-boolean v3, p1, Ll/e9d0;->b:Z

    .line 47
    .line 48
    xor-int/2addr v0, v3

    .line 49
    iput-boolean v0, p1, Ll/e9d0;->b:Z

    .line 50
    .line 51
    invoke-virtual {p0, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iput-object p1, p0, Ll/cbd0;->j:Ll/d9d0;

    .line 55
    .line 56
    return-void
.end method

.method public l0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/xad0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/xad0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m0(Ll/ycd0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bbd0;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/bbd0;-><init>(Ll/ycd0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-ltz p1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
