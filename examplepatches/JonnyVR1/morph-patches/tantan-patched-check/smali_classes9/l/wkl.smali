.class public Ll/wkl;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rll;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/FrameLayout;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/google/android/material/tabs/TabLayout;

.field public o:Landroid/widget/ImageView;

.field public p:Landroid/view/View;

.field public q:Lv/VPager;

.field public r:Ll/rll;

.field public s:Ll/sll;

.field public t:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rll;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->i2:I

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

.method public static synthetic F(Ll/wkl;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wkl;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/wkl;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wkl;->q:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/wkl;->t:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x1

    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->dayRuleUrl:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->dayRuleUrl:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const-string p1, "https://m.tantanapp.com/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/anchor_daily_board"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->weekRuleUrl:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->weekRuleUrl:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const-string p1, "https://m.tantanapp.com/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/anchor_week_board"

    .line 75
    .line 76
    :goto_0
    iget-object p0, p0, Ll/wkl;->r:Ll/rll;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const/16 v0, 0x1004

    .line 89
    .line 90
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const/16 v0, 0x50

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/16 v0, 0x18

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    sget-object v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_GRAY_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {}, Ll/bnl0;->y0()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const v1, 0x440f8000    # 574.0f

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-virtual {p1, v0, v1}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method private N(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tll;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wkl;->s:Ll/sll;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/sll;->q(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/wkl;->s:Ll/sll;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/sll;->getCount()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    if-gt p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/wkl;->n:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    const p1, 0xffffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkl;->k:Landroid/widget/FrameLayout;

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

.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xkl;->a(Ll/wkl;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/rll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wkl;->r:Ll/rll;

    .line 2
    .line 3
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wkl;->t:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wkl;->s:Ll/sll;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/sll;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, v1}, Ll/sll;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/wkl;->s:Ll/sll;

    .line 13
    .line 14
    iget-object v0, p0, Ll/wkl;->q:Lv/VPager;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VPager;->setScrollble(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/wkl;->q:Lv/VPager;

    .line 21
    .line 22
    iget-object v1, p0, Ll/wkl;->s:Ll/sll;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/wkl;->q:Lv/VPager;

    .line 28
    .line 29
    new-instance v1, Ll/wkl$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/wkl$a;-><init>(Ll/wkl;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/wkl;->q:Lv/VPager;

    .line 38
    .line 39
    const/4 v0, 0x2

    .line 40
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wkl;->q:Lv/VPager;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/wkl;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->l0(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rll;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wkl;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/wkl;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->j0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rll;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wkl;->I(Ll/rll;)V

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

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/rll;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rll;->b4()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/wkl;->N(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/wkl;->G(Landroid/view/View;)V

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
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->MEMBER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/wkl;->n:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    iget-object v0, p0, Ll/wkl;->q:Lv/VPager;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/wkl;->L()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/wkl;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->k0()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/wkl;->o:Landroid/widget/ImageView;

    .line 30
    .line 31
    new-instance v0, Ll/vkl;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/vkl;-><init>(Ll/wkl;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rll;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wkl;->I(Ll/rll;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
