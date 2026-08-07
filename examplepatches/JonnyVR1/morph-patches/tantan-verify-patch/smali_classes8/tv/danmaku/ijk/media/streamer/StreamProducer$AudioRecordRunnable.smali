.class Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordRunnable"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:Lcom/immomo/mediacore/audio/AudioProcess;

.field d:Landroid/view/Surface;

.field private e:Ljava/lang/Object;

.field public f:Z

.field final synthetic g:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 12

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->b:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 11
    .line 12
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 13
    .line 14
    new-instance v2, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 20
    .line 21
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->f:Z

    .line 22
    .line 23
    const-string p0, "streamerCameraProducer"

    .line 24
    .line 25
    const-string v0, "new AudioRecordRunnable"

    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object p0, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 31
    .line 32
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 33
    .line 34
    mul-int/lit8 v2, v0, 0x78

    .line 35
    .line 36
    div-int/lit16 v2, v2, 0x3e8

    .line 37
    .line 38
    mul-int/lit8 v2, v2, 0x20

    .line 39
    .line 40
    const/4 v3, 0x3

    .line 41
    shr-int/2addr v2, v3

    .line 42
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 43
    .line 44
    const/16 v4, 0x10

    .line 45
    .line 46
    const/4 v5, 0x2

    .line 47
    if-ne p0, v5, :cond_0

    .line 48
    .line 49
    const/16 p0, 0xc

    .line 50
    .line 51
    move v9, p0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move v9, v4

    .line 54
    :goto_0
    invoke-static {v0, v9, v5}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    mul-int/2addr p0, v4

    .line 59
    if-ge v2, p0, :cond_1

    .line 60
    .line 61
    move v11, p0

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    move v11, v2

    .line 64
    :goto_1
    :try_start_0
    new-instance v6, Landroid/media/AudioRecord;

    .line 65
    .line 66
    iget-object p0, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 67
    .line 68
    iget v8, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 69
    .line 70
    const/4 v10, 0x2

    .line 71
    const/4 v7, 0x1

    .line 72
    invoke-direct/range {v6 .. v11}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U(Ltv/danmaku/ijk/media/streamer/StreamProducer;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catch_0
    const/16 p0, 0x12c

    .line 80
    .line 81
    const/16 v0, -0x12e

    .line 82
    .line 83
    invoke-virtual {p1, p0, v0, v3, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/mediacore/audio/AudioProcess;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    const-string p0, "streamerCameraProducer"

    .line 16
    .line 17
    const-string p1, "AudioRecordRunnable addAudioProcess"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p0
.end method

.method public b(Landroid/view/Surface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 5
    .line 6
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    const-string p0, "streamerCameraProducer"

    .line 8
    .line 9
    const-string p1, "AudioRecordRunnable addCodecSurface"

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 11

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 7
    .line 8
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_b

    .line 14
    .line 15
    :catch_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->b:I

    .line 28
    .line 29
    const/4 v2, 0x5

    .line 30
    if-ge v0, v2, :cond_0

    .line 31
    .line 32
    const-wide/16 v2, 0x64

    .line 33
    .line 34
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->b:I

    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->b:I

    .line 42
    .line 43
    const-string v0, "streamerCameraProducer"

    .line 44
    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v3, "mAudioRecord.getState "

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 56
    .line 57
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getState()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 77
    .line 78
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    .line 84
    .line 85
    :catch_1
    const-string v0, "streamerCameraProducer"

    .line 86
    .line 87
    new-instance v2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v3, "AudioRecordRunnable mAudioCapturing:"

    .line 90
    .line 91
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 95
    .line 96
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_9

    .line 115
    .line 116
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 117
    .line 118
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_9

    .line 123
    .line 124
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 125
    .line 126
    monitor-enter v0

    .line 127
    :try_start_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 128
    .line 129
    if-eqz v2, :cond_1

    .line 130
    .line 131
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 132
    .line 133
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    if-eqz v2, :cond_1

    .line 138
    .line 139
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 140
    .line 141
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 146
    .line 147
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z(Landroid/view/Surface;)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :catchall_0
    move-exception p0

    .line 152
    goto/16 :goto_6

    .line 153
    .line 154
    :cond_1
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 155
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 156
    .line 157
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    new-array v2, v2, [B

    .line 162
    .line 163
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X(Ltv/danmaku/ijk/media/streamer/StreamProducer;[B)[B

    .line 164
    .line 165
    .line 166
    const-string v0, "streamerCameraProducer"

    .line 167
    .line 168
    new-instance v2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v3, "allocatebuff mAudioFrame"

    .line 171
    .line 172
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 176
    .line 177
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    const-wide/16 v2, 0x14

    .line 192
    .line 193
    :try_start_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 194
    .line 195
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 200
    .line 201
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 206
    .line 207
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    const/4 v6, 0x0

    .line 212
    invoke-virtual {v0, v4, v6, v5}, Landroid/media/AudioRecord;->read([BII)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a:I

    .line 217
    .line 218
    const-string v0, "streamerCameraProducer"

    .line 219
    .line 220
    new-instance v4, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    const-string v5, "this.audioRecord.read size"

    .line 226
    .line 227
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a:I

    .line 231
    .line 232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-static {v0, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a:I

    .line 243
    .line 244
    if-lez v0, :cond_7

    .line 245
    .line 246
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 247
    .line 248
    monitor-enter v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 249
    :try_start_4
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 250
    .line 251
    if-eqz v4, :cond_2

    .line 252
    .line 253
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 254
    .line 255
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    iget v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a:I

    .line 260
    .line 261
    invoke-virtual {v4, v5, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->processStereoAudioData([BI)[B

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 266
    .line 267
    invoke-static {v5, v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X(Ltv/danmaku/ijk/media/streamer/StreamProducer;[B)[B

    .line 268
    .line 269
    .line 270
    goto :goto_3

    .line 271
    :catchall_1
    move-exception v4

    .line 272
    goto/16 :goto_5

    .line 273
    .line 274
    :cond_2
    :goto_3
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 275
    .line 276
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U0()V

    .line 277
    .line 278
    .line 279
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 280
    .line 281
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 286
    .line 287
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 288
    .line 289
    .line 290
    move-result-object v6

    .line 291
    array-length v6, v6

    .line 292
    invoke-virtual {v4, v5, v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t2([BI)V

    .line 293
    .line 294
    .line 295
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 296
    .line 297
    if-eqz v4, :cond_6

    .line 298
    .line 299
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 300
    .line 301
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    if-nez v4, :cond_6

    .line 306
    .line 307
    iget-boolean v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->f:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 308
    .line 309
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 310
    .line 311
    const-wide/16 v6, 0x3e8

    .line 312
    .line 313
    if-nez v4, :cond_4

    .line 314
    .line 315
    :try_start_5
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    if-eqz v4, :cond_3

    .line 320
    .line 321
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 322
    .line 323
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 328
    .line 329
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-virtual {v4, v5}, Lcom/immomo/mediacore/audio/audio_Indicator;->putAudioData([B)V

    .line 334
    .line 335
    .line 336
    :cond_3
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 337
    .line 338
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 339
    .line 340
    .line 341
    move-result v4

    .line 342
    if-eqz v4, :cond_5

    .line 343
    .line 344
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 345
    .line 346
    new-instance v5, Ll/oxd0;

    .line 347
    .line 348
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 349
    .line 350
    invoke-static {v8}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 351
    .line 352
    .line 353
    move-result-object v8

    .line 354
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 355
    .line 356
    .line 357
    move-result-wide v9

    .line 358
    div-long/2addr v9, v6

    .line 359
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 360
    .line 361
    iget-object v6, v6, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 362
    .line 363
    iget v6, v6, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 364
    .line 365
    invoke-direct {v5, v8, v9, v10, v6}, Ll/oxd0;-><init>([BJI)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v4, v5}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 369
    .line 370
    .line 371
    goto :goto_4

    .line 372
    :cond_4
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    if-eqz v4, :cond_5

    .line 377
    .line 378
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 379
    .line 380
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a:I

    .line 381
    .line 382
    new-array v5, v5, [B

    .line 383
    .line 384
    invoke-static {v4, v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a0(Ltv/danmaku/ijk/media/streamer/StreamProducer;[B)[B

    .line 385
    .line 386
    .line 387
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 388
    .line 389
    new-instance v5, Ll/oxd0;

    .line 390
    .line 391
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 392
    .line 393
    invoke-static {v8}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B

    .line 394
    .line 395
    .line 396
    move-result-object v8

    .line 397
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 398
    .line 399
    .line 400
    move-result-wide v9

    .line 401
    div-long/2addr v9, v6

    .line 402
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 403
    .line 404
    iget-object v6, v6, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 405
    .line 406
    iget v6, v6, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 407
    .line 408
    invoke-direct {v5, v8, v9, v10, v6}, Ll/oxd0;-><init>([BJI)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v4, v5}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 412
    .line 413
    .line 414
    :cond_5
    :goto_4
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 415
    .line 416
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 417
    .line 418
    .line 419
    :cond_6
    monitor-exit v0

    .line 420
    goto/16 :goto_1

    .line 421
    .line 422
    :goto_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 423
    :try_start_6
    throw v4

    .line 424
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 425
    .line 426
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 427
    .line 428
    .line 429
    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 430
    if-nez v0, :cond_8

    .line 431
    .line 432
    goto :goto_7

    .line 433
    :cond_8
    :try_start_7
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 434
    .line 435
    .line 436
    goto/16 :goto_1

    .line 437
    .line 438
    :catch_2
    move-exception v0

    .line 439
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 440
    .line 441
    .line 442
    goto/16 :goto_1

    .line 443
    .line 444
    :catch_3
    :try_start_9
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    .line 445
    .line 446
    .line 447
    goto/16 :goto_1

    .line 448
    .line 449
    :catch_4
    move-exception v0

    .line 450
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 451
    .line 452
    .line 453
    goto/16 :goto_1

    .line 454
    .line 455
    :goto_6
    :try_start_a
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 456
    throw p0

    .line 457
    :cond_9
    :goto_7
    const-string v0, "streamerCameraProducer"

    .line 458
    .line 459
    const-string v2, " AudioRecordRunnable mAudioRecord.stop() and release"

    .line 460
    .line 461
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    .line 463
    .line 464
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 465
    .line 466
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    if-eqz v0, :cond_a

    .line 471
    .line 472
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 473
    .line 474
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 479
    .line 480
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z(Landroid/view/Surface;)V

    .line 481
    .line 482
    .line 483
    :cond_a
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 484
    .line 485
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 486
    .line 487
    .line 488
    move-result-object v0

    .line 489
    if-eqz v0, :cond_b

    .line 490
    .line 491
    :try_start_b
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 492
    .line 493
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 498
    .line 499
    .line 500
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 501
    .line 502
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U(Ltv/danmaku/ijk/media/streamer/StreamProducer;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    .line 503
    .line 504
    .line 505
    :catch_5
    :cond_b
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 506
    .line 507
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 508
    .line 509
    return-void
.end method
