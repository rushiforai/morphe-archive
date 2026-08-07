.class Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
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
    const-string p0, "minAnchorHierarchyTip"

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
    const-string p0, "alignment"

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
    const-string p0, "animation"

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
    const-string p0, "minAnchorHierarchy"

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
    const-string p0, "bubbleIds"

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
    const-string p0, "category"

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
    const-string p0, "type"

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
    const-string p0, "text"

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
    const-string p0, "name"

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
    const-string p0, "icon"

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
    const-string p0, "url"

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
    const-string p0, "id"

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
    const-string p0, "callback"

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
    const-string p0, "jumpType"

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
    const-string p0, "redDotCount"

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
    const-string p0, "enableNewlyEffect"

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
    const-string p0, "isClosed"

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
    const-string p0, "ticker"

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
    const-string p0, "labels"

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
    const-string p0, "fillUp"

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
    const-string p0, "enableRedDot"

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 297
    .line 298
    .line 299
    move-result p0

    .line 300
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 301
    .line 302
    return v1

    .line 303
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    .line 305
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 310
    .line 311
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 312
    .line 313
    return v1

    .line 314
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_4
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 322
    .line 323
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 328
    .line 329
    return v1

    .line 330
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 331
    .line 332
    .line 333
    move-result p0

    .line 334
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 335
    .line 336
    return v1

    .line 337
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 342
    .line 343
    return v1

    .line 344
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 349
    .line 350
    return v1

    .line 351
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 356
    .line 357
    return v1

    .line 358
    :pswitch_9
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 359
    .line 360
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 365
    .line 366
    return v1

    .line 367
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 372
    .line 373
    return v1

    .line 374
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 375
    .line 376
    .line 377
    move-result p0

    .line 378
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 379
    .line 380
    return v0

    .line 381
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 386
    .line 387
    return v1

    .line 388
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 393
    .line 394
    return v1

    .line 395
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 396
    .line 397
    .line 398
    move-result p0

    .line 399
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 400
    .line 401
    return v1

    .line 402
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 403
    .line 404
    .line 405
    move-result p0

    .line 406
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 407
    .line 408
    return v1

    .line 409
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 410
    .line 411
    .line 412
    move-result p0

    .line 413
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 414
    .line 415
    return v1

    .line 416
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 417
    .line 418
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 423
    .line 424
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 425
    .line 426
    return v1

    .line 427
    :pswitch_12
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 428
    .line 429
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 434
    .line 435
    return v1

    .line 436
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 437
    .line 438
    .line 439
    move-result p0

    .line 440
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 441
    .line 442
    return v1

    .line 443
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 444
    .line 445
    .line 446
    move-result p0

    .line 447
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 448
    .line 449
    return v1

    .line 450
    nop

    .line 451
    :sswitch_data_0
    .sparse-switch
        -0x671f1da5 -> :sswitch_14
        -0x4bf75482 -> :sswitch_13
        -0x422fa001 -> :sswitch_12
        -0x341794f6 -> :sswitch_11
        -0x28bd2cca -> :sswitch_10
        -0x1b125e65 -> :sswitch_f
        -0x14f94309 -> :sswitch_e
        -0xf37cf78 -> :sswitch_d
        -0xa43dfbb -> :sswitch_c
        0xd1b -> :sswitch_b
        0x1c56f -> :sswitch_a
        0x313c79 -> :sswitch_9
        0x337a8b -> :sswitch_8
        0x36452d -> :sswitch_7
        0x368f3a -> :sswitch_6
        0x302bcfe -> :sswitch_5
        0x299a8e8c -> :sswitch_4
        0x3cb28e4e -> :sswitch_3
        0x42ab1b84 -> :sswitch_2
        0x695fa1e3 -> :sswitch_1
        0x6ebf6f6d -> :sswitch_0
    .end sparse-switch

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
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
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

    .line 451
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "id"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string v0, "name"

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "jumpType"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const-string p0, "category"

    .line 27
    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string v0, "url"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 43
    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    const-string p0, "bubbleIds"

    .line 47
    .line 48
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 52
    .line 53
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    .line 55
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    const-string p0, "enableRedDot"

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const-string p0, "icon"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

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
    const-string p0, "fillUp"

    .line 82
    .line 83
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 84
    .line 85
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    const-string v0, "type"

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    const-string p0, "minAnchorHierarchy"

    .line 98
    .line 99
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 100
    .line 101
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz p0, :cond_6

    .line 107
    .line 108
    const-string v0, "minAnchorHierarchyTip"

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    const-string p0, "callback"

    .line 114
    .line 115
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 116
    .line 117
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 118
    .line 119
    .line 120
    const-string p0, "enableNewlyEffect"

    .line 121
    .line 122
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 123
    .line 124
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 128
    .line 129
    if-eqz p0, :cond_7

    .line 130
    .line 131
    const-string p0, "labels"

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 137
    .line 138
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 139
    .line 140
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_7
    const-string p0, "isClosed"

    .line 144
    .line 145
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz p0, :cond_8

    .line 153
    .line 154
    const-string v0, "text"

    .line 155
    .line 156
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 160
    .line 161
    const/4 v0, 0x1

    .line 162
    if-eqz p0, :cond_9

    .line 163
    .line 164
    const-string p0, "ticker"

    .line 165
    .line 166
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 170
    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 172
    .line 173
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 174
    .line 175
    .line 176
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 177
    .line 178
    if-eqz p0, :cond_a

    .line 179
    .line 180
    const-string p0, "animation"

    .line 181
    .line 182
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 188
    .line 189
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 190
    .line 191
    .line 192
    :cond_a
    const-string p0, "redDotCount"

    .line 193
    .line 194
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 195
    .line 196
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 197
    .line 198
    .line 199
    const-string p0, "alignment"

    .line 200
    .line 201
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 202
    .line 203
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
