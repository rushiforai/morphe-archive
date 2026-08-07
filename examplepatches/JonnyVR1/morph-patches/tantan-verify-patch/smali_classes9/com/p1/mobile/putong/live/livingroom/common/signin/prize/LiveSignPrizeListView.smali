.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->e(Landroid/view/View;)V

    return-void
.end method

.method private setDataToAdapter(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;

    .line 33
    .line 34
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->rewardId:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v3, Ll/dyt;

    .line 37
    .line 38
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->title:Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {v3, v4}, Ll/dyt;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->rewards:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;

    .line 63
    .line 64
    new-instance v4, Ll/iyt;

    .line 65
    .line 66
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 67
    .line 68
    invoke-direct {v4, v5, v3, v2}, Ll/iyt;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gyt;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kd:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->d(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 10
    .line 11
    new-instance v1, Ll/fyt;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/fyt;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setBackListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setLeftView(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setDivider(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->f()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->r4(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->d()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->setDataToAdapter(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->g()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
