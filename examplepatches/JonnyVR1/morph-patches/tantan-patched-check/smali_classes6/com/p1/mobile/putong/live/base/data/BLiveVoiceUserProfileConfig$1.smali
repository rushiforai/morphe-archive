.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
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
    const-string p0, "showReceiveGifts"

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
    const/16 v2, 0x1d

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "hierarchy"

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
    const/16 v2, 0x1c

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "sweetCpCard"

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
    const/16 v2, 0x1b

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "sendGift"

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
    const/16 v2, 0x1a

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "middleButtons"

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
    const/16 v2, 0x19

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "specialFriendRelationSchema"

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
    const/16 v2, 0x18

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "payGuideInfo"

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
    const/16 v2, 0x17

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "enableNewPrivilege"

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
    const/16 v2, 0x16

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "familyCard"

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
    const/16 v2, 0x15

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "showSpecialFriendRelation"

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
    const/16 v2, 0x14

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "relationState"

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
    const/16 v2, 0x13

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "specialFriendRelations"

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
    const/16 v2, 0x12

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "middleCards"

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
    const/16 v2, 0x11

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "manageButtons"

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
    const/16 v2, 0x10

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "guildId"

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
    const/16 v2, 0xf

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "strawberry"

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
    const/16 v2, 0xe

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "guard"

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
    const/16 v2, 0xd

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "giftRuleUrl"

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
    const/16 v2, 0xc

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "identity"

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
    const/16 v2, 0xb

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "banners"

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
    const/16 v2, 0xa

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "isJailed"

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
    const/16 v2, 0x9

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "fanAvatarTag"

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
    const/16 v2, 0x8

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "userId"

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
    goto :goto_0

    .line 333
    :cond_16
    const/4 v2, 0x7

    .line 334
    goto :goto_0

    .line 335
    :sswitch_17
    const-string p0, "moreButtons"

    .line 336
    .line 337
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-nez p0, :cond_17

    .line 342
    .line 343
    goto :goto_0

    .line 344
    :cond_17
    const/4 v2, 0x6

    .line 345
    goto :goto_0

    .line 346
    :sswitch_18
    const-string p0, "userNameGradientColors"

    .line 347
    .line 348
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result p0

    .line 352
    if-nez p0, :cond_18

    .line 353
    .line 354
    goto :goto_0

    .line 355
    :cond_18
    const/4 v2, 0x5

    .line 356
    goto :goto_0

    .line 357
    :sswitch_19
    const-string p0, "bottomButtons"

    .line 358
    .line 359
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    move-result p0

    .line 363
    if-nez p0, :cond_19

    .line 364
    .line 365
    goto :goto_0

    .line 366
    :cond_19
    const/4 v2, 0x4

    .line 367
    goto :goto_0

    .line 368
    :sswitch_1a
    const-string p0, "fanAvatar"

    .line 369
    .line 370
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result p0

    .line 374
    if-nez p0, :cond_1a

    .line 375
    .line 376
    goto :goto_0

    .line 377
    :cond_1a
    const/4 v2, 0x3

    .line 378
    goto :goto_0

    .line 379
    :sswitch_1b
    const-string p0, "giftShowCaseItemIds"

    .line 380
    .line 381
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    if-nez p0, :cond_1b

    .line 386
    .line 387
    goto :goto_0

    .line 388
    :cond_1b
    const/4 v2, 0x2

    .line 389
    goto :goto_0

    .line 390
    :sswitch_1c
    const-string p0, "receiveGift"

    .line 391
    .line 392
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result p0

    .line 396
    if-nez p0, :cond_1c

    .line 397
    .line 398
    goto :goto_0

    .line 399
    :cond_1c
    move v2, v1

    .line 400
    goto :goto_0

    .line 401
    :sswitch_1d
    const-string p0, "payGuideConfig"

    .line 402
    .line 403
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    if-nez p0, :cond_1d

    .line 408
    .line 409
    goto :goto_0

    .line 410
    :cond_1d
    move v2, v0

    .line 411
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 412
    .line 413
    .line 414
    return v0

    .line 415
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 416
    .line 417
    .line 418
    move-result p0

    .line 419
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 420
    .line 421
    return v1

    .line 422
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 423
    .line 424
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 425
    .line 426
    .line 427
    move-result-object p0

    .line 428
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 429
    .line 430
    return v1

    .line 431
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 432
    .line 433
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 438
    .line 439
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 440
    .line 441
    return v1

    .line 442
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 447
    .line 448
    return v1

    .line 449
    :pswitch_4
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 450
    .line 451
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 456
    .line 457
    return v1

    .line 458
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 463
    .line 464
    return v1

    .line 465
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 466
    .line 467
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object p0

    .line 471
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 472
    .line 473
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 474
    .line 475
    return v1

    .line 476
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 477
    .line 478
    .line 479
    move-result p0

    .line 480
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 481
    .line 482
    return v1

    .line 483
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 484
    .line 485
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object p0

    .line 489
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 490
    .line 491
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 492
    .line 493
    return v1

    .line 494
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 495
    .line 496
    .line 497
    move-result p0

    .line 498
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 499
    .line 500
    return v1

    .line 501
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 506
    .line 507
    return v1

    .line 508
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 509
    .line 510
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 511
    .line 512
    .line 513
    move-result-object p0

    .line 514
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 515
    .line 516
    return v1

    .line 517
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 518
    .line 519
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 520
    .line 521
    .line 522
    move-result-object p0

    .line 523
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 524
    .line 525
    return v1

    .line 526
    :pswitch_d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 527
    .line 528
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 529
    .line 530
    .line 531
    move-result-object p0

    .line 532
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 533
    .line 534
    return v1

    .line 535
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object p0

    .line 539
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 540
    .line 541
    return v1

    .line 542
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 543
    .line 544
    .line 545
    move-result-wide p2

    .line 546
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 547
    .line 548
    return v1

    .line 549
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 550
    .line 551
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object p0

    .line 555
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 556
    .line 557
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 558
    .line 559
    return v1

    .line 560
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 565
    .line 566
    return v1

    .line 567
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object p0

    .line 571
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 572
    .line 573
    return v1

    .line 574
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 575
    .line 576
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 577
    .line 578
    .line 579
    move-result-object p0

    .line 580
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 581
    .line 582
    return v1

    .line 583
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 584
    .line 585
    .line 586
    move-result p0

    .line 587
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 588
    .line 589
    return v1

    .line 590
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object p0

    .line 594
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 595
    .line 596
    return v1

    .line 597
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object p0

    .line 601
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 602
    .line 603
    return v1

    .line 604
    :pswitch_17
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 605
    .line 606
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 607
    .line 608
    .line 609
    move-result-object p0

    .line 610
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 611
    .line 612
    return v1

    .line 613
    :pswitch_18
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 614
    .line 615
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 616
    .line 617
    .line 618
    move-result-object p0

    .line 619
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 620
    .line 621
    return v1

    .line 622
    :pswitch_19
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 623
    .line 624
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 625
    .line 626
    .line 627
    move-result-object p0

    .line 628
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 629
    .line 630
    return v1

    .line 631
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object p0

    .line 635
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 636
    .line 637
    return v1

    .line 638
    :pswitch_1b
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 639
    .line 640
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 641
    .line 642
    .line 643
    move-result-object p0

    .line 644
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 645
    .line 646
    return v1

    .line 647
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 648
    .line 649
    .line 650
    move-result-wide p2

    .line 651
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 652
    .line 653
    return v1

    .line 654
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 655
    .line 656
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 657
    .line 658
    .line 659
    move-result-object p0

    .line 660
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 661
    .line 662
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 663
    .line 664
    return v1

    .line 665
    :sswitch_data_0
    .sparse-switch
        -0x7fdc046a -> :sswitch_1d
        -0x7d65d94d -> :sswitch_1c
        -0x6496ad38 -> :sswitch_1b
        -0x5fe4a1b4 -> :sswitch_1a
        -0x3cc0f92a -> :sswitch_19
        -0x3c9da0aa -> :sswitch_18
        -0x3adc5d94 -> :sswitch_17
        -0x31d4d1ba -> :sswitch_16
        -0x2f1c4a52 -> :sswitch_15
        -0x1d69177d -> :sswitch_14
        -0x14159939 -> :sswitch_13
        -0x8178f42 -> :sswitch_12
        -0x109027d -> :sswitch_11
        0x5e21ea5 -> :sswitch_10
        0xa27e14f -> :sswitch_f
        0x1643146e -> :sswitch_e
        0x172cce5c -> :sswitch_d
        0x1788d2ce -> :sswitch_c
        0x18013b00 -> :sswitch_b
        0x1a6cb7f5 -> :sswitch_a
        0x25b7e4d6 -> :sswitch_9
        0x2f93f894 -> :sswitch_8
        0x35fd8e14 -> :sswitch_7
        0x3abfe202 -> :sswitch_6
        0x3d947754 -> :sswitch_5
        0x45fd7c2c -> :sswitch_4
        0x4a54a8d8 -> :sswitch_3
        0x5ca8242d -> :sswitch_2
        0x7e129235 -> :sswitch_1
        0x7e324bbd -> :sswitch_0
    .end sparse-switch

    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 665
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "userId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const-string p0, "showReceiveGifts"

    .line 11
    .line 12
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    const-string p0, "strawberry"

    .line 18
    .line 19
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    const-string p0, "receiveGift"

    .line 25
    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const-string v0, "giftRuleUrl"

    .line 36
    .line 37
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    const-string v0, "sendGift"

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string p0, "bottomButtons"

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 59
    .line 60
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    .line 62
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const-string p0, "middleButtons"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 75
    .line 76
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 77
    .line 78
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const-string p0, "manageButtons"

    .line 86
    .line 87
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 91
    .line 92
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 93
    .line 94
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 98
    .line 99
    if-eqz p0, :cond_6

    .line 100
    .line 101
    const-string p0, "hierarchy"

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 109
    .line 110
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 114
    .line 115
    if-eqz p0, :cond_7

    .line 116
    .line 117
    const-string p0, "banners"

    .line 118
    .line 119
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 123
    .line 124
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    .line 126
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_7
    const-string p0, "isJailed"

    .line 130
    .line 131
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 132
    .line 133
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 137
    .line 138
    if-eqz p0, :cond_8

    .line 139
    .line 140
    const-string p0, "middleCards"

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 146
    .line 147
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 148
    .line 149
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 150
    .line 151
    .line 152
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz p0, :cond_9

    .line 155
    .line 156
    const-string v0, "relationState"

    .line 157
    .line 158
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 162
    .line 163
    if-eqz p0, :cond_a

    .line 164
    .line 165
    const-string p0, "giftShowCaseItemIds"

    .line 166
    .line 167
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 171
    .line 172
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 173
    .line 174
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 175
    .line 176
    .line 177
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 178
    .line 179
    const/4 v0, 0x1

    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "sweetCpCard"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string v1, "identity"

    .line 199
    .line 200
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 204
    .line 205
    if-eqz p0, :cond_d

    .line 206
    .line 207
    const-string p0, "moreButtons"

    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 213
    .line 214
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 215
    .line 216
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 217
    .line 218
    .line 219
    :cond_d
    const-string p0, "enableNewPrivilege"

    .line 220
    .line 221
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 222
    .line 223
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 224
    .line 225
    .line 226
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 227
    .line 228
    if-eqz p0, :cond_e

    .line 229
    .line 230
    const-string v1, "fanAvatar"

    .line 231
    .line 232
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 236
    .line 237
    if-eqz p0, :cond_f

    .line 238
    .line 239
    const-string v1, "fanAvatarTag"

    .line 240
    .line 241
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 245
    .line 246
    if-eqz p0, :cond_10

    .line 247
    .line 248
    const-string p0, "payGuideInfo"

    .line 249
    .line 250
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 254
    .line 255
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 256
    .line 257
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 258
    .line 259
    .line 260
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 261
    .line 262
    if-eqz p0, :cond_11

    .line 263
    .line 264
    const-string p0, "payGuideConfig"

    .line 265
    .line 266
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 270
    .line 271
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 272
    .line 273
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 274
    .line 275
    .line 276
    :cond_11
    const-string p0, "showSpecialFriendRelation"

    .line 277
    .line 278
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 279
    .line 280
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 281
    .line 282
    .line 283
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 284
    .line 285
    if-eqz p0, :cond_12

    .line 286
    .line 287
    const-string v1, "specialFriendRelationSchema"

    .line 288
    .line 289
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 293
    .line 294
    if-eqz p0, :cond_13

    .line 295
    .line 296
    const-string p0, "specialFriendRelations"

    .line 297
    .line 298
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 302
    .line 303
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    .line 305
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 306
    .line 307
    .line 308
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 309
    .line 310
    if-eqz p0, :cond_14

    .line 311
    .line 312
    const-string p0, "familyCard"

    .line 313
    .line 314
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 318
    .line 319
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 320
    .line 321
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 322
    .line 323
    .line 324
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 325
    .line 326
    if-eqz p0, :cond_15

    .line 327
    .line 328
    const-string v1, "guildId"

    .line 329
    .line 330
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 334
    .line 335
    if-eqz p0, :cond_16

    .line 336
    .line 337
    const-string p0, "guard"

    .line 338
    .line 339
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 343
    .line 344
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 345
    .line 346
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 347
    .line 348
    .line 349
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 350
    .line 351
    if-eqz p0, :cond_17

    .line 352
    .line 353
    const-string p0, "userNameGradientColors"

    .line 354
    .line 355
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 359
    .line 360
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 361
    .line 362
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 363
    .line 364
    .line 365
    :cond_17
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 366
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
