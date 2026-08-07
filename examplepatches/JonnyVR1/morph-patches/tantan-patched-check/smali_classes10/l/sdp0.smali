.class public Ll/sdp0;
.super Ll/scp0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/scp0<",
        "TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/scp0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m4(Ll/sdp0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sdp0;->p4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic n4(Ll/sdp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sdp0;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method

.method public static synthetic o4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public l4(Ll/hrk0;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/scp0;->l4(Ll/hrk0;)V

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
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 19
    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->fromUserId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_4

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetedToUserId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p1}, Ll/hrk0;->p()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showSayHiBubble()Ll/v3f$d;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    new-instance v2, Ll/pdp0;

    .line 71
    .line 72
    invoke-direct {v2, v1}, Ll/pdp0;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_3

    .line 86
    .line 87
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->setGreetedToUserId(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    new-instance v2, Ll/qdp0;

    .line 93
    .line 94
    invoke-direct {v2, p0, p1, v0}, Ll/qdp0;-><init>(Ll/sdp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    .line 95
    .line 96
    .line 97
    const-wide/16 p0, 0x7d0

    .line 98
    .line 99
    invoke-static {v1, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showSayHiBubble()Ll/v3f$d;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_0
    return-void
.end method

.method public final p4(Ll/jsv;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setVisible(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 10
    .line 11
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->o0(Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/scp0;->t()V

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
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/rdp0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rdp0;-><init>(Ll/sdp0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
