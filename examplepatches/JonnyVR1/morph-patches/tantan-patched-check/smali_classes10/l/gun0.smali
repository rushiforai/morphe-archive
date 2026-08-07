.class public Ll/gun0;
.super Ll/rvo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/rvo0<",
        "Ll/jqm0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/rvo0;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x5

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b4(Ll/gun0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gun0;->m4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic c4(Ll/gun0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gun0;->l4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "end"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "end"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic f4(Ll/gun0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gun0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 2
    .line 3
    const-string v0, "end"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic h4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i4(Ll/gun0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gun0;->j4(Ll/jsv;)V

    return-void
.end method

.method private synthetic j4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rvo0;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "auction"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_auction:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/rvo0;->W3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p1, "normal"

    .line 30
    .line 31
    iget-object v0, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x3

    .line 40
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/rvo0;->W3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public final synthetic l4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rvo0;->X3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iget-object v0, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1, p1, v0}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/rvo0;->t()V

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
    new-instance v1, Ll/vtn0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/vtn0;-><init>(Ll/gun0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/jqm0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/rwn0;->u()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ztn0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ztn0;-><init>(Ll/gun0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/jqm0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/szn0;->d()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/aun0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/aun0;-><init>(Ll/gun0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ll/jqm0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v0, v0, Ll/aj1;->Y:Lrx/subjects/b;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/bun0;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/bun0;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/cun0;

    .line 112
    .line 113
    invoke-direct {v1}, Ll/cun0;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/dun0;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/dun0;-><init>(Ll/gun0;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Ll/jqm0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v0, v0, Ll/aj1;->s0:Lrx/subjects/b;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/eun0;

    .line 149
    .line 150
    invoke-direct {v1}, Ll/eun0;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-instance v1, Ll/fun0;

    .line 158
    .line 159
    invoke-direct {v1}, Ll/fun0;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/dun0;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/dun0;-><init>(Ll/gun0;)V

    .line 169
    .line 170
    .line 171
    new-instance v2, Ll/wtn0;

    .line 172
    .line 173
    invoke-direct {v2}, Ll/wtn0;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 188
    .line 189
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    check-cast v0, Lrx/c;

    .line 198
    .line 199
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    new-instance v1, Ll/xtn0;

    .line 204
    .line 205
    invoke-direct {v1}, Ll/xtn0;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/ytn0;

    .line 213
    .line 214
    invoke-direct {v1, p0}, Ll/ytn0;-><init>(Ll/gun0;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 222
    .line 223
    .line 224
    return-void
.end method
