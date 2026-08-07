.class public Lcom/immomo/mediacore/sink/IjkWriter;
.super Lcom/immomo/mediacore/sink/SinkBase;
.source "SourceFile"


# static fields
.field private static final CLASS_LABEL:Ljava/lang/String; = "IjkWriter"

.field private static final LOG_TAG:Ljava/lang/String; = "IjkWriter"

.field public static final NETERROR:I = 0x12c

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static sLocalLibLoader:Ll/wfm;


# instance fields
.field private lastAudioBitrateCalcTimeMs:J

.field private lastVideoBitrateCalcTimeMs:J

.field private lastdts:J

.field private lastdts1:J

.field private lastpts:J

.field private lastpts1:J

.field private mAudioTimeStamp:J

.field private mAudioTimeStampBase:J

.field public mAverageSendBitRateB:J

.field public mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

.field protected mFPreparedSyncObject:Ljava/lang/Object;

.field private mLastError:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public mNativeMediaStreamer:J

.field private mOnlyAudio:Z

.field private mOutputUrl:Ljava/lang/String;

.field private mPreAudioTimeStamp:J

.field public mPreCacleBitRateTime:J

.field public mPreSendBitB:J

.field private mPreVideoTimeStamp:J

.field protected mProxyConfig:Ljava/lang/String;

.field protected mProxyMediaConfig:Ljava/lang/String;

.field private mSendAudioByte:J

.field private mSendVideoByte:J

.field private mUIHandler:Landroid/os/Handler;

.field private mVideoTimeStamp:J

.field private mVideoTimeStampBase:J

.field private pre_audioTotalSendBytes:J

.field private pre_videoTotalSendBytes:J

.field private startToGetAudioPacketsMs:J

.field private videoHeight:I

