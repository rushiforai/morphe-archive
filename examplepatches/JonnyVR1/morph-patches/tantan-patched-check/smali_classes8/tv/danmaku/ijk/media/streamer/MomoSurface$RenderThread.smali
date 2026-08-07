.class Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/MomoSurface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderThread"
.end annotation


# instance fields
.field final a:I

.field b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field c:J

.field d:J

.field e:J

.field f:I

.field g:I

.field volatile h:Z

.field final synthetic i:Ltv/danmaku/ijk/media/streamer/MomoSurface;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x28

    .line 7
    .line 8
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->a:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->e:J

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->f:I

    .line 16
    .line 17
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->g:I

    .line 18
    .line 19
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->h:Z

    .line 20
    .line 21
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 9
    .line 10
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 19
    .line 20
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    monitor-enter v1

    .line 25
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 26
    .line 27
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 34
    .line 35
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 45
    .line 46
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 55
    .line 56
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 61
    .line 62
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 67
    .line 68
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 80
    .line 81
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 88
    .line 89
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->T(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 93
    .line 94
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 102
    .line 103
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/view/Surface;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-static {v0, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e(Ltv/danmaku/ijk/media/streamer/MomoSurface;Landroid/view/Surface;)V

    .line 108
    .line 109
    .line 110
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->h:Z

    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 113
    .line 114
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_4

    .line 119
    .line 120
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 121
    .line 122
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/view/Surface;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {v0, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h(Ltv/danmaku/ijk/media/streamer/MomoSurface;Landroid/view/Surface;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 130
    .line 131
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    const/4 v3, 0x0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 139
    .line 140
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 141
    .line 142
    .line 143
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->h:Z

    .line 144
    .line 145
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 146
    .line 147
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_6

    .line 152
    .line 153
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 154
    .line 155
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 156
    .line 157
    .line 158
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 159
    .line 160
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 165
    .line 166
    .line 167
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 168
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 169
    .line 170
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    monitor-enter v0

    .line 175
    :try_start_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 176
    .line 177
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 178
    .line 179
    .line 180
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 181
    if-nez v1, :cond_7

    .line 182
    .line 183
    :try_start_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 184
    .line 185
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    const-wide/16 v4, 0x28

    .line 190
    .line 191
    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 192
    .line 193
    .line 194
    goto :goto_1

    .line 195
    :catchall_1
    move-exception p0

    .line 196
    goto/16 :goto_3

    .line 197
    .line 198
    :catch_0
    :cond_7
    :goto_1
    :try_start_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 199
    .line 200
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_8

    .line 205
    .line 206
    monitor-exit v0

    .line 207
    goto/16 :goto_2

    .line 208
    .line 209
    :cond_8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 210
    .line 211
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    if-eqz v1, :cond_9

    .line 216
    .line 217
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 218
    .line 219
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    if-eqz v1, :cond_9

    .line 224
    .line 225
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 226
    .line 227
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 232
    .line 233
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 238
    .line 239
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 240
    .line 241
    .line 242
    move-result-object v5

    .line 243
    invoke-virtual {v1, v4, v5}, Ltv/danmaku/ijk/media/streamer/TextureRender;->P(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 244
    .line 245
    .line 246
    :cond_9
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 247
    .line 248
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/Bitmap;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    if-eqz v1, :cond_a

    .line 253
    .line 254
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 255
    .line 256
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/Bitmap;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    if-nez v1, :cond_a

    .line 265
    .line 266
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 267
    .line 268
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 273
    .line 274
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/Bitmap;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    invoke-virtual {v1, v4}, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q(Landroid/graphics/Bitmap;)V

    .line 279
    .line 280
    .line 281
    :cond_a
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 282
    .line 283
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/SurfaceTexture;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    if-eqz v1, :cond_b

    .line 288
    .line 289
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 290
    .line 291
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    const/4 v4, -0x1

    .line 296
    if-eq v1, v4, :cond_b

    .line 297
    .line 298
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 299
    .line 300
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 305
    .line 306
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/SurfaceTexture;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 311
    .line 312
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I

    .line 313
    .line 314
    .line 315
    move-result v5

    .line 316
    invoke-virtual {v1, v4, v5}, Ltv/danmaku/ijk/media/streamer/TextureRender;->R(Landroid/graphics/SurfaceTexture;I)V

    .line 317
    .line 318
    .line 319
    :cond_b
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 320
    .line 321
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    if-eq v1, v2, :cond_c

    .line 326
    .line 327
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 328
    .line 329
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    const/4 v4, 0x2

    .line 334
    if-ne v1, v4, :cond_d

    .line 335
    .line 336
    :cond_c
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 337
    .line 338
    invoke-static {v1, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->A(Ltv/danmaku/ijk/media/streamer/MomoSurface;Z)Z

    .line 339
    .line 340
    .line 341
    :cond_d
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 342
    .line 343
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->C(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 344
    .line 345
    .line 346
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 347
    .line 348
    invoke-static {v1, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p(Ltv/danmaku/ijk/media/streamer/MomoSurface;Z)Z

    .line 349
    .line 350
    .line 351
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->f:I

    .line 352
    .line 353
    add-int/2addr v1, v2

    .line 354
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->f:I

    .line 355
    .line 356
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 357
    .line 358
    .line 359
    move-result-wide v1

    .line 360
    const-wide/16 v4, 0x3e8

    .line 361
    .line 362
    div-long/2addr v1, v4

    .line 363
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->c:J

    .line 364
    .line 365
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->f:I

    .line 366
    .line 367
    const/4 v5, 0x3

    .line 368
    const-wide/16 v6, 0x1

    .line 369
    .line 370
    if-le v4, v5, :cond_e

    .line 371
    .line 372
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->g:I

    .line 373
    .line 374
    int-to-long v8, v5

    .line 375
    iget-wide v10, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->d:J

    .line 376
    .line 377
    sub-long/2addr v1, v10

    .line 378
    add-long/2addr v8, v1

    .line 379
    long-to-int v1, v8

    .line 380
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->g:I

    .line 381
    .line 382
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->e:J

    .line 383
    .line 384
    add-long/2addr v1, v6

    .line 385
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->e:J

    .line 386
    .line 387
    :cond_e
    const/16 v1, 0x14

    .line 388
    .line 389
    if-le v4, v1, :cond_11

    .line 390
    .line 391
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->g:I

    .line 392
    .line 393
    int-to-long v1, v1

    .line 394
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->e:J

    .line 395
    .line 396
    div-long/2addr v1, v4

    .line 397
    const-wide/16 v4, 0x0

    .line 398
    .line 399
    cmp-long v8, v1, v4

    .line 400
    .line 401
    if-lez v8, :cond_f

    .line 402
    .line 403
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 404
    .line 405
    const-wide/32 v9, 0xf4240

    .line 406
    .line 407
    .line 408
    div-long/2addr v9, v1

    .line 409
    add-long/2addr v9, v6

    .line 410
    long-to-int v1, v9

    .line 411
    iput v1, v8, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 412
    .line 413
    :cond_f
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 414
    .line 415
    iget v2, v1, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 416
    .line 417
    if-lez v2, :cond_10

    .line 418
    .line 419
    const/16 v6, 0x3e8

    .line 420
    .line 421
    div-int/2addr v6, v2

    .line 422
    iput v6, v1, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c:I

    .line 423
    .line 424
    :cond_10
    const-string v1, "MomoSurface"

    .line 425
    .line 426
    new-instance v2, Ljava/lang/StringBuilder;

    .line 427
    .line 428
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 429
    .line 430
    .line 431
    const-string v6, "Actual mRenderTime: "

    .line 432
    .line 433
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 437
    .line 438
    iget v6, v6, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c:I

    .line 439
    .line 440
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    const-string v6, ";RenderFRate:"

    .line 444
    .line 445
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 449
    .line 450
    iget v6, v6, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 451
    .line 452
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    .line 461
    .line 462
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->e:J

    .line 463
    .line 464
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->d:J

    .line 465
    .line 466
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->c:J

    .line 467
    .line 468
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->g:I

    .line 469
    .line 470
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->f:I

    .line 471
    .line 472
    :cond_11
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->c:J

    .line 473
    .line 474
    iput-wide v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->d:J

    .line 475
    .line 476
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 477
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 478
    .line 479
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-eqz v0, :cond_0

    .line 484
    .line 485
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 486
    .line 487
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ll/jt2;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    const/4 v1, 0x0

    .line 492
    if-eqz v0, :cond_12

    .line 493
    .line 494
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 495
    .line 496
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ll/jt2;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 501
    .line 502
    .line 503
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 504
    .line 505
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ll/jt2;)Ll/jt2;

    .line 506
    .line 507
    .line 508
    :cond_12
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 509
    .line 510
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 511
    .line 512
    .line 513
    move-result-object v0

    .line 514
    if-eqz v0, :cond_13

    .line 515
    .line 516
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 517
    .line 518
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->y()V

    .line 523
    .line 524
    .line 525
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 526
    .line 527
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ltv/danmaku/ijk/media/streamer/TextureRender;)Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 528
    .line 529
    .line 530
    :cond_13
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 531
    .line 532
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    if-eqz v0, :cond_14

    .line 537
    .line 538
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 539
    .line 540
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 541
    .line 542
    .line 543
    move-result-object v0

    .line 544
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 545
    .line 546
    .line 547
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 548
    .line 549
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 550
    .line 551
    .line 552
    :cond_14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 553
    .line 554
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    if-eqz v0, :cond_15

    .line 559
    .line 560
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 561
    .line 562
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 567
    .line 568
    .line 569
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 570
    .line 571
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 572
    .line 573
    .line 574
    :cond_15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 575
    .line 576
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    if-eqz v0, :cond_16

    .line 581
    .line 582
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 583
    .line 584
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 589
    .line 590
    .line 591
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 592
    .line 593
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 594
    .line 595
    .line 596
    :cond_16
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 597
    .line 598
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    if-eqz v0, :cond_17

    .line 603
    .line 604
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 605
    .line 606
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 611
    .line 612
    .line 613
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 614
    .line 615
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 616
    .line 617
    .line 618
    :cond_17
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 619
    .line 620
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 621
    .line 622
    .line 623
    move-result-object v0

    .line 624
    if-eqz v0, :cond_19

    .line 625
    .line 626
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 627
    .line 628
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 629
    .line 630
    .line 631
    move-result-object v0

    .line 632
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 633
    .line 634
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 635
    .line 636
    .line 637
    move-result-object v2

    .line 638
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 639
    .line 640
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 641
    .line 642
    .line 643
    move-result-object v3

    .line 644
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 645
    .line 646
    .line 647
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 648
    .line 649
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 654
    .line 655
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 660
    .line 661
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 662
    .line 663
    .line 664
    move-result-object v3

    .line 665
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 666
    .line 667
    .line 668
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 669
    .line 670
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 679
    .line 680
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 681
    .line 682
    .line 683
    move-result-object v2

    .line 684
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-result v0

    .line 688
    if-eqz v0, :cond_18

    .line 689
    .line 690
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 691
    .line 692
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 693
    .line 694
    .line 695
    move-result-object v0

    .line 696
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 697
    .line 698
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 699
    .line 700
    .line 701
    move-result-object v2

    .line 702
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 703
    .line 704
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 705
    .line 706
    invoke-interface {v0, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 707
    .line 708
    .line 709
    :cond_18
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 710
    .line 711
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 712
    .line 713
    .line 714
    move-result-object v0

    .line 715
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 716
    .line 717
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 718
    .line 719
    .line 720
    move-result-object v2

    .line 721
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 722
    .line 723
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 724
    .line 725
    .line 726
    move-result-object v3

    .line 727
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 728
    .line 729
    .line 730
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 731
    .line 732
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 733
    .line 734
    .line 735
    move-result-object v0

    .line 736
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 737
    .line 738
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 739
    .line 740
    .line 741
    move-result-object v2

    .line 742
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 743
    .line 744
    .line 745
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 746
    .line 747
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->R(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 748
    .line 749
    .line 750
    :cond_19
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 751
    .line 752
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/lang/Object;)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 756
    .line 757
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 758
    .line 759
    .line 760
    move-result-object v0

    .line 761
    monitor-enter v0

    .line 762
    :try_start_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;->i:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 763
    .line 764
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;

    .line 765
    .line 766
    .line 767
    move-result-object p0

    .line 768
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 769
    .line 770
    .line 771
    monitor-exit v0

    .line 772
    return-void

    .line 773
    :catchall_2
    move-exception p0

    .line 774
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 775
    throw p0

    .line 776
    :goto_3
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 777
    throw p0

    .line 778
    :goto_4
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 779
    throw p0

    .line 780
    :catchall_3
    move-exception p0

    .line 781
    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 782
    throw p0
.end method
