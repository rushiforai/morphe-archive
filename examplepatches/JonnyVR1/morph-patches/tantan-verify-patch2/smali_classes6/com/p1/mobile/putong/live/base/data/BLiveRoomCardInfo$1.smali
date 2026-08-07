.class Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;",
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
    const/4 p5, 0x0

    .line 9
    const/4 p6, 0x1

    .line 10
    const/4 v0, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "msgType"

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
    const/16 v0, 0xd

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "prepareTimeStart"

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
    const/16 v0, 0xc

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "userMedal"

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
    const/16 v0, 0xb

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "text"

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
    const/16 v0, 0xa

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "icon"

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
    const/16 v0, 0x9

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "cardType"

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
    const/16 v0, 0x8

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "userHierarchy"

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
    const/4 v0, 0x7

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string p0, "userType"

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
    const/4 v0, 0x6

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string p0, "userName"

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
    const/4 v0, 0x5

    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    const-string p0, "prepareTimeEnd"

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
    const/4 v0, 0x4

    .line 143
    goto :goto_0

    .line 144
    :sswitch_a
    const-string p0, "userId"

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
    const/4 v0, 0x3

    .line 154
    goto :goto_0

    .line 155
    :sswitch_b
    const-string p0, "roomId"

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
    const/4 v0, 0x2

    .line 165
    goto :goto_0

    .line 166
    :sswitch_c
    const-string p0, "exposureTimeEnd"

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
    move v0, p6

    .line 176
    goto :goto_0

    .line 177
    :sswitch_d
    const-string p0, "exposureTimeStart"

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
    move v0, p5

    .line 187
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 188
    .line 189
    .line 190
    return p5

    .line 191
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->msgType:Ljava/lang/String;

    .line 196
    .line 197
    return p6

    .line 198
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 199
    .line 200
    .line 201
    move-result-wide p2

    .line 202
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->prepareTimeStart:J

    .line 203
    .line 204
    return p6

    .line 205
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userMedal:Ljava/lang/String;

    .line 210
    .line 211
    return p6

    .line 212
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->text:Ljava/lang/String;

    .line 217
    .line 218
    return p6

    .line 219
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->icon:Ljava/lang/String;

    .line 224
    .line 225
    return p6

    .line 226
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->cardType:Ljava/lang/String;

    .line 231
    .line 232
    return p6

    .line 233
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 234
    .line 235
    .line 236
    move-result-wide p2

    .line 237
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userHierarchy:J

    .line 238
    .line 239
    return p6

    .line 240
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 241
    .line 242
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserType;

    .line 247
    .line 248
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userType:Lcom/p1/mobile/putong/live/base/data/BLiveUserType;

    .line 249
    .line 250
    return p6

    .line 251
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userName:Ljava/lang/String;

    .line 256
    .line 257
    return p6

    .line 258
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 259
    .line 260
    .line 261
    move-result-wide p2

    .line 262
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->prepareTimeEnd:J

    .line 263
    .line 264
    return p6

    .line 265
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userId:Ljava/lang/String;

    .line 270
    .line 271
    return p6

    .line 272
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->roomId:Ljava/lang/String;

    .line 277
    .line 278
    return p6

    .line 279
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 280
    .line 281
    .line 282
    move-result-wide p2

    .line 283
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->exposureTimeEnd:J

    .line 284
    .line 285
    return p6

    .line 286
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 287
    .line 288
    .line 289
    move-result-wide p2

    .line 290
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->exposureTimeStart:J

    .line 291
    .line 292
    return p6

    .line 293
    :sswitch_data_0
    .sparse-switch
        -0x609c6bb2 -> :sswitch_d
        -0x5d9a9c39 -> :sswitch_c
        -0x372740aa -> :sswitch_b
        -0x31d4d1ba -> :sswitch_a
        -0x246f2c39 -> :sswitch_9
        -0xfe5030a -> :sswitch_8
        -0xfe1ee5b -> :sswitch_7
        -0xcdd2556 -> :sswitch_6
        -0x7d8996 -> :sswitch_5
        0x313c79 -> :sswitch_4
        0x36452d -> :sswitch_3
        0x133839ec -> :sswitch_2
        0x3b73044e -> :sswitch_1
        0x5018025b -> :sswitch_0
    .end sparse-switch

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
    .line 350
    .line 351
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

    .line 293
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "prepareTimeStart"

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->prepareTimeStart:J

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    const-string p0, "prepareTimeEnd"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->prepareTimeEnd:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    const-string p0, "exposureTimeStart"

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->exposureTimeStart:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    const-string p0, "exposureTimeEnd"

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->exposureTimeEnd:J

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userType:Lcom/p1/mobile/putong/live/base/data/BLiveUserType;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const-string p0, "userType"

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userType:Lcom/p1/mobile/putong/live/base/data/BLiveUserType;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->cardType:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const-string v0, "cardType"

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const-string v0, "userId"

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userName:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const-string v0, "userName"

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    const-string p0, "userHierarchy"

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userHierarchy:J

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->icon:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    const-string v0, "icon"

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userMedal:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_5

    .line 92
    .line 93
    const-string v0, "userMedal"

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->roomId:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string v0, "roomId"

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->text:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string v0, "text"

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->msgType:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const-string p1, "msgType"

    .line 121
    .line 122
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
