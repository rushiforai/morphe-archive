.class public abstract Lcom/momo/mcamera/videoencoder/MediaEncoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field protected static final MSG_FRAME_AVAILABLE:I = 0x1

.field protected static final MSG_STOP_RECORDING:I = 0x9

.field private static final TAG:Ljava/lang/String; = "MediaEncoder"

.field protected static final TIMEOUT_USEC:I = 0x2710


# instance fields
.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field protected volatile mIsCapturing:Z

.field protected mIsEOS:Z

.field protected final mListener:Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;

.field public mMediaCodec:Landroid/media/MediaCodec;

.field protected mMuxerStarted:Z

.field private mRequestDrain:I

.field protected volatile mRequestStop:Z

.field protected final mSync:Ljava/lang/Object;

.field protected mTrackIndex:I

.field protected final mWeakMuxer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private prevOutputPTSUs:J

.field public processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

.field recordNumber:I

.field private startTime:J


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prevOutputPTSUs:J

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->addEncoder(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mListener:Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;

    .line 31
    .line 32
    monitor-enter v0

    .line 33
    :try_start_0
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 39
    .line 40
    new-instance p1, Ljava/lang/Thread;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-direct {p1, p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    .line 56
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :catch_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 63
    return-void

    .line 64
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    throw p0

    .line 66
    :cond_0
    const-string p0, "MediaMuxerWrapper is null"

    .line 67
    .line 68
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw v1

    .line 72
    :cond_1
    const-string p0, "MediaEncoderListener is null"

    .line 73
    .line 74
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    throw v1
.end method


# virtual methods
.method public drain()V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_5

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_1
    const/4 v1, 0x0

    .line 20
    :cond_2
    :goto_0
    move v2, v1

    .line 21
    :cond_3
    :goto_1
    iget-boolean v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 22
    .line 23
    if-eqz v3, :cond_10

    .line 24
    .line 25
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 28
    .line 29
    const-wide/16 v5, 0x2710

    .line 30
    .line 31
    invoke-virtual {v3, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, -0x1

    .line 36
    if-ne v3, v4, :cond_4

    .line 37
    .line 38
    iget-boolean v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsEOS:Z

    .line 39
    .line 40
    if-nez v3, :cond_3

    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    const/4 v3, 0x5

    .line 45
    if-le v2, v3, :cond_3

    .line 46
    .line 47
    goto/16 :goto_5

    .line 48
    .line 49
    :cond_4
    const/4 v4, -0x3

    .line 50
    if-ne v3, v4, :cond_5

    .line 51
    .line 52
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_5
    const/4 v4, -0x2

    .line 59
    const/4 v5, 0x1

    .line 60
    if-ne v3, v4, :cond_8

    .line 61
    .line 62
    iget-boolean v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMuxerStarted:Z

    .line 63
    .line 64
    if-nez v3, :cond_7

    .line 65
    .line 66
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 67
    .line 68
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->addTrack(Landroid/media/MediaFormat;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iput v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mTrackIndex:I

    .line 77
    .line 78
    iput-boolean v5, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMuxerStarted:Z

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->start()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-nez v3, :cond_3

    .line 85
    .line 86
    monitor-enter v0

    .line 87
    :goto_2
    :try_start_0
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->isStarted()Z

    .line 88
    .line 89
    .line 90
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    if-nez v3, :cond_6

    .line 92
    .line 93
    const-wide/16 v3, 0x64

    .line 94
    .line 95
    :try_start_1
    invoke-virtual {v0, v3, v4}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    goto :goto_3

    .line 101
    :catch_0
    :try_start_2
    monitor-exit v0

    .line 102
    goto/16 :goto_5

    .line 103
    .line 104
    :cond_6
    monitor-exit v0

    .line 105
    goto :goto_1

    .line 106
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    throw p0

    .line 108
    :cond_7
    const-string p0, "format changed twice"

    .line 109
    .line 110
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_8
    if-gez v3, :cond_9

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_9
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 118
    .line 119
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    aget-object v4, v4, v3

    .line 124
    .line 125
    if-eqz v4, :cond_f

    .line 126
    .line 127
    iget-object v6, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 128
    .line 129
    iget v7, v6, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 130
    .line 131
    and-int/lit8 v7, v7, 0x2

    .line 132
    .line 133
    if-eqz v7, :cond_a

    .line 134
    .line 135
    iput v1, v6, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 136
    .line 137
    :cond_a
    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 138
    .line 139
    if-eqz v6, :cond_e

    .line 140
    .line 141
    iget-boolean v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMuxerStarted:Z

    .line 142
    .line 143
    if-eqz v2, :cond_d

    .line 144
    .line 145
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 146
    .line 147
    invoke-virtual {v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    if-eqz v2, :cond_c

    .line 152
    .line 153
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 154
    .line 155
    iget-object v6, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 156
    .line 157
    invoke-virtual {v6}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-virtual {p0, v6}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->getPTSUs(Landroid/media/MediaCodec$BufferInfo;)J

    .line 162
    .line 163
    .line 164
    move-result-wide v6

    .line 165
    iput-wide v6, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 166
    .line 167
    iget v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mTrackIndex:I

    .line 168
    .line 169
    iget-object v6, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 170
    .line 171
    invoke-virtual {v0, v2, v4, v6}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 172
    .line 173
    .line 174
    iget v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->recordNumber:I

    .line 175
    .line 176
    add-int/2addr v2, v5

    .line 177
    iput v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->recordNumber:I

    .line 178
    .line 179
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 180
    .line 181
    if-eqz v2, :cond_b

    .line 182
    .line 183
    iget-object v2, v2, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 184
    .line 185
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 186
    .line 187
    .line 188
    :cond_b
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 189
    .line 190
    iget-wide v4, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 191
    .line 192
    iput-wide v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prevOutputPTSUs:J

    .line 193
    .line 194
    move v2, v1

    .line 195
    goto :goto_4

    .line 196
    :cond_c
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 197
    .line 198
    if-eqz v2, :cond_2

    .line 199
    .line 200
    iget-object v2, v2, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 201
    .line 202
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 203
    .line 204
    .line 205
    const-string v2, "MediaEncoder"

    .line 206
    .line 207
    new-instance v3, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v4, "MediaEncoder drain:recorder isDrawing"

    .line 210
    .line 211
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 215
    .line 216
    iget-object v4, v4, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 217
    .line 218
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :cond_d
    const-string p0, "drain:muxer hasn\'t started"

    .line 231
    .line 232
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_e
    :goto_4
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 237
    .line 238
    invoke-virtual {v4, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 239
    .line 240
    .line 241
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 242
    .line 243
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 244
    .line 245
    and-int/lit8 v3, v3, 0x4

    .line 246
    .line 247
    if-eqz v3, :cond_3

    .line 248
    .line 249
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 250
    .line 251
    return-void

    .line 252
    :cond_f
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 253
    .line 254
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 255
    .line 256
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 257
    .line 258
    .line 259
    const-string p0, "encoderOutputBuffer "

    .line 260
    .line 261
    const-string v0, " was null"

    .line 262
    .line 263
    invoke-static {p0, v3, v0}, Ll/z0q;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    :cond_10
    :goto_5
    return-void
.end method

.method public encode(Ljava/nio/ByteBuffer;IJ)V
    .locals 11
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 13
    .line 14
    if-eqz v1, :cond_4

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 17
    .line 18
    const-wide/16 v2, 0x2710

    .line 19
    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-ltz v5, :cond_1

    .line 25
    .line 26
    aget-object v0, v0, v5

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    :cond_2
    if-gtz p2, :cond_3

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsEOS:Z

    .line 40
    .line 41
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    const/4 v10, 0x4

    .line 45
    const/4 v6, 0x0

    .line 46
    move-wide v8, p3

    .line 47
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    move-wide v8, p3

    .line 52
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 53
    .line 54
    const/4 v6, 0x0

    .line 55
    const/4 v10, 0x0

    .line 56
    move v7, p2

    .line 57
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 58
    .line 59
    .line 60
    :cond_4
    :goto_0
    return-void
.end method

.method public frameAvailableSoon()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestDrain:I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    add-int/2addr v1, v2

    .line 17
    iput v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestDrain:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 22
    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return v2

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 29
    monitor-exit v0

    .line 30
    return p0

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public getOutputPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->getOutputPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getPTSUs(Landroid/media/MediaCodec$BufferInfo;)J
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    div-long/2addr v2, v0

    .line 10
    iget-wide p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prevOutputPTSUs:J

    .line 11
    .line 12
    cmp-long v0, v2, p0

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    sub-long/2addr p0, v2

    .line 17
    add-long/2addr p0, v2

    .line 18
    return-wide p0

    .line 19
    :cond_0
    return-wide v2

    .line 20
    :cond_1
    iget-wide v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prevOutputPTSUs:J

    .line 21
    .line 22
    const-wide/16 v4, 0x0

    .line 23
    .line 24
    cmp-long p1, v2, v4

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    div-long/2addr v2, v0

    .line 33
    iput-wide v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->startTime:J

    .line 34
    .line 35
    return-wide v2

    .line 36
    :cond_2
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->startTime:J

    .line 37
    .line 38
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-wide p0, p0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 45
    .line 46
    add-long/2addr v0, p0

    .line 47
    return-wide v0
.end method

.method public abstract prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public release()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    :cond_0
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMuxerStarted:Z

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move-object v0, v1

    .line 35
    :goto_0
    if-eqz v0, :cond_2

    .line 36
    .line 37
    :try_start_1
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->stop()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mListener:Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;

    .line 41
    .line 42
    invoke-interface {v0, p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;->onStopped(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mListener:Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;

    .line 47
    .line 48
    invoke-interface {v0, p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;->onStopped(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_1
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 52
    .line 53
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 6
    .line 7
    iput v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestDrain:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 12
    .line 13
    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 15
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter v2

    .line 18
    :try_start_1
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 19
    .line 20
    iget v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestDrain:I

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    if-lez v3, :cond_0

    .line 24
    .line 25
    move v5, v4

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    move v5, v1

    .line 28
    :goto_1
    if-eqz v5, :cond_1

    .line 29
    .line 30
    add-int/lit8 v3, v3, -0x1

    .line 31
    .line 32
    iput v3, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestDrain:I

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_5

    .line 37
    :cond_1
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->signalEndOfInputStream()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->release()V

    .line 44
    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_2
    if-eqz v5, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->drain()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 54
    .line 55
    monitor-enter v0

    .line 56
    :try_start_2
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 59
    .line 60
    .line 61
    :try_start_3
    monitor-exit v0

    .line 62
    goto :goto_0

    .line 63
    :catchall_1
    move-exception p0

    .line 64
    goto :goto_4

    .line 65
    :catch_0
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 66
    :goto_3
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 67
    .line 68
    monitor-enter v2

    .line 69
    :try_start_4
    iput-boolean v4, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 70
    .line 71
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 72
    .line 73
    monitor-exit v2

    .line 74
    return-void

    .line 75
    :catchall_2
    move-exception p0

    .line 76
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 77
    throw p0

    .line 78
    :goto_4
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 79
    throw p0

    .line 80
    :goto_5
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 81
    throw p0

    .line 82
    :catchall_3
    move-exception p0

    .line 83
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 84
    throw p0
.end method

.method public signalEndOfInputStream()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->getPTSUs(Landroid/media/MediaCodec$BufferInfo;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {p0, v2, v3, v0, v1}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->encode(Ljava/nio/ByteBuffer;IJ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public startRecording()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 13
    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public stopRecording()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsCapturing:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mRequestStop:Z

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 19
    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method
