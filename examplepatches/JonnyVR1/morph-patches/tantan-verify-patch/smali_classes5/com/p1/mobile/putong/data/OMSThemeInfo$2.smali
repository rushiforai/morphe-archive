.class Lcom/p1/mobile/putong/data/OMSThemeInfo$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSThemeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/OMSThemeInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;->newInstance()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/OMSThemeInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
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
    const-string p0, "countdownView"

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
    const/16 v2, 0xe

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "h5popLimit"

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
    const/16 v2, 0xd

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "bubbleOpen"

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
    const/16 v2, 0xc

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "title"

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
    const/16 v2, 0xb

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "h5URL"

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
    const/16 v2, 0xa

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "color"

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
    const/16 v2, 0x9

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "icon"

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
    const/16 v2, 0x8

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "id"

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
    goto :goto_0

    .line 123
    :cond_7
    const/4 v2, 0x7

    .line 124
    goto :goto_0

    .line 125
    :sswitch_8
    const-string p0, "settingTxt"

    .line 126
    .line 127
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-nez p0, :cond_8

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_8
    const/4 v2, 0x6

    .line 135
    goto :goto_0

    .line 136
    :sswitch_9
    const-string p0, "suggestStrategy"

    .line 137
    .line 138
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-nez p0, :cond_9

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_9
    const/4 v2, 0x5

    .line 146
    goto :goto_0

    .line 147
    :sswitch_a
    const-string p0, "bubble"

    .line 148
    .line 149
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-nez p0, :cond_a

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_a
    const/4 v2, 0x4

    .line 157
    goto :goto_0

    .line 158
    :sswitch_b
    const-string p0, "suggestSwitch"

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-nez p0, :cond_b

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_b
    const/4 v2, 0x3

    .line 168
    goto :goto_0

    .line 169
    :sswitch_c
    const-string p0, "questionnaireFinished"

    .line 170
    .line 171
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-nez p0, :cond_c

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_c
    const/4 v2, 0x2

    .line 179
    goto :goto_0

    .line 180
    :sswitch_d
    const-string p0, "bgColors"

    .line 181
    .line 182
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_d

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_d
    move v2, v1

    .line 190
    goto :goto_0

    .line 191
    :sswitch_e
    const-string p0, "subTitle"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-nez p0, :cond_e

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_e
    move v2, v0

    .line 201
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 202
    .line 203
    .line 204
    return v0

    .line 205
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 206
    .line 207
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    check-cast p0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 212
    .line 213
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 214
    .line 215
    return v1

    .line 216
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 221
    .line 222
    return v1

    .line 223
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 224
    .line 225
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    check-cast p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 230
    .line 231
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 232
    .line 233
    return v1

    .line 234
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 239
    .line 240
    return v1

    .line 241
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 246
    .line 247
    return v1

    .line 248
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 253
    .line 254
    return v1

    .line 255
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 260
    .line 261
    return v1

    .line 262
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 267
    .line 268
    return v0

    .line 269
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 274
    .line 275
    return v1

    .line 276
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 277
    .line 278
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    check-cast p0, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 283
    .line 284
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 285
    .line 286
    return v1

    .line 287
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 288
    .line 289
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    check-cast p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 294
    .line 295
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 296
    .line 297
    return v1

    .line 298
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 303
    .line 304
    return v1

    .line 305
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 310
    .line 311
    return v1

    .line 312
    :pswitch_d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 313
    .line 314
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 326
    .line 327
    return v1

    .line 328
    nop

    .line 329
    :sswitch_data_0
    .sparse-switch
        -0x7c93a408 -> :sswitch_e
        -0x7a8751eb -> :sswitch_d
        -0x70b620cb -> :sswitch_c
        -0x6f88a028 -> :sswitch_b
        -0x52264b74 -> :sswitch_a
        -0x403c4ce9 -> :sswitch_9
        -0x3c2600 -> :sswitch_8
        0xd1b -> :sswitch_7
        0x313c79 -> :sswitch_6
        0x5a72f63 -> :sswitch_5
        0x5d2ed62 -> :sswitch_4
        0x6942258 -> :sswitch_3
        0x9ba28f6 -> :sswitch_2
        0x15d763b7 -> :sswitch_1
        0x1ad98476 -> :sswitch_0
    .end sparse-switch

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
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 329
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;->parseField(Lcom/p1/mobile/putong/data/OMSThemeInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/OMSThemeInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
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
    const-string v0, "countdownView"

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
    const/16 v3, 0xe

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "h5popLimit"

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
    const/16 v3, 0xd

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "bubbleOpen"

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
    const/16 v3, 0xc

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "title"

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
    const/16 v3, 0xb

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "h5URL"

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
    const/16 v3, 0xa

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "color"

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
    const/16 v3, 0x9

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "icon"

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
    const/16 v3, 0x8

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "id"

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
    goto :goto_0

    .line 123
    :cond_7
    const/4 v3, 0x7

    .line 124
    goto :goto_0

    .line 125
    :sswitch_8
    const-string v0, "settingTxt"

    .line 126
    .line 127
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_8

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_8
    const/4 v3, 0x6

    .line 135
    goto :goto_0

    .line 136
    :sswitch_9
    const-string v0, "suggestStrategy"

    .line 137
    .line 138
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_9

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_9
    const/4 v3, 0x5

    .line 146
    goto :goto_0

    .line 147
    :sswitch_a
    const-string v0, "bubble"

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_a

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_a
    const/4 v3, 0x4

    .line 157
    goto :goto_0

    .line 158
    :sswitch_b
    const-string v0, "suggestSwitch"

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_b

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_b
    const/4 v3, 0x3

    .line 168
    goto :goto_0

    .line 169
    :sswitch_c
    const-string v0, "questionnaireFinished"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_c

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_c
    const/4 v3, 0x2

    .line 179
    goto :goto_0

    .line 180
    :sswitch_d
    const-string v0, "bgColors"

    .line 181
    .line 182
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_d

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_d
    move v3, v2

    .line 190
    goto :goto_0

    .line 191
    :sswitch_e
    const-string v0, "subTitle"

    .line 192
    .line 193
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-nez v0, :cond_e

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_e
    move v3, v1

    .line 201
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 202
    .line 203
    .line 204
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    return p0

    .line 209
    :pswitch_0
    return v2

    .line 210
    :pswitch_1
    return v1

    .line 211
    :pswitch_2
    return v2

    .line 212
    nop

    .line 213
    :sswitch_data_0
    .sparse-switch
        -0x7c93a408 -> :sswitch_e
        -0x7a8751eb -> :sswitch_d
        -0x70b620cb -> :sswitch_c
        -0x6f88a028 -> :sswitch_b
        -0x52264b74 -> :sswitch_a
        -0x403c4ce9 -> :sswitch_9
        -0x3c2600 -> :sswitch_8
        0xd1b -> :sswitch_7
        0x313c79 -> :sswitch_6
        0x5a72f63 -> :sswitch_5
        0x5d2ed62 -> :sswitch_4
        0x6942258 -> :sswitch_3
        0x9ba28f6 -> :sswitch_2
        0x15d763b7 -> :sswitch_1
        0x1ad98476 -> :sswitch_0
    .end sparse-switch

    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/OMSThemeInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/OMSThemeInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "countdownView"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v1, "title"

    .line 32
    .line 33
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string v1, "subTitle"

    .line 41
    .line 42
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "settingTxt"

    .line 50
    .line 51
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz p0, :cond_5

    .line 57
    .line 58
    const-string v1, "color"

    .line 59
    .line 60
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const-string p0, "bgColors"

    .line 68
    .line 69
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 73
    .line 74
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 75
    .line 76
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    const-string v1, "h5URL"

    .line 84
    .line 85
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_7
    const-string p0, "suggestSwitch"

    .line 89
    .line 90
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 91
    .line 92
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 93
    .line 94
    .line 95
    const-string p0, "questionnaireFinished"

    .line 96
    .line 97
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 98
    .line 99
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 100
    .line 101
    .line 102
    const-string p0, "h5popLimit"

    .line 103
    .line 104
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 105
    .line 106
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 110
    .line 111
    if-eqz p0, :cond_8

    .line 112
    .line 113
    const-string p0, "bubble"

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 121
    .line 122
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 123
    .line 124
    .line 125
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 126
    .line 127
    if-eqz p0, :cond_9

    .line 128
    .line 129
    const-string p0, "suggestStrategy"

    .line 130
    .line 131
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 137
    .line 138
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 139
    .line 140
    .line 141
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 142
    .line 143
    if-eqz p0, :cond_a

    .line 144
    .line 145
    const-string p0, "bubbleOpen"

    .line 146
    .line 147
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    sget-object p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    .line 152
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 153
    .line 154
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 155
    .line 156
    .line 157
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz p0, :cond_b

    .line 160
    .line 161
    const-string p1, "icon"

    .line 162
    .line 163
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
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

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;->serializeFields(Lcom/p1/mobile/putong/data/OMSThemeInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
