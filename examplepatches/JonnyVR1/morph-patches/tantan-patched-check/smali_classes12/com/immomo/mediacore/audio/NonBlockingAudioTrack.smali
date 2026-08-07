.class public Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "NonBlockingAudioTrack"


# instance fields
.field private mAudioTrack:Landroid/media/AudioTrack;

.field private mBufferSizeInFrames:I

.field private mFrameSize:I

.field private mIsPlayAudioTrack:Z

.field private mNumBytesQueued:I

.field private mNumFramesSubmitted:I

.field private mQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;",
            ">;"
        }
    .end annotation
.end field

.field private mSampleRate:I

.field private mThread:Ljava/lang/Thread;

.field private mThreadStarted:Z

.field private mWriteMorePending:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(II)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mWriteMorePending:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThreadStarted:Z

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-object v2, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThread:Ljava/lang/Thread;

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mIsPlayAudioTrack:Z

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    if-eq p2, v1, :cond_2

    .line 28
    .line 29
    if-eq p2, v0, :cond_1

    .line 30
    .line 31
    const/4 v1, 0x6

    .line 32
    if-ne p2, v1, :cond_0

    .line 33
    .line 34
    const/16 v1, 0xfc

    .line 35
    .line 36
    :goto_0
    move v5, v1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    throw p0

    .line 43
    :cond_1
    const/16 v1, 0xc

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v1, 0x4

    .line 47
    goto :goto_0

    .line 48
    :goto_1
    invoke-static {p1, v5, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    mul-int/lit8 v7, v1, 0x2

    .line 53
    .line 54
    new-instance v2, Landroid/media/AudioTrack;

    .line 55
    .line 56
    const/4 v6, 0x2

    .line 57
    const/4 v8, 0x1

    .line 58
    const/4 v3, 0x3

    .line 59
    move v4, p1

    .line 60
    invoke-direct/range {v2 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 64
    .line 65
    iput v4, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mSampleRate:I

    .line 66
    .line 67
    mul-int/2addr p2, v0

    .line 68
    iput p2, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mFrameSize:I

    .line 69
    .line 70
    div-int/2addr v7, p2

    .line 71
    iput v7, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mBufferSizeInFrames:I

    .line 72
    .line 73
    new-instance p1, Ljava/lang/Thread;

    .line 74
    .line 75
    new-instance p2, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;

    .line 76
    .line 77
    invoke-direct {p2, p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;-><init>(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V

    .line 78
    .line 79
    .line 80
    const-string v0, "live-media-NBTrack"

    .line 81
    .line 82
    invoke-direct {p1, p2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThread:Ljava/lang/Thread;

    .line 86
    .line 87
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThreadStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->process()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method private cancelWriteMore()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mWriteMorePending:Z

    .line 3
    .line 4
    return-void
.end method

.method private playAudioTrack()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mIsPlayAudioTrack:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mIsPlayAudioTrack:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mIsPlayAudioTrack:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private process()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mWriteMorePending:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->writeMore()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private scheduleWriteMore()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mWriteMorePending:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 13
    .line 14
    sub-int/2addr v1, v0

    .line 15
    mul-int/lit16 v1, v1, 0x3e8

    .line 16
    .line 17
    iget v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mSampleRate:I

    .line 18
    .line 19
    div-int/2addr v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :catch_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mWriteMorePending:Z

    .line 22
    .line 23
    return-void
.end method

.method private writeMore()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 17
    .line 18
    sub-int/2addr v1, v0

    .line 19
    iget v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mBufferSizeInFrames:I

    .line 20
    .line 21
    sub-int/2addr v0, v1

    .line 22
    iget v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mFrameSize:I

    .line 23
    .line 24
    mul-int/2addr v0, v1

    .line 25
    :cond_1
    :goto_0
    if-lez v0, :cond_5

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->getAudioData()Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    iget v2, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->size:I

    .line 35
    .line 36
    if-le v2, v0, :cond_3

    .line 37
    .line 38
    move v2, v0

    .line 39
    :cond_3
    iget-object v3, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 40
    .line 41
    iget-object v4, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->data:[B

    .line 42
    .line 43
    iget v5, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->offset:I

    .line 44
    .line 45
    invoke-virtual {v3, v4, v5, v2}, Landroid/media/AudioTrack;->write([BII)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->playAudioTrack()V

    .line 50
    .line 51
    .line 52
    iget v4, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 53
    .line 54
    iget v5, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mFrameSize:I

    .line 55
    .line 56
    div-int/2addr v3, v5

    .line 57
    add-int/2addr v4, v3

    .line 58
    iput v4, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 59
    .line 60
    iget v3, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->size:I

    .line 61
    .line 62
    sub-int/2addr v3, v2

    .line 63
    iput v3, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->size:I

    .line 64
    .line 65
    sub-int/2addr v0, v2

    .line 66
    iget v4, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 67
    .line 68
    sub-int/2addr v4, v2

    .line 69
    iput v4, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 70
    .line 71
    if-nez v3, :cond_4

    .line 72
    .line 73
    iget-object v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    iget v3, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->offset:I

    .line 83
    .line 84
    add-int/2addr v3, v2

    .line 85
    iput v3, v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->offset:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :catch_0
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_6

    .line 95
    .line 96
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->scheduleWriteMore()V

    .line 97
    .line 98
    .line 99
    :cond_6
    :goto_2
    return-void
.end method


# virtual methods
.method public getAudioData()Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-object v0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public getAudioTimeUs()J
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-long v0, v0

    .line 8
    const-wide/32 v2, 0xf4240

    .line 9
    .line 10
    .line 11
    mul-long/2addr v0, v2

    .line 12
    iget p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mSampleRate:I

    .line 13
    .line 14
    int-to-long v2, p0

    .line 15
    div-long/2addr v0, v2

    .line 16
    return-wide v0
.end method

.method public getNumBytesQueued()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlayState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public pause()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->cancelWriteMore()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/media/AudioTrack;->pause()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public play()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThread:Ljava/lang/Thread;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->playAudioTrack()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->cancelWriteMore()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->stop()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThreadStarted:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 17
    .line 18
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->cancelWriteMore()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mThreadStarted:Z

    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mAudioTrack:Landroid/media/AudioTrack;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    :catch_0
    iput v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumFramesSubmitted:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 17
    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 20
    .line 21
    return-void
.end method

.method public write([BI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;-><init>(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->data:[B

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, v0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->offset:I

    .line 10
    .line 11
    iput p2, v0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->size:I

    .line 12
    .line 13
    iget p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 14
    .line 15
    add-int/2addr p1, p2

    .line 16
    iput p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mNumBytesQueued:I

    .line 17
    .line 18
    iget-object p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/16 p2, 0xa

    .line 25
    .line 26
    if-le p1, p2, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->mQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method
