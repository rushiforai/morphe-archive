.class Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
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
    const/4 p5, 0x0

    .line 9
    const/4 p6, 0x1

    .line 10
    const/4 v0, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "anchorUserName"

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
    const/16 v0, 0x15

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "intendPosition"

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
    const/16 v0, 0x14

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "hangupReason"

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
    const/16 v0, 0x13

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "mutedByUser"

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
    const/16 v0, 0x12

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "anchorPicture"

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
    const/16 v0, 0x11

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "position"

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
    const/16 v0, 0x10

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "inviteId"

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
    const/16 v0, 0xf

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "mutedByAnchor"

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
    const/16 v0, 0xe

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "state"

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
    const/16 v0, 0xd

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "user"

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
    const/16 v0, 0xc

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "id"

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
    const/16 v0, 0xb

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "userName"

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
    const/16 v0, 0xa

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "userSendRewardPoint"

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
    const/16 v0, 0x9

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "userRecvRewardPoint"

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
    const/16 v0, 0x8

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "userPicture"

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
    goto :goto_0

    .line 221
    :cond_e
    const/4 v0, 0x7

    .line 222
    goto :goto_0

    .line 223
    :sswitch_f
    const-string p0, "source"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-nez p0, :cond_f

    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_f
    const/4 v0, 0x6

    .line 233
    goto :goto_0

    .line 234
    :sswitch_10
    const-string p0, "liveId"

    .line 235
    .line 236
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    if-nez p0, :cond_10

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_10
    const/4 v0, 0x5

    .line 244
    goto :goto_0

    .line 245
    :sswitch_11
    const-string p0, "isAway"

    .line 246
    .line 247
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-nez p0, :cond_11

    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_11
    const/4 v0, 0x4

    .line 255
    goto :goto_0

    .line 256
    :sswitch_12
    const-string p0, "opState"

    .line 257
    .line 258
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-nez p0, :cond_12

    .line 263
    .line 264
    goto :goto_0

    .line 265
    :cond_12
    const/4 v0, 0x3

    .line 266
    goto :goto_0

    .line 267
    :sswitch_13
    const-string p0, "fakeId"

    .line 268
    .line 269
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result p0

    .line 273
    if-nez p0, :cond_13

    .line 274
    .line 275
    goto :goto_0

    .line 276
    :cond_13
    const/4 v0, 0x2

    .line 277
    goto :goto_0

    .line 278
    :sswitch_14
    const-string p0, "anchor"

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-nez p0, :cond_14

    .line 285
    .line 286
    goto :goto_0

    .line 287
    :cond_14
    move v0, p6

    .line 288
    goto :goto_0

    .line 289
    :sswitch_15
    const-string p0, "videoInviteTime"

    .line 290
    .line 291
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-nez p0, :cond_15

    .line 296
    .line 297
    goto :goto_0

    .line 298
    :cond_15
    move v0, p5

    .line 299
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 300
    .line 301
    .line 302
    return p5

    .line 303
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 308
    .line 309
    return p6

    .line 310
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 315
    .line 316
    return p6

    .line 317
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 322
    .line 323
    return p6

    .line 324
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 325
    .line 326
    .line 327
    move-result p0

    .line 328
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 329
    .line 330
    return p6

    .line 331
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 336
    .line 337
    return p6

    .line 338
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 339
    .line 340
    .line 341
    move-result p0

    .line 342
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 343
    .line 344
    return p6

    .line 345
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 350
    .line 351
    return p6

    .line 352
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 353
    .line 354
    .line 355
    move-result p0

    .line 356
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 357
    .line 358
    return p6

    .line 359
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 364
    .line 365
    return p6

    .line 366
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 367
    .line 368
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    check-cast p0, Ljava/lang/String;

    .line 373
    .line 374
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 375
    .line 376
    return p6

    .line 377
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object p0

    .line 381
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 382
    .line 383
    return p5

    .line 384
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 389
    .line 390
    return p6

    .line 391
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 392
    .line 393
    .line 394
    move-result-wide p2

    .line 395
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 396
    .line 397
    return p6

    .line 398
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 399
    .line 400
    .line 401
    move-result-wide p2

    .line 402
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 403
    .line 404
    return p6

    .line 405
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 410
    .line 411
    return p6

    .line 412
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 417
    .line 418
    return p6

    .line 419
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 424
    .line 425
    return p6

    .line 426
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 427
    .line 428
    .line 429
    move-result p0

    .line 430
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 431
    .line 432
    return p6

    .line 433
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 438
    .line 439
    return p6

    .line 440
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 445
    .line 446
    return p6

    .line 447
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 448
    .line 449
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    check-cast p0, Ljava/lang/String;

    .line 454
    .line 455
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 456
    .line 457
    return p6

    .line 458
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 459
    .line 460
    .line 461
    move-result-wide p2

    .line 462
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 463
    .line 464
    return p6

    .line 465
    :sswitch_data_0
    .sparse-switch
        -0x6f3be3af -> :sswitch_15
        -0x543d3d4b -> :sswitch_14
        -0x4c68a0b0 -> :sswitch_13
        -0x4c45b4d0 -> :sswitch_12
        -0x465f40c8 -> :sswitch_11
        -0x41b5d0d9 -> :sswitch_10
        -0x356f97e5 -> :sswitch_f
        -0x346dc14d -> :sswitch_e
        -0x28262570 -> :sswitch_d
        -0x19271452 -> :sswitch_c
        -0xfe5030a -> :sswitch_b
        0xd1b -> :sswitch_a
        0x36ebcb -> :sswitch_9
        0x68ac491 -> :sswitch_8
        0x13579877 -> :sswitch_7
        0x25a29a04 -> :sswitch_6
        0x2c929929 -> :sswitch_5
        0x4cfcac89 -> :sswitch_4
        0x572a4a0d -> :sswitch_3
        0x5a381b31 -> :sswitch_2
        0x6db4e7d5 -> :sswitch_1
        0x6e389ecb -> :sswitch_0
    .end sparse-switch

    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 465
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "liveId"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "state"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "opState"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "source"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const-string p0, "user"

    .line 52
    .line 53
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 61
    .line 62
    .line 63
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const-string p0, "anchor"

    .line 68
    .line 69
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 77
    .line 78
    .line 79
    :cond_6
    const-string p0, "userSendRewardPoint"

    .line 80
    .line 81
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 82
    .line 83
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 84
    .line 85
    .line 86
    const-string p0, "userRecvRewardPoint"

    .line 87
    .line 88
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 89
    .line 90
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 91
    .line 92
    .line 93
    const-string p0, "intendPosition"

    .line 94
    .line 95
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 96
    .line 97
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    const-string p0, "position"

    .line 101
    .line 102
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 103
    .line 104
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    const-string p0, "mutedByUser"

    .line 108
    .line 109
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 110
    .line 111
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    const-string p0, "mutedByAnchor"

    .line 115
    .line 116
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 117
    .line 118
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    const-string p0, "isAway"

    .line 122
    .line 123
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 124
    .line 125
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_7

    .line 131
    .line 132
    const-string v0, "inviteId"

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz p0, :cond_8

    .line 140
    .line 141
    const-string v0, "userName"

    .line 142
    .line 143
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string v0, "anchorUserName"

    .line 151
    .line 152
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string v0, "userPicture"

    .line 160
    .line 161
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 165
    .line 166
    if-eqz p0, :cond_b

    .line 167
    .line 168
    const-string v0, "anchorPicture"

    .line 169
    .line 170
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_b
    const-string p0, "videoInviteTime"

    .line 174
    .line 175
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 176
    .line 177
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz p0, :cond_c

    .line 183
    .line 184
    const-string v0, "hangupReason"

    .line 185
    .line 186
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    const-string p1, "fakeId"

    .line 194
    .line 195
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_d
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
