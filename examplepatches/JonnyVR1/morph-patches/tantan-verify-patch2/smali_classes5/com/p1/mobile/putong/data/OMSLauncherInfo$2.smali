.class Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSLauncherInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/OMSLauncherInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;->newInstance()Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
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
    const-string p0, "operationConfig"

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
    const-string p0, "creative"

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
    const-string p0, "clickMercury"

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
    const-string p0, "behaviorMercury"

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
    const-string p0, "viewMercury"

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
    const-string p0, "issueTimestamp"

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
    const-string p0, "version"

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
    const-string p0, "cacheEnable"

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
    const-string p0, "price"

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
    const-string p0, "dspId"

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
    const-string p0, "type"

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
    const-string p0, "href"

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
    const-string p0, "url"

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
    const-string p0, "id"

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
    const-string p0, "ad"

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
    const-string p0, "constraint"

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
    const-string p0, "skipMercury"

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
    const-string p0, "budgetType"

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
    const-string p0, "scenes"

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
    const-string p0, "ifBeRealtime"

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
    const-string p0, "duration"

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
    sget-object p0, Lcom/p1/mobile/putong/data/OperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 290
    .line 291
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    check-cast p0, Lcom/p1/mobile/putong/data/OperationConfig;

    .line 296
    .line 297
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 298
    .line 299
    return v1

    .line 300
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/CreativeOms;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 301
    .line 302
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    check-cast p0, Lcom/p1/mobile/putong/data/CreativeOms;

    .line 307
    .line 308
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 309
    .line 310
    return v1

    .line 311
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 312
    .line 313
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    check-cast p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 318
    .line 319
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 320
    .line 321
    return v1

    .line 322
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 323
    .line 324
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    check-cast p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 329
    .line 330
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 331
    .line 332
    return v1

    .line 333
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 334
    .line 335
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    check-cast p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 340
    .line 341
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 342
    .line 343
    return v1

    .line 344
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 345
    .line 346
    .line 347
    move-result-wide p2

    .line 348
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 349
    .line 350
    return v1

    .line 351
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 352
    .line 353
    .line 354
    move-result p0

    .line 355
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 356
    .line 357
    return v1

    .line 358
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 359
    .line 360
    .line 361
    move-result p0

    .line 362
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 363
    .line 364
    return v1

    .line 365
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 366
    .line 367
    .line 368
    move-result p0

    .line 369
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 370
    .line 371
    return v1

    .line 372
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 377
    .line 378
    return v1

    .line 379
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 384
    .line 385
    return v1

    .line 386
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 391
    .line 392
    return v1

    .line 393
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 398
    .line 399
    return v1

    .line 400
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 405
    .line 406
    return v0

    .line 407
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/ADInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 408
    .line 409
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    check-cast p0, Lcom/p1/mobile/putong/data/ADInfo;

    .line 414
    .line 415
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 416
    .line 417
    return v1

    .line 418
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 419
    .line 420
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 425
    .line 426
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 427
    .line 428
    return v1

    .line 429
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    .line 431
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    check-cast p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 436
    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 438
    .line 439
    return v1

    .line 440
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 441
    .line 442
    .line 443
    move-result p0

    .line 444
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 445
    .line 446
    return v1

    .line 447
    :pswitch_12
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 448
    .line 449
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 454
    .line 455
    return v1

    .line 456
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 457
    .line 458
    .line 459
    move-result p0

    .line 460
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 461
    .line 462
    return v1

    .line 463
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 464
    .line 465
    .line 466
    move-result p0

    .line 467
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 468
    .line 469
    return v1

    .line 470
    nop

    .line 471
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_14
        -0x3a70ec35 -> :sswitch_13
        -0x36200699 -> :sswitch_12
        -0x292077e1 -> :sswitch_11
        -0x23edbb6c -> :sswitch_10
        -0xb58ea23 -> :sswitch_f
        0xc23 -> :sswitch_e
        0xd1b -> :sswitch_d
        0x1c56f -> :sswitch_c
        0x30ff2b -> :sswitch_b
        0x368f3a -> :sswitch_a
        0x5b722bc -> :sswitch_9
        0x65fb149 -> :sswitch_8
        0x90597a5 -> :sswitch_7
        0x14f51cd8 -> :sswitch_6
        0x25db843d -> :sswitch_5
        0x3843f8ae -> :sswitch_4
        0x4d93f461 -> :sswitch_3
        0x59f0f86b -> :sswitch_2
        0x6c816faf -> :sswitch_1
        0x782d5b89 -> :sswitch_0
    .end sparse-switch

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
    .line 556
    .line 557
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

    .line 471
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;->parseField(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
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
    const-string v0, "operationConfig"

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
    const/16 v3, 0x14

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "creative"

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
    const/16 v3, 0x13

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "clickMercury"

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
    const/16 v3, 0x12

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "behaviorMercury"

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
    const/16 v3, 0x11

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "viewMercury"

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
    const/16 v3, 0x10

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "issueTimestamp"

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
    const/16 v3, 0xf

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "version"

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
    const/16 v3, 0xe

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "cacheEnable"

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
    const/16 v3, 0xd

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "price"

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
    const/16 v3, 0xc

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "dspId"

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
    const/16 v3, 0xb

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "type"

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
    const/16 v3, 0xa

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "href"

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
    const/16 v3, 0x9

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "url"

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
    const/16 v3, 0x8

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "id"

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
    goto :goto_0

    .line 207
    :cond_d
    const/4 v3, 0x7

    .line 208
    goto :goto_0

    .line 209
    :sswitch_e
    const-string v0, "ad"

    .line 210
    .line 211
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-nez v0, :cond_e

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_e
    const/4 v3, 0x6

    .line 219
    goto :goto_0

    .line 220
    :sswitch_f
    const-string v0, "constraint"

    .line 221
    .line 222
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_f

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_f
    const/4 v3, 0x5

    .line 230
    goto :goto_0

    .line 231
    :sswitch_10
    const-string v0, "skipMercury"

    .line 232
    .line 233
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_10

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_10
    const/4 v3, 0x4

    .line 241
    goto :goto_0

    .line 242
    :sswitch_11
    const-string v0, "budgetType"

    .line 243
    .line 244
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_11

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_11
    const/4 v3, 0x3

    .line 252
    goto :goto_0

    .line 253
    :sswitch_12
    const-string v0, "scenes"

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_12

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_12
    const/4 v3, 0x2

    .line 263
    goto :goto_0

    .line 264
    :sswitch_13
    const-string v0, "ifBeRealtime"

    .line 265
    .line 266
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-nez v0, :cond_13

    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_13
    move v3, v2

    .line 274
    goto :goto_0

    .line 275
    :sswitch_14
    const-string v0, "duration"

    .line 276
    .line 277
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-nez v0, :cond_14

    .line 282
    .line 283
    goto :goto_0

    .line 284
    :cond_14
    move v3, v1

    .line 285
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 286
    .line 287
    .line 288
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 289
    .line 290
    .line 291
    move-result p0

    .line 292
    return p0

    .line 293
    :pswitch_0
    return v2

    .line 294
    :pswitch_1
    return v1

    .line 295
    :pswitch_2
    return v2

    .line 296
    nop

    .line 297
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_14
        -0x3a70ec35 -> :sswitch_13
        -0x36200699 -> :sswitch_12
        -0x292077e1 -> :sswitch_11
        -0x23edbb6c -> :sswitch_10
        -0xb58ea23 -> :sswitch_f
        0xc23 -> :sswitch_e
        0xd1b -> :sswitch_d
        0x1c56f -> :sswitch_c
        0x30ff2b -> :sswitch_b
        0x368f3a -> :sswitch_a
        0x5b722bc -> :sswitch_9
        0x65fb149 -> :sswitch_8
        0x90597a5 -> :sswitch_7
        0x14f51cd8 -> :sswitch_6
        0x25db843d -> :sswitch_5
        0x3843f8ae -> :sswitch_4
        0x4d93f461 -> :sswitch_3
        0x59f0f86b -> :sswitch_2
        0x6c816faf -> :sswitch_1
        0x782d5b89 -> :sswitch_0
    .end sparse-switch

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
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

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
    const-string p0, "version"

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "viewMercury"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "skipMercury"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "clickMercury"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "behaviorMercury"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    const-string p0, "duration"

    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 85
    .line 86
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 90
    .line 91
    if-eqz p0, :cond_5

    .line 92
    .line 93
    const-string p0, "constraint"

    .line 94
    .line 95
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-object p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 99
    .line 100
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 101
    .line 102
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 103
    .line 104
    .line 105
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_6

    .line 108
    .line 109
    const-string v1, "url"

    .line 110
    .line 111
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string v1, "href"

    .line 119
    .line 120
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string p0, "ad"

    .line 128
    .line 129
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/data/ADInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 135
    .line 136
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 137
    .line 138
    .line 139
    :cond_8
    const-string p0, "cacheEnable"

    .line 140
    .line 141
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 142
    .line 143
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string p0, "scenes"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 156
    .line 157
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 158
    .line 159
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string v1, "type"

    .line 167
    .line 168
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "creative"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/data/CreativeOms;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 183
    .line 184
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 188
    .line 189
    if-eqz p0, :cond_c

    .line 190
    .line 191
    const-string p0, "operationConfig"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/data/OperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 197
    .line 198
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 199
    .line 200
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 201
    .line 202
    .line 203
    :cond_c
    const-string p0, "budgetType"

    .line 204
    .line 205
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 206
    .line 207
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 208
    .line 209
    .line 210
    const-string p0, "ifBeRealtime"

    .line 211
    .line 212
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 213
    .line 214
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz p0, :cond_d

    .line 220
    .line 221
    const-string v0, "dspId"

    .line 222
    .line 223
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    :cond_d
    const-string p0, "issueTimestamp"

    .line 227
    .line 228
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 229
    .line 230
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 231
    .line 232
    .line 233
    const-string p0, "price"

    .line 234
    .line 235
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 236
    .line 237
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;->serializeFields(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
