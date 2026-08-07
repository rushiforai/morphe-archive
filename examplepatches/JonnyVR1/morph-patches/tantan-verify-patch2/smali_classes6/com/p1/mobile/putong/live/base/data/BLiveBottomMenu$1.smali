.class Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;",
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
    const-string p0, "everyDayShowMaxCount"

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
    const/16 v2, 0xd

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "categorys"

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
    const/16 v2, 0xc

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "userEnableBubble"

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
    const/16 v2, 0xb

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "enableSettingButton"

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
    const/16 v2, 0xa

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "bubbleOrder"

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
    const/16 v2, 0x9

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "chatBox"

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
    const/16 v2, 0x8

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "enableInputButton"

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
    goto :goto_0

    .line 109
    :cond_6
    const/4 v2, 0x7

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string p0, "version"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_7

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_7
    const/4 v2, 0x6

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string p0, "buttons"

    .line 123
    .line 124
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_8

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    const/4 v2, 0x5

    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    const-string p0, "bubbles"

    .line 134
    .line 135
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_9

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_9
    const/4 v2, 0x4

    .line 143
    goto :goto_0

    .line 144
    :sswitch_a
    const-string p0, "menu"

    .line 145
    .line 146
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_a

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_a
    const/4 v2, 0x3

    .line 154
    goto :goto_0

    .line 155
    :sswitch_b
    const-string p0, "enableLatestPlayButton"

    .line 156
    .line 157
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-nez p0, :cond_b

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_b
    const/4 v2, 0x2

    .line 165
    goto :goto_0

    .line 166
    :sswitch_c
    const-string p0, "redDotDisappearMod"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-nez p0, :cond_c

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_c
    move v2, v1

    .line 176
    goto :goto_0

    .line 177
    :sswitch_d
    const-string p0, "settingButton"

    .line 178
    .line 179
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-nez p0, :cond_d

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_d
    move v2, v0

    .line 187
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 188
    .line 189
    .line 190
    return v0

    .line 191
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 196
    .line 197
    return v1

    .line 198
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 199
    .line 200
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 205
    .line 206
    return v1

    .line 207
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 212
    .line 213
    return v1

    .line 214
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 219
    .line 220
    return v1

    .line 221
    :pswitch_4
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 222
    .line 223
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 228
    .line 229
    return v1

    .line 230
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 231
    .line 232
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 237
    .line 238
    return v1

    .line 239
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 244
    .line 245
    return v1

    .line 246
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 251
    .line 252
    return v1

    .line 253
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 254
    .line 255
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 260
    .line 261
    return v1

    .line 262
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 263
    .line 264
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 269
    .line 270
    return v1

    .line 271
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 272
    .line 273
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 278
    .line 279
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 280
    .line 281
    return v1

    .line 282
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 287
    .line 288
    return v1

    .line 289
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 297
    .line 298
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 303
    .line 304
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 305
    .line 306
    return v1

    .line 307
    :sswitch_data_0
    .sparse-switch
        -0x7669da5e -> :sswitch_d
        -0x552c6889 -> :sswitch_c
        -0x291aa5f0 -> :sswitch_b
        0x33155f -> :sswitch_a
        0xd5cdd67 -> :sswitch_9
        0xe62bf81 -> :sswitch_8
        0x14f51cd8 -> :sswitch_7
        0x1f52ee19 -> :sswitch_6
        0x2c0d9353 -> :sswitch_5
        0x2d8bda22 -> :sswitch_4
        0x43627cdf -> :sswitch_3
        0x50543f5a -> :sswitch_2
        0x5d54e335 -> :sswitch_1
        0x63910549 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 307
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "settingButton"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "buttons"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "categorys"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    .line 47
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "menu"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "bubbleOrder"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 76
    .line 77
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string v0, "redDotDisappearMod"

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    const-string p0, "userEnableBubble"

    .line 92
    .line 93
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 96
    .line 97
    .line 98
    const-string p0, "everyDayShowMaxCount"

    .line 99
    .line 100
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 101
    .line 102
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    const-string p0, "enableSettingButton"

    .line 106
    .line 107
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 108
    .line 109
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 110
    .line 111
    .line 112
    const-string p0, "enableInputButton"

    .line 113
    .line 114
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 115
    .line 116
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 120
    .line 121
    if-eqz p0, :cond_6

    .line 122
    .line 123
    const-string p0, "bubbles"

    .line 124
    .line 125
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 129
    .line 130
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 131
    .line 132
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 133
    .line 134
    .line 135
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 136
    .line 137
    if-eqz p0, :cond_7

    .line 138
    .line 139
    const-string p0, "chatBox"

    .line 140
    .line 141
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 145
    .line 146
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 147
    .line 148
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 149
    .line 150
    .line 151
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz p0, :cond_8

    .line 154
    .line 155
    const-string v0, "version"

    .line 156
    .line 157
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_8
    const-string p0, "enableLatestPlayButton"

    .line 161
    .line 162
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 163
    .line 164
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 168
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
