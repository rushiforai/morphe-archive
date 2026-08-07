.class Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;",
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
    const-string p0, "firstGiftToast"

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
    const/16 v2, 0xa

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "victoryMotionId"

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
    const/16 v2, 0x9

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "punishmentMessage"

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
    const/16 v2, 0x8

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "punishMotionSelectIds"

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
    goto :goto_0

    .line 67
    :cond_3
    const/4 v2, 0x7

    .line 68
    goto :goto_0

    .line 69
    :sswitch_4
    const-string p0, "startShowMessage"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_4

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    const/4 v2, 0x6

    .line 79
    goto :goto_0

    .line 80
    :sswitch_5
    const-string p0, "pkMotions"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_5

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    const/4 v2, 0x5

    .line 90
    goto :goto_0

    .line 91
    :sswitch_6
    const-string p0, "entranceShowLimit"

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_6

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    const/4 v2, 0x4

    .line 101
    goto :goto_0

    .line 102
    :sswitch_7
    const-string p0, "stopLiveMessages"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_7

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_7
    const/4 v2, 0x3

    .line 112
    goto :goto_0

    .line 113
    :sswitch_8
    const-string p0, "firstGiftOn"

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-nez p0, :cond_8

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    const/4 v2, 0x2

    .line 123
    goto :goto_0

    .line 124
    :sswitch_9
    const-string p0, "winTimesTag"

    .line 125
    .line 126
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-nez p0, :cond_9

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_9
    move v2, v1

    .line 134
    goto :goto_0

    .line 135
    :sswitch_a
    const-string p0, "quitPkMessages"

    .line 136
    .line 137
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_a

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_a
    move v2, v0

    .line 145
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 146
    .line 147
    .line 148
    return v0

    .line 149
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 154
    .line 155
    return v1

    .line 156
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 161
    .line 162
    return v1

    .line 163
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 168
    .line 169
    return v1

    .line 170
    :pswitch_3
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    .line 172
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 177
    .line 178
    return v1

    .line 179
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 180
    .line 181
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 186
    .line 187
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 188
    .line 189
    return v1

    .line 190
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 191
    .line 192
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 197
    .line 198
    return v1

    .line 199
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 206
    .line 207
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 208
    .line 209
    return v1

    .line 210
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 211
    .line 212
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 217
    .line 218
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 219
    .line 220
    return v1

    .line 221
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 226
    .line 227
    return v1

    .line 228
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 229
    .line 230
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 235
    .line 236
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 237
    .line 238
    return v1

    .line 239
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 240
    .line 241
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 246
    .line 247
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 248
    .line 249
    return v1

    .line 250
    nop

    .line 251
    :sswitch_data_0
    .sparse-switch
        -0x73dd0fea -> :sswitch_a
        -0x5a13b990 -> :sswitch_9
        -0x52ae1e01 -> :sswitch_8
        -0x4fdc2c86 -> :sswitch_7
        -0x4bc9e758 -> :sswitch_6
        -0x9b3defe -> :sswitch_5
        0x74b8888 -> :sswitch_4
        0x7c65b71 -> :sswitch_3
        0x112f58d4 -> :sswitch_2
        0x2ef78fa3 -> :sswitch_1
        0x6c12ce07 -> :sswitch_0
    .end sparse-switch

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
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 251
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "entranceShowLimit"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "pkMotions"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "startShowMessage"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string v1, "victoryMotionId"

    .line 55
    .line 56
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "punishMotionSelectIds"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 69
    .line 70
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const-string p0, "quitPkMessages"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 87
    .line 88
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string p0, "stopLiveMessages"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 103
    .line 104
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string v1, "punishmentMessage"

    .line 112
    .line 113
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const-string v1, "firstGiftToast"

    .line 121
    .line 122
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    const-string p0, "firstGiftOn"

    .line 126
    .line 127
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 128
    .line 129
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    const-string p0, "winTimesTag"

    .line 137
    .line 138
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 144
    .line 145
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 146
    .line 147
    .line 148
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

    .line 149
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
