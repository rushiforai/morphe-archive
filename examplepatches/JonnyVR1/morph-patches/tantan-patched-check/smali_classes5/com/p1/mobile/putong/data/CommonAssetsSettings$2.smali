.class Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/CommonAssetsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
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
    const-class p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/CommonAssetsSettings;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;->newInstance()Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
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
    const-string p0, "pullAlive"

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
    const/16 v2, 0xf

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "httpDns"

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
    const/16 v2, 0xe

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "sendOneSuperlikeActivitySwitch"

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
    const/16 v2, 0xd

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "enableTTPlayer"

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
    const/16 v2, 0xc

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "limitEighteenBelowSignup"

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
    const/16 v2, 0xb

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "emoji"

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
    const/16 v2, 0xa

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "enableHighLegibility"

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
    const/16 v2, 0x9

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "enableAgc"

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
    const/16 v2, 0x8

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "privateQuestionSuggestCardHideRate"

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
    const/4 v2, 0x7

    .line 138
    goto :goto_0

    .line 139
    :sswitch_9
    const-string p0, "recommendPrefetch"

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
    const/4 v2, 0x6

    .line 149
    goto :goto_0

    .line 150
    :sswitch_a
    const-string p0, "enableNetReport"

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
    const/4 v2, 0x5

    .line 160
    goto :goto_0

    .line 161
    :sswitch_b
    const-string p0, "androidUrlHostTokenWhitelist"

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
    const/4 v2, 0x4

    .line 171
    goto :goto_0

    .line 172
    :sswitch_c
    const-string p0, "letterContents"

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
    const/4 v2, 0x3

    .line 182
    goto :goto_0

    .line 183
    :sswitch_d
    const-string p0, "androidAudioExt"

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
    const/4 v2, 0x2

    .line 193
    goto :goto_0

    .line 194
    :sswitch_e
    const-string p0, "NCTAndroidBatch"

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
    move v2, v1

    .line 204
    goto :goto_0

    .line 205
    :sswitch_f
    const-string p0, "ttpointDialog"

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
    move v2, v0

    .line 215
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 216
    .line 217
    .line 218
    return v0

    .line 219
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/AwakeApp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 226
    .line 227
    return v1

    .line 228
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 233
    .line 234
    return v1

    .line 235
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 247
    .line 248
    return v1

    .line 249
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 254
    .line 255
    return v1

    .line 256
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/EmojiType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 257
    .line 258
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 263
    .line 264
    return v1

    .line 265
    :pswitch_6
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 266
    .line 267
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 272
    .line 273
    return v1

    .line 274
    :pswitch_7
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 275
    .line 276
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 281
    .line 282
    return v1

    .line 283
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 284
    .line 285
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 290
    .line 291
    return v1

    .line 292
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendPrefetch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 293
    .line 294
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    check-cast p0, Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 299
    .line 300
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 301
    .line 302
    return v1

    .line 303
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 308
    .line 309
    return v1

    .line 310
    :pswitch_b
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 311
    .line 312
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 317
    .line 318
    return v1

    .line 319
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/LetterContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 320
    .line 321
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 326
    .line 327
    return v1

    .line 328
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 333
    .line 334
    return v1

    .line 335
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 336
    .line 337
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    check-cast p0, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 342
    .line 343
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 344
    .line 345
    return v1

    .line 346
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/TtpointDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    .line 348
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    check-cast p0, Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 353
    .line 354
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 355
    .line 356
    return v1

    .line 357
    :sswitch_data_0
    .sparse-switch
        -0x7b174b88 -> :sswitch_f
        -0x720d0716 -> :sswitch_e
        -0x643c6606 -> :sswitch_d
        -0x5f20a2a0 -> :sswitch_c
        -0x59730d4a -> :sswitch_b
        -0x49520112 -> :sswitch_a
        -0x3acd852d -> :sswitch_9
        -0x28b7b733 -> :sswitch_8
        -0x25a6b786 -> :sswitch_7
        -0x24fdb6f7 -> :sswitch_6
        0x5c28046 -> :sswitch_5
        0xe63328f -> :sswitch_4
        0x10b6a404 -> :sswitch_3
        0x3c0745b7 -> :sswitch_2
        0x4a10d781 -> :sswitch_1
        0x650d1d88 -> :sswitch_0
    .end sparse-switch

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
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
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

    .line 357
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;->parseField(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
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
    const-string v0, "pullAlive"

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
    const-string v0, "httpDns"

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
    const-string v0, "sendOneSuperlikeActivitySwitch"

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
    const-string v0, "enableTTPlayer"

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
    const-string v0, "limitEighteenBelowSignup"

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
    const-string v0, "emoji"

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
    const-string v0, "enableHighLegibility"

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
    const-string v0, "enableAgc"

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
    const-string v0, "privateQuestionSuggestCardHideRate"

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
    const-string v0, "recommendPrefetch"

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
    const-string v0, "enableNetReport"

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
    const-string v0, "androidUrlHostTokenWhitelist"

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
    const-string v0, "letterContents"

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
    const-string v0, "androidAudioExt"

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
    const-string v0, "NCTAndroidBatch"

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
    const-string v0, "ttpointDialog"

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
        -0x7b174b88 -> :sswitch_f
        -0x720d0716 -> :sswitch_e
        -0x643c6606 -> :sswitch_d
        -0x5f20a2a0 -> :sswitch_c
        -0x59730d4a -> :sswitch_b
        -0x49520112 -> :sswitch_a
        -0x3acd852d -> :sswitch_9
        -0x28b7b733 -> :sswitch_8
        -0x25a6b786 -> :sswitch_7
        -0x24fdb6f7 -> :sswitch_6
        0x5c28046 -> :sswitch_5
        0xe63328f -> :sswitch_4
        0x10b6a404 -> :sswitch_3
        0x3c0745b7 -> :sswitch_2
        0x4a10d781 -> :sswitch_1
        0x650d1d88 -> :sswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "NCTAndroidBatch"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "recommendPrefetch"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendPrefetch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "pullAlive"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/data/AwakeApp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    .line 47
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "privateQuestionSuggestCardHideRate"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    const-string p0, "limitEighteenBelowSignup"

    .line 67
    .line 68
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 69
    .line 70
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 74
    .line 75
    if-eqz p0, :cond_4

    .line 76
    .line 77
    const-string p0, "ttpointDialog"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Lcom/p1/mobile/putong/data/TtpointDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 83
    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 85
    .line 86
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 87
    .line 88
    .line 89
    :cond_4
    const-string p0, "sendOneSuperlikeActivitySwitch"

    .line 90
    .line 91
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 92
    .line 93
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 94
    .line 95
    .line 96
    const-string p0, "androidAudioExt"

    .line 97
    .line 98
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 104
    .line 105
    if-eqz p0, :cond_5

    .line 106
    .line 107
    const-string p0, "letterContents"

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 113
    .line 114
    sget-object v0, Lcom/p1/mobile/putong/data/LetterContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 115
    .line 116
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    const-string p0, "enableTTPlayer"

    .line 120
    .line 121
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 122
    .line 123
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 127
    .line 128
    if-eqz p0, :cond_6

    .line 129
    .line 130
    const-string p0, "enableHighLegibility"

    .line 131
    .line 132
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 136
    .line 137
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 138
    .line 139
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 140
    .line 141
    .line 142
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 143
    .line 144
    if-eqz p0, :cond_7

    .line 145
    .line 146
    const-string p0, "enableAgc"

    .line 147
    .line 148
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 152
    .line 153
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    .line 155
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 156
    .line 157
    .line 158
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 159
    .line 160
    if-eqz p0, :cond_8

    .line 161
    .line 162
    const-string p0, "emoji"

    .line 163
    .line 164
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 168
    .line 169
    sget-object v0, Lcom/p1/mobile/putong/data/EmojiType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 170
    .line 171
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_8
    const-string p0, "httpDns"

    .line 175
    .line 176
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 177
    .line 178
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 179
    .line 180
    .line 181
    const-string p0, "enableNetReport"

    .line 182
    .line 183
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 184
    .line 185
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 189
    .line 190
    if-eqz p0, :cond_9

    .line 191
    .line 192
    const-string p0, "androidUrlHostTokenWhitelist"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 198
    .line 199
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 202
    .line 203
    .line 204
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

    .line 205
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;->serializeFields(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
