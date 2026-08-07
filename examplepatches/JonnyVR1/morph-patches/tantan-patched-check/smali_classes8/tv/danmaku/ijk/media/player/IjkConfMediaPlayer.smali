.class public Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;,
        Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$OnMediaCodecSelectListener;,
        Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$DefaultMediaCodecSelector;
    }
.end annotation


# static fields
.field private static final MEDIA_BUFFERING_UPDATE:I = 0x3

.field private static final MEDIA_ERROR:I = 0x64

.field private static final MEDIA_INFO:I = 0xc8

.field private static final MEDIA_NOP:I = 0x0

.field private static final MEDIA_PLAYBACK_COMPLETE:I = 0x2

.field private static final MEDIA_PREPARED:I = 0x1

.field private static final MEDIA_SEEK_COMPLETE:I = 0x4

.field protected static final MEDIA_SET_VIDEO_DAR:I = 0x2712

.field protected static final MEDIA_SET_VIDEO_SAR:I = 0x2711

.field private static final MEDIA_SET_VIDEO_SIZE:I = 0x5

.field private static final MEDIA_TIMED_TEXT:I = 0x63

.field public static final OPT_CATEGORY_PLAYER:I = 0x4

.field private static final TAG:Ljava/lang/String; = "tv.danmaku.ijk.media.player.IjkConfMediaPlayer"

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;


# instance fields
.field private PlayStatus:I

.field private PreparedStatus:I

.field private mDecodeFrameCount:J

.field private mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

.field private mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

.field private mHwCodec:Z

.field private mListenerContext:I
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeMediaPlayer:J
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeSurfaceTexture:I
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNeedCheckIFrame:Z

.field private mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$OnMediaCodecSelectListener;

.field private mScreenOnWhilePlaying:Z

.field private mStayAwake:Z

