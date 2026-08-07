.class public Lcom/tantanapp/beatles/BeatlesProvider;
.super Landroid/content/ContentProvider;
.source "SourceFile"


# static fields
.field public static final AUTOHORITY:Ljava/lang/String; = "com.tantanapp.beatles.beatles_provider"

.field private static final DEVICE_INFO_CODE:I = 0x2

.field private static final NET_STATS_CODE:I = 0x3

.field private static final PID_CODE:I = 0x1

.field private static flavor:Ljava/lang/String;

.field private static pullId:Ljava/lang/String;


# instance fields
.field final INFO_COLUMN_NAMES:[Ljava/lang/String;

.field final NET_STATS_COLUMN_NAMES:[Ljava/lang/String;

.field final PID_COLUMN_NAMES:[Ljava/lang/String;

.field final TAG:Ljava/lang/String;

.field private mMatcher:Landroid/content/UriMatcher;


# direct methods
.method public constructor <init>()V
    .locals 14

    .line 1
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/tantanapp/beatles/BeatlesProvider;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->TAG:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "timestamp"

    .line 13
    .line 14
    const-string v1, "page_name"

    .line 15
    .line 16
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->PID_COLUMN_NAMES:[Ljava/lang/String;

    .line 21
    .line 22
    const-string v12, "pullId"

    .line 23
    .line 24
    const-string v13, "flavor"

    .line 25
    .line 26
    const-string v1, "systemVersion"

    .line 27
    .line 28
    const-string v2, "versionName"

    .line 29
    .line 30
    const-string v3, "versionCode"

    .line 31
    .line 32
    const-string v4, "manufacturer"

    .line 33
    .line 34
    const-string v5, "model"

    .line 35
    .line 36
    const-string v6, "ram"

    .line 37
    .line 38
    const-string v7, "cpu"

    .line 39
    .line 40
    const-string v8, "deviceId"

    .line 41
    .line 42
    const-string v9, "isLocal"

    .line 43
    .line 44
    const-string v10, "buildType"

    .line 45
    .line 46
    const-string v11, "isTanker"

    .line 47
    .line 48
    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->INFO_COLUMN_NAMES:[Ljava/lang/String;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    new-array v0, v0, [Ljava/lang/String;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->NET_STATS_COLUMN_NAMES:[Ljava/lang/String;

    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/ContentValues;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "PIDProvider onCreate()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/UriMatcher;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->mMatcher:Landroid/content/UriMatcher;

    .line 15
    .line 16
    const-string v1, "com.tantanapp.beatles.beatles_provider"

    .line 17
    .line 18
    const-string v2, "pid/#"

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->mMatcher:Landroid/content/UriMatcher;

    .line 25
    .line 26
    const-string v2, "device_info/#"

    .line 27
    .line 28
    const/4 v4, 0x2

    .line 29
    invoke-virtual {v0, v1, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/tantanapp/beatles/BeatlesProvider;->mMatcher:Landroid/content/UriMatcher;

    .line 33
    .line 34
    const-string v0, "net_stats/#"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-virtual {p0, v1, v0, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    return v3
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 18
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/tantanapp/beatles/BeatlesProvider;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "PIDProvider query:"

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v4, "  watch Pid:"

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/du2;->n()Ll/ywd0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget v4, v4, Ll/ywd0;->d:I

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Lcom/tantanapp/beatles/BeatlesProvider;->mMatcher:Landroid/content/UriMatcher;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, -0x1

    .line 45
    const/4 v4, 0x0

    .line 46
    if-ne v2, v3, :cond_0

    .line 47
    .line 48
    return-object v4

    .line 49
    :cond_0
    invoke-static {v1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v5

    .line 53
    invoke-static {}, Ll/du2;->n()Ll/ywd0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v1, v1, Ll/ywd0;->d:I

    .line 58
    .line 59
    int-to-long v7, v1

    .line 60
    cmp-long v1, v5, v7

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    return-object v4

    .line 65
    :cond_1
    const/4 v1, 0x1

    .line 66
    if-eq v2, v1, :cond_7

    .line 67
    .line 68
    const/4 v1, 0x2

    .line 69
    if-eq v2, v1, :cond_3

    .line 70
    .line 71
    const/4 v1, 0x3

    .line 72
    if-eq v2, v1, :cond_2

    .line 73
    .line 74
    return-object v4

    .line 75
    :cond_2
    new-instance v1, Landroid/database/MatrixCursor;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tantanapp/beatles/BeatlesProvider;->NET_STATS_COLUMN_NAMES:[Ljava/lang/String;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const-string v0, "ERROR"

    .line 83
    .line 84
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-object v1

    .line 92
    :cond_3
    new-instance v1, Landroid/database/MatrixCursor;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/tantanapp/beatles/BeatlesProvider;->INFO_COLUMN_NAMES:[Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {v1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget-object v0, Lcom/tantanapp/beatles/BeatlesProvider;->pullId:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    sget-object v0, Lcom/tantanapp/beatles/BeatlesProvider;->flavor:Ljava/lang/String;

    .line 104
    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    :cond_4
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    .line 108
    .line 109
    new-instance v0, Ljava/io/InputStreamReader;

    .line 110
    .line 111
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    const-string v5, "config/config.json"

    .line 120
    .line 121
    invoke-virtual {v3, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-direct {v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 126
    .line 127
    .line 128
    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 129
    .line 130
    .line 131
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    if-eqz v3, :cond_5

    .line 141
    .line 142
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :catchall_0
    move-exception v0

    .line 147
    move-object v4, v2

    .line 148
    goto/16 :goto_3

    .line 149
    .line 150
    :catch_0
    move-exception v0

    .line 151
    move-object v4, v2

    .line 152
    goto :goto_1

    .line 153
    :cond_5
    new-instance v3, Lorg/json/JSONObject;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    const-string v0, "pullId"

    .line 163
    .line 164
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    sput-object v0, Lcom/tantanapp/beatles/BeatlesProvider;->pullId:Ljava/lang/String;

    .line 169
    .line 170
    const-string v0, "flavor"

    .line 171
    .line 172
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    sput-object v0, Lcom/tantanapp/beatles/BeatlesProvider;->flavor:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    .line 178
    invoke-static {v2}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 179
    .line 180
    .line 181
    goto :goto_2

    .line 182
    :catchall_1
    move-exception v0

    .line 183
    goto :goto_3

    .line 184
    :catch_1
    move-exception v0

    .line 185
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 186
    .line 187
    .line 188
    invoke-static {v4}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 189
    .line 190
    .line 191
    :cond_6
    :goto_2
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->k()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    invoke-static {}, Ll/vc60;->f()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    invoke-static {}, Ll/vc60;->e()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->e()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v8

    .line 211
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->g()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->m(Landroid/content/Context;)D

    .line 220
    .line 221
    .line 222
    move-result-wide v2

    .line 223
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 224
    .line 225
    .line 226
    move-result-object v10

    .line 227
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->a()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v11

    .line 231
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, Ll/cjk0;->d()Ll/r4f;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-interface {v0}, Ll/r4f;->a()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v12

    .line 243
    invoke-static {}, Ll/du2;->n()Ll/ywd0;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget-boolean v0, v0, Ll/ywd0;->a:Z

    .line 248
    .line 249
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 250
    .line 251
    .line 252
    move-result-object v13

    .line 253
    invoke-static {}, Ll/du2;->n()Ll/ywd0;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iget-object v14, v0, Ll/ywd0;->c:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {}, Ll/du2;->n()Ll/ywd0;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-boolean v0, v0, Ll/ywd0;->b:Z

    .line 264
    .line 265
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 266
    .line 267
    .line 268
    move-result-object v15

    .line 269
    sget-object v16, Lcom/tantanapp/beatles/BeatlesProvider;->pullId:Ljava/lang/String;

    .line 270
    .line 271
    sget-object v17, Lcom/tantanapp/beatles/BeatlesProvider;->flavor:Ljava/lang/String;

    .line 272
    .line 273
    filled-new-array/range {v5 .. v17}, [Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {v1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    return-object v1

    .line 281
    :goto_3
    invoke-static {v4}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 282
    .line 283
    .line 284
    throw v0

    .line 285
    :cond_7
    new-instance v1, Landroid/database/MatrixCursor;

    .line 286
    .line 287
    iget-object v0, v0, Lcom/tantanapp/beatles/BeatlesProvider;->PID_COLUMN_NAMES:[Ljava/lang/String;

    .line 288
    .line 289
    invoke-direct {v1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 293
    .line 294
    .line 295
    move-result-wide v2

    .line 296
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    invoke-virtual {v2}, Ll/cjk0;->d()Ll/r4f;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    invoke-interface {v2}, Ll/r4f;->c()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 317
    .line 318
    .line 319
    return-object v1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/ContentValues;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0
.end method
