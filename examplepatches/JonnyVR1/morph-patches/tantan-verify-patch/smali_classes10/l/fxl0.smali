.class public Ll/fxl0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/ixl0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ixl0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/ixl0;-><init>(Ll/fxl0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->q5(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic T3(Ll/fxl0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxl0;->Y3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUser;)V

    return-void
.end method

.method public static synthetic U3(Ll/fxl0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxl0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V

    return-void
.end method

.method public static synthetic V3(Ll/fxl0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxl0;->X3(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ixl0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "anchorId"

    .line 36
    .line 37
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-string v3, "roomId"

    .line 52
    .line 53
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    const-string v4, "liveId"

    .line 68
    .line 69
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "other_user_id"

    .line 74
    .line 75
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    const-string v5, "button_type"

    .line 82
    .line 83
    const-string v6, "agree"

    .line 84
    .line 85
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    filled-new-array {v1, v2, v3, v4, v5}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "e_audio_add_apply_button"

    .line 94
    .line 95
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->postLike(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/dxl0;

    .line 115
    .line 116
    invoke-direct {v1, p1}, Ll/dxl0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v0, Ll/exl0;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/exl0;-><init>(Ll/fxl0;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isRelationshipMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const-string v1, "chatroom_male"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1, v1}, Ll/wrv;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUser;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUser;->getUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/fxl0;->a4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ixl0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/ixl0;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/ixl0;->K(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V

    .line 13
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
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v0}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/rwn0;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "anchorId"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ll/rwn0;

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "roomId"

    .line 56
    .line 57
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ll/rwn0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v3, "liveId"

    .line 72
    .line 73
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v3, "other_user_id"

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userId:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    filled-new-array {v1, v2, p0, p1}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "e_audio_add_apply_button"

    .line 90
    .line 91
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public a4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getApplyMatchUserInfo(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/cxl0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/cxl0;-><init>(Ll/fxl0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/z2e0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
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
    invoke-virtual {v0}, Ll/aj1;->i1()Lrx/c;

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
    new-instance v1, Ll/axl0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/axl0;-><init>(Ll/fxl0;)V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showVoicePayGuideUserDialog()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/bxl0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/bxl0;-><init>(Ll/fxl0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
