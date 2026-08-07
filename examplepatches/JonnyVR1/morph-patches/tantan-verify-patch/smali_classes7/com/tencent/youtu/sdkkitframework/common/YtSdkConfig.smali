.class public Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$CommonConfig;,
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$FaceDetectConfig;,
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$FaceQualityConfig;,
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ReflectConfig;,
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;,
        Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;
    }
.end annotation


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


# virtual methods
.method public updateSDKConfig(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;Lorg/json/JSONObject;)I
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    const-string v1, "thread_priority"

    .line 4
    .line 5
    const-string v2, "screen_orientation"

    .line 6
    .line 7
    const-string v3, "need_bugly_shared"

    .line 8
    .line 9
    const-string v4, "resource_download_path"

    .line 10
    .line 11
    const-string v5, "resource_online"

    .line 12
    .line 13
    const-string v6, "backend_proto_type"

    .line 14
    .line 15
    const-string v7, "select_data"

    .line 16
    .line 17
    const-string v8, "change_point_num"

    .line 18
    .line 19
    const-string v9, "control_config"

    .line 20
    .line 21
    const-string v10, "extra_config"

    .line 22
    .line 23
    const-string v11, "action_default_seq"

    .line 24
    .line 25
    const-string v12, "local_config_flag"

    .line 26
    .line 27
    const-string v13, "color_data"

    .line 28
    .line 29
    const-string v14, "config_api_url"

    .line 30
    .line 31
    const-string v15, "app_id"

    .line 32
    .line 33
    move-object/from16 p0, v1

    .line 34
    .line 35
    const-string v1, "net_request_timeout_ms"

    .line 36
    .line 37
    :try_start_0
    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v16

    .line 41
    if-eqz v16, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v15

    .line 47
    sput-object v15, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->appId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v15

    .line 53
    if-eqz v15, :cond_1

    .line 54
    .line 55
    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v14

    .line 59
    sput-object v14, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->configUrl:Ljava/lang/String;

    .line 60
    .line 61
    :cond_1
    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v14

    .line 65
    if-eqz v14, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v13

    .line 71
    sput-object v13, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ReflectConfig;->colorData:Ljava/lang/String;

    .line 72
    .line 73
    :cond_2
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v13

    .line 77
    if-eqz v13, :cond_3

    .line 78
    .line 79
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v12

    .line 83
    sput-boolean v12, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->needLocalConfig:Z

    .line 84
    .line 85
    :cond_3
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v12

    .line 89
    const/4 v13, 0x0

    .line 90
    if-eqz v12, :cond_5

    .line 91
    .line 92
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 93
    .line 94
    .line 95
    move-result-object v11

    .line 96
    move v12, v13

    .line 97
    :goto_0
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    .line 98
    .line 99
    .line 100
    move-result v14

    .line 101
    if-ge v12, v14, :cond_6

    .line 102
    .line 103
    new-instance v14, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    sget-object v15, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;->actionSeqData:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v11, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v15

    .line 117
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v14

    .line 124
    sput-object v14, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;->actionSeqData:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    .line 127
    .line 128
    .line 129
    move-result v14

    .line 130
    add-int/lit8 v14, v14, -0x1

    .line 131
    .line 132
    if-ge v12, v14, :cond_4

    .line 133
    .line 134
    new-instance v14, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    sget-object v15, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;->actionSeqData:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v15, ","

    .line 145
    .line 146
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v14

    .line 153
    sput-object v14, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;->actionSeqData:Ljava/lang/String;

    .line 154
    .line 155
    :cond_4
    add-int/lit8 v12, v12, 0x1

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_5
    const-string v11, "0"

    .line 159
    .line 160
    sput-object v11, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$ActionDetectConfig;->actionSeqData:Ljava/lang/String;

    .line 161
    .line 162
    :cond_6
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v11

    .line 166
    if-eqz v11, :cond_7

    .line 167
    .line 168
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v10

    .line 172
    sput-object v10, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->extraConfig:Ljava/lang/String;

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_7
    const-string v10, " version 2"

    .line 176
    .line 177
    sput-object v10, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->extraConfig:Ljava/lang/String;

    .line 178
    .line 179
    :goto_1
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v10

    .line 183
    if-eqz v10, :cond_8

    .line 184
    .line 185
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    sput-object v9, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->controlConfig:Ljava/lang/String;

    .line 190
    .line 191
    :cond_8
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    if-eqz v9, :cond_9

    .line 196
    .line 197
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v8

    .line 201
    sput v8, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->changePointNum:I

    .line 202
    .line 203
    :cond_9
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    if-eqz v8, :cond_a

    .line 208
    .line 209
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    sput-object v7, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->selectData:Lorg/json/JSONObject;

    .line 214
    .line 215
    :cond_a
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result v7

    .line 219
    if-eqz v7, :cond_b

    .line 220
    .line 221
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v6

    .line 225
    sput v6, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->backendProtoType:I

    .line 226
    .line 227
    :cond_b
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    if-eqz v6, :cond_c

    .line 232
    .line 233
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    sput v6, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->netRequestTimeoutMS:I

    .line 238
    .line 239
    :cond_c
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_d

    .line 244
    .line 245
    const-string v1, "action_local_config_flag"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    sput-boolean v1, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->needActionlLocalConfig:Z

    .line 252
    .line 253
    :cond_d
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_e

    .line 258
    .line 259
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    sput-boolean v1, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->resourceOnline:Z

    .line 264
    .line 265
    :cond_e
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    if-eqz v1, :cond_f

    .line 270
    .line 271
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->resourceDownloadPath:Ljava/lang/String;

    .line 276
    .line 277
    :cond_f
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-eqz v1, :cond_10

    .line 282
    .line 283
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    sput-boolean v1, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;->needBuglyShared:Z

    .line 288
    .line 289
    :cond_10
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eqz v1, :cond_11

    .line 294
    .line 295
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    sput v1, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$CommonConfig;->screenOrientation:I

    .line 300
    .line 301
    :cond_11
    move-object/from16 v1, p0

    .line 302
    .line 303
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    if-eqz v2, :cond_12

    .line 308
    .line 309
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    sput v0, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$CommonConfig;->threadPriority:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    .line 315
    :cond_12
    return v13

    .line 316
    :catch_0
    const/4 v0, -0x1

    .line 317
    return v0
.end method
