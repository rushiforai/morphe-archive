.class Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;",
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
    const-string p0, "receivedTurboCouponCount"

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
    const/16 v2, 0x12

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "turboCouponGiftImageUrl"

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
    const/16 v2, 0x11

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "turboCouponGiftName"

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
    const/16 v2, 0x10

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "userAvatar"

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
    const/16 v2, 0xf

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "totalTaskCount"

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
    const/16 v2, 0xe

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "campaignEndTime"

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
    const/16 v2, 0xd

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "totalTaskCompleteReward"

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
    const/16 v2, 0xc

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "cheerGiftImageUrl"

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
    const/16 v2, 0xb

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "campaignStartTime"

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
    const/16 v2, 0xa

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "tasks"

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
    const/16 v2, 0x9

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "advancedTasks"

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
    const/16 v2, 0x8

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "type"

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
    goto :goto_0

    .line 179
    :cond_b
    const/4 v2, 0x7

    .line 180
    goto :goto_0

    .line 181
    :sswitch_c
    const-string p0, "id"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-nez p0, :cond_c

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_c
    const/4 v2, 0x6

    .line 191
    goto :goto_0

    .line 192
    :sswitch_d
    const-string p0, "userName"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-nez p0, :cond_d

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_d
    const/4 v2, 0x5

    .line 202
    goto :goto_0

    .line 203
    :sswitch_e
    const-string p0, "taskDate"

    .line 204
    .line 205
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-nez p0, :cond_e

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_e
    const/4 v2, 0x4

    .line 213
    goto :goto_0

    .line 214
    :sswitch_f
    const-string p0, "turboCouponGiftId"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-nez p0, :cond_f

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_f
    const/4 v2, 0x3

    .line 224
    goto :goto_0

    .line 225
    :sswitch_10
    const-string p0, "noticePopup"

    .line 226
    .line 227
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    if-nez p0, :cond_10

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_10
    const/4 v2, 0x2

    .line 235
    goto :goto_0

    .line 236
    :sswitch_11
    const-string p0, "userId"

    .line 237
    .line 238
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result p0

    .line 242
    if-nez p0, :cond_11

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_11
    move v2, v1

    .line 246
    goto :goto_0

    .line 247
    :sswitch_12
    const-string p0, "ownCheerGiftCount"

    .line 248
    .line 249
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    if-nez p0, :cond_12

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_12
    move v2, v0

    .line 257
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 258
    .line 259
    .line 260
    return v0

    .line 261
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 262
    .line 263
    .line 264
    move-result-wide p2

    .line 265
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 266
    .line 267
    return v1

    .line 268
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 273
    .line 274
    return v1

    .line 275
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 280
    .line 281
    return v1

    .line 282
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 287
    .line 288
    return v1

    .line 289
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 290
    .line 291
    .line 292
    move-result-wide p2

    .line 293
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 297
    .line 298
    .line 299
    move-result-wide p2

    .line 300
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 301
    .line 302
    return v1

    .line 303
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    .line 305
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 310
    .line 311
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 312
    .line 313
    return v1

    .line 314
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 322
    .line 323
    .line 324
    move-result-wide p2

    .line 325
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 326
    .line 327
    return v1

    .line 328
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 329
    .line 330
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 335
    .line 336
    return v1

    .line 337
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 338
    .line 339
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 344
    .line 345
    return v1

    .line 346
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 351
    .line 352
    return v1

    .line 353
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 358
    .line 359
    return v0

    .line 360
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 365
    .line 366
    return v1

    .line 367
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 368
    .line 369
    .line 370
    move-result-wide p2

    .line 371
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 372
    .line 373
    return v1

    .line 374
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 375
    .line 376
    .line 377
    move-result-wide p2

    .line 378
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 379
    .line 380
    return v1

    .line 381
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 382
    .line 383
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 388
    .line 389
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 390
    .line 391
    return v1

    .line 392
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 397
    .line 398
    return v1

    .line 399
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 400
    .line 401
    .line 402
    move-result-wide p2

    .line 403
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 404
    .line 405
    return v1

    .line 406
    nop

    .line 407
    :sswitch_data_0
    .sparse-switch
        -0x650f0fe8 -> :sswitch_12
        -0x31d4d1ba -> :sswitch_11
        -0x29878f4c -> :sswitch_10
        -0x1b17e491 -> :sswitch_f
        -0x1879b12d -> :sswitch_e
        -0xfe5030a -> :sswitch_d
        0xd1b -> :sswitch_c
        0x368f3a -> :sswitch_b
        0x20be88c -> :sswitch_a
        0x6907b8e -> :sswitch_9
        0x1d06db1f -> :sswitch_8
        0x2452ad51 -> :sswitch_7
        0x268a2111 -> :sswitch_6
        0x2ae2af18 -> :sswitch_5
        0x3a1f87a6 -> :sswitch_4
        0x40435504 -> :sswitch_3
        0x4b5143df -> :sswitch_2
        0x56746168 -> :sswitch_1
        0x7127b78c -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 407
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "campaignStartTime"

    .line 20
    .line 21
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    const-string p0, "campaignEndTime"

    .line 27
    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    const-string p0, "taskDate"

    .line 34
    .line 35
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 36
    .line 37
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    const-string v0, "userId"

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string v0, "userName"

    .line 54
    .line 55
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    const-string v0, "userAvatar"

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    const-string p0, "turboCouponGiftId"

    .line 68
    .line 69
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 70
    .line 71
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    const-string v0, "turboCouponGiftName"

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_6

    .line 86
    .line 87
    const-string v0, "turboCouponGiftImageUrl"

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    const-string v0, "cheerGiftImageUrl"

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_7
    const-string p0, "receivedTurboCouponCount"

    .line 102
    .line 103
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 106
    .line 107
    .line 108
    const-string p0, "ownCheerGiftCount"

    .line 109
    .line 110
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 113
    .line 114
    .line 115
    const-string p0, "totalTaskCount"

    .line 116
    .line 117
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 118
    .line 119
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 123
    .line 124
    const/4 v0, 0x1

    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string p0, "totalTaskCompleteReward"

    .line 128
    .line 129
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 135
    .line 136
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const-string p0, "tasks"

    .line 144
    .line 145
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 149
    .line 150
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    .line 152
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string p0, "advancedTasks"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 165
    .line 166
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 167
    .line 168
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "noticePopup"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 183
    .line 184
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 188
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
