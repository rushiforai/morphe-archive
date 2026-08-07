.class Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
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
    const-string p0, "hierarchy"

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
    const/16 v2, 0x13

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "value"

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
    const/16 v2, 0x12

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "medal"

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
    const/16 v2, 0x11

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "type"

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
    const/16 v2, 0x10

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "gift"

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
    const/16 v2, 0xf

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "seq"

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
    const/16 v2, 0xe

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "h5"

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
    const/16 v2, 0xd

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "username"

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
    const/16 v2, 0xc

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "createdTime"

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
    const/16 v2, 0xb

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "userId"

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
    const/16 v2, 0xa

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "userIdentity"

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
    const/16 v2, 0x9

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "roomId"

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
    const/16 v2, 0x8

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "sharedVoiceLiveInfo"

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
    goto :goto_0

    .line 193
    :cond_c
    const/4 v2, 0x7

    .line 194
    goto :goto_0

    .line 195
    :sswitch_d
    const-string p0, "preSeq"

    .line 196
    .line 197
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    if-nez p0, :cond_d

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_d
    const/4 v2, 0x6

    .line 205
    goto :goto_0

    .line 206
    :sswitch_e
    const-string p0, "liveId"

    .line 207
    .line 208
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    if-nez p0, :cond_e

    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_e
    const/4 v2, 0x5

    .line 216
    goto :goto_0

    .line 217
    :sswitch_f
    const-string p0, "chatShadingConfig"

    .line 218
    .line 219
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-nez p0, :cond_f

    .line 224
    .line 225
    goto :goto_0

    .line 226
    :cond_f
    const/4 v2, 0x4

    .line 227
    goto :goto_0

    .line 228
    :sswitch_10
    const-string p0, "extInfo"

    .line 229
    .line 230
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-nez p0, :cond_10

    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_10
    const/4 v2, 0x3

    .line 238
    goto :goto_0

    .line 239
    :sswitch_11
    const-string p0, "template"

    .line 240
    .line 241
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-nez p0, :cond_11

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_11
    const/4 v2, 0x2

    .line 249
    goto :goto_0

    .line 250
    :sswitch_12
    const-string p0, "starlightHierarchy"

    .line 251
    .line 252
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-nez p0, :cond_12

    .line 257
    .line 258
    goto :goto_0

    .line 259
    :cond_12
    move v2, v1

    .line 260
    goto :goto_0

    .line 261
    :sswitch_13
    const-string p0, "preTimestamp"

    .line 262
    .line 263
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-nez p0, :cond_13

    .line 268
    .line 269
    goto :goto_0

    .line 270
    :cond_13
    move v2, v0

    .line 271
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 272
    .line 273
    .line 274
    return v0

    .line 275
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 276
    .line 277
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 282
    .line 283
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 284
    .line 285
    return v1

    .line 286
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 291
    .line 292
    return v1

    .line 293
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 294
    .line 295
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 300
    .line 301
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 302
    .line 303
    return v1

    .line 304
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 309
    .line 310
    return v1

    .line 311
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 312
    .line 313
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 318
    .line 319
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 320
    .line 321
    return v1

    .line 322
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 327
    .line 328
    return v1

    .line 329
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 334
    .line 335
    return v1

    .line 336
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 341
    .line 342
    return v1

    .line 343
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 344
    .line 345
    .line 346
    move-result-wide p2

    .line 347
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 348
    .line 349
    return v1

    .line 350
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 355
    .line 356
    return v1

    .line 357
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 362
    .line 363
    return v1

    .line 364
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 369
    .line 370
    return v1

    .line 371
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 372
    .line 373
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 378
    .line 379
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 380
    .line 381
    return v1

    .line 382
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 383
    .line 384
    .line 385
    move-result p0

    .line 386
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 387
    .line 388
    return v1

    .line 389
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 394
    .line 395
    return v1

    .line 396
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 397
    .line 398
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object p0

    .line 402
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 403
    .line 404
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 405
    .line 406
    return v1

    .line 407
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 408
    .line 409
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 414
    .line 415
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 416
    .line 417
    return v1

    .line 418
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 419
    .line 420
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 425
    .line 426
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 427
    .line 428
    return v1

    .line 429
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    .line 431
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 436
    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 438
    .line 439
    return v1

    .line 440
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 441
    .line 442
    .line 443
    move-result-wide p2

    .line 444
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 445
    .line 446
    return v1

    .line 447
    :sswitch_data_0
    .sparse-switch
        -0x78bb224d -> :sswitch_13
        -0x50079b6f -> :sswitch_12
        -0x4ec53386 -> :sswitch_11
        -0x4ddf9591 -> :sswitch_10
        -0x465318ec -> :sswitch_f
        -0x41b5d0d9 -> :sswitch_e
        -0x3a6b9544 -> :sswitch_d
        -0x38184959 -> :sswitch_c
        -0x372740aa -> :sswitch_b
        -0x35dd3a57 -> :sswitch_a
        -0x31d4d1ba -> :sswitch_9
        -0x1d336e2b -> :sswitch_8
        -0xfd6772a -> :sswitch_7
        0xccd -> :sswitch_6
        0x1bc5f -> :sswitch_5
        0x306930 -> :sswitch_4
        0x368f3a -> :sswitch_3
        0x62f6ef7 -> :sswitch_2
        0x6ac9171 -> :sswitch_1
        0x7e129235 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 447
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

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
    const-string p0, "seq"

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "userId"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "username"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string v0, "value"

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string p0, "gift"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 57
    .line 58
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string p0, "template"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 73
    .line 74
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const-string v1, "h5"

    .line 82
    .line 83
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz p0, :cond_7

    .line 89
    .line 90
    const-string v1, "liveId"

    .line 91
    .line 92
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 96
    .line 97
    if-eqz p0, :cond_8

    .line 98
    .line 99
    const-string p0, "medal"

    .line 100
    .line 101
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 107
    .line 108
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 109
    .line 110
    .line 111
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 112
    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    const-string p0, "hierarchy"

    .line 116
    .line 117
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 123
    .line 124
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const-string p0, "extInfo"

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 137
    .line 138
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 139
    .line 140
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 141
    .line 142
    .line 143
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 144
    .line 145
    if-eqz p0, :cond_b

    .line 146
    .line 147
    const-string p0, "chatShadingConfig"

    .line 148
    .line 149
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 153
    .line 154
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 155
    .line 156
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 157
    .line 158
    .line 159
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 160
    .line 161
    if-eqz p0, :cond_c

    .line 162
    .line 163
    const-string v1, "type"

    .line 164
    .line 165
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 169
    .line 170
    if-eqz p0, :cond_d

    .line 171
    .line 172
    const-string p0, "sharedVoiceLiveInfo"

    .line 173
    .line 174
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 178
    .line 179
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 180
    .line 181
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 182
    .line 183
    .line 184
    :cond_d
    const-string p0, "preSeq"

    .line 185
    .line 186
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 187
    .line 188
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 189
    .line 190
    .line 191
    const-string p0, "preTimestamp"

    .line 192
    .line 193
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 194
    .line 195
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 196
    .line 197
    .line 198
    const-string p0, "createdTime"

    .line 199
    .line 200
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 201
    .line 202
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz p0, :cond_e

    .line 208
    .line 209
    const-string v1, "userIdentity"

    .line 210
    .line 211
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 215
    .line 216
    if-eqz p0, :cond_f

    .line 217
    .line 218
    const-string p0, "starlightHierarchy"

    .line 219
    .line 220
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 224
    .line 225
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 226
    .line 227
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 228
    .line 229
    .line 230
    :cond_f
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
