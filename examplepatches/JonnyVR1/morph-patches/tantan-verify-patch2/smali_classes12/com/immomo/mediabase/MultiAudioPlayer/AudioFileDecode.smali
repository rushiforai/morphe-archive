.class public Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioFileDecode"


# instance fields
.field private decodeFinish:Z

.field private isLoop:Z

.field private isPublish:Z

.field mAudioDuration:J

.field mAudioFormat:Landroid/media/MediaFormat;

.field private mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private mAudioResample:Lcom/immomo/mediabase/AudioResampleUtils;

.field mAudioTrackIndex:I

.field private mDecodeRunable:Ljava/lang/Runnable;

.field private mDecodeStarted:Z

.field private mDecodeThread:Ljava/lang/Thread;

.field private mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

.field private mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

.field private mEnableResample:Z

.field private mEndDeocdeTime:J

.field mExtractor:Landroid/media/MediaExtractor;

.field private mSourceFile:Ljava/lang/String;

.field private mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

.field private mStartDecodeTime:J

.field private mStopDecode:Z

.field private mTempBuffer:Ljava/nio/ByteBuffer;

.field private mutePlayback:Z

.field private muteSendout:Z

.field private notifyFinishFlag:Z

.field private notifyPlayStartFlag:Z

.field private pause:Z

.field private final pauseCondition:Ljava/util/concurrent/locks/Condition;

.field private final pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private pitch:I

.field private playId:I

.field private playbackVolume:F

.field private playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

.field private seekTime:J

.field private sendoutVolume:F

