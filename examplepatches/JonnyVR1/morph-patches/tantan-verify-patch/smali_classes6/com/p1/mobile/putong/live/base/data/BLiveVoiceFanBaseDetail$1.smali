.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;",
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
    const-string p0, "medalName"

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
    const/16 v2, 0x14

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "rankRulePageUrl"

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
    const/16 v2, 0x13

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "memberNum"

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
    const/16 v2, 0x12

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "accompanyNum"

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
    const/16 v2, 0x11

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "viewType"

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
    const/16 v2, 0x10

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "joinGiftId"

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
    const/16 v2, 0xf

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "userAvatar"

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
    const/16 v2, 0xe

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "tasks"

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
    const/16 v2, 0xd

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "bgPic"

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
    const/16 v2, 0xc

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "name"

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
    const/16 v2, 0xb

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "icon"

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
    const/16 v2, 0xa

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
    const/16 v2, 0x9

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "fullExp"

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
    const/16 v2, 0x8

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "medalGrade"

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
    goto :goto_0

    .line 207
    :cond_d
    const/4 v2, 0x7

    .line 208
    goto :goto_0

    .line 209
    :sswitch_e
    const-string p0, "medalColor"

    .line 210
    .line 211
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-nez p0, :cond_e

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_e
    const/4 v2, 0x6

    .line 219
    goto :goto_0

    .line 220
    :sswitch_f
    const-string p0, "weekRank"

    .line 221
    .line 222
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-nez p0, :cond_f

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_f
    const/4 v2, 0x5

    .line 230
    goto :goto_0

    .line 231
    :sswitch_10
    const-string p0, "rights"

    .line 232
    .line 233
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-nez p0, :cond_10

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_10
    const/4 v2, 0x4

    .line 241
    goto :goto_0

    .line 242
    :sswitch_11
    const-string p0, "curExp"

    .line 243
    .line 244
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-nez p0, :cond_11

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_11
    const/4 v2, 0x3

    .line 252
    goto :goto_0

    .line 253
    :sswitch_12
    const-string p0, "rulePageUrl"

    .line 254
    .line 255
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-nez p0, :cond_12

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_12
    const/4 v2, 0x2

    .line 263
    goto :goto_0

    .line 264
    :sswitch_13
    const-string p0, "avatar"

    .line 265
    .line 266
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result p0

    .line 270
    if-nez p0, :cond_13

    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_13
    move v2, v1

    .line 274
    goto :goto_0

    .line 275
    :sswitch_14
    const-string p0, "fontColor"

    .line 276
    .line 277
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result p0

    .line 281
    if-nez p0, :cond_14

    .line 282
    .line 283
    goto :goto_0

    .line 284
    :cond_14
    move v2, v0

    .line 285
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 286
    .line 287
    .line 288
    return v0

    .line 289
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rankRulePageUrl:Ljava/lang/String;

    .line 301
    .line 302
    return v1

    .line 303
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 308
    .line 309
    return v1

    .line 310
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->accompanyNum:I

    .line 315
    .line 316
    return v1

    .line 317
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 318
    .line 319
    .line 320
    move-result p0

    .line 321
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->viewType:I

    .line 322
    .line 323
    return v1

    .line 324
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->joinGiftId:Ljava/lang/String;

    .line 329
    .line 330
    return v1

    .line 331
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userAvatar:Ljava/lang/String;

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->tasks:Ljava/util/List;

    .line 345
    .line 346
    return v1

    .line 347
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->bgPic:Ljava/lang/String;

    .line 352
    .line 353
    return v1

    .line 354
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->name:Ljava/lang/String;

    .line 359
    .line 360
    return v1

    .line 361
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->icon:Ljava/lang/String;

    .line 366
    .line 367
    return v1

    .line 368
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userName:Ljava/lang/String;

    .line 373
    .line 374
    return v1

    .line 375
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 376
    .line 377
    .line 378
    move-result-wide p2

    .line 379
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fullExp:J

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
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalColor:Ljava/lang/String;

    .line 394
    .line 395
    return v1

    .line 396
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->weekRank:I

    .line 401
    .line 402
    return v1

    .line 403
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseRight;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 404
    .line 405
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rights:Ljava/util/List;

    .line 410
    .line 411
    return v1

    .line 412
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 413
    .line 414
    .line 415
    move-result-wide p2

    .line 416
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->curExp:J

    .line 417
    .line 418
    return v1

    .line 419
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rulePageUrl:Ljava/lang/String;

    .line 424
    .line 425
    return v1

    .line 426
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->avatar:Ljava/lang/String;

    .line 431
    .line 432
    return v1

    .line 433
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fontColor:Ljava/lang/String;

    .line 438
    .line 439
    return v1

    .line 440
    nop

    .line 441
    :sswitch_data_0
    .sparse-switch
        -0x5d5573ac -> :sswitch_14
        -0x53cd3ea7 -> :sswitch_13
        -0x508ee63c -> :sswitch_12
        -0x506a9843 -> :sswitch_11
        -0x377f7e29 -> :sswitch_10
        -0x251ab9c0 -> :sswitch_f
        -0x22596d54 -> :sswitch_e
        -0x221fdce0 -> :sswitch_d
        -0x1e794ef2 -> :sswitch_c
        -0xfe5030a -> :sswitch_b
        0x313c79 -> :sswitch_a
        0x337a8b -> :sswitch_9
        0x5950b05 -> :sswitch_8
        0x6907b8e -> :sswitch_7
        0x40435504 -> :sswitch_6
        0x457da835 -> :sswitch_5
        0x4747637f -> :sswitch_4
        0x4c3a136b -> :sswitch_3
        0x50006a8c -> :sswitch_2
        0x5f2661f8 -> :sswitch_1
        0x72860a22 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 441
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "viewType"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->viewType:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->avatar:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string v0, "avatar"

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->name:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "name"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const-string p0, "memberNum"

    .line 27
    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->joinGiftId:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string v0, "joinGiftId"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    const-string p0, "medalGrade"

    .line 43
    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalColor:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string v0, "medalColor"

    .line 54
    .line 55
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    const-string v0, "medalName"

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->icon:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    const-string v0, "icon"

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    const-string p0, "accompanyNum"

    .line 77
    .line 78
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->accompanyNum:I

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    const-string p0, "weekRank"

    .line 84
    .line 85
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->weekRank:I

    .line 86
    .line 87
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userAvatar:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz p0, :cond_6

    .line 93
    .line 94
    const-string v0, "userAvatar"

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userName:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    const-string v0, "userName"

    .line 104
    .line 105
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_7
    const-string p0, "curExp"

    .line 109
    .line 110
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->curExp:J

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 113
    .line 114
    .line 115
    const-string p0, "fullExp"

    .line 116
    .line 117
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fullExp:J

    .line 118
    .line 119
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rulePageUrl:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_8

    .line 125
    .line 126
    const-string v0, "rulePageUrl"

    .line 127
    .line 128
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rankRulePageUrl:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_9

    .line 134
    .line 135
    const-string v0, "rankRulePageUrl"

    .line 136
    .line 137
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->tasks:Ljava/util/List;

    .line 141
    .line 142
    if-eqz p0, :cond_a

    .line 143
    .line 144
    const-string p0, "tasks"

    .line 145
    .line 146
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->tasks:Ljava/util/List;

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 152
    .line 153
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 154
    .line 155
    .line 156
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rights:Ljava/util/List;

    .line 157
    .line 158
    if-eqz p0, :cond_b

    .line 159
    .line 160
    const-string p0, "rights"

    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rights:Ljava/util/List;

    .line 166
    .line 167
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseRight;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 168
    .line 169
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 170
    .line 171
    .line 172
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fontColor:Ljava/lang/String;

    .line 173
    .line 174
    if-eqz p0, :cond_c

    .line 175
    .line 176
    const-string v0, "fontColor"

    .line 177
    .line 178
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->bgPic:Ljava/lang/String;

    .line 182
    .line 183
    if-eqz p0, :cond_d

    .line 184
    .line 185
    const-string p1, "bgPic"

    .line 186
    .line 187
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
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

    .line 191
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
