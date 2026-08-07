.class public Ll/i7m0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/g7m0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/LinearLayout;

.field public l:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

.field public m:Landroid/view/View;

.field public n:Lv/VRecyclerView;

.field public o:Lv/VLinear;

.field public p:Ll/g7m0;

.field public final q:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public final r:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/g7m0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->p7:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v2}, Ll/qag0;->e(Z)Ll/rq2;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/i7m0;->q:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 21
    .line 22
    new-instance p1, Ll/i7m0$a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/i7m0$a;-><init>(Ll/i7m0;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/i7m0;->r:Ll/y20;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic F(Ll/i7m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i7m0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/i7m0;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private J(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 18
    .line 19
    new-instance v3, Ll/c7m0;

    .line 20
    .line 21
    iget-object v4, p0, Ll/i7m0;->r:Ll/y20;

    .line 22
    .line 23
    invoke-direct {v3, v2, v4}, Ll/c7m0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object v0
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7m0;->p:Ll/g7m0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j7m0;->a(Ll/i7m0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/g7m0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i7m0;->p:Ll/g7m0;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/i7m0;->o:Lv/VLinear;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/i7m0;->n:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/i7m0;->n:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/i7m0;->M(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p1, p0, Ll/i7m0;->l:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    const-string p2, "\u5979"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const-string p2, "\u4ed6"

    .line 43
    .line 44
    :goto_1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const-string v0, "%s\u7684\u88c5\u626e"

    .line 49
    .line 50
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    sget v0, Ll/n9c0;->p1:I

    .line 55
    .line 56
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->f(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 60
    .line 61
    check-cast p0, Ll/g7m0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/w7p0;->e(Ll/oo2;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i7m0;->q:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/i7m0;->J(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i7m0;->p:Ll/g7m0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/g7m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i7m0;->I(Ll/g7m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/i7m0;->G(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x50

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/i7m0;->l:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/i7m0;->l:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 16
    .line 17
    new-instance v1, Ll/h7m0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/h7m0;-><init>(Ll/i7m0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setBackListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/i7m0;->l:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setLeftView(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/i7m0;->n:Lv/VRecyclerView;

    .line 31
    .line 32
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/i7m0;->C0()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-direct {v1, v2, v0, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/i7m0;->n:Lv/VRecyclerView;

    .line 46
    .line 47
    iget-object p0, p0, Ll/i7m0;->q:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/g7m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i7m0;->I(Ll/g7m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