.field private totalSendSize:J


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/AudioParameter;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEnableResample:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    iput-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSourceFile:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioTrackIndex:I

    .line 18
    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    iput-wide v3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioDuration:J

    .line 22
    .line 23
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 24
    .line 25
    iput-wide v3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStartDecodeTime:J

    .line 26
    .line 27
    iput-wide v3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEndDeocdeTime:J

    .line 28
    .line 29
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStopDecode:Z

    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeThread:Ljava/lang/Thread;

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeStarted:Z

    .line 36
    .line 37
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioResample:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 40
    .line 41
    iput v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playId:I

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isLoop:Z

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isPublish:Z

    .line 46
    .line 47
    const/high16 v1, 0x3f800000    # 1.0f

    .line 48
    .line 49
    iput v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playbackVolume:F

    .line 50
    .line 51
    iput v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->sendoutVolume:F

    .line 52
    .line 53
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mutePlayback:Z

    .line 54
    .line 55
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->muteSendout:Z

    .line 56
    .line 57
    iput v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pitch:I

    .line 58
    .line 59
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pause:Z

    .line 60
    .line 61
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseCondition:Ljava/util/concurrent/locks/Condition;

    .line 73
    .line 74
    iput-wide v3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->totalSendSize:J

    .line 75
    .line 76
    iput-wide v3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->seekTime:J

    .line 77
    .line 78
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->decodeFinish:Z

    .line 79
    .line 80
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyFinishFlag:Z

    .line 81
    .line 82
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyPlayStartFlag:Z

    .line 83
    .line 84
    sget-object v0, Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;->UNINIT:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 87
    .line 88
    new-instance v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;-><init>(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeRunable:Ljava/lang/Runnable;

    .line 94
    .line 95
    const/16 v0, 0x4000

    .line 96
    .line 97
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 104
    .line 105
    const/16 v1, 0xa

    .line 106
    .line 107
    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 111
    .line 112
    new-instance v0, Lcom/immomo/mediabase/AudioParameter;

    .line 113
    .line 114
    invoke-direct {v0}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 118
    .line 119
    invoke-virtual {v0, p1}, Lcom/immomo/mediabase/AudioParameter;->copyOf(Lcom/immomo/mediabase/AudioParameter;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->seekTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1002(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->seekTime:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$1100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEndDeocdeTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1202(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->decodeFinish:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioResampleUtils;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioResample:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Lcom/immomo/mediabase/AudioResampleUtils;)Lcom/immomo/mediabase/AudioResampleUtils;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioResample:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEnableResample:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$402(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEnableResample:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStartDecodeTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$600(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;J)J
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->seekMusic(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$700(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$802(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;)Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$900(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStopDecode:Z

    .line 2
    .line 3
    return p0
.end method

.method private seekMusic(J)J
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_3

    .line 6
    .line 7
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-virtual {v2, p1, p2, v3}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 11
    .line 12
    .line 13
    :goto_0
    cmp-long v2, v0, p1

    .line 14
    .line 15
    if-gez v2, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->advance()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    const-wide/16 v4, -0x1

    .line 33
    .line 34
    cmp-long v4, v2, v4

    .line 35
    .line 36
    if-nez v4, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move-wide v0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "SEEK to "

    .line 44
    .line 45
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, " currentPos:"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "AudioFileDecode"

    .line 64
    .line 65
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_3
    return-wide v0
.end method


# virtual methods
.method public getCurrentPos()J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-wide v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->totalSendSize:J

    .line 20
    .line 21
    const-wide/16 v4, 0x3e8

    .line 22
    .line 23
    mul-long/2addr v2, v4

    .line 24
    int-to-long v4, v0

    .line 25
    div-long/2addr v2, v4

    .line 26
    int-to-long v0, v1

    .line 27
    div-long/2addr v2, v0

    .line 28
    const-wide/16 v0, 0x2

    .line 29
    .line 30
    div-long/2addr v2, v0

    .line 31
    return-wide v2

    .line 32
    :cond_0
    const-wide/16 v0, -0x1

    .line 33
    .line 34
    return-wide v0
.end method

.method public getDuration()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioDuration:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3e8

    .line 4
    .line 5
    div-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playId:I

    .line 2
    .line 3
    return p0
.end method

.method public getPitch()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pitch:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlayStatus()Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlaybackVolume()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playbackVolume:F

    .line 2
    .line 3
    return p0
.end method

.method public getSampleFrame()Ljava/nio/ByteBuffer;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-boolean v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyPlayStartFlag:Z

    .line 13
    .line 14
    if-nez v2, :cond_2

    .line 15
    .line 16
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 17
    .line 18
    invoke-interface {v2, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onPlayStart(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 19
    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyPlayStartFlag:Z

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    iget-boolean v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->decodeFinish:Z

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    iget-boolean v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyFinishFlag:Z

    .line 29
    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-interface {v2, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onPlayFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iput-boolean v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->notifyFinishFlag:Z

    .line 40
    .line 41
    :cond_2
    return-object v0
.end method

.method public getSendoutVolume()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->sendoutVolume:F

    .line 2
    .line 3
    return p0
.end method

.method public getSrcAudioParam()Lcom/immomo/mediabase/AudioParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSourceFile:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLoop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isLoop:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMutePlayback()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mutePlayback:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMuteSendout()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->muteSendout:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPublish()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isPublish:Z

    .line 2
    .line 3
    return p0
.end method

.method public pause()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pause:Z

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;->PAUSE:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public putSampleData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 7
    .line 8
    .line 9
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pause:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseCondition:Ljava/util/concurrent/locks/Condition;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto/16 :goto_9

    .line 21
    .line 22
    :catch_0
    move-exception v0

    .line 23
    goto :goto_2

    .line 24
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 27
    .line 28
    .line 29
    goto :goto_3

    .line 30
    :goto_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :goto_3
    const/16 v0, 0x800

    .line 35
    .line 36
    :try_start_2
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/nio/Buffer;->remaining()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ge v1, v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    mul-int/lit8 v1, v1, 0x2

    .line 53
    .line 54
    add-int/2addr v1, v0

    .line 55
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    goto :goto_5

    .line 70
    :catch_1
    move-exception p1

    .line 71
    goto :goto_4

    .line 72
    :cond_2
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 75
    .line 76
    .line 77
    goto :goto_5

    .line 78
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    :goto_5
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    :goto_6
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-lt p1, v0, :cond_4

    .line 93
    .line 94
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-virtual {v1, v2, v3, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    :try_start_3
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 109
    .line 110
    if-eqz v1, :cond_3

    .line 111
    .line 112
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 113
    .line 114
    invoke-interface {v1, p1, v2, v3, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onProcessFrame(Ljava/nio/ByteBuffer;JLcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 115
    .line 116
    .line 117
    goto :goto_7

    .line 118
    :catch_2
    move-exception p1

    .line 119
    goto :goto_8

    .line 120
    :cond_3
    :goto_7
    iget-object v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 121
    .line 122
    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iget-wide v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->totalSendSize:J

    .line 126
    .line 127
    const-wide/16 v3, 0x800

    .line 128
    .line 129
    add-long/2addr v1, v3

    .line 130
    iput-wide v1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->totalSendSize:J
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    .line 131
    .line 132
    goto :goto_6

    .line 133
    :goto_8
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 134
    .line 135
    .line 136
    goto :goto_6

    .line 137
    :cond_4
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mTempBuffer:Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :goto_9
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 146
    .line 147
    .line 148
    throw p1
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->stopDecode()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 13
    .line 14
    :cond_0
    const-string p0, "AudioFileDecode"

    .line 15
    .line 16
    const-string v0, "release: "

    .line 17
    .line 18
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pause:Z

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;->PLAY:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playstatus:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseCondition:Ljava/util/concurrent/locks/Condition;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public seek(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x3e8

    .line 6
    .line 7
    mul-long/2addr p1, v0

    .line 8
    iput-wide p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->seekTime:J

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDecodeSource(ILjava/lang/String;)Z
    .locals 9

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    .line 166
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->setDecodeSource(ILjava/lang/String;JJZZ)Z

    move-result p0

    return p0
.end method

.method public setDecodeSource(ILjava/lang/String;JJZZ)Z
    .locals 4

    .line 1
    const-string v0, "durationUs"

    .line 2
    .line 3
    const-string v1, "mime"

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-gez v2, :cond_0

    .line 11
    .line 12
    return v3

    .line 13
    :cond_0
    iput p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playId:I

    .line 14
    .line 15
    iput-object p2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSourceFile:Ljava/lang/String;

    .line 16
    .line 17
    iput-wide p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStartDecodeTime:J

    .line 18
    .line 19
    iput-wide p5, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEndDeocdeTime:J

    .line 20
    .line 21
    iput-boolean p7, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isLoop:Z

    .line 22
    .line 23
    iput-boolean p8, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isPublish:Z

    .line 24
    .line 25
    :try_start_0
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    new-instance p1, Landroid/media/MediaExtractor;

    .line 30
    .line 31
    invoke-direct {p1}, Landroid/media/MediaExtractor;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p1

    .line 38
    goto/16 :goto_3

    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSourceFile:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    move p2, v3

    .line 54
    :goto_1
    if-ge p2, p1, :cond_4

    .line 55
    .line 56
    iget-object p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 57
    .line 58
    invoke-virtual {p3, p2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    const-string p5, "audio"

    .line 67
    .line 68
    invoke-virtual {p4, p5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p4

    .line 72
    if-eqz p4, :cond_2

    .line 73
    .line 74
    iput p2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioTrackIndex:I

    .line 75
    .line 76
    iput-object p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 77
    .line 78
    invoke-virtual {p3, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-eqz p3, :cond_3

    .line 83
    .line 84
    iget-object p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 85
    .line 86
    invoke-virtual {p3, v0}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 87
    .line 88
    .line 89
    move-result-wide p3

    .line 90
    iput-wide p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioDuration:J

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    invoke-virtual {p3, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    const-string p4, "video"

    .line 98
    .line 99
    invoke-virtual {p3, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    :cond_3
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    iget p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioTrackIndex:I

    .line 106
    .line 107
    if-ltz p1, :cond_6

    .line 108
    .line 109
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 110
    .line 111
    if-eqz p1, :cond_6

    .line 112
    .line 113
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 114
    .line 115
    if-nez p1, :cond_5

    .line 116
    .line 117
    new-instance p1, Lcom/immomo/mediabase/AudioParameter;

    .line 118
    .line 119
    invoke-direct {p1}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 123
    .line 124
    :cond_5
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 125
    .line 126
    iget-object p2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 127
    .line 128
    const-string p3, "sample-rate"

    .line 129
    .line 130
    invoke-virtual {p2, p3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    invoke-virtual {p1, p2}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 140
    .line 141
    const-string p2, "channel-count"

    .line 142
    .line 143
    invoke-virtual {p0, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    invoke-virtual {p1, p0}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 148
    .line 149
    .line 150
    const/4 p0, 0x1

    .line 151
    return p0

    .line 152
    :cond_6
    return v3

    .line 153
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 157
    .line 158
    if-eqz p1, :cond_7

    .line 159
    .line 160
    const/4 p2, -0x1

    .line 161
    invoke-interface {p1, p2, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 162
    .line 163
    .line 164
    :cond_7
    return v3
.end method

.method public setDecodeSource(ILjava/lang/String;ZZ)Z
    .locals 9

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    .line 165
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->setDecodeSource(ILjava/lang/String;JJZZ)Z

    move-result p0

    return p0
.end method

.method public setDecoderListener(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 2
    .line 3
    return-void
.end method

.method public setEnableResample(ZLcom/immomo/mediabase/AudioParameter;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEnableResample:Z

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/immomo/mediabase/AudioParameter;

    .line 8
    .line 9
    invoke-direct {p1}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/immomo/mediabase/AudioParameter;->copyOf(Lcom/immomo/mediabase/AudioParameter;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setMutePlayback(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mutePlayback:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMuteSendout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->muteSendout:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPitch(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->pitch:I

    .line 2
    .line 3
    return-void
.end method

.method public setPlaybackVolume(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->playbackVolume:F

    .line 2
    .line 3
    return-void
.end method

.method public setSendoutVolume(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->sendoutVolume:F

    .line 2
    .line 3
    return-void
.end method

.method public startDecode()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 41
    invoke-virtual {p0, v0, v1, v0, v1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->startDecode(JJ)V

    return-void
.end method

.method public startDecode(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    mul-long/2addr p1, v0

    .line 4
    iput-wide p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStartDecodeTime:J

    .line 5
    .line 6
    mul-long/2addr p3, v0

    .line 7
    iput-wide p3, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mEndDeocdeTime:J

    .line 8
    .line 9
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeThread:Ljava/lang/Thread;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeStarted:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecoderListener:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-interface {p1, p2, p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->stopDecode()V

    .line 26
    .line 27
    .line 28
    :cond_1
    new-instance p1, Ljava/lang/Thread;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeRunable:Ljava/lang/Runnable;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeThread:Ljava/lang/Thread;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public stopDecode()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mStopDecode:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeThread:Ljava/lang/Thread;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    :goto_0
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mDecodeThread:Ljava/lang/Thread;

    .line 23
    .line 24
    :cond_0
    const-string p0, "AudioFileDecode"

    .line 25
    .line 26
    const-string v0, "stopDecode: "

    .line 27
    .line 28
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method
