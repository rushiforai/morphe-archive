.class public Ll/zxl0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/jqm0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/jqm0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;",
            ")V"
        }
    .end annotation

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

.method public static synthetic J3(Ll/zxl0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zxl0;->M3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/zxl0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zxl0;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V

    return-void
.end method

.method public static synthetic L3(Ll/zxl0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zxl0;->N3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic M3(Ll/vxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jqm0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p1, Ll/rwn0;->X:Z

    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->O()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final N3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p0, p1}, Ll/jkp0;->h(Ll/i6t;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/gw40;

    .line 15
    .line 16
    invoke-direct {v1, p1}, Ll/gw40;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->dismissChatTips()Ll/v3f$c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->tips:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    iput-boolean v1, v0, Ll/rwn0;->X:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->tips:Ljava/util/List;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->k:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v2, Ll/yxl0;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/yxl0;-><init>(Ll/zxl0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->T(Ljava/util/List;Ljava/lang/String;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public t()V
    .locals 3

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
    check-cast v0, Ll/jqm0;

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/rwn0;->X:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/jqm0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/jqm0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ll/jqm0;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getFocusUser()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v1, v2}, Ll/rwn0;->c3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/wxl0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/wxl0;-><init>(Ll/zxl0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->dismissChatTips()Ll/v3f$c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/xxl0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/xxl0;-><init>(Ll/zxl0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method
