.class public Ll/a1n0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public final i:Ll/ztk0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/ztk0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/a1n0;->i:Ll/ztk0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/a1n0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a1n0;->U3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)V

    return-void
.end method

.method public static synthetic K3(Ll/a1n0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a1n0;->S3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/a1n0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a1n0;->X3(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic N3(Ll/a1n0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a1n0;->R3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;)V

    return-void
.end method


# virtual methods
.method public O3(Ll/ezm0;)V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "VoiceCallMessageModule addDeputy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/a1n0;->i:Ll/ztk0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ztk0;->O3(Ll/ezm0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1n0;->i:Ll/ztk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ztk0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;)V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;->getUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;->getRewardPoint()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/a1n0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T3(Ll/gvn0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    goto/16 :goto_1

    .line 9
    .line 10
    :pswitch_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateSelfCallEvent()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_1
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/a1n0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onVoicePositionChange()Ll/v3f$c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :pswitch_2
    invoke-virtual {p0, p1}, Ll/a1n0;->V3(Ll/gvn0;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_3
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/a1n0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_4
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v1, Ll/h64;

    .line 80
    .line 81
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/gvn0;->l()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_0

    .line 94
    .line 95
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ph:I

    .line 96
    .line 97
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Ll/rwn0;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/rwn0;->i3()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->hf:I

    .line 114
    .line 115
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oh:I

    .line 120
    .line 121
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1}, Ll/a1n0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :pswitch_5
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p0, p1}, Ll/a1n0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :pswitch_6
    new-instance v0, Ll/ezm0;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-direct {v0, v1, p1}, Ll/ezm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v0}, Ll/a1n0;->O3(Ll/ezm0;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :pswitch_7
    const/4 v0, 0x3

    .line 158
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_3

    .line 163
    .line 164
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p1}, Ll/a1n0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 169
    .line 170
    .line 171
    :cond_3
    :goto_1
    return-void

    .line 172
    nop

    .line 173
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final U3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;->callRewardPoint:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/z0n0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/z0n0;-><init>(Ll/a1n0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final V3(Ll/gvn0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/h64;

    .line 8
    .line 9
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/jfv;

    .line 16
    .line 17
    iget-object v1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/a1n0;->X3(Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/x0n0;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/x0n0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/y0n0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/y0n0;-><init>(Ll/a1n0;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1n0;->i:Ll/ztk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ztk0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final X3(Lcom/p1/mobile/putong/data/User;)V
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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->mf:I

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bd:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U5:I

    .line 41
    .line 42
    :goto_0
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ph:I

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1n0;->i:Ll/ztk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ztk0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
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
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/u0n0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u0n0;-><init>(Ll/a1n0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/aj1;->Y()Lrx/c;

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
    new-instance v1, Ll/v0n0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/v0n0;-><init>(Ll/a1n0;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/w0n0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/w0n0;-><init>(Ll/a1n0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void
.end method
