.class public Ll/p8o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/l8o0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VRecyclerView;

.field public b:Ll/c8o0;

.field public c:Ll/l8o0;

.field public d:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lv/VRecyclerView;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p8o0;->a:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p8o0;->C0()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/p8o0$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/p8o0$a;-><init>(Ll/p8o0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Lv/smart_refresh/SmartRefreshLayout;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 37
    .line 38
    new-instance v1, Lv/smart_refresh/header/TTRefreshHeader;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 47
    .line 48
    new-instance v1, Lv/smart_refresh/footer/TTRefreshFooter;

    .line 49
    .line 50
    invoke-direct {v1, p1}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 57
    .line 58
    new-instance v0, Ll/m8o0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/m8o0;-><init>(Ll/p8o0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 67
    .line 68
    new-instance v0, Ll/n8o0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/n8o0;-><init>(Ll/p8o0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic a(Ll/p8o0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p8o0;->j(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic b(Ll/p8o0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p8o0;->k(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic c(Ll/p8o0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p8o0;->i(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic i(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p8o0;->c:Ll/l8o0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic k(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8o0;->c:Ll/l8o0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l8o0;->U3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p8o0;->a:Lv/VRecyclerView;

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

.method public d(Ll/l8o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p8o0;->c:Ll/l8o0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p8o0;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v1, v1, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v0, v1, v2

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/p8o0;->a:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 19
    .line 20
    iget-object v1, p0, Ll/p8o0;->a:Lv/VRecyclerView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/p8o0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 26
    .line 27
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l8o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p8o0;->d(Ll/l8o0;)V

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

.method public init()V
    .locals 4

    .line 1
    new-instance v0, Ll/c8o0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/o8o0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/o8o0;-><init>(Ll/p8o0;)V

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    invoke-direct {v0, v1, v3, v2}, Ll/c8o0;-><init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/p8o0;->b:Ll/c8o0;

    .line 17
    .line 18
    iget-object v1, p0, Ll/p8o0;->a:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/p8o0;->b:Ll/c8o0;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {p0, v0, v1}, Ll/c8o0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic j(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8o0;->c:Ll/l8o0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l8o0;->V3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p8o0;->b:Ll/c8o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/c8o0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
