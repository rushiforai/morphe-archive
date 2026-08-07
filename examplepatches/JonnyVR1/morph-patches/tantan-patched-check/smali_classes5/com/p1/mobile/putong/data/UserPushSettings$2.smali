.class Lcom/p1/mobile/putong/data/UserPushSettings$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserPushSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/UserPushSettings;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserPushSettings$2;->newInstance()Lcom/p1/mobile/putong/data/UserPushSettings;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/UserPushSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/UserPushSettings;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p4, 0x0

    .line 9
    const/4 p5, 0x1

    .line 10
    const/4 p6, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "superLikePush"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 p6, 0x16

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "showMomentLikes"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 p6, 0x15

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "anchorShowPush"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 p6, 0x14

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "momentCommentPush"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 p6, 0x13

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "officialPush"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 p6, 0x12

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "livePush"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 p6, 0x11

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "msgPush"

    .line 101
    .line 102
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 p6, 0x10

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "silentStartTime"

    .line 115
    .line 116
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-nez p0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 p6, 0xf

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "silentEndTime"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 p6, 0xe

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "previewMessage"

    .line 143
    .line 144
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-nez p0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 p6, 0xd

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "silentSwitch"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 p6, 0xc

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "newMatchPush"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-nez p0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 p6, 0xb

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "momentPush"

    .line 185
    .line 186
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-nez p0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 p6, 0xa

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "systemPush"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-nez p0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 p6, 0x9

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "momentFollowPush"

    .line 213
    .line 214
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 p6, 0x8

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "momentLikePush"

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-nez p0, :cond_f

    .line 233
    .line 234
    goto :goto_0

    .line 235
    :cond_f
    const/4 p6, 0x7

    .line 236
    goto :goto_0

    .line 237
    :sswitch_10
    const-string p0, "friendNewMomentPush"

    .line 238
    .line 239
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    if-nez p0, :cond_10

    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_10
    const/4 p6, 0x6

    .line 247
    goto :goto_0

    .line 248
    :sswitch_11
    const-string p0, "messagePush"

    .line 249
    .line 250
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    if-nez p0, :cond_11

    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_11
    const/4 p6, 0x5

    .line 258
    goto :goto_0

    .line 259
    :sswitch_12
    const-string p0, "allPush"

    .line 260
    .line 261
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    if-nez p0, :cond_12

    .line 266
    .line 267
    goto :goto_0

    .line 268
    :cond_12
    const/4 p6, 0x4

    .line 269
    goto :goto_0

    .line 270
    :sswitch_13
    const-string p0, "recommendPush"

    .line 271
    .line 272
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    if-nez p0, :cond_13

    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_13
    const/4 p6, 0x3

    .line 280
    goto :goto_0

    .line 281
    :sswitch_14
    const-string p0, "anchorRecommendPush"

    .line 282
    .line 283
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    if-nez p0, :cond_14

    .line 288
    .line 289
    goto :goto_0

    .line 290
    :cond_14
    const/4 p6, 0x2

    .line 291
    goto :goto_0

    .line 292
    :sswitch_15
    const-string p0, "voiceLivePush"

    .line 293
    .line 294
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result p0

    .line 298
    if-nez p0, :cond_15

    .line 299
    .line 300
    goto :goto_0

    .line 301
    :cond_15
    move p6, p5

    .line 302
    goto :goto_0

    .line 303
    :sswitch_16
    const-string p0, "soundPush"

    .line 304
    .line 305
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    if-nez p0, :cond_16

    .line 310
    .line 311
    goto :goto_0

    .line 312
    :cond_16
    move p6, p4

    .line 313
    :goto_0
    const/4 p0, 0x0

    .line 314
    packed-switch p6, :pswitch_data_0

    .line 315
    .line 316
    .line 317
    return p4

    .line 318
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 319
    .line 320
    .line 321
    move-result-object p2

    .line 322
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 323
    .line 324
    if-ne p2, p4, :cond_17

    .line 325
    .line 326
    goto :goto_1

    .line 327
    :cond_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 328
    .line 329
    .line 330
    move-result p0

    .line 331
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 336
    .line 337
    return p5

    .line 338
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 339
    .line 340
    .line 341
    move-result-object p2

    .line 342
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 343
    .line 344
    if-ne p2, p4, :cond_18

    .line 345
    .line 346
    goto :goto_2

    .line 347
    :cond_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 348
    .line 349
    .line 350
    move-result p0

    .line 351
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    :goto_2
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 356
    .line 357
    return p5

    .line 358
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 359
    .line 360
    .line 361
    move-result-object p2

    .line 362
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 363
    .line 364
    if-ne p2, p4, :cond_19

    .line 365
    .line 366
    goto :goto_3

    .line 367
    :cond_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 368
    .line 369
    .line 370
    move-result p0

    .line 371
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    :goto_3
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 376
    .line 377
    return p5

    .line 378
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 379
    .line 380
    .line 381
    move-result-object p2

    .line 382
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 383
    .line 384
    if-ne p2, p4, :cond_1a

    .line 385
    .line 386
    goto :goto_4

    .line 387
    :cond_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    :goto_4
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 396
    .line 397
    return p5

    .line 398
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 399
    .line 400
    .line 401
    move-result-object p2

    .line 402
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 403
    .line 404
    if-ne p2, p4, :cond_1b

    .line 405
    .line 406
    goto :goto_5

    .line 407
    :cond_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 412
    .line 413
    .line 414
    move-result-object p0

    .line 415
    :goto_5
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 416
    .line 417
    return p5

    .line 418
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 419
    .line 420
    .line 421
    move-result-object p2

    .line 422
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 423
    .line 424
    if-ne p2, p4, :cond_1c

    .line 425
    .line 426
    goto :goto_6

    .line 427
    :cond_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 428
    .line 429
    .line 430
    move-result p0

    .line 431
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    :goto_6
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 436
    .line 437
    return p5

    .line 438
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 439
    .line 440
    .line 441
    move-result-object p2

    .line 442
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 443
    .line 444
    if-ne p2, p4, :cond_1d

    .line 445
    .line 446
    goto :goto_7

    .line 447
    :cond_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 448
    .line 449
    .line 450
    move-result p0

    .line 451
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    :goto_7
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 456
    .line 457
    return p5

    .line 458
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 459
    .line 460
    .line 461
    move-result-object p2

    .line 462
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 463
    .line 464
    if-ne p2, p4, :cond_1e

    .line 465
    .line 466
    goto :goto_8

    .line 467
    :cond_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 468
    .line 469
    .line 470
    move-result p0

    .line 471
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 472
    .line 473
    .line 474
    move-result-object p0

    .line 475
    :goto_8
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 476
    .line 477
    return p5

    .line 478
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 479
    .line 480
    .line 481
    move-result-object p2

    .line 482
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 483
    .line 484
    if-ne p2, p4, :cond_1f

    .line 485
    .line 486
    goto :goto_9

    .line 487
    :cond_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 488
    .line 489
    .line 490
    move-result p0

    .line 491
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 492
    .line 493
    .line 494
    move-result-object p0

    .line 495
    :goto_9
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 496
    .line 497
    return p5

    .line 498
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 499
    .line 500
    .line 501
    move-result-object p2

    .line 502
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 503
    .line 504
    if-ne p2, p4, :cond_20

    .line 505
    .line 506
    goto :goto_a

    .line 507
    :cond_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 508
    .line 509
    .line 510
    move-result p0

    .line 511
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    :goto_a
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 516
    .line 517
    return p5

    .line 518
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 519
    .line 520
    .line 521
    move-result-object p2

    .line 522
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 523
    .line 524
    if-ne p2, p4, :cond_21

    .line 525
    .line 526
    goto :goto_b

    .line 527
    :cond_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 528
    .line 529
    .line 530
    move-result p0

    .line 531
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 532
    .line 533
    .line 534
    move-result-object p0

    .line 535
    :goto_b
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 536
    .line 537
    return p5

    .line 538
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 539
    .line 540
    .line 541
    move-result-object p2

    .line 542
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 543
    .line 544
    if-ne p2, p4, :cond_22

    .line 545
    .line 546
    goto :goto_c

    .line 547
    :cond_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 548
    .line 549
    .line 550
    move-result p0

    .line 551
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 552
    .line 553
    .line 554
    move-result-object p0

    .line 555
    :goto_c
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 556
    .line 557
    return p5

    .line 558
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 559
    .line 560
    .line 561
    move-result-object p2

    .line 562
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 563
    .line 564
    if-ne p2, p4, :cond_23

    .line 565
    .line 566
    goto :goto_d

    .line 567
    :cond_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 568
    .line 569
    .line 570
    move-result p0

    .line 571
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 572
    .line 573
    .line 574
    move-result-object p0

    .line 575
    :goto_d
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 576
    .line 577
    return p5

    .line 578
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 579
    .line 580
    .line 581
    move-result-object p2

    .line 582
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 583
    .line 584
    if-ne p2, p4, :cond_24

    .line 585
    .line 586
    goto :goto_e

    .line 587
    :cond_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 588
    .line 589
    .line 590
    move-result p0

    .line 591
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 592
    .line 593
    .line 594
    move-result-object p0

    .line 595
    :goto_e
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 596
    .line 597
    return p5

    .line 598
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 599
    .line 600
    .line 601
    move-result-object p2

    .line 602
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 603
    .line 604
    if-ne p2, p4, :cond_25

    .line 605
    .line 606
    goto :goto_f

    .line 607
    :cond_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 608
    .line 609
    .line 610
    move-result p0

    .line 611
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    :goto_f
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 616
    .line 617
    return p5

    .line 618
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 619
    .line 620
    .line 621
    move-result-object p2

    .line 622
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 623
    .line 624
    if-ne p2, p4, :cond_26

    .line 625
    .line 626
    goto :goto_10

    .line 627
    :cond_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 628
    .line 629
    .line 630
    move-result p0

    .line 631
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 632
    .line 633
    .line 634
    move-result-object p0

    .line 635
    :goto_10
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 636
    .line 637
    return p5

    .line 638
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 639
    .line 640
    .line 641
    move-result-object p2

    .line 642
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 643
    .line 644
    if-ne p2, p4, :cond_27

    .line 645
    .line 646
    goto :goto_11

    .line 647
    :cond_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 648
    .line 649
    .line 650
    move-result p0

    .line 651
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 652
    .line 653
    .line 654
    move-result-object p0

    .line 655
    :goto_11
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 656
    .line 657
    return p5

    .line 658
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 659
    .line 660
    .line 661
    move-result-object p2

    .line 662
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 663
    .line 664
    if-ne p2, p4, :cond_28

    .line 665
    .line 666
    goto :goto_12

    .line 667
    :cond_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 668
    .line 669
    .line 670
    move-result p0

    .line 671
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 672
    .line 673
    .line 674
    move-result-object p0

    .line 675
    :goto_12
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 676
    .line 677
    return p5

    .line 678
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 679
    .line 680
    .line 681
    move-result-object p2

    .line 682
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 683
    .line 684
    if-ne p2, p4, :cond_29

    .line 685
    .line 686
    goto :goto_13

    .line 687
    :cond_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 688
    .line 689
    .line 690
    move-result p0

    .line 691
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 692
    .line 693
    .line 694
    move-result-object p0

    .line 695
    :goto_13
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 696
    .line 697
    return p5

    .line 698
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 699
    .line 700
    .line 701
    move-result-object p2

    .line 702
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 703
    .line 704
    if-ne p2, p4, :cond_2a

    .line 705
    .line 706
    goto :goto_14

    .line 707
    :cond_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 708
    .line 709
    .line 710
    move-result p0

    .line 711
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 712
    .line 713
    .line 714
    move-result-object p0

    .line 715
    :goto_14
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 716
    .line 717
    return p5

    .line 718
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 719
    .line 720
    .line 721
    move-result-object p2

    .line 722
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 723
    .line 724
    if-ne p2, p4, :cond_2b

    .line 725
    .line 726
    goto :goto_15

    .line 727
    :cond_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 728
    .line 729
    .line 730
    move-result p0

    .line 731
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 732
    .line 733
    .line 734
    move-result-object p0

    .line 735
    :goto_15
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 736
    .line 737
    return p5

    .line 738
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 739
    .line 740
    .line 741
    move-result-object p2

    .line 742
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 743
    .line 744
    if-ne p2, p4, :cond_2c

    .line 745
    .line 746
    goto :goto_16

    .line 747
    :cond_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 748
    .line 749
    .line 750
    move-result p0

    .line 751
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 752
    .line 753
    .line 754
    move-result-object p0

    .line 755
    :goto_16
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 756
    .line 757
    return p5

    .line 758
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 759
    .line 760
    .line 761
    move-result-object p2

    .line 762
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 763
    .line 764
    if-ne p2, p4, :cond_2d

    .line 765
    .line 766
    goto :goto_17

    .line 767
    :cond_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 768
    .line 769
    .line 770
    move-result p0

    .line 771
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 772
    .line 773
    .line 774
    move-result-object p0

    .line 775
    :goto_17
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 776
    .line 777
    return p5

    .line 778
    nop

    .line 779
    :sswitch_data_0
    .sparse-switch
        -0x6c0a3337 -> :sswitch_16
        -0x58078e88 -> :sswitch_15
        -0x505b4ebf -> :sswitch_14
        -0x44128a0a -> :sswitch_13
        -0x36601ba5 -> :sswitch_12
        -0x340c383f -> :sswitch_11
        -0xefb8704 -> :sswitch_10
        0x7411571 -> :sswitch_f
        0xa52fc8b -> :sswitch_e
        0x264fe5e9 -> :sswitch_d
        0x28e4a53a -> :sswitch_c
        0x36bcdcbf -> :sswitch_b
        0x440ae3e9 -> :sswitch_a
        0x48d0631f -> :sswitch_9
        0x4909d433 -> :sswitch_8
        0x4df9257a -> :sswitch_7
        0x5016223b -> :sswitch_6
        0x547e7e26 -> :sswitch_5
        0x589b50a5 -> :sswitch_4
        0x5f14aff9 -> :sswitch_3
        0x69e9d98c -> :sswitch_2
        0x74ea0e5f -> :sswitch_1
        0x7a2157ec -> :sswitch_0
    .end sparse-switch

    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    .line 864
    .line 865
    .line 866
    .line 867
    .line 868
    .line 869
    .line 870
    .line 871
    .line 872
    .line 873
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
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

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 779
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/UserPushSettings$2;->parseField(Lcom/p1/mobile/putong/data/UserPushSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/UserPushSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/UserPushSettings;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "superLikePush"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0x16

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "showMomentLikes"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x15

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "anchorShowPush"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0x14

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "momentCommentPush"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x13

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "officialPush"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0x12

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "livePush"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0x11

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "msgPush"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0x10

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "silentStartTime"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0xf

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "silentEndTime"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0xe

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "previewMessage"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0xd

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "silentSwitch"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    const/16 v2, 0xc

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "newMatchPush"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_b

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    const/16 v2, 0xb

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "momentPush"

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    const/16 v2, 0xa

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "systemPush"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_d
    const/16 v2, 0x9

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "momentFollowPush"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_e

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_e
    const/16 v2, 0x8

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "momentLikePush"

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_f

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_f
    const/4 v2, 0x7

    .line 235
    goto :goto_0

    .line 236
    :sswitch_10
    const-string v0, "friendNewMomentPush"

    .line 237
    .line 238
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-nez v0, :cond_10

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_10
    const/4 v2, 0x6

    .line 246
    goto :goto_0

    .line 247
    :sswitch_11
    const-string v0, "messagePush"

    .line 248
    .line 249
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_11

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_11
    const/4 v2, 0x5

    .line 257
    goto :goto_0

    .line 258
    :sswitch_12
    const-string v0, "allPush"

    .line 259
    .line 260
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_12

    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_12
    const/4 v2, 0x4

    .line 268
    goto :goto_0

    .line 269
    :sswitch_13
    const-string v0, "recommendPush"

    .line 270
    .line 271
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-nez v0, :cond_13

    .line 276
    .line 277
    goto :goto_0

    .line 278
    :cond_13
    const/4 v2, 0x3

    .line 279
    goto :goto_0

    .line 280
    :sswitch_14
    const-string v0, "anchorRecommendPush"

    .line 281
    .line 282
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_14

    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_14
    const/4 v2, 0x2

    .line 290
    goto :goto_0

    .line 291
    :sswitch_15
    const-string v0, "voiceLivePush"

    .line 292
    .line 293
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_15

    .line 298
    .line 299
    goto :goto_0

    .line 300
    :cond_15
    move v2, v1

    .line 301
    goto :goto_0

    .line 302
    :sswitch_16
    const-string v0, "soundPush"

    .line 303
    .line 304
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_16

    .line 309
    .line 310
    goto :goto_0

    .line 311
    :cond_16
    const/4 v2, 0x0

    .line 312
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 313
    .line 314
    .line 315
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    return p0

    .line 320
    :pswitch_0
    return v1

    .line 321
    :sswitch_data_0
    .sparse-switch
        -0x6c0a3337 -> :sswitch_16
        -0x58078e88 -> :sswitch_15
        -0x505b4ebf -> :sswitch_14
        -0x44128a0a -> :sswitch_13
        -0x36601ba5 -> :sswitch_12
        -0x340c383f -> :sswitch_11
        -0xefb8704 -> :sswitch_10
        0x7411571 -> :sswitch_f
        0xa52fc8b -> :sswitch_e
        0x264fe5e9 -> :sswitch_d
        0x28e4a53a -> :sswitch_c
        0x36bcdcbf -> :sswitch_b
        0x440ae3e9 -> :sswitch_a
        0x48d0631f -> :sswitch_9
        0x4909d433 -> :sswitch_8
        0x4df9257a -> :sswitch_7
        0x5016223b -> :sswitch_6
        0x547e7e26 -> :sswitch_5
        0x589b50a5 -> :sswitch_4
        0x5f14aff9 -> :sswitch_3
        0x69e9d98c -> :sswitch_2
        0x74ea0e5f -> :sswitch_1
        0x7a2157ec -> :sswitch_0
    .end sparse-switch

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
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 321
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/UserPushSettings$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/UserPushSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/UserPushSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "anchorRecommendPush"

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string v0, "anchorShowPush"

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v0, "friendNewMomentPush"

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    const-string v0, "messagePush"

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const-string v0, "momentCommentPush"

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 67
    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    const-string v0, "momentFollowPush"

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 77
    .line 78
    .line 79
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-eqz p0, :cond_6

    .line 82
    .line 83
    const-string v0, "momentLikePush"

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    const-string v0, "newMatchPush"

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 103
    .line 104
    .line 105
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 106
    .line 107
    if-eqz p0, :cond_8

    .line 108
    .line 109
    const-string v0, "officialPush"

    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 116
    .line 117
    .line 118
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 119
    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    const-string v0, "previewMessage"

    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 129
    .line 130
    .line 131
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 132
    .line 133
    if-eqz p0, :cond_a

    .line 134
    .line 135
    const-string v0, "showMomentLikes"

    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 142
    .line 143
    .line 144
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 145
    .line 146
    if-eqz p0, :cond_b

    .line 147
    .line 148
    const-string v0, "soundPush"

    .line 149
    .line 150
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 158
    .line 159
    if-eqz p0, :cond_c

    .line 160
    .line 161
    const-string v0, "superLikePush"

    .line 162
    .line 163
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 168
    .line 169
    .line 170
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 171
    .line 172
    if-eqz p0, :cond_d

    .line 173
    .line 174
    const-string v0, "msgPush"

    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 181
    .line 182
    .line 183
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 184
    .line 185
    if-eqz p0, :cond_e

    .line 186
    .line 187
    const-string v0, "recommendPush"

    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 194
    .line 195
    .line 196
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 197
    .line 198
    if-eqz p0, :cond_f

    .line 199
    .line 200
    const-string v0, "momentPush"

    .line 201
    .line 202
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 207
    .line 208
    .line 209
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 210
    .line 211
    if-eqz p0, :cond_10

    .line 212
    .line 213
    const-string v0, "livePush"

    .line 214
    .line 215
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 220
    .line 221
    .line 222
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 223
    .line 224
    if-eqz p0, :cond_11

    .line 225
    .line 226
    const-string v0, "systemPush"

    .line 227
    .line 228
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 233
    .line 234
    .line 235
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 236
    .line 237
    if-eqz p0, :cond_12

    .line 238
    .line 239
    const-string v0, "silentSwitch"

    .line 240
    .line 241
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 246
    .line 247
    .line 248
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 249
    .line 250
    if-eqz p0, :cond_13

    .line 251
    .line 252
    const-string v0, "voiceLivePush"

    .line 253
    .line 254
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 259
    .line 260
    .line 261
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 262
    .line 263
    if-eqz p0, :cond_14

    .line 264
    .line 265
    const-string v0, "silentEndTime"

    .line 266
    .line 267
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 272
    .line 273
    .line 274
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 275
    .line 276
    if-eqz p0, :cond_15

    .line 277
    .line 278
    const-string v0, "silentStartTime"

    .line 279
    .line 280
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 285
    .line 286
    .line 287
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 288
    .line 289
    if-eqz p0, :cond_16

    .line 290
    .line 291
    const-string p1, "allPush"

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 294
    .line 295
    .line 296
    move-result p0

    .line 297
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 298
    .line 299
    .line 300
    :cond_16
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 301
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserPushSettings$2;->serializeFields(Lcom/p1/mobile/putong/data/UserPushSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
