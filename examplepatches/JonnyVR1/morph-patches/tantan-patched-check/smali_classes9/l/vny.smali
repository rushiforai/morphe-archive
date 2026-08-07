.class public Ll/vny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/boy;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

.field public b:Ll/fwp0;

.field public c:Ll/boy;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/boy;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/vny;->c:Ll/boy;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->l0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 15
    .line 16
    new-instance v0, Ll/rny;

    .line 17
    .line 18
    invoke-direct {v0, p2}, Ll/rny;-><init>(Ll/boy;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->setShowCardAction(Ll/y20;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/sny;

    .line 25
    .line 26
    invoke-direct {v0, p2}, Ll/sny;-><init>(Ll/boy;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->setOnRefreshListener(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/tny;

    .line 33
    .line 34
    invoke-direct {v0, p2}, Ll/tny;-><init>(Ll/boy;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->setOnCheckedChangeListener(Ll/x20;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/uny;

    .line 41
    .line 42
    invoke-direct {v0, p0, p2}, Ll/uny;-><init>(Ll/vny;Ll/boy;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->setOnJumpClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/vny;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vny;->k(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/boy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/boy;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/boy;->h4()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/boy;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/boy;->h4()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/vny;Ll/boy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vny;->l(Ll/boy;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

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

.method public f(Ll/boy;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/boy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vny;->f(Ll/boy;)V

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 4
    .line 5
    sget v1, Ll/mdc0;->Y0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/fwp0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/vny;->c:Ll/boy;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ll/qny;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/qny;-><init>(Ll/vny;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Ll/fwp0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/vny;->b:Ll/fwp0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->getWeekBoardItem()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vny;->c:Ll/boy;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Ll/boy;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/vny;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vny;->d:Ljava/lang/String;

    .line 10
    .line 11
    const p2, 0x440f8000    # 574.0f

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const/16 v0, 0x1004

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    invoke-virtual {p1, p0, p2, v0, v1}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vny;->b:Ll/fwp0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vny;->b:Ll/fwp0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/fwp0;->H()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    sget v0, Ll/mdc0;->B3:I

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;->G()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public n(Landroid/util/Pair;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ll/hcr;",
            "Ll/cm0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vny;->b:Ll/fwp0;

    .line 2
    .line 3
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ll/hcr;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/hcr;->c()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ll/cm0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vny;->j()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Ll/fwp0;->O(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ll/hcr;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/hcr;->f()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->ruleUrl:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Ll/vny;->d:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 35
    .line 36
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ll/hcr;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/hcr;->b()Ll/nsv;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, Ll/cm0;

    .line 47
    .line 48
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->p0(Ll/nsv;Ll/cm0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vny;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

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
