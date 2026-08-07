.class public Lcom/immomo/mediabase/AudioPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;,
        Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;,
        Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;,
        Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;
    }
.end annotation


# static fields
.field private static STATUS_PAUSE:I = 0x2

.field private static STATUS_RUNNING:I = 0x1


# instance fields
.field audioAvailableBufferCountCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;

.field audioOriginPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;

.field audioPlayerThread:Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

.field audioPlayingPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;

.field private mAudioBits:I

.field private mAudioBufSize:I

.field private mAudioBuffer:[B

.field private mAudioChannels:I

.field private mAudioDataList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/immomo/mediabase/PacketData;",
            ">;"
        }
    .end annotation
.end field

.field private mAudioPlayer:Landroid/media/AudioTrack;

.field private mAudioProcessorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediabase/AudioProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private mAudioSampleRate:I

.field private mCurrentStatus:I

.field private mDataSizeInBuffer:I

.field private volatile mExit:Z

.field private mIsPaused:Z

.field private mStreamType:I

.field private syncObj:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioSampleRate:I

    .line 9
    .line 10
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioChannels:I

    .line 11
    .line 12
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBits:I

    .line 13
    .line 14
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBuffer:[B

    .line 17
    .line 18
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mIsPaused:Z

    .line 21
    .line 22
    new-instance v0, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance v0, Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioDataList:Ljava/util/LinkedList;

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mExit:Z

    .line 37
    .line 38
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mCurrentStatus:I

    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    iput v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mStreamType:I

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediabase/AudioPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/AudioPlayer;->mExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/immomo/mediabase/AudioPlayer;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioDataList:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/immomo/mediabase/AudioPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioPlayer;->mCurrentStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300()I
    .locals 1

    .line 1
    sget v0, Lcom/immomo/mediabase/AudioPlayer;->STATUS_RUNNING:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$400(Lcom/immomo/mediabase/AudioPlayer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/immomo/mediabase/AudioPlayer;Lcom/immomo/mediabase/PacketData;)Lcom/immomo/mediabase/PacketData;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/mediabase/AudioPlayer;->audioProcess(Lcom/immomo/mediabase/PacketData;)Lcom/immomo/mediabase/PacketData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private declared-synchronized audioProcess(Lcom/immomo/mediabase/PacketData;)Lcom/immomo/mediabase/PacketData;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioProcessorList:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/immomo/mediabase/AudioProcessor;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/immomo/mediabase/PacketData;->getFrameBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/immomo/mediabase/PacketData;->getFrameBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-wide v3, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 38
    .line 39
    invoke-virtual {v1, p1, v2, v3, v4}, Lcom/immomo/mediabase/AudioProcessor;->processAudioFrame(Lcom/immomo/mediabase/PacketData;IJ)Lcom/immomo/mediabase/PacketData;

    .line 40
    .line 41
    .line 42
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-object p1

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    monitor-exit p0

    .line 50
    return-object p1

    .line 51
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p1
.end method


# virtual methods
.method public declared-synchronized addAudioProcessList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/mediabase/AudioProcessor;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioProcessorList:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized addAudioProcessor(Lcom/immomo/mediabase/AudioProcessor;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioProcessorList:Ljava/util/List;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioProcessorList:Ljava/util/List;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioProcessorList:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public getMiniBufferSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 2
    .line 3
    return p0
.end method

.method public pause()V
    .locals 1

    .line 1
    sget v0, Lcom/immomo/mediabase/AudioPlayer;->STATUS_PAUSE:I

    .line 2
    .line 3
    iput v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mCurrentStatus:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mIsPaused:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public prepare(III)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    goto :goto_4

    .line 9
    :cond_0
    iput p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioSampleRate:I

    .line 10
    .line 11
    iput p2, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBits:I

    .line 12
    .line 13
    iput p3, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioChannels:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne p3, v1, :cond_1

    .line 17
    .line 18
    const/16 p3, 0xc

    .line 19
    .line 20
    :goto_0
    move v5, p3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const/4 p3, 0x4

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    const/16 p3, 0x10

    .line 25
    .line 26
    if-ne p2, p3, :cond_2

    .line 27
    .line 28
    :goto_2
    move v6, v1

    .line 29
    goto :goto_3

    .line 30
    :cond_2
    const/4 v1, 0x3

    .line 31
    goto :goto_2

    .line 32
    :goto_3
    :try_start_0
    invoke-static {p1, v5, v6}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 37
    .line 38
    new-instance v2, Landroid/media/AudioTrack;

    .line 39
    .line 40
    iget v3, p0, Lcom/immomo/mediabase/AudioPlayer;->mStreamType:I

    .line 41
    .line 42
    iget v4, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioSampleRate:I

    .line 43
    .line 44
    iget v7, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 45
    .line 46
    const/4 v8, 0x1

    .line 47
    invoke-direct/range {v2 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/media/AudioTrack;->play()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    iget p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 56
    .line 57
    new-array p1, p1, [B

    .line 58
    .line 59
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBuffer:[B

    .line 60
    .line 61
    new-instance p1, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;-><init>(Lcom/immomo/mediabase/AudioPlayer;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayerThread:Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 69
    .line 70
    .line 71
    sget p1, Lcom/immomo/mediabase/AudioPlayer;->STATUS_RUNNING:I

    .line 72
    .line 73
    iput p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mCurrentStatus:I

    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :catch_0
    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 79
    .line 80
    :cond_3
    :goto_4
    return v0
.end method

.method public release()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mExit:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayerThread:Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    :try_start_1
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    :try_start_2
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayerThread:Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayerThread:Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;

    .line 23
    .line 24
    const-wide/16 v1, 0x32

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/lang/Thread;->join(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catch_0
    move-exception v0

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 34
    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 35
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioDataList:Ljava/util/LinkedList;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioDataList:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/media/AudioTrack;->flush()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayingPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    invoke-interface {p0, v1, v2}, Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;->onAudioPlayingPosition(J)V

    .line 26
    .line 27
    .line 28
    :cond_1
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public resume()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mIsPaused:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mIsPaused:Z

    .line 14
    .line 15
    :cond_0
    sget v0, Lcom/immomo/mediabase/AudioPlayer;->STATUS_RUNNING:I

    .line 16
    .line 17
    iput v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mCurrentStatus:I

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public setAudioOriginPtsCallbackListener(Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->audioOriginPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioPlayingPtsCallbackListener(Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->audioPlayingPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioRestBufferCountCallbackListener(Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer;->audioAvailableBufferCountCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;

    .line 2
    .line 3
    return-void
.end method

.method public setStreamType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/AudioPlayer;->mStreamType:I

    .line 2
    .line 3
    return-void
.end method

.method public writeAudio(Lcom/immomo/mediabase/PacketData;)V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    monitor-enter v0

    if-eqz p1, :cond_0

    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioDataList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 54
    iget-object p0, p0, Lcom/immomo/mediabase/AudioPlayer;->syncObj:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 55
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public writeAudio(Ljava/nio/ByteBuffer;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 8
    .line 9
    iget v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 10
    .line 11
    sub-int/2addr v0, v1

    .line 12
    :goto_0
    if-lez p2, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBuffer:[B

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-lt p2, v0, :cond_0

    .line 18
    .line 19
    iget v3, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 20
    .line 21
    invoke-virtual {p1, v1, v3, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    sub-int/2addr p2, v0

    .line 25
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBuffer:[B

    .line 28
    .line 29
    iget v3, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioTrack;->write([BII)I

    .line 32
    .line 33
    .line 34
    iput v2, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 35
    .line 36
    iget v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioBufSize:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget v3, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 40
    .line 41
    invoke-virtual {p1, v1, v3, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    iget v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 45
    .line 46
    add-int/2addr v1, p2

    .line 47
    iput v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mDataSizeInBuffer:I

    .line 48
    .line 49
    move p2, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public writeAudio([BI)V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 57
    :cond_0
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mAudioPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v1, p1, v0, p2}, Landroid/media/AudioTrack;->write([BII)I

    move-result v1

    if-ltz v1, :cond_1

    add-int/2addr v0, v1

    sub-int/2addr p2, v1

    :cond_1
    if-ltz v1, :cond_2

    if-lez p2, :cond_2

    .line 58
    iget-boolean v1, p0, Lcom/immomo/mediabase/AudioPlayer;->mIsPaused:Z

    if-eqz v1, :cond_0

    :cond_2
    return-void
.end method
