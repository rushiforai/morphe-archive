.class public Ll/u0m0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/u0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$RefreshVoiceRoomLeaderboard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u0m0;->R3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$RefreshVoiceRoomLeaderboard;)V

    return-void
.end method

.method public static synthetic K3(Ll/u0m0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u0m0;->N3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L3(Ll/u0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u0m0;->O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;)V

    return-void
.end method

.method public static synthetic M3(Ll/u0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u0m0;->P3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V

    return-void
.end method


# virtual methods
.method public final synthetic N3(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->n(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;->getIsPersonal()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/u0m0;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u0m0;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u0m0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$RefreshVoiceRoomLeaderboard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u0m0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->trackData:Lcom/p1/mobile/putong/live/base/data/BLiveTrackData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackData;->eid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/t3m0;->z(Ll/i6t;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->type:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "auction"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->openAuctionLeaderboardDlg()Ll/v3f$d;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/rwn0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/bae0$a;

    .line 53
    .line 54
    const/16 v1, 0x1b64

    .line 55
    .line 56
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->scheme:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public c()V
    .locals 5

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {v3}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 42
    .line 43
    iget-boolean v4, p0, Ll/u0m0;->i:Z

    .line 44
    .line 45
    invoke-static {v0, v1, v2, v3, v4}, Ll/dcr;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/t0m0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/t0m0;-><init>(Ll/u0m0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/u0m0;->c()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/aj1;->o1()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/q0m0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/q0m0;-><init>(Ll/u0m0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/rwn0;

    .line 42
    .line 43
    iget-object v0, v0, Ll/oo2;->z:Ll/p1w;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/p1w;->r()Ll/aj1;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/aj1;->W0()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/r0m0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/r0m0;-><init>(Ll/u0m0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/rwn0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/aj1;->s0()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/s0m0;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/s0m0;-><init>(Ll/u0m0;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method
