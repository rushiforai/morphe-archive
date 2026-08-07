.class Lcom/p1/mobile/putong/data/Settings$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/Settings;",
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
    const-class p0, Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings$2;->newInstance()Lcom/p1/mobile/putong/data/Settings;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Settings;",
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
    const-string p0, "searchAge"

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
    const/16 v2, 0x15

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "conversations"

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
    const/16 v2, 0x14

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "notifications"

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
    const/16 v2, 0x13

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "lookingFor"

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
    const/16 v2, 0x12

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "greeting"

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
    const/16 v2, 0x11

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "email"

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
    const/16 v2, 0x10

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "boost"

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
    const/16 v2, 0xf

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "searchRadius"

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
    const/16 v2, 0xe

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "tbh"

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
    const/16 v2, 0xd

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "hideContacts"

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
    const/16 v2, 0xc

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "hideMutualContacts"

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
    const/16 v2, 0xb

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "searchLocation"

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
    const/16 v2, 0xa

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "linkedPhoneNumber"

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
    const/16 v2, 0x9

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "moment"

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
    const/16 v2, 0x8

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "searchPriorities"

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
    goto :goto_0

    .line 221
    :cond_e
    const/4 v2, 0x7

    .line 222
    goto :goto_0

    .line 223
    :sswitch_f
    const-string p0, "intent"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-nez p0, :cond_f

    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_f
    const/4 v2, 0x6

    .line 233
    goto :goto_0

    .line 234
    :sswitch_10
    const-string p0, "phoneNumber"

    .line 235
    .line 236
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    if-nez p0, :cond_10

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_10
    const/4 v2, 0x5

    .line 244
    goto :goto_0

    .line 245
    :sswitch_11
    const-string p0, "birthdate"

    .line 246
    .line 247
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-nez p0, :cond_11

    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_11
    const/4 v2, 0x4

    .line 255
    goto :goto_0

    .line 256
    :sswitch_12
    const-string p0, "autoAdjustSuggestRadius"

    .line 257
    .line 258
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-nez p0, :cond_12

    .line 263
    .line 264
    goto :goto_0

    .line 265
    :cond_12
    const/4 v2, 0x3

    .line 266
    goto :goto_0

    .line 267
    :sswitch_13
    const-string p0, "verification"

    .line 268
    .line 269
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result p0

    .line 273
    if-nez p0, :cond_13

    .line 274
    .line 275
    goto :goto_0

    .line 276
    :cond_13
    const/4 v2, 0x2

    .line 277
    goto :goto_0

    .line 278
    :sswitch_14
    const-string p0, "settingGroups"

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-nez p0, :cond_14

    .line 285
    .line 286
    goto :goto_0

    .line 287
    :cond_14
    move v2, v1

    .line 288
    goto :goto_0

    .line 289
    :sswitch_15
    const-string p0, "omsSetting"

    .line 290
    .line 291
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-nez p0, :cond_15

    .line 296
    .line 297
    goto :goto_0

    .line 298
    :cond_15
    move v2, v0

    .line 299
    :goto_0
    const/4 p0, 0x0

    .line 300
    packed-switch v2, :pswitch_data_0

    .line 301
    .line 302
    .line 303
    return v0

    .line 304
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/SearchAge;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 305
    .line 306
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    check-cast p0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 311
    .line 312
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 313
    .line 314
    return v1

    .line 315
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsConversations;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 316
    .line 317
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 322
    .line 323
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 324
    .line 325
    return v1

    .line 326
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsNotifications;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 327
    .line 328
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 333
    .line 334
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 335
    .line 336
    return v1

    .line 337
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 338
    .line 339
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    check-cast p0, Lcom/p1/mobile/putong/data/LookingFor;

    .line 344
    .line 345
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 346
    .line 347
    return v1

    .line 348
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->greeting:Ljava/lang/String;

    .line 353
    .line 354
    return v1

    .line 355
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 360
    .line 361
    return v1

    .line 362
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsBoost;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 363
    .line 364
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 369
    .line 370
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 371
    .line 372
    return v1

    .line 373
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/SearchRadius;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 374
    .line 375
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    check-cast p0, Lcom/p1/mobile/putong/data/SearchRadius;

    .line 380
    .line 381
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 382
    .line 383
    return v1

    .line 384
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsTbh;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 385
    .line 386
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 391
    .line 392
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 393
    .line 394
    return v1

    .line 395
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 396
    .line 397
    .line 398
    move-result-object p2

    .line 399
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 400
    .line 401
    if-ne p2, p4, :cond_16

    .line 402
    .line 403
    goto :goto_1

    .line 404
    :cond_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 405
    .line 406
    .line 407
    move-result p0

    .line 408
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 413
    .line 414
    return v1

    .line 415
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 416
    .line 417
    .line 418
    move-result-object p2

    .line 419
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 420
    .line 421
    if-ne p2, p4, :cond_17

    .line 422
    .line 423
    goto :goto_2

    .line 424
    :cond_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 425
    .line 426
    .line 427
    move-result p0

    .line 428
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 429
    .line 430
    .line 431
    move-result-object p0

    .line 432
    :goto_2
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 433
    .line 434
    return v1

    .line 435
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 436
    .line 437
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    check-cast p0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 442
    .line 443
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 444
    .line 445
    return v1

    .line 446
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/PhoneNumber;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 447
    .line 448
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object p0

    .line 452
    check-cast p0, Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 453
    .line 454
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 455
    .line 456
    return v1

    .line 457
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 458
    .line 459
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object p0

    .line 463
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 464
    .line 465
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 466
    .line 467
    return v1

    .line 468
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/SearchPriority;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 469
    .line 470
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 475
    .line 476
    return v1

    .line 477
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 478
    .line 479
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object p0

    .line 483
    check-cast p0, Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 484
    .line 485
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 486
    .line 487
    return v1

    .line 488
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/PhoneNumber;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 489
    .line 490
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object p0

    .line 494
    check-cast p0, Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 495
    .line 496
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 497
    .line 498
    return v1

    .line 499
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_DATE_BOXED:Lcom/tantanapp/common/data/JsonAdapter;

    .line 500
    .line 501
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    check-cast p0, Ljava/lang/Double;

    .line 506
    .line 507
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 508
    .line 509
    return v1

    .line 510
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 511
    .line 512
    .line 513
    move-result-object p2

    .line 514
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 515
    .line 516
    if-ne p2, p4, :cond_18

    .line 517
    .line 518
    goto :goto_3

    .line 519
    :cond_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 520
    .line 521
    .line 522
    move-result p0

    .line 523
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 524
    .line 525
    .line 526
    move-result-object p0

    .line 527
    :goto_3
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 528
    .line 529
    return v1

    .line 530
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/Verification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 531
    .line 532
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 533
    .line 534
    .line 535
    move-result-object p0

    .line 536
    check-cast p0, Lcom/p1/mobile/putong/data/Verification;

    .line 537
    .line 538
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 539
    .line 540
    return v1

    .line 541
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 542
    .line 543
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 544
    .line 545
    .line 546
    move-result-object p0

    .line 547
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 548
    .line 549
    return v1

    .line 550
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/OmsSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 551
    .line 552
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    check-cast p0, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 557
    .line 558
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 559
    .line 560
    return v1

    .line 561
    :sswitch_data_0
    .sparse-switch
        -0x6f45e1c5 -> :sswitch_15
        -0x6e0e27bc -> :sswitch_14
        -0x587a29e5 -> :sswitch_13
        -0x51229c48 -> :sswitch_12
        -0x48111313 -> :sswitch_11
        -0x471b45a9 -> :sswitch_10
        -0x468ec964 -> :sswitch_f
        -0x44c83ef6 -> :sswitch_e
        -0x3fb07e00 -> :sswitch_d
        -0x3822dd82 -> :sswitch_c
        -0xe27be83 -> :sswitch_b
        -0x52dc997 -> :sswitch_a
        -0x4fc04b -> :sswitch_9
        0x1bfba -> :sswitch_8
        0x464e05a -> :sswitch_7
        0x59923a3 -> :sswitch_6
        0x5c24b9c -> :sswitch_5
        0xc3e8039 -> :sswitch_4
        0x38efece6 -> :sswitch_3
        0x4bd694e8 -> :sswitch_2
        0x579db450 -> :sswitch_1
        0x69fcda37 -> :sswitch_0
    .end sparse-switch

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
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 561
    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Settings$2;->parseField(Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Settings;",
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
    const-string v0, "searchAge"

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
    const/16 v2, 0x15

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "conversations"

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
    const/16 v2, 0x14

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "notifications"

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
    const/16 v2, 0x13

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "lookingFor"

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
    const/16 v2, 0x12

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "greeting"

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
    const/16 v2, 0x11

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "email"

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
    const/16 v2, 0x10

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "boost"

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
    const/16 v2, 0xf

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "searchRadius"

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
    const/16 v2, 0xe

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "tbh"

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
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0xd

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "hideContacts"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0xc

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "hideMutualContacts"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    const/16 v2, 0xb

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "searchLocation"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_b

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    const/16 v2, 0xa

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "linkedPhoneNumber"

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    const/16 v2, 0x9

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "moment"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_d
    const/16 v2, 0x8

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "searchPriorities"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_e

    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_e
    const/4 v2, 0x7

    .line 221
    goto :goto_0

    .line 222
    :sswitch_f
    const-string v0, "intent"

    .line 223
    .line 224
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_f

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_f
    const/4 v2, 0x6

    .line 232
    goto :goto_0

    .line 233
    :sswitch_10
    const-string v0, "phoneNumber"

    .line 234
    .line 235
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_10

    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_10
    const/4 v2, 0x5

    .line 243
    goto :goto_0

    .line 244
    :sswitch_11
    const-string v0, "birthdate"

    .line 245
    .line 246
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-nez v0, :cond_11

    .line 251
    .line 252
    goto :goto_0

    .line 253
    :cond_11
    const/4 v2, 0x4

    .line 254
    goto :goto_0

    .line 255
    :sswitch_12
    const-string v0, "autoAdjustSuggestRadius"

    .line 256
    .line 257
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_12

    .line 262
    .line 263
    goto :goto_0

    .line 264
    :cond_12
    const/4 v2, 0x3

    .line 265
    goto :goto_0

    .line 266
    :sswitch_13
    const-string v0, "verification"

    .line 267
    .line 268
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    if-nez v0, :cond_13

    .line 273
    .line 274
    goto :goto_0

    .line 275
    :cond_13
    const/4 v2, 0x2

    .line 276
    goto :goto_0

    .line 277
    :sswitch_14
    const-string v0, "settingGroups"

    .line 278
    .line 279
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-nez v0, :cond_14

    .line 284
    .line 285
    goto :goto_0

    .line 286
    :cond_14
    move v2, v1

    .line 287
    goto :goto_0

    .line 288
    :sswitch_15
    const-string v0, "omsSetting"

    .line 289
    .line 290
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-nez v0, :cond_15

    .line 295
    .line 296
    goto :goto_0

    .line 297
    :cond_15
    const/4 v2, 0x0

    .line 298
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 299
    .line 300
    .line 301
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    return p0

    .line 306
    :pswitch_0
    return v1

    .line 307
    :sswitch_data_0
    .sparse-switch
        -0x6f45e1c5 -> :sswitch_15
        -0x6e0e27bc -> :sswitch_14
        -0x587a29e5 -> :sswitch_13
        -0x51229c48 -> :sswitch_12
        -0x48111313 -> :sswitch_11
        -0x471b45a9 -> :sswitch_10
        -0x468ec964 -> :sswitch_f
        -0x44c83ef6 -> :sswitch_e
        -0x3fb07e00 -> :sswitch_d
        -0x3822dd82 -> :sswitch_c
        -0xe27be83 -> :sswitch_b
        -0x52dc997 -> :sswitch_a
        -0x4fc04b -> :sswitch_9
        0x1bfba -> :sswitch_8
        0x464e05a -> :sswitch_7
        0x59923a3 -> :sswitch_6
        0x5c24b9c -> :sswitch_5
        0xc3e8039 -> :sswitch_4
        0x38efece6 -> :sswitch_3
        0x4bd694e8 -> :sswitch_2
        0x579db450 -> :sswitch_1
        0x69fcda37 -> :sswitch_0
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

    .line 307
    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Settings$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/Settings;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "phoneNumber"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/data/PhoneNumber;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "lookingFor"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "intent"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "birthdate"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_DATE_BOXED:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "searchRadius"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/data/SearchRadius;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "notifications"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsNotifications;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 94
    .line 95
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string v1, "hideContacts"

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 109
    .line 110
    .line 111
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 112
    .line 113
    if-eqz p0, :cond_7

    .line 114
    .line 115
    const-string v1, "hideMutualContacts"

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 122
    .line 123
    .line 124
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 125
    .line 126
    if-eqz p0, :cond_8

    .line 127
    .line 128
    const-string p0, "searchAge"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    sget-object p0, Lcom/p1/mobile/putong/data/SearchAge;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 136
    .line 137
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 138
    .line 139
    .line 140
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 141
    .line 142
    if-eqz p0, :cond_9

    .line 143
    .line 144
    const-string p0, "conversations"

    .line 145
    .line 146
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsConversations;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 150
    .line 151
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 152
    .line 153
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 157
    .line 158
    if-eqz p0, :cond_a

    .line 159
    .line 160
    const-string p0, "searchLocation"

    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 166
    .line 167
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 168
    .line 169
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 170
    .line 171
    .line 172
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 173
    .line 174
    if-eqz p0, :cond_b

    .line 175
    .line 176
    const-string p0, "boost"

    .line 177
    .line 178
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsBoost;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 182
    .line 183
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 184
    .line 185
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 186
    .line 187
    .line 188
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 189
    .line 190
    if-eqz p0, :cond_c

    .line 191
    .line 192
    const-string p0, "verification"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sget-object p0, Lcom/p1/mobile/putong/data/Verification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 198
    .line 199
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 200
    .line 201
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 202
    .line 203
    .line 204
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 205
    .line 206
    if-eqz p0, :cond_d

    .line 207
    .line 208
    const-string p0, "searchPriorities"

    .line 209
    .line 210
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 214
    .line 215
    sget-object v1, Lcom/p1/mobile/putong/data/SearchPriority;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 216
    .line 217
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 218
    .line 219
    .line 220
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 221
    .line 222
    if-eqz p0, :cond_e

    .line 223
    .line 224
    const-string p0, "moment"

    .line 225
    .line 226
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 230
    .line 231
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 232
    .line 233
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 234
    .line 235
    .line 236
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 237
    .line 238
    if-eqz p0, :cond_f

    .line 239
    .line 240
    const-string v1, "autoAdjustSuggestRadius"

    .line 241
    .line 242
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 247
    .line 248
    .line 249
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 250
    .line 251
    if-eqz p0, :cond_10

    .line 252
    .line 253
    const-string p0, "tbh"

    .line 254
    .line 255
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    sget-object p0, Lcom/p1/mobile/putong/data/SettingsTbh;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    .line 260
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 261
    .line 262
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 263
    .line 264
    .line 265
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->greeting:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz p0, :cond_11

    .line 268
    .line 269
    const-string v1, "greeting"

    .line 270
    .line 271
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 275
    .line 276
    if-eqz p0, :cond_12

    .line 277
    .line 278
    const-string v1, "email"

    .line 279
    .line 280
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 284
    .line 285
    if-eqz p0, :cond_13

    .line 286
    .line 287
    const-string p0, "linkedPhoneNumber"

    .line 288
    .line 289
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    sget-object p0, Lcom/p1/mobile/putong/data/PhoneNumber;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 293
    .line 294
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 295
    .line 296
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 297
    .line 298
    .line 299
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 300
    .line 301
    if-eqz p0, :cond_14

    .line 302
    .line 303
    const-string p0, "settingGroups"

    .line 304
    .line 305
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 309
    .line 310
    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 311
    .line 312
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 313
    .line 314
    .line 315
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 316
    .line 317
    if-eqz p0, :cond_15

    .line 318
    .line 319
    const-string p0, "omsSetting"

    .line 320
    .line 321
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    sget-object p0, Lcom/p1/mobile/putong/data/OmsSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 325
    .line 326
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 327
    .line 328
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 329
    .line 330
    .line 331
    :cond_15
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 332
    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Settings$2;->serializeFields(Lcom/p1/mobile/putong/data/Settings;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
