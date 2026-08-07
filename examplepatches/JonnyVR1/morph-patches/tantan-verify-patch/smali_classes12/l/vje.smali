.class public Ll/vje;
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
    const-string v0, "EGL14Wrapper"

    .line 5
    .line 6
    iput-object v0, p0, Ll/vje;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    iput v0, p0, Ll/vje;->f:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/vje;->g:Z

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "EGL14Wrapper"

    iput-object v0, p0, Ll/vje;->a:Ljava/lang/String;

    const/4 v0, 0x3

    .line 17
    iput v0, p0, Ll/vje;->f:I

    .line 18
    iput-boolean p1, p0, Ll/vje;->g:Z

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
    iput-object v2, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    if-eq v3, v2, :cond_5

    .line 13
    .line 14
    const-string v2, "eglGetDisplay"

    .line 15
    .line 16
    const-string v3, "EGL14Wrapper"

    .line 17
    .line 18
    invoke-static {v3, v2}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    new-array v4, v2, [I

    .line 23
    .line 24
    iget-object v5, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    const-string v4, "eglInitialize"

    .line 34
    .line 35
    invoke-static {v3, v4}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-array v13, v6, [I

    .line 39
    .line 40
    new-array v10, v6, [Landroid/opengl/EGLConfig;

    .line 41
    .line 42
    iget-boolean v4, v0, Ll/vje;->g:Z

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
    iget-object v7, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    const-string v4, "eglChooseConfig"

    .line 167
    .line 168
    invoke-static {v3, v4}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    aget-object v4, v10, v1

    .line 172
    .line 173
    iput-object v4, v0, Ll/vje;->d:Landroid/opengl/EGLConfig;

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
    iget-object v7, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    iput-object v2, v0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 198
    .line 199
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 200
    .line 201
    if-eq v4, v2, :cond_2

    .line 202
    .line 203
    const-string v2, "eglCreateContext"

    .line 204
    .line 205
    invoke-static {v3, v2}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    new-array v2, v6, [I

    .line 209
    .line 210
    iget-object v4, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 211
    .line 212
    iget-object v6, v0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 213
    .line 214
    const/16 v7, 0x3098

    .line 215
    .line 216
    invoke-static {v4, v6, v7, v2, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 217
    .line 218
    .line 219
    iget-object v2, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 220
    .line 221
    iget-object v4, v0, Ll/vje;->d:Landroid/opengl/EGLConfig;

    .line 222
    .line 223
    invoke-static {v2, v4, v5, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    iput-object v1, v0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 228
    .line 229
    if-eqz v1, :cond_1

    .line 230
    .line 231
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 232
    .line 233
    if-eq v0, v1, :cond_1

    .line 234
    .line 235
    const-string v0, "eglCreatePbufferSurface"

    .line 236
    .line 237
    invoke-static {v3, v0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_1
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
    const-string v1, "eglCreateWindowSurface,failed:"

    .line 250
    .line 251
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_2
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
    const-string v1, "eglCreateContext,failed:"

    .line 264
    .line 265
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_3
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
    const-string v1, "eglChooseConfig,failed:"

    .line 278
    .line 279
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    const-string v1, "eglInitialize,failed:"

    .line 292
    .line 293
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_5
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    const-string v1, "eglGetDisplay,failed:"

    .line 306
    .line 307
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    return-void
.end method

.method public b(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
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
    iput-object v2, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    iget-boolean v2, v0, Ll/vje;->g:Z

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
    iget-object v6, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    iput-object v2, v0, Ll/vje;->d:Landroid/opengl/EGLConfig;

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
    iget-object v7, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

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
    iput-object v2, v0, Ll/vje;->c:Landroid/opengl/EGLContext;

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
    iget-object v5, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 183
    .line 184
    invoke-static {v5, v2, v6, v3, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 185
    .line 186
    .line 187
    iget-object v2, v0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 188
    .line 189
    iget-object v3, v0, Ll/vje;->d:Landroid/opengl/EGLConfig;

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
    iput-object v1, v0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 198
    .line 199
    if-eqz v1, :cond_1

    .line 200
    .line 201
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 202
    .line 203
    if-eq v0, v1, :cond_1

    .line 204
    .line 205
    return-void

    .line 206
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    const-string v1, "eglCreateWindowSurface,failed:"

    .line 215
    .line 216
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const-string v1, "eglCreateContext,failed:"

    .line 229
    .line 230
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_3
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    const-string v1, "eglChooseConfig,failed:"

    .line 243
    .line 244
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_4
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
    const-string v1, "eglInitialize,failed:"

    .line 257
    .line 258
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :cond_5
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
    const-string v1, "eglGetDisplay,failed:"

    .line 271
    .line 272
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public c()I
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/16 p0, 0x3057

    .line 18
    .line 19
    invoke-static {v1, v3, p0, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    aget p0, v0, v2

    .line 23
    .line 24
    return p0
.end method

.method public d()I
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/16 p0, 0x3056

    .line 18
    .line 19
    invoke-static {v1, v3, p0, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    aget p0, v0, v2

    .line 23
    .line 24
    return p0
.end method

.method public e()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {v0, v1, v1, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "eglMakeCurrent,failed:"

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public f()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-static {v0, v1, v1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 17
    .line 18
    iget-object v1, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 24
    .line 25
    iget-object v1, p0, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 31
    .line 32
    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 36
    .line 37
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 38
    .line 39
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 40
    .line 41
    invoke-static {p0, v0, v0, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public g()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vje;->b:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/vje;->e:Landroid/opengl/EGLSurface;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {v0, p0}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "eglSwapBuffers,failed!"

    .line 17
    .line 18
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method
