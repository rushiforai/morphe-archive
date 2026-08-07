.class Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/videoencoder/ProcessSurface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderThread"
.end annotation


# instance fields
.field final TIMEOUT_MS:I

.field count:J

.field i:I

.field volatile isRecording:Z

.field mOwr:Lcom/momo/mcamera/videoencoder/ProcessSurface;

.field now:J

.field oldnow:J

.field t:I

.field final synthetic this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x28

    .line 7
    .line 8
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->TIMEOUT_MS:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->count:J

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->i:I

    .line 16
    .line 17
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->t:I

    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->isRecording:Z

    .line 20
    .line 21
    iput-object p2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->mOwr:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    monitor-enter v1

    .line 25
    :try_start_1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$400(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$800(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$900(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 102
    .line 103
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Landroid/view/Surface;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-static {v0, v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1200(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/view/Surface;)V

    .line 108
    .line 109
    .line 110
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->isRecording:Z

    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1400(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 124
    .line 125
    .line 126
    iput-boolean v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->isRecording:Z

    .line 127
    .line 128
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 129
    .line 130
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

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
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 139
    .line 140
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    monitor-enter v0

    .line 145
    :try_start_2
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 146
    .line 147
    invoke-static {v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

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
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 154
    .line 155
    invoke-static {v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

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
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 169
    .line 170
    invoke-static {v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

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
    goto :goto_2

    .line 178
    :cond_6
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 179
    .line 180
    invoke-static {v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 184
    .line 185
    invoke-static {v1, v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1602(Lcom/momo/mcamera/videoencoder/ProcessSurface;Z)Z

    .line 186
    .line 187
    .line 188
    iget v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->i:I

    .line 189
    .line 190
    add-int/2addr v1, v2

    .line 191
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->i:I

    .line 192
    .line 193
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 194
    .line 195
    .line 196
    move-result-wide v1

    .line 197
    const-wide/16 v4, 0x3e8

    .line 198
    .line 199
    div-long/2addr v1, v4

    .line 200
    iput-wide v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->now:J

    .line 201
    .line 202
    iget v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->i:I

    .line 203
    .line 204
    const/4 v5, 0x3

    .line 205
    const-wide/16 v6, 0x1

    .line 206
    .line 207
    if-le v4, v5, :cond_7

    .line 208
    .line 209
    iget v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->t:I

    .line 210
    .line 211
    int-to-long v8, v5

    .line 212
    iget-wide v10, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->oldnow:J

    .line 213
    .line 214
    sub-long/2addr v1, v10

    .line 215
    add-long/2addr v8, v1

    .line 216
    long-to-int v1, v8

    .line 217
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->t:I

    .line 218
    .line 219
    iget-wide v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->count:J

    .line 220
    .line 221
    add-long/2addr v1, v6

    .line 222
    iput-wide v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->count:J

    .line 223
    .line 224
    :cond_7
    const/16 v1, 0x14

    .line 225
    .line 226
    if-le v4, v1, :cond_a

    .line 227
    .line 228
    iget v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->t:I

    .line 229
    .line 230
    int-to-long v1, v1

    .line 231
    iget-wide v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->count:J

    .line 232
    .line 233
    div-long/2addr v1, v4

    .line 234
    const-wide/16 v4, 0x0

    .line 235
    .line 236
    cmp-long v8, v1, v4

    .line 237
    .line 238
    if-lez v8, :cond_8

    .line 239
    .line 240
    iget-object v8, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 241
    .line 242
    const-wide/32 v9, 0xf4240

    .line 243
    .line 244
    .line 245
    div-long/2addr v9, v1

    .line 246
    add-long/2addr v9, v6

    .line 247
    long-to-int v1, v9

    .line 248
    iput v1, v8, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderFRate:I

    .line 249
    .line 250
    :cond_8
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 251
    .line 252
    iget v2, v1, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderFRate:I

    .line 253
    .line 254
    if-lez v2, :cond_9

    .line 255
    .line 256
    const/16 v6, 0x3e8

    .line 257
    .line 258
    div-int/2addr v6, v2

    .line 259
    iput v6, v1, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderTime:I

    .line 260
    .line 261
    :cond_9
    iput-wide v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->count:J

    .line 262
    .line 263
    iput-wide v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->oldnow:J

    .line 264
    .line 265
    iput-wide v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->now:J

    .line 266
    .line 267
    iput v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->t:I

    .line 268
    .line 269
    iput v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->i:I

    .line 270
    .line 271
    :cond_a
    iget-wide v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->now:J

    .line 272
    .line 273
    iput-wide v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->oldnow:J

    .line 274
    .line 275
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 276
    :goto_2
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 277
    .line 278
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1800(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    if-eqz v0, :cond_0

    .line 283
    .line 284
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 285
    .line 286
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1900(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ll/jt2;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    const/4 v1, 0x0

    .line 291
    if-eqz v0, :cond_b

    .line 292
    .line 293
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 294
    .line 295
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1900(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ll/jt2;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 303
    .line 304
    invoke-static {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$1902(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ll/jt2;)Ll/jt2;

    .line 305
    .line 306
    .line 307
    :cond_b
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 308
    .line 309
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    if-eqz v0, :cond_c

    .line 314
    .line 315
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 316
    .line 317
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {v0}, Ll/ogk;->destroy()V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 325
    .line 326
    invoke-static {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2002(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/mask/StickerGroupFilter;)Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 327
    .line 328
    .line 329
    :cond_c
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 330
    .line 331
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    if-eqz v0, :cond_d

    .line 336
    .line 337
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 338
    .line 339
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->release()V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 347
    .line 348
    invoke-static {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2102(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 349
    .line 350
    .line 351
    :cond_d
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 352
    .line 353
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    if-eqz v0, :cond_f

    .line 358
    .line 359
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 360
    .line 361
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 366
    .line 367
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 368
    .line 369
    .line 370
    move-result-object v2

    .line 371
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 372
    .line 373
    invoke-static {v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 378
    .line 379
    .line 380
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 381
    .line 382
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 387
    .line 388
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 393
    .line 394
    invoke-static {v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 399
    .line 400
    .line 401
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 402
    .line 403
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 412
    .line 413
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    if-eqz v0, :cond_e

    .line 422
    .line 423
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 424
    .line 425
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 430
    .line 431
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 436
    .line 437
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 438
    .line 439
    invoke-interface {v0, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 440
    .line 441
    .line 442
    :cond_e
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 443
    .line 444
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 449
    .line 450
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 455
    .line 456
    invoke-static {v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 461
    .line 462
    .line 463
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 464
    .line 465
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 470
    .line 471
    invoke-static {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 476
    .line 477
    .line 478
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 479
    .line 480
    invoke-static {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$702(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 481
    .line 482
    .line 483
    :cond_f
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 484
    .line 485
    invoke-static {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$2402(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 489
    .line 490
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    monitor-enter v0

    .line 495
    :try_start_5
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;->this$0:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 496
    .line 497
    invoke-static {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->access$200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 502
    .line 503
    .line 504
    monitor-exit v0

    .line 505
    return-void

    .line 506
    :catchall_2
    move-exception p0

    .line 507
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 508
    throw p0

    .line 509
    :goto_3
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 510
    throw p0

    .line 511
    :goto_4
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 512
    throw p0

    .line 513
    :catchall_3
    move-exception p0

    .line 514
    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 515
    throw p0
.end method
