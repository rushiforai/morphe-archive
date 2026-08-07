.class public Ll/stn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;",
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

.method public static synthetic J3(Ll/stn0;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stn0;->b4(Ll/ovn0;)V

    return-void
.end method

.method public static synthetic K3(Ll/stn0;Ll/gvn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stn0;->Z3(Ll/gvn0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/stn0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stn0;->U3(Ll/gvn0;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic N3(Ll/stn0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stn0;->a4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R3(Ll/stn0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stn0;->Y3(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private U3(Ll/gvn0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x6

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/16 v0, 0xc

    .line 9
    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->e(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->f(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic a4(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->setCount(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private d4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/stn0;->c4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/stn0;->V3()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->e(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->f(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/stn0;->W3()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->e(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

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
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

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
    new-instance v1, Ll/mtn0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/mtn0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ntn0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/ntn0;-><init>(Ll/stn0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

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
    new-instance v1, Ll/otn0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/otn0;-><init>(Ll/stn0;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/ptn0;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/ptn0;-><init>(Ll/stn0;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateApplyCountEvent()Ll/v3f$d;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lrx/c;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/qtn0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/qtn0;-><init>(Ll/stn0;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public T3()V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ll/snm0;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, v1}, Ll/snm0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceApplyManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;->show()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/rwn0;->p()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/v1n0;->r()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {}, Ll/v1n0;->s()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ll/rwn0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Ll/rwn0;

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ll/hrk0;->k(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v2, Ll/rtn0;

    .line 103
    .line 104
    invoke-direct {v2}, Ll/rtn0;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    const/4 v1, 0x7

    .line 118
    if-ne v0, v1, :cond_2

    .line 119
    .line 120
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->sc:I

    .line 121
    .line 122
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_2
    invoke-static {p0}, Ll/ydn0;->o(Ll/i6t;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    invoke-static {p0}, Ll/ydn0;->n(Ll/i6t;)V

    .line 131
    .line 132
    .line 133
    :goto_0
    invoke-static {}, Ll/v1n0;->j()V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public V3()Z
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/hrk0;->p()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v1, Ll/jtn0;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ll/jtn0;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-static {p0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final X3(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic Y3(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/stn0;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z3(Ll/gvn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/stn0;->X3(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic b4(Ll/ovn0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 4
    .line 5
    iget-object p1, p1, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;->setCount(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c4()V
    .locals 2

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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

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
    invoke-virtual {v1}, Ll/rwn0;->W0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callApplyList(Ljava/lang/String;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/ktn0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/ktn0;-><init>(Ll/stn0;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/ltn0;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/ltn0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/stn0;->d4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
