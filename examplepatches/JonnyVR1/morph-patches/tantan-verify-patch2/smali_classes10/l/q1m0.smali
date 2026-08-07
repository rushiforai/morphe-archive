.class public Ll/q1m0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/b2m0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VLinear;

.field public l:Lv/smart_refresh/SmartRefreshLayout;

.field public m:Lv/VRecyclerView;

.field public n:Ll/c8o0;

.field public o:Ll/b2m0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/b2m0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->N6:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Ll/q1m0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q1m0;->O(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Ll/q1m0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q1m0;->N(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic H(Ll/q1m0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q1m0;->M(Ll/mvc0;)V

    return-void
.end method

.method private synthetic M(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1m0;->o:Ll/b2m0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b2m0;->h4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic N(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1m0;->o:Ll/b2m0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b2m0;->g4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic O(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q1m0;->o:Ll/b2m0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/q1m0;->n:Ll/c8o0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/q1m0;->m:Lv/VRecyclerView;

    .line 6
    .line 7
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/q1m0;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/q1m0;->m:Lv/VRecyclerView;

    .line 20
    .line 21
    new-instance v1, Ll/q1m0$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/q1m0$a;-><init>(Ll/q1m0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 30
    .line 31
    new-instance v1, Lv/smart_refresh/header/TTRefreshHeader;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-direct {v1, v2}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 42
    .line 43
    new-instance v1, Lv/smart_refresh/footer/TTRefreshFooter;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-direct {v1, v2}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 54
    .line 55
    new-instance v1, Ll/n1m0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/n1m0;-><init>(Ll/q1m0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 64
    .line 65
    new-instance v1, Ll/o1m0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/o1m0;-><init>(Ll/q1m0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/c8o0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/q1m0;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ll/p1m0;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/p1m0;-><init>(Ll/q1m0;)V

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Ll/q1m0;->o:Ll/b2m0;

    .line 85
    .line 86
    invoke-virtual {v3}, Ll/xzs;->E2()Ll/oo2;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 95
    .line 96
    const/4 v4, 0x1

    .line 97
    invoke-direct {v0, v1, v4, v2, v3}, Ll/c8o0;-><init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Ll/q1m0;->n:Ll/c8o0;

    .line 101
    .line 102
    iget-object v1, p0, Ll/q1m0;->m:Lv/VRecyclerView;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/q1m0;->n:Ll/c8o0;

    .line 108
    .line 109
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 110
    .line 111
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 112
    .line 113
    .line 114
    const/4 v1, 0x0

    .line 115
    invoke-virtual {p0, v0, v1}, Ll/c8o0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1m0;->k:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r1m0;->a(Ll/q1m0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/b2m0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q1m0;->o:Ll/b2m0;

    .line 2
    .line 3
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/q1m0;->n:Ll/c8o0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/c8o0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q1m0;->l:Lv/smart_refresh/SmartRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/q1m0;->L()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/q1m0;->n:Ll/c8o0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/c8o0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1m0;->o:Ll/b2m0;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b2m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q1m0;->J(Ll/b2m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q1m0;->I(Landroid/view/View;)V

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
    invoke-direct {p0}, Ll/q1m0;->r()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b2m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q1m0;->J(Ll/b2m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/q1m0;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
