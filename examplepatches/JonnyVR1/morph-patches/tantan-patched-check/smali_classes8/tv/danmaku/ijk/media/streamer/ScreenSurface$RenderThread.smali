.class Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/ScreenSurface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderThread"
.end annotation


# instance fields
.field a:J

.field b:J

.field c:J

.field d:I

.field e:I

.field volatile f:Z

.field final synthetic g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->a(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 9
    .line 10
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->a(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 15
    .line 16
    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 18
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 19
    .line 20
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    monitor-enter v1

    .line 25
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 26
    .line 27
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 34
    .line 35
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x3f800000    # 1.0f

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-static {v2, v2, v2, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 45
    .line 46
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->u(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 51
    .line 52
    if-eq v0, v2, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 55
    .line 56
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 61
    .line 62
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 67
    .line 68
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->u(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto/16 :goto_4

    .line 78
    .line 79
    :cond_1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 80
    .line 81
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->y(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 88
    .line 89
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->z(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 93
    .line 94
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->A(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const/4 v2, 0x1

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 102
    .line 103
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->c(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Landroid/view/Surface;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-static {v0, v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->d(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Landroid/view/Surface;)V

    .line 108
    .line 109
    .line 110
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->f:Z

    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 113
    .line 114
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    const/4 v3, 0x0

    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 122
    .line 123
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->f(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V

    .line 124
    .line 125
    .line 126
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->f:Z

    .line 127
    .line 128
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 129
    .line 130
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 135
    .line 136
    .line 137
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 139
    .line 140
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    monitor-enter v0

    .line 145
    :try_start_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 146
    .line 147
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->h(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 148
    .line 149
    .line 150
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 151
    if-nez v1, :cond_5

    .line 152
    .line 153
    :try_start_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 154
    .line 155
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-wide/16 v4, 0x28

    .line 160
    .line 161
    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :catchall_1
    move-exception p0

    .line 166
    goto/16 :goto_3

    .line 167
    .line 168
    :catch_0
    :cond_5
    :goto_1
    :try_start_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 169
    .line 170
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->h(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_6

    .line 175
    .line 176
    monitor-exit v0

    .line 177
    goto/16 :goto_2

    .line 178
    .line 179
    :cond_6
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 180
    .line 181
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->j(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 185
    .line 186
    invoke-static {v1, v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->i(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Z)Z

    .line 187
    .line 188
    .line 189
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->d:I

    .line 190
    .line 191
    add-int/2addr v1, v2

    .line 192
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->d:I

    .line 193
    .line 194
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 195
    .line 196
    .line 197
    move-result-wide v1

    .line 198
    const-wide/16 v4, 0x3e8

    .line 199
    .line 200
    div-long/2addr v1, v4

    .line 201
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->a:J

    .line 202
    .line 203
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->d:I

    .line 204
    .line 205
    const/4 v5, 0x3

    .line 206
    const-wide/16 v6, 0x1

    .line 207
    .line 208
    if-le v4, v5, :cond_7

    .line 209
    .line 210
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->e:I

    .line 211
    .line 212
    int-to-long v8, v5

    .line 213
    iget-wide v10, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->b:J

    .line 214
    .line 215
    sub-long/2addr v1, v10

    .line 216
    add-long/2addr v8, v1

    .line 217
    long-to-int v1, v8

    .line 218
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->e:I

    .line 219
    .line 220
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->c:J

    .line 221
    .line 222
    add-long/2addr v1, v6

    .line 223
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->c:J

    .line 224
    .line 225
    :cond_7
    const/16 v1, 0x14

    .line 226
    .line 227
    if-le v4, v1, :cond_a

    .line 228
    .line 229
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->e:I

    .line 230
    .line 231
    int-to-long v1, v1

    .line 232
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->c:J

    .line 233
    .line 234
    div-long/2addr v1, v4

    .line 235
    const-wide/16 v4, 0x0

    .line 236
    .line 237
    cmp-long v8, v1, v4

    .line 238
    .line 239
    if-lez v8, :cond_8

    .line 240
    .line 241
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 242
    .line 243
    const-wide/32 v9, 0xf4240

    .line 244
    .line 245
    .line 246
    div-long/2addr v9, v1

    .line 247
    add-long/2addr v9, v6

    .line 248
    long-to-int v1, v9

    .line 249
    iput v1, v8, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->a:I

    .line 250
    .line 251
    :cond_8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 252
    .line 253
    iget v2, v1, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->a:I

    .line 254
    .line 255
    if-lez v2, :cond_9

    .line 256
    .line 257
    const/16 v6, 0x3e8

    .line 258
    .line 259
    div-int/2addr v6, v2

    .line 260
    iput v6, v1, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b:I

    .line 261
    .line 262
    :cond_9
    const-string v1, "ScreenSurface"

    .line 263
    .line 264
    new-instance v2, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    const-string v6, "Actual mRenderTime: "

    .line 270
    .line 271
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 275
    .line 276
    iget v6, v6, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b:I

    .line 277
    .line 278
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->c:J

    .line 289
    .line 290
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->b:J

    .line 291
    .line 292
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->a:J

    .line 293
    .line 294
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->e:I

    .line 295
    .line 296
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->d:I

    .line 297
    .line 298
    :cond_a
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->a:J

    .line 299
    .line 300
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->b:J

    .line 301
    .line 302
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 303
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 304
    .line 305
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->k(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_0

    .line 310
    .line 311
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 312
    .line 313
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ll/jt2;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    const/4 v1, 0x0

    .line 318
    if-eqz v0, :cond_b

    .line 319
    .line 320
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 321
    .line 322
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ll/jt2;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 330
    .line 331
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ll/jt2;)Ll/jt2;

    .line 332
    .line 333
    .line 334
    :cond_b
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 335
    .line 336
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    if-eqz v0, :cond_c

    .line 341
    .line 342
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 343
    .line 344
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->x()V

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 352
    .line 353
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ltv/danmaku/ijk/media/streamer/ScreenRender;)Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 354
    .line 355
    .line 356
    :cond_c
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 357
    .line 358
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    if-eqz v0, :cond_e

    .line 363
    .line 364
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 365
    .line 366
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 371
    .line 372
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 377
    .line 378
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->u(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 379
    .line 380
    .line 381
    move-result-object v3

    .line 382
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 383
    .line 384
    .line 385
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 386
    .line 387
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 392
    .line 393
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 398
    .line 399
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 407
    .line 408
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 417
    .line 418
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_d

    .line 427
    .line 428
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 429
    .line 430
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 435
    .line 436
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 441
    .line 442
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 443
    .line 444
    invoke-interface {v0, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 445
    .line 446
    .line 447
    :cond_d
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 448
    .line 449
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 454
    .line 455
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 460
    .line 461
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 462
    .line 463
    .line 464
    move-result-object v3

    .line 465
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 466
    .line 467
    .line 468
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 469
    .line 470
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 475
    .line 476
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 477
    .line 478
    .line 479
    move-result-object v2

    .line 480
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 484
    .line 485
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->x(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 486
    .line 487
    .line 488
    :cond_e
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 489
    .line 490
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->s(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 494
    .line 495
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    monitor-enter v0

    .line 500
    :try_start_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;->g:Ltv/danmaku/ijk/media/streamer/ScreenSurface;

    .line 501
    .line 502
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->b(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object p0

    .line 506
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 507
    .line 508
    .line 509
    monitor-exit v0

    .line 510
    return-void

    .line 511
    :catchall_2
    move-exception p0

    .line 512
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 513
    throw p0

    .line 514
    :goto_3
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 515
    throw p0

    .line 516
    :goto_4
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 517
    throw p0

    .line 518
    :catchall_3
    move-exception p0

    .line 519
    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 520
    throw p0
.end method
