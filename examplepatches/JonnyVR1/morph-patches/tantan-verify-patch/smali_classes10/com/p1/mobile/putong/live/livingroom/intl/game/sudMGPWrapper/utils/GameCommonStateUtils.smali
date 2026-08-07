.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/GameCommonStateUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static i18nPrecise(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "zh-TW"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0x11

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "zh-SG"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0x10

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "zh-MO"

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v1, 0xf

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :sswitch_3
    const-string v0, "zh-HK"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_3
    const/16 v1, 0xe

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :sswitch_4
    const-string v0, "zh-CN"

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_4

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_4
    const/16 v1, 0xd

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :sswitch_5
    const-string v0, "vi-VN"

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_5

    .line 91
    .line 92
    goto/16 :goto_0

    .line 93
    .line 94
    :cond_5
    const/16 v1, 0xc

    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :sswitch_6
    const-string v0, "ur-PK"

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_6

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_6
    const/16 v1, 0xb

    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :sswitch_7
    const-string v0, "tr-TR"

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_7

    .line 119
    .line 120
    goto/16 :goto_0

    .line 121
    .line 122
    :cond_7
    const/16 v1, 0xa

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :sswitch_8
    const-string v0, "th-TH"

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-nez p0, :cond_8

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_8
    const/16 v1, 0x9

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_9
    const-string v0, "ms-MY"

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-nez p0, :cond_9

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_9
    const/16 v1, 0x8

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_a
    const-string v0, "ms-BN"

    .line 155
    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    if-nez p0, :cond_a

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_a
    const/4 v1, 0x7

    .line 164
    goto :goto_0

    .line 165
    :sswitch_b
    const-string v0, "ko-KR"

    .line 166
    .line 167
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-nez p0, :cond_b

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_b
    const/4 v1, 0x6

    .line 175
    goto :goto_0

    .line 176
    :sswitch_c
    const-string v0, "ja-JP"

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    if-nez p0, :cond_c

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_c
    const/4 v1, 0x5

    .line 186
    goto :goto_0

    .line 187
    :sswitch_d
    const-string v0, "id-ID"

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-nez p0, :cond_d

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_d
    const/4 v1, 0x4

    .line 197
    goto :goto_0

    .line 198
    :sswitch_e
    const-string v0, "es-ES"

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-nez p0, :cond_e

    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_e
    const/4 v1, 0x3

    .line 208
    goto :goto_0

    .line 209
    :sswitch_f
    const-string v0, "en-US"

    .line 210
    .line 211
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-nez p0, :cond_f

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_f
    const/4 v1, 0x2

    .line 219
    goto :goto_0

    .line 220
    :sswitch_10
    const-string v0, "en-GB"

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-nez p0, :cond_10

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_10
    const/4 v1, 0x1

    .line 230
    goto :goto_0

    .line 231
    :sswitch_11
    const-string v0, "ar-SA"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-nez p0, :cond_11

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_11
    const/4 v1, 0x0

    .line 241
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 242
    .line 243
    .line 244
    const/4 p0, 0x0

    .line 245
    return-object p0

    .line 246
    :pswitch_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_TW:Ljava/lang/String;

    .line 247
    .line 248
    return-object p0

    .line 249
    :pswitch_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_SG:Ljava/lang/String;

    .line 250
    .line 251
    return-object p0

    .line 252
    :pswitch_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_MO:Ljava/lang/String;

    .line 253
    .line 254
    return-object p0

    .line 255
    :pswitch_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_HK:Ljava/lang/String;

    .line 256
    .line 257
    return-object p0

    .line 258
    :pswitch_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_CN:Ljava/lang/String;

    .line 259
    .line 260
    return-object p0

    .line 261
    :pswitch_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->vi_VN:Ljava/lang/String;

    .line 262
    .line 263
    return-object p0

    .line 264
    :pswitch_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ur_PK:Ljava/lang/String;

    .line 265
    .line 266
    return-object p0

    .line 267
    :pswitch_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->tr_TR:Ljava/lang/String;

    .line 268
    .line 269
    return-object p0

    .line 270
    :pswitch_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->th_TH:Ljava/lang/String;

    .line 271
    .line 272
    return-object p0

    .line 273
    :pswitch_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ms_MY:Ljava/lang/String;

    .line 274
    .line 275
    return-object p0

    .line 276
    :pswitch_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ms_BN:Ljava/lang/String;

    .line 277
    .line 278
    return-object p0

    .line 279
    :pswitch_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ko_KR:Ljava/lang/String;

    .line 280
    .line 281
    return-object p0

    .line 282
    :pswitch_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ja_JP:Ljava/lang/String;

    .line 283
    .line 284
    return-object p0

    .line 285
    :pswitch_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->id_ID:Ljava/lang/String;

    .line 286
    .line 287
    return-object p0

    .line 288
    :pswitch_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->es_ES:Ljava/lang/String;

    .line 289
    .line 290
    return-object p0

    .line 291
    :pswitch_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->en_US:Ljava/lang/String;

    .line 292
    .line 293
    return-object p0

    .line 294
    :pswitch_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->en_GB:Ljava/lang/String;

    .line 295
    .line 296
    return-object p0

    .line 297
    :pswitch_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->ar_SA:Ljava/lang/String;

    .line 298
    .line 299
    return-object p0

    .line 300
    nop

    .line 301
    :sswitch_data_0
    .sparse-switch
        0x58b6d6a -> :sswitch_11
        0x5c1f87f -> :sswitch_10
        0x5c1fa42 -> :sswitch_f
        0x5c43e2d -> :sswitch_e
        0x5f5cb0d -> :sswitch_d
        0x602859c -> :sswitch_c
        0x616fa70 -> :sswitch_b
        0x634f9d3 -> :sswitch_a
        0x634fb33 -> :sswitch_9
        0x692a06d -> :sswitch_8
        0x6972c2d -> :sswitch_7
        0x6a5432b -> :sswitch_6
        0x6af4412 -> :sswitch_5
        0x6e72b6a -> :sswitch_4
        0x6e72c02 -> :sswitch_3
        0x6e72ca1 -> :sswitch_2
        0x6e72d53 -> :sswitch_1
        0x6e72d82 -> :sswitch_0
    .end sparse-switch

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
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
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

.method private static isMatchLanguage(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    const-string v1, "-"

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return v0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_2
    return v0
.end method

.method public static parseI18nText(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    if-nez p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->defaultStr:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/GameCommonStateUtils;->i18nPrecise(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    const-string v0, "zh"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/GameCommonStateUtils;->isMatchLanguage(Ljava/lang/String;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->zh_CN:Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;->en_US:Ljava/lang/String;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    return-object v0
.end method

.method public static parseMGCommonPublicMessage(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    if-eqz p0, :cond_5

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;->msg:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;->msg:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_4

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsg;

    .line 36
    .line 37
    iget v2, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsg;->phrase:I

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    if-eq v2, v3, :cond_3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    if-eq v2, v3, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsg;->user:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgUser;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgUser;->name:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsg;->text:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;

    .line 59
    .line 60
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/GameCommonStateUtils;->parseI18nText(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage$MGCommonPublicMessageMsgText;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_5
    :goto_1
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method
