.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;",
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
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "settleMembers"

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
    const/16 v2, 0x1f

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "isSettled"

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
    const/16 v2, 0x1e

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "roomAttributes"

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
    const/16 v2, 0x1d

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "levelBgStartColor"

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
    const/16 v2, 0x1c

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "announcementStatus"

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
    const/16 v2, 0x1b

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "titleStatus"

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
    const/16 v2, 0x1a

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "publicRoomId"

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
    const/16 v2, 0x19

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "heatTitle"

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
    const/16 v2, 0x18

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "heatBgImg"

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
    const/16 v2, 0x17

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "announcement"

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
    const/16 v2, 0x16

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "title"

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
    const/16 v2, 0x15

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "stick"

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
    const/16 v2, 0x14

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "level"

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
    const/16 v2, 0x13

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "heat"

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
    const/16 v2, 0x12

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "identity"

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
    const/16 v2, 0x11

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "coverStatus"

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
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v2, 0x10

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "remindType"

    .line 241
    .line 242
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-nez p0, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v2, 0xf

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "debugText"

    .line 255
    .line 256
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    if-nez p0, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v2, 0xe

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "isPersonal"

    .line 269
    .line 270
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    if-nez p0, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v2, 0xd

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "coverUrl"

    .line 283
    .line 284
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    if-nez p0, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v2, 0xc

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "createdTime"

    .line 297
    .line 298
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    if-nez p0, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v2, 0xb

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "levelBgEndColor"

    .line 311
    .line 312
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v2, 0xa

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "freeSettle"

    .line 325
    .line 326
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result p0

    .line 330
    if-nez p0, :cond_16

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :cond_16
    const/16 v2, 0x9

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "roomId"

    .line 339
    .line 340
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    if-nez p0, :cond_17

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_17
    const/16 v2, 0x8

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "roomClass"

    .line 353
    .line 354
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    if-nez p0, :cond_18

    .line 359
    .line 360
    goto :goto_0

    .line 361
    :cond_18
    const/4 v2, 0x7

    .line 362
    goto :goto_0

    .line 363
    :sswitch_19
    const-string p0, "heatSvga"

    .line 364
    .line 365
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result p0

    .line 369
    if-nez p0, :cond_19

    .line 370
    .line 371
    goto :goto_0

    .line 372
    :cond_19
    const/4 v2, 0x6

    .line 373
    goto :goto_0

    .line 374
    :sswitch_1a
    const-string p0, "heatIcon"

    .line 375
    .line 376
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result p0

    .line 380
    if-nez p0, :cond_1a

    .line 381
    .line 382
    goto :goto_0

    .line 383
    :cond_1a
    const/4 v2, 0x5

    .line 384
    goto :goto_0

    .line 385
    :sswitch_1b
    const-string p0, "heatDesc"

    .line 386
    .line 387
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    if-nez p0, :cond_1b

    .line 392
    .line 393
    goto :goto_0

    .line 394
    :cond_1b
    const/4 v2, 0x4

    .line 395
    goto :goto_0

    .line 396
    :sswitch_1c
    const-string p0, "freeCall"

    .line 397
    .line 398
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result p0

    .line 402
    if-nez p0, :cond_1c

    .line 403
    .line 404
    goto :goto_0

    .line 405
    :cond_1c
    const/4 v2, 0x3

    .line 406
    goto :goto_0

    .line 407
    :sswitch_1d
    const-string p0, "levelIcon"

    .line 408
    .line 409
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result p0

    .line 413
    if-nez p0, :cond_1d

    .line 414
    .line 415
    goto :goto_0

    .line 416
    :cond_1d
    const/4 v2, 0x2

    .line 417
    goto :goto_0

    .line 418
    :sswitch_1e
    const-string p0, "settleMembersLimit"

    .line 419
    .line 420
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result p0

    .line 424
    if-nez p0, :cond_1e

    .line 425
    .line 426
    goto :goto_0

    .line 427
    :cond_1e
    move v2, v1

    .line 428
    goto :goto_0

    .line 429
    :sswitch_1f
    const-string p0, "canOpenPersonal"

    .line 430
    .line 431
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result p0

    .line 435
    if-nez p0, :cond_1f

    .line 436
    .line 437
    goto :goto_0

    .line 438
    :cond_1f
    move v2, v0

    .line 439
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 440
    .line 441
    .line 442
    return v0

    .line 443
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 444
    .line 445
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 446
    .line 447
    .line 448
    move-result-object p0

    .line 449
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 450
    .line 451
    return v1

    .line 452
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 453
    .line 454
    .line 455
    move-result p0

    .line 456
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 457
    .line 458
    return v1

    .line 459
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    .line 461
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 466
    .line 467
    return v1

    .line 468
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 473
    .line 474
    return v1

    .line 475
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object p0

    .line 479
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 480
    .line 481
    return v1

    .line 482
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 487
    .line 488
    return v1

    .line 489
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 494
    .line 495
    return v1

    .line 496
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object p0

    .line 500
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 501
    .line 502
    return v1

    .line 503
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object p0

    .line 507
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 508
    .line 509
    return v1

    .line 510
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object p0

    .line 514
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 515
    .line 516
    return v1

    .line 517
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object p0

    .line 521
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 522
    .line 523
    return v1

    .line 524
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 525
    .line 526
    .line 527
    move-result p0

    .line 528
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 529
    .line 530
    return v1

    .line 531
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 532
    .line 533
    .line 534
    move-result p0

    .line 535
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 536
    .line 537
    return v1

    .line 538
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 539
    .line 540
    .line 541
    move-result p0

    .line 542
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 543
    .line 544
    return v1

    .line 545
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 550
    .line 551
    return v1

    .line 552
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 557
    .line 558
    return v1

    .line 559
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object p0

    .line 563
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 564
    .line 565
    return v1

    .line 566
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object p0

    .line 570
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 571
    .line 572
    return v1

    .line 573
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 574
    .line 575
    .line 576
    move-result p0

    .line 577
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 578
    .line 579
    return v1

    .line 580
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object p0

    .line 584
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 585
    .line 586
    return v1

    .line 587
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 588
    .line 589
    .line 590
    move-result-wide p2

    .line 591
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 592
    .line 593
    return v1

    .line 594
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object p0

    .line 598
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 599
    .line 600
    return v1

    .line 601
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 602
    .line 603
    .line 604
    move-result p0

    .line 605
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 606
    .line 607
    return v1

    .line 608
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 609
    .line 610
    .line 611
    move-result-object p0

    .line 612
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 613
    .line 614
    return v1

    .line 615
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 616
    .line 617
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 618
    .line 619
    .line 620
    move-result-object p0

    .line 621
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 622
    .line 623
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 624
    .line 625
    return v1

    .line 626
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object p0

    .line 630
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 631
    .line 632
    return v1

    .line 633
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object p0

    .line 637
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 638
    .line 639
    return v1

    .line 640
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 641
    .line 642
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 643
    .line 644
    .line 645
    move-result-object p0

    .line 646
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 647
    .line 648
    return v1

    .line 649
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 650
    .line 651
    .line 652
    move-result p0

    .line 653
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 654
    .line 655
    return v1

    .line 656
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object p0

    .line 660
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 661
    .line 662
    return v1

    .line 663
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 664
    .line 665
    .line 666
    move-result p0

    .line 667
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 668
    .line 669
    return v1

    .line 670
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 671
    .line 672
    .line 673
    move-result p0

    .line 674
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 675
    .line 676
    return v1

    .line 677
    :sswitch_data_0
    .sparse-switch
        -0x76499d66 -> :sswitch_1f
        -0x678fd8f3 -> :sswitch_1e
        -0x62bd15e3 -> :sswitch_1d
        -0x5bb91116 -> :sswitch_1c
        -0x41a7375f -> :sswitch_1b
        -0x41a4f977 -> :sswitch_1a
        -0x41a02773 -> :sswitch_19
        -0x412d76a3 -> :sswitch_18
        -0x372740aa -> :sswitch_17
        -0x362f6d29 -> :sswitch_16
        -0x2558baaf -> :sswitch_15
        -0x1d336e2b -> :sswitch_14
        -0x14f7b5c8 -> :sswitch_13
        -0x14de3276 -> :sswitch_12
        -0xbd111e0 -> :sswitch_11
        -0x99f2621 -> :sswitch_10
        -0x99bd577 -> :sswitch_f
        -0x8178f42 -> :sswitch_e
        0x30cdf0 -> :sswitch_d
        0x6219b84 -> :sswitch_c
        0x68ae090 -> :sswitch_b
        0x6942258 -> :sswitch_a
        0x9584d47 -> :sswitch_9
        0xca4692e -> :sswitch_8
        0xda39a48 -> :sswitch_7
        0x1ddc2b1f -> :sswitch_6
        0x1ec9bc6a -> :sswitch_5
        0x2737b819 -> :sswitch_4
        0x2871c7ea -> :sswitch_3
        0x49f9f092 -> :sswitch_2
        0x53d05fef -> :sswitch_1
        0x7b57554e -> :sswitch_0
    .end sparse-switch

    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
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

    .line 677
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "roomId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "announcement"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "title"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    const-string p0, "createdTime"

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    const-string p0, "isPersonal"

    .line 36
    .line 37
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 38
    .line 39
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    const-string p0, "freeSettle"

    .line 43
    .line 44
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    const-string p0, "settleMembersLimit"

    .line 50
    .line 51
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 52
    .line 53
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    const-string p0, "settleMembers"

    .line 61
    .line 62
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 68
    .line 69
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    const-string v0, "levelIcon"

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const-string v0, "levelBgStartColor"

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz p0, :cond_6

    .line 93
    .line 94
    const-string v0, "levelBgEndColor"

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    const-string p0, "level"

    .line 100
    .line 101
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 102
    .line 103
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    const-string p0, "heat"

    .line 107
    .line 108
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 109
    .line 110
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz p0, :cond_7

    .line 116
    .line 117
    const-string v0, "heatIcon"

    .line 118
    .line 119
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_8

    .line 125
    .line 126
    const-string v0, "heatTitle"

    .line 127
    .line 128
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_9

    .line 134
    .line 135
    const-string v0, "heatSvga"

    .line 136
    .line 137
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz p0, :cond_a

    .line 143
    .line 144
    const-string v0, "heatBgImg"

    .line 145
    .line 146
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 150
    .line 151
    if-eqz p0, :cond_b

    .line 152
    .line 153
    const-string p0, "heatDesc"

    .line 154
    .line 155
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 159
    .line 160
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 161
    .line 162
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 163
    .line 164
    .line 165
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz p0, :cond_c

    .line 168
    .line 169
    const-string v0, "debugText"

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz p0, :cond_d

    .line 177
    .line 178
    const-string v0, "remindType"

    .line 179
    .line 180
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_d
    const-string p0, "freeCall"

    .line 184
    .line 185
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 186
    .line 187
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 188
    .line 189
    .line 190
    const-string p0, "stick"

    .line 191
    .line 192
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 193
    .line 194
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 198
    .line 199
    if-eqz p0, :cond_e

    .line 200
    .line 201
    const-string p0, "roomClass"

    .line 202
    .line 203
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 207
    .line 208
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 209
    .line 210
    const/4 v1, 0x1

    .line 211
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 212
    .line 213
    .line 214
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz p0, :cond_f

    .line 217
    .line 218
    const-string v0, "identity"

    .line 219
    .line 220
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_f
    const-string p0, "isSettled"

    .line 224
    .line 225
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 226
    .line 227
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 231
    .line 232
    if-eqz p0, :cond_10

    .line 233
    .line 234
    const-string p0, "roomAttributes"

    .line 235
    .line 236
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 240
    .line 241
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 242
    .line 243
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 244
    .line 245
    .line 246
    :cond_10
    const-string p0, "canOpenPersonal"

    .line 247
    .line 248
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 249
    .line 250
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 251
    .line 252
    .line 253
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 254
    .line 255
    if-eqz p0, :cond_11

    .line 256
    .line 257
    const-string v0, "titleStatus"

    .line 258
    .line 259
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 263
    .line 264
    if-eqz p0, :cond_12

    .line 265
    .line 266
    const-string v0, "announcementStatus"

    .line 267
    .line 268
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 272
    .line 273
    if-eqz p0, :cond_13

    .line 274
    .line 275
    const-string v0, "publicRoomId"

    .line 276
    .line 277
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz p0, :cond_14

    .line 283
    .line 284
    const-string v0, "coverUrl"

    .line 285
    .line 286
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 290
    .line 291
    if-eqz p0, :cond_15

    .line 292
    .line 293
    const-string p1, "coverStatus"

    .line 294
    .line 295
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    :cond_15
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
