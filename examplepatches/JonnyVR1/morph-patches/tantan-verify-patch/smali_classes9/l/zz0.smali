.class public Ll/zz0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ll/et3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/zz0;Ll/q35;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zz0;->P3(Ll/q35;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/et3;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/et3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/16 p0, -0x6f

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic L3(Ll/zz0;Ll/et3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zz0;->R3(Ll/et3;)V

    return-void
.end method

.method public static synthetic M3(Ll/et3;)Ll/et3;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public N3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

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
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/vz0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/vz0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final O3(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/et3;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wz0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wz0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/xz0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/xz0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/zz0;->i:Ljava/util/HashMap;

    .line 16
    .line 17
    new-instance p1, Ll/yz0;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/yz0;-><init>(Ll/zz0;)V

    .line 20
    .line 21
    .line 22
    const-class v0, Ll/q35;

    .line 23
    .line 24
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic P3(Ll/q35;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz0;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    iget p1, p1, Ll/q35;->c:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

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

.method public final R3(Ll/et3;)V
    .locals 8

    .line 1
    iget-object v2, p1, Ll/et3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget v3, p1, Ll/et3;->b:I

    .line 4
    .line 5
    iget v4, p1, Ll/et3;->c:I

    .line 6
    .line 7
    iget-object v5, p1, Ll/et3;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v6, p1, Ll/et3;->e:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, -0x1

    .line 25
    sparse-switch v0, :sswitch_data_0

    .line 26
    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_0
    const-string v0, "magicGesture"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_0
    const/16 v1, 0xe

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_1
    const-string v0, "blackList"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_1
    const/16 v1, 0xd

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_2
    const-string v0, "callButton"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_2
    const/16 v1, 0xc

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_3
    const-string v0, "switchCamera"

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_3

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_3
    const/16 v1, 0xb

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_4
    const-string v0, "firstRechargeButton"

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_4

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_4
    const/16 v1, 0xa

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_5
    const-string v0, "summonFans"

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_5

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_5
    const/16 v1, 0x9

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_6
    const-string v0, "unknown_"

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_6

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_6
    const/16 v1, 0x8

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_7
    const-string v0, "signIn"

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-nez p1, :cond_7

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_7
    const/4 v1, 0x7

    .line 138
    goto :goto_0

    .line 139
    :sswitch_8
    const-string v0, "beauty"

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_8

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_8
    const/4 v1, 0x6

    .line 149
    goto :goto_0

    .line 150
    :sswitch_9
    const-string v0, "chatManager"

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_9

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_9
    const/4 v1, 0x5

    .line 160
    goto :goto_0

    .line 161
    :sswitch_a
    const-string v0, "sticker"

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-nez p1, :cond_a

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_a
    const/4 v1, 0x4

    .line 171
    goto :goto_0

    .line 172
    :sswitch_b
    const-string v0, "giftResourceStatus"

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-nez p1, :cond_b

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_b
    const/4 v1, 0x3

    .line 182
    goto :goto_0

    .line 183
    :sswitch_c
    const-string v0, "guideGift"

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-nez p1, :cond_c

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_c
    const/4 v1, 0x2

    .line 193
    goto :goto_0

    .line 194
    :sswitch_d
    const-string v0, "lotteryGiftRedpacket"

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_d

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_d
    const/4 v1, 0x1

    .line 204
    goto :goto_0

    .line 205
    :sswitch_e
    const-string v0, "shootGame"

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-nez p1, :cond_e

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_e
    const/4 v1, 0x0

    .line 215
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :pswitch_0
    new-instance v0, Ll/au3;

    .line 220
    .line 221
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 222
    .line 223
    invoke-direct/range {v0 .. v6}, Ll/au3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_1
    new-instance v0, Ll/cs3;

    .line 231
    .line 232
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 233
    .line 234
    invoke-direct/range {v0 .. v6}, Ll/cs3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :pswitch_2
    new-instance v0, Ll/fs3;

    .line 242
    .line 243
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 244
    .line 245
    invoke-direct/range {v0 .. v6}, Ll/fs3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :pswitch_3
    new-instance v0, Ll/lu3;

    .line 253
    .line 254
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 255
    .line 256
    invoke-direct/range {v0 .. v6}, Ll/lu3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :pswitch_4
    new-instance v0, Ll/ws3;

    .line 264
    .line 265
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 266
    .line 267
    invoke-direct/range {v0 .. v6}, Ll/ws3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :pswitch_5
    new-instance v0, Ll/ku3;

    .line 275
    .line 276
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 277
    .line 278
    invoke-direct/range {v0 .. v6}, Ll/ku3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :pswitch_6
    new-instance v0, Ll/lx3;

    .line 286
    .line 287
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 288
    .line 289
    invoke-direct/range {v0 .. v6}, Ll/lx3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :pswitch_7
    new-instance v0, Ll/iu3;

    .line 297
    .line 298
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 299
    .line 300
    invoke-direct/range {v0 .. v6}, Ll/iu3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :pswitch_8
    new-instance v0, Ll/bs3;

    .line 308
    .line 309
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 310
    .line 311
    invoke-direct/range {v0 .. v6}, Ll/bs3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :pswitch_9
    new-instance v0, Ll/gs3;

    .line 319
    .line 320
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 321
    .line 322
    invoke-direct/range {v0 .. v6}, Ll/gs3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :pswitch_a
    new-instance v0, Ll/ju3;

    .line 330
    .line 331
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 332
    .line 333
    invoke-direct/range {v0 .. v6}, Ll/ju3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :pswitch_b
    new-instance v0, Ll/xs3;

    .line 341
    .line 342
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 343
    .line 344
    invoke-direct/range {v0 .. v6}, Ll/xs3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 348
    .line 349
    .line 350
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 351
    .line 352
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    check-cast p0, Ll/ifv;

    .line 357
    .line 358
    iget-object p0, p0, Ll/ifv;->l:Ll/jxd0;

    .line 359
    .line 360
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 361
    .line 362
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :pswitch_c
    new-instance v0, Ll/dt3;

    .line 367
    .line 368
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 369
    .line 370
    invoke-direct/range {v0 .. v6}, Ll/dt3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :pswitch_d
    new-instance v0, Ll/gt3;

    .line 378
    .line 379
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 380
    .line 381
    invoke-direct/range {v0 .. v6}, Ll/gt3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :pswitch_e
    new-instance v0, Ll/fu3;

    .line 389
    .line 390
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 391
    .line 392
    move-object v7, v6

    .line 393
    const/4 v6, 0x0

    .line 394
    invoke-direct/range {v0 .. v7}, Ll/fu3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 398
    .line 399
    .line 400
    return-void

    .line 401
    :sswitch_data_0
    .sparse-switch
        -0x7e05e34f -> :sswitch_e
        -0x7cc027c0 -> :sswitch_d
        -0x7bc9c5b4 -> :sswitch_c
        -0x7a3de110 -> :sswitch_b
        -0x70aaf6c3 -> :sswitch_a
        -0x58c0decb -> :sswitch_9
        -0x5307ef84 -> :sswitch_8
        -0x35ca943e -> :sswitch_7
        -0xe5022ab -> :sswitch_6
        0x4c53441 -> :sswitch_5
        0x2aaae389 -> :sswitch_4
        0x2db92f79 -> :sswitch_3
        0x41bbcf30 -> :sswitch_2
        0x4f659d3d -> :sswitch_1
        0x55bc7edc -> :sswitch_0
    .end sparse-switch

    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

.method public S3(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/et3;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/zz0;->O3(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Ll/htd0;->e:Ll/htd0;

    .line 5
    .line 6
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Ll/ifv;

    .line 11
    .line 12
    iget-object p2, p2, Ll/ifv;->l:Ll/jxd0;

    .line 13
    .line 14
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance p2, Ll/uz0;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Ll/uz0;-><init>(Ll/zz0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
