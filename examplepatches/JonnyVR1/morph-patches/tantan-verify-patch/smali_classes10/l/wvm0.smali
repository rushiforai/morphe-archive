.class public Ll/wvm0;
.super Ll/lnm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lnm0<",
        "Ll/rwn0;",
        "Ll/zvm0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/lnm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ll/zvm0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/zvm0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private C4(Ljava/lang/String;)V
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
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private F4()V
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
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/hvm0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/hvm0;-><init>(Ll/wvm0;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/r5k;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/r5k;-><init>()V

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

.method private G4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/zvm0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p0}, Ll/zvm0;->l(Ljava/util/List;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic W3(Ll/wvm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->v4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X3(Ll/wvm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic Y3(Ll/wvm0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->H4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V

    return-void
.end method

.method public static synthetic Z3(Ll/wvm0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->y4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/wvm0;Ll/bzm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->x4(Ll/bzm0;)V

    return-void
.end method

.method public static synthetic b4(Ll/wvm0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wvm0;->r4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic c4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d4(Ll/wvm0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->w4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e4(Ll/wvm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g4(Ll/wvm0;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->E4(Ll/ovn0;)V

    return-void
.end method

.method public static synthetic h4(Ll/wvm0;Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wvm0;->t4(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i4(Ll/wvm0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->p4(Ll/gvn0;)V

    return-void
.end method

.method private init()V
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/gvm0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/gvm0;-><init>(Ll/wvm0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
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
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/nvm0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/nvm0;-><init>(Ll/wvm0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->removeWaitCallEvent()Ll/v3f$d;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lrx/c;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/ovm0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ovm0;-><init>(Ll/wvm0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v0, Ll/zvm0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Ll/rwn0;

    .line 98
    .line 99
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/zvm0;->m(Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->agreeVoiceCallEvent()Ll/v3f$d;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lrx/c;

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/pvm0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/pvm0;-><init>(Ll/wvm0;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Ll/rwn0;

    .line 145
    .line 146
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Ll/aj1;->a1()Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Ll/qvm0;

    .line 159
    .line 160
    invoke-direct {v1, p0}, Ll/qvm0;-><init>(Ll/wvm0;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/rvm0;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/rvm0;-><init>(Ll/wvm0;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public static synthetic j4(Ll/wvm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wvm0;->C4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k4(Ll/wvm0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvm0;->z4(Ll/uxj0;)V

    return-void
.end method

.method private r4(Ll/hrk0$a;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Ll/hrk0$a;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/wvm0;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wvm0;->I4()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/zvm0;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/zvm0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callAgreedEvent()Ll/v3f$d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final B4()V
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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->openFreeCall(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/jvm0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/jvm0;-><init>(Ll/wvm0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/kvm0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/kvm0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public D4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wvm0;->I4()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/zvm0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/zvm0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final E4(Ll/ovn0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object v1, p1, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wvm0;->I4()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/wvm0;->n4(Ll/ovn0;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1}, Ll/wvm0;->G4(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final H4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getFreeCall()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 32
    .line 33
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/zvm0;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getFreeCall()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {v0, p1}, Ll/zvm0;->m(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wvm0;->V3()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final I4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateApplyCountEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/wvm0;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/fom0;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/fom0;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->yf:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/zvm0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zvm0;->i()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-direct {v0, v1, p0, v2}, Ll/fom0;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wvm0;->F4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public final l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p2, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wvm0;->I4()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wvm0;->V3()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m4(Ljava/lang/String;)V
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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 26
    .line 27
    .line 28
    move-result v0

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
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
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
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v0, v1, v2}, Ll/v1n0;->h(ZLjava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/rwn0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ll/rwn0;

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ll/rwn0;

    .line 82
    .line 83
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {v0, v1, v2}, Ll/v1n0;->b(ZLjava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->agreeVoiceCall(Ljava/lang/String;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance v0, Ll/vvm0;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/vvm0;-><init>(Ll/wvm0;)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Ll/wnt;

    .line 104
    .line 105
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final n4(Ll/ovn0;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovn0;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ovn0;->i()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ivm0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ivm0;-><init>(Ll/wvm0;Ll/ovn0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)Ll/bvm0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ll/bvm0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bvm0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2, v1}, Ll/bvm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/lvm0;

    .line 19
    .line 20
    invoke-direct {p2, p0, p1}, Ll/lvm0;-><init>(Ll/wvm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ll/bvm0;->I(Ll/x20;)Ll/bvm0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/mvm0;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/mvm0;-><init>(Ll/wvm0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ll/bvm0;->J(Ll/y20;)Ll/bvm0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final p4(Ll/gvn0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/16 v1, 0x9

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0xc

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0xd

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/wvm0;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, v0, p1}, Ll/wvm0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    iget-object v0, p0, Ll/wvm0;->j:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/gvn0;->f()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/wvm0;->I4()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public q4(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/th0$a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wvm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cg:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/svm0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/svm0;-><init>(Ll/wvm0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->closeFreeCall(Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/tvm0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/tvm0;-><init>(Ll/wvm0;)V

    .line 68
    .line 69
    .line 70
    new-instance p0, Ll/uvm0;

    .line 71
    .line 72
    invoke-direct {p0}, Ll/uvm0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public s4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    invoke-static {p0}, Ll/f2m0;->c(Ll/dum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic t4(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/ovn0;->h(Ljava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p2, p1}, Ll/wvm0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)Ll/bvm0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wvm0;->m4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wvm0;->B4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w4(Ll/uxj0;)V
    .locals 1

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
    invoke-virtual {p1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/zvm0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/zvm0;->m(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic x4(Ll/bzm0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bzm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wvm0;->m4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
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
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic z4(Ll/uxj0;)V
    .locals 1

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
    invoke-virtual {p1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/zvm0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/zvm0;->m(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
