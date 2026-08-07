.class public Ll/xvn0;
.super Ll/csm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/csm0<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public q:Z


# direct methods
.method public constructor <init>(Ll/uzn0;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/csm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic C5(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/wvn0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/wvn0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "approveChatGroupApply"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic D5(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "createChatGroup"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic t5(Ll/xvn0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xvn0;->A5(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method public static synthetic u5(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic v5(Ll/xvn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xvn0;->C5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic w5(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic x5(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceChatApplyId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic y5(Ll/xvn0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xvn0;->B5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    return-void
.end method

.method public static synthetic z5(Ll/xvn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xvn0;->D5(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic A5(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->N(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->N(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/yh2;->init()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->m()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleByType()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "voiceChatButtonBubble"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/rwn0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/rwn0;->E3()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/qvn0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/qvn0;-><init>(Ll/xvn0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/rwn0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/aj1;->l0()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/rvn0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/rvn0;-><init>(Ll/xvn0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public p4()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/j35;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLiveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public s4()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->B0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-boolean v1, p0, Ll/csm0;->p:Z

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/hrk0;->r()Ll/ado0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/ado0;->J()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    int-to-long v0, v0

    .line 35
    cmp-long v0, v3, v0

    .line 36
    .line 37
    if-ltz v0, :cond_0

    .line 38
    .line 39
    move v0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    :goto_0
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iput-boolean v2, p0, Ll/xvn0;->q:Z

    .line 45
    .line 46
    :cond_1
    xor-int/lit8 p0, v0, 0x1

    .line 47
    .line 48
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/csm0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;->dismissApproveSpanEvent()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/svn0;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/svn0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/tvn0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/tvn0;-><init>(Ll/xvn0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;->dismissCreateGroupSpanEvent()Ll/v3f$d;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lrx/c;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/uvn0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/uvn0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/vvn0;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/vvn0;-><init>(Ll/xvn0;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    return-void
.end method
