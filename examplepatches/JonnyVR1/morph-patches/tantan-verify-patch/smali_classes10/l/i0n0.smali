.class public Ll/i0n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/t0n0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VRecyclerView;

.field public b:Ll/d0n0;

.field public c:Ll/t0n0;

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
    iput-object v0, p0, Ll/i0n0;->a:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/i0n0;->C0()Landroid/content/Context;

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
    new-instance v1, Ll/i0n0$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/i0n0$a;-><init>(Ll/i0n0;)V

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
    iput-object v0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

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
    iget-object v0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

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
    iget-object p1, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 57
    .line 58
    new-instance v0, Ll/e0n0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/e0n0;-><init>(Ll/i0n0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 67
    .line 68
    new-instance v0, Ll/f0n0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/f0n0;-><init>(Ll/i0n0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic a(Ll/i0n0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i0n0;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/i0n0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i0n0;->p(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic c(Ll/i0n0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i0n0;->n(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic d(Ll/i0n0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i0n0;->m(Ll/nsv;)V

    return-void
.end method

.method private synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/i0n0;->c:Ll/t0n0;

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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/t0n0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i0n0;->a:Lv/VRecyclerView;

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
    iget-object v1, p0, Ll/i0n0;->a:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 19
    .line 20
    iget-object v1, p0, Ll/i0n0;->a:Lv/VRecyclerView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/i0n0;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 26
    .line 27
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t0n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i0n0;->e(Ll/t0n0;)V

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

.method public j(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ll/d0n0;

    .line 2
    .line 3
    new-instance v1, Ll/g0n0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g0n0;-><init>(Ll/i0n0;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/h0n0;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/h0n0;-><init>(Ll/i0n0;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, p1, v1, v2}, Ll/d0n0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/i0n0;->b:Ll/d0n0;

    .line 17
    .line 18
    iget-object p1, p0, Ll/i0n0;->a:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/i0n0;->b:Ll/d0n0;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, v0, v1, p0}, Ll/d0n0;->H(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public k()Z
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final synthetic m(Ll/nsv;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/nsv;->i()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 12
    .line 13
    const-string v1, "voice-manager"

    .line 14
    .line 15
    invoke-static {p1, v0, v1}, Ll/ydn0;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/i0n0;->k()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/v1n0;->t()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Ll/v1n0;->u()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 37
    .line 38
    const-string v2, "canInvite"

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_5

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/t0n0;->g4(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-nez p1, :cond_3

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iget-object v0, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ll/t0n0;->g4(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-virtual {p0}, Ll/i0n0;->k()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_4

    .line 79
    .line 80
    invoke-static {}, Ll/v1n0;->v()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    invoke-static {}, Ll/v1n0;->w()V

    .line 85
    .line 86
    .line 87
    :cond_5
    :goto_1
    return-void
.end method

.method public final synthetic n(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t0n0;->V3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0n0;->c:Ll/t0n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t0n0;->U3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i0n0;->b:Ll/d0n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/d0n0;->H(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0n0;->b:Ll/d0n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/d0n0;->I(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
