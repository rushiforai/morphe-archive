.class public Ll/i5j;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Ll/ogd0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/ogd0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/i5j;->i:Ll/ogd0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/i5j;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->e4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/i5j;Ll/xcd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->a4(Ll/xcd0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic M3(Ll/i5j;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->d4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/i5j;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i5j;->X3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    return-void
.end method

.method public static synthetic O3(Ll/i5j;Ll/bgd0;)Ll/agd0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->b4(Ll/bgd0;)Ll/agd0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/i5j;Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->Z3(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    return-void
.end method

.method public static synthetic R3(Ll/i5j;Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->h4(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    return-void
.end method

.method public static synthetic S3(Ll/i5j;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->c4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic T3(Ll/i5j;Ll/npc0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->g4(Ll/npc0;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Ll/i5j;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->Y3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic V3(Ll/i5j;Ll/t35;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5j;->f4(Ll/t35;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private X3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c7:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToRoomId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->b3:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveType()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/i6t;->o3()Ll/ajt$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/ajt$a;->b()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->setLiveType(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/ogd0;->V0(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 61
    .line 62
    .line 63
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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->jumpRoom()Ll/v3f$d;

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
    new-instance v1, Ll/v4j;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/v4j;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/c5j;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/c5j;-><init>(Ll/i5j;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->initRoomInfo()Ll/v3f$c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/d5j;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/d5j;-><init>(Ll/i5j;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->changeRoomData()Ll/v3f$d;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lrx/c;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/e5j;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/e5j;-><init>(Ll/i5j;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    new-instance v0, Ll/f5j;

    .line 110
    .line 111
    invoke-direct {v0, p0}, Ll/f5j;-><init>(Ll/i5j;)V

    .line 112
    .line 113
    .line 114
    const-class v1, Ll/xcd0;

    .line 115
    .line 116
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/g5j;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/g5j;-><init>(Ll/i5j;)V

    .line 122
    .line 123
    .line 124
    const-class v1, Ll/bgd0;

    .line 125
    .line 126
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->finish()Ll/v3f$c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lrx/c;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/h5j;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/h5j;-><init>(Ll/i5j;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->switchNextLive()Ll/v3f$c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Lrx/c;

    .line 176
    .line 177
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    new-instance v1, Ll/w4j;

    .line 182
    .line 183
    invoke-direct {v1, p0}, Ll/w4j;-><init>(Ll/i5j;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->clickClose()Ll/v3f$c;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Lrx/c;

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    new-instance v1, Ll/x4j;

    .line 214
    .line 215
    invoke-direct {v1, p0}, Ll/x4j;-><init>(Ll/i5j;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 223
    .line 224
    .line 225
    new-instance v0, Ll/y4j;

    .line 226
    .line 227
    invoke-direct {v0, p0}, Ll/y4j;-><init>(Ll/i5j;)V

    .line 228
    .line 229
    .line 230
    const-class v1, Ll/t35;

    .line 231
    .line 232
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 233
    .line 234
    .line 235
    new-instance v0, Ll/z4j;

    .line 236
    .line 237
    invoke-direct {v0, p0}, Ll/z4j;-><init>(Ll/i5j;)V

    .line 238
    .line 239
    .line 240
    const-class v1, Ll/npc0;

    .line 241
    .line 242
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 250
    .line 251
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;->addClearScreenCallBack()Ll/v3f$d;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    check-cast v0, Lrx/c;

    .line 260
    .line 261
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    new-instance v1, Ll/a5j;

    .line 266
    .line 267
    invoke-direct {v1, p0}, Ll/a5j;-><init>(Ll/i5j;)V

    .line 268
    .line 269
    .line 270
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 282
    .line 283
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;->removeClearScreenCallBack()Ll/v3f$d;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    check-cast v0, Lrx/c;

    .line 292
    .line 293
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    new-instance v1, Ll/b5j;

    .line 298
    .line 299
    invoke-direct {v1, p0}, Ll/b5j;-><init>(Ll/i5j;)V

    .line 300
    .line 301
    .line 302
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 307
    .line 308
    .line 309
    return-void
.end method

.method public W3(Ll/ugd0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/oo2;->S(Ll/ugd0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ogd0;->r0(Ll/ugd0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Y3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->I0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ogd0;->t1(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a4(Ll/xcd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->R0()Z

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

.method public final synthetic b4(Ll/bgd0;)Ll/agd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->E0()Ll/agd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic c4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->u0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->h1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f4(Ll/t35;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/ogd0;->m1(Z)Ll/pf60;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic g4(Ll/npc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->C0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5j;->i:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ogd0;->q0(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
