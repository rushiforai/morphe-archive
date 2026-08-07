.class public Ll/iyk;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a()Lorg/json/JSONObject;
    .locals 15

    .line 1
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    new-instance v3, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    :try_start_0
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    move-object v6, v5

    .line 18
    check-cast v6, Ljavax/microedition/khronos/egl/EGL10;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_f

    .line 19
    .line 20
    :try_start_1
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-interface {v6, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 23
    .line 24
    .line 25
    move-result-object v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_e

    .line 26
    const/4 v5, 0x2

    .line 27
    :try_start_2
    new-array v8, v5, [I

    .line 28
    .line 29
    invoke-interface {v6, v7, v8}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    if-nez v8, :cond_2

    .line 34
    .line 35
    invoke-static {v3, v0, v0, v0}, Ll/iyk;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 39
    if-eqz v7, :cond_0

    .line 40
    .line 41
    :try_start_3
    invoke-interface {v6, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 42
    .line 43
    .line 44
    :catchall_0
    :cond_0
    if-eqz v7, :cond_1

    .line 45
    .line 46
    :try_start_4
    invoke-interface {v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 47
    .line 48
    .line 49
    :catchall_1
    :cond_1
    return-object v0

    .line 50
    :catchall_2
    move-object v5, v4

    .line 51
    move-object v4, v6

    .line 52
    move-object v6, v5

    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_2
    const/16 v8, 0x9

    .line 56
    .line 57
    :try_start_5
    new-array v8, v8, [I

    .line 58
    .line 59
    fill-array-data v8, :array_0

    .line 60
    .line 61
    .line 62
    const/4 v12, 0x1

    .line 63
    new-array v9, v12, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 64
    .line 65
    new-array v11, v12, [I

    .line 66
    .line 67
    const/4 v10, 0x1

    .line 68
    invoke-interface/range {v6 .. v11}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-eqz v8, :cond_d

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    aget v10, v11, v8

    .line 76
    .line 77
    if-nez v10, :cond_3

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_3
    const/16 v10, 0x3098

    .line 82
    .line 83
    const/16 v11, 0x3038

    .line 84
    .line 85
    filled-new-array {v10, v5, v11}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    aget-object v10, v9, v8

    .line 90
    .line 91
    invoke-interface {v6, v7, v10, v1, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 92
    .line 93
    .line 94
    move-result-object v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 95
    const/16 v10, 0x3057

    .line 96
    .line 97
    const/16 v13, 0x3056

    .line 98
    .line 99
    :try_start_6
    filled-new-array {v10, v12, v13, v12, v11}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    aget-object v8, v9, v8

    .line 104
    .line 105
    invoke-interface {v6, v7, v8, v10}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-interface {v6, v7, v4, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-nez v8, :cond_8

    .line 114
    .line 115
    invoke-static {v3, v0, v0, v0}, Ll/iyk;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 119
    if-eqz v7, :cond_4

    .line 120
    .line 121
    :try_start_7
    invoke-interface {v6, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 122
    .line 123
    .line 124
    :catchall_3
    :cond_4
    if-eqz v7, :cond_5

    .line 125
    .line 126
    if-eqz v4, :cond_5

    .line 127
    .line 128
    :try_start_8
    invoke-interface {v6, v7, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 129
    .line 130
    .line 131
    :catchall_4
    :cond_5
    if-eqz v7, :cond_6

    .line 132
    .line 133
    if-eqz v5, :cond_6

    .line 134
    .line 135
    :try_start_9
    invoke-interface {v6, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 136
    .line 137
    .line 138
    :catchall_5
    :cond_6
    if-eqz v7, :cond_7

    .line 139
    .line 140
    :try_start_a
    invoke-interface {v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 141
    .line 142
    .line 143
    :catchall_6
    :cond_7
    return-object v0

    .line 144
    :catchall_7
    move-object v14, v5

    .line 145
    move-object v5, v4

    .line 146
    move-object v4, v6

    .line 147
    move-object v6, v14

    .line 148
    goto :goto_1

    .line 149
    :cond_8
    const/16 v8, 0x1f00

    .line 150
    .line 151
    :try_start_b
    invoke-static {v8}, Ll/iyk;->c(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    const/16 v9, 0x1f01

    .line 156
    .line 157
    invoke-static {v9}, Ll/iyk;->c(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v9

    .line 161
    const/16 v10, 0x1f02

    .line 162
    .line 163
    invoke-static {v10}, Ll/iyk;->c(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v10

    .line 167
    invoke-static {v3, v8, v9, v10}, Ll/iyk;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 168
    .line 169
    .line 170
    move-result-object v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 171
    if-eqz v7, :cond_9

    .line 172
    .line 173
    :try_start_c
    invoke-interface {v6, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    .line 174
    .line 175
    .line 176
    :catchall_8
    :cond_9
    if-eqz v7, :cond_a

    .line 177
    .line 178
    if-eqz v4, :cond_a

    .line 179
    .line 180
    :try_start_d
    invoke-interface {v6, v7, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_9

    .line 181
    .line 182
    .line 183
    :catchall_9
    :cond_a
    if-eqz v7, :cond_b

    .line 184
    .line 185
    if-eqz v5, :cond_b

    .line 186
    .line 187
    :try_start_e
    invoke-interface {v6, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_a

    .line 188
    .line 189
    .line 190
    :catchall_a
    :cond_b
    if-eqz v7, :cond_c

    .line 191
    .line 192
    :try_start_f
    invoke-interface {v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_b

    .line 193
    .line 194
    .line 195
    :catchall_b
    :cond_c
    return-object v0

    .line 196
    :cond_d
    :goto_0
    :try_start_10
    invoke-static {v3, v0, v0, v0}, Ll/iyk;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    move-result-object v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 200
    if-eqz v7, :cond_e

    .line 201
    .line 202
    :try_start_11
    invoke-interface {v6, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_c

    .line 203
    .line 204
    .line 205
    :catchall_c
    :cond_e
    if-eqz v7, :cond_f

    .line 206
    .line 207
    :try_start_12
    invoke-interface {v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_d

    .line 208
    .line 209
    .line 210
    :catchall_d
    :cond_f
    return-object v0

    .line 211
    :catchall_e
    move-object v5, v4

    .line 212
    move-object v7, v5

    .line 213
    move-object v4, v6

    .line 214
    move-object v6, v7

    .line 215
    goto :goto_1

    .line 216
    :catchall_f
    move-object v5, v4

    .line 217
    move-object v6, v5

    .line 218
    move-object v7, v6

    .line 219
    :goto_1
    :try_start_13
    invoke-static {v3, v0, v0, v0}, Ll/iyk;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 220
    .line 221
    .line 222
    move-result-object v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_14

    .line 223
    if-eqz v4, :cond_10

    .line 224
    .line 225
    if-eqz v7, :cond_10

    .line 226
    .line 227
    :try_start_14
    invoke-interface {v4, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_10

    .line 228
    .line 229
    .line 230
    :catchall_10
    :cond_10
    if-eqz v4, :cond_11

    .line 231
    .line 232
    if-eqz v7, :cond_11

    .line 233
    .line 234
    if-eqz v5, :cond_11

    .line 235
    .line 236
    :try_start_15
    invoke-interface {v4, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_11

    .line 237
    .line 238
    .line 239
    :catchall_11
    :cond_11
    if-eqz v4, :cond_12

    .line 240
    .line 241
    if-eqz v7, :cond_12

    .line 242
    .line 243
    if-eqz v6, :cond_12

    .line 244
    .line 245
    :try_start_16
    invoke-interface {v4, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_12

    .line 246
    .line 247
    .line 248
    :catchall_12
    :cond_12
    if-eqz v4, :cond_13

    .line 249
    .line 250
    if-eqz v7, :cond_13

    .line 251
    .line 252
    :try_start_17
    invoke-interface {v4, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_13

    .line 253
    .line 254
    .line 255
    :catchall_13
    :cond_13
    return-object v0

    .line 256
    :catchall_14
    move-exception v0

    .line 257
    if-eqz v4, :cond_14

    .line 258
    .line 259
    if-eqz v7, :cond_14

    .line 260
    .line 261
    :try_start_18
    invoke-interface {v4, v7, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_15

    .line 262
    .line 263
    .line 264
    :catchall_15
    :cond_14
    if-eqz v4, :cond_15

    .line 265
    .line 266
    if-eqz v7, :cond_15

    .line 267
    .line 268
    if-eqz v5, :cond_15

    .line 269
    .line 270
    :try_start_19
    invoke-interface {v4, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_16

    .line 271
    .line 272
    .line 273
    :catchall_16
    :cond_15
    if-eqz v4, :cond_16

    .line 274
    .line 275
    if-eqz v7, :cond_16

    .line 276
    .line 277
    if-eqz v6, :cond_16

    .line 278
    .line 279
    :try_start_1a
    invoke-interface {v4, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_17

    .line 280
    .line 281
    .line 282
    :catchall_17
    :cond_16
    if-eqz v4, :cond_17

    .line 283
    .line 284
    if-eqz v7, :cond_17

    .line 285
    .line 286
    :try_start_1b
    invoke-interface {v4, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_18

    .line 287
    .line 288
    .line 289
    :catchall_18
    :cond_17
    throw v0

    .line 290
    nop

    .line 291
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method private static b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    :try_start_0
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    const-string v1, ""

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    move-object p1, v1

    .line 17
    :cond_0
    :try_start_1
    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const/16 p1, 0xb

    .line 21
    .line 22
    new-array p1, p1, [B

    .line 23
    .line 24
    fill-array-data p1, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-nez p2, :cond_1

    .line 32
    .line 33
    move-object p2, v1

    .line 34
    :cond_1
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const/16 p1, 0xa

    .line 38
    .line 39
    new-array p1, p1, [B

    .line 40
    .line 41
    fill-array-data p1, :array_2

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-nez p3, :cond_2

    .line 49
    .line 50
    move-object p3, v1

    .line 51
    :cond_2
    invoke-virtual {p0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    :catchall_0
    return-object p0

    .line 55
    :array_0
    .array-data 1
        0x57t
        0xat
        0x6et
        0x41t
        0x4t
        0x8t
        0x54t
        0x9t
        0x43t
    .end array-data

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    nop

    .line 65
    :array_1
    .array-data 1
        0x57t
        0xat
        0x6et
        0x45t
        0x4t
        0x8t
        0x54t
        0x3t
        0x43t
        0x52t
        0x13t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_2
    .array-data 1
        0x57t
        0xat
        0x6et
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data
.end method

.method private static c(I)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    return-object p0

    .line 11
    :catchall_0
    return-object v0
.end method
