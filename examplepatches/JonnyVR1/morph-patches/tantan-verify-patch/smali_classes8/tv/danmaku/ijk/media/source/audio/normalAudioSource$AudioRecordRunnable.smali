.class Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/source/audio/normalAudioSource;
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

.field final synthetic g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->b:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 11
    .line 12
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->d:Landroid/view/Surface;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 20
    .line 21
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->f:Z

    .line 22
    .line 23
    iget-object p0, p1, Ltv/danmaku/ijk/media/source/audio/audioSource;->b:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 24
    .line 25
    const v0, 0xac44

    .line 26
    .line 27
    .line 28
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 29
    .line 30
    const v1, 0xfa00

    .line 31
    .line 32
    .line 33
    iput v1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 34
    .line 35
    mul-int/lit8 p0, v0, 0x78

    .line 36
    .line 37
    div-int/lit16 p0, p0, 0x3e8

    .line 38
    .line 39
    mul-int/lit8 p0, p0, 0x20

    .line 40
    .line 41
    shr-int/lit8 p0, p0, 0x3

    .line 42
    .line 43
    const/4 v1, 0x2

    .line 44
    const/16 v2, 0x10

    .line 45
    .line 46
    invoke-static {v0, v2, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    mul-int/2addr v0, v2

    .line 51
    if-ge p0, v0, :cond_0

    .line 52
    .line 53
    move v6, v0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v6, p0

    .line 56
    :goto_0
    :try_start_0
    new-instance v1, Landroid/media/AudioRecord;

    .line 57
    .line 58
    iget-object p0, p1, Ltv/danmaku/ijk/media/source/audio/audioSource;->b:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 59
    .line 60
    iget v3, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 61
    .line 62
    const/16 v4, 0x10

    .line 63
    .line 64
    const/4 v5, 0x2

    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-direct/range {v1 .. v6}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    :catch_0
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;Ltv/danmaku/ijk/media/source/audio/normalAudioSource$1;)V
    .locals 0

    .line 73
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;-><init>(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/mediacore/audio/AudioProcess;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public run()V
    .locals 8

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 7
    .line 8
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    :catch_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 15
    .line 16
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->b:I

    .line 27
    .line 28
    const/4 v1, 0x5

    .line 29
    if-ge v0, v1, :cond_0

    .line 30
    .line 31
    const-wide/16 v0, 0x64

    .line 32
    .line 33
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->b:I

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    iput v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->b:I

    .line 41
    .line 42
    const-string v0, "streamerCameraProducer"

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v2, "mAudioRecord.getState "

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 55
    .line 56
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 76
    .line 77
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 82
    .line 83
    .line 84
    :catch_1
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 91
    .line 92
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->g(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 99
    .line 100
    monitor-enter v0

    .line 101
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 103
    .line 104
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    new-array v1, v1, [B

    .line 109
    .line 110
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->i(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;[B)[B

    .line 111
    .line 112
    .line 113
    const-string v0, "streamerCameraProducer"

    .line 114
    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v2, "allocatebuff mAudioFrame"

    .line 118
    .line 119
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 123
    .line 124
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    :try_start_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 139
    .line 140
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 145
    .line 146
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)[B

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 151
    .line 152
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const/4 v3, 0x0

    .line 157
    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioRecord;->read([BII)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    iput v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->a:I

    .line 162
    .line 163
    const-string v0, "streamerCameraProducer"

    .line 164
    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    const-string v2, "this.audioRecord.read size"

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    iget v2, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->a:I

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    iget v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->a:I

    .line 188
    .line 189
    if-lez v0, :cond_2

    .line 190
    .line 191
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->e:Ljava/lang/Object;

    .line 192
    .line 193
    monitor-enter v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 194
    :try_start_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->c:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 195
    .line 196
    if-eqz v1, :cond_1

    .line 197
    .line 198
    new-instance v2, Ll/oxd0;

    .line 199
    .line 200
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 201
    .line 202
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)[B

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 207
    .line 208
    .line 209
    move-result-wide v4

    .line 210
    const-wide/16 v6, 0x3e8

    .line 211
    .line 212
    div-long/2addr v4, v6

    .line 213
    iget-object v6, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 214
    .line 215
    iget-object v6, v6, Ltv/danmaku/ijk/media/source/audio/audioSource;->b:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 216
    .line 217
    iget v6, v6, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 218
    .line 219
    invoke-direct {v2, v3, v4, v5, v6}, Ll/oxd0;-><init>([BJI)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 226
    .line 227
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)J

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :catchall_0
    move-exception v1

    .line 232
    goto :goto_3

    .line 233
    :cond_1
    :goto_2
    monitor-exit v0

    .line 234
    goto/16 :goto_1

    .line 235
    .line 236
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 237
    :try_start_5
    throw v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 238
    :catchall_1
    move-exception p0

    .line 239
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 240
    throw p0

    .line 241
    :cond_2
    const-string v0, "streamerCameraProducer"

    .line 242
    .line 243
    const-string v1, " mAudioRecord.stop() and release"

    .line 244
    .line 245
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 249
    .line 250
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    if-eqz v0, :cond_3

    .line 255
    .line 256
    :try_start_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 257
    .line 258
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->g:Ltv/danmaku/ijk/media/source/audio/normalAudioSource;

    .line 266
    .line 267
    const/4 v0, 0x0

    .line 268
    invoke-static {p0, v0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 269
    .line 270
    .line 271
    :catch_2
    :cond_3
    return-void
.end method
