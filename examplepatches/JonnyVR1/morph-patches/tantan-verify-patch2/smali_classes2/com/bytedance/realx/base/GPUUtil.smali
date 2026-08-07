.class public Lcom/bytedance/realx/base/GPUUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static glRenderer:Ljava/lang/String; = "unknown"

.field private static glVendor:Ljava/lang/String; = "unknown"

.field private static initialized:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static Initialize()V
    .locals 15
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x11
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/bytedance/realx/base/GPUUtil;->initialized:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 7
    .line 8
    .line 9
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 10
    if-eqz v3, :cond_1

    .line 11
    .line 12
    :try_start_1
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    if-ne v3, v4, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    move v4, v1

    .line 18
    goto :goto_3

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    :goto_0
    move-object v4, v3

    .line 21
    move-object v3, v2

    .line 22
    goto/16 :goto_6

    .line 23
    .line 24
    :catch_0
    move-exception v0

    .line 25
    :goto_1
    move-object v4, v3

    .line 26
    move-object v3, v2

    .line 27
    goto/16 :goto_5

    .line 28
    .line 29
    :cond_1
    :goto_2
    move v4, v0

    .line 30
    :goto_3
    if-eqz v4, :cond_9

    .line 31
    .line 32
    :try_start_2
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 33
    .line 34
    .line 35
    move-result-object v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 36
    if-eqz v5, :cond_8

    .line 37
    .line 38
    :try_start_3
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 39
    .line 40
    if-eq v5, v6, :cond_8

    .line 41
    .line 42
    const/4 v13, 0x2

    .line 43
    new-array v6, v13, [I

    .line 44
    .line 45
    invoke-static {v5, v6, v1, v6, v0}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_7

    .line 50
    .line 51
    const/16 v6, 0xd

    .line 52
    .line 53
    new-array v6, v6, [I

    .line 54
    .line 55
    fill-array-data v6, :array_0

    .line 56
    .line 57
    .line 58
    new-array v11, v0, [I

    .line 59
    .line 60
    const/4 v10, 0x1

    .line 61
    new-array v8, v10, [Landroid/opengl/EGLConfig;

    .line 62
    .line 63
    const/4 v9, 0x0

    .line 64
    const/4 v12, 0x0

    .line 65
    const/4 v7, 0x0

    .line 66
    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-eqz v6, :cond_6

    .line 71
    .line 72
    aget v6, v11, v1

    .line 73
    .line 74
    if-lez v6, :cond_5

    .line 75
    .line 76
    aget-object v6, v8, v1

    .line 77
    .line 78
    const/16 v7, 0x3098

    .line 79
    .line 80
    const/16 v8, 0x3038

    .line 81
    .line 82
    filled-new-array {v7, v13, v8}, [I

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    sget-object v9, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 87
    .line 88
    invoke-static {v5, v6, v9, v7, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    if-eqz v3, :cond_4

    .line 93
    .line 94
    sget-object v7, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 95
    .line 96
    if-eq v3, v7, :cond_4

    .line 97
    .line 98
    const/16 v7, 0x3057

    .line 99
    .line 100
    const/16 v9, 0x3056

    .line 101
    .line 102
    filled-new-array {v7, v0, v9, v0, v8}, [I

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v5, v6, v0, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    if-eqz v2, :cond_3

    .line 111
    .line 112
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 113
    .line 114
    if-eq v2, v0, :cond_3

    .line 115
    .line 116
    invoke-static {v5, v2, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    move-object v1, v2

    .line 123
    move-object v2, v5

    .line 124
    goto :goto_4

    .line 125
    :cond_2
    new-instance v0, Ljava/lang/Exception;

    .line 126
    .line 127
    const-string v1, "eglMakeCurrent error"

    .line 128
    .line 129
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :catchall_1
    move-exception v0

    .line 134
    move v1, v4

    .line 135
    move-object v4, v3

    .line 136
    move-object v3, v2

    .line 137
    move-object v2, v5

    .line 138
    goto/16 :goto_6

    .line 139
    .line 140
    :catch_1
    move-exception v0

    .line 141
    move v1, v4

    .line 142
    move-object v4, v3

    .line 143
    move-object v3, v2

    .line 144
    move-object v2, v5

    .line 145
    goto/16 :goto_5

    .line 146
    .line 147
    :cond_3
    new-instance v0, Ljava/lang/Exception;

    .line 148
    .line 149
    const-string v1, "eglCreatePbufferSurface error"

    .line 150
    .line 151
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw v0

    .line 155
    :cond_4
    new-instance v0, Ljava/lang/Exception;

    .line 156
    .line 157
    const-string v1, "eglCreateContext error"

    .line 158
    .line 159
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw v0

    .line 163
    :cond_5
    new-instance v0, Ljava/lang/Exception;

    .line 164
    .line 165
    const-string v1, "no egl config chosen"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw v0

    .line 171
    :cond_6
    new-instance v0, Ljava/lang/Exception;

    .line 172
    .line 173
    const-string v1, "eglChooseConfig error"

    .line 174
    .line 175
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    throw v0

    .line 179
    :cond_7
    new-instance v0, Ljava/lang/Exception;

    .line 180
    .line 181
    const-string v1, "eglInitialize error"

    .line 182
    .line 183
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    throw v0

    .line 187
    :cond_8
    new-instance v0, Ljava/lang/Exception;

    .line 188
    .line 189
    const-string v1, "eglGetDisplay error"

    .line 190
    .line 191
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 195
    :catchall_2
    move-exception v0

    .line 196
    move v1, v4

    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :catch_2
    move-exception v0

    .line 200
    move v1, v4

    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_9
    move-object v1, v2

    .line 204
    :goto_4
    const/16 v0, 0x1f00

    .line 205
    .line 206
    :try_start_4
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    sput-object v0, Lcom/bytedance/realx/base/GPUUtil;->glVendor:Ljava/lang/String;

    .line 211
    .line 212
    const/16 v0, 0x1f01

    .line 213
    .line 214
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    sput-object v0, Lcom/bytedance/realx/base/GPUUtil;->glRenderer:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 219
    .line 220
    if-eqz v4, :cond_e

    .line 221
    .line 222
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 223
    .line 224
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 225
    .line 226
    invoke-static {v2, v0, v0, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 227
    .line 228
    .line 229
    if-eqz v1, :cond_a

    .line 230
    .line 231
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 232
    .line 233
    if-eq v1, v0, :cond_a

    .line 234
    .line 235
    invoke-static {v2, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 236
    .line 237
    .line 238
    :cond_a
    if-eqz v3, :cond_b

    .line 239
    .line 240
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 241
    .line 242
    if-eq v3, v0, :cond_b

    .line 243
    .line 244
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 245
    .line 246
    .line 247
    :cond_b
    if-eqz v2, :cond_e

    .line 248
    .line 249
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 250
    .line 251
    if-eq v2, v0, :cond_e

    .line 252
    .line 253
    invoke-static {v2}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :catchall_3
    move-exception v0

    .line 258
    move-object v14, v3

    .line 259
    move-object v3, v1

    .line 260
    move v1, v4

    .line 261
    move-object v4, v14

    .line 262
    goto :goto_6

    .line 263
    :catch_3
    move-exception v0

    .line 264
    move-object v14, v3

    .line 265
    move-object v3, v1

    .line 266
    move v1, v4

    .line 267
    move-object v4, v14

    .line 268
    goto :goto_5

    .line 269
    :catchall_4
    move-exception v0

    .line 270
    move-object v3, v2

    .line 271
    move-object v4, v3

    .line 272
    goto :goto_6

    .line 273
    :catch_4
    move-exception v0

    .line 274
    move-object v3, v2

    .line 275
    move-object v4, v3

    .line 276
    :goto_5
    :try_start_5
    const-string v5, "gpm"

    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 283
    .line 284
    .line 285
    if-eqz v1, :cond_e

    .line 286
    .line 287
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 288
    .line 289
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 290
    .line 291
    invoke-static {v2, v0, v0, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 292
    .line 293
    .line 294
    if-eqz v3, :cond_c

    .line 295
    .line 296
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 297
    .line 298
    if-eq v3, v0, :cond_c

    .line 299
    .line 300
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 301
    .line 302
    .line 303
    :cond_c
    if-eqz v4, :cond_d

    .line 304
    .line 305
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 306
    .line 307
    if-eq v4, v0, :cond_d

    .line 308
    .line 309
    invoke-static {v2, v4}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 310
    .line 311
    .line 312
    :cond_d
    if-eqz v2, :cond_e

    .line 313
    .line 314
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 315
    .line 316
    if-eq v2, v0, :cond_e

    .line 317
    .line 318
    invoke-static {v2}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 319
    .line 320
    .line 321
    :cond_e
    return-void

    .line 322
    :catchall_5
    move-exception v0

    .line 323
    :goto_6
    if-eqz v1, :cond_11

    .line 324
    .line 325
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 326
    .line 327
    sget-object v5, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 328
    .line 329
    invoke-static {v2, v1, v1, v5}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 330
    .line 331
    .line 332
    if-eqz v3, :cond_f

    .line 333
    .line 334
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 335
    .line 336
    if-eq v3, v1, :cond_f

    .line 337
    .line 338
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 339
    .line 340
    .line 341
    :cond_f
    if-eqz v4, :cond_10

    .line 342
    .line 343
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 344
    .line 345
    if-eq v4, v1, :cond_10

    .line 346
    .line 347
    invoke-static {v2, v4}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 348
    .line 349
    .line 350
    :cond_10
    if-eqz v2, :cond_11

    .line 351
    .line 352
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 353
    .line 354
    if-eq v2, v1, :cond_11

    .line 355
    .line 356
    invoke-static {v2}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 357
    .line 358
    .line 359
    :cond_11
    throw v0

    .line 360
    nop

    .line 361
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3033
        0x1
        0x3038
    .end array-data
.end method

.method public static getGPURenderer()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x16
    .end annotation

    .line 1
    sget-boolean v0, Lcom/bytedance/realx/base/GPUUtil;->initialized:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/bytedance/realx/base/GPUUtil;->Initialize()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Lcom/bytedance/realx/base/GPUUtil;->glRenderer:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static getGPURendererFallback()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/GPUUtil;->glRenderer:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method
