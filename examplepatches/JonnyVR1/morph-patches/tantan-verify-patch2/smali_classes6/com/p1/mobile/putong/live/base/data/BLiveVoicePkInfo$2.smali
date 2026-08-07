.class Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$2;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;",
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
    const-string p0, "leftBigUrl"

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
    const-string p0, "onCallPoints"

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
    const-string p0, "mvpBg"

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
    const-string p0, "leftUrl"

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
    const-string p0, "pkId"

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
    const-string p0, "rightUserAvatar"

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
    const-string p0, "rightUserId"

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
    const-string p0, "rightBigUrl"

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
    const-string p0, "schema"

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
    const-string p0, "enable"

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
    const-string p0, "rightUrl"

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
    const-string p0, "leftUserAvatar"

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
    const-string p0, "endMill"

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
    const-string p0, "leftUserId"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 196
    .line 197
    return v1

    .line 198
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 199
    .line 200
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 205
    .line 206
    return v1

    .line 207
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 212
    .line 213
    return v1

    .line 214
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 219
    .line 220
    return v1

    .line 221
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 226
    .line 227
    return v1

    .line 228
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 233
    .line 234
    return v1

    .line 235
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 247
    .line 248
    return v1

    .line 249
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 254
    .line 255
    return v1

    .line 256
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 261
    .line 262
    return v1

    .line 263
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 268
    .line 269
    return v1

    .line 270
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 275
    .line 276
    return v1

    .line 277
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 278
    .line 279
    .line 280
    move-result-wide p2

    .line 281
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 282
    .line 283
    return v1

    .line 284
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 289
    .line 290
    return v1

    .line 291
    :sswitch_data_0
    .sparse-switch
        -0x7e69a6d3 -> :sswitch_d
        -0x5fcfc469 -> :sswitch_c
        -0x5d3f4b95 -> :sswitch_b
        -0x5598fa4d -> :sswitch_a
        -0x4d6ada7d -> :sswitch_9
        -0x361eca5f -> :sswitch_8
        -0x361ba675 -> :sswitch_7
        -0x1523287e -> :sswitch_6
        -0x12b9ffc0 -> :sswitch_5
        0x348476 -> :sswitch_4
        0x34ddbe8 -> :sswitch_3
        0x637528c -> :sswitch_2
        0x20636420 -> :sswitch_1
        0x609ddb36 -> :sswitch_0
    .end sparse-switch

    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
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

    .line 291
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$2;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "enable"

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string v0, "pkId"

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "leftUserAvatar"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "leftUserId"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string v0, "rightUserAvatar"

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const-string v0, "rightUserId"

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const-string v0, "leftUrl"

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    const-string v0, "leftBigUrl"

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const-string v0, "rightUrl"

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const-string v0, "rightBigUrl"

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_9

    .line 92
    .line 93
    const-string v0, "schema"

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_9
    const-string p0, "endMill"

    .line 99
    .line 100
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 101
    .line 102
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_a

    .line 108
    .line 109
    const-string v0, "mvpBg"

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_b

    .line 117
    .line 118
    const-string p0, "onCallPoints"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 124
    .line 125
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
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

    .line 131
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$2;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
