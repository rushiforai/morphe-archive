.class public Ll/ntm0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/qrm0<",
            "*>;>;"
        }
    .end annotation
.end field

.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/qrm0<",
            "*>;>;"
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
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ntm0;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ntm0;->j:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/ntm0;Ll/qrm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ntm0;->N3(Ll/qrm0;)V

    return-void
.end method


# virtual methods
.method public K3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ntm0;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/mtm0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/mtm0;-><init>(Ll/ntm0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public L3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            "Ljava/lang/String;",
            ")",
            "Ll/qrm0<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ntm0;->i:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/qrm0;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/ntm0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/qrm0;->f4()Ll/qct;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/qrm0;->f4()Ll/qct;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-interface {v2, p2}, Ll/jc3;->C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2}, Ll/qrm0;->f4()Ll/qct;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0, v2}, Ll/l6t;->C2(Ll/l6t;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/ntm0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/qrm0;->f4()Ll/qct;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iput-object p1, v2, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    iput-object p1, v2, Ll/qrm0;->o:Ll/ic3;

    .line 66
    .line 67
    :cond_2
    :goto_0
    if-eqz v2, :cond_3

    .line 68
    .line 69
    iget-object p0, p0, Ll/ntm0;->j:Ljava/util/HashMap;

    .line 70
    .line 71
    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    :cond_3
    return-object v2
.end method

.method public final M3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            "Ljava/lang/String;",
            ")",
            "Ll/qrm0<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v0, "luckyParadiseV2"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    const/16 v1, 0xc

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_1
    const-string v0, "intlGamePanel"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_1
    const/16 v1, 0xb

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :sswitch_2
    const-string v0, "callButton"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_2
    const/16 v1, 0xa

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :sswitch_3
    const-string v0, "onCallPk"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :cond_3
    const/16 v1, 0x9

    .line 71
    .line 72
    goto/16 :goto_0

    .line 73
    .line 74
    :sswitch_4
    const-string v0, "setRoomBg"

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :cond_4
    const/16 v1, 0x8

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :sswitch_5
    const-string v0, "mute"

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    const/4 v1, 0x7

    .line 98
    goto :goto_0

    .line 99
    :sswitch_6
    const-string v0, "gameLib"

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_6

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    const/4 v1, 0x6

    .line 109
    goto :goto_0

    .line 110
    :sswitch_7
    const-string v0, "unknown_"

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_7

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_7
    const/4 v1, 0x5

    .line 120
    goto :goto_0

    .line 121
    :sswitch_8
    const-string v0, "giftButton"

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_8

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_8
    const/4 v1, 0x4

    .line 131
    goto :goto_0

    .line 132
    :sswitch_9
    const-string v0, "emojiPlayPanel"

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-nez p1, :cond_9

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_9
    const/4 v1, 0x3

    .line 142
    goto :goto_0

    .line 143
    :sswitch_a
    const-string v0, "fastGiftButton"

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-nez p1, :cond_a

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_a
    const/4 v1, 0x2

    .line 153
    goto :goto_0

    .line 154
    :sswitch_b
    const-string v0, "lt_funFair"

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-nez p1, :cond_b

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_b
    const/4 v1, 0x1

    .line 164
    goto :goto_0

    .line 165
    :sswitch_c
    const-string v0, "settingButton"

    .line 166
    .line 167
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_c

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_c
    const/4 v1, 0x0

    .line 175
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 176
    .line 177
    .line 178
    const/4 p0, 0x0

    .line 179
    return-object p0

    .line 180
    :pswitch_0
    new-instance p1, Ll/nhw;

    .line 181
    .line 182
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 183
    .line 184
    invoke-direct {p1, p0, p2, p3}, Ll/nhw;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 185
    .line 186
    .line 187
    return-object p1

    .line 188
    :pswitch_1
    new-instance p1, Ll/cwp;

    .line 189
    .line 190
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 191
    .line 192
    invoke-direct {p1, p0, p2, p3}, Ll/cwp;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 193
    .line 194
    .line 195
    return-object p1

    .line 196
    :pswitch_2
    new-instance p1, Ll/ol0;

    .line 197
    .line 198
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 199
    .line 200
    invoke-direct {p1, p0, p2, p3}, Ll/ol0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 201
    .line 202
    .line 203
    return-object p1

    .line 204
    :pswitch_3
    new-instance p1, Ll/bc2;

    .line 205
    .line 206
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 207
    .line 208
    invoke-direct {p1, p0, p2, p3}, Ll/bc2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 209
    .line 210
    .line 211
    return-object p1

    .line 212
    :pswitch_4
    new-instance p1, Ll/c1n0;

    .line 213
    .line 214
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 215
    .line 216
    invoke-direct {p1, p0, p2, p3}, Ll/c1n0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 217
    .line 218
    .line 219
    return-object p1

    .line 220
    :pswitch_5
    new-instance p1, Ll/boj;

    .line 221
    .line 222
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 223
    .line 224
    invoke-direct {p1, p0, p2, p3}, Ll/boj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 225
    .line 226
    .line 227
    return-object p1

    .line 228
    :pswitch_6
    new-instance p1, Ll/oan0;

    .line 229
    .line 230
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 231
    .line 232
    invoke-direct {p1, p0, p2, p3}, Ll/oan0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 233
    .line 234
    .line 235
    return-object p1

    .line 236
    :pswitch_7
    new-instance p1, Ll/sjg;

    .line 237
    .line 238
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 239
    .line 240
    invoke-direct {p1, p0, p2, p3}, Ll/sjg;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 241
    .line 242
    .line 243
    return-object p1

    .line 244
    :pswitch_8
    new-instance p1, Ll/ocj;

    .line 245
    .line 246
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 247
    .line 248
    invoke-direct {p1, p0, p2, p3}, Ll/ocj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 249
    .line 250
    .line 251
    return-object p1

    .line 252
    :pswitch_9
    new-instance p1, Ll/cso0;

    .line 253
    .line 254
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 255
    .line 256
    invoke-direct {p1, p0, p2, p3, p4}, Ll/cso0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    return-object p1

    .line 260
    nop

    .line 261
    :sswitch_data_0
    .sparse-switch
        -0x7669da5e -> :sswitch_c
        -0x53e05274 -> :sswitch_b
        -0x51cc3602 -> :sswitch_a
        -0x20300276 -> :sswitch_9
        -0x1310277e -> :sswitch_8
        -0xe5022ab -> :sswitch_7
        -0xba8fecd -> :sswitch_6
        0x335219 -> :sswitch_5
        0x21251582 -> :sswitch_4
        0x3d6e3bb8 -> :sswitch_3
        0x41bbcf30 -> :sswitch_2
        0x5af20755 -> :sswitch_1
        0x79f7ff5b -> :sswitch_0
    .end sparse-switch

    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic N3(Ll/qrm0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/qrm0;->f4()Ll/qct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/qrm0;->f4()Ll/qct;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C2(Ll/l6t;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public O3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ntm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    iput-object v0, p0, Ll/ntm0;->i:Ljava/util/HashMap;

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ntm0;->j:Ljava/util/HashMap;

    .line 11
    .line 12
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ntm0;->i:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ntm0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
