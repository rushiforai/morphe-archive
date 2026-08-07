.class public abstract Ll/utg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;

.field public static final b:Ll/uyg0;

.field public static c:Z

.field public static d:Ljava/lang/String;

.field public static e:Ll/i0h0;

.field public static f:I

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;

.field public static i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/utg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/utg0;->a:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ll/uyg0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/uyg0;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/utg0;->b:Ll/uyg0;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    sput-boolean v0, Ll/utg0;->c:Z

    .line 24
    .line 25
    const-string v0, "zh-CN"

    .line 26
    .line 27
    sput-object v0, Ll/utg0;->d:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v0, Ll/i0h0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/i0h0;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    sput v0, Ll/utg0;->f:I

    .line 38
    .line 39
    const-string v0, ""

    .line 40
    .line 41
    sput-object v0, Ll/utg0;->g:Ljava/lang/String;

    .line 42
    .line 43
    sput-object v0, Ll/utg0;->h:Ljava/lang/String;

    .line 44
    .line 45
    sput-object v0, Ll/utg0;->i:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Ll/utg0;->j:Ljava/lang/String;

    .line 60
    .line 61
    return-void
.end method

.method public static a()Ljava/util/ArrayList;
    .locals 6

    .line 1
    sget-object v0, Ll/arg0;->a:Ll/pjg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pjg0;->d:Ljava/util/HashMap;

    .line 4
    .line 5
    const-string v1, "asr_load_list"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-string v1, ","

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    array-length v1, v0

    .line 24
    if-lez v1, :cond_1

    .line 25
    .line 26
    new-instance v1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    array-length v2, v0

    .line 32
    const/4 v3, 0x0

    .line 33
    :goto_0
    if-ge v3, v2, :cond_0

    .line 34
    .line 35
    aget-object v4, v0, v3

    .line 36
    .line 37
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catch_0
    move-exception v4

    .line 50
    invoke-static {v4}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    const-string v5, "SdkMgr"

    .line 55
    .line 56
    invoke-static {v5, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget-object v0, v0, Ll/svg0;->b:Ljava/util/ArrayList;

    .line 82
    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_2
    const/4 v0, 0x0

    .line 87
    return-object v0
.end method

.method public static b(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;Ll/yng0;Ll/yng0;)V
    .locals 10

    .line 1
    sget-object v0, Ll/utg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "initSDK"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const-string p0, "SdkMgr"

    .line 15
    .line 16
    const-string p2, "initSDK Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {p0, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "initSDK Please call on UI or Main thread"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    if-eqz p1, :cond_e

    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    const-string p2, "Please call on UI or Main thread"

    .line 30
    .line 31
    invoke-interface {p1, p0, p2}, Ltech/sud/gip/core/ISudListenerInitSDK;->onFailure(ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ltech/sud/gip/core/SudInitSDKParamModel;->check()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    :cond_1
    move-object v3, p1

    .line 44
    goto/16 :goto_5

    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 53
    .line 54
    sget-object v1, Ll/wxg0;->c:Ll/wxg0;

    .line 55
    .line 56
    if-nez v1, :cond_4

    .line 57
    .line 58
    const-class v1, Ll/wxg0;

    .line 59
    .line 60
    monitor-enter v1

    .line 61
    :try_start_0
    sget-object v2, Ll/wxg0;->c:Ll/wxg0;

    .line 62
    .line 63
    if-nez v2, :cond_3

    .line 64
    .line 65
    new-instance v2, Ll/wxg0;

    .line 66
    .line 67
    invoke-direct {v2, v0}, Ll/wxg0;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    sput-object v2, Ll/wxg0;->c:Ll/wxg0;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catchall_0
    move-exception v0

    .line 74
    move-object p0, v0

    .line 75
    goto :goto_1

    .line 76
    :cond_3
    :goto_0
    monitor-exit v1

    .line 77
    goto :goto_2

    .line 78
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0

    .line 80
    :cond_4
    :goto_2
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 81
    .line 82
    sget-object v1, Ll/bhg0;->d:Ljava/lang/String;

    .line 83
    .line 84
    sget-object v1, LSudif/Sudtry;->Suddo:Landroid/content/Context;

    .line 85
    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    sput-object v0, LSudif/Sudtry;->Suddo:Landroid/content/Context;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->userId:Ljava/lang/String;

    .line 91
    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    const-string v1, ""

    .line 95
    .line 96
    iput-object v1, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->userId:Ljava/lang/String;

    .line 97
    .line 98
    :cond_6
    iget-object v1, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->userId:Ljava/lang/String;

    .line 99
    .line 100
    sput-object v1, Ll/fug0;->a:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0}, Ltech/sud/base/utils/Utils;->initContext(Landroid/content/Context;)V

    .line 103
    .line 104
    .line 105
    sget-object v0, Ll/lmg0;->e:Ljava/lang/String;

    .line 106
    .line 107
    sget-object v0, Ll/khg0;->a:Ll/lmg0;

    .line 108
    .line 109
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Ll/lmg0;->a(Landroid/app/Application;)V

    .line 114
    .line 115
    .line 116
    sget v0, Ll/utg0;->f:I

    .line 117
    .line 118
    sget-boolean v1, Ll/utg0;->c:Z

    .line 119
    .line 120
    iget-boolean v2, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 121
    .line 122
    sput-boolean v2, Ll/utg0;->c:Z

    .line 123
    .line 124
    const/4 v3, 0x2

    .line 125
    const/4 v4, 0x1

    .line 126
    if-ne v0, v4, :cond_8

    .line 127
    .line 128
    if-eqz v2, :cond_7

    .line 129
    .line 130
    sput v3, Ll/utg0;->f:I

    .line 131
    .line 132
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 133
    .line 134
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ll/uyg0;->z()V

    .line 138
    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_7
    sput v4, Ll/utg0;->f:I

    .line 142
    .line 143
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    invoke-static {}, Ll/uyg0;->z()V

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    if-ne v0, v3, :cond_a

    .line 153
    .line 154
    if-eqz v2, :cond_9

    .line 155
    .line 156
    sput v3, Ll/utg0;->f:I

    .line 157
    .line 158
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    invoke-static {}, Ll/uyg0;->z()V

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    sput v4, Ll/utg0;->f:I

    .line 168
    .line 169
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 170
    .line 171
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 172
    .line 173
    .line 174
    invoke-static {}, Ll/uyg0;->z()V

    .line 175
    .line 176
    .line 177
    :cond_a
    :goto_3
    sget v2, Ll/utg0;->f:I

    .line 178
    .line 179
    sget-object v3, Ll/utg0;->g:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v4, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    if-eqz v3, :cond_b

    .line 188
    .line 189
    sget-object v3, Ll/utg0;->h:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v4, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    if-eqz v3, :cond_b

    .line 198
    .line 199
    if-ne v0, v2, :cond_b

    .line 200
    .line 201
    iget-boolean v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 202
    .line 203
    if-eq v1, v0, :cond_c

    .line 204
    .line 205
    :cond_b
    sget-object v0, Ll/utg0;->b:Ll/uyg0;

    .line 206
    .line 207
    invoke-virtual {v0}, Ll/uyg0;->f()V

    .line 208
    .line 209
    .line 210
    :cond_c
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 211
    .line 212
    sput-object v0, Ll/utg0;->g:Ljava/lang/String;

    .line 213
    .line 214
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 215
    .line 216
    sput-object v0, Ll/utg0;->h:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 219
    .line 220
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    if-nez v0, :cond_d

    .line 225
    .line 226
    const-string v0, ""

    .line 227
    .line 228
    sput-object v0, Ll/utg0;->i:Ljava/lang/String;

    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_d
    sput-object v0, Ll/utg0;->i:Ljava/lang/String;

    .line 232
    .line 233
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v1, "initSDK appId:"

    .line 236
    .line 237
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    sget-object v1, Ll/utg0;->g:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v1, "  appKey:"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    iget-object v1, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const-string v1, "  bundleId:"

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    sget-object v1, Ll/utg0;->i:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    const-string v1, "  isTestEnv:"

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    iget-boolean v1, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    const-string v1, "SdkMgr"

    .line 280
    .line 281
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 285
    .line 286
    iget-object v4, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 287
    .line 288
    iget-object v5, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v6, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 291
    .line 292
    iget-boolean v7, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 293
    .line 294
    move-object v3, p1

    .line 295
    move-object v8, p2

    .line 296
    move-object v9, p3

    .line 297
    invoke-virtual/range {v2 .. v9}, Ll/uyg0;->y(Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :goto_5
    const-string p0, "SdkMgr"

    .line 302
    .line 303
    const-string p1, "initSDK Parameters cannot be null"

    .line 304
    .line 305
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    const-string p0, "initSDK Parameters cannot be null"

    .line 309
    .line 310
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    if-eqz v3, :cond_e

    .line 314
    .line 315
    const/16 p0, -0x2778

    .line 316
    .line 317
    const-string p1, "Parameters cannot be null"

    .line 318
    .line 319
    invoke-interface {v3, p0, p1}, Ltech/sud/gip/core/ISudListenerInitSDK;->onFailure(ILjava/lang/String;)V

    .line 320
    .line 321
    .line 322
    :cond_e
    return-void
.end method

.method public static c()Lorg/json/JSONArray;
    .locals 2

    .line 1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Ll/gvg0;->n:Ll/jxg0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Ltech/sud/gip/core/model/VolcCfg;->languages:Lorg/json/JSONArray;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    .line 21
    .line 22
    const-string v1, "[\"zh-CN\"]"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lorg/json/JSONArray;

    .line 33
    .line 34
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/utg0;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_0
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    :cond_1
    return-object v0
.end method

.method public static e()Ll/smg0;
    .locals 1

    .line 1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Ll/gvg0;->i:Ll/smg0;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    return-object v0
.end method

.method public static f()Z
    .locals 3

    .line 1
    invoke-static {}, Ltech/sud/gip/core/SudGIP;->getCfg()Ltech/sud/gip/core/ISudCfg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ltech/sud/gip/core/ISudCfg;->getAdvancedConfigMap()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "runtime_3d_multiprocess"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "runtime3dMultiprocess:"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "SdkMgr"

    .line 32
    .line 33
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    const-string v1, "true"

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    return v0

    .line 46
    :cond_0
    const-string v1, "false"

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    return v1

    .line 56
    :cond_1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-boolean v0, v0, Ll/gvg0;->k:Z

    .line 65
    .line 66
    return v0

    .line 67
    :cond_2
    return v1
.end method
