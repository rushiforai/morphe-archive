.class Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSettings;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettings;",
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
    const-string p0, "wealthLogoConfig"

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
    const/16 v2, 0x18

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "templates"

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
    const/16 v2, 0x17

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "voiceLiveConfig"

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
    const/16 v2, 0x16

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "intlLiveTemplatesMetadata"

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
    const/16 v2, 0x15

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "liveSkinConfig"

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
    const/16 v2, 0x14

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "liveSquareTabs"

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
    const/16 v2, 0x13

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "chatTips"

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
    const/16 v2, 0x12

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "liveAble"

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
    const/16 v2, 0x11

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "liveLabels"

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
    const/16 v2, 0x10

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "wealthLogoNewIconConfig"

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
    const/16 v2, 0xf

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "liveConfig"

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
    const/16 v2, 0xe

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "predefineMessages"

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
    const/16 v2, 0xd

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "intlOctopusGameUrlPrefix"

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
    const/16 v2, 0xc

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "intlLiveConfig"

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
    const/16 v2, 0xb

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "resourceConfig"

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
    const/16 v2, 0xa

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "voiceLiveTemplates"

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
    const/16 v2, 0x9

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "sensitiveWords"

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
    const/16 v2, 0x8

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "expConfig"

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
    goto :goto_0

    .line 263
    :cond_11
    const/4 v2, 0x7

    .line 264
    goto :goto_0

    .line 265
    :sswitch_12
    const-string p0, "swipeCardConfig"

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-nez p0, :cond_12

    .line 272
    .line 273
    goto :goto_0

    .line 274
    :cond_12
    const/4 v2, 0x6

    .line 275
    goto :goto_0

    .line 276
    :sswitch_13
    const-string p0, "videoChatConfig"

    .line 277
    .line 278
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    if-nez p0, :cond_13

    .line 283
    .line 284
    goto :goto_0

    .line 285
    :cond_13
    const/4 v2, 0x5

    .line 286
    goto :goto_0

    .line 287
    :sswitch_14
    const-string p0, "swipeVirtualVoiceCardConfig"

    .line 288
    .line 289
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-nez p0, :cond_14

    .line 294
    .line 295
    goto :goto_0

    .line 296
    :cond_14
    const/4 v2, 0x4

    .line 297
    goto :goto_0

    .line 298
    :sswitch_15
    const-string p0, "wealthLogoNewIconConfigV2"

    .line 299
    .line 300
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    if-nez p0, :cond_15

    .line 305
    .line 306
    goto :goto_0

    .line 307
    :cond_15
    const/4 v2, 0x3

    .line 308
    goto :goto_0

    .line 309
    :sswitch_16
    const-string p0, "intlGameSquareUrl"

    .line 310
    .line 311
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result p0

    .line 315
    if-nez p0, :cond_16

    .line 316
    .line 317
    goto :goto_0

    .line 318
    :cond_16
    const/4 v2, 0x2

    .line 319
    goto :goto_0

    .line 320
    :sswitch_17
    const-string p0, "tttLiveConfig"

    .line 321
    .line 322
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    if-nez p0, :cond_17

    .line 327
    .line 328
    goto :goto_0

    .line 329
    :cond_17
    move v2, v1

    .line 330
    goto :goto_0

    .line 331
    :sswitch_18
    const-string p0, "liveSquareExtTabs"

    .line 332
    .line 333
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result p0

    .line 337
    if-nez p0, :cond_18

    .line 338
    .line 339
    goto :goto_0

    .line 340
    :cond_18
    move v2, v0

    .line 341
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 342
    .line 343
    .line 344
    return v0

    .line 345
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 346
    .line 347
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 352
    .line 353
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 354
    .line 355
    return v1

    .line 356
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    .line 358
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 363
    .line 364
    return v1

    .line 365
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 366
    .line 367
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 372
    .line 373
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 374
    .line 375
    return v1

    .line 376
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 377
    .line 378
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 383
    .line 384
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 385
    .line 386
    return v1

    .line 387
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 388
    .line 389
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 394
    .line 395
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 396
    .line 397
    return v1

    .line 398
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 399
    .line 400
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 405
    .line 406
    return v1

    .line 407
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 408
    .line 409
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 414
    .line 415
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 416
    .line 417
    return v1

    .line 418
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 419
    .line 420
    .line 421
    move-result p0

    .line 422
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 423
    .line 424
    return v1

    .line 425
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 426
    .line 427
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 428
    .line 429
    .line 430
    move-result-object p0

    .line 431
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 432
    .line 433
    return v1

    .line 434
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 435
    .line 436
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 441
    .line 442
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 443
    .line 444
    return v1

    .line 445
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 446
    .line 447
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object p0

    .line 451
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 452
    .line 453
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 454
    .line 455
    return v1

    .line 456
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 457
    .line 458
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 463
    .line 464
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 465
    .line 466
    return v1

    .line 467
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object p0

    .line 471
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 472
    .line 473
    return v1

    .line 474
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 475
    .line 476
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 481
    .line 482
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 483
    .line 484
    return v1

    .line 485
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 486
    .line 487
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object p0

    .line 491
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 492
    .line 493
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 494
    .line 495
    return v1

    .line 496
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 497
    .line 498
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object p0

    .line 502
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 503
    .line 504
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 505
    .line 506
    return v1

    .line 507
    :pswitch_10
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 508
    .line 509
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 514
    .line 515
    return v1

    .line 516
    :pswitch_11
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 517
    .line 518
    invoke-static {p3, p0, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parseMap(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Ljava/util/HashMap;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 523
    .line 524
    return v1

    .line 525
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 526
    .line 527
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 532
    .line 533
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 534
    .line 535
    return v1

    .line 536
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 537
    .line 538
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object p0

    .line 542
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 543
    .line 544
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 545
    .line 546
    return v1

    .line 547
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 548
    .line 549
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 554
    .line 555
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 556
    .line 557
    return v1

    .line 558
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 559
    .line 560
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 565
    .line 566
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 567
    .line 568
    return v1

    .line 569
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object p0

    .line 573
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 574
    .line 575
    return v1

    .line 576
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 577
    .line 578
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 583
    .line 584
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 585
    .line 586
    return v1

    .line 587
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 588
    .line 589
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 590
    .line 591
    .line 592
    move-result-object p0

    .line 593
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 594
    .line 595
    return v1

    .line 596
    nop

    .line 597
    :sswitch_data_0
    .sparse-switch
        -0x7df2342a -> :sswitch_18
        -0x695d839e -> :sswitch_17
        -0x5fdf901d -> :sswitch_16
        -0x435afb61 -> :sswitch_15
        -0x3672956d -> :sswitch_14
        -0x35280c6b -> :sswitch_13
        -0x32a5c6b4 -> :sswitch_12
        -0x3214d041 -> :sswitch_11
        -0x2ea7764d -> :sswitch_10
        -0x23343465 -> :sswitch_f
        -0x1dfb8f10 -> :sswitch_e
        -0x39d8e75 -> :sswitch_d
        -0x181e013 -> :sswitch_c
        0x69e2d8a -> :sswitch_b
        0x1851bf4e -> :sswitch_a
        0x1a919ec3 -> :sswitch_9
        0x26e29c0b -> :sswitch_8
        0x54776466 -> :sswitch_7
        0x55aceeb0 -> :sswitch_6
        0x5ad58047 -> :sswitch_5
        0x62c2d92b -> :sswitch_4
        0x67f4d39f -> :sswitch_3
        0x751c2620 -> :sswitch_2
        0x761ec339 -> :sswitch_1
        0x7fa1a45a -> :sswitch_0
    .end sparse-switch

    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 597
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "liveConfig"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "templates"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "predefineMessages"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "sensitiveWords"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 60
    .line 61
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "liveLabels"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "liveSquareTabs"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "chatTips"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "liveSquareExtTabs"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    const-string p0, "liveAble"

    .line 131
    .line 132
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 133
    .line 134
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 138
    .line 139
    if-eqz p0, :cond_8

    .line 140
    .line 141
    const-string p0, "voiceLiveConfig"

    .line 142
    .line 143
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 147
    .line 148
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 149
    .line 150
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 151
    .line 152
    .line 153
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 154
    .line 155
    if-eqz p0, :cond_9

    .line 156
    .line 157
    const-string p0, "liveSkinConfig"

    .line 158
    .line 159
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 163
    .line 164
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 165
    .line 166
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 167
    .line 168
    .line 169
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 170
    .line 171
    if-eqz p0, :cond_a

    .line 172
    .line 173
    const-string p0, "wealthLogoConfig"

    .line 174
    .line 175
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 179
    .line 180
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 181
    .line 182
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 183
    .line 184
    .line 185
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 186
    .line 187
    if-eqz p0, :cond_b

    .line 188
    .line 189
    const-string p0, "resourceConfig"

    .line 190
    .line 191
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 195
    .line 196
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 197
    .line 198
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 199
    .line 200
    .line 201
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 202
    .line 203
    if-eqz p0, :cond_c

    .line 204
    .line 205
    const-string p0, "swipeCardConfig"

    .line 206
    .line 207
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 211
    .line 212
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 213
    .line 214
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 215
    .line 216
    .line 217
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 218
    .line 219
    if-eqz p0, :cond_d

    .line 220
    .line 221
    const-string p0, "voiceLiveTemplates"

    .line 222
    .line 223
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 227
    .line 228
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 229
    .line 230
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 231
    .line 232
    .line 233
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 234
    .line 235
    if-eqz p0, :cond_e

    .line 236
    .line 237
    const-string p0, "swipeVirtualVoiceCardConfig"

    .line 238
    .line 239
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 243
    .line 244
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 245
    .line 246
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 247
    .line 248
    .line 249
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 250
    .line 251
    if-eqz p0, :cond_f

    .line 252
    .line 253
    const-string p0, "wealthLogoNewIconConfig"

    .line 254
    .line 255
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    .line 260
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 261
    .line 262
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 263
    .line 264
    .line 265
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 266
    .line 267
    if-eqz p0, :cond_10

    .line 268
    .line 269
    const-string p0, "wealthLogoNewIconConfigV2"

    .line 270
    .line 271
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 275
    .line 276
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 277
    .line 278
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 279
    .line 280
    .line 281
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 282
    .line 283
    if-eqz p0, :cond_11

    .line 284
    .line 285
    const-string p0, "expConfig"

    .line 286
    .line 287
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 291
    .line 292
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 293
    .line 294
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeMap(Ljava/util/Map;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 295
    .line 296
    .line 297
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 298
    .line 299
    if-eqz p0, :cond_12

    .line 300
    .line 301
    const-string p0, "intlLiveTemplatesMetadata"

    .line 302
    .line 303
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 307
    .line 308
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 309
    .line 310
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 311
    .line 312
    .line 313
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 314
    .line 315
    if-eqz p0, :cond_13

    .line 316
    .line 317
    const-string p0, "intlLiveConfig"

    .line 318
    .line 319
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 323
    .line 324
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 325
    .line 326
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 327
    .line 328
    .line 329
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 330
    .line 331
    if-eqz p0, :cond_14

    .line 332
    .line 333
    const-string p0, "videoChatConfig"

    .line 334
    .line 335
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 341
    .line 342
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 343
    .line 344
    .line 345
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 346
    .line 347
    if-eqz p0, :cond_15

    .line 348
    .line 349
    const-string v1, "intlOctopusGameUrlPrefix"

    .line 350
    .line 351
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 355
    .line 356
    if-eqz p0, :cond_16

    .line 357
    .line 358
    const-string v1, "intlGameSquareUrl"

    .line 359
    .line 360
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 364
    .line 365
    if-eqz p0, :cond_17

    .line 366
    .line 367
    const-string p0, "tttLiveConfig"

    .line 368
    .line 369
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 373
    .line 374
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 375
    .line 376
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 377
    .line 378
    .line 379
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

    .line 380
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
