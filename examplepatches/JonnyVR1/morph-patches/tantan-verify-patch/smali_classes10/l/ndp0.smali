.class public Ll/ndp0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/hfw$a;
.implements Ll/oam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;",
        ">;",
        "Ll/hfw$a;",
        "Ll/oam;"
    }
.end annotation


# instance fields
.field public i:Ll/hfw;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hfw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/hfw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/hfw;->H(Ll/hfw$a;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/thn0;

    .line 15
    .line 16
    invoke-direct {v0, p1, p0}, Ll/thn0;-><init>(Ll/dum;Ll/oam;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private A4(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ndp0;->a2(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->mvp:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/ndp0;->W0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->E0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ndp0;->H4()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ndp0;->E4()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ycp0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/ycp0;-><init>(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic J3(Ll/ndp0;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ndp0;->m4(Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/ndp0;Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->r4(Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/ndp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;)V

    return-void
.end method

.method public static synthetic M3(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ndp0;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    return-void
.end method

.method public static synthetic N3(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    return-void
.end method

.method public static synthetic O3(Ll/ndp0;Ll/u35;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->s4(Ll/u35;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/ndp0;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ndp0;->f4(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/ndp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->k4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S3(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic T3(Ll/ndp0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ndp0;->j4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method

.method public static synthetic U3(Ll/ndp0;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ndp0;->o4(Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V3(Ll/ndp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->i4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/ndp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp0;->n4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ndp0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b4(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ndp0;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic c4(Ll/ndp0;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ndp0;->l4(Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method private f4(Ll/nfn0;)Lkotlin/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nfn0;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ndp0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance p1, Lkotlin/Pair;

    .line 16
    .line 17
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 22
    .line 23
    invoke-static {v0}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {p1, v0, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-object p1

    .line 45
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->w:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/w2m;

    .line 57
    .line 58
    iget-object p1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p0, p1}, Ll/w2m;->f0(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    new-instance p1, Lkotlin/Pair;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->i:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 69
    .line 70
    invoke-static {v0}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->i:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-direct {p1, v0, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-object p1

    .line 88
    :cond_1
    new-instance p0, Lkotlin/Pair;

    .line 89
    .line 90
    const/4 p1, 0x2

    .line 91
    new-array p1, p1, [I

    .line 92
    .line 93
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-direct {p0, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return-object p0
.end method


# virtual methods
.method public final B4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/hfw;->y()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget v0, Ll/obc0;->F3:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sget v0, Ll/obc0;->G3:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    :goto_0
    sget v0, Ll/obc0;->G3:I

    .line 45
    .line 46
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->B0(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final C4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->D0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public D4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/ndp0;->i:Ll/hfw;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/hfw;->F()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v0, v1, v2}, Ll/ifw;->b(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->v0(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public E4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->fromUserId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetedToUserId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->setGreetedToUserId(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    new-instance v3, Ll/wcp0;

    .line 58
    .line 59
    invoke-direct {v3, p0, v1, v0}, Ll/wcp0;-><init>(Ll/ndp0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 v0, 0x7d0

    .line 63
    .line 64
    invoke-static {v2, v3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 65
    .line 66
    .line 67
    :cond_3
    :goto_0
    return-void
.end method

.method public final F4()V
    .locals 5

    .line 1
    new-instance v0, Ll/px50$a;

    .line 2
    .line 3
    const/16 v1, 0x2328

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/px50$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/efv;->L:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 11
    .line 12
    .line 13
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    const-wide v3, 0x3fe3333333333333L    # 0.6

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 21
    .line 22
    .line 23
    const/16 v1, 0x18

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x50

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final G4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/yec0;->Za:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Landroid/widget/PopupWindow;

    .line 15
    .line 16
    sget v2, Ll/bnl0;->f:I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-direct {v1, v0, v2, v2, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 20
    .line 21
    .line 22
    sget v2, Ll/mdc0;->h7:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    new-instance v3, Ll/zcp0;

    .line 29
    .line 30
    invoke-direct {v3, p0, v1}, Ll/zcp0;-><init>(Ll/ndp0;Landroid/widget/PopupWindow;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    sget v2, Ll/mdc0;->i7:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Ll/adp0;

    .line 43
    .line 44
    invoke-direct {v3, p0, v1}, Ll/adp0;-><init>(Ll/ndp0;Landroid/widget/PopupWindow;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    sget v2, Ll/mdc0;->j7:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Ll/bdp0;

    .line 57
    .line 58
    invoke-direct {v2, p0, v1}, Ll/bdp0;-><init>(Ll/ndp0;Landroid/widget/PopupWindow;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->v:Landroid/widget/ImageView;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    sget v2, Ll/qa00;->i:I

    .line 72
    .line 73
    invoke-virtual {v1, p0, v0, v2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final H4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ndp0;->B4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ndp0;->D4()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hfw;->r()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ndp0;->C4(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public I0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/hfw;->J(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V1(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public W0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->z0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a2(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ndp0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ndp0;->D4()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ndp0;->B4()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ndp0;->e4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/hdp0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/hdp0;-><init>(Ll/ndp0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public d4(Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/bzm0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/bzm0;->f(Z)Ll/bzm0;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getLovePlanetInfo(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/mdp0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/mdp0;-><init>(Ll/ndp0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/ucp0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/ucp0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ndp0;->D4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hfw;->G(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i4(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/ndp0;->d4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic j4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->s()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 20
    .line 21
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->G0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 30
    .line 31
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->H0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic k4(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "reset"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ndp0;->x4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l4(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p2, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "\u53d6\u6d88"

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const-string v0, "\u91cd\u7f6e\u6e38\u620f"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v0, "\u91cd\u7f6e\u6e38\u620f\u540e\uff0c\u5c06\u56de\u5230\u6e38\u620f\u51c6\u5907\u9636\u6bb5\uff0c\u4e14\u4e0d\u4f1a\u6e05\u7a7a\u5609\u5bbe\u4f4d\u3002\u786e\u8ba4\u91cd\u7f6e\uff1f"

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    new-instance v0, Ll/cdp0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/cdp0;-><init>(Ll/ndp0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic m4(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ndp0;->F4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n4(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "stop"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ndp0;->x4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->E0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ndp0;->D4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic o4(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p2, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "\u53d6\u6d88"

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const-string v0, "\u7ec8\u6b62\u6e38\u620f"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v0, "\u7ec8\u6b62\u6e38\u620f\u540e\uff0c\u5c06\u56de\u5230\u6e38\u620f\u51c6\u5907\u9636\u6bb5\uff0c\u5e76\u6e05\u7a7a\u5609\u5bbe\u4f4d\u3002\u786e\u8ba4\u7ec8\u6b62\uff1f"

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    new-instance v0, Ll/ddp0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/ddp0;-><init>(Ll/ndp0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const v1, 0x3ca3d70a    # 0.02f

    .line 18
    .line 19
    .line 20
    cmpg-float v0, v0, v1

    .line 21
    .line 22
    if-ltz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 29
    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 50
    .line 51
    :goto_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 56
    .line 57
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/hfw;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hfw;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ndp0;->e4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic s4(Ll/u35;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    iget-object v1, p1, Ll/u35;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/hfw;->x(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p1, Ll/u35;->c:Z

    .line 10
    .line 11
    iget-object p1, p0, Ll/ndp0;->i:Ll/hfw;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/ndp0;->i:Ll/hfw;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/hfw;->r()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "prepare"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/hfw;->r()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "unknown_"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->b1()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/tcp0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/tcp0;-><init>(Ll/ndp0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/edp0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/edp0;-><init>(Ll/ndp0;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lrx/c;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/fdp0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/fdp0;-><init>(Ll/ndp0;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    new-instance v0, Ll/gdp0;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/gdp0;-><init>(Ll/ndp0;)V

    .line 95
    .line 96
    .line 97
    new-instance v1, Ll/hdp0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/hdp0;-><init>(Ll/ndp0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0, v1}, Ll/i6t;->C3(Ll/pcj;Ll/y20;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/idp0;

    .line 110
    .line 111
    invoke-direct {v1}, Ll/idp0;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/jdp0;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/jdp0;-><init>(Ll/ndp0;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    new-instance v1, Ll/hdp0;

    .line 132
    .line 133
    invoke-direct {v1, p0}, Ll/hdp0;-><init>(Ll/ndp0;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    new-instance v0, Ll/kdp0;

    .line 144
    .line 145
    invoke-direct {v0, p0}, Ll/kdp0;-><init>(Ll/ndp0;)V

    .line 146
    .line 147
    .line 148
    const-class v1, Ll/u35;

    .line 149
    .line 150
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Ll/ldp0;

    .line 154
    .line 155
    invoke-direct {v0, p0}, Ll/ldp0;-><init>(Ll/ndp0;)V

    .line 156
    .line 157
    .line 158
    const-class v1, Ll/nfn0;

    .line 159
    .line 160
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public t4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 28
    .line 29
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->changeStage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Ll/vcp0;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/vcp0;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/z2e0;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/z2e0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/guk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_3

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Ll/ndp0;->d4(Z)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/rwn0;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Ll/guk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_3

    .line 110
    .line 111
    invoke-virtual {p0, v2}, Ll/ndp0;->d4(Z)V

    .line 112
    .line 113
    .line 114
    :cond_3
    return-void
.end method

.method public u4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public v4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->s()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p0, "\u8bf7\u5148\u4e0b\u5609\u5bbe\u4f4d"

    .line 32
    .line 33
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    const-string v1, "\u53d6\u6d88"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "\u786e\u8ba4"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "\u786e\u8ba4\u4e0a\u4e3b\u6301\u4f4d\uff1f"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/xcp0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/xcp0;-><init>(Ll/ndp0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p0, "\u4ec5\u7fa4\u4e3b/\u7ba1\u7406\u53ef\u4e0a\u4e3b\u6301\u4f4d"

    .line 82
    .line 83
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Ll/rwn0;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p0, v1, v0}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public w4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->t()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0, v1, v0}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final x4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-static {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->stopOrResetGame(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public y4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/ndp0;->i:Ll/hfw;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/hfw;->y()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ndp0;->G4()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-virtual {p0}, Ll/ndp0;->F4()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public z4(ILjava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ndp0;->i:Ll/hfw;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/hfw;->q()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

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
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->changePair(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "\u65e0\u6cd5\u4fee\u6539\uff0cdata == null"

    .line 26
    .line 27
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
