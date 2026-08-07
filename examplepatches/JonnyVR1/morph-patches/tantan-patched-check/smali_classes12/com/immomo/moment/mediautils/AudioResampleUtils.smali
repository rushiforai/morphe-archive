.class public Lcom/immomo/moment/mediautils/AudioResampleUtils;
.super Ll/n7y;
.source "SourceFile"


# instance fields
.field mDstSampleBits:I

.field mDstSampleChannels:I

.field mDstSamplerate:I

.field private mPointer:J

.field private mResultBufer:Ljava/nio/ByteBuffer;

.field private mScalePointrer:J

.field mSync:Ljava/lang/Object;

.field private mTempBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/n7y;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mScalePointrer:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSamplerate:I

    .line 15
    .line 16
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleBits:I

    .line 17
    .line 18
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleChannels:I

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mSync:Ljava/lang/Object;

    .line 26
    .line 27
    return-void
.end method

.method private native nativeCreateNewSampler(IIIIII)J
.end method

.method private native nativeCreateNewScaler(III)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeReleaseScale(J)V
.end method

.method private native nativeResamplePcmData(J[BI[B)I
.end method

.method private native nativeScalePcmData(J[BIF[B)I
.end method


# virtual methods
.method public initResampleInfo(IIIIII)I
    .locals 2

    .line 1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iput p4, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSamplerate:I

    .line 5
    .line 6
    iput p6, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleBits:I

    .line 7
    .line 8
    iput p5, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleChannels:I

    .line 9
    .line 10
    invoke-direct/range {p0 .. p6}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeCreateNewSampler(IIIIII)J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 15
    .line 16
    const-wide/16 p3, 0x0

    .line 17
    .line 18
    cmp-long p0, p1, p3

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, -0x1

    .line 23
    monitor-exit v1

    .line 24
    return p0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    move-object p0, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    monitor-exit v1

    .line 30
    return p0

    .line 31
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public initScaleInfo(III)I
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeCreateNewScaler(III)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mScalePointrer:J

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    cmp-long p0, p1, v0

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public release()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v5, v1, v3

    .line 9
    .line 10
    if-eqz v5, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeRelease(J)V

    .line 13
    .line 14
    .line 15
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mScalePointrer:J

    .line 21
    .line 22
    cmp-long v3, v1, v3

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    invoke-direct {p0, v1, v2}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeReleaseScale(J)V

    .line 27
    .line 28
    .line 29
    :cond_1
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public resamplePcmData([BI[B)I
    .locals 8

    .line 103
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mSync:Ljava/lang/Object;

    monitor-enter v1

    .line 104
    :try_start_0
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_0

    move-object v2, p0

    move-object v5, p1

    move v6, p2

    move-object v7, p3

    .line 105
    invoke-direct/range {v2 .. v7}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeResamplePcmData(J[BI[B)I

    move-result p0

    monitor-exit v1

    return p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    .line 106
    monitor-exit v1

    return p0

    .line 107
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public resamplePcmData([BI)Ljava/nio/ByteBuffer;
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 5
    .line 6
    const-wide/16 v4, 0x0

    .line 7
    .line 8
    cmp-long v0, v2, v4

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    mul-int/lit8 v0, p2, 0x8

    .line 14
    .line 15
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleChannels:I

    .line 16
    .line 17
    mul-int/2addr v0, v3

    .line 18
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleBits:I

    .line 19
    .line 20
    mul-int/2addr v0, v3

    .line 21
    div-int/lit8 v0, v0, 0x8

    .line 22
    .line 23
    iget-object v3, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eq v3, v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    move-object p0, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 47
    .line 48
    .line 49
    iget-wide v5, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mPointer:J

    .line 50
    .line 51
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 54
    .line 55
    .line 56
    move-result-object v9

    .line 57
    move-object v4, p0

    .line 58
    move-object v7, p1

    .line 59
    move v8, p2

    .line 60
    invoke-direct/range {v4 .. v9}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeResamplePcmData(J[BI[B)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-lez p0, :cond_2

    .line 65
    .line 66
    iget p1, v4, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleBits:I

    .line 67
    .line 68
    mul-int/2addr p0, p1

    .line 69
    iget p1, v4, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mDstSampleChannels:I

    .line 70
    .line 71
    mul-int/2addr p0, p1

    .line 72
    div-int/lit8 p0, p0, 0x8

    .line 73
    .line 74
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p1, v4, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    iget-object p1, v4, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mResultBufer:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 93
    .line 94
    .line 95
    monitor-exit v1

    .line 96
    return-object p0

    .line 97
    :cond_2
    monitor-exit v1

    .line 98
    return-object v2

    .line 99
    :cond_3
    monitor-exit v1

    .line 100
    return-object v2

    .line 101
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    throw p0
.end method

.method public scalePcmData(Ljava/nio/ByteBuffer;IFLjava/nio/ByteBuffer;)I
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mScalePointrer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ge v0, p2, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p1, v2, v1, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/AudioResampleUtils;->mScalePointrer:J

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->array()[B

    .line 54
    .line 55
    .line 56
    move-result-object v9

    .line 57
    move-object v3, p0

    .line 58
    move v7, p2

    .line 59
    move v8, p3

    .line 60
    invoke-direct/range {v3 .. v9}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->nativeScalePcmData(J[BIF[B)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string p2, "ret value is "

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string p2, "AudioResamplesUtils"

    .line 79
    .line 80
    invoke-static {p2, p1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    return p0

    .line 84
    :cond_2
    const/4 p0, -0x1

    .line 85
    return p0
.end method
