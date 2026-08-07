.class final Lcom/momo/xengine/media/AudioProcessorImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IAudioProcessor;


# instance fields
.field private audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

.field pointer:J

.field private final trackList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/AudioTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->trackList:Ljava/util/List;

    .line 10
    .line 11
    monitor-enter p0

    .line 12
    :try_start_0
    invoke-direct {p0}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeCreate()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw v0
.end method

.method private native nativeApply(JLjava/util/List;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/AudioTrack;",
            ">;)Z"
        }
    .end annotation
.end method

.method private native nativeCreate()J
.end method

.method private native nativeInit(JIII)V
.end method

.method private native nativeNext(J[BI)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSeek(JJ)V
.end method


# virtual methods
.method public declared-synchronized apply()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :try_start_1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->trackList:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeApply(JLjava/util/List;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    monitor-exit p0

    .line 23
    return v0

    .line 24
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    :try_start_3
    throw v0

    .line 26
    :catchall_1
    move-exception v0

    .line 27
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 28
    throw v0
.end method

.method public getTracks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/AudioTrack;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->trackList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized init(Lcom/momo/xengine/media/types/AudioFormat;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 3
    :try_start_1
    iget-wide v2, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, v2, v0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getValue()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/SampleFormat;->getValue()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleRate()I

    .line 30
    .line 31
    .line 32
    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 33
    move-object v1, p0

    .line 34
    :try_start_2
    invoke-direct/range {v1 .. v6}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeInit(JIII)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    :goto_0
    move-object p0, v0

    .line 40
    goto :goto_2

    .line 41
    :catchall_1
    move-exception v0

    .line 42
    move-object v1, p0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-object v1, p0

    .line 45
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    monitor-exit v1

    .line 47
    return-void

    .line 48
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    :try_start_4
    throw p0

    .line 50
    :catchall_2
    move-exception v0

    .line 51
    :goto_3
    move-object p0, v0

    .line 52
    goto :goto_4

    .line 53
    :catchall_3
    move-exception v0

    .line 54
    move-object v1, p0

    .line 55
    goto :goto_3

    .line 56
    :goto_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 57
    throw p0
.end method

.method public next([B)J
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-wide v0

    .line 6
    :cond_0
    array-length v2, p1

    .line 7
    if-nez v2, :cond_1

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_1
    array-length v2, p1

    .line 11
    iget-object v3, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/momo/xengine/media/types/AudioFormat;->getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Lcom/momo/xengine/media/types/SampleFormat;->getSampleBit()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    div-int/2addr v2, v3

    .line 22
    iget-object v3, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->audioFormat:Lcom/momo/xengine/media/types/AudioFormat;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/momo/xengine/media/types/AudioFormat;->getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getChannelNum()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    div-int/2addr v2, v3

    .line 33
    monitor-enter p0

    .line 34
    :try_start_0
    iget-wide v3, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 35
    .line 36
    cmp-long v5, v3, v0

    .line 37
    .line 38
    if-eqz v5, :cond_2

    .line 39
    .line 40
    invoke-direct {p0, v3, v4, p1, v2}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeNext(J[BI)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    :goto_0
    monitor-exit p0

    .line 48
    return-wide v0

    .line 49
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p1
.end method

.method public declared-synchronized release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :try_start_1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v4, v0, v2

    .line 8
    .line 9
    if-eqz v4, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeRelease(J)V

    .line 12
    .line 13
    .line 14
    iput-wide v2, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    :try_start_3
    throw v0

    .line 24
    :catchall_1
    move-exception v0

    .line 25
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 26
    throw v0
.end method

.method public declared-synchronized seek(J)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :try_start_1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioProcessorImpl;->pointer:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xengine/media/AudioProcessorImpl;->nativeSeek(JJ)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    :try_start_3
    throw p1

    .line 22
    :catchall_1
    move-exception p1

    .line 23
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 24
    throw p1
.end method
