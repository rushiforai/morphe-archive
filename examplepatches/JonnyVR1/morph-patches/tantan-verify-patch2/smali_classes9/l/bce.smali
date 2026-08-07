.class public Ll/bce;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qbe;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroidx/recyclerview/widget/RecyclerView$n;

.field public d:Ll/tbe;

.field public e:Ll/x20;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bce;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/bce$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/bce$a;-><init>(Ll/bce;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bce;->c:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/bce;Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/qbe;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bce;->h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/qbe;)V

    return-void
.end method

.method public static synthetic b(Ll/bce;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bce;->i(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/qbe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/tbe;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/tbe;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/bce;->d:Ll/tbe;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/bce;->c:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/bce;->c:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Ll/bce;->d:Ll/tbe;

    .line 46
    .line 47
    iget-object v0, p0, Ll/bce;->b:Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Ll/tbe;->K(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/bce;->d:Ll/tbe;

    .line 53
    .line 54
    new-instance v0, Ll/ybe;

    .line 55
    .line 56
    invoke-direct {v0, p0, p1}, Ll/ybe;-><init>(Ll/bce;Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p2, Ll/tbe;->e:Ll/y20;

    .line 60
    .line 61
    iget-object p2, p0, Ll/bce;->d:Ll/tbe;

    .line 62
    .line 63
    new-instance v0, Ll/zbe;

    .line 64
    .line 65
    invoke-direct {v0, p1}, Ll/zbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p2, Ll/tbe;->f:Ll/y20;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    .line 71
    .line 72
    new-instance p2, Ll/ace;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/ace;-><init>(Ll/bce;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public e(Ll/qbe;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bce;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bce;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->B0:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/qbe;)V
    .locals 1

    .line 1
    iget-boolean v0, p2, Ll/qbe;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p2, Ll/qbe;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->setGiftItem(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->H0(Ll/qbe;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/bce;->e:Ll/x20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic i(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bce;->d:Ll/tbe;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/bce;->j(Ll/tbe;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j(Ll/tbe;I)V
    .locals 6

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Ll/bce;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Ll/bce;->b:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ll/qbe;

    .line 20
    .line 21
    iget-boolean v2, v2, Ll/qbe;->b:Z

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/bce;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/qbe;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    move v1, v0

    .line 39
    :goto_1
    if-eqz p0, :cond_5

    .line 40
    .line 41
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Ll/vwt;->g4()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iget v3, p0, Ll/qbe;->d:I

    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    if-lt v3, v2, :cond_2

    .line 53
    .line 54
    if-ge p2, v2, :cond_2

    .line 55
    .line 56
    move v5, v4

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v5, v0

    .line 59
    :goto_2
    if-ge v3, v2, :cond_3

    .line 60
    .line 61
    if-lt p2, v2, :cond_3

    .line 62
    .line 63
    move v0, v4

    .line 64
    :cond_3
    iput p2, p0, Ll/qbe;->d:I

    .line 65
    .line 66
    if-nez v5, :cond_4

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    :cond_4
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 71
    .line 72
    .line 73
    :cond_5
    return-void
.end method
