.class final Lcom/momo/xengine/media/SoundTouchImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/ISoundTouch;


# static fields
.field private static final DEFAULT_SIZE:I = 0x2000


# instance fields
.field private audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

.field private final cache:Lcom/momo/xengine/media/utils/RingBuffer;

.field private pointer:J

.field private receiveBuffer:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xengine/media/utils/RingBuffer;

    .line 5
    .line 6
    const/16 v1, 0x66

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/momo/xengine/media/utils/RingBuffer;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->cache:Lcom/momo/xengine/media/utils/RingBuffer;

    .line 12
    .line 13
    const/16 v0, 0x2000

    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->receiveBuffer:[B

    .line 18
    .line 19
    monitor-enter p0

    .line 20
    :try_start_0
    invoke-direct {p0}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeCreate()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw v0
.end method

.method private native nativeClear(J)V
.end method

.method private native nativeCreate()J
.end method

.method private native nativeFlush(J)V
.end method

.method private native nativePutSamples(J[BI)V
.end method

.method private native nativeReceiveSamples(J[BI)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetChannels(JI)V
.end method

.method private native nativeSetPitchSemiTones(JI)V
.end method

.method private native nativeSetRate(JD)V
.end method

.method private native nativeSetSampleFormat(JI)V
.end method

.method private native nativeSetSampleRate(JJ)V
.end method

.method private native nativeSetSetting(JII)V
.end method

.method private native nativeSetSpeed(JD)V
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeClear(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public declared-synchronized flush()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeFlush(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public declared-synchronized init(Lcom/momo/xengine/media/types/AudioFormat;)V
    .locals 4
    .param p1    # Lcom/momo/xengine/media/types/AudioFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :try_start_1
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    :try_start_2
    iget-object v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :cond_1
    :try_start_3
    iput-object p1, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/momo/xengine/media/types/SampleFormat;->getValue()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetSampleFormat(JI)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getValue()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetChannels(JI)V

    .line 47
    .line 48
    .line 49
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleRate()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    int-to-long v2, p1

    .line 56
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetSampleRate(JJ)V

    .line 57
    .line 58
    .line 59
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 60
    monitor-exit p0

    .line 61
    return-void

    .line 62
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 63
    :try_start_5
    throw p1

    .line 64
    :catchall_1
    move-exception p1

    .line 65
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 66
    throw p1
.end method

.method public declared-synchronized putSamples([BI)V
    .locals 4
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativePutSamples(J[BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized receiveSamples(I)Lcom/momo/xengine/media/types/AudioFrame;
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-object v1

    .line 13
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-object v1

    .line 19
    :cond_1
    :try_start_2
    invoke-virtual {v0, p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSamplesSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->receiveBuffer:[B

    .line 24
    .line 25
    array-length v2, v2

    .line 26
    if-ge v2, v0, :cond_2

    .line 27
    .line 28
    new-array v2, v0, [B

    .line 29
    .line 30
    iput-object v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->receiveBuffer:[B

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    :goto_0
    iget-wide v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 36
    .line 37
    iget-object v4, p0, Lcom/momo/xengine/media/SoundTouchImpl;->receiveBuffer:[B

    .line 38
    .line 39
    invoke-direct {p0, v2, v3, v4, p1}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeReceiveSamples(J[BI)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    long-to-int v2, v2

    .line 44
    if-lez v2, :cond_3

    .line 45
    .line 46
    iget-object v3, p0, Lcom/momo/xengine/media/SoundTouchImpl;->cache:Lcom/momo/xengine/media/utils/RingBuffer;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/momo/xengine/media/SoundTouchImpl;->receiveBuffer:[B

    .line 49
    .line 50
    iget-object v5, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 51
    .line 52
    invoke-virtual {v5, v2}, Lcom/momo/xengine/media/types/AudioFormat;->getSamplesSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-virtual {v3, v4, v5, v2}, Lcom/momo/xengine/media/utils/RingBuffer;->write([BII)I

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->cache:Lcom/momo/xengine/media/utils/RingBuffer;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-lt v2, v0, :cond_4

    .line 67
    .line 68
    new-array v0, v0, [B

    .line 69
    .line 70
    iget-object v1, p0, Lcom/momo/xengine/media/SoundTouchImpl;->cache:Lcom/momo/xengine/media/utils/RingBuffer;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Lcom/momo/xengine/media/utils/RingBuffer;->read([B)I

    .line 73
    .line 74
    .line 75
    new-instance v1, Lcom/momo/xengine/media/types/AudioFrame;

    .line 76
    .line 77
    invoke-direct {v1}, Lcom/momo/xengine/media/types/AudioFrame;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v0}, Lcom/momo/xengine/media/types/AudioFrame;->setData([B)V

    .line 81
    .line 82
    .line 83
    int-to-long v2, p1

    .line 84
    invoke-virtual {v1, v2, v3}, Lcom/momo/xengine/media/types/AudioFrame;->setSamples(J)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {v1, p1}, Lcom/momo/xengine/media/types/AudioFrame;->setSampleFormat(Lcom/momo/xengine/media/types/SampleFormat;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {v1, p1}, Lcom/momo/xengine/media/types/AudioFrame;->setChannelLayout(Lcom/momo/xengine/media/types/AudioChannelLayout;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleRate()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    invoke-virtual {v1, p1}, Lcom/momo/xengine/media/types/AudioFrame;->setSamplesRate(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    .line 113
    .line 114
    monitor-exit p0

    .line 115
    return-object v1

    .line 116
    :cond_4
    monitor-exit p0

    .line 117
    return-object v1

    .line 118
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 119
    throw p1
.end method

.method public declared-synchronized release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public declared-synchronized setPitchSemiTones(I)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetPitchSemiTones(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized setRate(D)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetRate(JD)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized setSetting(II)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetSetting(JII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized setSpeed(D)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/SoundTouchImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xengine/media/SoundTouchImpl;->nativeSetSpeed(JD)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method
