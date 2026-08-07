.class Lcom/bef/effectsdk/GLTextureView$GLThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GLThread"
.end annotation


# instance fields
.field private mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mFinishedCreatingEglSurface:Z

.field private mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/bef/effectsdk/GLTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mSizeChanged:Z

.field private mSurfaceIsBad:Z

.field private mWaitingForSurface:Z

.field private mWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/bef/effectsdk/GLTextureView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSizeChanged:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWidth:I

    .line 16
    .line 17
    iput v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHeight:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 20
    .line 21
    iput v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderMode:I

    .line 22
    .line 23
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic access$1102(Lcom/bef/effectsdk/GLTextureView$GLThread;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z

    .line 2
    .line 3
    return p1
.end method

.method private guardedRun()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v0, v2}, Lcom/bef/effectsdk/GLTextureView$EglHelper;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 14
    .line 15
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 16
    .line 17
    move v4, v0

    .line 18
    move v5, v4

    .line 19
    move v6, v5

    .line 20
    move v7, v6

    .line 21
    move v8, v7

    .line 22
    move v9, v8

    .line 23
    move v10, v9

    .line 24
    move v11, v10

    .line 25
    move v12, v11

    .line 26
    move v13, v12

    .line 27
    const/4 v3, 0x0

    .line 28
    :goto_0
    const/4 v14, 0x0

    .line 29
    :goto_1
    :try_start_0
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 30
    .line 31
    .line 32
    move-result-object v15

    .line 33
    monitor-enter v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 34
    :goto_2
    :try_start_1
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_0

    .line 45
    .line 46
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 47
    .line 48
    const/4 v14, 0x0

    .line 49
    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    move-object v14, v2

    .line 54
    check-cast v14, Ljava/lang/Runnable;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    goto/16 :goto_6

    .line 58
    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto/16 :goto_9

    .line 61
    .line 62
    :cond_0
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mShouldExit:Z

    .line 63
    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/bef/effectsdk/GLTextureView;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView;->onExitContext()V

    .line 75
    .line 76
    .line 77
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    monitor-enter v2

    .line 83
    :try_start_2
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 84
    .line 85
    .line 86
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 87
    .line 88
    .line 89
    monitor-exit v2

    .line 90
    return-void

    .line 91
    :catchall_1
    move-exception v0

    .line 92
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 93
    throw v0

    .line 94
    :cond_1
    :try_start_3
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z

    .line 95
    .line 96
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestPaused:Z

    .line 97
    .line 98
    if-eq v2, v0, :cond_2

    .line 99
    .line 100
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z

    .line 101
    .line 102
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_2
    const/4 v0, 0x0

    .line 114
    :goto_3
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 115
    .line 116
    if-eqz v2, :cond_3

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 119
    .line 120
    .line 121
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/bef/effectsdk/GLTextureView;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/bef/effectsdk/GLTextureView;->onExitContext()V

    .line 130
    .line 131
    .line 132
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 133
    .line 134
    .line 135
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 136
    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    iput-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 140
    .line 141
    const/4 v11, 0x1

    .line 142
    :cond_3
    if-eqz v7, :cond_4

    .line 143
    .line 144
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lcom/bef/effectsdk/GLTextureView;

    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/bef/effectsdk/GLTextureView;->onExitContext()V

    .line 153
    .line 154
    .line 155
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 156
    .line 157
    .line 158
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 159
    .line 160
    .line 161
    const/4 v7, 0x0

    .line 162
    :cond_4
    if-eqz v0, :cond_5

    .line 163
    .line 164
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 165
    .line 166
    if-eqz v2, :cond_5

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 169
    .line 170
    .line 171
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 172
    .line 173
    .line 174
    :cond_5
    if-eqz v0, :cond_8

    .line 175
    .line 176
    iget-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 177
    .line 178
    if-eqz v2, :cond_8

    .line 179
    .line 180
    iget-object v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    check-cast v2, Lcom/bef/effectsdk/GLTextureView;

    .line 187
    .line 188
    if-nez v2, :cond_6

    .line 189
    .line 190
    const/4 v2, 0x0

    .line 191
    goto :goto_4

    .line 192
    :cond_6
    invoke-static {v2}, Lcom/bef/effectsdk/GLTextureView;->access$900(Lcom/bef/effectsdk/GLTextureView;)Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    :goto_4
    if-eqz v2, :cond_7

    .line 197
    .line 198
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v2}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    if-eqz v2, :cond_8

    .line 207
    .line 208
    :cond_7
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 212
    .line 213
    .line 214
    :cond_8
    if-eqz v0, :cond_9

    .line 215
    .line 216
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_9

    .line 225
    .line 226
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 227
    .line 228
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->finish()V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 232
    .line 233
    .line 234
    :cond_9
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHasSurface:Z

    .line 235
    .line 236
    if-nez v0, :cond_b

    .line 237
    .line 238
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 239
    .line 240
    if-nez v0, :cond_b

    .line 241
    .line 242
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 243
    .line 244
    .line 245
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 246
    .line 247
    if-eqz v0, :cond_a

    .line 248
    .line 249
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 250
    .line 251
    .line 252
    :cond_a
    const/4 v0, 0x1

    .line 253
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 254
    .line 255
    const/4 v2, 0x0

    .line 256
    iput-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 257
    .line 258
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 263
    .line 264
    .line 265
    :cond_b
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHasSurface:Z

    .line 266
    .line 267
    if-eqz v0, :cond_c

    .line 268
    .line 269
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 270
    .line 271
    if-eqz v0, :cond_c

    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 274
    .line 275
    .line 276
    const/4 v2, 0x0

    .line 277
    iput-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 278
    .line 279
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 284
    .line 285
    .line 286
    :cond_c
    if-eqz v10, :cond_d

    .line 287
    .line 288
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 289
    .line 290
    .line 291
    const/4 v0, 0x1

    .line 292
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderComplete:Z

    .line 293
    .line 294
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 299
    .line 300
    .line 301
    const/4 v9, 0x0

    .line 302
    const/4 v10, 0x0

    .line 303
    :cond_d
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->readyToDraw()Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_1e

    .line 308
    .line 309
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 310
    .line 311
    if-nez v0, :cond_f

    .line 312
    .line 313
    if-eqz v11, :cond_e

    .line 314
    .line 315
    const/4 v11, 0x0

    .line 316
    goto :goto_5

    .line 317
    :cond_e
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {v0, v1}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/bef/effectsdk/GLTextureView$GLThread;)Z

    .line 322
    .line 323
    .line 324
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 325
    if-eqz v0, :cond_f

    .line 326
    .line 327
    :try_start_4
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 328
    .line 329
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->start()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 330
    .line 331
    .line 332
    const/4 v0, 0x1

    .line 333
    :try_start_5
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 334
    .line 335
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 340
    .line 341
    .line 342
    const/4 v4, 0x1

    .line 343
    goto :goto_5

    .line 344
    :catch_0
    move-exception v0

    .line 345
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v2, v1}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/bef/effectsdk/GLTextureView$GLThread;)V

    .line 350
    .line 351
    .line 352
    throw v0

    .line 353
    :cond_f
    :goto_5
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 354
    .line 355
    if-eqz v0, :cond_10

    .line 356
    .line 357
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 358
    .line 359
    if-nez v0, :cond_10

    .line 360
    .line 361
    const/4 v0, 0x1

    .line 362
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 363
    .line 364
    const/4 v5, 0x1

    .line 365
    const/4 v6, 0x1

    .line 366
    const/4 v8, 0x1

    .line 367
    :cond_10
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 368
    .line 369
    if-eqz v0, :cond_1e

    .line 370
    .line 371
    iget-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSizeChanged:Z

    .line 372
    .line 373
    if-eqz v0, :cond_11

    .line 374
    .line 375
    iget v12, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWidth:I

    .line 376
    .line 377
    iget v13, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHeight:I

    .line 378
    .line 379
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 380
    .line 381
    .line 382
    const/4 v2, 0x0

    .line 383
    iput-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSizeChanged:Z

    .line 384
    .line 385
    const/4 v5, 0x1

    .line 386
    const/4 v8, 0x1

    .line 387
    const/4 v9, 0x1

    .line 388
    :cond_11
    const/4 v2, 0x0

    .line 389
    iput-boolean v2, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 390
    .line 391
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 396
    .line 397
    .line 398
    :goto_6
    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 399
    if-eqz v5, :cond_13

    .line 400
    .line 401
    :try_start_6
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 402
    .line 403
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->createSurface()Z

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    if-eqz v0, :cond_12

    .line 408
    .line 409
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 410
    .line 411
    .line 412
    move-result-object v5

    .line 413
    monitor-enter v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 414
    const/4 v0, 0x1

    .line 415
    :try_start_7
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 416
    .line 417
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 422
    .line 423
    .line 424
    monitor-exit v5

    .line 425
    move v5, v2

    .line 426
    goto :goto_7

    .line 427
    :catchall_2
    move-exception v0

    .line 428
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 429
    :try_start_8
    throw v0

    .line 430
    :catchall_3
    move-exception v0

    .line 431
    goto/16 :goto_a

    .line 432
    .line 433
    :cond_12
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 434
    .line 435
    .line 436
    move-result-object v15

    .line 437
    monitor-enter v15
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 438
    const/4 v0, 0x1

    .line 439
    :try_start_9
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 440
    .line 441
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 442
    .line 443
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 448
    .line 449
    .line 450
    monitor-exit v15

    .line 451
    move v0, v2

    .line 452
    goto/16 :goto_1

    .line 453
    .line 454
    :catchall_4
    move-exception v0

    .line 455
    monitor-exit v15
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 456
    :try_start_a
    throw v0

    .line 457
    :cond_13
    :goto_7
    if-eqz v6, :cond_14

    .line 458
    .line 459
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 460
    .line 461
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->createGL()Ljavax/microedition/khronos/opengles/GL;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    .line 466
    .line 467
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 468
    .line 469
    .line 470
    move-result-object v3

    .line 471
    invoke-virtual {v3, v0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 472
    .line 473
    .line 474
    move-object v3, v0

    .line 475
    move v6, v2

    .line 476
    :cond_14
    if-eqz v4, :cond_16

    .line 477
    .line 478
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 479
    .line 480
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    check-cast v0, Lcom/bef/effectsdk/GLTextureView;

    .line 485
    .line 486
    if-eqz v0, :cond_15

    .line 487
    .line 488
    invoke-static {v0}, Lcom/bef/effectsdk/GLTextureView;->access$1000(Lcom/bef/effectsdk/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    iget-object v4, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 493
    .line 494
    iget-object v4, v4, Lcom/bef/effectsdk/GLTextureView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 495
    .line 496
    invoke-interface {v0, v3, v4}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 497
    .line 498
    .line 499
    :cond_15
    move v4, v2

    .line 500
    :cond_16
    if-eqz v14, :cond_17

    .line 501
    .line 502
    invoke-interface {v14}, Ljava/lang/Runnable;->run()V

    .line 503
    .line 504
    .line 505
    move v0, v2

    .line 506
    goto/16 :goto_0

    .line 507
    .line 508
    :cond_17
    if-eqz v8, :cond_19

    .line 509
    .line 510
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 511
    .line 512
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    check-cast v0, Lcom/bef/effectsdk/GLTextureView;

    .line 517
    .line 518
    if-eqz v0, :cond_18

    .line 519
    .line 520
    invoke-static {v0}, Lcom/bef/effectsdk/GLTextureView;->access$1000(Lcom/bef/effectsdk/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 521
    .line 522
    .line 523
    move-result-object v0

    .line 524
    invoke-interface {v0, v3, v12, v13}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 525
    .line 526
    .line 527
    :cond_18
    move v8, v2

    .line 528
    :cond_19
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 529
    .line 530
    .line 531
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 532
    .line 533
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    check-cast v0, Lcom/bef/effectsdk/GLTextureView;

    .line 538
    .line 539
    if-eqz v0, :cond_1a

    .line 540
    .line 541
    invoke-static {v0}, Lcom/bef/effectsdk/GLTextureView;->access$1000(Lcom/bef/effectsdk/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    invoke-interface {v0, v3}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 546
    .line 547
    .line 548
    :cond_1a
    iget-object v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 549
    .line 550
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->swap()I

    .line 551
    .line 552
    .line 553
    move-result v0

    .line 554
    const/16 v15, 0x3000

    .line 555
    .line 556
    if-eq v0, v15, :cond_1c

    .line 557
    .line 558
    const/16 v15, 0x300e

    .line 559
    .line 560
    if-eq v0, v15, :cond_1b

    .line 561
    .line 562
    const-string v15, "GLThread"

    .line 563
    .line 564
    const-string v2, "eglSwapBuffers"

    .line 565
    .line 566
    invoke-static {v15, v2, v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V

    .line 567
    .line 568
    .line 569
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    monitor-enter v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 574
    const/4 v0, 0x1

    .line 575
    :try_start_b
    iput-boolean v0, v1, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 576
    .line 577
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 578
    .line 579
    .line 580
    move-result-object v15

    .line 581
    invoke-virtual {v15}, Ljava/lang/Object;->notifyAll()V

    .line 582
    .line 583
    .line 584
    monitor-exit v2

    .line 585
    goto :goto_8

    .line 586
    :catchall_5
    move-exception v0

    .line 587
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 588
    :try_start_c
    throw v0

    .line 589
    :cond_1b
    const/4 v0, 0x1

    .line 590
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 591
    .line 592
    .line 593
    move v7, v0

    .line 594
    goto :goto_8

    .line 595
    :cond_1c
    const/4 v0, 0x1

    .line 596
    :goto_8
    if-eqz v9, :cond_1d

    .line 597
    .line 598
    move v10, v0

    .line 599
    :cond_1d
    const/4 v0, 0x0

    .line 600
    goto/16 :goto_1

    .line 601
    .line 602
    :cond_1e
    :try_start_d
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 603
    .line 604
    .line 605
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 610
    .line 611
    .line 612
    const/4 v0, 0x0

    .line 613
    goto/16 :goto_2

    .line 614
    .line 615
    :goto_9
    monitor-exit v15
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 616
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 617
    :goto_a
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 618
    .line 619
    .line 620
    move-result-object v2

    .line 621
    monitor-enter v2

    .line 622
    :try_start_f
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 623
    .line 624
    .line 625
    invoke-direct {v1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 626
    .line 627
    .line 628
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 629
    throw v0

    .line 630
    :catchall_6
    move-exception v0

    .line 631
    :try_start_10
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 632
    throw v0
.end method

.method private readyToDraw()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHasSurface:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWidth:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHeight:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderMode:I

    .line 27
    .line 28
    if-ne p0, v1, :cond_1

    .line 29
    .line 30
    :cond_0
    return v1

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private stopEglContextLocked()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->finish()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 12
    .line 13
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/bef/effectsdk/GLTextureView$GLThread;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEglHelper:Lcom/bef/effectsdk/GLTextureView$EglHelper;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$EglHelper;->destroySurface()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->readyToDraw()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public getRenderMode()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderMode:I

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestPaused:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    throw p0
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestPaused:Z

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    iput-boolean v2, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderComplete:Z

    .line 16
    .line 17
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    throw p0
.end method

.method public onWindowResize(II)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWidth:I

    .line 7
    .line 8
    iput p2, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHeight:I

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mSizeChanged:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderComplete:Z

    .line 17
    .line 18
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mPaused:Z

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderComplete:Z

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->ableToDraw()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    monitor-exit v0

    .line 65
    return-void

    .line 66
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    throw p0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0

    .line 25
    :cond_0
    const-string p0, "r must not be null"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public requestExitAndWait()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mShouldExit:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    throw p0
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public requestRender()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRequestRender:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public run()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GLThread "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->threadExiting(Lcom/bef/effectsdk/GLTextureView$GLThread;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, p0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->threadExiting(Lcom/bef/effectsdk/GLTextureView$GLThread;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :catch_0
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p0}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;->threadExiting(Lcom/bef/effectsdk/GLTextureView$GLThread;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public setRenderMode(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-gt p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iput p1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mRenderMode:I

    .line 12
    .line 13
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0

    .line 25
    :cond_0
    const-string p0, "renderMode"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public surfaceCreated()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHasSurface:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 14
    .line 15
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    monitor-exit v0

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    throw p0
.end method

.method public surfaceDestroyed()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mHasSurface:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/bef/effectsdk/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    :try_start_1
    invoke-static {}, Lcom/bef/effectsdk/GLTextureView;->access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    throw p0
.end method
