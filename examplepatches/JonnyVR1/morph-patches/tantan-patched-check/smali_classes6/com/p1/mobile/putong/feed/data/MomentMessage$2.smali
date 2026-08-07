.class Lcom/p1/mobile/putong/feed/data/MomentMessage$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;->newInstance()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
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
    const-string p0, "commentInfo"

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
    const/16 v2, 0x1a

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "localCreatedTime"

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
    const/16 v2, 0x19

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "settings"

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
    const/16 v2, 0x18

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "subCommentIds"

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
    const/16 v2, 0x17

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "msgType"

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
    const/16 v2, 0x16

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "value"

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
    const/16 v2, 0x15

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "owner"

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
    const/16 v2, 0x14

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "media"

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
    const/16 v2, 0x13

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "likes"

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
    const/16 v2, 0x12

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "liked"

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
    const/16 v2, 0x11

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
    const/16 v2, 0x10

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "moreSubComments"

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
    const/16 v2, 0xf

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "localCreatedSession"

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
    const/16 v2, 0xe

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "parentCommentId"

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
    const/16 v2, 0xd

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "createdTime"

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
    const/16 v2, 0xc

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "isNewComment"

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
    const/16 v2, 0xb

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "isBottom"

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
    const/16 v2, 0xa

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "recalled"

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
    const/16 v2, 0x9

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "status"

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
    const/16 v2, 0x8

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "reference"

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
    goto :goto_0

    .line 291
    :cond_13
    const/4 v2, 0x7

    .line 292
    goto :goto_0

    .line 293
    :sswitch_14
    const-string p0, "moment"

    .line 294
    .line 295
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    if-nez p0, :cond_14

    .line 300
    .line 301
    goto :goto_0

    .line 302
    :cond_14
    const/4 v2, 0x6

    .line 303
    goto :goto_0

    .line 304
    :sswitch_15
    const-string p0, "localInConversation"

    .line 305
    .line 306
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result p0

    .line 310
    if-nez p0, :cond_15

    .line 311
    .line 312
    goto :goto_0

    .line 313
    :cond_15
    const/4 v2, 0x5

    .line 314
    goto :goto_0

    .line 315
    :sswitch_16
    const-string p0, "likeOfMoment"

    .line 316
    .line 317
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result p0

    .line 321
    if-nez p0, :cond_16

    .line 322
    .line 323
    goto :goto_0

    .line 324
    :cond_16
    const/4 v2, 0x4

    .line 325
    goto :goto_0

    .line 326
    :sswitch_17
    const-string p0, "sticker"

    .line 327
    .line 328
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    if-nez p0, :cond_17

    .line 333
    .line 334
    goto :goto_0

    .line 335
    :cond_17
    const/4 v2, 0x3

    .line 336
    goto :goto_0

    .line 337
    :sswitch_18
    const-string p0, "otherUser"

    .line 338
    .line 339
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result p0

    .line 343
    if-nez p0, :cond_18

    .line 344
    .line 345
    goto :goto_0

    .line 346
    :cond_18
    const/4 v2, 0x2

    .line 347
    goto :goto_0

    .line 348
    :sswitch_19
    const-string p0, "localInMoment"

    .line 349
    .line 350
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    if-nez p0, :cond_19

    .line 355
    .line 356
    goto :goto_0

    .line 357
    :cond_19
    move v2, v1

    .line 358
    goto :goto_0

    .line 359
    :sswitch_1a
    const-string p0, "accessory"

    .line 360
    .line 361
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-nez p0, :cond_1a

    .line 366
    .line 367
    goto :goto_0

    .line 368
    :cond_1a
    move v2, v0

    .line 369
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 370
    .line 371
    .line 372
    return v0

    .line 373
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 374
    .line 375
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    check-cast p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 380
    .line 381
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 382
    .line 383
    return v1

    .line 384
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 385
    .line 386
    .line 387
    move-result-wide p2

    .line 388
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 389
    .line 390
    return v1

    .line 391
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 392
    .line 393
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 398
    .line 399
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 400
    .line 401
    return v1

    .line 402
    :pswitch_3
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 403
    .line 404
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 409
    .line 410
    return v1

    .line 411
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 412
    .line 413
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 418
    .line 419
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 420
    .line 421
    return v1

    .line 422
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 427
    .line 428
    return v1

    .line 429
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    .line 431
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    check-cast p0, Ljava/lang/String;

    .line 436
    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 438
    .line 439
    return v1

    .line 440
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 441
    .line 442
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 447
    .line 448
    return v1

    .line 449
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 450
    .line 451
    .line 452
    move-result p0

    .line 453
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 454
    .line 455
    return v1

    .line 456
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 457
    .line 458
    .line 459
    move-result p0

    .line 460
    iput-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 461
    .line 462
    return v1

    .line 463
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object p0

    .line 467
    iput-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 468
    .line 469
    return v0

    .line 470
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 475
    .line 476
    return v1

    .line 477
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 478
    .line 479
    .line 480
    move-result p0

    .line 481
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 482
    .line 483
    return v1

    .line 484
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 489
    .line 490
    return v1

    .line 491
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    .line 493
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    check-cast p0, Ljava/lang/Double;

    .line 498
    .line 499
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 500
    .line 501
    .line 502
    move-result-wide p2

    .line 503
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 504
    .line 505
    return v1

    .line 506
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 507
    .line 508
    .line 509
    move-result p0

    .line 510
    iput-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 511
    .line 512
    return v1

    .line 513
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 514
    .line 515
    .line 516
    move-result p0

    .line 517
    iput-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 518
    .line 519
    return v1

    .line 520
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 521
    .line 522
    .line 523
    move-result-object p0

    .line 524
    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 525
    .line 526
    if-ne p0, p2, :cond_1b

    .line 527
    .line 528
    const/4 p0, 0x0

    .line 529
    goto :goto_1

    .line 530
    :cond_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 531
    .line 532
    .line 533
    move-result p0

    .line 534
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 539
    .line 540
    return v1

    .line 541
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CommentStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 542
    .line 543
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 544
    .line 545
    .line 546
    move-result-object p0

    .line 547
    check-cast p0, Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 548
    .line 549
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 550
    .line 551
    return v1

    .line 552
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 553
    .line 554
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object p0

    .line 558
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 559
    .line 560
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 561
    .line 562
    return v1

    .line 563
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 568
    .line 569
    return v1

    .line 570
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 571
    .line 572
    .line 573
    move-result p0

    .line 574
    iput-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 575
    .line 576
    return v1

    .line 577
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object p0

    .line 581
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 582
    .line 583
    return v1

    .line 584
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object p0

    .line 588
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 589
    .line 590
    return v1

    .line 591
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 592
    .line 593
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 594
    .line 595
    .line 596
    move-result-object p0

    .line 597
    check-cast p0, Ljava/lang/String;

    .line 598
    .line 599
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 600
    .line 601
    return v1

    .line 602
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 603
    .line 604
    .line 605
    move-result p0

    .line 606
    iput-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 607
    .line 608
    return v1

    .line 609
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Accessory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 610
    .line 611
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 616
    .line 617
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 618
    .line 619
    return v1

    .line 620
    nop

    .line 621
    :sswitch_data_0
    .sparse-switch
        -0x7e10b0ee -> :sswitch_1a
        -0x75b70bf0 -> :sswitch_19
        -0x73fb2905 -> :sswitch_18
        -0x70aaf6c3 -> :sswitch_17
        -0x69a1f492 -> :sswitch_16
        -0x53e27d6d -> :sswitch_15
        -0x3fb07e00 -> :sswitch_14
        -0x3724c0b5 -> :sswitch_13
        -0x3532300e -> :sswitch_12
        -0x306b3c90 -> :sswitch_11
        -0x2a45740b -> :sswitch_10
        -0x227c3a97 -> :sswitch_f
        -0x1d336e2b -> :sswitch_e
        -0x11a6edb0 -> :sswitch_d
        -0x96ea527 -> :sswitch_c
        -0x11eca41 -> :sswitch_b
        0xd1b -> :sswitch_a
        0x62343ad -> :sswitch_9
        0x62343bc -> :sswitch_8
        0x62f6fe4 -> :sswitch_7
        0x653f2b3 -> :sswitch_6
        0x6ac9171 -> :sswitch_5
        0x5018025b -> :sswitch_4
        0x55026a39 -> :sswitch_3
        0x5582bc23 -> :sswitch_2
        0x5d3f196a -> :sswitch_1
        0x7d5c7fad -> :sswitch_0
    .end sparse-switch

    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 621
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;->parseField(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
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
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string v0, "commentInfo"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v3, 0x1a

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "localCreatedTime"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v3, 0x19

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "settings"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v3, 0x18

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "subCommentIds"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v3, 0x17

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "msgType"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v3, 0x16

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "value"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v3, 0x15

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "owner"

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v3, 0x14

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "media"

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v3, 0x13

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "likes"

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v3, 0x12

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "liked"

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v3, 0x11

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "id"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v3, 0x10

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "moreSubComments"

    .line 171
    .line 172
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v3, 0xf

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "localCreatedSession"

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v3, 0xe

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "parentCommentId"

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v3, 0xd

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string v0, "createdTime"

    .line 213
    .line 214
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v3, 0xc

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string v0, "isNewComment"

    .line 227
    .line 228
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_f

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v3, 0xb

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string v0, "isBottom"

    .line 241
    .line 242
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v3, 0xa

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string v0, "recalled"

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-nez v0, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v3, 0x9

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string v0, "status"

    .line 269
    .line 270
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v3, 0x8

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string v0, "reference"

    .line 283
    .line 284
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-nez v0, :cond_13

    .line 289
    .line 290
    goto :goto_0

    .line 291
    :cond_13
    const/4 v3, 0x7

    .line 292
    goto :goto_0

    .line 293
    :sswitch_14
    const-string v0, "moment"

    .line 294
    .line 295
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-nez v0, :cond_14

    .line 300
    .line 301
    goto :goto_0

    .line 302
    :cond_14
    const/4 v3, 0x6

    .line 303
    goto :goto_0

    .line 304
    :sswitch_15
    const-string v0, "localInConversation"

    .line 305
    .line 306
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-nez v0, :cond_15

    .line 311
    .line 312
    goto :goto_0

    .line 313
    :cond_15
    const/4 v3, 0x5

    .line 314
    goto :goto_0

    .line 315
    :sswitch_16
    const-string v0, "likeOfMoment"

    .line 316
    .line 317
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_16

    .line 322
    .line 323
    goto :goto_0

    .line 324
    :cond_16
    const/4 v3, 0x4

    .line 325
    goto :goto_0

    .line 326
    :sswitch_17
    const-string v0, "sticker"

    .line 327
    .line 328
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-nez v0, :cond_17

    .line 333
    .line 334
    goto :goto_0

    .line 335
    :cond_17
    const/4 v3, 0x3

    .line 336
    goto :goto_0

    .line 337
    :sswitch_18
    const-string v0, "otherUser"

    .line 338
    .line 339
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_18

    .line 344
    .line 345
    goto :goto_0

    .line 346
    :cond_18
    const/4 v3, 0x2

    .line 347
    goto :goto_0

    .line 348
    :sswitch_19
    const-string v0, "localInMoment"

    .line 349
    .line 350
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    if-nez v0, :cond_19

    .line 355
    .line 356
    goto :goto_0

    .line 357
    :cond_19
    move v3, v2

    .line 358
    goto :goto_0

    .line 359
    :sswitch_1a
    const-string v0, "accessory"

    .line 360
    .line 361
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result v0

    .line 365
    if-nez v0, :cond_1a

    .line 366
    .line 367
    goto :goto_0

    .line 368
    :cond_1a
    move v3, v1

    .line 369
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 370
    .line 371
    .line 372
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 373
    .line 374
    .line 375
    move-result p0

    .line 376
    return p0

    .line 377
    :pswitch_0
    return v2

    .line 378
    :pswitch_1
    return v1

    .line 379
    :pswitch_2
    return v2

    .line 380
    nop

    .line 381
    :sswitch_data_0
    .sparse-switch
        -0x7e10b0ee -> :sswitch_1a
        -0x75b70bf0 -> :sswitch_19
        -0x73fb2905 -> :sswitch_18
        -0x70aaf6c3 -> :sswitch_17
        -0x69a1f492 -> :sswitch_16
        -0x53e27d6d -> :sswitch_15
        -0x3fb07e00 -> :sswitch_14
        -0x3724c0b5 -> :sswitch_13
        -0x3532300e -> :sswitch_12
        -0x306b3c90 -> :sswitch_11
        -0x2a45740b -> :sswitch_10
        -0x227c3a97 -> :sswitch_f
        -0x1d336e2b -> :sswitch_e
        -0x11a6edb0 -> :sswitch_d
        -0x96ea527 -> :sswitch_c
        -0x11eca41 -> :sswitch_b
        0xd1b -> :sswitch_a
        0x62343ad -> :sswitch_9
        0x62343bc -> :sswitch_8
        0x62f6fe4 -> :sswitch_7
        0x653f2b3 -> :sswitch_6
        0x6ac9171 -> :sswitch_5
        0x5018025b -> :sswitch_4
        0x55026a39 -> :sswitch_3
        0x5582bc23 -> :sswitch_2
        0x5d3f196a -> :sswitch_1
        0x7d5c7fad -> :sswitch_0
    .end sparse-switch

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
    .line 464
    .line 465
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
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

    .line 381
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    const-string p0, "localCreatedTime"

    .line 11
    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 15
    .line 16
    .line 17
    const-string p0, "localCreatedSession"

    .line 18
    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const-string p0, "localInMoment"

    .line 25
    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 29
    .line 30
    .line 31
    const-string p0, "localInConversation"

    .line 32
    .line 33
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 34
    .line 35
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    const-string p0, "createdTime"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    const-string p0, "otherUser"

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    const-string v0, "likeOfMoment"

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 81
    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    const-string p0, "media"

    .line 85
    .line 86
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p0, :cond_4

    .line 99
    .line 100
    const-string v0, "sticker"

    .line 101
    .line 102
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 106
    .line 107
    if-eqz p0, :cond_5

    .line 108
    .line 109
    const-string p0, "reference"

    .line 110
    .line 111
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 115
    .line 116
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 117
    .line 118
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 119
    .line 120
    .line 121
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz p0, :cond_6

    .line 124
    .line 125
    const-string v0, "moment"

    .line 126
    .line 127
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 131
    .line 132
    if-eqz p0, :cond_7

    .line 133
    .line 134
    const-string p0, "commentInfo"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 140
    .line 141
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 142
    .line 143
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 144
    .line 145
    .line 146
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_8

    .line 149
    .line 150
    const-string v0, "parentCommentId"

    .line 151
    .line 152
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 156
    .line 157
    if-eqz p0, :cond_9

    .line 158
    .line 159
    const-string p0, "subCommentIds"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 165
    .line 166
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 167
    .line 168
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 169
    .line 170
    .line 171
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz p0, :cond_a

    .line 174
    .line 175
    const-string v0, "moreSubComments"

    .line 176
    .line 177
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :cond_a
    const-string p0, "isBottom"

    .line 181
    .line 182
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 183
    .line 184
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 185
    .line 186
    .line 187
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz p0, :cond_b

    .line 190
    .line 191
    const-string p0, "owner"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 197
    .line 198
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 201
    .line 202
    .line 203
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 204
    .line 205
    if-eqz p0, :cond_c

    .line 206
    .line 207
    const-string v0, "value"

    .line 208
    .line 209
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 213
    .line 214
    if-eqz p0, :cond_d

    .line 215
    .line 216
    const-string p0, "msgType"

    .line 217
    .line 218
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 222
    .line 223
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 224
    .line 225
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 226
    .line 227
    .line 228
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 229
    .line 230
    if-eqz p0, :cond_e

    .line 231
    .line 232
    const-string p0, "settings"

    .line 233
    .line 234
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 240
    .line 241
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 242
    .line 243
    .line 244
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 245
    .line 246
    if-eqz p0, :cond_f

    .line 247
    .line 248
    const-string v0, "recalled"

    .line 249
    .line 250
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 255
    .line 256
    .line 257
    :cond_f
    const-string p0, "likes"

    .line 258
    .line 259
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 260
    .line 261
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 262
    .line 263
    .line 264
    const-string p0, "liked"

    .line 265
    .line 266
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 267
    .line 268
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 269
    .line 270
    .line 271
    const-string p0, "isNewComment"

    .line 272
    .line 273
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 274
    .line 275
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 276
    .line 277
    .line 278
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 279
    .line 280
    if-eqz p0, :cond_10

    .line 281
    .line 282
    const-string p0, "status"

    .line 283
    .line 284
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CommentStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 288
    .line 289
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 290
    .line 291
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 292
    .line 293
    .line 294
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 295
    .line 296
    if-eqz p0, :cond_11

    .line 297
    .line 298
    const-string p0, "accessory"

    .line 299
    .line 300
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Accessory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    .line 305
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 306
    .line 307
    invoke-virtual {p0, p1, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 308
    .line 309
    .line 310
    :cond_11
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 311
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
