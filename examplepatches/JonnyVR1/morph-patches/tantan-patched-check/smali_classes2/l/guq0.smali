.class public final Ll/guq0;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/guq0$e;,
        Ll/guq0$f;
    }
.end annotation


# static fields
.field private static volatile h:Ll/guq0;


# instance fields
.field private a:Landroid/content/Context;

.field private b:I

.field private c:Ll/guq0$f;

.field private d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;"
        }
    .end annotation
.end field

.field private volatile e:Z

.field private f:Ljava/lang/Runnable;

.field private g:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/guq0;->b:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/guq0;->e:Z

    .line 9
    .line 10
    new-instance v0, Ll/guq0$c;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/guq0$c;-><init>(Ll/guq0;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/guq0;->f:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance v0, Ll/guq0$d;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/guq0$d;-><init>(Ll/guq0;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/guq0;->g:Ljava/lang/Runnable;

    .line 23
    .line 24
    iput-object p1, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 25
    .line 26
    return-void
.end method

.method public static a()Ll/guq0;
    .locals 3

    .line 1
    sget-object v0, Ll/guq0;->h:Ll/guq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/guq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/guq0;->h:Ll/guq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/guq0;

    .line 13
    .line 14
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v1, v2}, Ll/guq0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Ll/guq0;->h:Ll/guq0;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v1

    .line 30
    :cond_1
    :goto_2
    sget-object v0, Ll/guq0;->h:Ll/guq0;

    .line 31
    .line 32
    return-object v0
.end method

.method private b(Ljava/io/File;Lcom/apm/lite/CrashType;Ljava/lang/String;JJ)Ll/wxq0;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-wide/from16 v2, p4

    .line 6
    .line 7
    const-string v4, "data"

    .line 8
    .line 9
    const-string v5, "unauthentic_version"

    .line 10
    .line 11
    const-string v6, "unknown"

    .line 12
    .line 13
    const-string v7, "true"

    .line 14
    .line 15
    const-string v8, "has_dump"

    .line 16
    .line 17
    const-string v9, "logcat"

    .line 18
    .line 19
    const-string v10, "header"

    .line 20
    .line 21
    const-string v11, "lastAliveTime"

    .line 22
    .line 23
    const-string v12, "filters"

    .line 24
    .line 25
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isFile()Z

    .line 26
    .line 27
    .line 28
    move-result v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 29
    if-eqz v14, :cond_0

    .line 30
    .line 31
    :try_start_1
    invoke-static/range {p1 .. p1}, Ll/r3r0;->r(Ljava/io/File;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    const/4 v13, 0x0

    .line 35
    goto/16 :goto_8

    .line 36
    .line 37
    :catchall_0
    move-exception v0

    .line 38
    :goto_0
    const/4 v13, 0x0

    .line 39
    goto/16 :goto_7

    .line 40
    .line 41
    :cond_0
    :try_start_2
    sget-object v14, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_7

    .line 42
    .line 43
    if-ne v1, v14, :cond_1

    .line 44
    .line 45
    const/4 v14, 0x1

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 v14, 0x0

    .line 48
    :goto_1
    if-nez v1, :cond_2

    .line 49
    .line 50
    :try_start_3
    new-instance v0, Ljava/io/File;

    .line 51
    .line 52
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 56
    move-object/from16 v2, p1

    .line 57
    .line 58
    :try_start_4
    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Ll/r3r0;->C(Ljava/lang/String;)Ll/wxq0;

    .line 66
    .line 67
    .line 68
    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 69
    return-object v0

    .line 70
    :catchall_1
    move-exception v0

    .line 71
    move-object/from16 v2, p1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/16 v16, 0x1

    .line 75
    .line 76
    :try_start_5
    invoke-static/range {p1 .. p2}, Ll/r3r0;->g(Ljava/io/File;Lcom/apm/lite/CrashType;)Ll/wxq0;

    .line 77
    .line 78
    .line 79
    move-result-object v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 80
    :try_start_6
    invoke-virtual {v15}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    move-result-object v13

    .line 84
    invoke-virtual {v15}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    move-result-object v17

    .line 88
    if-eqz v17, :cond_c

    .line 89
    .line 90
    move/from16 v17, v14

    .line 91
    .line 92
    sget-object v14, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 93
    .line 94
    if-ne v1, v14, :cond_3

    .line 95
    .line 96
    return-object v15

    .line 97
    :cond_3
    const-string v1, "crash_time"

    .line 98
    .line 99
    invoke-virtual {v13, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    const-string v1, "app_start_time"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 103
    .line 104
    move-object/from16 v18, v15

    .line 105
    .line 106
    move-wide/from16 v14, p6

    .line 107
    .line 108
    :try_start_7
    invoke-virtual {v13, v1, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v13, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    move-result-object v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 115
    if-nez v1, :cond_4

    .line 116
    .line 117
    :try_start_8
    iget-object v1, v0, Ll/guq0;->a:Landroid/content/Context;

    .line 118
    .line 119
    invoke-static {v1, v2, v3}, Ll/hwq0;->b(Landroid/content/Context;J)Ll/hwq0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ll/hwq0;->s()Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    goto :goto_2

    .line 128
    :catchall_2
    move-exception v0

    .line 129
    move-object/from16 v13, v18

    .line 130
    .line 131
    goto/16 :goto_7

    .line 132
    .line 133
    :cond_4
    if-eqz v17, :cond_5

    .line 134
    .line 135
    invoke-virtual {v13, v10}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 136
    .line 137
    .line 138
    :cond_5
    :goto_2
    :try_start_9
    const-string v14, "sdk_version_name"

    .line 139
    .line 140
    const/4 v15, 0x0

    .line 141
    invoke-virtual {v1, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v14

    .line 145
    const-string v15, "sdk_version"
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 146
    .line 147
    if-nez v14, :cond_6

    .line 148
    .line 149
    :try_start_a
    const-string v14, "0.0.2"
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 150
    .line 151
    :cond_6
    :try_start_b
    invoke-static {v13, v12, v15, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 155
    .line 156
    .line 157
    move-result-object v14

    .line 158
    invoke-static {v14}, Ll/r3r0;->t(Lorg/json/JSONArray;)Z

    .line 159
    .line 160
    .line 161
    move-result v14
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 162
    if-eqz v14, :cond_7

    .line 163
    .line 164
    :try_start_c
    invoke-static/range {p3 .. p3}, Ll/h4r0;->b(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 165
    .line 166
    .line 167
    move-result-object v14

    .line 168
    invoke-virtual {v13, v9, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 169
    .line 170
    .line 171
    :cond_7
    :try_start_d
    invoke-static {v13, v12, v8, v7}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    const-string v14, "has_logcat"

    .line 175
    .line 176
    invoke-static {v13, v9}, Ll/t4r0;->h(Lorg/json/JSONObject;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    xor-int/lit8 v9, v9, 0x1

    .line 181
    .line 182
    invoke-static {v9}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v9

    .line 186
    invoke-static {v13, v12, v14, v9}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    const-string v9, "memory_leak"

    .line 190
    .line 191
    invoke-static/range {p3 .. p3}, Ll/gsq0;->v(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v14

    .line 195
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v14

    .line 199
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    const-string v9, "fd_leak"

    .line 203
    .line 204
    invoke-static/range {p3 .. p3}, Ll/gsq0;->z(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v14

    .line 208
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v14

    .line 212
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    const-string v9, "threads_leak"

    .line 216
    .line 217
    invoke-static/range {p3 .. p3}, Ll/gsq0;->B(Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result v14

    .line 221
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v14

    .line 225
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    const-string v9, "is_64_devices"

    .line 229
    .line 230
    invoke-static {}, Ll/hwq0;->f()Z

    .line 231
    .line 232
    .line 233
    move-result v14

    .line 234
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v14

    .line 238
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    const-string v9, "is_64_runtime"

    .line 242
    .line 243
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->n()Z

    .line 244
    .line 245
    .line 246
    move-result v14

    .line 247
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v14

    .line 251
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    const-string v9, "is_x86_devices"

    .line 255
    .line 256
    invoke-static {}, Ll/hwq0;->j()Z

    .line 257
    .line 258
    .line 259
    move-result v14

    .line 260
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v14

    .line 264
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    const-string v9, "has_meminfo_file"

    .line 268
    .line 269
    invoke-static/range {p3 .. p3}, Ll/gsq0;->p(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v14

    .line 273
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v14

    .line 277
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    const-string v9, "is_root"

    .line 281
    .line 282
    invoke-static {}, Ll/nwq0;->y()Z

    .line 283
    .line 284
    .line 285
    move-result v14

    .line 286
    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v14

    .line 290
    invoke-static {v13, v12, v9, v14}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    const-string v9, "launch_did"

    .line 294
    .line 295
    iget-object v0, v0, Ll/guq0;->a:Landroid/content/Context;

    .line 296
    .line 297
    invoke-static {v0}, Ll/hrq0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {v13, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 302
    .line 303
    .line 304
    const-string v0, "crash_uuid"

    .line 305
    .line 306
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v9

    .line 310
    invoke-virtual {v13, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 311
    .line 312
    .line 313
    const-string v0, "jiffy"

    .line 314
    .line 315
    invoke-static {}, Ll/e5r0;->a()J

    .line 316
    .line 317
    .line 318
    move-result-wide v14

    .line 319
    invoke-virtual {v13, v0, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 320
    .line 321
    .line 322
    move-object/from16 v0, p3

    .line 323
    .line 324
    :try_start_e
    invoke-static {v2, v3, v0}, Ll/kuq0;->a(JLjava/lang/String;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 329
    .line 330
    .line 331
    move-result-wide v14

    .line 332
    sub-long v2, v14, v2

    .line 333
    .line 334
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 335
    .line 336
    .line 337
    move-result-wide v2

    .line 338
    const-wide/32 v19, 0xea60

    .line 339
    .line 340
    .line 341
    cmp-long v0, v2, v19

    .line 342
    .line 343
    if-gez v0, :cond_8

    .line 344
    .line 345
    const-string v0, "< 60s"

    .line 346
    .line 347
    goto :goto_3

    .line 348
    :cond_8
    const-string v0, "> 60s"

    .line 349
    .line 350
    :goto_3
    invoke-static {v13, v12, v11, v0}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {v13, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 358
    .line 359
    .line 360
    goto :goto_4

    .line 361
    :catchall_3
    :try_start_f
    invoke-virtual {v13, v11, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 362
    .line 363
    .line 364
    invoke-static {v13, v12, v11, v6}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    :goto_4
    invoke-virtual {v13, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 368
    .line 369
    .line 370
    const-string v0, "storage"

    .line 371
    .line 372
    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 376
    if-nez v0, :cond_9

    .line 377
    .line 378
    :try_start_10
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-static {v0}, Ll/l6r0;->b(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    invoke-static {v13, v0}, Ll/gsq0;->n(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 387
    .line 388
    .line 389
    :cond_9
    :try_start_11
    invoke-static {v1}, Ll/hwq0;->n(Lorg/json/JSONObject;)Z

    .line 390
    .line 391
    .line 392
    move-result v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 393
    if-eqz v0, :cond_a

    .line 394
    .line 395
    :try_start_12
    invoke-static {v13, v12, v5, v5}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 396
    .line 397
    .line 398
    :cond_a
    :try_start_13
    invoke-virtual/range {v18 .. v18}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    const-string v2, "upload_scene"

    .line 403
    .line 404
    const-string v3, "launch_scan"

    .line 405
    .line 406
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 407
    .line 408
    .line 409
    if-eqz v17, :cond_b

    .line 410
    .line 411
    new-instance v0, Lorg/json/JSONObject;

    .line 412
    .line 413
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 414
    .line 415
    .line 416
    const-string v2, "event_type"

    .line 417
    .line 418
    const-string v3, "start_crash"

    .line 419
    .line 420
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 421
    .line 422
    .line 423
    const-string v2, "stack"

    .line 424
    .line 425
    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object v3

    .line 429
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 430
    .line 431
    .line 432
    new-instance v2, Lorg/json/JSONArray;

    .line 433
    .line 434
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v2, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v0, v10, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 445
    .line 446
    .line 447
    move-object/from16 v1, v18

    .line 448
    .line 449
    :try_start_14
    invoke-virtual {v1, v0}, Ll/wxq0;->d(Lorg/json/JSONObject;)V

    .line 450
    .line 451
    .line 452
    goto :goto_6

    .line 453
    :catchall_4
    move-exception v0

    .line 454
    :goto_5
    move-object v13, v1

    .line 455
    goto :goto_7

    .line 456
    :catchall_5
    move-exception v0

    .line 457
    move-object/from16 v1, v18

    .line 458
    .line 459
    goto :goto_5

    .line 460
    :cond_b
    move-object/from16 v1, v18

    .line 461
    .line 462
    const-string v0, "isJava"

    .line 463
    .line 464
    move/from16 v2, v16

    .line 465
    .line 466
    invoke-virtual {v13, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 467
    .line 468
    .line 469
    goto :goto_6

    .line 470
    :catchall_6
    move-exception v0

    .line 471
    move-object v1, v15

    .line 472
    goto :goto_5

    .line 473
    :cond_c
    move-object v1, v15

    .line 474
    invoke-static/range {p1 .. p1}, Ll/r3r0;->r(Ljava/io/File;)Z
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    .line 475
    .line 476
    .line 477
    :goto_6
    move-object v13, v1

    .line 478
    goto :goto_8

    .line 479
    :catchall_7
    move-exception v0

    .line 480
    const/4 v15, 0x0

    .line 481
    move-object v13, v15

    .line 482
    :goto_7
    invoke-static/range {p1 .. p1}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 483
    .line 484
    .line 485
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 486
    .line 487
    .line 488
    const-string v1, "NPTH_CATCH"

    .line 489
    .line 490
    invoke-static {v1, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 491
    .line 492
    .line 493
    :goto_8
    return-object v13
.end method

.method private c(Ll/nwq0;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/nwq0;->k()Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/json/JSONObject;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object p0

    .line 15
    :cond_1
    :goto_0
    invoke-static {}, Ll/n0r0;->f()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/nwq0;->x()V

    .line 22
    .line 23
    .line 24
    :cond_2
    invoke-virtual {p1}, Ll/nwq0;->j()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x0

    .line 29
    if-nez p0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/nwq0;->w()Z

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_3
    invoke-virtual {p1}, Ll/nwq0;->p()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_4

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/nwq0;->w()Z

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_4
    invoke-virtual {p1}, Ll/nwq0;->r()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/nwq0;->w()Z

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_5
    invoke-virtual {p1}, Ll/nwq0;->m()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ll/nwq0;->v()Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method private d(Ljava/io/File;Ll/guq0$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method private e(Ljava/util/HashMap;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j5r0;->u(Landroid/content/Context;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_5

    .line 12
    .line 13
    array-length v0, p0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    array-length v2, p0

    .line 20
    if-ge v1, v2, :cond_5

    .line 21
    .line 22
    const/4 v2, 0x5

    .line 23
    if-ge v1, v2, :cond_5

    .line 24
    .line 25
    aget-object v2, p0, v1

    .line 26
    .line 27
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_2

    .line 32
    .line 33
    :cond_1
    invoke-static {v2}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :catchall_0
    move-exception v3

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "G"

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Ll/guq0$f;

    .line 60
    .line 61
    if-nez v4, :cond_3

    .line 62
    .line 63
    new-instance v4, Ll/guq0$f;

    .line 64
    .line 65
    invoke-direct {v4, v3}, Ll/guq0$f;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-static {v2}, Ll/j5r0;->I(Ljava/io/File;)Ljava/io/File;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-static {v2}, Ll/j5r0;->J(Ljava/io/File;)Ljava/io/File;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-static {v3, v5}, Ll/zxq0;->b(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONArray;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    iput v5, v4, Ll/guq0$f;->g:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .line 89
    if-lez v5, :cond_4

    .line 90
    .line 91
    :try_start_1
    invoke-static {v2}, Ll/j5r0;->K(Ljava/io/File;)Ljava/io/File;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v2, v3, v0}, Ll/r3r0;->l(Ljava/io/File;Lorg/json/JSONArray;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :goto_1
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 100
    .line 101
    .line 102
    const-string v4, "NPTH_CATCH"

    .line 103
    .line 104
    invoke-static {v4, v3}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v2}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 108
    .line 109
    .line 110
    :catchall_1
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    :goto_3
    return-void
.end method

.method private f(Ljava/util/HashMap;Ll/guq0$f;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;",
            "Ll/guq0$f;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j5r0;->o(Landroid/content/Context;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_4

    .line 12
    .line 13
    array-length p2, p0

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_0
    const/4 p2, 0x0

    .line 18
    :goto_0
    array-length v0, p0

    .line 19
    if-ge p2, v0, :cond_4

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-ge p2, v0, :cond_4

    .line 23
    .line 24
    aget-object v0, p0, p2

    .line 25
    .line 26
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    :cond_1
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :catchall_0
    move-exception v1

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "G"

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/guq0$f;

    .line 59
    .line 60
    if-nez v2, :cond_3

    .line 61
    .line 62
    new-instance v2, Ll/guq0$f;

    .line 63
    .line 64
    invoke-direct {v2, v1}, Ll/guq0$f;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object v1, v2, Ll/guq0$f;->c:Ljava/util/List;

    .line 71
    .line 72
    new-instance v2, Ll/guq0$e;

    .line 73
    .line 74
    sget-object v3, Lcom/apm/lite/CrashType;->NATIVE:Lcom/apm/lite/CrashType;

    .line 75
    .line 76
    invoke-direct {v2, v0, v3}, Ll/guq0$e;-><init>(Ljava/io/File;Lcom/apm/lite/CrashType;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :goto_1
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 84
    .line 85
    .line 86
    const-string v2, "NPTH_CATCH"

    .line 87
    .line 88
    invoke-static {v2, v1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 92
    .line 93
    .line 94
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    :goto_3
    return-void
.end method

.method private g(Ljava/util/HashMap;Ll/guq0$f;Ljava/io/File;Ljava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;",
            "Ll/guq0$f;",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p0, "G"

    .line 2
    .line 3
    invoke-virtual {p4, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_7

    .line 8
    .line 9
    const-string p0, "_"

    .line 10
    .line 11
    invoke-virtual {p4, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length v0, p0

    .line 16
    const/4 v1, 0x5

    .line 17
    const/4 v2, 0x0

    .line 18
    if-ge v0, v1, :cond_0

    .line 19
    .line 20
    iget-object p0, p2, Ll/guq0$f;->b:Ljava/util/List;

    .line 21
    .line 22
    new-instance p1, Ll/guq0$e;

    .line 23
    .line 24
    invoke-direct {p1, p3, v2}, Ll/guq0$e;-><init>(Ljava/io/File;Lcom/apm/lite/CrashType;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    :try_start_0
    aget-object v1, p0, v0

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    const/4 v1, 0x4

    .line 39
    aget-object v1, p0, v1

    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    const/4 p2, 0x2

    .line 46
    aget-object v1, p0, p2

    .line 47
    .line 48
    const/4 v7, 0x1

    .line 49
    aget-object p0, p0, v7

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    const/4 v9, -0x1

    .line 59
    sparse-switch v8, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    :goto_0
    move v0, v9

    .line 63
    goto :goto_1

    .line 64
    :sswitch_0
    const-string v0, "java"

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-nez p0, :cond_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move v0, p2

    .line 74
    goto :goto_1

    .line 75
    :sswitch_1
    const-string p2, "anr"

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    move v0, v7

    .line 85
    goto :goto_1

    .line 86
    :sswitch_2
    const-string p2, "launch"

    .line 87
    .line 88
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_3

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :pswitch_0
    sget-object v2, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :pswitch_1
    sget-object v2, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :pswitch_2
    sget-object v2, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 106
    .line 107
    :goto_2
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ll/guq0$f;

    .line 112
    .line 113
    if-nez p0, :cond_4

    .line 114
    .line 115
    new-instance p0, Ll/guq0$f;

    .line 116
    .line 117
    invoke-direct {p0, v1}, Ll/guq0$f;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    :cond_4
    new-instance p1, Ll/guq0$e;

    .line 124
    .line 125
    invoke-direct {p1, p3, v3, v4, v2}, Ll/guq0$e;-><init>(Ljava/io/File;JLcom/apm/lite/CrashType;)V

    .line 126
    .line 127
    .line 128
    iput-wide v5, p1, Ll/guq0$e;->c:J

    .line 129
    .line 130
    iget-object p2, p0, Ll/guq0$f;->d:Ll/guq0$e;

    .line 131
    .line 132
    if-eqz p2, :cond_5

    .line 133
    .line 134
    iget-wide p2, p2, Ll/guq0$e;->b:J

    .line 135
    .line 136
    iget-wide v0, p1, Ll/guq0$e;->b:J

    .line 137
    .line 138
    cmp-long p2, p2, v0

    .line 139
    .line 140
    if-lez p2, :cond_6

    .line 141
    .line 142
    :cond_5
    if-eqz v2, :cond_6

    .line 143
    .line 144
    sget-object p2, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 145
    .line 146
    if-eq v2, p2, :cond_6

    .line 147
    .line 148
    const-string p2, "ignore"

    .line 149
    .line 150
    invoke-virtual {p4, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-nez p2, :cond_6

    .line 155
    .line 156
    iput-object p1, p0, Ll/guq0$f;->d:Ll/guq0$e;

    .line 157
    .line 158
    :cond_6
    iget-object p0, p0, Ll/guq0$f;->b:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :catchall_0
    iget-object p0, p2, Ll/guq0$f;->b:Ljava/util/List;

    .line 165
    .line 166
    new-instance p1, Ll/guq0$e;

    .line 167
    .line 168
    invoke-direct {p1, p3, v2}, Ll/guq0$e;-><init>(Ljava/io/File;Lcom/apm/lite/CrashType;)V

    .line 169
    .line 170
    .line 171
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 175
    .line 176
    .line 177
    new-instance p0, Ljava/lang/RuntimeException;

    .line 178
    .line 179
    const-string p1, "err format crashTime:"

    .line 180
    .line 181
    invoke-virtual {p1, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    const-string p1, "NPTH_CATCH"

    .line 189
    .line 190
    invoke-static {p1, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_7
    invoke-static {p3}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    nop

    .line 199
    :sswitch_data_0
    .sparse-switch
        -0x4226dc4d -> :sswitch_2
        0x179e5 -> :sswitch_1
        0x31aa22 -> :sswitch_0
    .end sparse-switch

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private h(Ll/guq0$f;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p1, Ll/guq0$f;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 13
    .line 14
    iget-object p1, p1, Ll/guq0$f;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/j5r0;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private i(Ll/guq0$f;ZLl/d3r0;)V
    .locals 17

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v2, p3

    .line 4
    .line 5
    const-string v3, "crash_thread_name"

    .line 6
    .line 7
    const-string v4, "NPTH_CATCH"

    .line 8
    .line 9
    const-string v5, "aid"

    .line 10
    .line 11
    iget-object v0, v1, Ll/guq0$f;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_a

    .line 20
    .line 21
    :cond_0
    iget-object v0, v1, Ll/guq0$f;->e:Ll/guq0$e;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, v1, Ll/guq0$f;->d:Ll/guq0$e;

    .line 26
    .line 27
    iput-object v0, v1, Ll/guq0$f;->e:Ll/guq0$e;

    .line 28
    .line 29
    :cond_1
    iget-object v0, v1, Ll/guq0$f;->b:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_f

    .line 40
    .line 41
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    move-object v7, v0

    .line 46
    check-cast v7, Ll/guq0$e;

    .line 47
    .line 48
    :try_start_0
    iget-object v9, v7, Ll/guq0$e;->a:Ljava/io/File;

    .line 49
    .line 50
    iget-object v10, v7, Ll/guq0$e;->d:Lcom/apm/lite/CrashType;

    .line 51
    .line 52
    iget-object v11, v1, Ll/guq0$f;->a:Ljava/lang/String;

    .line 53
    .line 54
    iget-wide v12, v7, Ll/guq0$e;->b:J

    .line 55
    .line 56
    iget-wide v14, v7, Ll/guq0$e;->c:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    move-object/from16 v8, p0

    .line 59
    .line 60
    :try_start_1
    invoke-direct/range {v8 .. v15}, Ll/guq0;->b(Ljava/io/File;Lcom/apm/lite/CrashType;Ljava/lang/String;JJ)Ll/wxq0;

    .line 61
    .line 62
    .line 63
    move-result-object v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 64
    if-nez v11, :cond_3

    .line 65
    .line 66
    :goto_1
    :try_start_2
    invoke-static {v9}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception v0

    .line 71
    move-object/from16 v16, v6

    .line 72
    .line 73
    :goto_2
    move-object/from16 v6, p0

    .line 74
    .line 75
    goto/16 :goto_9

    .line 76
    .line 77
    :cond_3
    invoke-virtual {v11}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    if-nez v8, :cond_4

    .line 82
    .line 83
    :goto_3
    goto :goto_1

    .line 84
    :cond_4
    const-string v0, "header"

    .line 85
    .line 86
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    const/4 v12, 0x0

    .line 94
    if-nez v10, :cond_7

    .line 95
    .line 96
    new-instance v13, Ljava/io/File;

    .line 97
    .line 98
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v14

    .line 102
    invoke-direct {v13, v9, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    .line 106
    .line 107
    .line 108
    move-result v13

    .line 109
    if-nez v13, :cond_6

    .line 110
    .line 111
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v13

    .line 115
    const-string v14, "_"

    .line 116
    .line 117
    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v13

    .line 121
    array-length v13, v13

    .line 122
    const/4 v14, 0x5

    .line 123
    if-ge v13, v14, :cond_7

    .line 124
    .line 125
    :cond_6
    invoke-virtual {v11}, Ll/wxq0;->a()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    invoke-static {v0, v8, v12}, Lcom/apm/lite/j/e;->e(Ljava/lang/String;Ljava/lang/String;Z)Ll/r4r0;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ll/r4r0;->a()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_2

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_7
    invoke-static {v9}, Ll/vuq0;->a(Ljava/io/File;)Ljava/io/File;

    .line 145
    .line 146
    .line 147
    move-result-object v13

    .line 148
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    .line 149
    .line 150
    .line 151
    move-result v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    if-nez v14, :cond_8

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_8
    :try_start_3
    new-instance v14, Lorg/json/JSONArray;

    .line 156
    .line 157
    invoke-static {v13}, Ll/r3r0;->y(Ljava/io/File;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v13

    .line 161
    invoke-direct {v14, v13}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 162
    .line 163
    .line 164
    :try_start_4
    sget-object v13, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 165
    .line 166
    if-ne v10, v13, :cond_9

    .line 167
    .line 168
    const-string v13, "data"

    .line 169
    .line 170
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v13

    .line 174
    check-cast v13, Lorg/json/JSONArray;

    .line 175
    .line 176
    invoke-virtual {v13, v12}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 177
    .line 178
    .line 179
    move-result-object v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 180
    goto :goto_4

    .line 181
    :cond_9
    move-object v12, v8

    .line 182
    :goto_4
    const-string v13, "ignore"

    .line 183
    .line 184
    const-string v15, "filters"

    .line 185
    .line 186
    if-nez p2, :cond_a

    .line 187
    .line 188
    move-object/from16 v16, v6

    .line 189
    .line 190
    :try_start_5
    iget-object v6, v1, Ll/guq0$f;->e:Ll/guq0$e;

    .line 191
    .line 192
    if-ne v6, v7, :cond_b

    .line 193
    .line 194
    goto :goto_5

    .line 195
    :catchall_1
    move-exception v0

    .line 196
    goto :goto_2

    .line 197
    :cond_a
    move-object/from16 v16, v6

    .line 198
    .line 199
    :goto_5
    iget-object v6, v7, Ll/guq0$e;->e:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v6, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 205
    if-eqz v6, :cond_c

    .line 206
    .line 207
    :cond_b
    :try_start_6
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-static {v12, v15, v5, v0}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    const-string v0, "has_ignore"

    .line 219
    .line 220
    iget-object v6, v7, Ll/guq0$e;->e:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v6, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 223
    .line 224
    .line 225
    move-result v6

    .line 226
    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    invoke-static {v12, v15, v0, v6}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 231
    .line 232
    .line 233
    goto :goto_7

    .line 234
    :catchall_2
    move-exception v0

    .line 235
    :try_start_7
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 236
    .line 237
    .line 238
    invoke-static {v4, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 239
    .line 240
    .line 241
    goto :goto_7

    .line 242
    :cond_c
    if-eqz v2, :cond_d

    .line 243
    .line 244
    const-string v0, "crash_md5"

    .line 245
    .line 246
    const-string v6, "default"

    .line 247
    .line 248
    invoke-virtual {v12, v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {v2, v0}, Ll/d3r0;->c(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_d

    .line 257
    .line 258
    iget-object v0, v7, Ll/guq0$e;->a:Ljava/io/File;

    .line 259
    .line 260
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 261
    .line 262
    .line 263
    :goto_6
    move-object/from16 v6, v16

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_d
    :goto_7
    const-string v0, "start_uuid"

    .line 268
    .line 269
    iget-object v6, v1, Ll/guq0$f;->a:Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {v12, v15, v0, v6}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    const-string v0, "leak_threads_count"

    .line 275
    .line 276
    iget v6, v1, Ll/guq0$f;->g:I

    .line 277
    .line 278
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    invoke-static {v12, v15, v0, v6}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    const-string v0, "unknown"

    .line 286
    .line 287
    invoke-virtual {v12, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-static {v12, v15, v3, v0}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    new-instance v0, Ll/guq0$a;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 295
    .line 296
    move-object/from16 v6, p0

    .line 297
    .line 298
    :try_start_8
    invoke-direct {v0, v6, v11, v9, v1}, Ll/guq0$a;-><init>(Ll/guq0;Ll/wxq0;Ljava/io/File;Ll/guq0$f;)V

    .line 299
    .line 300
    .line 301
    invoke-static {v8, v14, v0}, Ll/vuq0;->h(Lorg/json/JSONObject;Lorg/json/JSONArray;Ll/vuq0$a;)V

    .line 302
    .line 303
    .line 304
    invoke-static {v9}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_e

    .line 309
    .line 310
    invoke-static {}, Ll/dsq0;->a()Ll/dsq0;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v11

    .line 318
    invoke-static {v11}, Ll/esq0;->a(Ljava/lang/String;)Ll/esq0;

    .line 319
    .line 320
    .line 321
    move-result-object v11

    .line 322
    invoke-virtual {v0, v11}, Ll/dsq0;->c(Ll/esq0;)V

    .line 323
    .line 324
    .line 325
    goto :goto_8

    .line 326
    :catchall_3
    move-exception v0

    .line 327
    goto :goto_9

    .line 328
    :cond_e
    :goto_8
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    iget-object v11, v1, Ll/guq0$f;->a:Ljava/lang/String;

    .line 333
    .line 334
    invoke-static {v0, v11}, Ll/j5r0;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v9

    .line 342
    invoke-static {v0, v9}, Ll/s2r0;->b(Ljava/io/File;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    invoke-static {v10, v8}, Ll/lwq0;->b(Lcom/apm/lite/CrashType;Lorg/json/JSONObject;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 346
    .line 347
    .line 348
    goto :goto_6

    .line 349
    :catchall_4
    move-object/from16 v16, v6

    .line 350
    .line 351
    move-object/from16 v6, p0

    .line 352
    .line 353
    goto :goto_6

    .line 354
    :catchall_5
    move-exception v0

    .line 355
    move-object/from16 v16, v6

    .line 356
    .line 357
    move-object v6, v8

    .line 358
    :goto_9
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 359
    .line 360
    .line 361
    invoke-static {v4, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 362
    .line 363
    .line 364
    iget-object v0, v7, Ll/guq0$e;->a:Ljava/io/File;

    .line 365
    .line 366
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 367
    .line 368
    .line 369
    goto :goto_6

    .line 370
    :cond_f
    :goto_a
    return-void
.end method

.method public static synthetic j(Ll/guq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/guq0;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Ljava/io/File;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    array-length v0, p0

    .line 10
    move v1, p1

    .line 11
    :goto_0
    if-ge v1, v0, :cond_2

    .line 12
    .line 13
    aget-object v2, p0, v1

    .line 14
    .line 15
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    const-string v3, ""

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return p1
.end method

.method private n(Ljava/util/HashMap;Ll/guq0$f;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;",
            "Ll/guq0$f;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_4

    .line 14
    :cond_0
    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    array-length v2, v0

    .line 23
    if-ge v1, v2, :cond_5

    .line 24
    .line 25
    aget-object v2, v0, v1

    .line 26
    .line 27
    :try_start_0
    invoke-static {}, Ll/dsq0;->a()Ll/dsq0;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v3, v4}, Ll/dsq0;->d(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    :goto_1
    invoke-static {v2}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_3

    .line 45
    :catchall_0
    move-exception v2

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-static {v2}, Ll/r3r0;->G(Ljava/io/File;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_2
    invoke-static {}, Ll/frq0;->e()Ll/frq0;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v3, v4}, Ll/frq0;->p(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_3

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-direct {p0, p1, p2, v2, v3}, Ll/guq0;->g(Ljava/util/HashMap;Ll/guq0$f;Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :goto_2
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 85
    .line 86
    .line 87
    const-string v3, "NPTH_CATCH"

    .line 88
    .line 89
    invoke-static {v3, v2}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    :goto_4
    return-void
.end method

.method private o(Ll/guq0$f;ZLl/d3r0;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    const-string v4, "crash_thread_name"

    .line 8
    .line 9
    const-string v5, "aid"

    .line 10
    .line 11
    iget-object v0, v2, Ll/guq0$f;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v6, 0x1

    .line 18
    if-le v0, v6, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, v2, Ll/guq0$f;->c:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, v2, Ll/guq0$f;->d:Ll/guq0$e;

    .line 30
    .line 31
    iput-object v0, v2, Ll/guq0$f;->e:Ll/guq0$e;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    iget-object v0, v1, Ll/guq0;->a:Landroid/content/Context;

    .line 35
    .line 36
    invoke-static {v0}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    iget-object v0, v2, Ll/guq0$f;->d:Ll/guq0$e;

    .line 41
    .line 42
    iput-object v0, v2, Ll/guq0$f;->e:Ll/guq0$e;

    .line 43
    .line 44
    new-instance v8, Ll/nwq0;

    .line 45
    .line 46
    iget-object v0, v1, Ll/guq0;->a:Landroid/content/Context;

    .line 47
    .line 48
    invoke-direct {v8, v0}, Ll/nwq0;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v2, Ll/guq0$f;->c:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v9

    .line 57
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_11

    .line 62
    .line 63
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ll/guq0$e;

    .line 68
    .line 69
    iget-object v10, v0, Ll/guq0$e;->a:Ljava/io/File;

    .line 70
    .line 71
    :try_start_0
    invoke-virtual {v8, v10}, Ll/nwq0;->d(Ljava/io/File;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {v1, v8}, Ll/guq0;->c(Ll/nwq0;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    move-result-object v11

    .line 78
    if-eqz v11, :cond_2

    .line 79
    .line 80
    invoke-virtual {v11}, Lorg/json/JSONObject;->length()I

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    if-nez v12, :cond_3

    .line 85
    .line 86
    :cond_2
    move/from16 v16, v7

    .line 87
    .line 88
    goto/16 :goto_4

    .line 89
    .line 90
    :cond_3
    invoke-virtual {v11}, Lorg/json/JSONObject;->length()I

    .line 91
    .line 92
    .line 93
    move-result v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 94
    if-eqz v12, :cond_10

    .line 95
    .line 96
    const-string v12, "filters"

    .line 97
    .line 98
    const-string v13, "default"

    .line 99
    .line 100
    if-nez p2, :cond_9

    .line 101
    .line 102
    :try_start_1
    const-string v14, "crash_time"

    .line 103
    .line 104
    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 108
    :try_start_2
    iget-object v6, v2, Ll/guq0$f;->e:Ll/guq0$e;

    .line 109
    .line 110
    if-nez v6, :cond_5

    .line 111
    .line 112
    iput-object v0, v2, Ll/guq0$f;->e:Ll/guq0$e;

    .line 113
    .line 114
    const/4 v6, 0x1

    .line 115
    iput-boolean v6, v2, Ll/guq0$f;->f:Z

    .line 116
    .line 117
    if-eqz v3, :cond_4

    .line 118
    .line 119
    invoke-virtual {v3, v13}, Ll/d3r0;->c(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_4

    .line 124
    .line 125
    invoke-virtual {v8}, Ll/nwq0;->w()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .line 127
    .line 128
    :goto_2
    const/4 v6, 0x1

    .line 129
    goto :goto_1

    .line 130
    :catchall_0
    move-exception v0

    .line 131
    move/from16 v16, v7

    .line 132
    .line 133
    :goto_3
    const/4 v6, 0x1

    .line 134
    goto/16 :goto_8

    .line 135
    .line 136
    :cond_4
    move/from16 v16, v7

    .line 137
    .line 138
    const/4 v6, 0x1

    .line 139
    goto :goto_6

    .line 140
    :cond_5
    move/from16 v16, v7

    .line 141
    .line 142
    :try_start_3
    iget-boolean v7, v2, Ll/guq0$f;->f:Z

    .line 143
    .line 144
    if-nez v7, :cond_8

    .line 145
    .line 146
    iget-wide v6, v6, Ll/guq0$e;->b:J

    .line 147
    .line 148
    cmp-long v6, v14, v6

    .line 149
    .line 150
    if-gez v6, :cond_8

    .line 151
    .line 152
    iput-object v0, v2, Ll/guq0$f;->e:Ll/guq0$e;

    .line 153
    .line 154
    if-eqz v3, :cond_6

    .line 155
    .line 156
    invoke-virtual {v3, v13}, Ll/d3r0;->c(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_6

    .line 161
    .line 162
    invoke-virtual {v8}, Ll/nwq0;->w()Z

    .line 163
    .line 164
    .line 165
    move/from16 v7, v16

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :catchall_1
    move-exception v0

    .line 169
    goto :goto_3

    .line 170
    :cond_6
    invoke-direct {v1, v10}, Ll/guq0;->l(Ljava/io/File;)Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_7

    .line 175
    .line 176
    invoke-direct {v1, v10, v2}, Ll/guq0;->d(Ljava/io/File;Ll/guq0$f;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 177
    .line 178
    .line 179
    :cond_7
    const/4 v6, 0x1

    .line 180
    :try_start_4
    iput-boolean v6, v2, Ll/guq0$f;->f:Z

    .line 181
    .line 182
    goto :goto_6

    .line 183
    :catchall_2
    move-exception v0

    .line 184
    goto/16 :goto_8

    .line 185
    .line 186
    :cond_8
    const/4 v6, 0x1

    .line 187
    const-string v0, "header"

    .line 188
    .line 189
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-static {v11, v12, v5, v0}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    goto :goto_6

    .line 205
    :catchall_3
    move-exception v0

    .line 206
    move/from16 v16, v7

    .line 207
    .line 208
    goto/16 :goto_8

    .line 209
    .line 210
    :cond_9
    move/from16 v16, v7

    .line 211
    .line 212
    if-eqz v3, :cond_a

    .line 213
    .line 214
    invoke-virtual {v3, v13}, Ll/d3r0;->c(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_a

    .line 219
    .line 220
    :goto_4
    invoke-virtual {v8}, Ll/nwq0;->w()Z

    .line 221
    .line 222
    .line 223
    :goto_5
    move/from16 v7, v16

    .line 224
    .line 225
    goto/16 :goto_1

    .line 226
    .line 227
    :cond_a
    :goto_6
    const-string v0, "start_uuid"

    .line 228
    .line 229
    iget-object v7, v2, Ll/guq0$f;->a:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v11, v12, v0, v7}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    const-string v0, "unknown"

    .line 235
    .line 236
    invoke-virtual {v11, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-static {v11, v12, v4, v0}, Ll/gsq0;->k(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    if-eqz v16, :cond_f

    .line 244
    .line 245
    new-instance v0, Ll/lwq0$b;

    .line 246
    .line 247
    sget-object v7, Lcom/apm/lite/CrashType;->NATIVE:Lcom/apm/lite/CrashType;

    .line 248
    .line 249
    invoke-direct {v0, v11, v7}, Ll/lwq0$b;-><init>(Lorg/json/JSONObject;Lcom/apm/lite/CrashType;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v10}, Ll/vuq0;->a(Ljava/io/File;)Ljava/io/File;

    .line 253
    .line 254
    .line 255
    move-result-object v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 256
    const/4 v12, 0x0

    .line 257
    :try_start_5
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 258
    .line 259
    .line 260
    move-result v13

    .line 261
    if-eqz v13, :cond_b

    .line 262
    .line 263
    new-instance v13, Lorg/json/JSONArray;

    .line 264
    .line 265
    invoke-static {v7}, Ll/r3r0;->y(Ljava/io/File;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v7

    .line 269
    invoke-direct {v13, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 270
    .line 271
    .line 272
    move-object v12, v13

    .line 273
    :catchall_4
    :cond_b
    if-nez v12, :cond_d

    .line 274
    .line 275
    :try_start_6
    invoke-static {}, Ll/k5r0;->c()Ll/k5r0;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    invoke-virtual {v0}, Ll/lwq0$b;->b()J

    .line 280
    .line 281
    .line 282
    move-result-wide v12

    .line 283
    const-wide/16 v14, -0x1

    .line 284
    .line 285
    cmp-long v12, v12, v14

    .line 286
    .line 287
    if-nez v12, :cond_c

    .line 288
    .line 289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 290
    .line 291
    .line 292
    move-result-wide v12

    .line 293
    goto :goto_7

    .line 294
    :cond_c
    invoke-virtual {v0}, Ll/lwq0$b;->b()J

    .line 295
    .line 296
    .line 297
    move-result-wide v12

    .line 298
    :goto_7
    invoke-virtual {v7, v12, v13}, Ll/k5r0;->h(J)Lorg/json/JSONArray;

    .line 299
    .line 300
    .line 301
    move-result-object v12

    .line 302
    :cond_d
    invoke-virtual {v0}, Ll/lwq0$b;->c()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v7

    .line 306
    invoke-virtual {v0}, Ll/lwq0$b;->a()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-static {v7, v0, v12}, Ll/vuq0;->e(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    new-instance v7, Ll/guq0$b;

    .line 315
    .line 316
    invoke-direct {v7, v1, v10, v2}, Ll/guq0$b;-><init>(Ll/guq0;Ljava/io/File;Ll/guq0$f;)V

    .line 317
    .line 318
    .line 319
    invoke-static {v11, v0, v7}, Ll/vuq0;->h(Lorg/json/JSONObject;Lorg/json/JSONArray;Ll/vuq0$a;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v8}, Ll/nwq0;->w()Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-nez v0, :cond_e

    .line 327
    .line 328
    invoke-virtual {v8}, Ll/nwq0;->s()V

    .line 329
    .line 330
    .line 331
    :cond_e
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    iget-object v7, v2, Ll/guq0$f;->a:Ljava/lang/String;

    .line 336
    .line 337
    invoke-static {v0, v7}, Ll/j5r0;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v7

    .line 345
    invoke-static {v0, v7}, Ll/s2r0;->b(Ljava/io/File;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    :cond_f
    sget-object v0, Lcom/apm/lite/CrashType;->NATIVE:Lcom/apm/lite/CrashType;

    .line 349
    .line 350
    invoke-static {v0, v11}, Ll/lwq0;->b(Lcom/apm/lite/CrashType;Lorg/json/JSONObject;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 351
    .line 352
    .line 353
    goto/16 :goto_5

    .line 354
    .line 355
    :cond_10
    move/from16 v16, v7

    .line 356
    .line 357
    goto/16 :goto_5

    .line 358
    .line 359
    :goto_8
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 360
    .line 361
    .line 362
    const-string v7, "NPTH_CATCH"

    .line 363
    .line 364
    invoke-static {v7, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 365
    .line 366
    .line 367
    invoke-static {v10}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 368
    .line 369
    .line 370
    goto/16 :goto_5

    .line 371
    .line 372
    :cond_11
    return-void
.end method

.method public static synthetic p(Ll/guq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/guq0;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/guq0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method private r(Ljava/util/HashMap;Ll/guq0$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/guq0$f;",
            ">;",
            "Ll/guq0$f;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j5r0;->g(Landroid/content/Context;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private t()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/guq0$f;

    .line 7
    .line 8
    const-string v1, "old_uuid"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/guq0$f;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ll/guq0;->e(Ljava/util/HashMap;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 26
    .line 27
    iget-object v1, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 28
    .line 29
    invoke-direct {p0, v0, v1}, Ll/guq0;->n(Ljava/util/HashMap;Ll/guq0$f;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 33
    .line 34
    iget-object v1, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 35
    .line 36
    invoke-direct {p0, v0, v1}, Ll/guq0;->r(Ljava/util/HashMap;Ll/guq0$f;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 40
    .line 41
    iget-object v1, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 42
    .line 43
    invoke-direct {p0, v0, v1}, Ll/guq0;->f(Ljava/util/HashMap;Ll/guq0$f;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0, v0, v1, v2}, Ll/guq0;->o(Ll/guq0$f;ZLl/d3r0;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 54
    .line 55
    invoke-direct {p0, v0, v1, v2}, Ll/guq0;->i(Ll/guq0$f;ZLl/d3r0;)V

    .line 56
    .line 57
    .line 58
    iput-object v2, p0, Ll/guq0;->c:Ll/guq0$f;

    .line 59
    .line 60
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-direct {p0}, Ll/guq0;->v()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-direct {p0}, Ll/guq0;->w()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/guq0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0}, Ll/guq0;->v()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-direct {p0}, Ll/guq0;->x()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    new-instance v1, Ll/d3r0;

    .line 27
    .line 28
    iget-object v2, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ll/d3r0;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Ll/guq0$f;

    .line 54
    .line 55
    invoke-direct {p0, v3, v0, v1}, Ll/guq0;->o(Ll/guq0$f;ZLl/d3r0;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget-object v2, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_3

    .line 74
    .line 75
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Ll/guq0$f;

    .line 80
    .line 81
    invoke-direct {p0, v3, v0, v1}, Ll/guq0;->i(Ll/guq0$f;ZLl/d3r0;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    iget-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_4

    .line 100
    .line 101
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Ll/guq0$f;

    .line 106
    .line 107
    invoke-direct {p0, v2}, Ll/guq0;->h(Ll/guq0$f;)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    iget-object v0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 112
    .line 113
    invoke-static {v0}, Ll/j5r0;->H(Landroid/content/Context;)Ljava/io/File;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ll/d3r0;->a()V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/kuq0;->b()V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0}, Ll/guq0;->v()V

    .line 127
    .line 128
    .line 129
    :cond_5
    :goto_3
    return-void
.end method

.method private v()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/guq0;->e:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/guq0;->d:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private w()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/guq0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {v0}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-wide/16 v1, 0x1388

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    invoke-static {}, Ll/n0r0;->l()J

    .line 21
    .line 22
    .line 23
    move-result-wide v5

    .line 24
    sub-long/2addr v3, v5

    .line 25
    cmp-long v0, v3, v1

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/b350;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    :cond_1
    invoke-direct {p0}, Ll/guq0;->u()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Ll/guq0;->f:Ljava/lang/Runnable;

    .line 44
    .line 45
    invoke-virtual {v0, p0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private x()Z
    .locals 4

    .line 1
    iget v0, p0, Ll/guq0;->b:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    invoke-static {}, Ll/nrq0;->h()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :cond_0
    iput v3, p0, Ll/guq0;->b:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-static {}, Ll/nrq0;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iput v2, p0, Ll/guq0;->b:I

    .line 24
    .line 25
    :cond_2
    :goto_0
    iget p0, p0, Ll/guq0;->b:I

    .line 26
    .line 27
    if-ne p0, v2, :cond_3

    .line 28
    .line 29
    return v2

    .line 30
    :cond_3
    return v3
.end method

.method private y()V
    .locals 8

    .line 1
    iget-object p0, p0, Ll/guq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j5r0;->B(Landroid/content/Context;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_4

    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    array-length v1, p0

    .line 17
    if-ge v0, v1, :cond_5

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    if-ge v0, v1, :cond_5

    .line 21
    .line 22
    aget-object v1, p0, v0

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, ".atmp"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-static {}, Ll/bsq0;->a()Ll/bsq0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v2, v1}, Ll/bsq0;->c(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_3

    .line 48
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Ll/r3r0;->E(Ljava/lang/String;)Ll/wxq0;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    if-eqz v3, :cond_2

    .line 63
    .line 64
    invoke-virtual {v2}, Ll/wxq0;->f()Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-string v4, "upload_scene"

    .line 69
    .line 70
    const-string v5, "launch_scan"

    .line 71
    .line 72
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catchall_0
    move-exception v1

    .line 77
    goto :goto_2

    .line 78
    :cond_2
    :goto_1
    invoke-static {}, Lcom/apm/lite/j/e;->u()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v2}, Ll/wxq0;->l()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v2}, Ll/wxq0;->j()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v2}, Ll/wxq0;->n()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-virtual {v2}, Ll/wxq0;->o()Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    invoke-static {v3, v4, v5, v6, v7}, Lcom/apm/lite/j/e;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    invoke-static {v1}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ll/wxq0;->h()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v1}, Ll/r3r0;->s(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_3
    invoke-static {v1}, Ll/r3r0;->r(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :goto_2
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 120
    .line 121
    .line 122
    const-string v2, "NPTH_CATCH"

    .line 123
    .line 124
    invoke-static {v2, v1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 125
    .line 126
    .line 127
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_5
    :goto_4
    return-void
.end method


# virtual methods
.method public k(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/b350;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Ll/guq0;->t()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/guq0;->y()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    :try_start_0
    iget-boolean v0, p0, Ll/guq0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/lrq0;->j(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Ll/guq0;->g:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/r5r0;->e(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :catchall_0
    :cond_1
    :goto_0
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/guq0;->e:Z

    .line 2
    .line 3
    return p0
.end method
