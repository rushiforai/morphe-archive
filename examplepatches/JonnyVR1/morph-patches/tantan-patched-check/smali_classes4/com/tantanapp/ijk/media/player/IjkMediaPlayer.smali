.class public final Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;
.super Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;,
        Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;,
        Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;,
        Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;,
        Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;
    }
.end annotation


# static fields
.field public static final FFP_PROPV_DECODER_AVCODEC:I = 0x1

.field public static final FFP_PROPV_DECODER_MEDIACODEC:I = 0x2

.field public static final FFP_PROPV_DECODER_UNKNOWN:I = 0x0

.field public static final FFP_PROPV_DECODER_VIDEOTOOLBOX:I = 0x3

.field public static final FFP_PROP_FLOAT_DROP_FRAME_RATE:I = 0x2717

.field public static final FFP_PROP_FLOAT_PLAYBACK_RATE:I = 0x2713

.field public static final FFP_PROP_INT64_ASYNC_STATISTIC_BUF_BACKWARDS:I = 0x4ee9

.field public static final FFP_PROP_INT64_ASYNC_STATISTIC_BUF_CAPACITY:I = 0x4eeb

.field public static final FFP_PROP_INT64_ASYNC_STATISTIC_BUF_FORWARDS:I = 0x4eea

.field public static final FFP_PROP_INT64_AUDIO_CACHED_BYTES:I = 0x4e28

.field public static final FFP_PROP_INT64_AUDIO_CACHED_DURATION:I = 0x4e26

.field public static final FFP_PROP_INT64_AUDIO_CACHED_PACKETS:I = 0x4e2a

.field public static final FFP_PROP_INT64_AUDIO_DECODER:I = 0x4e24

.field public static final FFP_PROP_INT64_BIT_RATE:I = 0x4e84

.field public static final FFP_PROP_INT64_CACHE_STATISTIC_COUNT_BYTES:I = 0x4ef0

.field public static final FFP_PROP_INT64_CACHE_STATISTIC_FILE_FORWARDS:I = 0x4eee

.field public static final FFP_PROP_INT64_CACHE_STATISTIC_FILE_POS:I = 0x4eef

.field public static final FFP_PROP_INT64_CACHE_STATISTIC_PHYSICAL_POS:I = 0x4eed

.field public static final FFP_PROP_INT64_IMMEDIATE_RECONNECT:I = 0x4ef3

.field public static final FFP_PROP_INT64_LATEST_SEEK_LOAD_DURATION:I = 0x4f4c

.field public static final FFP_PROP_INT64_LOGICAL_FILE_SIZE:I = 0x4ef1

.field public static final FFP_PROP_INT64_SELECTED_AUDIO_STREAM:I = 0x4e22

.field public static final FFP_PROP_INT64_SELECTED_TIMEDTEXT_STREAM:I = 0x4e2b

.field public static final FFP_PROP_INT64_SELECTED_VIDEO_STREAM:I = 0x4e21

.field public static final FFP_PROP_INT64_SHARE_CACHE_DATA:I = 0x4ef2

.field public static final FFP_PROP_INT64_TCP_SPEED:I = 0x4ee8

.field public static final FFP_PROP_INT64_TRAFFIC_STATISTIC_BYTE_COUNT:I = 0x4eec

.field public static final FFP_PROP_INT64_VIDEO_CACHED_BYTES:I = 0x4e27

.field public static final FFP_PROP_INT64_VIDEO_CACHED_DURATION:I = 0x4e25

.field public static final FFP_PROP_INT64_VIDEO_CACHED_PACKETS:I = 0x4e29

.field public static final FFP_PROP_INT64_VIDEO_DECODER:I = 0x4e23

.field public static final IJK_LOG_DEBUG:I = 0x3

.field public static final IJK_LOG_DEFAULT:I = 0x1

.field public static final IJK_LOG_ERROR:I = 0x6

.field public static final IJK_LOG_FATAL:I = 0x7

.field public static final IJK_LOG_INFO:I = 0x4

.field public static final IJK_LOG_SILENT:I = 0x8

.field public static final IJK_LOG_UNKNOWN:I = 0x0

.field public static final IJK_LOG_VERBOSE:I = 0x2

