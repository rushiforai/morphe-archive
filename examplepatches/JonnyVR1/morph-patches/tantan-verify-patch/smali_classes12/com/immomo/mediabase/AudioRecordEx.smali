.class public Lcom/immomo/mediabase/AudioRecordEx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mAudioRecord:Landroid/media/AudioRecord;

.field private mAudioSource:I

.field private mAudiobufferSize:I

.field private mIsHaveAudioData:Z

.field private mIsRecording:Z

.field private mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

.field private mRecordRunable:Ljava/lang/Runnable;

.field private mRecordThread:Ljava/lang/Thread;

.field private mSampleBits:I

.field private mSampleChannels:I

.field private mSampleRate:I

.field private mSyncObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, "AudioRecordEx"

    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->TAG:Ljava/lang/String;

    const v0, 0xac44

    .line 55
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleRate:I

    const/16 v0, 0x10

    .line 56
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleBits:I

    const/4 v0, 0x1

    .line 57
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleChannels:I

    const/4 v1, 0x0

    .line 58
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    const/4 v2, 0x0

    .line 59
    iput v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudiobufferSize:I

    .line 60
    iput-boolean v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 61
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 62
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 63
    iput-boolean v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsHaveAudioData:Z

    .line 64
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSyncObj:Ljava/lang/Object;

    .line 65
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioSource:I

    .line 66
    new-instance v0, Lcom/immomo/mediabase/AudioRecordEx$1;

    invoke-direct {v0, p0}, Lcom/immomo/mediabase/AudioRecordEx$1;-><init>(Lcom/immomo/mediabase/AudioRecordEx;)V

    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordRunable:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioRecordEx"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const v0, 0xac44

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleRate:I

    .line 12
    .line 13
    const/16 v0, 0x10

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleBits:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleChannels:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudiobufferSize:I

    .line 25
    .line 26
    iput-boolean v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 27
    .line 28
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 31
    .line 32
    iput-boolean v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsHaveAudioData:Z

    .line 33
    .line 34
    new-instance v1, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSyncObj:Ljava/lang/Object;

    .line 40
    .line 41
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioSource:I

    .line 42
    .line 43
    new-instance v0, Lcom/immomo/mediabase/AudioRecordEx$1;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lcom/immomo/mediabase/AudioRecordEx$1;-><init>(Lcom/immomo/mediabase/AudioRecordEx;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordRunable:Ljava/lang/Runnable;

    .line 49
    .line 50
    iput p1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioSource:I

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/mediabase/AudioRecordEx;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/immomo/mediabase/AudioRecordEx;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudiobufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/immomo/mediabase/AudioRecordEx;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsHaveAudioData:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/immomo/mediabase/AudioRecordEx;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/immomo/mediabase/AudioRecordEx;)Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public checkAudioCaptureStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsHaveAudioData:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioSession()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getAudioSessionId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public openRecorderDevice(IIII)Z
    .locals 7

    .line 1
    iput p2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleBits:I

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleRate:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleChannels:I

    .line 6
    .line 7
    iput p4, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudiobufferSize:I

    .line 8
    .line 9
    mul-int/lit8 p2, p1, 0x78

    .line 10
    .line 11
    div-int/lit16 p2, p2, 0x3e8

    .line 12
    .line 13
    mul-int/lit8 p2, p2, 0x20

    .line 14
    .line 15
    shr-int/lit8 p2, p2, 0x3

    .line 16
    .line 17
    const/16 p4, 0x10

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p3, v0, :cond_0

    .line 21
    .line 22
    const/16 p3, 0xc

    .line 23
    .line 24
    move v4, p3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v4, p4

    .line 27
    :goto_0
    invoke-static {p1, v4, v0}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    mul-int/2addr p1, p4

    .line 32
    if-ge p2, p1, :cond_1

    .line 33
    .line 34
    move v6, p1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v6, p2

    .line 37
    :goto_1
    :try_start_0
    new-instance v1, Landroid/media/AudioRecord;

    .line 38
    .line 39
    iget v2, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioSource:I

    .line 40
    .line 41
    iget v3, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSampleRate:I

    .line 42
    .line 43
    const/4 v5, 0x2

    .line 44
    invoke-direct/range {v1 .. v6}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :catch_0
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public releaseRecoding()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/mediabase/AudioRecordEx;->stopRecording()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mAudioRecord:Landroid/media/AudioRecord;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSyncObj:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public setOnFrameAvailabelCallback(Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mOnFrameAvailabelCallback:Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

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

.method public startRecording()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Thread;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordRunable:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-string v2, "AudioRecorderThread"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public stopRecording()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mIsRecording:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 18
    .line 19
    .line 20
    :goto_0
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx;->mRecordThread:Ljava/lang/Thread;

    .line 22
    .line 23
    :cond_0
    return-void
.end method
