.class public Lcom/momo/mcamera/util/fft/AudioRecordThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field private index:I

.field private lightningEngineFilter:Lcom/momo/mcamera/mask/LightningEngineFilter;

.field private mAccuracy:I

.field private mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mSoundInputFilter:Lcom/momo/mcamera/mask/SoundInputFilter;

.field private mSpectrum:Lcom/momo/mcamera/util/fft/Spectrum;

.field private textureHeight:I

.field private textureName:Ljava/lang/String;

.field private textureWidth:I

.field private thread_running:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->thread_running:Z

    .line 6
    .line 7
    new-instance v0, Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/mcamera/util/fft/AudioRecorder;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 13
    .line 14
    new-instance v0, Lcom/momo/mcamera/util/fft/Spectrum;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/momo/mcamera/util/fft/Spectrum;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mSpectrum:Lcom/momo/mcamera/util/fft/Spectrum;

    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureName:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureWidth:I

    .line 27
    .line 28
    iput v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureHeight:I

    .line 29
    .line 30
    iput v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->index:I

    .line 31
    .line 32
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mHandler:Landroid/os/Handler;

    .line 35
    .line 36
    iput p3, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 37
    .line 38
    return-void
.end method

.method private getFreqByFFT(Lcom/momo/mcamera/util/fft/FFT;[S)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    iget v1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->index:I

    .line 6
    .line 7
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/momo/mcamera/util/fft/AudioRecorder;->getBufferReadResult()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget v3, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->index:I

    .line 14
    .line 15
    add-int/2addr v2, v3

    .line 16
    if-ge v1, v2, :cond_0

    .line 17
    .line 18
    sub-int v2, v1, v3

    .line 19
    .line 20
    sub-int v3, v1, v3

    .line 21
    .line 22
    aget-short v3, p2, v3

    .line 23
    .line 24
    int-to-float v3, v3

    .line 25
    const v4, 0x46fffe00    # 32767.0f

    .line 26
    .line 27
    .line 28
    div-float/2addr v3, v4

    .line 29
    aput v3, v0, v2

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/momo/mcamera/util/fft/AudioRecorder;->getBufferReadResult()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    add-int/2addr v3, p2

    .line 41
    iput v3, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->index:I

    .line 42
    .line 43
    iget p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 44
    .line 45
    if-lt v3, p2, :cond_9

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    iput p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->index:I

    .line 49
    .line 50
    move v1, p2

    .line 51
    :goto_1
    iget v2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 52
    .line 53
    div-int/lit8 v3, v2, 0x2

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    if-ge v1, v3, :cond_2

    .line 57
    .line 58
    int-to-float v3, v1

    .line 59
    float-to-double v5, v3

    .line 60
    const-wide v7, 0x400921fb54442d18L    # Math.PI

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    mul-double/2addr v5, v7

    .line 66
    div-int/lit8 v2, v2, 0x2

    .line 67
    .line 68
    int-to-float v2, v2

    .line 69
    float-to-double v2, v2

    .line 70
    div-double/2addr v5, v2

    .line 71
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 76
    .line 77
    mul-double/2addr v2, v5

    .line 78
    add-double/2addr v2, v5

    .line 79
    double-to-float v2, v2

    .line 80
    iget v3, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 81
    .line 82
    div-int/lit8 v5, v3, 0x2

    .line 83
    .line 84
    if-le v1, v5, :cond_1

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_1
    move v4, v2

    .line 88
    :goto_2
    div-int/lit8 v2, v3, 0x2

    .line 89
    .line 90
    add-int/2addr v2, v1

    .line 91
    aget v5, v0, v2

    .line 92
    .line 93
    mul-float/2addr v5, v4

    .line 94
    aput v5, v0, v2

    .line 95
    .line 96
    div-int/lit8 v3, v3, 0x2

    .line 97
    .line 98
    sub-int/2addr v3, v1

    .line 99
    aget v2, v0, v3

    .line 100
    .line 101
    mul-float/2addr v2, v4

    .line 102
    aput v2, v0, v3

    .line 103
    .line 104
    add-int/lit8 v1, v1, 0x1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    aput v4, v0, p2

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/util/fft/FFT;->forward([F)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->specSize()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    new-array v0, v0, [F

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->specSize()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    new-array v1, v1, [I

    .line 123
    .line 124
    move v2, p2

    .line 125
    move v3, v2

    .line 126
    :goto_3
    invoke-virtual {p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->specSize()I

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    const v6, 0x472c4400    # 44100.0f

    .line 131
    .line 132
    .line 133
    if-ge v2, v5, :cond_4

    .line 134
    .line 135
    invoke-virtual {p1, v2}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBand(I)F

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    const/high16 v7, 0x3f800000    # 1.0f

    .line 140
    .line 141
    add-float/2addr v5, v7

    .line 142
    float-to-double v7, v5

    .line 143
    invoke-static {v7, v8}, Ljava/lang/Math;->log10(D)D

    .line 144
    .line 145
    .line 146
    move-result-wide v7

    .line 147
    double-to-float v5, v7

    .line 148
    aput v5, v0, v2

    .line 149
    .line 150
    int-to-float v5, v2

    .line 151
    iget v7, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 152
    .line 153
    int-to-float v7, v7

    .line 154
    div-float/2addr v6, v7

    .line 155
    mul-float/2addr v5, v6

    .line 156
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    aput v5, v1, v2

    .line 161
    .line 162
    invoke-virtual {p1, v2}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBand(I)F

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    cmpl-float v5, v5, v4

    .line 167
    .line 168
    if-lez v5, :cond_3

    .line 169
    .line 170
    invoke-virtual {p1, v2}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBand(I)F

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    move v4, v3

    .line 175
    move v3, v2

    .line 176
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_4
    int-to-float p1, v3

    .line 180
    iget v1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 181
    .line 182
    int-to-float v1, v1

    .line 183
    div-float/2addr v6, v1

    .line 184
    mul-float/2addr p1, v6

    .line 185
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 186
    .line 187
    .line 188
    const/16 p1, 0x800

    .line 189
    .line 190
    :try_start_0
    new-array p1, p1, [B

    .line 191
    .line 192
    move v1, p2

    .line 193
    :goto_4
    const/4 v2, 0x2

    .line 194
    if-ge v1, v2, :cond_7

    .line 195
    .line 196
    move v2, p2

    .line 197
    :goto_5
    const/16 v3, 0x100

    .line 198
    .line 199
    if-ge v2, v3, :cond_6

    .line 200
    .line 201
    mul-int/lit16 v3, v1, 0x100

    .line 202
    .line 203
    add-int/2addr v3, v2

    .line 204
    aget v3, v0, v3

    .line 205
    .line 206
    const/high16 v4, 0x43000000    # 128.0f

    .line 207
    .line 208
    mul-float/2addr v3, v4

    .line 209
    const/high16 v4, 0x437f0000    # 255.0f

    .line 210
    .line 211
    cmpl-float v4, v3, v4

    .line 212
    .line 213
    const/16 v5, 0xff

    .line 214
    .line 215
    if-lez v4, :cond_5

    .line 216
    .line 217
    move v3, v5

    .line 218
    goto :goto_6

    .line 219
    :cond_5
    float-to-int v3, v3

    .line 220
    :goto_6
    mul-int/lit16 v4, v1, 0x400

    .line 221
    .line 222
    mul-int/lit8 v6, v2, 0x4

    .line 223
    .line 224
    add-int/2addr v4, v6

    .line 225
    and-int/lit16 v6, v3, 0xff

    .line 226
    .line 227
    int-to-byte v6, v6

    .line 228
    aput-byte v6, p1, v4

    .line 229
    .line 230
    add-int/lit8 v6, v4, 0x1

    .line 231
    .line 232
    shr-int/lit8 v7, v3, 0x8

    .line 233
    .line 234
    and-int/2addr v7, v5

    .line 235
    int-to-byte v7, v7

    .line 236
    aput-byte v7, p1, v6

    .line 237
    .line 238
    add-int/lit8 v6, v4, 0x2

    .line 239
    .line 240
    shr-int/lit8 v7, v3, 0x10

    .line 241
    .line 242
    and-int/2addr v5, v7

    .line 243
    int-to-byte v5, v5

    .line 244
    aput-byte v5, p1, v6

    .line 245
    .line 246
    add-int/lit8 v4, v4, 0x3

    .line 247
    .line 248
    shr-int/lit8 v3, v3, 0x18

    .line 249
    .line 250
    int-to-byte v3, v3

    .line 251
    aput-byte v3, p1, v4

    .line 252
    .line 253
    add-int/lit8 v2, v2, 0x1

    .line 254
    .line 255
    goto :goto_5

    .line 256
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_7
    iget-object p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mSoundInputFilter:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 260
    .line 261
    if-eqz p2, :cond_8

    .line 262
    .line 263
    invoke-virtual {p2, p1}, Lcom/momo/mcamera/mask/SoundInputFilter;->setSoundBytes([B)V

    .line 264
    .line 265
    .line 266
    :cond_8
    iget-object p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->lightningEngineFilter:Lcom/momo/mcamera/mask/LightningEngineFilter;

    .line 267
    .line 268
    if-eqz p2, :cond_9

    .line 269
    .line 270
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureName:Ljava/lang/String;

    .line 271
    .line 272
    iget v1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureWidth:I

    .line 273
    .line 274
    iget p0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureHeight:I

    .line 275
    .line 276
    invoke-virtual {p2, v0, p1, v1, p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->setTextureData(Ljava/lang/String;[BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :catch_0
    move-exception p0

    .line 281
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 282
    .line 283
    .line 284
    :cond_9
    return-void
.end method


# virtual methods
.method public restartThread()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/util/fft/AudioRecorder;->startRecorder()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->thread_running:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    :goto_0
    iget-boolean v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->thread_running:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 6
    .line 7
    iget v1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/util/fft/AudioRecorder;->setAccuracy(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/momo/mcamera/util/fft/AudioRecorder;->startRecorder()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/mcamera/util/fft/AudioRecorder;->getSamples()[S

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mSpectrum:Lcom/momo/mcamera/util/fft/Spectrum;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lcom/momo/mcamera/util/fft/Spectrum;->setSignalSamples([S)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Lcom/momo/mcamera/util/fft/FFT;

    .line 29
    .line 30
    iget v2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAccuracy:I

    .line 31
    .line 32
    const v3, 0x472c4400    # 44100.0f

    .line 33
    .line 34
    .line 35
    invoke-direct {v1, v2, v3}, Lcom/momo/mcamera/util/fft/FFT;-><init>(IF)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, v1, v0}, Lcom/momo/mcamera/util/fft/AudioRecordThread;->getFreqByFFT(Lcom/momo/mcamera/util/fft/FFT;[S)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public setLightningFilter(Ljava/lang/String;IILcom/momo/mcamera/mask/LightningEngineFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureName:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->lightningEngineFilter:Lcom/momo/mcamera/mask/LightningEngineFilter;

    .line 4
    .line 5
    iput p2, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureWidth:I

    .line 6
    .line 7
    iput p3, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->textureHeight:I

    .line 8
    .line 9
    return-void
.end method

.method public setSoundInputFilter(Lcom/momo/mcamera/mask/SoundInputFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mSoundInputFilter:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 2
    .line 3
    return-void
.end method

.method public stopThread()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->mAudioRecorder:Lcom/momo/mcamera/util/fft/AudioRecorder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/util/fft/AudioRecorder;->stopRecorder()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/util/fft/AudioRecordThread;->thread_running:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
