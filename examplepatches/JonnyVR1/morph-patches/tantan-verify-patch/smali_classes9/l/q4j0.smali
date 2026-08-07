.class public Ll/q4j0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TV;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ll/s4j0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ll/rdh0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/q4j0;->j:Ljava/util/Deque;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Ll/q4j0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    return-void
.end method

.method public static synthetic K3(Ll/q4j0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->j4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V

    return-void
.end method

.method public static synthetic L3(Ll/q4j0;Ll/rdh0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q4j0;->a4(Ll/rdh0;)V

    return-void
.end method

.method public static synthetic M3(Ll/q4j0;Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V

    return-void
.end method

.method public static synthetic N3(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->e4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V

    return-void
.end method

.method public static synthetic O3(Ll/q4j0;Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->Z3(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;)V

    return-void
.end method

.method public static synthetic P3(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V

    return-void
.end method

.method public static synthetic R3(Ll/q4j0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q4j0;->X3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic S3(Ll/q4j0;Ll/z3j0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->c4(Ll/z3j0;)V

    return-void
.end method

.method public static synthetic T3(Ll/q4j0;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4j0;->h4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)V

    return-void
.end method

.method private synthetic X3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/q4j0;->U3()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    :goto_0
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/q4j0;->V3()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method private a4(Ll/rdh0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4j0;->j:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/q4j0;->m4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->n()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/k4j0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/k4j0;-><init>(Ll/q4j0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/m4j0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/m4j0;-><init>(Ll/q4j0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/aj1;->L()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/n4j0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/n4j0;-><init>(Ll/q4j0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPlayEffect()Ll/v3f$d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/o4j0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/o4j0;-><init>(Ll/q4j0;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ll/aj1;->j()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Ll/p4j0;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/p4j0;-><init>(Ll/q4j0;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v0, v0, Ll/aj1;->v1:Lrx/subjects/b;

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    new-instance v1, Ll/b4j0;

    .line 137
    .line 138
    invoke-direct {v1, p0}, Ll/b4j0;-><init>(Ll/q4j0;)V

    .line 139
    .line 140
    .line 141
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->showAuctionAnim()Ll/v3f$d;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 159
    .line 160
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 161
    .line 162
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    new-instance v2, Ll/c4j0;

    .line 166
    .line 167
    invoke-direct {v2, v1}, Ll/c4j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v0, v2}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->showSpecialAuctionAnim()Ll/v3f$d;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 184
    .line 185
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 186
    .line 187
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    new-instance v2, Ll/d4j0;

    .line 191
    .line 192
    invoke-direct {v2, v1}, Ll/d4j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, v0, v2}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ll/aj1;->U0()Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    new-instance v1, Ll/e4j0;

    .line 215
    .line 216
    invoke-direct {v1, p0}, Ll/e4j0;-><init>(Ll/q4j0;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, Ll/aj1;->G()Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    new-instance v1, Ll/f4j0;

    .line 243
    .line 244
    invoke-direct {v1, p0}, Ll/f4j0;-><init>(Ll/q4j0;)V

    .line 245
    .line 246
    .line 247
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    iget-object v0, v0, Ll/aj1;->K1:Lrx/subjects/b;

    .line 263
    .line 264
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    new-instance v1, Ll/l4j0;

    .line 269
    .line 270
    invoke-direct {v1, p0}, Ll/l4j0;-><init>(Ll/q4j0;)V

    .line 271
    .line 272
    .line 273
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method public final U3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/q4j0;->m4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final V3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q4j0;->j:Ljava/util/Deque;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final W3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->k0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->m0()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->uid:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/wrv;->f0(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/hiv;

    .line 31
    .line 32
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->grade:J

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/q4j0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->u0(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/u4j0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/u4j0;-><init>(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final c4(Ll/z3j0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/y3j0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/y3j0;-><init>(Ll/z3j0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d4(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/d5j0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/d5j0;-><init>(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;->getAnimationUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;->getAnimationUrl()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->v0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public f4(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/cmd0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/cmd0;-><init>(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g4(Ll/rdh0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/emd0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/emd0;-><init>(Ll/rdh0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final h4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/x3j0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/x3j0;-><init>(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i4(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/z6j0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/z6j0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 2
    .line 3
    new-instance v1, Ll/l5o0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/l5o0;-><init>(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q4j0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->E0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v1, 0xc8

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public m4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->l0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/q4j0;->j:Ljava/util/Deque;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/rdh0;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o0(Ll/rdh0;)V

    .line 28
    .line 29
    .line 30
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

.method public final n4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/q4j0;->W3()Z

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
    iget-object v0, p0, Ll/q4j0;->i:Ljava/util/Deque;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/s4j0;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {v0}, Ll/s4j0;->b()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    packed-switch v1, :pswitch_data_0

    .line 24
    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :pswitch_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/rdh0;

    .line 36
    .line 37
    new-instance v2, Ll/g4j0;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->s0(Ll/rdh0;Ll/x20;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_1
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 55
    .line 56
    new-instance v2, Ll/g4j0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->t0(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_2
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/z3j0;

    .line 74
    .line 75
    new-instance v2, Ll/g4j0;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->q0(Ll/z3j0;Ll/x20;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :pswitch_3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 85
    .line 86
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;

    .line 93
    .line 94
    new-instance v2, Ll/g4j0;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->r0(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Ll/x20;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :pswitch_4
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 104
    .line 105
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 112
    .line 113
    new-instance v2, Ll/g4j0;

    .line 114
    .line 115
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->D0(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ll/x20;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :pswitch_5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 123
    .line 124
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

    .line 131
    .line 132
    new-instance v2, Ll/g4j0;

    .line 133
    .line 134
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->B0(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :pswitch_6
    check-cast v0, Ll/a7j0;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/a7j0;->c()Ll/bkj0;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 148
    .line 149
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 150
    .line 151
    iget-object v2, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast v2, Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v3, Ljava/lang/String;

    .line 158
    .line 159
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v0, Ljava/lang/String;

    .line 162
    .line 163
    new-instance v4, Ll/g4j0;

    .line 164
    .line 165
    invoke-direct {v4, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->G0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :pswitch_7
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 173
    .line 174
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    .line 181
    .line 182
    new-instance v2, Ll/g4j0;

    .line 183
    .line 184
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->p0(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;Ll/x20;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :pswitch_8
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 192
    .line 193
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/s4j0;->a()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;

    .line 200
    .line 201
    new-instance v2, Ll/g4j0;

    .line 202
    .line 203
    invoke-direct {v2, p0}, Ll/g4j0;-><init>(Ll/q4j0;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->y0(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;Ll/x20;)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    nop

    .line 211
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->j0()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/a4j0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/a4j0;-><init>(Ll/q4j0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/aj1;->t1()Lrx/c;

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
    new-instance v1, Ll/h4j0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/h4j0;-><init>(Ll/q4j0;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ll/aj1;->P0()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/i4j0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/i4j0;-><init>(Ll/q4j0;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/aj1;->r()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/j4j0;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/j4j0;-><init>(Ll/q4j0;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    return-void
.end method
