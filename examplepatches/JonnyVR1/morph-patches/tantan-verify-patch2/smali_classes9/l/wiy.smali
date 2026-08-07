.class public Ll/wiy;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/widget/LinearLayout;

    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->b:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Landroid/widget/TextView;

    .line 36
    .line 37
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->c:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 46
    .line 47
    sget v0, Ll/mdc0;->W4:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lv/VRecyclerView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->e:Lv/VRecyclerView;

    .line 56
    .line 57
    check-cast p1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    const/4 v0, 0x2

    .line 60
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lv/VLinear;

    .line 65
    .line 66
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->f:Lv/VLinear;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lv/VButton;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->g:Lv/VButton;

    .line 81
    .line 82
    const/4 v0, 0x3

    .line 83
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->h:Landroid/view/View;

    .line 88
    .line 89
    const/4 v0, 0x4

    .line 90
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Landroid/view/ViewGroup;

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->i:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 103
    .line 104
    return-void
.end method
