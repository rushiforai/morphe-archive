.class public Ll/fiy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/riy;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

.field public b:Ll/zbr;

.field public c:Ll/riy;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/riy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->e(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 13
    .line 14
    new-instance p0, Ll/aiy;

    .line 15
    .line 16
    invoke-direct {p0, p2}, Ll/aiy;-><init>(Ll/riy;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->setOnJumpClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/fiy;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ll/hcr;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fiy;->m(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ll/hcr;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b(Ll/fiy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fiy;->p(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/riy;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->dismiss()Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/kny;->b(Ll/i6t;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/fiy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fiy;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/fiy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fiy;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/fiy;)Ll/riy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fiy;->c:Ll/riy;

    return-object p0
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fiy;->c:Ll/riy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/riy;->V3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Ll/riy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fiy;->c:Ll/riy;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/riy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fiy;->i(Ll/riy;)V

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

.method public j()Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/zbr;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/fiy;->b:Ll/zbr;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->e:Lv/VRecyclerView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 13
    .line 14
    new-instance v0, Ll/fiy$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/fiy$a;-><init>(Ll/fiy;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fiy;->c:Ll/riy;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ll/hcr;Ljava/lang/Integer;)V
    .locals 9

    .line 1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x2

    .line 17
    sub-int/2addr v0, v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-lt v3, v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    :goto_0
    const/4 p4, 0x1

    .line 35
    sub-int/2addr v1, p4

    .line 36
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p1, v0, v3}, Ljava/util/AbstractList;->subList(II)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v0, p0, Ll/fiy;->b:Ll/zbr;

    .line 49
    .line 50
    invoke-virtual {v0, v1, p1, p2}, Ll/zbr;->H(ILcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->h:Landroid/view/View;

    .line 56
    .line 57
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 68
    .line 69
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    new-instance v8, Ll/eiy;

    .line 74
    .line 75
    invoke-direct {v8, p0}, Ll/eiy;-><init>(Ll/fiy;)V

    .line 76
    .line 77
    .line 78
    const/4 v4, 0x1

    .line 79
    move-object v7, p2

    .line 80
    move-object v6, p3

    .line 81
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->g(ZLcom/p1/mobile/android/app/Act;Ll/hcr;Ll/cm0;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic p(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fiy;->c:Ll/riy;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q(Ll/cm0;Ll/hcr;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/fiy;->c:Ll/riy;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/hcr;->c()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v3, Ll/biy;

    .line 12
    .line 13
    invoke-direct {v3, p0, v0, p1, p2}, Ll/biy;-><init>(Ll/fiy;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ll/hcr;)V

    .line 14
    .line 15
    .line 16
    iget-object v4, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 17
    .line 18
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v4, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 24
    .line 25
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->h:Landroid/view/View;

    .line 26
    .line 27
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 31
    .line 32
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->h:Landroid/view/View;

    .line 33
    .line 34
    new-instance v5, Ll/ciy;

    .line 35
    .line 36
    invoke-direct {v5, p0}, Ll/ciy;-><init>(Ll/fiy;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/hcr;->f()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget-object v6, p0, Ll/fiy;->c:Ll/riy;

    .line 49
    .line 50
    invoke-virtual {v4, v5, v6, v3}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->h(Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;Ll/riy;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    iget-object v7, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 54
    .line 55
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    new-instance v12, Ll/diy;

    .line 60
    .line 61
    invoke-direct {v12, p0}, Ll/diy;-><init>(Ll/fiy;)V

    .line 62
    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    move-object v11, p1

    .line 66
    move-object v10, p2

    .line 67
    invoke-virtual/range {v7 .. v12}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->g(ZLcom/p1/mobile/android/app/Act;Ll/hcr;Ll/cm0;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->e:Lv/VRecyclerView;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/fiy;->b:Ll/zbr;

    .line 78
    .line 79
    invoke-virtual {p1, v0, v11}, Ll/zbr;->I(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p1, p0, Ll/fiy;->b:Ll/zbr;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/zbr;->C()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v1, v2

    .line 92
    :goto_0
    invoke-virtual {p0, v1}, Ll/fiy;->s(Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->f:Lv/VLinear;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fiy;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
