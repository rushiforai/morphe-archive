.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/ovm/IHardwareParamsParser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private parseFlags(Ljava/lang/String;)I
    .locals 6

    .line 1
    const-string p0, "\\|"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length p1, p0

    .line 8
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v1, p1, :cond_4

    .line 12
    .line 13
    aget-object v3, p0, v1

    .line 14
    .line 15
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, -0x1

    .line 23
    sparse-switch v4, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :sswitch_0
    const-string v4, "AUDIO_OUTPUT_FLAG_DEEP_BUFFER"

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const/4 v5, 0x3

    .line 37
    goto :goto_1

    .line 38
    :sswitch_1
    const-string v4, "AUDIO_INPUT_FLAG_ROW"

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 v5, 0x2

    .line 48
    goto :goto_1

    .line 49
    :sswitch_2
    const-string v4, "AUDIO_INPUT_FLAG_FAST"

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const/4 v5, 0x1

    .line 59
    goto :goto_1

    .line 60
    :sswitch_3
    const-string v4, "AUDIO_OUTPUT_FLAG_FAST"

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-nez v3, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    move v5, v0

    .line 70
    :goto_1
    packed-switch v5, :pswitch_data_0

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :pswitch_0
    or-int/lit8 v2, v2, 0x8

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :pswitch_1
    or-int/lit8 v2, v2, 0x4

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :pswitch_2
    or-int/lit8 v2, v2, 0x1

    .line 81
    .line 82
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    return v2

    .line 86
    nop

    .line 87
    :sswitch_data_0
    .sparse-switch
        -0x6e3b4f06 -> :sswitch_3
        -0x431e8f8f -> :sswitch_2
        -0x12ae38fb -> :sswitch_1
        -0x128cbf6b -> :sswitch_0
    .end sparse-switch

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseInt(Ljava/lang/String;I)I
    .locals 0

    .line 1
    const-string p0, "default"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method