.field private videoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mediacore/sink/IjkWriter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mediacore/sink/IjkWriter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mediacore/sink/IjkWriter;->sLocalLibLoader:Ll/wfm;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/SinkBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mNativeMediaStreamer:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStampBase:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStampBase:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreAudioTimeStamp:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreVideoTimeStamp:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAverageSendBitRateB:J

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iput-boolean v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOnlyAudio:Z

    .line 32
    .line 33
    new-instance v3, Landroid/os/Handler;

    .line 34
    .line 35
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mUIHandler:Landroid/os/Handler;

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    iput-object v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOutputUrl:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mProxyConfig:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mProxyMediaConfig:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v4, Ljava/lang/Object;

    .line 52
    .line 53
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 57
    .line 58
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 59
    .line 60
    invoke-direct {v4, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 61
    .line 62
    .line 63
    iput-object v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mLastError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 64
    .line 65
    iput v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoWidth:I

    .line 66
    .line 67
    iput v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoHeight:I

    .line 68
    .line 69
    const-wide/16 v4, -0x1

    .line 70
    .line 71
    iput-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts1:J

    .line 72
    .line 73
    iput-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts1:J

    .line 74
    .line 75
    iput-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts:J

    .line 76
    .line 77
    iput-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts:J

    .line 78
    .line 79
    iput-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->startToGetAudioPacketsMs:J

    .line 80
    .line 81
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastAudioBitrateCalcTimeMs:J

    .line 82
    .line 83
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastVideoBitrateCalcTimeMs:J

    .line 84
    .line 85
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_audioTotalSendBytes:J

    .line 86
    .line 87
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_videoTotalSendBytes:J

    .line 88
    .line 89
    invoke-static {v3}, Lcom/immomo/mediacore/sink/IjkWriter;->loadLibrariesOnce(Ll/wfm;)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lcom/immomo/mediacore/sink/IjkWriter;->initNativeOnce()V

    .line 93
    .line 94
    .line 95
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, v0}, Lcom/immomo/mediacore/sink/IjkWriter;->native_setup(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iput-boolean p2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOnlyAudio:Z

    .line 104
    .line 105
    iput-object p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 106
    .line 107
    return-void
.end method

.method private native _getAcodecSendSize()J
.end method

.method private native _getPropertyFloat(IF)F
.end method

.method private native _getPropertyLong(IJ)J
.end method

.method private native _getRtmpSendSize()J
.end method

.method private native _getServerIpAddr()Ljava/lang/String;
.end method

.method private native _getVcodecSendSize()J
.end method

.method private native _getWriteByte()J
.end method

.method private native _release()V
.end method

.method private native _setAudioChannelNum(I)V
.end method

.method private native _setAudioEncoder(I)V
.end method

.method private native _setAudioEncodingBitRate(I)V
.end method

.method private native _setAudioSamplingRate(I)V
.end method

.method private native _setAudioSource(I)V
.end method

.method private native _setBitRateAdaptEnable(I)V
.end method

.method private native _setDropCache(III)V
.end method

.method private native _setPropertyFloat(IF)V
.end method

.method private native _setPropertyLong(IJ)V
.end method

.method private native _setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native _setVideoEncoder(I)V
.end method

.method private native _setVideoEncodingBitRate(I)V
.end method

.method private native _setVideoFrameRate(I)V
.end method

.method private native _setVideoSize(II)V
.end method

.method private native _setVideoSource(I)V
.end method

.method private native _start()V
.end method

.method private native _stop()V
.end method

.method public static synthetic access$000(Lcom/immomo/mediacore/sink/IjkWriter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/immomo/mediacore/sink/IjkWriter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private static initNativeOnce()V
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/sink/IjkWriter;->mIsNativeInitialized:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/mediacore/sink/IjkWriter;->native_init()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    sput-boolean v1, Lcom/immomo/mediacore/sink/IjkWriter;->mIsNativeInitialized:Z

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw v1
.end method

.method private static loadLibrariesOnce(Ll/wfm;)V
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/sink/IjkWriter;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/immomo/mediacore/sink/IjkWriter;->sLocalLibLoader:Ll/wfm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    :goto_0
    :try_start_1
    const-string v1, "ijkstreamer"

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ll/wfm;->loadLibrary(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/immomo/mediacore/sink/IjkWriter;->mIsLibLoaded:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catch_0
    const/4 p0, 0x0

    .line 25
    :try_start_2
    sput-boolean p0, Lcom/immomo/mediacore/sink/IjkWriter;->mIsLibLoaded:Z

    .line 26
    .line 27
    :cond_1
    :goto_1
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    throw p0
.end method

.method private final native native_finalize()V
.end method

.method private static final native native_init()V
.end method

.method private final native native_setup(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    invoke-interface {p4}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getWriter()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    iget-object p4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 22
    .line 23
    invoke-interface {p4}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getWriter()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    if-ne p0, p4, :cond_0

    .line 28
    .line 29
    iget-object p4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 30
    .line 31
    invoke-interface {p4, p1, p2, p3, p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const/16 p2, 0x12c

    .line 35
    .line 36
    if-ne p1, p2, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getLastError()Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    const/4 p3, 0x1

    .line 43
    invoke-virtual {p2, p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->notifyPrepared()V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/16 p2, 0x64

    .line 50
    .line 51
    if-ne p1, p2, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->notifyPrepared()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method private native setMaxDuration(I)V
.end method

.method private native setMaxFileSize(J)V
.end method


# virtual methods
.method public SabineEffectReset()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyEffectReset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyEffectSet(IIF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public native _prepare()V
.end method

.method public native _setMediaCodecEnable(I)V
.end method

.method public final native _writeAudio(JLjava/nio/ByteBuffer;J)V
.end method

.method public final native _writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
.end method

.method public final native _writeAudioPacket(JLjava/nio/ByteBuffer;J)V
.end method

.method public final native _writeVideo(JLjava/nio/ByteBuffer;J)V
.end method

.method public final native _writeVideoExtradata(Ljava/nio/ByteBuffer;J)V
.end method

.method public final native _writeVideoPacket(JLjava/nio/ByteBuffer;JZ)V
.end method

.method public final native _writeVideoPacket2(JJLjava/nio/ByteBuffer;JZ)V
.end method

.method public final native _writeVideoPacketWH(JLjava/nio/ByteBuffer;JZII)V
.end method

.method public adjustAef(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyAdjustAef(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyAdjustEQ(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEf(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyAdjustEf(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustTune(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyAdjustTune(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getAVDiff()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public getAcodecSendSize()J
    .locals 2

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_getAcodecSendSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-wide v0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    :goto_0
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    return-wide v0
.end method

.method public getAdapt()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized getAudioBitRate()I
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v2

    .line 8
    iget-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_audioTotalSendBytes:J

    .line 9
    .line 10
    cmp-long v6, v0, v4

    .line 11
    .line 12
    if-lez v6, :cond_0

    .line 13
    .line 14
    iget-wide v6, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastAudioBitrateCalcTimeMs:J

    .line 15
    .line 16
    cmp-long v8, v2, v6

    .line 17
    .line 18
    if-lez v8, :cond_0

    .line 19
    .line 20
    sub-long v4, v0, v4

    .line 21
    .line 22
    const-wide/16 v8, 0x8

    .line 23
    .line 24
    mul-long/2addr v4, v8

    .line 25
    sub-long v6, v2, v6

    .line 26
    .line 27
    div-long/2addr v4, v6

    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const-wide/16 v4, 0x0

    .line 32
    .line 33
    :goto_0
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_audioTotalSendBytes:J

    .line 34
    .line 35
    iput-wide v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastAudioBitrateCalcTimeMs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    long-to-int v0, v4

    .line 38
    monitor-exit p0

    .line 39
    return v0

    .line 40
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw v0
.end method

.method public getAudioCacheSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e29

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAudioTxbytes()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getAudioWritedDPackets()J
    .locals 3

    .line 1
    const/16 v0, 0x4e34

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAverageSendBitRateB()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAverageSendBitRateB:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLastError()Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mLastError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutputUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOutputUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPropertyFloat(IF)F
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/sink/IjkWriter;->_getPropertyFloat(IF)F

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getPropertyLong(IJ)J
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_getPropertyLong(IJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-wide p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    :goto_0
    const-wide/16 p0, 0x0

    .line 16
    .line 17
    return-wide p0
.end method

.method public getPublisherVideoHigh()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOnlyAudio:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-eqz p0, :cond_2

    .line 18
    .line 19
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    return v1
.end method

.method public getPublisherVideoWidth()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOnlyAudio:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-eqz p0, :cond_2

    .line 18
    .line 19
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    return v1
.end method

.method public getRtmpSendSize()J
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_getRtmpSendSize()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    cmp-long p0, v2, v0

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    return-wide v2

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_1
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    :goto_0
    return-wide v0
.end method

.method public getRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_getServerIpAddr()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getTxbytes()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getVcodecSendSize()J
    .locals 2

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_getVcodecSendSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-wide v0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    :goto_0
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    return-wide v0
.end method

.method public declared-synchronized getVideoBitRate()I
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    iget-wide v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_videoTotalSendBytes:J

    .line 11
    .line 12
    cmp-long v6, v0, v4

    .line 13
    .line 14
    if-lez v6, :cond_0

    .line 15
    .line 16
    iget-wide v6, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastVideoBitrateCalcTimeMs:J

    .line 17
    .line 18
    cmp-long v8, v2, v6

    .line 19
    .line 20
    if-lez v8, :cond_0

    .line 21
    .line 22
    sub-long v4, v0, v4

    .line 23
    .line 24
    const-wide/16 v8, 0x8

    .line 25
    .line 26
    mul-long/2addr v4, v8

    .line 27
    sub-long v6, v2, v6

    .line 28
    .line 29
    div-long/2addr v4, v6

    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const-wide/16 v4, 0x0

    .line 34
    .line 35
    :goto_0
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->pre_videoTotalSendBytes:J

    .line 36
    .line 37
    iput-wide v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastVideoBitrateCalcTimeMs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    long-to-int v0, v4

    .line 40
    monitor-exit p0

    .line 41
    return v0

    .line 42
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw v0
.end method

.method public getVideoCacheSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e26

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoPacketCache()J
    .locals 3

    .line 1
    const/16 v0, 0x4e25

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoPts()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVideoRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoTxbytes()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getWriteByte()J
    .locals 4

    .line 1
    const-string v0, "IjkWriter"

    .line 2
    .line 3
    const-string v1, "----getWriteByte: "

    .line 4
    .line 5
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_getWriteByte()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-wide v2

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :catch_1
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    goto :goto_2

    .line 33
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    :goto_2
    const-string p0, "----getWriteByte: ----0"

    .line 37
    .line 38
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    const-wide/16 v0, 0x0

    .line 42
    .line 43
    return-wide v0
.end method

.method public notifyPrepared()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public pause()V
    .locals 0

    return-void
.end method

.method public prepare()Z
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x4e20

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    :try_start_0
    invoke-virtual {p0, v4}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 9
    .line 10
    .line 11
    const-string v5, "zjlfound"

    .line 12
    .line 13
    const-string v6, "prepare:"

    .line 14
    .line 15
    invoke-static {v5, v6}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    iget-object v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mLastError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1

    .line 26
    :try_start_1
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_prepare()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    :try_start_2
    iget-object v6, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {v6, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v6

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    :goto_0
    :try_start_3
    monitor-exit v5

    .line 38
    goto :goto_4

    .line 39
    :goto_1
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    :try_start_4
    throw v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_1

    .line 41
    :catch_1
    move-exception v5

    .line 42
    goto :goto_2

    .line 43
    :catch_2
    move-exception v5

    .line 44
    goto :goto_3

    .line 45
    :goto_2
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    goto :goto_4

    .line 49
    :goto_3
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    :goto_4
    iget-object v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mLastError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    .line 54
    const/4 v6, 0x1

    .line 55
    invoke-virtual {v5, v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-eqz v5, :cond_0

    .line 60
    .line 61
    return v4

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getServerIpAddr()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v7

    .line 69
    sub-long/2addr v7, v0

    .line 70
    cmp-long v0, v7, v2

    .line 71
    .line 72
    if-ltz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mUIHandler:Landroid/os/Handler;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mUIHandler:Landroid/os/Handler;

    .line 81
    .line 82
    new-instance v1, Lcom/immomo/mediacore/sink/IjkWriter$2;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Lcom/immomo/mediacore/sink/IjkWriter$2;-><init>(Lcom/immomo/mediacore/sink/IjkWriter;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 88
    .line 89
    .line 90
    goto :goto_5

    .line 91
    :cond_1
    move v4, v6

    .line 92
    :goto_5
    const-string p0, "zjlfound"

    .line 93
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v1, "prepare:end ret :"

    .line 97
    .line 98
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    return v4
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mUIHandler:Landroid/os/Handler;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->notifyPrepared()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_1
    move-exception p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string p0, "zjlfound"

    .line 26
    .line 27
    const-string v0, "release:"

    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public resume()V
    .locals 0

    return-void
.end method

.method public setAudioChannelNum(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setAudioChannelNum(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setAudioEncoder(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setAudioEncoder(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setAudioEncodingBitRate(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setAudioEncodingBitRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setAudioSamplingRate(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setAudioSamplingRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setAudioSource(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setAudioSource(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setBitRateAdaptEnable(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setBitRateAdaptEnable(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setDropCache(III)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_setDropCache(III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setPropertyFloat(IF)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/sink/IjkWriter;->_setPropertyFloat(IF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setPropertyLong(IJ)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_setPropertyLong(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setProxyConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mProxyConfig:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setProxyMediaConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mProxyMediaConfig:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    iput-object p3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mOutputUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_1
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    :goto_0
    return-void
.end method

.method public setVideoEncoder(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setVideoEncoder(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setVideoEncodingBitRate(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setVideoEncodingBitRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setVideoFrameRate(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setVideoFrameRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setVideoSize(II)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/sink/IjkWriter;->_setVideoSize(II)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoWidth:I

    .line 5
    .line 6
    iput p2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_1
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :goto_0
    return-void
.end method

.method public setVideoSource(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/IjkWriter;->_setVideoSource(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public startRecording()V
    .locals 2

    .line 1
    const-string v0, "IjkWriter"

    .line 2
    .line 3
    const-string v1, "zjlfound startRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyRecording()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/strinf/NotifyCenter;->startSurroundMusic(Ljava/lang/String;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopRecording()V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 2

    .line 1
    const-string v0, "IjkWriter"

    .line 2
    .line 3
    const-string v1, "stopSurroundMusic:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->stopSurroundMusic()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public writeAudio(JLjava/nio/ByteBuffer;J)V
    .locals 1

    .line 1
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 2
    .line 3
    :try_start_0
    invoke-virtual/range {p0 .. p5}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeAudio(JLjava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    move-object p0, v0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_1
    move-exception v0

    .line 14
    move-object p0, v0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :goto_0
    return-void
.end method

.method public writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 2
    .line 3
    add-long/2addr v0, p2

    .line 4
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :goto_0
    return-void
.end method

.method public writeAudioPacket(JLjava/nio/ByteBuffer;II)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreAudioTimeStamp:J

    .line 2
    .line 3
    cmp-long p5, v0, p1

    .line 4
    .line 5
    if-lez p5, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreAudioTimeStamp:J

    .line 9
    .line 10
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 11
    .line 12
    iget-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 13
    .line 14
    int-to-long v4, p4

    .line 15
    add-long/2addr p1, v4

    .line 16
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendAudioByte:J

    .line 17
    .line 18
    iget-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->startToGetAudioPacketsMs:J

    .line 19
    .line 20
    const-wide/16 p4, -0x1

    .line 21
    .line 22
    cmp-long p1, p1, p4

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 27
    .line 28
    .line 29
    move-result-wide p1

    .line 30
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->startToGetAudioPacketsMs:J

    .line 31
    .line 32
    :cond_1
    :try_start_0
    iget-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 33
    .line 34
    move-object v0, p0

    .line 35
    move-object v3, p3

    .line 36
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeAudioPacket(JLjava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p0, v0

    .line 42
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_1
    move-exception v0

    .line 47
    move-object p0, v0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    :goto_0
    return-void
.end method

.method public writeVideo(JLjava/nio/ByteBuffer;J)V
    .locals 1

    .line 1
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 2
    .line 3
    :try_start_0
    invoke-virtual/range {p0 .. p5}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeVideo(JLjava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    move-object p0, v0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_1
    move-exception v0

    .line 14
    move-object p0, v0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :goto_0
    return-void
.end method

.method public writeVideoExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 2
    .line 3
    add-long/2addr v0, p2

    .line 4
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeVideoExtradata(Ljava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :goto_0
    return-void
.end method

.method public writeVideoPacket(JLjava/nio/ByteBuffer;IZ)V
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreVideoTimeStamp:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStampBase:J

    .line 10
    .line 11
    :cond_0
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreVideoTimeStamp:J

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStampBase:J

    .line 14
    .line 15
    add-long/2addr v0, p1

    .line 16
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 17
    .line 18
    iget-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 19
    .line 20
    int-to-long v4, p4

    .line 21
    add-long/2addr p1, v4

    .line 22
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 23
    .line 24
    iget-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 25
    .line 26
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    cmp-long p1, p1, v0

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide p1

    .line 36
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide p1

    .line 49
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 50
    .line 51
    sub-long/2addr p1, v0

    .line 52
    const-wide/16 v0, 0x3e8

    .line 53
    .line 54
    div-long/2addr p1, v0

    .line 55
    const-wide/16 v0, 0x1

    .line 56
    .line 57
    cmp-long p4, p1, v0

    .line 58
    .line 59
    if-lez p4, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    iget-wide v2, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 66
    .line 67
    sub-long/2addr v0, v2

    .line 68
    const-wide/16 v2, 0x8

    .line 69
    .line 70
    mul-long/2addr v0, v2

    .line 71
    const-wide/16 v2, 0x400

    .line 72
    .line 73
    mul-long/2addr p1, v2

    .line 74
    div-long/2addr v0, p1

    .line 75
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAverageSendBitRateB:J

    .line 76
    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide p1

    .line 81
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 84
    .line 85
    .line 86
    move-result-wide p1

    .line 87
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 88
    .line 89
    :cond_2
    :goto_0
    :try_start_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ll/csx;->K0()Z

    .line 94
    .line 95
    .line 96
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    iget-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 98
    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    :try_start_1
    iget v7, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoWidth:I

    .line 102
    .line 103
    iget v8, p0, Lcom/immomo/mediacore/sink/IjkWriter;->videoHeight:I

    .line 104
    .line 105
    move-object v0, p0

    .line 106
    move-object v3, p3

    .line 107
    move v6, p5

    .line 108
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeVideoPacketWH(JLjava/nio/ByteBuffer;JZII)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    move-object v0, p0

    .line 113
    move-object v3, p3

    .line 114
    move v6, p5

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeVideoPacket(JLjava/nio/ByteBuffer;JZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :catch_0
    move-exception v0

    .line 120
    move-object p0, v0

    .line 121
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catch_1
    move-exception v0

    .line 126
    move-object p0, v0

    .line 127
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 128
    .line 129
    .line 130
    :goto_1
    return-void
.end method

.method public writeVideoPacket2(JJLjava/nio/ByteBuffer;IZ)V
    .locals 15

    .line 1
    move-wide/from16 v1, p1

    .line 2
    .line 3
    move-wide/from16 v3, p3

    .line 4
    .line 5
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts1:J

    .line 6
    .line 7
    const-wide/16 v7, 0x0

    .line 8
    .line 9
    cmp-long v0, v5, v7

    .line 10
    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts1:J

    .line 14
    .line 15
    :cond_0
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts1:J

    .line 16
    .line 17
    cmp-long v0, v5, v7

    .line 18
    .line 19
    if-gez v0, :cond_1

    .line 20
    .line 21
    iput-wide v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts1:J

    .line 22
    .line 23
    :cond_1
    iput-wide v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts1:J

    .line 24
    .line 25
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts1:J

    .line 26
    .line 27
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreVideoTimeStamp:J

    .line 28
    .line 29
    cmp-long v0, v5, v1

    .line 30
    .line 31
    if-lez v0, :cond_2

    .line 32
    .line 33
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAudioTimeStamp:J

    .line 34
    .line 35
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStampBase:J

    .line 36
    .line 37
    :cond_2
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreVideoTimeStamp:J

    .line 38
    .line 39
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStampBase:J

    .line 40
    .line 41
    add-long/2addr v5, v1

    .line 42
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mVideoTimeStamp:J

    .line 43
    .line 44
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 45
    .line 46
    move/from16 v0, p6

    .line 47
    .line 48
    int-to-long v9, v0

    .line 49
    add-long/2addr v5, v9

    .line 50
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mSendVideoByte:J

    .line 51
    .line 52
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 53
    .line 54
    cmp-long v0, v5, v7

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 65
    .line 66
    .line 67
    move-result-wide v5

    .line 68
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v5

    .line 75
    iget-wide v11, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 76
    .line 77
    sub-long/2addr v5, v11

    .line 78
    const-wide/16 v11, 0x3e8

    .line 79
    .line 80
    div-long/2addr v5, v11

    .line 81
    const-wide/16 v11, 0x1

    .line 82
    .line 83
    cmp-long v0, v5, v11

    .line 84
    .line 85
    if-lez v0, :cond_4

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 88
    .line 89
    .line 90
    move-result-wide v11

    .line 91
    iget-wide v13, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 92
    .line 93
    sub-long/2addr v11, v13

    .line 94
    const-wide/16 v13, 0x8

    .line 95
    .line 96
    mul-long/2addr v11, v13

    .line 97
    const-wide/16 v13, 0x400

    .line 98
    .line 99
    mul-long/2addr v5, v13

    .line 100
    div-long/2addr v11, v5

    .line 101
    iput-wide v11, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mAverageSendBitRateB:J

    .line 102
    .line 103
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 104
    .line 105
    .line 106
    move-result-wide v5

    .line 107
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreCacleBitRateTime:J

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 110
    .line 111
    .line 112
    move-result-wide v5

    .line 113
    iput-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mPreSendBitB:J

    .line 114
    .line 115
    :cond_4
    :goto_0
    :try_start_0
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts:J

    .line 116
    .line 117
    cmp-long v0, v5, v7

    .line 118
    .line 119
    if-gez v0, :cond_5

    .line 120
    .line 121
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts:J

    .line 122
    .line 123
    :cond_5
    iget-wide v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts:J

    .line 124
    .line 125
    cmp-long v0, v5, v7

    .line 126
    .line 127
    if-gez v0, :cond_6

    .line 128
    .line 129
    iput-wide v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts:J

    .line 130
    .line 131
    :cond_6
    move-object v0, p0

    .line 132
    move-object/from16 v5, p5

    .line 133
    .line 134
    move/from16 v8, p7

    .line 135
    .line 136
    move-wide v6, v9

    .line 137
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/mediacore/sink/IjkWriter;->_writeVideoPacket2(JJLjava/nio/ByteBuffer;JZ)V

    .line 138
    .line 139
    .line 140
    iput-wide v3, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastpts:J

    .line 141
    .line 142
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/IjkWriter;->lastdts:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .line 144
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    move-object p0, v0

    .line 147
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :catch_1
    move-exception v0

    .line 152
    move-object p0, v0

    .line 153
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 154
    .line 155
    .line 156
    :goto_1
    return-void
.end method

.method public writeVideoTexture(ILjavax/microedition/khronos/egl/EGLContext;IIJ)V
    .locals 0

    return-void
.end method