.field public static final IJK_LOG_WARN:I = 0x5

.field private static final MEDIA_BUFFERING_UPDATE:I = 0x3

.field private static final MEDIA_ERROR:I = 0x64

.field private static final MEDIA_INFO:I = 0xc8

.field private static final MEDIA_NOP:I = 0x0

.field private static final MEDIA_PLAYBACK_COMPLETE:I = 0x2

.field private static final MEDIA_PREPARED:I = 0x1

.field private static final MEDIA_SEEK_COMPLETE:I = 0x4

.field protected static final MEDIA_SET_VIDEO_SAR:I = 0x2711

.field private static final MEDIA_SET_VIDEO_SIZE:I = 0x5

.field private static final MEDIA_TIMED_TEXT:I = 0x63

.field public static final OPT_CATEGORY_CODEC:I = 0x2

.field public static final OPT_CATEGORY_FORMAT:I = 0x1

.field public static final OPT_CATEGORY_PLAYER:I = 0x4

.field public static final OPT_CATEGORY_SWS:I = 0x3

.field public static final PROP_FLOAT_VIDEO_DECODE_FRAMES_PER_SECOND:I = 0x2711

.field public static final PROP_FLOAT_VIDEO_OUTPUT_FRAMES_PER_SECOND:I = 0x2712

.field public static final SDL_FCC_RV16:I = 0x36315652

.field public static final SDL_FCC_RV32:I = 0x32335652

.field public static final SDL_FCC_YV12:I = 0x32315659

.field private static final TAG:Ljava/lang/String; = "com.tantanapp.ijk.media.player.IjkMediaPlayer"

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static final sLocalLibLoader:Lcom/tantanapp/ijk/media/player/IjkLibLoader;


# instance fields
.field private mDataSource:Ljava/lang/String;

.field private mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

.field private mListenerContext:I
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeAndroidIO:J
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeMediaDataSource:J
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeMediaPlayer:J
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeSurfaceTexture:I
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mOnControlMessageListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

.field private mOnMediaCodecSelectListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

.field private mOnNativeInvokeListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;

.field private mScreenOnWhilePlaying:Z

.field private mStayAwake:Z

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mVideoHeight:I

.field private mVideoSarDen:I

.field private mVideoSarNum:I

