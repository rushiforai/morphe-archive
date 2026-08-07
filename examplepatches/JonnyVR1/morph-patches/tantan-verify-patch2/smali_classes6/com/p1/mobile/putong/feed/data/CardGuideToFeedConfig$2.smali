.class Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;->newInstance()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
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
    const/4 p4, 0x0

    .line 9
    const/4 p5, 0x1

    .line 10
    const/4 p6, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "misMatchSwipeCountLimite"

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
    const/16 p6, 0xf

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "disLikeLikeTypeTipsFemal"

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
    const/16 p6, 0xe

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "misMatchLikeTypeTipsFemal"

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
    const/16 p6, 0xd

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "disLikeFollowTypeTipsFemal"

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
    const/16 p6, 0xc

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "disLikeNoFollowTypeTipsMale"

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
    const/16 p6, 0xb

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "disLikeLikeTypeTipsMale"

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
    const/16 p6, 0xa

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "misMatchNoFollowTypeTipsMale"

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
    const/16 p6, 0x9

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "disLikeNewUserLimite"

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
    const/16 p6, 0x8

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "misMatchNewUserLimite"

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
    goto :goto_0

    .line 137
    :cond_8
    const/4 p6, 0x7

    .line 138
    goto :goto_0

    .line 139
    :sswitch_9
    const-string p0, "misMatchLikeTypeTipsMale"

    .line 140
    .line 141
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-nez p0, :cond_9

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_9
    const/4 p6, 0x6

    .line 149
    goto :goto_0

    .line 150
    :sswitch_a
    const-string p0, "disLikeFollowTypeTipsMale"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-nez p0, :cond_a

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_a
    const/4 p6, 0x5

    .line 160
    goto :goto_0

    .line 161
    :sswitch_b
    const-string p0, "misMatchNoFollowTypeTipsFemal"

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-nez p0, :cond_b

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_b
    const/4 p6, 0x4

    .line 171
    goto :goto_0

    .line 172
    :sswitch_c
    const-string p0, "misMatchFollowTypeTipsMale"

    .line 173
    .line 174
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-nez p0, :cond_c

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_c
    const/4 p6, 0x3

    .line 182
    goto :goto_0

    .line 183
    :sswitch_d
    const-string p0, "disLikeSwipeCountLimite"

    .line 184
    .line 185
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    if-nez p0, :cond_d

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_d
    const/4 p6, 0x2

    .line 193
    goto :goto_0

    .line 194
    :sswitch_e
    const-string p0, "misMatchFollowTypeTipsFemal"

    .line 195
    .line 196
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-nez p0, :cond_e

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_e
    move p6, p5

    .line 204
    goto :goto_0

    .line 205
    :sswitch_f
    const-string p0, "disLikeNoFollowTypeTipsFemal"

    .line 206
    .line 207
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-nez p0, :cond_f

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_f
    move p6, p4

    .line 215
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 216
    .line 217
    .line 218
    return p4

    .line 219
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 224
    .line 225
    return p5

    .line 226
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 231
    .line 232
    return p5

    .line 233
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 238
    .line 239
    return p5

    .line 240
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 245
    .line 246
    return p5

    .line 247
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 252
    .line 253
    return p5

    .line 254
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 259
    .line 260
    return p5

    .line 261
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 266
    .line 267
    return p5

    .line 268
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 273
    .line 274
    return p5

    .line 275
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 280
    .line 281
    return p5

    .line 282
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 287
    .line 288
    return p5

    .line 289
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 294
    .line 295
    return p5

    .line 296
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 301
    .line 302
    return p5

    .line 303
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 308
    .line 309
    return p5

    .line 310
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 315
    .line 316
    return p5

    .line 317
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 322
    .line 323
    return p5

    .line 324
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 329
    .line 330
    return p5

    .line 331
    :sswitch_data_0
    .sparse-switch
        -0x6a250230 -> :sswitch_f
        -0x66cf8af8 -> :sswitch_e
        -0x5cc1923c -> :sswitch_d
        -0x3d1c58a2 -> :sswitch_c
        -0x3a1766f9 -> :sswitch_b
        -0x2fc460cb -> :sswitch_a
        -0x26d8523c -> :sswitch_9
        -0x21300999 -> :sswitch_8
        -0x56bcbd0 -> :sswitch_7
        0xea7877f -> :sswitch_6
        0x12f9af5b -> :sswitch_5
        0x25e0e596 -> :sswitch_4
        0x36d77811 -> :sswitch_3
        0x4b6d3b62 -> :sswitch_2
        0x4bdb6cab -> :sswitch_1
        0x696c6c2d -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 331
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;->parseField(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
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
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "misMatchSwipeCountLimite"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0xf

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "disLikeLikeTypeTipsFemal"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0xe

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "misMatchLikeTypeTipsFemal"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0xd

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "disLikeFollowTypeTipsFemal"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0xc

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "disLikeNoFollowTypeTipsMale"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0xb

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "disLikeLikeTypeTipsMale"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0xa

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "misMatchNoFollowTypeTipsMale"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0x9

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "disLikeNewUserLimite"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0x8

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "misMatchNewUserLimite"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_8
    const/4 v2, 0x7

    .line 137
    goto :goto_0

    .line 138
    :sswitch_9
    const-string v0, "misMatchLikeTypeTipsMale"

    .line 139
    .line 140
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_9

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_9
    const/4 v2, 0x6

    .line 148
    goto :goto_0

    .line 149
    :sswitch_a
    const-string v0, "disLikeFollowTypeTipsMale"

    .line 150
    .line 151
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_a

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_a
    const/4 v2, 0x5

    .line 159
    goto :goto_0

    .line 160
    :sswitch_b
    const-string v0, "misMatchNoFollowTypeTipsFemal"

    .line 161
    .line 162
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_b

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_b
    const/4 v2, 0x4

    .line 170
    goto :goto_0

    .line 171
    :sswitch_c
    const-string v0, "misMatchFollowTypeTipsMale"

    .line 172
    .line 173
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_c

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_c
    const/4 v2, 0x3

    .line 181
    goto :goto_0

    .line 182
    :sswitch_d
    const-string v0, "disLikeSwipeCountLimite"

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_d

    .line 189
    .line 190
    goto :goto_0

    .line 191
    :cond_d
    const/4 v2, 0x2

    .line 192
    goto :goto_0

    .line 193
    :sswitch_e
    const-string v0, "misMatchFollowTypeTipsFemal"

    .line 194
    .line 195
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_e

    .line 200
    .line 201
    goto :goto_0

    .line 202
    :cond_e
    move v2, v1

    .line 203
    goto :goto_0

    .line 204
    :sswitch_f
    const-string v0, "disLikeNoFollowTypeTipsFemal"

    .line 205
    .line 206
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-nez v0, :cond_f

    .line 211
    .line 212
    goto :goto_0

    .line 213
    :cond_f
    const/4 v2, 0x0

    .line 214
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 215
    .line 216
    .line 217
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    return p0

    .line 222
    :pswitch_0
    return v1

    .line 223
    :sswitch_data_0
    .sparse-switch
        -0x6a250230 -> :sswitch_f
        -0x66cf8af8 -> :sswitch_e
        -0x5cc1923c -> :sswitch_d
        -0x3d1c58a2 -> :sswitch_c
        -0x3a1766f9 -> :sswitch_b
        -0x2fc460cb -> :sswitch_a
        -0x26d8523c -> :sswitch_9
        -0x21300999 -> :sswitch_8
        -0x56bcbd0 -> :sswitch_7
        0xea7877f -> :sswitch_6
        0x12f9af5b -> :sswitch_5
        0x25e0e596 -> :sswitch_4
        0x36d77811 -> :sswitch_3
        0x4b6d3b62 -> :sswitch_2
        0x4bdb6cab -> :sswitch_1
        0x696c6c2d -> :sswitch_0
    .end sparse-switch

    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 223
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "disLikeNewUserLimite"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "misMatchNewUserLimite"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "disLikeSwipeCountLimite"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "misMatchSwipeCountLimite"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const-string v0, "disLikeFollowTypeTipsFemal"

    .line 34
    .line 35
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const-string v0, "misMatchFollowTypeTipsFemal"

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const-string v0, "disLikeFollowTypeTipsMale"

    .line 52
    .line 53
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    const-string v0, "misMatchFollowTypeTipsMale"

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const-string v0, "disLikeNoFollowTypeTipsFemal"

    .line 70
    .line 71
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    const-string v0, "misMatchNoFollowTypeTipsFemal"

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_6

    .line 86
    .line 87
    const-string v0, "disLikeNoFollowTypeTipsMale"

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    const-string v0, "misMatchNoFollowTypeTipsMale"

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p0, :cond_8

    .line 104
    .line 105
    const-string v0, "disLikeLikeTypeTipsFemal"

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p0, :cond_9

    .line 113
    .line 114
    const-string v0, "misMatchLikeTypeTipsFemal"

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz p0, :cond_a

    .line 122
    .line 123
    const-string v0, "disLikeLikeTypeTipsMale"

    .line 124
    .line 125
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_b

    .line 131
    .line 132
    const-string p1, "misMatchLikeTypeTipsMale"

    .line 133
    .line 134
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
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

    .line 138
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