# virtual methods
.method public parse(Ljava/lang/String;)Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 8
    .line 9
    .line 10
    new-instance v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;

    .line 11
    .line 12
    invoke-direct {v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v3, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->playParamsList:Ljava/util/List;

    .line 21
    .line 22
    new-instance v3, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v3, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->recordParamsList:Ljava/util/List;

    .line 28
    .line 29
    const-string v3, "audioTrackParam"

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    const-string v6, "0x"

    .line 36
    .line 37
    const-string v7, "|"

    .line 38
    .line 39
    const-string v9, "flag"

    .line 40
    .line 41
    const-string v10, "format"

    .line 42
    .line 43
    const-string v11, "sampleRate"

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    :try_start_1
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const/4 v4, 0x0

    .line 52
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 53
    .line 54
    .line 55
    move-result v12

    .line 56
    if-ge v4, v12, :cond_2

    .line 57
    .line 58
    new-instance v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;

    .line 59
    .line 60
    invoke-direct {v12}, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    const-string v13, "streamType"

    .line 68
    .line 69
    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v13

    .line 73
    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v15

    .line 77
    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v14

    .line 81
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    const/4 v8, 0x3

    .line 86
    invoke-direct {v0, v13, v8}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    iput v8, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->streamType:I

    .line 91
    .line 92
    const v8, 0xbb80

    .line 93
    .line 94
    .line 95
    invoke-direct {v0, v15, v8}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    iput v13, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->sampleRate:I

    .line 100
    .line 101
    const/4 v8, 0x2

    .line 102
    invoke-direct {v0, v14, v8}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 103
    .line 104
    .line 105
    move-result v13

    .line 106
    iput v13, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->format:I

    .line 107
    .line 108
    const/4 v8, 0x0

    .line 109
    iput v8, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->version:I

    .line 110
    .line 111
    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-eqz v8, :cond_0

    .line 116
    .line 117
    invoke-direct {v0, v5}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseFlags(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    iput v5, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 122
    .line 123
    const/4 v5, 0x1

    .line 124
    iput v5, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->version:I

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_0
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v8

    .line 131
    if-eqz v8, :cond_1

    .line 132
    .line 133
    const/4 v8, 0x2

    .line 134
    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    const/16 v8, 0x10

    .line 139
    .line 140
    invoke-static {v5, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    iput v5, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_1
    const/4 v8, -0x1

    .line 148
    invoke-direct {v0, v5, v8}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    iput v5, v12, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 153
    .line 154
    :goto_1
    iget-object v5, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->playParamsList:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 157
    .line 158
    .line 159
    add-int/lit8 v4, v4, 0x1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :catch_0
    :cond_2
    const-string v3, "audioRecordParam"

    .line 163
    .line 164
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-eqz v4, :cond_6

    .line 169
    .line 170
    :try_start_2
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    const/4 v8, 0x0

    .line 175
    :goto_2
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-ge v8, v3, :cond_6

    .line 180
    .line 181
    new-instance v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;

    .line 182
    .line 183
    invoke-direct {v3}, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v12

    .line 198
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v13

    .line 202
    const-string v14, "source"

    .line 203
    .line 204
    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    const v14, 0xbb80

    .line 209
    .line 210
    .line 211
    invoke-direct {v0, v5, v14}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    iput v5, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->sampleRate:I

    .line 216
    .line 217
    const/4 v5, 0x2

    .line 218
    invoke-direct {v0, v12, v5}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 219
    .line 220
    .line 221
    move-result v12

    .line 222
    iput v12, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->format:I

    .line 223
    .line 224
    const/4 v5, 0x0

    .line 225
    iput v5, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->version:I

    .line 226
    .line 227
    invoke-virtual {v13, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    if-eqz v5, :cond_3

    .line 232
    .line 233
    invoke-direct {v0, v13}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseFlags(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    iput v5, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 238
    .line 239
    const/4 v5, 0x1

    .line 240
    iput v5, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->version:I

    .line 241
    .line 242
    const/4 v5, -0x1

    .line 243
    const/4 v12, 0x0

    .line 244
    const/16 v15, 0x10

    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_3
    const/4 v5, 0x1

    .line 248
    invoke-virtual {v13, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 249
    .line 250
    .line 251
    move-result v12

    .line 252
    if-eqz v12, :cond_4

    .line 253
    .line 254
    const/4 v12, 0x2

    .line 255
    invoke-virtual {v13, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v13

    .line 259
    const/16 v15, 0x10

    .line 260
    .line 261
    invoke-static {v13, v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 262
    .line 263
    .line 264
    move-result v13

    .line 265
    iput v13, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 266
    .line 267
    const/4 v5, -0x1

    .line 268
    :goto_3
    const/4 v12, 0x0

    .line 269
    goto :goto_4

    .line 270
    :cond_4
    const/4 v12, 0x2

    .line 271
    const/16 v15, 0x10

    .line 272
    .line 273
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    sget-object v12, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 278
    .line 279
    if-ne v5, v12, :cond_5

    .line 280
    .line 281
    const-string v5, "8"

    .line 282
    .line 283
    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    if-eqz v5, :cond_5

    .line 288
    .line 289
    const/4 v5, -0x1

    .line 290
    iput v5, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 291
    .line 292
    goto :goto_3

    .line 293
    :cond_5
    const/4 v5, -0x1

    .line 294
    invoke-direct {v0, v13, v5}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 295
    .line 296
    .line 297
    move-result v12

    .line 298
    iput v12, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :goto_4
    invoke-direct {v0, v4, v12}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;->parseInt(Ljava/lang/String;I)I

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    iput v4, v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->source:I

    .line 306
    .line 307
    iget-object v4, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->recordParamsList:Ljava/util/List;

    .line 308
    .line 309
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 310
    .line 311
    .line 312
    add-int/lit8 v8, v8, 0x1

    .line 313
    .line 314
    goto/16 :goto_2

    .line 315
    .line 316
    :catch_1
    :cond_6
    return-object v2

    .line 317
    :catch_2
    const/4 v0, 0x0

    .line 318
    return-object v0
.end method
