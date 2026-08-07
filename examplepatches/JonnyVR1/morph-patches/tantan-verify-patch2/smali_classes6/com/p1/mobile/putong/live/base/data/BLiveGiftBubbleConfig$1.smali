.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;",
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
    const-string p0, "styleType"

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
    const/16 v2, 0x17

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "iconUrl"

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
    const/16 v2, 0x16

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "displayRules"

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
    const/16 v2, 0x15

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "backgroundColor"

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
    const/16 v2, 0x14

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "content"

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
    const/16 v2, 0x13

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "giftNums"

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
    const/16 v2, 0x12

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "contentColor"

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
    const/16 v2, 0x11

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "bubbleText"

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
    const/16 v2, 0x10

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "toast"

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
    const/16 v2, 0xf

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "title"

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
    const/16 v2, 0xe

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "extra"

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
    const/16 v2, 0xd

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
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v2, 0xc

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "giftItemId"

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
    const/16 v2, 0xb

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "contentDesc"

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
    const/16 v2, 0xa

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "bubbleShowAfterWatch"

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
    const/16 v2, 0x9

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "remindID"

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
    const/16 v2, 0x8

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "window"

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
    goto :goto_0

    .line 249
    :cond_10
    const/4 v2, 0x7

    .line 250
    goto :goto_0

    .line 251
    :sswitch_11
    const-string p0, "schema"

    .line 252
    .line 253
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-nez p0, :cond_11

    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_11
    const/4 v2, 0x6

    .line 261
    goto :goto_0

    .line 262
    :sswitch_12
    const-string p0, "remind"

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    if-nez p0, :cond_12

    .line 269
    .line 270
    goto :goto_0

    .line 271
    :cond_12
    const/4 v2, 0x5

    .line 272
    goto :goto_0

    .line 273
    :sswitch_13
    const-string p0, "header"

    .line 274
    .line 275
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    if-nez p0, :cond_13

    .line 280
    .line 281
    goto :goto_0

    .line 282
    :cond_13
    const/4 v2, 0x4

    .line 283
    goto :goto_0

    .line 284
    :sswitch_14
    const-string p0, "button"

    .line 285
    .line 286
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result p0

    .line 290
    if-nez p0, :cond_14

    .line 291
    .line 292
    goto :goto_0

    .line 293
    :cond_14
    const/4 v2, 0x3

    .line 294
    goto :goto_0

    .line 295
    :sswitch_15
    const-string p0, "blackClose"

    .line 296
    .line 297
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    if-nez p0, :cond_15

    .line 302
    .line 303
    goto :goto_0

    .line 304
    :cond_15
    const/4 v2, 0x2

    .line 305
    goto :goto_0

    .line 306
    :sswitch_16
    const-string p0, "descriptions"

    .line 307
    .line 308
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    if-nez p0, :cond_16

    .line 313
    .line 314
    goto :goto_0

    .line 315
    :cond_16
    move v2, v1

    .line 316
    goto :goto_0

    .line 317
    :sswitch_17
    const-string p0, "showClose"

    .line 318
    .line 319
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    if-nez p0, :cond_17

    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_17
    move v2, v0

    .line 327
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 328
    .line 329
    .line 330
    return v0

    .line 331
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 332
    .line 333
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 338
    .line 339
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 340
    .line 341
    return v1

    .line 342
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 347
    .line 348
    return v1

    .line 349
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 356
    .line 357
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 358
    .line 359
    return v1

    .line 360
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 365
    .line 366
    return v1

    .line 367
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 372
    .line 373
    return v1

    .line 374
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 375
    .line 376
    .line 377
    move-result p0

    .line 378
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 379
    .line 380
    return v1

    .line 381
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 386
    .line 387
    return v1

    .line 388
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 393
    .line 394
    return v1

    .line 395
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 396
    .line 397
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 402
    .line 403
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 404
    .line 405
    return v1

    .line 406
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 411
    .line 412
    return v1

    .line 413
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 418
    .line 419
    return v1

    .line 420
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 425
    .line 426
    return v1

    .line 427
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 428
    .line 429
    .line 430
    move-result p0

    .line 431
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 432
    .line 433
    return v1

    .line 434
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p0

    .line 438
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 439
    .line 440
    return v1

    .line 441
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 442
    .line 443
    .line 444
    move-result p0

    .line 445
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 446
    .line 447
    return v1

    .line 448
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 449
    .line 450
    .line 451
    move-result p0

    .line 452
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 453
    .line 454
    return v1

    .line 455
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 456
    .line 457
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 458
    .line 459
    .line 460
    move-result-object p0

    .line 461
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 462
    .line 463
    return v1

    .line 464
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    .line 473
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 478
    .line 479
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 480
    .line 481
    return v1

    .line 482
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 483
    .line 484
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 489
    .line 490
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 491
    .line 492
    return v1

    .line 493
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 494
    .line 495
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object p0

    .line 499
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 500
    .line 501
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 502
    .line 503
    return v1

    .line 504
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 505
    .line 506
    .line 507
    move-result p0

    .line 508
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 509
    .line 510
    return v1

    .line 511
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 512
    .line 513
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 514
    .line 515
    .line 516
    move-result-object p0

    .line 517
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 518
    .line 519
    return v1

    .line 520
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 521
    .line 522
    .line 523
    move-result p0

    .line 524
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 525
    .line 526
    return v1

    .line 527
    :sswitch_data_0
    .sparse-switch
        -0x73009705 -> :sswitch_17
        -0x72850409 -> :sswitch_16
        -0x632f7ac7 -> :sswitch_15
        -0x521dd8ce -> :sswitch_14
        -0x48cb1d73 -> :sswitch_13
        -0x37b51efb -> :sswitch_12
        -0x361eca5f -> :sswitch_11
        -0x2ef42410 -> :sswitch_10
        -0x1ee94320 -> :sswitch_f
        -0x18726d24 -> :sswitch_e
        -0x17393d56 -> :sswitch_d
        -0x7334322 -> :sswitch_c
        0x368f3a -> :sswitch_b
        0x5c79410 -> :sswitch_a
        0x6942258 -> :sswitch_9
        0x6969627 -> :sswitch_8
        0x9bc47d9 -> :sswitch_7
        0x3007ee6a -> :sswitch_6
        0x329d8afd -> :sswitch_5
        0x38b73479 -> :sswitch_4
        0x4cb7f6d5 -> :sswitch_3
        0x5f906955 -> :sswitch_2
        0x61ad9236 -> :sswitch_1
        0x6b9ae08b -> :sswitch_0
    .end sparse-switch

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
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 527
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "title"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "content"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "bubbleText"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "iconUrl"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    const-string p0, "giftItemId"

    .line 38
    .line 39
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 40
    .line 41
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    const-string p0, "giftNums"

    .line 45
    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    const-string p0, "bubbleShowAfterWatch"

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "displayRules"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 71
    .line 72
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    const-string p0, "remindID"

    .line 76
    .line 77
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 78
    .line 79
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string v1, "schema"

    .line 87
    .line 88
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string p0, "button"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 103
    .line 104
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string p0, "remind"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 119
    .line 120
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string v1, "type"

    .line 128
    .line 129
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    const-string v1, "extra"

    .line 137
    .line 138
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 142
    .line 143
    if-eqz p0, :cond_a

    .line 144
    .line 145
    const-string p0, "toast"

    .line 146
    .line 147
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    .line 152
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 153
    .line 154
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 155
    .line 156
    .line 157
    :cond_a
    const-string p0, "showClose"

    .line 158
    .line 159
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 160
    .line 161
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 165
    .line 166
    if-eqz p0, :cond_b

    .line 167
    .line 168
    const-string p0, "header"

    .line 169
    .line 170
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 174
    .line 175
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 176
    .line 177
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 178
    .line 179
    .line 180
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz p0, :cond_c

    .line 183
    .line 184
    const-string v1, "backgroundColor"

    .line 185
    .line 186
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    const-string v1, "contentColor"

    .line 194
    .line 195
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_d
    const-string p0, "blackClose"

    .line 199
    .line 200
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 201
    .line 202
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 206
    .line 207
    if-eqz p0, :cond_e

    .line 208
    .line 209
    const-string p0, "styleType"

    .line 210
    .line 211
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 215
    .line 216
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 217
    .line 218
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 219
    .line 220
    .line 221
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 222
    .line 223
    if-eqz p0, :cond_f

    .line 224
    .line 225
    const-string p0, "descriptions"

    .line 226
    .line 227
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 231
    .line 232
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 233
    .line 234
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 235
    .line 236
    .line 237
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 238
    .line 239
    if-eqz p0, :cond_10

    .line 240
    .line 241
    const-string p0, "window"

    .line 242
    .line 243
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 247
    .line 248
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 249
    .line 250
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 251
    .line 252
    .line 253
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 254
    .line 255
    if-eqz p0, :cond_11

    .line 256
    .line 257
    const-string p1, "contentDesc"

    .line 258
    .line 259
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
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

    .line 263
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