.field private mSurface:Ljava/lang/Object;

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$1;

    .line 2
    .line 3
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 10
    .line 11
    sput-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsNativeInitialized:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 26
    sget-object p1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;-><init>(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    return-void
.end method

.method public constructor <init>(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mVideoWidth:I

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mVideoHeight:I

    .line 11
    .line 12
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PlayStatus:I

    .line 13
    .line 14
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PreparedStatus:I

    .line 15
    .line 16
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mDecodeFrameCount:J

    .line 19
    .line 20
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNeedCheckIFrame:Z

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->initPlayer(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private native _getAudioCodecInfo()Ljava/lang/String;
.end method

.method private native _getPropertyFloat(IF)F
.end method

.method private _getPropertyFloat_(IF)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_getPropertyFloat(IF)F

    .line 3
    .line 4
    .line 5
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    return p0

    .line 7
    :catch_0
    return v0
.end method

.method private native _getPropertyLong(IJ)J
.end method

.method private _getPropertyLong_(IJ)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_getPropertyLong(IJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-wide p0

    .line 8
    :catch_0
    return-wide v0
.end method

.method private native _getVideoCodecInfo()Ljava/lang/String;
.end method

.method private native _release()V
.end method

.method private native _reset()V
.end method

.method private native _setOption(ILjava/lang/String;J)V
.end method

.method private native _setOption(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native _setPropertyFloat(IF)V
.end method

.method private _setPropertyFloat_(IF)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setPropertyFloat(IF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method private native _setPropertyLong(IJ)V
.end method

.method private _setPropertyLong_(IJ)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setPropertyLong(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method private native _setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V
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

.method public static synthetic access$000(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNativeMediaPlayer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->stayAwake(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static initNativeOnce()V
    .locals 2

    .line 1
    const-class v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsNativeInitialized:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->native_init()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    sput-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsNativeInitialized:Z

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw v1
.end method

.method private initPlayer(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->initNativeOnce()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    new-instance v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;-><init>(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    new-instance v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;-><init>(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Landroid/os/Looper;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 37
    .line 38
    :goto_0
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mHwCodec:Z

    .line 40
    .line 41
    :try_start_0
    sget-boolean p1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 42
    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 46
    .line 47
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->native_setup(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_3

    .line 54
    :catch_0
    move-exception p1

    .line 55
    goto :goto_1

    .line 56
    :catch_1
    move-exception p1

    .line 57
    goto :goto_2

    .line 58
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 66
    .line 67
    if-nez p1, :cond_3

    .line 68
    .line 69
    new-instance p1, Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 70
    .line 71
    invoke-direct {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 80
    .line 81
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->getLastErr()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 88
    .line 89
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->release()V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 93
    .line 94
    sget-object p1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 95
    .line 96
    const-string v0, "mFakeSurface creat error use softdec"

    .line 97
    .line 98
    invoke-static {p1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    :cond_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 102
    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    sget-boolean p1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 106
    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 110
    .line 111
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->getSurface()Landroid/view/Surface;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 116
    .line 117
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->getSurface()Landroid/view/Surface;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p0, p1, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    return-void
.end method

.method public static loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 3

    .line 1
    const-class v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;
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
    const/4 v1, 0x1

    .line 16
    :try_start_1
    const-string v2, "mmcrypto"

    .line 17
    .line 18
    invoke-interface {p0, v2}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "mmssl"

    .line 22
    .line 23
    invoke-interface {p0, v2}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v2, "cosmosffmpeg"

    .line 27
    .line 28
    invoke-interface {p0, v2}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "ijklivesdl"

    .line 32
    .line 33
    invoke-interface {p0, v2}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "ijkconfplayer"

    .line 37
    .line 38
    invoke-interface {p0, v2}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catch_0
    const/4 p0, 0x0

    .line 45
    :try_start_2
    sput-boolean p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    .line 47
    :try_start_3
    sput-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 48
    .line 49
    sget-object v1, Ll/l26;->a:Landroid/content/Context;

    .line 50
    .line 51
    const-string v2, "mmcrypto"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object v1, Ll/l26;->a:Landroid/content/Context;

    .line 57
    .line 58
    const-string v2, "mmssl"

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object v1, Ll/l26;->a:Landroid/content/Context;

    .line 64
    .line 65
    const-string v2, "cosmosffmpeg"

    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object v1, Ll/l26;->a:Landroid/content/Context;

    .line 71
    .line 72
    const-string v2, "ijklivesdl"

    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    sget-object v1, Ll/l26;->a:Landroid/content/Context;

    .line 78
    .line 79
    const-string v2, "ijkconfplayer"

    .line 80
    .line 81
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :catch_1
    :try_start_4
    sput-boolean p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 86
    .line 87
    :cond_1
    :goto_1
    monitor-exit v0

    .line 88
    return-void

    .line 89
    :goto_2
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    throw p0
.end method

.method private native native_finalize()V
.end method

.method private static native native_init()V
.end method

.method private native native_setup(Ljava/lang/Object;)V
.end method

.method private static onSelectCodec(Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;
    .locals 4
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onSelectCodec"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p0, :cond_5

    .line 10
    .line 11
    instance-of v2, p0, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_1
    const-string v2, "onSelectCodec 1"

    .line 28
    .line 29
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    const-string v2, "ffmpeg/video"

    .line 33
    .line 34
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x1

    .line 39
    if-ne v2, v3, :cond_3

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mHwCodec:Z

    .line 43
    .line 44
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    instance-of p2, p1, Landroid/view/SurfaceHolder;

    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    check-cast p1, Landroid/view/SurfaceHolder;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-object v1

    .line 58
    :cond_3
    const-string v1, "onSelectCodec 2"

    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$OnMediaCodecSelectListener;

    .line 64
    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$DefaultMediaCodecSelector;->sInstance:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$DefaultMediaCodecSelector;

    .line 68
    .line 69
    :cond_4
    invoke-interface {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$OnMediaCodecSelectListener;->onMediaCodecSelect(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Ljava/lang/String;II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_5
    :goto_0
    return-object v1
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 1
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
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
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 26
    .line 27
    .line 28
    :cond_2
    :goto_0
    return-void
.end method

.method private release_l()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->release()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 24
    .line 25
    :cond_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$OnMediaCodecSelectListener;

    .line 26
    .line 27
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 28
    .line 29
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 30
    .line 31
    :try_start_0
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_1
    move-exception p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mStayAwake:Z

    .line 35
    .line 36
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private updateSurfaceScreenOn()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mStayAwake:Z

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
.method public native _getCurrentPosition()J
.end method

.method public native _getCurrentPts()J
.end method

.method public native _getDuration()J
.end method

.method public native _isPlaying()Z
.end method

.method public native _prepareAsync()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public native _seekTo(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public final native _writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
.end method

.method public final native _writeAudioPacket(JLjava/nio/ByteBuffer;JI)V
.end method

.method public final native _writeVideoExtradata(Ljava/nio/ByteBuffer;JII)V
.end method

.method public final native _writeVideoPacket(JLjava/nio/ByteBuffer;JI)V
.end method

.method public checkIFrame(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNeedCheckIFrame:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNeedCheckIFrame:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public checkIFrameStart()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNeedCheckIFrame:Z

    .line 3
    .line 4
    return-void
.end method

.method public finalize()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->native_finalize()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_getCurrentPosition()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-wide v0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    return-wide v0

    .line 13
    :catch_1
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-wide v0
.end method

.method public getCurrentPts()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_getCurrentPts()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-wide v0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    return-wide v0

    .line 13
    :catch_1
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-wide v0
.end method

.method public getDecodeFrameCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mDecodeFrameCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-wide v0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    return-wide v0

    .line 13
    :catch_1
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-wide v0
.end method

.method public getRenderFrameCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mDecodeFrameCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_isPlaying()Z

    .line 3
    .line 4
    .line 5
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    return p0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :catch_1
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    return v0
.end method

.method public prepareAsync()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PreparedStatus:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_prepareAsync()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PreparedStatus:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-void

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
    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->release_l()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public reset()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_2

    .line 13
    :catch_0
    move-exception v1

    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 18
    .line 19
    .line 20
    goto :goto_2

    .line 21
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :cond_0
    :goto_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mVideoWidth:I

    .line 31
    .line 32
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mVideoHeight:I

    .line 33
    .line 34
    return-void
.end method

.method public seekTo(J)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_seekTo(J)V
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

.method public setDisplay(Landroid/view/Surface;)V
    .locals 3

    .line 90
    const-string v0, "_setVideoSurface"

    .line 91
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 92
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    goto :goto_2

    .line 93
    :cond_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    goto :goto_3

    .line 94
    :cond_1
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    if-eqz v1, :cond_2

    .line 95
    invoke-direct {p0, p1, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 96
    :cond_2
    sget-object v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 97
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3

    .line 98
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 99
    :goto_3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    return-void
.end method

.method public setDisplay(Landroid/view/SurfaceHolder;)V
    .locals 5

    .line 1
    const-string v0, "_setVideoSurface"

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    sget-object v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "setDisplay"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    :try_start_0
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :catch_1
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :cond_0
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 39
    .line 40
    move-object v3, v2

    .line 41
    :goto_0
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 42
    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-virtual {v4, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_2
    sget-boolean v2, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 57
    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    invoke-direct {p0, v3, v3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    goto :goto_3

    .line 79
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 80
    .line 81
    .line 82
    goto :goto_3

    .line 83
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    :goto_3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public setMediaCodecEnabled(Z)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setMediaCodecEnabled"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-wide/16 v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    :goto_0
    const/4 p1, 0x4

    .line 32
    const-string v2, "mediacodec"

    .line 33
    .line 34
    invoke-virtual {p0, p1, v2, v0, v1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 1

    .line 1
    :try_start_0
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setOption(ILjava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 9
    :try_start_0
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    if-eqz v0, :cond_0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setOption(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public setPropertyLong(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setPropertyLong_(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setScreenOnWhilePlaying(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "setScreenOnWhilePlaying(true) is ineffective without a SurfaceHolder"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/t9c;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 19
    .line 20
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setSurfaceH(Landroid/view/Surface;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "setScreenOnWhilePlaying(true) is ineffective for Surface"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/t9c;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1, p1}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->updateSurfaceScreenOn()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public native setVolume(FF)V
.end method

.method public setWakeMode(Landroid/content/Context;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    const-class v2, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

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
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 49
    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    :try_start_0
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PlayStatus:I

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_start()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PlayStatus:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_1
    move-exception p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
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
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->stayAwake(Z)V

    .line 3
    .line 4
    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PlayStatus:I

    .line 6
    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PreparedStatus:I

    .line 8
    .line 9
    :try_start_0
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    return-void
.end method

.method public updateScreenRec(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p1, p2}, Ltv/danmaku/ijk/media/player/fakeSurface;->updateRec(IIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public writeVideoPacket(JLjava/nio/ByteBuffer;JI)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mDecodeFrameCount:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mDecodeFrameCount:J

    .line 7
    .line 8
    :try_start_0
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->PreparedStatus:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mNeedCheckIFrame:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-boolean v0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->mIsLibLoaded:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->_writeVideoPacket(JLjava/nio/ByteBuffer;JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :catch_0
    :cond_0
    return-void
.end method
