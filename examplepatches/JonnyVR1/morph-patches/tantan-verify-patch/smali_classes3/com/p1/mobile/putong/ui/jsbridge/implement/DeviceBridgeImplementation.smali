.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Ll/bqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/ql20;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public declared-synchronized d(Ll/xc00;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-virtual {p1}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;->e(Ll/bqq;II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit p0

    .line 23
    return-object p1

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public final declared-synchronized e(Ll/bqq;II)Ljava/lang/String;
    .locals 17
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "Android"

    .line 3
    .line 4
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 5
    .line 6
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Ll/qzd;->d()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-interface/range {p1 .. p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-static {v5}, Ll/bnl0;->v0(Landroid/content/Context;)F

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-static {v5}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-interface/range {p1 .. p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    invoke-static {v6}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-interface/range {p1 .. p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-static {v7}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    sget-object v10, Ll/uqb0;->s:Ljava/lang/String;

    .line 59
    .line 60
    const-string v11, "1.0.0"

    .line 61
    .line 62
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v12

    .line 66
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v13

    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v14

    .line 74
    sget-object v15, Lcom/p1/mobile/putong/app/web/WebViewX;->d:Ljava/lang/String;

    .line 75
    .line 76
    move-object/from16 p2, v15

    .line 77
    .line 78
    invoke-interface/range {p1 .. p1}, Ll/bqq;->getToken()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v15

    .line 82
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 83
    .line 84
    .line 85
    move-result-object v16

    .line 86
    move-object/from16 p1, v15

    .line 87
    .line 88
    invoke-virtual/range {v16 .. v16}, Ll/r8f0;->g()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    move-object/from16 p3, v14

    .line 93
    .line 94
    :try_start_1
    new-instance v14, Lorg/json/JSONObject;

    .line 95
    .line 96
    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 97
    .line 98
    .line 99
    move-object/from16 v16, v15

    .line 100
    .line 101
    const-string v15, "os"

    .line 102
    .line 103
    invoke-virtual {v14, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    const-string v0, "osVersion"

    .line 107
    .line 108
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string v0, "brand"

    .line 112
    .line 113
    invoke-virtual {v14, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string v0, "model"

    .line 117
    .line 118
    invoke-virtual {v14, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    const-string v0, "imei"

    .line 122
    .line 123
    invoke-virtual {v14, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    const-string v0, "pixelRatio"

    .line 127
    .line 128
    invoke-virtual {v14, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    .line 130
    .line 131
    const-string v0, "screenWidth"

    .line 132
    .line 133
    invoke-virtual {v14, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 134
    .line 135
    .line 136
    const-string v0, "screenHeight"

    .line 137
    .line 138
    invoke-virtual {v14, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 139
    .line 140
    .line 141
    const-string v0, "windowWidth"

    .line 142
    .line 143
    invoke-virtual {v14, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    const-string v0, "windowHeight"

    .line 147
    .line 148
    invoke-virtual {v14, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    const-string v0, "appVersion"

    .line 152
    .line 153
    invoke-virtual {v14, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    const-string v0, "sdkVersion"

    .line 157
    .line 158
    invoke-virtual {v14, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    .line 160
    .line 161
    const-string v0, "deviceId"

    .line 162
    .line 163
    invoke-virtual {v14, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    const-string v0, "oneId"

    .line 167
    .line 168
    invoke-virtual {v14, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    const-string v0, "smId"

    .line 172
    .line 173
    move-object/from16 v1, v16

    .line 174
    .line 175
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 176
    .line 177
    .line 178
    const-string v0, "language"

    .line 179
    .line 180
    move-object/from16 v1, p3

    .line 181
    .line 182
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 183
    .line 184
    .line 185
    const-string v0, "browserVersion"

    .line 186
    .line 187
    move-object/from16 v1, p2

    .line 188
    .line 189
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    .line 191
    .line 192
    const-string v0, "token"

    .line 193
    .line 194
    move-object/from16 v1, p1

    .line 195
    .line 196
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    const-string v0, "mcc"

    .line 200
    .line 201
    sget v1, Ll/uqb0;->f0:I

    .line 202
    .line 203
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 204
    .line 205
    .line 206
    const-string v0, "device_level"

    .line 207
    .line 208
    sget-object v1, Ll/c0e;->INSTANCE:Ll/c0e;

    .line 209
    .line 210
    invoke-virtual {v1}, Ll/c0e;->a()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    const/4 v0, 0x0

    .line 218
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-nez v1, :cond_0

    .line 223
    .line 224
    const-string v0, "clientId"

    .line 225
    .line 226
    const-string v1, "100032"

    .line 227
    .line 228
    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v14}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 235
    monitor-exit p0

    .line 236
    return-object v0

    .line 237
    :catchall_0
    move-exception v0

    .line 238
    goto :goto_1

    .line 239
    :catch_0
    move-exception v0

    .line 240
    goto :goto_0

    .line 241
    :cond_0
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 242
    :goto_0
    :try_start_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 246
    .line 247
    .line 248
    const-string v0, ""
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 249
    .line 250
    monitor-exit p0

    .line 251
    return-object v0

    .line 252
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 253
    throw v0
.end method

.method public getNetworkInfo(Ll/aqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getNetworkInfo"
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;->c(Ll/bqq;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public declared-synchronized getSystemInfo(Ll/aqq;)Ljava/lang/String;
    .locals 2
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getSystemInfo"
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ll/aqq;->e()Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/web/WebViewX;->getWidthX()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1}, Ll/aqq;->e()Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->getHeightX()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;->e(Ll/bqq;II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit p0

    .line 23
    return-object p1

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public saveBean(Ll/aqq;)Ljava/lang/String;
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "saveBean"
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/H5OutData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/H5OutData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/H5OutData;->deviceId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/aqq;->getToken()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->token:Ljava/lang/String;

    .line 17
    .line 18
    const-string p1, "1.0.0"

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->schemeVersion:Ljava/lang/String;

    .line 21
    .line 22
    sget-object p1, Ll/uqb0;->s:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->versionCode:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, "adr"

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->platform:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->language:Ljava/lang/String;

    .line 35
    .line 36
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 37
    .line 38
    invoke-interface {p1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->userId:Ljava/lang/String;

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/app/web/WebViewX;->d:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->browserVersion:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/H5OutData;->oneId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/H5OutData;->toJson()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method