.field private mVideoWidth:I

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Lcom/tantanapp/ijk/media/player/IjkLibLoader;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 10
    .line 11
    sput-boolean v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    sget-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Lcom/tantanapp/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;-><init>(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->initPlayer(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private native _getAudioCodecInfo()Ljava/lang/String;
.end method

.method private static native _getColorFormatName(I)Ljava/lang/String;
.end method

.method private native _getLoopCount()I
.end method

.method private native _getMediaMeta()Landroid/os/Bundle;
.end method

.method private native _getPropertyFloat(IF)F
.end method

.method private native _getPropertyLong(IJ)J
.end method

.method private native _getVideoCodecInfo()Ljava/lang/String;
.end method

.method private native _pause()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _release()V
.end method

.method private native _reset()V
.end method

.method private native _setAndroidIOCallback(Lcom/tantanapp/ijk/media/player/misc/IAndroidIO;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _setDataSource(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _setDataSourceFd(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _setFrameAtTime(Ljava/lang/String;JJII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _setLoopCount(I)V
.end method

.method private native _setOption(ILjava/lang/String;J)V
.end method

.method private native _setOption(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native _setPropertyFloat(IF)V
.end method

.method private native _setPropertyLong(IJ)V
.end method

.method private native _setStreamSelected(IZ)V
.end method

.method private native _setVideoSurface(Landroid/view/Surface;)V
.end method

.method private native _start()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private native _stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public static synthetic access$000(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mNativeMediaPlayer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$402(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$500(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$502(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p1
.end method

.method public static getColorFormatName(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getColorFormatName(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static initNativeOnce()V
    .locals 2

    .line 1
    const-class v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->native_init()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    sput-boolean v1, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

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

.method private initPlayer(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->initNativeOnce()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;-><init>(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    new-instance v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;-><init>(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 37
    .line 38
    :goto_0
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->native_setup(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static loadLibrariesOnce(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V
    .locals 2

    .line 1
    const-class v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Lcom/tantanapp/ijk/media/player/IjkLibLoader;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    const-string v1, "ttffmpeg"

    .line 16
    .line 17
    invoke-interface {p0, v1}, Lcom/tantanapp/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "ttsdl"

    .line 21
    .line 22
    invoke-interface {p0, v1}, Lcom/tantanapp/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v1, "ttplayer"

    .line 26
    .line 27
    invoke-interface {p0, v1}, Lcom/tantanapp/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v1, "ttffmpegapi"

    .line 31
    .line 32
    invoke-interface {p0, v1}, Lcom/tantanapp/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    sput-boolean p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 37
    .line 38
    :cond_1
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method private native native_finalize()V
.end method

.method private static native native_init()V
.end method

.method private native native_message_loop(Ljava/lang/Object;)V
.end method

.method public static native native_profileBegin(Ljava/lang/String;)V
.end method

.method public static native native_profileEnd()V
.end method

.method public static native native_setLogLevel(I)V
.end method

.method private native native_setup(Ljava/lang/Object;)V
.end method

.method private static onNativeInvoke(Ljava/lang/Object;ILandroid/os/Bundle;)Z
    .locals 3
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_6

    .line 3
    .line 4
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz v1, :cond_6

    .line 7
    .line 8
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 15
    .line 16
    if-eqz p0, :cond_5

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnNativeInvokeListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v1, p1, p2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;->onNativeInvoke(ILandroid/os/Bundle;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return v2

    .line 30
    :cond_0
    const v1, 0x20007

    .line 31
    .line 32
    .line 33
    if-eq p1, v1, :cond_1

    .line 34
    .line 35
    return v0

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    return v0

    .line 41
    :cond_2
    const-string p1, "segment_index"

    .line 42
    .line 43
    const/4 v1, -0x1

    .line 44
    invoke-virtual {p2, p1, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-ltz p1, :cond_4

    .line 49
    .line 50
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;->onControlResolveSegmentUrl(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    const-string p1, "url"

    .line 57
    .line 58
    invoke-virtual {p2, p1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return v2

    .line 62
    :cond_3
    new-instance p0, Ljava/io/IOException;

    .line 63
    .line 64
    const-string p1, "onNativeInvoke() = <NULL newUrl>"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return v0

    .line 73
    :cond_4
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 74
    .line 75
    const-string p1, "onNativeInvoke(invalid segment index)"

    .line 76
    .line 77
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p0

    .line 81
    :cond_5
    const-string p0, "<null weakPlayer>.onNativeInvoke()"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return v0

    .line 87
    :cond_6
    const-string p0, "<null weakThiz>.onNativeInvoke()"

    .line 88
    .line 89
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return v0
.end method

.method private static onSelectCodec(Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    sget-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;->sInstance:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;

    .line 25
    .line 26
    :cond_2
    invoke-interface {v0, p0, p1, p2, p3}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;->onMediaCodecSelect(Lcom/tantanapp/ijk/media/player/IMediaPlayer;Ljava/lang/String;II)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_3
    :goto_0
    return-object v0
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 1
    .annotation build Lcom/tantanapp/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/16 v0, 0xc8

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p2, v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->start()V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 36
    .line 37
    .line 38
    :cond_3
    :goto_0
    return-void
.end method

.method private setDataSource(Ljava/io/FileDescriptor;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 166
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    return-void
.end method

.method private stayAwake(Z)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mStayAwake:Z

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private updateSurfaceScreenOn()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mStayAwake:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->setKeepScreenOn(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method


# virtual methods
.method public native _prepareAsync()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public deselectTrack(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setStreamSelected(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->native_finalize()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getAsyncStatisticBufBackwards()J
    .locals 3

    .line 1
    const/16 v0, 0x4ee9

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAsyncStatisticBufCapacity()J
    .locals 3

    .line 1
    const/16 v0, 0x4eeb

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAsyncStatisticBufForwards()J
    .locals 3

    .line 1
    const/16 v0, 0x4eea

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioCachedBytes()J
    .locals 3

    .line 1
    const/16 v0, 0x4e28

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioCachedDuration()J
    .locals 3

    .line 1
    const/16 v0, 0x4e26

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioCachedPackets()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2a

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public native getAudioSessionId()I
.end method

.method public getBitRate()J
    .locals 3

    .line 1
    const/16 v0, 0x4e84

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCacheStatisticCountBytes()J
    .locals 3

    .line 1
    const/16 v0, 0x4ef0

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCacheStatisticFileForwards()J
    .locals 3

    .line 1
    const/16 v0, 0x4eee

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCacheStatisticFilePos()J
    .locals 3

    .line 1
    const/16 v0, 0x4eef

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCacheStatisticPhysicalPos()J
    .locals 3

    .line 1
    const/16 v0, 0x4eed

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public native getCurrentPosition()J
.end method

.method public getDataSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDropFrameRate()F
    .locals 2

    .line 1
    const/16 v0, 0x2717

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public native getDuration()J
.end method

.method public getFileSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4ef1

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getMediaInfo()Lcom/tantanapp/ijk/media/player/MediaInfo;
    .locals 8

    .line 1
    new-instance v0, Lcom/tantanapp/ijk/media/player/MediaInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/ijk/media/player/MediaInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ijkplayer"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mMediaPlayerName:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getVideoCodecInfo()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, ""

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    const-string v5, ","

    .line 22
    .line 23
    const/4 v6, 0x1

    .line 24
    const/4 v7, 0x0

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    array-length v2, v1

    .line 32
    if-lt v2, v4, :cond_0

    .line 33
    .line 34
    aget-object v2, v1, v7

    .line 35
    .line 36
    iput-object v2, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mVideoDecoder:Ljava/lang/String;

    .line 37
    .line 38
    aget-object v1, v1, v6

    .line 39
    .line 40
    iput-object v1, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mVideoDecoderImpl:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    array-length v2, v1

    .line 44
    if-lt v2, v6, :cond_1

    .line 45
    .line 46
    aget-object v1, v1, v7

    .line 47
    .line 48
    iput-object v1, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mVideoDecoder:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v3, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mVideoDecoderImpl:Ljava/lang/String;

    .line 51
    .line 52
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getAudioCodecInfo()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    array-length v2, v1

    .line 67
    if-lt v2, v4, :cond_2

    .line 68
    .line 69
    aget-object v2, v1, v7

    .line 70
    .line 71
    iput-object v2, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mAudioDecoder:Ljava/lang/String;

    .line 72
    .line 73
    aget-object v1, v1, v6

    .line 74
    .line 75
    iput-object v1, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mAudioDecoderImpl:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    array-length v2, v1

    .line 79
    if-lt v2, v6, :cond_3

    .line 80
    .line 81
    aget-object v1, v1, v7

    .line 82
    .line 83
    iput-object v1, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mAudioDecoder:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v3, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mAudioDecoderImpl:Ljava/lang/String;

    .line 86
    .line 87
    :cond_3
    :goto_1
    :try_start_0
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getMediaMeta()Landroid/os/Bundle;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->parse(Landroid/os/Bundle;)Lcom/tantanapp/ijk/media/player/IjkMediaMeta;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, v0, Lcom/tantanapp/ijk/media/player/MediaInfo;->mMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .line 97
    return-object v0

    .line 98
    :catchall_0
    move-exception p0

    .line 99
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 100
    .line 101
    .line 102
    return-object v0
.end method

.method public getMediaMeta()Landroid/os/Bundle;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getMediaMeta()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSeekLoadDuration()J
    .locals 3

    .line 1
    const/16 v0, 0x4f4c

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSelectedTrack(I)I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const-wide/16 v1, -0x1

    .line 3
    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p1, 0x4e2b

    .line 15
    .line 16
    invoke-direct {p0, p1, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide p0

    .line 20
    :goto_0
    long-to-int p0, p0

    .line 21
    return p0

    .line 22
    :cond_1
    const/16 p1, 0x4e22

    .line 23
    .line 24
    invoke-direct {p0, p1, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/16 p1, 0x4e21

    .line 30
    .line 31
    invoke-direct {p0, p1, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    goto :goto_0
.end method

.method public getSpeed(F)F
    .locals 1

    .line 1
    const/16 p1, 0x2713

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getTcpSpeed()J
    .locals 3

    .line 1
    const/16 v0, 0x4ee8

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public bridge synthetic getTrackInfo()[Lcom/tantanapp/ijk/media/player/misc/ITrackInfo;
    .locals 0

    .line 110
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getTrackInfo()[Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;

    move-result-object p0

    return-object p0
.end method

.method public getTrackInfo()[Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getMediaMeta()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->parse(Landroid/os/Bundle;)Lcom/tantanapp/ijk/media/player/IjkMediaMeta;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_6

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->mStreams:Ljava/util/ArrayList;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->mStreams:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_5

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 42
    .line 43
    new-instance v2, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;

    .line 44
    .line 45
    invoke-direct {v2, v1}, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;-><init>(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V

    .line 46
    .line 47
    .line 48
    iget-object v3, v1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mType:Ljava/lang/String;

    .line 49
    .line 50
    const-string v4, "video"

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {v2, v1}, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->setTrackType(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-object v3, v1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mType:Ljava/lang/String;

    .line 64
    .line 65
    const-string v4, "audio"

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    const/4 v1, 0x2

    .line 74
    invoke-virtual {v2, v1}, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->setTrackType(I)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    iget-object v1, v1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mType:Ljava/lang/String;

    .line 79
    .line 80
    const-string v3, "timedtext"

    .line 81
    .line 82
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    const/4 v1, 0x3

    .line 89
    invoke-virtual {v2, v1}, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->setTrackType(I)V

    .line 90
    .line 91
    .line 92
    :cond_4
    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    new-array p0, p0, [Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    check-cast p0, [Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;

    .line 107
    .line 108
    return-object p0

    .line 109
    :cond_6
    :goto_2
    return-object v0
.end method

.method public getTrafficStatisticByteCount()J
    .locals 3

    .line 1
    const/16 v0, 0x4eec

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoCachedBytes()J
    .locals 3

    .line 1
    const/16 v0, 0x4e27

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoCachedDuration()J
    .locals 3

    .line 1
    const/16 v0, 0x4e25

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoCachedPackets()J
    .locals 3

    .line 1
    const/16 v0, 0x4e29

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoDecodeFramesPerSecond()F
    .locals 2

    .line 1
    const/16 v0, 0x2711

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getVideoDecoder()I
    .locals 3

    .line 1
    const/16 v0, 0x4e23

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-int p0, v0

    .line 10
    return p0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoOutputFramesPerSecond()F
    .locals 2

    .line 1
    const/16 v0, 0x2712

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getVideoSarDen()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoSarNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public httphookReconnect()V
    .locals 3

    .line 1
    const/16 v0, 0x4ef3

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public isLooping()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_getLoopCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isPlayable()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public native isPlaying()Z
.end method

.method public pause()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_pause()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public prepareAsync()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_prepareAsync()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->resetListeners()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_release()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_reset()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mEventHandler:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 15
    .line 16
    iput v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 17
    .line 18
    return-void
.end method

.method public resetListeners()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->resetListeners()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 6
    .line 7
    return-void
.end method

.method public native seekTo(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public selectTrack(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setStreamSelected(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setAndroidIOCallback(Lcom/tantanapp/ijk/media/player/misc/IAndroidIO;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setAndroidIOCallback(Lcom/tantanapp/ijk/media/player/misc/IAndroidIO;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAudioStreamType(I)V
    .locals 0

    return-void
.end method

.method public setCacheShare(I)V
    .locals 3

    .line 1
    const/16 v0, 0x4ef2

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 147
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    return-void
.end method

.method public setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "file"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v1, "content"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const-string v0, "settings"

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-static {p2}, Landroid/media/RingtoneManager;->getDefaultType(Landroid/net/Uri;)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-static {p1, p2}, Landroid/media/RingtoneManager;->getActualDefaultRingtoneUri(Landroid/content/Context;I)Landroid/net/Uri;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    new-instance p0, Ljava/io/FileNotFoundException;

    .line 53
    .line 54
    const-string p1, "Failed to resolve default ringtone"

    .line 55
    .line 56
    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_2
    :goto_0
    const/4 v1, 0x0

    .line 61
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v0, "r"

    .line 66
    .line 67
    invoke-virtual {p1, p2, v0}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 68
    .line 69
    .line 70
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    if-nez v1, :cond_4

    .line 72
    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void

    .line 79
    :cond_4
    :try_start_1
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getDeclaredLength()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    const-wide/16 v4, 0x0

    .line 84
    .line 85
    cmp-long p1, v2, v4

    .line 86
    .line 87
    if-gez p1, :cond_5

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catchall_0
    move-exception v0

    .line 98
    move-object p0, v0

    .line 99
    goto :goto_2

    .line 100
    :catch_0
    move-object v2, p0

    .line 101
    goto :goto_3

    .line 102
    :catch_1
    move-object v2, p0

    .line 103
    goto :goto_5

    .line 104
    :cond_5
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 109
    .line 110
    .line 111
    move-result-wide v4

    .line 112
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getDeclaredLength()J

    .line 113
    .line 114
    .line 115
    move-result-wide v6
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    move-object v2, p0

    .line 117
    :try_start_2
    invoke-direct/range {v2 .. v7}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    .line 119
    .line 120
    :goto_1
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :goto_2
    if-eqz v1, :cond_6

    .line 125
    .line 126
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 127
    .line 128
    .line 129
    :cond_6
    throw p0

    .line 130
    :catch_2
    :goto_3
    if-eqz v1, :cond_7

    .line 131
    .line 132
    :goto_4
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 133
    .line 134
    .line 135
    goto :goto_6

    .line 136
    :catch_3
    :goto_5
    if-eqz v1, :cond_7

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_7
    :goto_6
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {v2, p0, p3}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;Ljava/util/Map;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 167
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V

    return-void
.end method

.method public setDataSource(Ljava/io/FileDescriptor;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 162
    invoke-static {p1}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    .line 163
    :try_start_0
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setDataSourceFd(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V

    return-void

    :catchall_0
    move-exception p0

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 165
    throw p0
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 148
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    const/4 v0, 0x0

    .line 149
    invoke-direct {p0, p1, v0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setDataSource(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public setDataSource(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    if-eqz p2, :cond_1

    .line 150
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 153
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 156
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 157
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_0
    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    const-string v1, "headers"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v3, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 160
    const-string v1, "protocol_whitelist"

    const-string v2, "async,cache,crypto,file,http,https,ijkhttphook,ijkinject,ijklivehook,ijklongurl,ijksegment,ijktcphook,pipe,rtp,tcp,tls,udp,ijkurlhook,data"

    invoke-virtual {p0, v3, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 161
    :cond_1
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    return-void
.end method

.method public setDisplay(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setKeepInBackground(Z)V
    .locals 0

    return-void
.end method

.method public setLogEnabled(Z)V
    .locals 0

    return-void
.end method

.method public setLooping(Z)V
    .locals 4

    .line 1
    xor-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    const-string v0, "loop"

    .line 4
    .line 5
    int-to-long v1, p1

    .line 6
    const/4 v3, 0x4

    .line 7
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setLoopCount(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnControlMessageListener(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnMediaCodecSelectListener(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnNativeInvokeListener(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mOnNativeInvokeListener:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$OnNativeInvokeListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setOption(ILjava/lang/String;J)V

    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setScreenOnWhilePlaying(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->TAG:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "setScreenOnWhilePlaying(true) is ineffective without a SurfaceHolder"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setSpeed(F)V
    .locals 1

    .line 1
    const/16 v0, 0x2713

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "setScreenOnWhilePlaying(true) is ineffective for Surface"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public native setVolume(FF)V
.end method

.method public setWakeMode(Landroid/content/Context;I)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    const/4 v2, 0x0

    .line 21
    iput-object v2, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move v0, v1

    .line 25
    :goto_1
    const-string v2, "power"

    .line 26
    .line 27
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Landroid/os/PowerManager;

    .line 32
    .line 33
    const/high16 v2, 0x20000000

    .line 34
    .line 35
    or-int/2addr p2, v2

    .line 36
    const-class v2, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p1, p2, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 49
    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public start()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_start()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public stop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->_stop()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
