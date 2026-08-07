.class public Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/TextView;

.field public d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VLinear;

.field public g:Lv/VButton;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

.field public j:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/riy;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/vwt;->b7()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/16 v0, 0x1004

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const p2, 0x440f8000    # 574.0f

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const p2, 0x43f88000    # 497.0f

    .line 27
    .line 28
    .line 29
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {p0, p1, p2, v0}, Ll/i6t;->v3(Ljava/lang/String;II)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->count:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static e(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->P3:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wiy;->a(Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->j:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g(ZLcom/p1/mobile/android/app/Act;Ll/hcr;Ll/cm0;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/hcr;",
            "Ll/cm0;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/hcr;->b()Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->i:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 9
    .line 10
    invoke-virtual {p3}, Ll/hcr;->b()Ll/nsv;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, p5, v1, p4}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o(Ll/y20;Ll/nsv;Ll/cm0;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->i:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 18
    .line 19
    invoke-virtual {p3}, Ll/hcr;->b()Ll/nsv;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-virtual {p3}, Ll/hcr;->f()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->loveLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p4, p3}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->q(ZLcom/p1/mobile/android/app/Act;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;Ll/riy;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;",
            "Ll/riy<",
            "*>;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->loveLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;

    .line 9
    .line 10
    :goto_0
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->ruleUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->ruleUrl:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_2
    :goto_1
    sget-object p1, Ll/efv;->z:Ljava/lang/String;

    .line 25
    .line 26
    :goto_2
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->count:I

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    if-nez v1, :cond_3

    .line 32
    .line 33
    const-string v1, "\u6682\u65e0\u7528\u6237\u767b\u4e0a\u5ba0\u7231\u699c"

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v4, "\u5ba0\u7231\u699c\u7528\u6237("

    .line 53
    .line 54
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->count:I

    .line 58
    .line 59
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v4, ")"

    .line 63
    .line 64
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 75
    .line 76
    sget v2, Ll/obc0;->w3:I

    .line 77
    .line 78
    invoke-virtual {v1, v3, v3, v2, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 79
    .line 80
    .line 81
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->b:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    new-instance v2, Ll/uiy;

    .line 84
    .line 85
    invoke-direct {v2, p2, p1}, Ll/uiy;-><init>(Ll/riy;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 92
    .line 93
    new-instance p1, Ll/viy;

    .line 94
    .line 95
    invoke-direct {p1, v0, p3}, Ll/viy;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;Ll/y20;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->e:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->g:Lv/VButton;

    .line 22
    .line 23
    new-instance v1, Ll/tiy;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/tiy;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setOnJumpClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->j:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method
