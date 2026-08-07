.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;",
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
    const-string p0, "settledCount"

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
    const/16 p6, 0xe

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "managerLimit"

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
    const/16 p6, 0xd

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "titleStatus"

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
    const/16 p6, 0xc

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "publicRoomId"

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
    const/16 p6, 0xb

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "title"

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
    const/16 p6, 0xa

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "level"

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
    const/16 p6, 0x9

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "heat"

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
    const/16 p6, 0x8

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "coverStatus"

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
    const/4 p6, 0x7

    .line 124
    goto :goto_0

    .line 125
    :sswitch_8
    const-string p0, "isPersonal"

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
    const/4 p6, 0x6

    .line 135
    goto :goto_0

    .line 136
    :sswitch_9
    const-string p0, "coverUrl"

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
    const/4 p6, 0x5

    .line 146
    goto :goto_0

    .line 147
    :sswitch_a
    const-string p0, "levelSmallIcon"

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
    const/4 p6, 0x4

    .line 157
    goto :goto_0

    .line 158
    :sswitch_b
    const-string p0, "roomId"

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
    const/4 p6, 0x3

    .line 168
    goto :goto_0

    .line 169
    :sswitch_c
    const-string p0, "heatSvga"

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
    const/4 p6, 0x2

    .line 179
    goto :goto_0

    .line 180
    :sswitch_d
    const-string p0, "heatIcon"

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
    move p6, p5

    .line 190
    goto :goto_0

    .line 191
    :sswitch_e
    const-string p0, "levelIcon"

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
    move p6, p4

    .line 201
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 202
    .line 203
    .line 204
    return p4

    .line 205
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->settledCount:I

    .line 210
    .line 211
    return p5

    .line 212
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->managerLimit:I

    .line 217
    .line 218
    return p5

    .line 219
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->titleStatus:Ljava/lang/String;

    .line 224
    .line 225
    return p5

    .line 226
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->publicRoomId:Ljava/lang/String;

    .line 231
    .line 232
    return p5

    .line 233
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->title:Ljava/lang/String;

    .line 238
    .line 239
    return p5

    .line 240
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 241
    .line 242
    .line 243
    move-result p0

    .line 244
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->level:I

    .line 245
    .line 246
    return p5

    .line 247
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heat:I

    .line 252
    .line 253
    return p5

    .line 254
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->coverStatus:Ljava/lang/String;

    .line 259
    .line 260
    return p5

    .line 261
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->isPersonal:Z

    .line 266
    .line 267
    return p5

    .line 268
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->coverUrl:Ljava/lang/String;

    .line 273
    .line 274
    return p5

    .line 275
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelSmallIcon:Ljava/lang/String;

    .line 280
    .line 281
    return p5

    .line 282
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->roomId:Ljava/lang/String;

    .line 287
    .line 288
    return p5

    .line 289
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heatSvga:Ljava/lang/String;

    .line 294
    .line 295
    return p5

    .line 296
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heatIcon:Ljava/lang/String;

    .line 301
    .line 302
    return p5

    .line 303
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelIcon:Ljava/lang/String;

    .line 308
    .line 309
    return p5

    .line 310
    nop

    .line 311
    :sswitch_data_0
    .sparse-switch
        -0x62bd15e3 -> :sswitch_e
        -0x41a4f977 -> :sswitch_d
        -0x41a02773 -> :sswitch_c
        -0x372740aa -> :sswitch_b
        -0x2cf85d04 -> :sswitch_a
        -0x14f7b5c8 -> :sswitch_9
        -0x14de3276 -> :sswitch_8
        -0x99bd577 -> :sswitch_7
        0x30cdf0 -> :sswitch_6
        0x6219b84 -> :sswitch_5
        0x6942258 -> :sswitch_4
        0x1ddc2b1f -> :sswitch_3
        0x1ec9bc6a -> :sswitch_2
        0x481f100e -> :sswitch_1
        0x73aeac16 -> :sswitch_0
    .end sparse-switch

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

    .line 311
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->roomId:Ljava/lang/String;

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
    const-string p0, "level"

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->level:I

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelIcon:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "levelIcon"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const-string p0, "heat"

    .line 27
    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heat:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heatIcon:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string v0, "heatIcon"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->heatSvga:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    const-string v0, "heatSvga"

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    const-string p0, "settledCount"

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->settledCount:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const-string p0, "managerLimit"

    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->managerLimit:I

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    const-string p0, "isPersonal"

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->isPersonal:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->coverUrl:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    const-string v0, "coverUrl"

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->coverStatus:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const-string v0, "coverStatus"

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->publicRoomId:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz p0, :cond_6

    .line 93
    .line 94
    const-string v0, "publicRoomId"

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelSmallIcon:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    const-string v0, "levelSmallIcon"

    .line 104
    .line 105
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->title:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz p0, :cond_8

    .line 111
    .line 112
    const-string v0, "title"

    .line 113
    .line 114
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->titleStatus:Ljava/lang/String;

    .line 118
    .line 119
    if-eqz p0, :cond_9

    .line 120
    .line 121
    const-string p1, "titleStatus"

    .line 122
    .line 123
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_9
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
