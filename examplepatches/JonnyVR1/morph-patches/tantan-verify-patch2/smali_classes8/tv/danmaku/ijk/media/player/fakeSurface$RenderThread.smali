.class Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/fakeSurface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderThread"
.end annotation


# instance fields
.field final TIMEOUT_MS:I

.field mOwr:Ltv/danmaku/ijk/media/player/fakeSurface;

.field final synthetic this$0:Ltv/danmaku/ijk/media/player/fakeSurface;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/fakeSurface;Ltv/danmaku/ijk/media/player/fakeSurface;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x28

    .line 7
    .line 8
    iput p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->TIMEOUT_MS:I

    .line 9
    .line 10
    iput-object p2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->mOwr:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$000(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 9
    .line 10
    invoke-static {v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$000(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

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
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 18
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 19
    .line 20
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$100(Ltv/danmaku/ijk/media/player/fakeSurface;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 30
    .line 31
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    monitor-enter v2

    .line 36
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 37
    .line 38
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$300(Ltv/danmaku/ijk/media/player/fakeSurface;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 46
    .line 47
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$400(Ltv/danmaku/ijk/media/player/fakeSurface;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 54
    .line 55
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 60
    .line 61
    if-eq v0, v4, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 64
    .line 65
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 70
    .line 71
    invoke-static {v4}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 76
    .line 77
    invoke-static {v5}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-interface {v0, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    goto/16 :goto_4

    .line 87
    .line 88
    :cond_2
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 89
    .line 90
    invoke-static {v0, v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$302(Ltv/danmaku/ijk/media/player/fakeSurface;Z)Z

    .line 91
    .line 92
    .line 93
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 94
    .line 95
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 100
    .line 101
    .line 102
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 104
    .line 105
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$800(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    monitor-enter v0

    .line 110
    :try_start_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 111
    .line 112
    invoke-static {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$900(Ltv/danmaku/ijk/media/player/fakeSurface;)Z

    .line 113
    .line 114
    .line 115
    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 116
    if-nez v2, :cond_4

    .line 117
    .line 118
    :try_start_3
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 119
    .line 120
    invoke-static {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$800(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    const-wide/16 v4, 0x28

    .line 125
    .line 126
    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :catchall_1
    move-exception p0

    .line 131
    goto/16 :goto_3

    .line 132
    .line 133
    :catch_0
    :cond_4
    :goto_1
    :try_start_4
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 134
    .line 135
    invoke-static {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$900(Ltv/danmaku/ijk/media/player/fakeSurface;)Z

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 139
    .line 140
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$902(Ltv/danmaku/ijk/media/player/fakeSurface;Z)Z

    .line 141
    .line 142
    .line 143
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 144
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 145
    .line 146
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1000(Ltv/danmaku/ijk/media/player/fakeSurface;)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_5

    .line 154
    .line 155
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 156
    .line 157
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$100(Ltv/danmaku/ijk/media/player/fakeSurface;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_0

    .line 162
    .line 163
    :cond_5
    :goto_2
    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 167
    .line 168
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 173
    .line 174
    if-eq v0, v1, :cond_6

    .line 175
    .line 176
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 177
    .line 178
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 183
    .line 184
    invoke-static {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 189
    .line 190
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 195
    .line 196
    .line 197
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 198
    .line 199
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1100(Ltv/danmaku/ijk/media/player/fakeSurface;)Ltv/danmaku/ijk/media/player/TextureRender;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const/4 v2, 0x0

    .line 204
    if-eqz v0, :cond_7

    .line 205
    .line 206
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 207
    .line 208
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1100(Ltv/danmaku/ijk/media/player/fakeSurface;)Ltv/danmaku/ijk/media/player/TextureRender;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/TextureRender;->destroy()V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 216
    .line 217
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1102(Ltv/danmaku/ijk/media/player/fakeSurface;Ltv/danmaku/ijk/media/player/TextureRender;)Ltv/danmaku/ijk/media/player/TextureRender;

    .line 218
    .line 219
    .line 220
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 221
    .line 222
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    if-eqz v0, :cond_b

    .line 227
    .line 228
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 229
    .line 230
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    if-eq v0, v1, :cond_8

    .line 235
    .line 236
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 237
    .line 238
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 243
    .line 244
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 249
    .line 250
    invoke-static {v4}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    invoke-interface {v0, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 258
    .line 259
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1202(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 260
    .line 261
    .line 262
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 263
    .line 264
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    if-eq v0, v1, :cond_9

    .line 269
    .line 270
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 271
    .line 272
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 277
    .line 278
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 283
    .line 284
    invoke-static {v4}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    invoke-interface {v0, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 292
    .line 293
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$502(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 294
    .line 295
    .line 296
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 297
    .line 298
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 307
    .line 308
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1300(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-eqz v0, :cond_a

    .line 317
    .line 318
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 319
    .line 320
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 325
    .line 326
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 327
    .line 328
    .line 329
    move-result-object v3

    .line 330
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 331
    .line 332
    invoke-interface {v0, v3, v1, v1, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 333
    .line 334
    .line 335
    :cond_a
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 336
    .line 337
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 342
    .line 343
    invoke-static {v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 348
    .line 349
    invoke-static {v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1300(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    invoke-interface {v0, v1, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 354
    .line 355
    .line 356
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 357
    .line 358
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 363
    .line 364
    invoke-static {v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 369
    .line 370
    .line 371
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 372
    .line 373
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$702(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 374
    .line 375
    .line 376
    :cond_b
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;->this$0:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 377
    .line 378
    invoke-static {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->access$1402(Ltv/danmaku/ijk/media/player/fakeSurface;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    :goto_3
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 383
    throw p0

    .line 384
    :goto_4
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 385
    throw p0

    .line 386
    :catchall_2
    move-exception p0

    .line 387
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 388
    throw p0
.end method
