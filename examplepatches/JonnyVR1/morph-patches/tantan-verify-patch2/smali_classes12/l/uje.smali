.class public Ll/uje;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field public b:Landroid/opengl/EGLDisplay;

.field public c:Landroid/opengl/EGLContext;

.field public d:Landroid/opengl/EGLConfig;

.field public e:Landroid/opengl/EGLSurface;

.field public f:I

.field public g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "EGLWrapper14"

    .line 5
    .line 6
    iput-object v0, p0, Ll/uje;->a:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    iput-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 13
    .line 14
    iput-object v0, p0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 18
    .line 19
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 20
    .line 21
    iput-object v0, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    iput v0, p0, Ll/uje;->f:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/uje;->g:Z

    .line 28
    .line 29
    return-void
.end method

.method public static d()I
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    const v0, 0x8d65

    .line 9
    .line 10
    .line 11
    aget v3, v1, v2

    .line 12
    .line 13
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const-string v0, "glBindTexture mTextureID"

    .line 17
    .line 18
    invoke-static {v0}, Ll/jej;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/16 v0, 0x2801

    .line 22
    .line 23
    const/high16 v3, 0x46180000    # 9728.0f

    .line 24
    .line 25
    const/16 v4, 0xde1

    .line 26
    .line 27
    invoke-static {v4, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0x2800

    .line 31
    .line 32
    const v3, 0x46180400    # 9729.0f

    .line 33
    .line 34
    .line 35
    invoke-static {v4, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 36
    .line 37
    .line 38
    const/16 v0, 0x2802

    .line 39
    .line 40
    const v3, 0x812f

    .line 41
    .line 42
    .line 43
    invoke-static {v4, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    .line 45
    .line 46
    const/16 v0, 0x2803

    .line 47
    .line 48
    invoke-static {v4, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 49
    .line 50
    .line 51
    const-string v0, "glTexParameter"

    .line 52
    .line 53
    invoke-static {v0}, Ll/jej;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    aget v0, v1, v2

    .line 57
    .line 58
    return v0
.end method

.method public static h(I)V
    .locals 2

    .line 1
    filled-new-array {p0}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 26
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iput-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    if-eq v3, v2, :cond_5

    .line 13
    .line 14
    const-string v2, "EGL14Wrapper eglGetDisplay"

    .line 15
    .line 16
    const-string v3, "mediaRender"

    .line 17
    .line 18
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    new-array v4, v2, [I

    .line 23
    .line 24
    iget-object v5, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 25
    .line 26
    const/4 v6, 0x1

    .line 27
    invoke-static {v5, v4, v1, v4, v6}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_4

    .line 32
    .line 33
    const-string v4, "EGL14Wrapper eglInitialize"

    .line 34
    .line 35
    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-array v13, v6, [I

    .line 39
    .line 40
    new-array v10, v6, [Landroid/opengl/EGLConfig;

    .line 41
    .line 42
    iget-boolean v4, v0, Ll/uje;->g:Z

    .line 43
    .line 44
    const/16 v5, 0xd

    .line 45
    .line 46
    const/16 v7, 0x3026

    .line 47
    .line 48
    const/16 v8, 0xc

    .line 49
    .line 50
    const/16 v9, 0xb

    .line 51
    .line 52
    const/16 v11, 0x3025

    .line 53
    .line 54
    const/16 v12, 0xa

    .line 55
    .line 56
    const/16 v14, 0x9

    .line 57
    .line 58
    const/16 v16, 0x3022

    .line 59
    .line 60
    const/16 v17, 0x6

    .line 61
    .line 62
    const/16 v18, 0x5

    .line 63
    .line 64
    const/16 v19, 0x3023

    .line 65
    .line 66
    const/16 v20, 0x3

    .line 67
    .line 68
    const/16 v21, 0x3024

    .line 69
    .line 70
    const/16 v22, 0x3040

    .line 71
    .line 72
    const/16 v23, 0x7

    .line 73
    .line 74
    const/16 v15, 0x3038

    .line 75
    .line 76
    const/16 v24, 0x4

    .line 77
    .line 78
    const/16 v25, 0x8

    .line 79
    .line 80
    if-eqz v4, :cond_0

    .line 81
    .line 82
    const/16 v4, 0xf

    .line 83
    .line 84
    new-array v4, v4, [I

    .line 85
    .line 86
    aput v22, v4, v1

    .line 87
    .line 88
    aput v24, v4, v6

    .line 89
    .line 90
    aput v21, v4, v2

    .line 91
    .line 92
    aput v25, v4, v20

    .line 93
    .line 94
    aput v19, v4, v24

    .line 95
    .line 96
    aput v25, v4, v18

    .line 97
    .line 98
    aput v16, v4, v17

    .line 99
    .line 100
    aput v25, v4, v23

    .line 101
    .line 102
    const/16 v16, 0x3021

    .line 103
    .line 104
    aput v16, v4, v25

    .line 105
    .line 106
    aput v25, v4, v14

    .line 107
    .line 108
    aput v11, v4, v12

    .line 109
    .line 110
    const/16 v11, 0x10

    .line 111
    .line 112
    aput v11, v4, v9

    .line 113
    .line 114
    aput v7, v4, v8

    .line 115
    .line 116
    aput v1, v4, v5

    .line 117
    .line 118
    const/16 v5, 0xe

    .line 119
    .line 120
    aput v15, v4, v5

    .line 121
    .line 122
    :goto_0
    move-object v8, v4

    .line 123
    goto :goto_1

    .line 124
    :cond_0
    new-array v4, v5, [I

    .line 125
    .line 126
    aput v22, v4, v1

    .line 127
    .line 128
    aput v24, v4, v6

    .line 129
    .line 130
    aput v21, v4, v2

    .line 131
    .line 132
    aput v25, v4, v20

    .line 133
    .line 134
    aput v19, v4, v24

    .line 135
    .line 136
    aput v25, v4, v18

    .line 137
    .line 138
    aput v16, v4, v17

    .line 139
    .line 140
    aput v25, v4, v23

    .line 141
    .line 142
    aput v11, v4, v25

    .line 143
    .line 144
    aput v1, v4, v14

    .line 145
    .line 146
    aput v7, v4, v12

    .line 147
    .line 148
    aput v1, v4, v9

    .line 149
    .line 150
    aput v15, v4, v8

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :goto_1
    iget-object v7, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 154
    .line 155
    const/4 v12, 0x1

    .line 156
    const/4 v14, 0x0

    .line 157
    const/4 v9, 0x0

    .line 158
    const/4 v11, 0x0

    .line 159
    invoke-static/range {v7 .. v14}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 160
    .line 161
    .line 162
    aget v4, v13, v1

    .line 163
    .line 164
    if-lez v4, :cond_3

    .line 165
    .line 166
    const-string v4, "EGL14Wrapper eglChooseConfig"

    .line 167
    .line 168
    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    aget-object v4, v10, v1

    .line 172
    .line 173
    iput-object v4, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 174
    .line 175
    const/16 v5, 0x3057

    .line 176
    .line 177
    const/16 v7, 0x3056

    .line 178
    .line 179
    filled-new-array {v5, v6, v7, v6, v15}, [I

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    const/16 v7, 0x3098

    .line 184
    .line 185
    filled-new-array {v7, v2, v15}, [I

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    iget-object v7, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 190
    .line 191
    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 192
    .line 193
    invoke-static {v7, v4, v8, v2, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iput-object v2, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 198
    .line 199
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 200
    .line 201
    if-eq v4, v2, :cond_2

    .line 202
    .line 203
    const-string v2, "EGL14Wrapper  eglCreateContext"

    .line 204
    .line 205
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    new-array v2, v6, [I

    .line 209
    .line 210
    iget-object v4, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 211
    .line 212
    iget-object v6, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 213
    .line 214
    const/16 v7, 0x3098

    .line 215
    .line 216
    invoke-static {v4, v6, v7, v2, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 217
    .line 218
    .line 219
    :try_start_0
    iget-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 220
    .line 221
    iget-object v4, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 222
    .line 223
    invoke-static {v2, v4, v5, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    .line 229
    goto :goto_2

    .line 230
    :catch_0
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 231
    .line 232
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 233
    .line 234
    :goto_2
    iget-object v0, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 235
    .line 236
    if-eqz v0, :cond_1

    .line 237
    .line 238
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 239
    .line 240
    if-eq v1, v0, :cond_1

    .line 241
    .line 242
    const-string v0, "EGL14Wrapper eglCreatePbufferSurface"

    .line 243
    .line 244
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    const-string v1, "eglCreatePbufferSurface,failed:"

    .line 257
    .line 258
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    const-string v1, "eglCreateContext,failed:"

    .line 271
    .line 272
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :cond_3
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    const-string v1, "eglChooseConfig,failed:"

    .line 285
    .line 286
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    const-string v1, "eglInitialize,failed:"

    .line 299
    .line 300
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_5
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    const-string v1, "eglGetDisplay,failed:"

    .line 313
    .line 314
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 315
    .line 316
    .line 317
    return-void
.end method

.method public b(Landroid/opengl/EGLContext;)V
    .locals 26
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    iput-object v3, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 13
    .line 14
    if-eq v4, v3, :cond_6

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    new-array v5, v4, [I

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    invoke-static {v3, v5, v2, v5, v6}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_5

    .line 25
    .line 26
    new-array v13, v6, [I

    .line 27
    .line 28
    new-array v10, v6, [Landroid/opengl/EGLConfig;

    .line 29
    .line 30
    iget-boolean v3, v0, Ll/uje;->g:Z

    .line 31
    .line 32
    const/16 v5, 0xd

    .line 33
    .line 34
    const/16 v7, 0x3026

    .line 35
    .line 36
    const/16 v8, 0xc

    .line 37
    .line 38
    const/16 v9, 0xb

    .line 39
    .line 40
    const/16 v11, 0x3025

    .line 41
    .line 42
    const/16 v12, 0xa

    .line 43
    .line 44
    const/16 v14, 0x9

    .line 45
    .line 46
    const/16 v16, 0x3022

    .line 47
    .line 48
    const/16 v17, 0x6

    .line 49
    .line 50
    const/16 v18, 0x5

    .line 51
    .line 52
    const/16 v19, 0x3023

    .line 53
    .line 54
    const/16 v20, 0x3

    .line 55
    .line 56
    const/16 v21, 0x3024

    .line 57
    .line 58
    const/16 v22, 0x3040

    .line 59
    .line 60
    const/16 v23, 0x7

    .line 61
    .line 62
    const/16 v15, 0x3038

    .line 63
    .line 64
    const/16 v24, 0x4

    .line 65
    .line 66
    const/16 v25, 0x8

    .line 67
    .line 68
    if-eqz v3, :cond_0

    .line 69
    .line 70
    const/16 v3, 0xf

    .line 71
    .line 72
    new-array v3, v3, [I

    .line 73
    .line 74
    aput v22, v3, v2

    .line 75
    .line 76
    aput v24, v3, v6

    .line 77
    .line 78
    aput v21, v3, v4

    .line 79
    .line 80
    aput v25, v3, v20

    .line 81
    .line 82
    aput v19, v3, v24

    .line 83
    .line 84
    aput v25, v3, v18

    .line 85
    .line 86
    aput v16, v3, v17

    .line 87
    .line 88
    aput v25, v3, v23

    .line 89
    .line 90
    const/16 v16, 0x3021

    .line 91
    .line 92
    aput v16, v3, v25

    .line 93
    .line 94
    aput v25, v3, v14

    .line 95
    .line 96
    aput v11, v3, v12

    .line 97
    .line 98
    const/16 v11, 0x10

    .line 99
    .line 100
    aput v11, v3, v9

    .line 101
    .line 102
    aput v7, v3, v8

    .line 103
    .line 104
    aput v2, v3, v5

    .line 105
    .line 106
    const/16 v5, 0xe

    .line 107
    .line 108
    aput v15, v3, v5

    .line 109
    .line 110
    :goto_0
    move-object v8, v3

    .line 111
    goto :goto_1

    .line 112
    :cond_0
    new-array v3, v5, [I

    .line 113
    .line 114
    aput v22, v3, v2

    .line 115
    .line 116
    aput v24, v3, v6

    .line 117
    .line 118
    aput v21, v3, v4

    .line 119
    .line 120
    aput v25, v3, v20

    .line 121
    .line 122
    aput v19, v3, v24

    .line 123
    .line 124
    aput v25, v3, v18

    .line 125
    .line 126
    aput v16, v3, v17

    .line 127
    .line 128
    aput v25, v3, v23

    .line 129
    .line 130
    aput v11, v3, v25

    .line 131
    .line 132
    aput v2, v3, v14

    .line 133
    .line 134
    aput v7, v3, v12

    .line 135
    .line 136
    aput v2, v3, v9

    .line 137
    .line 138
    aput v15, v3, v8

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :goto_1
    iget-object v7, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 142
    .line 143
    const/4 v12, 0x1

    .line 144
    const/4 v14, 0x0

    .line 145
    const/4 v9, 0x0

    .line 146
    const/4 v11, 0x0

    .line 147
    invoke-static/range {v7 .. v14}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 148
    .line 149
    .line 150
    aget v3, v13, v2

    .line 151
    .line 152
    if-lez v3, :cond_4

    .line 153
    .line 154
    aget-object v3, v10, v2

    .line 155
    .line 156
    iput-object v3, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 157
    .line 158
    const/16 v5, 0x3057

    .line 159
    .line 160
    const/16 v7, 0x3056

    .line 161
    .line 162
    filled-new-array {v5, v6, v7, v6, v15}, [I

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    const/16 v7, 0x3098

    .line 167
    .line 168
    filled-new-array {v7, v4, v15}, [I

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    iget-object v8, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 173
    .line 174
    if-eqz v1, :cond_1

    .line 175
    .line 176
    invoke-static {v8, v3, v1, v4, v2}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iput-object v1, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_1
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 184
    .line 185
    invoke-static {v8, v3, v1, v4, v2}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iput-object v1, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 190
    .line 191
    :goto_2
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 192
    .line 193
    iget-object v3, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 194
    .line 195
    if-eq v1, v3, :cond_3

    .line 196
    .line 197
    new-array v1, v6, [I

    .line 198
    .line 199
    iget-object v4, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 200
    .line 201
    invoke-static {v4, v3, v7, v1, v2}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 202
    .line 203
    .line 204
    :try_start_0
    iget-object v1, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 205
    .line 206
    iget-object v3, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 207
    .line 208
    invoke-static {v1, v3, v5, v2}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    .line 214
    goto :goto_3

    .line 215
    :catch_0
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 216
    .line 217
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 218
    .line 219
    :goto_3
    iget-object v0, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 220
    .line 221
    if-eqz v0, :cond_2

    .line 222
    .line 223
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 224
    .line 225
    if-eq v1, v0, :cond_2

    .line 226
    .line 227
    return-void

    .line 228
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v1, "eglCreatePbufferSurface,failed:"

    .line 237
    .line 238
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_3
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    const-string v1, "eglCreateContext,failed:"

    .line 251
    .line 252
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    return-void

    .line 256
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    const-string v1, "eglChooseConfig,failed:"

    .line 265
    .line 266
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    :cond_5
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    const-string v1, "eglInitialize,failed:"

    .line 279
    .line 280
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :cond_6
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    const-string v1, "eglGetDisplay,failed:"

    .line 293
    .line 294
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 295
    .line 296
    .line 297
    return-void
.end method

.method public c(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
    .locals 26
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iput-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    if-eq v3, v2, :cond_5

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v4, v3, [I

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    invoke-static {v2, v4, v1, v4, v5}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    new-array v12, v5, [I

    .line 25
    .line 26
    new-array v9, v5, [Landroid/opengl/EGLConfig;

    .line 27
    .line 28
    iget-boolean v2, v0, Ll/uje;->g:Z

    .line 29
    .line 30
    const/16 v6, 0xc

    .line 31
    .line 32
    const/16 v7, 0xb

    .line 33
    .line 34
    const/16 v8, 0x3025

    .line 35
    .line 36
    const/16 v10, 0xa

    .line 37
    .line 38
    const/16 v11, 0x9

    .line 39
    .line 40
    const/16 v13, 0x3142

    .line 41
    .line 42
    const/16 v15, 0x3022

    .line 43
    .line 44
    const/16 v16, 0x6

    .line 45
    .line 46
    const/16 v17, 0x5

    .line 47
    .line 48
    const/16 v18, 0x3023

    .line 49
    .line 50
    const/16 v19, 0x3

    .line 51
    .line 52
    const/16 v20, 0x3024

    .line 53
    .line 54
    const/16 v21, 0x3040

    .line 55
    .line 56
    const/16 v22, 0x3026

    .line 57
    .line 58
    const/16 v4, 0xf

    .line 59
    .line 60
    const/16 v23, 0x7

    .line 61
    .line 62
    const/16 v14, 0x3038

    .line 63
    .line 64
    const/16 v24, 0x4

    .line 65
    .line 66
    const/16 v25, 0x8

    .line 67
    .line 68
    if-eqz v2, :cond_0

    .line 69
    .line 70
    new-array v2, v4, [I

    .line 71
    .line 72
    aput v21, v2, v1

    .line 73
    .line 74
    aput v24, v2, v5

    .line 75
    .line 76
    aput v20, v2, v3

    .line 77
    .line 78
    aput v25, v2, v19

    .line 79
    .line 80
    aput v18, v2, v24

    .line 81
    .line 82
    aput v25, v2, v17

    .line 83
    .line 84
    aput v15, v2, v16

    .line 85
    .line 86
    aput v25, v2, v23

    .line 87
    .line 88
    aput v13, v2, v25

    .line 89
    .line 90
    aput v5, v2, v11

    .line 91
    .line 92
    aput v8, v2, v10

    .line 93
    .line 94
    const/16 v4, 0x10

    .line 95
    .line 96
    aput v4, v2, v7

    .line 97
    .line 98
    aput v22, v2, v6

    .line 99
    .line 100
    const/16 v4, 0xd

    .line 101
    .line 102
    aput v1, v2, v4

    .line 103
    .line 104
    const/16 v4, 0xe

    .line 105
    .line 106
    aput v14, v2, v4

    .line 107
    .line 108
    :goto_0
    move-object v7, v2

    .line 109
    goto :goto_1

    .line 110
    :cond_0
    new-array v2, v4, [I

    .line 111
    .line 112
    aput v21, v2, v1

    .line 113
    .line 114
    aput v24, v2, v5

    .line 115
    .line 116
    aput v20, v2, v3

    .line 117
    .line 118
    aput v25, v2, v19

    .line 119
    .line 120
    aput v18, v2, v24

    .line 121
    .line 122
    aput v25, v2, v17

    .line 123
    .line 124
    aput v15, v2, v16

    .line 125
    .line 126
    aput v25, v2, v23

    .line 127
    .line 128
    aput v13, v2, v25

    .line 129
    .line 130
    aput v5, v2, v11

    .line 131
    .line 132
    aput v8, v2, v10

    .line 133
    .line 134
    aput v1, v2, v7

    .line 135
    .line 136
    aput v22, v2, v6

    .line 137
    .line 138
    const/16 v4, 0xd

    .line 139
    .line 140
    aput v1, v2, v4

    .line 141
    .line 142
    const/16 v4, 0xe

    .line 143
    .line 144
    aput v14, v2, v4

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :goto_1
    iget-object v6, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 148
    .line 149
    const/4 v11, 0x1

    .line 150
    const/4 v13, 0x0

    .line 151
    const/4 v8, 0x0

    .line 152
    const/4 v10, 0x0

    .line 153
    invoke-static/range {v6 .. v13}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 154
    .line 155
    .line 156
    aget v2, v12, v1

    .line 157
    .line 158
    if-lez v2, :cond_3

    .line 159
    .line 160
    aget-object v2, v9, v1

    .line 161
    .line 162
    iput-object v2, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 163
    .line 164
    filled-new-array {v14}, [I

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    const/16 v6, 0x3098

    .line 169
    .line 170
    filled-new-array {v6, v3, v14}, [I

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    iget-object v6, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 175
    .line 176
    move-object/from16 v7, p1

    .line 177
    .line 178
    invoke-static {v6, v2, v7, v3, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iput-object v2, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 183
    .line 184
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 185
    .line 186
    if-eq v3, v2, :cond_2

    .line 187
    .line 188
    new-array v3, v5, [I

    .line 189
    .line 190
    iget-object v5, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 191
    .line 192
    const/16 v6, 0x3098

    .line 193
    .line 194
    invoke-static {v5, v2, v6, v3, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 195
    .line 196
    .line 197
    :try_start_0
    iget-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 198
    .line 199
    iget-object v3, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 200
    .line 201
    move-object/from16 v5, p2

    .line 202
    .line 203
    invoke-static {v2, v3, v5, v4, v1}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :catch_0
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 211
    .line 212
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 213
    .line 214
    :goto_2
    iget-object v0, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 215
    .line 216
    if-eqz v0, :cond_1

    .line 217
    .line 218
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 219
    .line 220
    if-eq v1, v0, :cond_1

    .line 221
    .line 222
    return-void

    .line 223
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const-string v1, "eglCreateWindowSurface,failed:"

    .line 232
    .line 233
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    const-string v1, "eglCreateContext,failed:"

    .line 246
    .line 247
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_3
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const-string v1, "eglChooseConfig,failed:"

    .line 260
    .line 261
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    const-string v1, "eglInitialize,failed:"

    .line 274
    .line 275
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    return-void

    .line 279
    :cond_5
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    const-string v1, "eglGetDisplay,failed:"

    .line 288
    .line 289
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    return-void
.end method

.method public e(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
    .locals 25
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iput-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    if-eq v3, v2, :cond_5

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v4, v3, [I

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    invoke-static {v2, v4, v1, v4, v5}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    new-array v12, v5, [I

    .line 25
    .line 26
    new-array v9, v5, [Landroid/opengl/EGLConfig;

    .line 27
    .line 28
    iget-boolean v2, v0, Ll/uje;->g:Z

    .line 29
    .line 30
    const/16 v4, 0xd

    .line 31
    .line 32
    const/16 v6, 0x3026

    .line 33
    .line 34
    const/16 v7, 0xc

    .line 35
    .line 36
    const/16 v8, 0xb

    .line 37
    .line 38
    const/16 v10, 0x3025

    .line 39
    .line 40
    const/16 v11, 0xa

    .line 41
    .line 42
    const/16 v13, 0x9

    .line 43
    .line 44
    const/16 v15, 0x3022

    .line 45
    .line 46
    const/16 v16, 0x6

    .line 47
    .line 48
    const/16 v17, 0x5

    .line 49
    .line 50
    const/16 v18, 0x3023

    .line 51
    .line 52
    const/16 v19, 0x3

    .line 53
    .line 54
    const/16 v20, 0x3024

    .line 55
    .line 56
    const/16 v21, 0x3040

    .line 57
    .line 58
    const/16 v22, 0x7

    .line 59
    .line 60
    const/16 v14, 0x3038

    .line 61
    .line 62
    const/16 v23, 0x4

    .line 63
    .line 64
    const/16 v24, 0x8

    .line 65
    .line 66
    if-eqz v2, :cond_0

    .line 67
    .line 68
    const/16 v2, 0xf

    .line 69
    .line 70
    new-array v2, v2, [I

    .line 71
    .line 72
    aput v21, v2, v1

    .line 73
    .line 74
    aput v23, v2, v5

    .line 75
    .line 76
    aput v20, v2, v3

    .line 77
    .line 78
    aput v24, v2, v19

    .line 79
    .line 80
    aput v18, v2, v23

    .line 81
    .line 82
    aput v24, v2, v17

    .line 83
    .line 84
    aput v15, v2, v16

    .line 85
    .line 86
    aput v24, v2, v22

    .line 87
    .line 88
    const/16 v15, 0x3021

    .line 89
    .line 90
    aput v15, v2, v24

    .line 91
    .line 92
    aput v24, v2, v13

    .line 93
    .line 94
    aput v10, v2, v11

    .line 95
    .line 96
    const/16 v10, 0x10

    .line 97
    .line 98
    aput v10, v2, v8

    .line 99
    .line 100
    aput v6, v2, v7

    .line 101
    .line 102
    aput v1, v2, v4

    .line 103
    .line 104
    const/16 v4, 0xe

    .line 105
    .line 106
    aput v14, v2, v4

    .line 107
    .line 108
    :goto_0
    move-object v7, v2

    .line 109
    goto :goto_1

    .line 110
    :cond_0
    new-array v2, v4, [I

    .line 111
    .line 112
    aput v21, v2, v1

    .line 113
    .line 114
    aput v23, v2, v5

    .line 115
    .line 116
    aput v20, v2, v3

    .line 117
    .line 118
    aput v24, v2, v19

    .line 119
    .line 120
    aput v18, v2, v23

    .line 121
    .line 122
    aput v24, v2, v17

    .line 123
    .line 124
    aput v15, v2, v16

    .line 125
    .line 126
    aput v24, v2, v22

    .line 127
    .line 128
    aput v10, v2, v24

    .line 129
    .line 130
    aput v1, v2, v13

    .line 131
    .line 132
    aput v6, v2, v11

    .line 133
    .line 134
    aput v1, v2, v8

    .line 135
    .line 136
    aput v14, v2, v7

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :goto_1
    iget-object v6, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 140
    .line 141
    const/4 v11, 0x1

    .line 142
    const/4 v13, 0x0

    .line 143
    const/4 v8, 0x0

    .line 144
    const/4 v10, 0x0

    .line 145
    invoke-static/range {v6 .. v13}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 146
    .line 147
    .line 148
    aget v2, v12, v1

    .line 149
    .line 150
    if-lez v2, :cond_3

    .line 151
    .line 152
    aget-object v2, v9, v1

    .line 153
    .line 154
    iput-object v2, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 155
    .line 156
    filled-new-array {v14}, [I

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    const/16 v6, 0x3098

    .line 161
    .line 162
    filled-new-array {v6, v3, v14}, [I

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iget-object v7, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 167
    .line 168
    move-object/from16 v8, p1

    .line 169
    .line 170
    invoke-static {v7, v2, v8, v3, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iput-object v2, v0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 175
    .line 176
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 177
    .line 178
    if-eq v3, v2, :cond_2

    .line 179
    .line 180
    new-array v3, v5, [I

    .line 181
    .line 182
    iget-object v5, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 183
    .line 184
    invoke-static {v5, v2, v6, v3, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 185
    .line 186
    .line 187
    :try_start_0
    iget-object v2, v0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 188
    .line 189
    iget-object v3, v0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 190
    .line 191
    move-object/from16 v5, p2

    .line 192
    .line 193
    invoke-static {v2, v3, v5, v4, v1}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :catch_0
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 201
    .line 202
    iput-object v1, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 203
    .line 204
    :goto_2
    iget-object v0, v0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 205
    .line 206
    if-eqz v0, :cond_1

    .line 207
    .line 208
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 209
    .line 210
    if-eq v1, v0, :cond_1

    .line 211
    .line 212
    return-void

    .line 213
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const-string v1, "eglCreateWindowSurface,failed:"

    .line 222
    .line 223
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    const-string v1, "eglCreateContext,failed:"

    .line 236
    .line 237
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_3
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    const-string v1, "eglChooseConfig,failed:"

    .line 250
    .line 251
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    const-string v1, "eglInitialize,failed:"

    .line 264
    .line 265
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_5
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v1, "eglGetDisplay,failed:"

    .line 278
    .line 279
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method public declared-synchronized f()Z
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 10
    .line 11
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 12
    .line 13
    if-eq v1, v3, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 16
    .line 17
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 18
    .line 19
    if-eq v3, v4, :cond_1

    .line 20
    .line 21
    invoke-static {v0, v1, v1, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 28
    .line 29
    iput-object v0, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return v2

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    monitor-exit p0

    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    monitor-exit p0

    .line 39
    return v2

    .line 40
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw v0
.end method

.method public declared-synchronized g()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    iget-object v1, p0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    if-eq v1, v2, :cond_2

    .line 13
    .line 14
    iget-object v2, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 15
    .line 16
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 17
    .line 18
    if-eq v2, v3, :cond_1

    .line 19
    .line 20
    invoke-static {v0, v2, v2, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string v0, "mediaRender"

    .line 27
    .line 28
    const-string v1, "EGL14Warpper eglReleased fail"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 37
    .line 38
    iget-object v1, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 39
    .line 40
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 44
    .line 45
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 46
    .line 47
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 48
    .line 49
    invoke-static {v0, v1, v1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 53
    .line 54
    iget-object v1, p0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 55
    .line 56
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 62
    .line 63
    .line 64
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 65
    .line 66
    iput-object v0, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 67
    .line 68
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 69
    .line 70
    iput-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 71
    .line 72
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 73
    .line 74
    iput-object v0, p0, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    iput-object v0, p0, Ll/uje;->d:Landroid/opengl/EGLConfig;

    .line 78
    .line 79
    const-string v0, "mediaRender"

    .line 80
    .line 81
    const-string v1, "EGL14Wrapper eglReleased"

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    .line 85
    .line 86
    :cond_2
    monitor-exit p0

    .line 87
    return-void

    .line 88
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    throw v0
.end method

.method public declared-synchronized i()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/uje;->b:Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/uje;->e:Landroid/opengl/EGLSurface;

    .line 9
    .line 10
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 11
    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method
