.class public final Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
.super Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;,
        Ltv/danmaku/ijk/media/player/IjkMediaPlayer$AVSampleFormat;
    }
.end annotation


# static fields
.field public static final AV_CH_FRONT_LEFT:I = 0x1

.field public static final AV_CH_FRONT_RIGHT:I = 0x2

.field public static final AV_CH_LAYOUT_MONO:I = 0x4

.field public static final AV_CH_LAYOUT_STEREO:I = 0x3

.field public static final FFP_PROPV_DECODER_AVCODEC:I = 0x1

.field public static final FFP_PROPV_DECODER_MEDIACODEC:I = 0x2

.field public static final FFP_PROPV_DECODER_UNKNOWN:I = 0x0

.field public static final FFP_PROPV_DECODER_VIDEOTOOLBOX:I = 0x3

.field public static final FFP_PROP_FLOAT_ACCE_RATE:I = 0x271e

.field public static final FFP_PROP_FLOAT_AUDIO_PTS_VALUE:I = 0x2720

.field public static final FFP_PROP_FLOAT_CONNECT_TIME:I = 0x2716

.field public static final FFP_PROP_FLOAT_DECE_RATE:I = 0x271d

.field public static final FFP_PROP_FLOAT_FIRST_AFTAME:I = 0x2718

.field public static final FFP_PROP_FLOAT_FIRST_APACKET:I = 0x2719

.field public static final FFP_PROP_FLOAT_FIRST_ARENDER:I = 0x271c

.field public static final FFP_PROP_FLOAT_FIRST_IFTAME:I = 0x2717

.field public static final FFP_PROP_FLOAT_FIRST_VPACKET:I = 0x271a

.field public static final FFP_PROP_FLOAT_FIRST_VRENDER:I = 0x271b

.field public static final FFP_PROP_FLOAT_MIN_VIDEO_JUMP_DURATION:I = 0x2721

.field public static final FFP_PROP_FLOAT_SAMPLE_RATE:I = 0x271f

.field public static final FFP_PROP_GET_BUFFER_CURRENT:I = 0x4e59

.field public static final FFP_PROP_GET_BUFFER_FIRST:I = 0x4e58

.field public static final FFP_PROP_GET_BUFFER_INTERVAL:I = 0x4e61

.field public static final FFP_PROP_GET_BUFFER_LAST:I = 0x4e5b

.field public static final FFP_PROP_GET_BUFFER_NEXT:I = 0x4e5a

.field public static final FFP_PROP_GET_DELAY_TIME:I = 0x4e60

.field public static final FFP_PROP_GET_HARDDECODE:I = 0x4e62

.field public static final FFP_PROP_GET_LATENCY_BASE_MARK:I = 0x4e5d

.field public static final FFP_PROP_GET_LATENCY_DROP_MARK:I = 0x4e5f

.field public static final FFP_PROP_GET_LATENCY_ENABLE:I = 0x4e5c

.field public static final FFP_PROP_GET_LATENCY_SPEEDUP_MARK:I = 0x4e5e

.field public static final FFP_PROP_INT64_ACCE_CACHE_DURATION:I = 0x4e34

.field public static final FFP_PROP_INT64_AUDIO_CACHED_BYTES:I = 0x4e28

.field public static final FFP_PROP_INT64_AUDIO_CACHED_DURATION:I = 0x4e26

.field public static final FFP_PROP_INT64_AUDIO_CACHED_PACKETS:I = 0x4e2a

.field public static final FFP_PROP_INT64_AUDIO_DECODER_BYTES:I = 0x4e2e

.field public static final FFP_PROP_INT64_AUDIO_EFFECT_3D:I = 0x4e52

.field public static final FFP_PROP_INT64_AUDIO_EFFECT_BOOST_3D:I = 0x4e54

.field public static final FFP_PROP_INT64_AUDIO_EFFECT_BOOST_HIFI:I = 0x4e55

.field public static final FFP_PROP_INT64_AUDIO_EFFECT_HIFI:I = 0x4e53

.field public static final FFP_PROP_INT64_AUDIO_ONLY:I = 0x4e3c

.field public static final FFP_PROP_INT64_AUDIO_READ_BYTES:I = 0x4e2b

.field public static final FFP_PROP_INT64_AUDIO_RENDER_BYTES:I = 0x4e2d

.field public static final FFP_PROP_INT64_AUDIO_TRACK_INDEX:I = 0x4e40

.field public static final FFP_PROP_INT64_BUFFERING_MAX_TIME_MS:I = 0x4e41

.field public static final FFP_PROP_INT64_CREAT_TIME:I = 0x4e31

.field public static final FFP_PROP_INT64_DECE_CACHE_DURATION:I = 0x4e33

.field public static final FFP_PROP_INT64_DECODER_OPEN_COST:I = 0x4e46

.field public static final FFP_PROP_INT64_DECORD_RECORD_PTS:I = 0x4e56

.field public static final FFP_PROP_INT64_ENABLE_LATENCY_SECONDS:I = 0x4e67

.field public static final FFP_PROP_INT64_FASTDNS_ENABLE:I = 0x4e3e

.field public static final FFP_PROP_INT64_FASTDNS_EXPIRETIME:I = 0x4e3f

.field public static final FFP_PROP_INT64_FIRST_VIDEO_HASMOMOSEI:I = 0x4e42

.field public static final FFP_PROP_INT64_GET_VIDEOCODEC_TYPE:I = 0x4e4a

.field public static final FFP_PROP_INT64_IFRAME_DEALY:I = 0x4e39

.field public static final FFP_PROP_INT64_MAX_BUFFERLING_BYTES:I = 0x4e3b

.field public static final FFP_PROP_INT64_NEW_CHECK_SEI:I = 0x4e57

.field public static final FFP_PROP_INT64_NEW_SIZE_CHANGE:I = 0x4e66

.field public static final FFP_PROP_INT64_PER_AUDIO_PACK_DUR:I = 0x4e49

.field public static final FFP_PROP_INT64_SELECTED_AUDIO_STREAM:I = 0x4e22

.field public static final FFP_PROP_INT64_SELECTED_VIDEO_STREAM:I = 0x4e21

.field public static final FFP_PROP_INT64_SERVERSYSTEM_TIME:I = 0x4e32

.field public static final FFP_PROP_INT64_SPLIT_AUDIO_CHANNELS:I = 0x4e36

.field public static final FFP_PROP_INT64_SPLIT_AUDIO_CHANNEL_FRQ:I = 0x4e38

.field public static final FFP_PROP_INT64_SPLIT_AUDIO_CHANNEL_LAYOUT:I = 0x4e37

.field public static final FFP_PROP_INT64_SPLIT_AUDIO_FMT:I = 0x4e35

.field public static final FFP_PROP_INT64_STREAM_COUNT:I = 0x4e24

.field public static final FFP_PROP_INT64_TIME_OUT_US:I = 0x4e3a

.field public static final FFP_PROP_INT64_VIDEODONTHASMOMOSEICNT:I = 0x4e43

.field public static final FFP_PROP_INT64_VIDEO_CACHED_BYTES:I = 0x4e27

.field public static final FFP_PROP_INT64_VIDEO_CACHED_DURATION:I = 0x4e25

.field public static final FFP_PROP_INT64_VIDEO_CACHED_PACKETS:I = 0x4e29

.field public static final FFP_PROP_INT64_VIDEO_DECODER:I = 0x4e23

.field public static final FFP_PROP_INT64_VIDEO_NEW_ENABLE_LATENCY:I = 0x4e48

.field public static final FFP_PROP_INT64_VIDEO_ONLY:I = 0x4e3d

.field public static final FFP_PROP_INT64_VIDEO_READ_BYTES:I = 0x4e2c

.field public static final FFP_PROP_INT64_VIDEO_RENDER_THRESHOLD:I = 0x4e47

.field public static final FFP_PROP_STRING_GETCDNIP:I = 0x4e44

.field public static final FFP_PROP_STRING_GETCLIENTIP:I = 0x4e45

.field private static final MEDIA_AUDIOCALLBACK:I = 0xc9

.field private static final MEDIA_BUFFERING_UPDATE:I = 0x3

.field private static final MEDIA_BUFFERLING_END:I = 0x2be

.field private static final MEDIA_BUFFERLING_START:I = 0x2bd

.field private static final MEDIA_ERROR:I = 0x64

.field private static final MEDIA_INFO:I = 0xc8

.field private static final MEDIA_MEIDACODEC_SIZE_CHANGE:I = 0x326

.field protected static final MEDIA_NEW_LATENCY:I = 0x2713

.field private static final MEDIA_NOP:I = 0x0

.field private static final MEDIA_PLAYBACK_COMPLETE:I = 0x2

.field private static final MEDIA_PREPARED:I = 0x1

.field private static final MEDIA_SEEK_COMPLETE:I = 0x4

.field protected static final MEDIA_SET_VIDEO_DAR:I = 0x2712

.field private static final MEDIA_SET_VIDEO_MEDIACODE:I = 0x6

.field protected static final MEDIA_SET_VIDEO_SAR:I = 0x2711

.field private static final MEDIA_SET_VIDEO_SIZE:I = 0x5

.field private static final MEDIA_TIMED_TEXT:I = 0x63

.field private static final MEDIA_VIDEOCALLBACK:I = 0xca

.field public static final OPT_CATEGORY_CODEC:I = 0x2

.field public static final OPT_CATEGORY_FORMAT:I = 0x1

.field public static final OPT_CATEGORY_PLAYER:I = 0x4

.field public static final OPT_CATEGORY_SWS:I = 0x3

.field public static final PROP_FLOAT_AVDELAY:I = 0x2714

.field public static final PROP_FLOAT_AVDIFF:I = 0x2715

.field public static final PROP_FLOAT_PLAYBACK_RATE:I = 0x2713

.field public static final PROP_FLOAT_VIDEO_DECODE_FRAMES_PER_SECOND:I = 0x2711

.field public static final PROP_FLOAT_VIDEO_OUTPUT_FRAMES_PER_SECOND:I = 0x2712

.field public static final PROP_INT64_VIDEO_DECODE_FRAMES:I = 0x4e2f

.field public static final PROP_INT64_VIDEO_OUTPUT_FRAMES:I = 0x4e30

.field public static final SDL_FCC_RV16:I = 0x36315652

.field public static final SDL_FCC_RV32:I = 0x32335652

.field public static final SDL_FCC_YV12:I = 0x32315659

.field public static final SDL_OPENGL:Ljava/lang/String; = "fcc-_es2"

.field private static final TAG:Ljava/lang/String; = "IjkMediaPlayer"

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;


# instance fields
.field public final LOG_BUF_SIZE:I

.field public final LOG_PULL_SIZE:I

.field private adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

.field private costOfsetSurfaceMs:J

.field private detectStatus:I

.field private enable3D:Z

.field private enableHiFi:Z

.field private enableLogBufferAndPullSize:I

.field private fast_dns_expire_time:I

.field private filterOn:I

.field private headSetOn:Z

.field private httpMediaLogsUpload:Ll/a320;

.field private logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

.field private mAudioPtsValue:F

.field private mBufferCurrent:I

.field private mBufferFirst:I

.field private mBufferInterval:I

.field private mBufferLast:I

.field private mBufferLogCount:I

.field private mBufferLogHz:I

.field private mBufferNext:I

.field private mBufferPerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mCdnip:Ljava/lang/String;

.field private mContextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mContrast:F

.field private mCount:I

.field private mCurrentUrlInfo:Ll/p4k0;

.field private mDataSource:Ljava/lang/String;

.field private mDeblueEnabled:Z

.field private mDeblurRadius:F

.field private mDeblurThreshold:F

.field private mDeblurWeight:F

.field private mDecorderRecordPts:I

.field public volatile mDelayTime:J

.field private mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

.field private mFFConcatContent:Ljava/lang/String;

.field private mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

.field private volatile mHardDecoderFlagFromMediaConfig:Z

.field private mHasPrepared:Z

.field private mHwCodec:Z

.field public mIFrameTime:J

.field private mInterval:I

.field private mIsQuicProxy:Z

.field private volatile mJsonDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;

.field private mLastBufferSize:J

.field private mLastPullSize:J

.field private mLatencyBaseMark:I

.field private mLatencyDropMark:I

.field private mLatencyEnable:I

.field private mLatencySpeedRate:F

.field private mLatencySpeedupMark:I

.field private mListenerContext:I
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private volatile mManuaRefresh:Z

.field private volatile mMediaCodecSetDone:Z

.field private mMediaDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field private mMediaDateHT:Landroid/os/HandlerThread;

.field private mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

.field private mMinVideoJumpDuration:F

.field private mNativeMediaPlayer:J
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field private mNativeSurfaceTexture:I
    .annotation build Ltv/danmaku/ijk/media/player/annotations/AccessedByNative;
    .end annotation
.end field

.field public mNetDiffTime:J

.field private mNewEnableLatency:I

.field private mNewSizeChange:I

.field private mNewcheckSei:I

.field private mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

.field private mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

.field private mPullSizeLogCount:I

.field private mPullSizeLogHz:I

.field private mPullSizePerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mQuicServerIp:Ljava/lang/String;

.field private mSaturation:F

.field private mScreenHeight:I

.field private mScreenOnWhilePlaying:Z

.field private mScreenWidth:I

.field private mServerIpAddr:Ljava/lang/String;

.field private mStayAwake:Z

.field private mSurface:Ljava/lang/Object;

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSynSurface:Ljava/lang/Object;

.field private mTag:Ljava/lang/String;

.field private volatile mUseAndroidMediaCodec:Z

.field private mUseOpengl:I

.field private mUseProxy:Z

.field private mVideoDarDen:I

.field private mVideoDarNum:I

.field private mVideoHeight:I

.field private mVideoRenderTHold:I

.field private mVideoSarDen:I

.field private mVideoSarNum:I

.field private mVideoWidth:I

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mediaCfgParams:Ll/brx;

.field private mediaLogPullV2:Ll/dvx;

.field private mediaLogsValOfPull:Ll/vvx;

.field private metaTimeMs:J

.field private pullStartAlreadySend:Z

.field private showId:Ljava/lang/String;

.field private simpleInfoFromUpStream:Ll/bpf0;

.field private sourceStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$1;

    .line 2
    .line 3
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 10
    .line 11
    sput-boolean v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    .line 241
    sget-object v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, v0, v1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/player/IjkLibLoader;Ll/brx;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 233
    invoke-direct {p0, p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;Ll/brx;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/brx;)V
    .locals 1

    .line 234
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1, v0, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/player/IjkLibLoader;Ll/brx;)V

    .line 235
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 236
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 237
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    move-result-object p1

    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContextRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    sget p2, Ll/yt0;->g:I

    invoke-virtual {p1, p0, p2}, Ll/yt0;->p(Landroid/content/Context;I)V

    .line 238
    :cond_0
    :try_start_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    move-result-object p0

    invoke-virtual {p0}, Ll/csx;->V0()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 239
    invoke-static {}, Ll/aol;->e()Ll/aol;

    move-result-object p0

    invoke-virtual {p0}, Ll/aol;->o()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p0

    .line 240
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltv/danmaku/ijk/media/player/IjkLibLoader;Ll/brx;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNetDiffTime:J

    .line 7
    .line 8
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIFrameTime:J

    .line 9
    .line 10
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 11
    .line 12
    new-instance v2, Ljava/lang/Object;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSynSurface:Ljava/lang/Object;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mInterval:I

    .line 21
    .line 22
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCount:I

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 26
    .line 27
    new-instance v4, Ll/dvx;

    .line 28
    .line 29
    invoke-direct {v4}, Ll/dvx;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 33
    .line 34
    new-instance v4, Ll/vvx;

    .line 35
    .line 36
    invoke-direct {v4}, Ll/vvx;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 40
    .line 41
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 42
    .line 43
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 47
    .line 48
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 49
    .line 50
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenWidth:I

    .line 51
    .line 52
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenHeight:I

    .line 53
    .line 54
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mManuaRefresh:Z

    .line 55
    .line 56
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseProxy:Z

    .line 57
    .line 58
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->detectStatus:I

    .line 59
    .line 60
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHasPrepared:Z

    .line 61
    .line 62
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mQuicServerIp:Ljava/lang/String;

    .line 63
    .line 64
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsQuicProxy:Z

    .line 65
    .line 66
    const-string v5, ""

    .line 67
    .line 68
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mTag:Ljava/lang/String;

    .line 71
    .line 72
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->costOfsetSurfaceMs:J

    .line 73
    .line 74
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 75
    .line 76
    const/4 v6, 0x1

    .line 77
    iput v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->LOG_BUF_SIZE:I

    .line 78
    .line 79
    const/4 v6, 0x2

    .line 80
    iput v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->LOG_PULL_SIZE:I

    .line 81
    .line 82
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastPullSize:J

    .line 83
    .line 84
    const/16 v6, 0xa

    .line 85
    .line 86
    iput v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogCount:I

    .line 87
    .line 88
    const/16 v7, 0x1f4

    .line 89
    .line 90
    iput v7, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogHz:I

    .line 91
    .line 92
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastBufferSize:J

    .line 93
    .line 94
    iput v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogCount:I

    .line 95
    .line 96
    iput v7, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 97
    .line 98
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableLogBufferAndPullSize:I

    .line 99
    .line 100
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoRenderTHold:I

    .line 101
    .line 102
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewEnableLatency:I

    .line 103
    .line 104
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 105
    .line 106
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mAudioPtsValue:F

    .line 107
    .line 108
    const/high16 v0, 0x3f000000    # 0.5f

    .line 109
    .line 110
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMinVideoJumpDuration:F

    .line 111
    .line 112
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 113
    .line 114
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 115
    .line 116
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 117
    .line 118
    const/high16 v0, 0x3f800000    # 1.0f

    .line 119
    .line 120
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 121
    .line 122
    const v1, 0x3ee66666    # 0.45f

    .line 123
    .line 124
    .line 125
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 126
    .line 127
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurRadius:F

    .line 128
    .line 129
    const v0, 0x3c449ba6    # 0.012f

    .line 130
    .line 131
    .line 132
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurThreshold:F

    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContrast:F

    .line 136
    .line 137
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDecorderRecordPts:I

    .line 138
    .line 139
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblueEnabled:Z

    .line 140
    .line 141
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->showId:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sourceStr:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 146
    .line 147
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewcheckSei:I

    .line 148
    .line 149
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewSizeChange:I

    .line 150
    .line 151
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 152
    .line 153
    const/16 v0, 0x12c

    .line 154
    .line 155
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->fast_dns_expire_time:I

    .line 156
    .line 157
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 158
    .line 159
    const/16 v0, 0xfa0

    .line 160
    .line 161
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 162
    .line 163
    const/16 v0, 0x1f3f

    .line 164
    .line 165
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 166
    .line 167
    const/16 v0, 0x1f40

    .line 168
    .line 169
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 170
    .line 171
    const v0, 0x3f8ccccd    # 1.1f

    .line 172
    .line 173
    .line 174
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedRate:F

    .line 175
    .line 176
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 177
    .line 178
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 179
    .line 180
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 181
    .line 182
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 183
    .line 184
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 185
    .line 186
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 187
    .line 188
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 189
    .line 190
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaCodecSetDone:Z

    .line 191
    .line 192
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableHiFi:Z

    .line 193
    .line 194
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enable3D:Z

    .line 195
    .line 196
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->headSetOn:Z

    .line 197
    .line 198
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0, p1, p3}, Ll/arx;->k(Landroid/content/Context;Ll/brx;)V

    .line 203
    .line 204
    .line 205
    iput-object p3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 206
    .line 207
    if-eqz p3, :cond_0

    .line 208
    .line 209
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 210
    .line 211
    invoke-virtual {p3}, Ll/brx;->g()Z

    .line 212
    .line 213
    .line 214
    move-result p3

    .line 215
    iput-boolean p3, p1, Ll/vvx;->X:Z

    .line 216
    .line 217
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 218
    .line 219
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 220
    .line 221
    .line 222
    move-result p3

    .line 223
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p3

    .line 227
    iput-object p3, p1, Ll/vvx;->a0:Ljava/lang/String;

    .line 228
    .line 229
    invoke-direct {p0, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->initPlayer(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method private MediaCfgInit()V
    .locals 13

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/brx;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_5

    .line 14
    .line 15
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_8

    .line 30
    .line 31
    iget-object v1, v0, Ll/arx$d;->e:Ll/bsx;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 36
    .line 37
    iget v1, v1, Ll/bsx;->n:I

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ll/dvx;->x(I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 43
    .line 44
    iget-object v2, v0, Ll/arx$d;->e:Ll/bsx;

    .line 45
    .line 46
    iget v2, v2, Ll/bsx;->m:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/dvx;->A(I)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 52
    .line 53
    iget-object v2, v0, Ll/arx$d;->e:Ll/bsx;

    .line 54
    .line 55
    iget v2, v2, Ll/bsx;->j:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ll/dvx;->v(I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, v0, Ll/arx$d;->e:Ll/bsx;

    .line 61
    .line 62
    iget v2, v1, Ll/bsx;->Q0:I

    .line 63
    .line 64
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 65
    .line 66
    iget v2, v1, Ll/bsx;->S0:I

    .line 67
    .line 68
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewcheckSei:I

    .line 69
    .line 70
    iget v1, v1, Ll/bsx;->T0:I

    .line 71
    .line 72
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewSizeChange:I

    .line 73
    .line 74
    const/16 v1, 0x4e57

    .line 75
    .line 76
    int-to-long v2, v2

    .line 77
    invoke-direct {p0, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 78
    .line 79
    .line 80
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewSizeChange:I

    .line 81
    .line 82
    int-to-long v1, v1

    .line 83
    const/16 v3, 0x4e66

    .line 84
    .line 85
    invoke-direct {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 86
    .line 87
    .line 88
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/brx;->c()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 97
    .line 98
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 99
    .line 100
    invoke-virtual {v2}, Ll/brx;->c()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    int-to-long v2, v2

    .line 105
    iput-wide v2, v1, Ll/vvx;->O:J

    .line 106
    .line 107
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 108
    .line 109
    if-nez v1, :cond_2

    .line 110
    .line 111
    new-instance v2, Ll/a320;

    .line 112
    .line 113
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v4, v0, Ll/arx$d;->b:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v5, v0, Ll/arx$d;->c:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/brx;->h()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/brx;->f()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/brx;->c()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 154
    .line 155
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/brx;->j()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v10

    .line 169
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 170
    .line 171
    iget-object v11, v0, Ll/vvx;->a0:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v12, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->showId:Ljava/lang/String;

    .line 174
    .line 175
    invoke-direct/range {v2 .. v12}, Ll/a320;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 179
    .line 180
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 181
    .line 182
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mTag:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ll/a320;->e(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 188
    .line 189
    if-eqz v0, :cond_3

    .line 190
    .line 191
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ll/dvx;->w(Ll/a320;)V

    .line 194
    .line 195
    .line 196
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 197
    .line 198
    invoke-virtual {v0}, Ll/brx;->h()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-nez v0, :cond_4

    .line 207
    .line 208
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/brx;->c()I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-nez v0, :cond_8

    .line 215
    .line 216
    :cond_4
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    const-string v2, "mediaCfgParams"

    .line 223
    .line 224
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 228
    .line 229
    invoke-virtual {p0}, Ll/brx;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-virtual {v0, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    const-string v1, "threadInfo:"

    .line 254
    .line 255
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-static {}, Ll/snk0;->e()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {p0, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    const-string v1, "ijkmediaplayer mediaCfg == null, user default appid"

    .line 282
    .line 283
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    const-string v1, "mlive"

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 301
    .line 302
    if-nez v1, :cond_7

    .line 303
    .line 304
    new-instance v2, Ll/a320;

    .line 305
    .line 306
    if-eqz v0, :cond_6

    .line 307
    .line 308
    iget-object v0, v0, Ll/arx$d;->c:Ljava/lang/String;

    .line 309
    .line 310
    :goto_0
    move-object v5, v0

    .line 311
    goto :goto_1

    .line 312
    :cond_6
    const-string v0, ""

    .line 313
    .line 314
    goto :goto_0

    .line 315
    :goto_1
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    const-string v1, "mdefault"

    .line 320
    .line 321
    invoke-virtual {v0, v1}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v9

    .line 325
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 326
    .line 327
    iget-object v11, v0, Ll/vvx;->a0:Ljava/lang/String;

    .line 328
    .line 329
    iget-object v12, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->showId:Ljava/lang/String;

    .line 330
    .line 331
    const-string v3, "mdefault"

    .line 332
    .line 333
    const-string v4, "1a738fb015fe0a8476c4e05a314156d2"

    .line 334
    .line 335
    const-string v6, ""

    .line 336
    .line 337
    const-string v7, ""

    .line 338
    .line 339
    const-string v8, ""

    .line 340
    .line 341
    const-string v10, ""

    .line 342
    .line 343
    invoke-direct/range {v2 .. v12}, Ll/a320;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 347
    .line 348
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 349
    .line 350
    if-eqz v0, :cond_8

    .line 351
    .line 352
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 353
    .line 354
    invoke-virtual {v0, p0}, Ll/dvx;->w(Ll/a320;)V

    .line 355
    .line 356
    .line 357
    :cond_8
    return-void
.end method

.method private final native _addAudioCallbackBuffer([BI)V
.end method

.method private native _clearCutPosition()V
.end method

.method private native _configBufferCache(I)V
.end method

.method private native _configMaxDropBase(I)V
.end method

.method private native _getAudioCodecInfo()Ljava/lang/String;
.end method

.method private native _getAudioTrackNum()I
.end method

.method private static native _getColorFormatName(I)Ljava/lang/String;
.end method

.method private native _getMediaMeta()Landroid/os/Bundle;
.end method

.method private native _getPropertyFloat(IF)F
.end method

.method private _getPropertyFloat_(IF)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

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
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

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

.method private native _getPropertyString(I)Ljava/lang/String;
.end method

.method private native _getRate()F
.end method

.method private native _getReadByte()J
.end method

.method private native _getServerIpAddr()Ljava/lang/String;
.end method

.method private native _getVideoCodecInfo()Ljava/lang/String;
.end method

.method private native _mlSetLowerLatency(IIIIF)V
.end method

.method private native _openAudioTracks(Z)V
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

.method private native _resetInternal()V
.end method

.method private native _setAudioTrackIndex(I)V
.end method

.method private native _setBufferParams(IIIII)V
.end method

.method private native _setCutPosition(FFFF)V
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

.method private native _setDynamicBuffer(Z)V
.end method

.method private native _setMediaDateCallbackFlags(I)V
.end method

.method private native _setOption(ILjava/lang/String;J)V
.end method

.method private native _setOption(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native _setPlayback(Z)V
.end method

.method private native _setPropertyFloat(IF)V
.end method

.method private _setPropertyFloat_(IF)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat(IF)V
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
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method private native _setQuicProxy(Z)V
.end method

.method private native _setRate(F)V
.end method

.method private native _setSpeedControl(IIFIF)V
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

.method public static synthetic access$000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNativeMediaPlayer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullDetectV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStopV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->bufferStartV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->bufferStopV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullWatchV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullBufferCheck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1802(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoDarNum:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1902(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoDarDen:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullBufferDropV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$202(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$2100(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferPerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2202(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferPerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J
    .locals 2

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getReadByte()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic access$2500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastBufferSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$2502(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastBufferSize:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$2600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2700(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastPullSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$2702(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLastPullSize:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$2800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizePerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2802(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizePerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2900(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogHz:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHwCodec:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/fakeSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ll/vvx;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private bufferStartV2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 11
    .line 12
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCachedDuration()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iput-wide v1, v0, Ll/vvx;->u:J

    .line 17
    .line 18
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 19
    .line 20
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioCachedDuration()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iput-wide v1, v0, Ll/vvx;->v:J

    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bpf0;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 35
    .line 36
    const/4 v2, -0x1

    .line 37
    if-eq v0, v2, :cond_1

    .line 38
    .line 39
    int-to-long v2, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-wide/16 v2, 0x2

    .line 42
    .line 43
    :goto_0
    iput-wide v2, v1, Ll/vvx;->q:J

    .line 44
    .line 45
    :cond_2
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferPerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferPerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_3

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ljava/lang/Long;

    .line 71
    .line 72
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, ":"

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    add-int/lit8 v2, v2, -0x1

    .line 92
    .line 93
    const/4 v3, 0x0

    .line 94
    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, v1, Ll/vvx;->Z:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 102
    .line 103
    const-string v1, ""

    .line 104
    .line 105
    iput-object v1, v0, Ll/vvx;->Z:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    :catch_0
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 108
    .line 109
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 110
    .line 111
    .line 112
    move-result-wide v1

    .line 113
    iput-wide v1, v0, Ll/vvx;->f0:J

    .line 114
    .line 115
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/dvx;->a()V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private bufferStopV2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 11
    .line 12
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCachedDuration()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iput-wide v1, v0, Ll/vvx;->u:J

    .line 17
    .line 18
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 19
    .line 20
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioCachedDuration()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iput-wide v1, v0, Ll/vvx;->v:J

    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bpf0;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 35
    .line 36
    const/4 v2, -0x1

    .line 37
    if-eq v0, v2, :cond_1

    .line 38
    .line 39
    int-to-long v2, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-wide/16 v2, 0x2

    .line 42
    .line 43
    :goto_0
    iput-wide v2, v1, Ll/vvx;->q:J

    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 46
    .line 47
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    iput-wide v1, v0, Ll/vvx;->f0:J

    .line 52
    .line 53
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/dvx;->b()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private configDataProcess(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "playerBufferMax"

    .line 2
    .line 3
    const-string v1, "enableVBR"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMaxTimeOfBuffer(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    :cond_1
    return-void
.end method

.method private getCdnIp(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1
    const-string p0, "["

    .line 2
    .line 3
    const-string v0, "/"

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    const-string v2, "//"

    .line 16
    .line 17
    invoke-static {p1, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/lit8 v2, v2, 0x2

    .line 22
    .line 23
    invoke-static {p1, v0, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-ltz v2, :cond_7

    .line 28
    .line 29
    if-gez v3, :cond_1

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    const/4 v4, 0x0

    .line 42
    const-string v5, "]"

    .line 43
    .line 44
    const/4 v6, 0x1

    .line 45
    const-string v7, ":"

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    :try_start_1
    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-lez v2, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    goto :goto_0

    .line 60
    :catch_0
    move-exception p0

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :cond_3
    :goto_0
    const-string v2, "127.0.0.1"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_4

    .line 83
    .line 84
    const-string v2, "::1"

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_4

    .line 91
    .line 92
    const-string v2, "0:0:0:0:0:0:0:1"

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_7

    .line 99
    .line 100
    :cond_4
    add-int/2addr v3, v6

    .line 101
    invoke-static {p1, v0, v3}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-ltz v3, :cond_7

    .line 106
    .line 107
    if-gez v0, :cond_5

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_6

    .line 119
    .line 120
    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-lez p0, :cond_7

    .line 125
    .line 126
    invoke-virtual {v1, v6, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0

    .line 131
    :cond_6
    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_7

    .line 136
    .line 137
    const-string p0, "::"

    .line 138
    .line 139
    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-nez p0, :cond_7

    .line 144
    .line 145
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-ne p0, p1, :cond_7

    .line 154
    .line 155
    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    invoke-virtual {v1, v4, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 163
    return-object p0

    .line 164
    :cond_7
    :goto_1
    return-object v1

    .line 165
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 166
    .line 167
    .line 168
    return-object v1
.end method

.method public static getColorFormatName(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getColorFormatName(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private getFirstVideoHasMomoSEI()J
    .locals 3

    .line 1
    const/16 v0, 0x4e42

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method private getNetAnchorTime()J
    .locals 4

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->U0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/csx;->X()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    return-wide v0

    .line 20
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNetDiffTime:J

    .line 25
    .line 26
    sub-long/2addr v0, v2

    .line 27
    return-wide v0
.end method

.method private getPullDetects()Ljava/lang/String;
    .locals 13

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPullDetectStatus()[Ltv/danmaku/ijk/media/player/pullDetect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    array-length v1, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    move v4, v3

    .line 16
    move v5, v4

    .line 17
    move v6, v5

    .line 18
    move v7, v6

    .line 19
    :goto_0
    if-ge v2, v1, :cond_1

    .line 20
    .line 21
    aget-object v8, p0, v2

    .line 22
    .line 23
    iget-wide v9, v8, Ltv/danmaku/ijk/media/player/pullDetect;->timestamp:J

    .line 24
    .line 25
    const-wide/16 v11, 0x0

    .line 26
    .line 27
    cmp-long v9, v9, v11

    .line 28
    .line 29
    if-eqz v9, :cond_0

    .line 30
    .line 31
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    iget v7, v8, Ltv/danmaku/ijk/media/player/pullDetect;->dnsTime:I

    .line 34
    .line 35
    add-int/2addr v4, v7

    .line 36
    int-to-long v9, v5

    .line 37
    iget-wide v11, v8, Ltv/danmaku/ijk/media/player/pullDetect;->tcpConnectTime:J

    .line 38
    .line 39
    add-long/2addr v9, v11

    .line 40
    long-to-int v5, v9

    .line 41
    int-to-long v6, v6

    .line 42
    iget-wide v9, v8, Ltv/danmaku/ijk/media/player/pullDetect;->httpTime:J

    .line 43
    .line 44
    add-long/2addr v6, v9

    .line 45
    long-to-int v6, v6

    .line 46
    iget v7, v8, Ltv/danmaku/ijk/media/player/pullDetect;->ffmpegErrno:I

    .line 47
    .line 48
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v1, ","

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    const-string p0, "0,0,0,0,0"

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method

.method private static initNativeOnce()V
    .locals 2

    .line 1
    const-class v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_init()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    sput-boolean v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsNativeInitialized:Z

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

.method private initPlayer(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->initNativeOnce()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 47
    .line 48
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 49
    .line 50
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 63
    .line 64
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 68
    .line 69
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 70
    .line 71
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 79
    .line 80
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 81
    .line 82
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHwCodec:Z

    .line 86
    .line 87
    iput-boolean v0, p1, Ll/vvx;->n:Z

    .line 88
    .line 89
    :try_start_0
    new-instance p1, Landroid/os/HandlerThread;

    .line 90
    .line 91
    const-string v0, "MediaDateC"

    .line 92
    .line 93
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;

    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;

    .line 102
    .line 103
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

    .line 108
    .line 109
    invoke-direct {v0, p0, p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :catch_0
    move-exception p1

    .line 116
    goto :goto_1

    .line 117
    :catch_1
    move-exception p1

    .line 118
    goto :goto_2

    .line 119
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 124
    .line 125
    .line 126
    :goto_3
    :try_start_1
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 127
    .line 128
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_setup(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_2

    .line 132
    .line 133
    .line 134
    goto :goto_4

    .line 135
    :catch_2
    move-exception p0

    .line 136
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 137
    .line 138
    .line 139
    goto :goto_4

    .line 140
    :catch_3
    move-exception p0

    .line 141
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 142
    .line 143
    .line 144
    :goto_4
    return-void
.end method

.method public static loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 2

    .line 1
    const-class v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

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
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const-string v1, "cosmosffmpeg"

    .line 18
    .line 19
    invoke-interface {p0, v1}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v1, "ijklivesdl"

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v1, "ijkplayer"

    .line 28
    .line 29
    invoke-interface {p0, v1}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    sput-boolean p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsLibLoaded:Z

    .line 34
    .line 35
    :cond_1
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method private mediaLogs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dvx;->f()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/dvx;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method private varargs mediaLogs2([Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dvx;->f()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
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

.method private static onControlResolveSegmentCount(Ljava/lang/Object;)I
    .locals 3
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v1, "IjkMediaPlayer"

    .line 5
    .line 6
    const-string v2, "onControlResolveSegmentCount"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/esx;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 31
    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    return v0

    .line 35
    :cond_2
    invoke-interface {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;->onControlResolveSegmentCount()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_3
    :goto_0
    return v0
.end method

.method private static onControlResolveSegmentDuration(Ljava/lang/Object;I)I
    .locals 3
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "IjkMediaPlayer"

    .line 10
    .line 11
    const-string v2, "onControlResolveSegmentDuration %d"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Ll/esx;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    if-eqz p0, :cond_3

    .line 18
    .line 19
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    return v0

    .line 35
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 36
    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;->onControlResolveSegmentDuration(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    :goto_0
    return v0
.end method

.method private static onControlResolveSegmentOfflineMrl(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 3
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "IjkMediaPlayer"

    .line 10
    .line 11
    const-string v2, "onControlResolveSegmentOfflineMrl %d"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Ll/esx;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p0, :cond_3

    .line 18
    .line 19
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 36
    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;->onControlResolveSegmentOfflineMrl(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_3
    :goto_0
    return-object v0
.end method

.method private static onControlResolveSegmentUrl(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 3
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "IjkMediaPlayer"

    .line 10
    .line 11
    const-string v2, "onControlResolveSegmentUrl %d"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Ll/esx;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p0, :cond_3

    .line 18
    .line 19
    instance-of v1, p0, Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 36
    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;->onControlResolveSegmentUrl(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_3
    :goto_0
    return-object v0
.end method

.method private static onNotifyJson(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 7
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    const-string p1, "ts"

    .line 2
    .line 3
    const-string p2, "["

    .line 4
    .line 5
    const-string v0, "mediaplayer json:"

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/String;

    .line 24
    .line 25
    move-object v3, p3

    .line 26
    check-cast v3, [B

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 29
    .line 30
    .line 31
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const-wide/16 v3, 0x0

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    goto :goto_1

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_3

    .line 49
    :cond_2
    move-wide v5, v3

    .line 50
    :goto_1
    cmp-long p1, v5, v3

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    iput-wide v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIFrameTime:J

    .line 55
    .line 56
    :cond_3
    iget-wide v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIFrameTime:J

    .line 57
    .line 58
    cmp-long p1, v5, v3

    .line 59
    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getNetAnchorTime()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iget-wide v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIFrameTime:J

    .line 67
    .line 68
    sub-long/2addr v2, v4

    .line 69
    iput-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_4
    iput-wide v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 73
    .line 74
    :goto_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 75
    .line 76
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 77
    .line 78
    iput-wide v2, p1, Ll/vvx;->K:J

    .line 79
    .line 80
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 81
    .line 82
    const/16 p1, 0x4e39

    .line 83
    .line 84
    invoke-direct {p0, p1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 85
    .line 86
    .line 87
    const-string p1, "lqdebug"

    .line 88
    .line 89
    new-instance v2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    const-string p1, "IjkMediaPlayer"

    .line 109
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p2, "] onNotifyJson sei   "

    .line 123
    .line 124
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p2, " delay "

    .line 135
    .line 136
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-wide v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 140
    .line 141
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-static {p1, p2}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    .line 151
    goto :goto_4

    .line 152
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 153
    .line 154
    .line 155
    :goto_4
    check-cast p3, [B

    .line 156
    .line 157
    const/4 p1, 0x0

    .line 158
    invoke-virtual {p0, p3, p1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sendJsonData([BILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method private static onSelectCodec(Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;
    .locals 3
    .annotation build Ltv/danmaku/ijk/media/player/annotations/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_4

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
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const-string v1, "ffmpeg/video"

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    if-ne v1, v2, :cond_2

    .line 28
    .line 29
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string p2, "onSelectCodec use ffmpeg codec: "

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "IjkMediaPlayer"

    .line 46
    .line 47
    invoke-static {p2, p1}, Ll/esx;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 51
    .line 52
    const/4 p2, 0x0

    .line 53
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHwCodec:Z

    .line 54
    .line 55
    iput-boolean p2, p1, Ll/vvx;->n:Z

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 59
    .line 60
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHwCodec:Z

    .line 61
    .line 62
    iput-boolean v2, v0, Ll/vvx;->n:Z

    .line 63
    .line 64
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    sget-object v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;->sInstance:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$DefaultMediaCodecSelector;

    .line 69
    .line 70
    :cond_3
    invoke-interface {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;->onMediaCodecSelect(Ltv/danmaku/ijk/media/player/IMediaPlayer;Ljava/lang/String;II)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_4
    :goto_0
    return-object v0
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 3
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
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

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
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->start()V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 26
    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    const/4 v1, 0x5

    .line 30
    if-ne p1, v1, :cond_3

    .line 31
    .line 32
    shr-int/lit8 v1, p2, 0x10

    .line 33
    .line 34
    const v2, 0xffff

    .line 35
    .line 36
    .line 37
    and-int/2addr v1, v2

    .line 38
    int-to-short v1, v1

    .line 39
    and-int/2addr p2, v2

    .line 40
    int-to-short p2, p2

    .line 41
    invoke-virtual {v0, p1, v1, p2, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 46
    .line 47
    int-to-long p2, p3

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 59
    .line 60
    .line 61
    :cond_4
    :goto_0
    return-void
.end method

.method private static postMediaDateFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 1

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
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

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
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

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

.method private pullBufferCheck()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoOutputFrames()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iput-wide v1, v0, Ll/vvx;->y:J

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 10
    .line 11
    iget-wide v1, v0, Ll/vvx;->y:J

    .line 12
    .line 13
    iget-wide v3, v0, Ll/vvx;->I:J

    .line 14
    .line 15
    sub-long v3, v1, v3

    .line 16
    .line 17
    iput-wide v1, v0, Ll/vvx;->I:J

    .line 18
    .line 19
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const-wide/16 v1, 0x5

    .line 24
    .line 25
    div-long v5, v3, v1

    .line 26
    .line 27
    cmp-long v1, v5, v1

    .line 28
    .line 29
    if-gtz v1, :cond_0

    .line 30
    .line 31
    iget-wide v1, v0, Ll/vvx;->J:J

    .line 32
    .line 33
    const-wide/16 v5, 0x1

    .line 34
    .line 35
    add-long/2addr v1, v5

    .line 36
    iput-wide v1, v0, Ll/vvx;->J:J

    .line 37
    .line 38
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "pullBufferCheck diff "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v1, "/"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 54
    .line 55
    iget-wide v1, p0, Ll/vvx;->J:J

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string v0, "buffercheckcount"

    .line 65
    .line 66
    invoke-static {v0, p0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private pullBufferDropV2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 11
    .line 12
    const/16 v1, 0x4e49

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    invoke-direct {p0, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iput-wide v1, v0, Ll/vvx;->d0:J

    .line 21
    .line 22
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dvx;->l()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private pullDetectV2()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/dvx;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dvx;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_3

    .line 20
    .line 21
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPullDetectStatus()[Ltv/danmaku/ijk/media/player/pullDetect;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    array-length v3, v1

    .line 33
    const/4 v4, 0x0

    .line 34
    :goto_0
    if-ge v4, v3, :cond_2

    .line 35
    .line 36
    aget-object v5, v1, v4

    .line 37
    .line 38
    iget-wide v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->timestamp:J

    .line 39
    .line 40
    const-wide/16 v8, 0x0

    .line 41
    .line 42
    cmp-long v8, v6, v8

    .line 43
    .line 44
    if-eqz v8, :cond_1

    .line 45
    .line 46
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    iget v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->unixErrno:I

    .line 51
    .line 52
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v10

    .line 56
    iget v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->dnsTime:I

    .line 57
    .line 58
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v11

    .line 62
    iget-wide v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->tcpConnectTime:J

    .line 63
    .line 64
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object v12

    .line 68
    iget-wide v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->httpTime:J

    .line 69
    .line 70
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v13

    .line 74
    iget v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->httpResponseCode:I

    .line 75
    .line 76
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v14

    .line 80
    iget-wide v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->firstPacketTime:J

    .line 81
    .line 82
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v15

    .line 86
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstIFrameTimes()F

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 91
    .line 92
    .line 93
    move-result-object v16

    .line 94
    iget-object v6, v5, Ltv/danmaku/ijk/media/player/pullDetect;->url:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v7, v5, Ltv/danmaku/ijk/media/player/pullDetect;->cdnIp:Ljava/lang/String;

    .line 97
    .line 98
    iget v5, v5, Ltv/danmaku/ijk/media/player/pullDetect;->ffmpegErrno:I

    .line 99
    .line 100
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v19

    .line 104
    iget-object v5, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 105
    .line 106
    move v8, v3

    .line 107
    move/from16 v21, v4

    .line 108
    .line 109
    iget-wide v3, v5, Ll/vvx;->h0:J

    .line 110
    .line 111
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object v20

    .line 115
    move-object/from16 v17, v6

    .line 116
    .line 117
    move-object/from16 v18, v7

    .line 118
    .line 119
    filled-new-array/range {v9 .. v20}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v3}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_1
    move v8, v3

    .line 132
    move/from16 v21, v4

    .line 133
    .line 134
    :goto_1
    add-int/lit8 v4, v21, 0x1

    .line 135
    .line 136
    move v3, v8

    .line 137
    goto :goto_0

    .line 138
    :cond_2
    iget-object v1, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iput-object v2, v1, Ll/vvx;->b:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v0, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/dvx;->m()V

    .line 149
    .line 150
    .line 151
    :cond_3
    :goto_2
    return-void
.end method

.method private pullInitV2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 10
    .line 11
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/dvx;->z(Ll/vvx;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 17
    .line 18
    new-instance v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$2;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$2;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/dvx;->B(Ll/dvx$b;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dvx;->n()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private pullStartV2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 11
    .line 12
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getMetaSystemTime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iput-wide v1, v0, Ll/vvx;->e:J

    .line 17
    .line 18
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 19
    .line 20
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getConnetTimes()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    float-to-long v1, v1

    .line 25
    iput-wide v1, v0, Ll/vvx;->f:J

    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 28
    .line 29
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstVPacketTimes()F

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    float-to-long v1, v1

    .line 34
    iput-wide v1, v0, Ll/vvx;->g:J

    .line 35
    .line 36
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 37
    .line 38
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstAPacketTimes()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    float-to-long v1, v1

    .line 43
    iput-wide v1, v0, Ll/vvx;->h:J

    .line 44
    .line 45
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 46
    .line 47
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstIFrameTimes()F

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    float-to-long v1, v1

    .line 52
    iput-wide v1, v0, Ll/vvx;->i:J

    .line 53
    .line 54
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 55
    .line 56
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstAFrameTimes()F

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    float-to-long v1, v1

    .line 61
    iput-wide v1, v0, Ll/vvx;->j:J

    .line 62
    .line 63
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 64
    .line 65
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstVRenderTimes()F

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    float-to-long v1, v1

    .line 70
    iput-wide v1, v0, Ll/vvx;->k:J

    .line 71
    .line 72
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 73
    .line 74
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstARenderTimes()F

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    float-to-long v1, v1

    .line 79
    iput-wide v1, v0, Ll/vvx;->l:J

    .line 80
    .line 81
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 82
    .line 83
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getStreamCount()J

    .line 84
    .line 85
    .line 86
    move-result-wide v1

    .line 87
    iput-wide v1, v0, Ll/vvx;->m:J

    .line 88
    .line 89
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 90
    .line 91
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstVideoHasMomoSEI()J

    .line 92
    .line 93
    .line 94
    move-result-wide v1

    .line 95
    iput-wide v1, v0, Ll/vvx;->P:J

    .line 96
    .line 97
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 98
    .line 99
    const/16 v1, 0x4e44

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPropertyString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v0, Ll/vvx;->S:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 108
    .line 109
    const/16 v1, 0x4e45

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPropertyString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Ll/vvx;->T:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 118
    .line 119
    const/16 v1, 0x4e49

    .line 120
    .line 121
    const-wide/16 v2, 0x0

    .line 122
    .line 123
    invoke-direct {p0, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 124
    .line 125
    .line 126
    move-result-wide v1

    .line 127
    iput-wide v1, v0, Ll/vvx;->d0:J

    .line 128
    .line 129
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 130
    .line 131
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 132
    .line 133
    .line 134
    move-result-wide v1

    .line 135
    iput-wide v1, v0, Ll/vvx;->f0:J

    .line 136
    .line 137
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 138
    .line 139
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->detectStatus:I

    .line 140
    .line 141
    iput v1, v0, Ll/vvx;->g0:I

    .line 142
    .line 143
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 144
    .line 145
    if-eqz v0, :cond_2

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/bpf0;->b()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 152
    .line 153
    const/4 v2, -0x1

    .line 154
    if-eq v0, v2, :cond_1

    .line 155
    .line 156
    int-to-long v2, v0

    .line 157
    goto :goto_0

    .line 158
    :cond_1
    const-wide/16 v2, 0x2

    .line 159
    .line 160
    :goto_0
    iput-wide v2, v1, Ll/vvx;->q:J

    .line 161
    .line 162
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 163
    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/bpf0;->a()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    if-eqz v0, :cond_3

    .line 171
    .line 172
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_3

    .line 177
    .line 178
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 179
    .line 180
    iput-object v0, v1, Ll/vvx;->d:Ljava/lang/String;

    .line 181
    .line 182
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 183
    .line 184
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 185
    .line 186
    invoke-virtual {v1}, Ll/bpf0;->c()J

    .line 187
    .line 188
    .line 189
    move-result-wide v1

    .line 190
    iput-wide v1, v0, Ll/vvx;->U:J

    .line 191
    .line 192
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 193
    .line 194
    iget-object v0, v0, Ll/vvx;->d:Ljava/lang/String;

    .line 195
    .line 196
    const-string v1, "0.0.0.0"

    .line 197
    .line 198
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_5

    .line 203
    .line 204
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 205
    .line 206
    iget-object v0, v0, Ll/vvx;->d:Ljava/lang/String;

    .line 207
    .line 208
    const-string v1, "127.0.0.1"

    .line 209
    .line 210
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_6

    .line 215
    .line 216
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_6

    .line 223
    .line 224
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 225
    .line 226
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/Utils;->isValidIpAddress(Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_6

    .line 231
    .line 232
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 233
    .line 234
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 235
    .line 236
    iput-object v1, v0, Ll/vvx;->d:Ljava/lang/String;

    .line 237
    .line 238
    :cond_6
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullDetectV2()V

    .line 239
    .line 240
    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    const-string v1, "isFirstVideoHasMomoSEI = "

    .line 244
    .line 245
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 249
    .line 250
    iget-wide v1, v1, Ll/vvx;->P:J

    .line 251
    .line 252
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const-string v1, "pullJzheng"

    .line 260
    .line 261
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    .line 263
    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    const-string v2, "ipAddrOfCDN = "

    .line 267
    .line 268
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 272
    .line 273
    iget-object v2, v2, Ll/vvx;->S:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v2, "ipAddrOfClient = "

    .line 288
    .line 289
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 293
    .line 294
    iget-object v2, v2, Ll/vvx;->T:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 307
    .line 308
    invoke-virtual {v0}, Ll/dvx;->o()V

    .line 309
    .line 310
    .line 311
    const/4 v0, 0x1

    .line 312
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 313
    .line 314
    return-void
.end method

.method private pullStopV2()V
    .locals 8

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullDetectV2()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updatePullWatch()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/bpf0;->b()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 25
    .line 26
    const/4 v2, -0x1

    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    int-to-long v2, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-wide/16 v2, 0x2

    .line 32
    .line 33
    :goto_0
    iput-wide v2, v1, Ll/vvx;->q:J

    .line 34
    .line 35
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/bpf0;->c()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    iput-wide v2, v1, Ll/vvx;->U:J

    .line 42
    .line 43
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/bpf0;->a()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 58
    .line 59
    iput-object v0, v1, Ll/vvx;->d:Ljava/lang/String;

    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 62
    .line 63
    iget-object v0, v0, Ll/vvx;->d:Ljava/lang/String;

    .line 64
    .line 65
    const-string v1, "0.0.0.0"

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 74
    .line 75
    iget-object v0, v0, Ll/vvx;->d:Ljava/lang/String;

    .line 76
    .line 77
    const-string v1, "127.0.0.1"

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/Utils;->isValidIpAddress(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 100
    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 104
    .line 105
    iput-object v0, v1, Ll/vvx;->d:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getServerIpAddr()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, v1, Ll/vvx;->d:Ljava/lang/String;

    .line 113
    .line 114
    :cond_5
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 115
    .line 116
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 117
    .line 118
    const-wide/16 v2, 0x0

    .line 119
    .line 120
    const-wide/16 v4, 0x1

    .line 121
    .line 122
    if-eqz v1, :cond_6

    .line 123
    .line 124
    move-wide v6, v4

    .line 125
    goto :goto_2

    .line 126
    :cond_6
    move-wide v6, v2

    .line 127
    :goto_2
    iput-wide v6, v0, Ll/vvx;->V:J

    .line 128
    .line 129
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getReadByte()J

    .line 130
    .line 131
    .line 132
    move-result-wide v6

    .line 133
    iput-wide v6, v0, Ll/vvx;->r:J

    .line 134
    .line 135
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 136
    .line 137
    if-eqz v0, :cond_7

    .line 138
    .line 139
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 140
    .line 141
    iget-wide v6, v0, Ll/vvx;->o:J

    .line 142
    .line 143
    cmp-long v1, v6, v4

    .line 144
    .line 145
    if-nez v1, :cond_7

    .line 146
    .line 147
    iput-wide v2, v0, Ll/vvx;->o:J

    .line 148
    .line 149
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizePerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 150
    .line 151
    const/4 v1, 0x0

    .line 152
    if-eqz v0, :cond_9

    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuffer;

    .line 155
    .line 156
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 157
    .line 158
    .line 159
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizePerSec:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 160
    .line 161
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-eqz v3, :cond_8

    .line 170
    .line 171
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Ljava/lang/Long;

    .line 176
    .line 177
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    .line 183
    .line 184
    const-string v3, ":"

    .line 185
    .line 186
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_8
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    add-int/lit8 v3, v3, -0x1

    .line 197
    .line 198
    invoke-virtual {v0, v1, v3}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, v2, Ll/vvx;->Y:Ljava/lang/String;

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 206
    .line 207
    const-string v2, ""

    .line 208
    .line 209
    iput-object v2, v0, Ll/vvx;->Y:Ljava/lang/String;

    .line 210
    .line 211
    :goto_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 212
    .line 213
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 214
    .line 215
    .line 216
    move-result-wide v2

    .line 217
    iput-wide v2, v0, Ll/vvx;->f0:J

    .line 218
    .line 219
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 220
    .line 221
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->detectStatus:I

    .line 222
    .line 223
    iput v2, v0, Ll/vvx;->g0:I

    .line 224
    .line 225
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/dvx;->p()V

    .line 228
    .line 229
    .line 230
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStartAlreadySend:Z

    .line 231
    .line 232
    return-void
.end method

.method private pullWatchV2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dvx;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updatePullWatch()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "FFP_PROP_INT64_VIDEODONTHASMOMOSEICNT = "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 21
    .line 22
    iget-wide v1, v1, Ll/vvx;->Q:J

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "pullJzheng"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/dvx;->q()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private release_l()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " release_l. "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "IjkMediaPlayer"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->resetListeners()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->release()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 65
    .line 66
    :cond_1
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 67
    .line 68
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 69
    .line 70
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->clearCutPosition()V

    .line 71
    .line 72
    .line 73
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catch_1
    move-exception v1

    .line 83
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

    .line 87
    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

    .line 94
    .line 95
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 96
    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 103
    .line 104
    :cond_3
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;

    .line 105
    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Thread;->join()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_2

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :catch_2
    move-exception v1

    .line 120
    goto :goto_1

    .line 121
    :catch_3
    move-exception v1

    .line 122
    goto :goto_2

    .line 123
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 128
    .line 129
    .line 130
    :cond_4
    :goto_3
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHT:Landroid/os/HandlerThread;

    .line 131
    .line 132
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;

    .line 133
    .line 134
    return-void
.end method

.method private set3D(Z)V
    .locals 3

    .line 1
    const/16 v0, 0x4e52

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-virtual {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setBoost3D(Z)V
    .locals 3

    .line 1
    const/16 v0, 0x4e54

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-virtual {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setBoostHiFi(Z)V
    .locals 3

    .line 1
    const/16 v0, 0x4e55

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-virtual {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setCdnType(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setCdnType"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "setCdnType:"

    .line 29
    .line 30
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ll/brx;->r(I)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/dvx;->D(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :catch_0
    :cond_1
    return-void
.end method

.method private setHifi(Z)V
    .locals 3

    .line 1
    const/16 v0, 0x4e53

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-virtual {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setMediaCodecEnabled_l(Z)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " -->  done: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaCodecSetDone:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, " surface: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "IjkMediaPlayer"

    .line 48
    .line 49
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaCodecSetDone:Z

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    goto/16 :goto_1

    .line 57
    .line 58
    :cond_0
    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaCodecSetDone:Z

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const-wide/16 v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const-wide/16 v2, 0x0

    .line 67
    .line 68
    :goto_0
    const/4 v0, 0x4

    .line 69
    const-string v4, "mediacodec"

    .line 70
    .line 71
    invoke-virtual {p0, v0, v4, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 72
    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 78
    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    new-instance p1, Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 82
    .line 83
    invoke-direct {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 87
    .line 88
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setSaturation(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 94
    .line 95
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setDeblurWeight(F)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 101
    .line 102
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblueEnabled:Z

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setDeblurEnabled(Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 108
    .line 109
    sget-object v2, Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;->RENDER_MODE_SIMPLE:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 110
    .line 111
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setRenderMode(Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    new-instance p1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v2, "HWRender Start \u786c\u89e3\u5f00"

    .line 132
    .line 133
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const-string v2, "hwDecoder"

    .line 141
    .line 142
    filled-new-array {v2, p1}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 150
    .line 151
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->getLastErr()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_2

    .line 156
    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string v2, "setMediaCodecEnabled_l"

    .line 160
    .line 161
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v2, " mFakeSurface creat error: "

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 177
    .line 178
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->getLastErr()I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 197
    .line 198
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->release()V

    .line 199
    .line 200
    .line 201
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 202
    .line 203
    const-string p0, "mFakeSurface creat error use softdec"

    .line 204
    .line 205
    invoke-static {v1, p0}, Ll/esx;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    :cond_2
    :goto_1
    return-void

    .line 209
    :cond_3
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 210
    .line 211
    return-void
.end method

.method public static splitQuery(Ljava/net/URL;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-string v1, "&"

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    array-length v1, p0

    .line 20
    const/4 v2, 0x0

    .line 21
    move v3, v2

    .line 22
    :goto_0
    if-ge v3, v1, :cond_1

    .line 23
    .line 24
    aget-object v4, p0, v3

    .line 25
    .line 26
    const-string v5, "="

    .line 27
    .line 28
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    const-string v7, "UTF-8"

    .line 37
    .line 38
    invoke-static {v6, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    add-int/lit8 v5, v5, 0x1

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {v4, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-interface {v0, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    :goto_1
    return-object v0
.end method

.method private stayAwake(Z)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mStayAwake:Z

    .line 35
    .line 36
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private updatePullWatch()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getReadByte()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iput-wide v1, v0, Ll/vvx;->r:J

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoReadSize()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Ll/vvx;->s:J

    .line 16
    .line 17
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 18
    .line 19
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioReadSize()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    iput-wide v1, v0, Ll/vvx;->t:J

    .line 24
    .line 25
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 26
    .line 27
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCachedDuration()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    iput-wide v1, v0, Ll/vvx;->u:J

    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 34
    .line 35
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioCachedDuration()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    iput-wide v1, v0, Ll/vvx;->v:J

    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 42
    .line 43
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoDecodeFrames()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    iput-wide v1, v0, Ll/vvx;->w:J

    .line 48
    .line 49
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 50
    .line 51
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioDecoderSize()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    iput-wide v1, v0, Ll/vvx;->x:J

    .line 56
    .line 57
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 58
    .line 59
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoOutputFrames()J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    iput-wide v1, v0, Ll/vvx;->y:J

    .line 64
    .line 65
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 66
    .line 67
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioRenderSize()J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    iput-wide v1, v0, Ll/vvx;->z:J

    .line 72
    .line 73
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 74
    .line 75
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioSampleRate()F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    float-to-long v1, v1

    .line 80
    iput-wide v1, v0, Ll/vvx;->L:J

    .line 81
    .line 82
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 83
    .line 84
    const/16 v1, 0x4e43

    .line 85
    .line 86
    const-wide/16 v2, 0x0

    .line 87
    .line 88
    invoke-virtual {p0, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPropertyLong(IJ)J

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    iput-wide v1, v0, Ll/vvx;->Q:J

    .line 93
    .line 94
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 95
    .line 96
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 97
    .line 98
    .line 99
    move-result-wide v1

    .line 100
    iput-wide v1, v0, Ll/vvx;->f0:J

    .line 101
    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 103
    .line 104
    if-eqz v0, :cond_1

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/bpf0;->b()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 111
    .line 112
    const/4 v1, -0x1

    .line 113
    if-eq v0, v1, :cond_0

    .line 114
    .line 115
    int-to-long v0, v0

    .line 116
    goto :goto_0

    .line 117
    :cond_0
    const-wide/16 v0, 0x2

    .line 118
    .line 119
    :goto_0
    iput-wide v0, p0, Ll/vvx;->q:J

    .line 120
    .line 121
    :cond_1
    return-void
.end method

.method private updateSurfaceScreenOn()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mStayAwake:Z

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
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

.method public native _getPullDetectStatus()[Ljava/lang/Object;
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

.method public native _setVolume(FF)V
.end method

.method public applyMediaConfig(Ll/bsx;)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "mediaConfig === "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "applyMediaConfig"

    .line 22
    .line 23
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 32
    .line 33
    iget v2, p1, Ll/bsx;->n:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/dvx;->x(I)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 39
    .line 40
    iget v2, p1, Ll/bsx;->m:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/dvx;->A(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 46
    .line 47
    iget v2, p1, Ll/bsx;->j:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ll/dvx;->v(I)V

    .line 50
    .line 51
    .line 52
    iget v1, p1, Ll/bsx;->Q0:I

    .line 53
    .line 54
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 55
    .line 56
    iget v1, p1, Ll/bsx;->J0:I

    .line 57
    .line 58
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableLogBufferAndPullSize:I

    .line 59
    .line 60
    iget v1, p1, Ll/bsx;->K0:I

    .line 61
    .line 62
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 63
    .line 64
    iget v1, p1, Ll/bsx;->L0:I

    .line 65
    .line 66
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogCount:I

    .line 67
    .line 68
    iget v1, p1, Ll/bsx;->M0:I

    .line 69
    .line 70
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogCount:I

    .line 71
    .line 72
    iget v1, p1, Ll/bsx;->N0:I

    .line 73
    .line 74
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoRenderTHold:I

    .line 75
    .line 76
    iget v1, p1, Ll/bsx;->O0:I

    .line 77
    .line 78
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewEnableLatency:I

    .line 79
    .line 80
    iget v1, p1, Ll/bsx;->P0:F

    .line 81
    .line 82
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mAudioPtsValue:F

    .line 83
    .line 84
    iget v1, p1, Ll/bsx;->R0:F

    .line 85
    .line 86
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMinVideoJumpDuration:F

    .line 87
    .line 88
    iget v1, p1, Ll/bsx;->U0:I

    .line 89
    .line 90
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDecorderRecordPts:I

    .line 91
    .line 92
    iget v1, p1, Ll/bsx;->S0:I

    .line 93
    .line 94
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewcheckSei:I

    .line 95
    .line 96
    iget v1, p1, Ll/bsx;->T0:I

    .line 97
    .line 98
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewSizeChange:I

    .line 99
    .line 100
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget v2, p1, Ll/bsx;->G0:I

    .line 105
    .line 106
    const/4 v6, 0x0

    .line 107
    const/4 v7, 0x1

    .line 108
    if-ne v2, v7, :cond_1

    .line 109
    .line 110
    move v2, v7

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    move v2, v6

    .line 113
    :goto_0
    invoke-virtual {v1, v2}, Ll/csx;->s1(Z)V

    .line 114
    .line 115
    .line 116
    iget v1, p1, Ll/bsx;->H0:I

    .line 117
    .line 118
    if-lez v1, :cond_2

    .line 119
    .line 120
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 121
    .line 122
    int-to-long v3, v1

    .line 123
    invoke-virtual {v2, v3, v4}, Ll/dvx;->C(J)V

    .line 124
    .line 125
    .line 126
    :cond_2
    iget v1, p1, Ll/bsx;->I0:I

    .line 127
    .line 128
    if-lez v1, :cond_3

    .line 129
    .line 130
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 131
    .line 132
    int-to-long v3, v1

    .line 133
    invoke-virtual {v2, v3, v4}, Ll/dvx;->u(J)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget v1, p1, Ll/bsx;->N0:I

    .line 137
    .line 138
    int-to-long v1, v1

    .line 139
    const/16 v3, 0x4e47

    .line 140
    .line 141
    invoke-virtual {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 142
    .line 143
    .line 144
    iget v1, p1, Ll/bsx;->O0:I

    .line 145
    .line 146
    int-to-long v1, v1

    .line 147
    const/16 v3, 0x4e48

    .line 148
    .line 149
    invoke-virtual {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 150
    .line 151
    .line 152
    const/16 v1, 0x2720

    .line 153
    .line 154
    iget v2, p1, Ll/bsx;->P0:F

    .line 155
    .line 156
    invoke-direct {p0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 157
    .line 158
    .line 159
    const/16 v1, 0x2721

    .line 160
    .line 161
    iget v2, p1, Ll/bsx;->R0:F

    .line 162
    .line 163
    invoke-direct {p0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 164
    .line 165
    .line 166
    iget v1, p1, Ll/bsx;->U0:I

    .line 167
    .line 168
    int-to-long v1, v1

    .line 169
    const/16 v3, 0x4e56

    .line 170
    .line 171
    invoke-direct {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 172
    .line 173
    .line 174
    iget v1, p1, Ll/bsx;->S0:I

    .line 175
    .line 176
    int-to-long v1, v1

    .line 177
    const/16 v3, 0x4e57

    .line 178
    .line 179
    invoke-direct {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 180
    .line 181
    .line 182
    iget v1, p1, Ll/bsx;->V0:I

    .line 183
    .line 184
    int-to-long v1, v1

    .line 185
    const/16 v3, 0x4e67

    .line 186
    .line 187
    invoke-direct {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 188
    .line 189
    .line 190
    iget v1, p1, Ll/bsx;->T0:I

    .line 191
    .line 192
    int-to-long v1, v1

    .line 193
    const/16 v3, 0x4e66

    .line 194
    .line 195
    invoke-direct {p0, v3, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 196
    .line 197
    .line 198
    iget v1, p1, Ll/bsx;->W0:I

    .line 199
    .line 200
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 201
    .line 202
    iget v2, p1, Ll/bsx;->X0:I

    .line 203
    .line 204
    iput v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 205
    .line 206
    iget v3, p1, Ll/bsx;->Y0:I

    .line 207
    .line 208
    iput v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 209
    .line 210
    iget v4, p1, Ll/bsx;->Z0:I

    .line 211
    .line 212
    iput v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 213
    .line 214
    iget v5, p1, Ll/bsx;->a1:F

    .line 215
    .line 216
    iput v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedRate:F

    .line 217
    .line 218
    iget v8, p1, Ll/bsx;->b1:I

    .line 219
    .line 220
    iput v8, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 221
    .line 222
    iget v8, p1, Ll/bsx;->c1:I

    .line 223
    .line 224
    iput v8, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 225
    .line 226
    iget v8, p1, Ll/bsx;->d1:I

    .line 227
    .line 228
    iput v8, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 229
    .line 230
    iget v8, p1, Ll/bsx;->e1:I

    .line 231
    .line 232
    iput v8, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 233
    .line 234
    iget v8, p1, Ll/bsx;->f1:I

    .line 235
    .line 236
    iput v8, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 237
    .line 238
    move-object v0, p0

    .line 239
    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mlSetLowerLatency(IIIIF)V

    .line 240
    .line 241
    .line 242
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 243
    .line 244
    if-lez v1, :cond_4

    .line 245
    .line 246
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 247
    .line 248
    if-lez v2, :cond_4

    .line 249
    .line 250
    iget v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 251
    .line 252
    if-lez v3, :cond_4

    .line 253
    .line 254
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 255
    .line 256
    if-lez v4, :cond_4

    .line 257
    .line 258
    iget v5, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 259
    .line 260
    if-lez v5, :cond_4

    .line 261
    .line 262
    move-object v0, p0

    .line 263
    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setBufferParams(IIIII)V

    .line 264
    .line 265
    .line 266
    :cond_4
    iget v1, p1, Ll/bsx;->g1:I

    .line 267
    .line 268
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 269
    .line 270
    iget v1, p1, Ll/bsx;->h1:F

    .line 271
    .line 272
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 273
    .line 274
    iget v1, p1, Ll/bsx;->i1:F

    .line 275
    .line 276
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 277
    .line 278
    iget v1, p1, Ll/bsx;->j1:F

    .line 279
    .line 280
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurRadius:F

    .line 281
    .line 282
    iget v1, p1, Ll/bsx;->k1:F

    .line 283
    .line 284
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurThreshold:F

    .line 285
    .line 286
    iget v1, p1, Ll/bsx;->l1:F

    .line 287
    .line 288
    iput v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContrast:F

    .line 289
    .line 290
    iget v1, p1, Ll/bsx;->F0:I

    .line 291
    .line 292
    if-eqz v1, :cond_5

    .line 293
    .line 294
    move v6, v7

    .line 295
    :cond_5
    iput-boolean v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 296
    .line 297
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 298
    .line 299
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 300
    .line 301
    .line 302
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 303
    .line 304
    new-instance v2, Ljava/lang/StringBuilder;

    .line 305
    .line 306
    const-string v3, "mDecorderRecordPts:"

    .line 307
    .line 308
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    iget v3, p1, Ll/bsx;->U0:I

    .line 312
    .line 313
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string v3, ", NewEnableLatency:"

    .line 317
    .line 318
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    iget v3, p1, Ll/bsx;->O0:I

    .line 322
    .line 323
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    const-string v3, ",Latency_seconds:"

    .line 327
    .line 328
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    iget v3, p1, Ll/bsx;->V0:I

    .line 332
    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    const-string v3, "mediaconfig"

    .line 341
    .line 342
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    invoke-virtual {v1, v2}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 347
    .line 348
    .line 349
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 350
    .line 351
    new-instance v2, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    const-string v3, "mUseOpengl:"

    .line 354
    .line 355
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    iget v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 359
    .line 360
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    new-instance v3, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    const-string v4, "filterOn:"

    .line 370
    .line 371
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 375
    .line 376
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    const-string v0, ",checksei:"

    .line 380
    .line 381
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    iget v0, p1, Ll/bsx;->S0:I

    .line 385
    .line 386
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    const-string v0, ",sizechange:"

    .line 390
    .line 391
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    iget v0, p1, Ll/bsx;->T0:I

    .line 395
    .line 396
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    const-string v3, "prepareAsync"

    .line 404
    .line 405
    filled-new-array {v3, v2, v0}, [Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    invoke-virtual {v1, v0}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 410
    .line 411
    .line 412
    return-void
.end method

.method public clearCutPosition()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-virtual {v0, p0, p0, v1, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->updateRect(FFFF)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_clearCutPosition()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public configBufferCache(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_configBufferCache(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public configMaxDropBase(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_configMaxDropBase(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public finalize()V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_finalize()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void
.end method

.method public getAVdiff()F
    .locals 2

    .line 1
    const/16 v0, 0x2715

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
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
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioCachedDuration()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioCachedPackets()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x17

    .line 6
    .line 7
    mul-long/2addr v0, v2

    .line 8
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
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioDecoderSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2e

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioReadSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2b

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioRenderSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2d

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioSampleRate()F
    .locals 2

    .line 1
    const/16 v0, 0x271f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getAudioStreamIndex()J
    .locals 3

    .line 1
    const/16 v0, 0x4e22

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAudioTrackNum()I
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getAudioTrackNum()I

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public getBatteryInfo()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yt0;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBufferCurrent()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 2
    .line 3
    return p0
.end method

.method public getBufferFirst()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 2
    .line 3
    return p0
.end method

.method public getBufferInterval()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public getBufferLast()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 2
    .line 3
    return p0
.end method

.method public getBufferNext()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 2
    .line 3
    return p0
.end method

.method public getConnetTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x2716

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getCurrentPosition()J

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
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getCurrentPts()J

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

.method public getCurrentUrlInfo()Ll/p4k0;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCurrentUrlInfo:Ll/p4k0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDelayTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

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
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getDuration()J

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

.method public getFirstAFrameTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x2718

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getFirstAPacketTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x2719

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getFirstARenderTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x271c

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getFirstIFrameTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x2717

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getFirstVPacketTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x271a

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getFirstVRenderTimes()F
    .locals 2

    .line 1
    const/16 v0, 0x271b

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpg-float v0, p0, v1

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    return p0
.end method

.method public getHardDecoderFlagFromMediaConfig()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLatencyBaseMark()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 2
    .line 3
    return p0
.end method

.method public getLatencyDropMark()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 2
    .line 3
    return p0
.end method

.method public getLatencyEnable()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 2
    .line 3
    return p0
.end method

.method public getLatencySpeedRate()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedRate:F

    .line 2
    .line 3
    return p0
.end method

.method public getLatencySpeedupMark()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 2
    .line 3
    return p0
.end method

.method public getMediaInfo()Ltv/danmaku/ijk/media/player/MediaInfo;
    .locals 8

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/player/MediaInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/MediaInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ijkplayer"

    .line 7
    .line 8
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mMediaPlayerName:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getVideoCodecInfo()Ljava/lang/String;

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
    iput-object v2, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mVideoDecoder:Ljava/lang/String;

    .line 37
    .line 38
    aget-object v1, v1, v6

    .line 39
    .line 40
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mVideoDecoderImpl:Ljava/lang/String;

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
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mVideoDecoder:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v3, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mVideoDecoderImpl:Ljava/lang/String;

    .line 51
    .line 52
    :cond_1
    :goto_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getAudioCodecInfo()Ljava/lang/String;

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
    iput-object v2, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mAudioDecoder:Ljava/lang/String;

    .line 72
    .line 73
    aget-object v1, v1, v6

    .line 74
    .line 75
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mAudioDecoderImpl:Ljava/lang/String;

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
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mAudioDecoder:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v3, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mAudioDecoderImpl:Ljava/lang/String;

    .line 86
    .line 87
    :cond_3
    :goto_1
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getMediaMeta()Landroid/os/Bundle;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ltv/danmaku/ijk/media/player/IjkMediaMeta;->parse(Landroid/os/Bundle;)Ltv/danmaku/ijk/media/player/IjkMediaMeta;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, v0, Ltv/danmaku/ijk/media/player/MediaInfo;->mMeta:Ltv/danmaku/ijk/media/player/IjkMediaMeta;
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
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getMediaMeta()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMetaSystemTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPlayerDebugInfo(I)I
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0

    .line 6
    :pswitch_0
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 7
    .line 8
    return p0

    .line 9
    :pswitch_1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 10
    .line 11
    return p0

    .line 12
    :pswitch_2
    iget-wide p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDelayTime:J

    .line 13
    .line 14
    long-to-int p0, p0

    .line 15
    return p0

    .line 16
    :pswitch_3
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 17
    .line 18
    return p0

    .line 19
    :pswitch_4
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 20
    .line 21
    return p0

    .line 22
    :pswitch_5
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 23
    .line 24
    return p0

    .line 25
    :pswitch_6
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 26
    .line 27
    return p0

    .line 28
    :pswitch_7
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 29
    .line 30
    return p0

    .line 31
    :pswitch_8
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 32
    .line 33
    return p0

    .line 34
    :pswitch_9
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 35
    .line 36
    return p0

    .line 37
    :pswitch_a
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 38
    .line 39
    return p0

    .line 40
    nop

    .line 41
    :pswitch_data_0
    .packed-switch 0x4e58
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPropertyFloat(IF)F
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat(IF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPropertyLong(IJ)J
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-wide p0

    .line 6
    :catch_0
    const-wide/16 p0, 0x0

    .line 7
    .line 8
    return-wide p0
.end method

.method public getPropertyString(I)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "getPropertyString"

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    return-object p0
.end method

.method public getPullDetectStatus()[Ltv/danmaku/ijk/media/player/pullDetect;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPullDetectStatus()[Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, [Ltv/danmaku/ijk/media/player/pullDetect;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :catch_0
    move-exception p0

    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    goto :goto_1

    .line 13
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public getPullWatchInfo(Ltv/danmaku/ijk/media/player/PullWatchInfo;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-lez v2, :cond_0

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v2, v3

    .line 13
    :goto_0
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDataSource()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {v1, v4}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setUrl(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v4, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 21
    .line 22
    iget v5, v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 23
    .line 24
    invoke-virtual {v1, v4, v5}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setPullDebugInfoWH(II)V

    .line 25
    .line 26
    .line 27
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getServerIpAddr()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v1, v4}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setDstIp(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 v4, 0x0

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioReadSize()J

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move-wide v6, v4

    .line 44
    :goto_1
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoReadSize()J

    .line 47
    .line 48
    .line 49
    move-result-wide v8

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move-wide v8, v4

    .line 52
    :goto_2
    if-eqz v2, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoOutputFrames()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    :cond_3
    if-eqz v2, :cond_4

    .line 59
    .line 60
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstARenderTimes()F

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    float-to-int v10, v10

    .line 65
    goto :goto_3

    .line 66
    :cond_4
    move v10, v3

    .line 67
    :goto_3
    if-eqz v2, :cond_5

    .line 68
    .line 69
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getFirstVRenderTimes()F

    .line 70
    .line 71
    .line 72
    move-result v11

    .line 73
    float-to-int v11, v11

    .line 74
    goto :goto_4

    .line 75
    :cond_5
    move v11, v3

    .line 76
    :goto_4
    if-eqz v2, :cond_6

    .line 77
    .line 78
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCachedDuration()J

    .line 79
    .line 80
    .line 81
    move-result-wide v12

    .line 82
    long-to-int v12, v12

    .line 83
    goto :goto_5

    .line 84
    :cond_6
    move v12, v3

    .line 85
    :goto_5
    if-eqz v2, :cond_7

    .line 86
    .line 87
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioCachedDuration()J

    .line 88
    .line 89
    .line 90
    move-result-wide v13

    .line 91
    long-to-int v13, v13

    .line 92
    goto :goto_6

    .line 93
    :cond_7
    move v13, v3

    .line 94
    :goto_6
    if-eqz v2, :cond_8

    .line 95
    .line 96
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDelayTime()J

    .line 97
    .line 98
    .line 99
    move-result-wide v14

    .line 100
    long-to-int v3, v14

    .line 101
    :cond_8
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    invoke-virtual {v14}, Ll/pgy;->b()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v14

    .line 109
    if-eqz v2, :cond_9

    .line 110
    .line 111
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPullDetects()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    :goto_7
    move-object/from16 v16, v14

    .line 116
    .line 117
    move-object v14, v2

    .line 118
    move/from16 v17, v12

    .line 119
    .line 120
    move v12, v3

    .line 121
    move-wide v2, v6

    .line 122
    move-wide v6, v4

    .line 123
    move-wide v4, v8

    .line 124
    move v8, v10

    .line 125
    move v9, v11

    .line 126
    move/from16 v10, v17

    .line 127
    .line 128
    move v11, v13

    .line 129
    move-object/from16 v13, v16

    .line 130
    .line 131
    goto :goto_8

    .line 132
    :cond_9
    const-string v2, "not prepared"

    .line 133
    .line 134
    goto :goto_7

    .line 135
    :goto_8
    invoke-virtual/range {v1 .. v14}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setPullDebugInfoParms(JJJIIIIILjava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCodecType()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    long-to-int v2, v2

    .line 143
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setVideoIsH265(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getAudioSampleRate()F

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    float-to-int v0, v0

    .line 151
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setAudioSampleRate(I)V

    .line 152
    .line 153
    .line 154
    const-string v0, "ijkplayer"

    .line 155
    .line 156
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/player/PullWatchInfo;->setPlayerType(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public getRate()F
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getRate()F

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    return v0

    .line 13
    :catch_1
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return v0
.end method

.method public getReadByte()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getReadByte()J

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

.method public getRealMediaCodecType()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHwCodec:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRenderType()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 2
    .line 3
    return p0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mServerIpAddr:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mServerIpAddr:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getServerIpAddr()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mServerIpAddr:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-object v0

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
    :catch_2
    :goto_0
    const-string p0, "0.0.0.0"

    .line 29
    .line 30
    return-object p0
.end method

.method public getStreamCount()J
    .locals 3

    .line 1
    const/16 v0, 0x4e24

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getTsTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIFrameTime:J

    .line 2
    .line 3
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
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoCachedDuration()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getVideoCachedPackets()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x42

    .line 6
    .line 7
    mul-long/2addr v0, v2

    .line 8
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
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoCodecType()J
    .locals 3

    .line 1
    const/16 v0, 0x4e4a

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    :try_start_0
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-wide v0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    return-wide v1

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    return-wide v1
.end method

.method public getVideoDarDen()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoDarDen:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoDarNum()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoDarNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoDecodeFrames()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2f

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

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
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getVideoDecoder()J
    .locals 3

    .line 1
    const/16 v0, 0x4e23

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoOutputFrames()J
    .locals 3

    .line 1
    const/16 v0, 0x4e30

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoOutputFramesPerSecond()F
    .locals 2

    .line 1
    const/16 v0, 0x2712

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyFloat_(IF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getVideoReadSize()J
    .locals 3

    .line 1
    const/16 v0, 0x4e2c

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoSarDen()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarDen:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoSarNum()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoSarNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoStreamIndex()J
    .locals 3

    .line 1
    const/16 v0, 0x4e21

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_getPropertyLong_(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public hasPrepared()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHasPrepared:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_isPlaying()Z

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

.method public livepullMegerUpload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dvx;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public mediaConfig(Ljava/lang/String;)I
    .locals 26

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "filter_config"

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    const-string v4, "pull_delay"

    .line 10
    .line 11
    const-string v5, "pull_comm"

    .line 12
    .line 13
    const-string v6, "ijkmediaplayer_mediaConfig"

    .line 14
    .line 15
    new-instance v7, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v8, "["

    .line 18
    .line 19
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v9

    .line 26
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v9, "] ["

    .line 30
    .line 31
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v9, "]"

    .line 38
    .line 39
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    const-string v10, "IjkMediaPlayer"

    .line 47
    .line 48
    invoke-static {v10, v7}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    const/4 v10, 0x0

    .line 56
    if-nez v7, :cond_c

    .line 57
    .line 58
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    .line 59
    .line 60
    invoke-direct {v7, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v11

    .line 67
    const/4 v13, 0x3

    .line 68
    const/4 v14, 0x2

    .line 69
    const/4 v15, 0x1

    .line 70
    if-eqz v11, :cond_5

    .line 71
    .line 72
    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    if-eqz v11, :cond_4

    .line 77
    .line 78
    invoke-virtual {v11, v10, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-virtual {v11, v15, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 83
    .line 84
    .line 85
    move-result v12

    .line 86
    const/16 v10, 0x2710

    .line 87
    .line 88
    invoke-virtual {v11, v14, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    move/from16 v23, v14

    .line 93
    .line 94
    const/16 v14, 0x4e20

    .line 95
    .line 96
    invoke-virtual {v11, v13, v14}, Lorg/json/JSONArray;->optInt(II)I

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    if-eqz v5, :cond_0

    .line 101
    .line 102
    move v5, v15

    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const/4 v5, 0x0

    .line 105
    :goto_0
    iput-boolean v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 106
    .line 107
    iget-boolean v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHardDecoderFlagFromMediaConfig:Z

    .line 108
    .line 109
    invoke-virtual {v1, v5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 110
    .line 111
    .line 112
    if-lez v10, :cond_1

    .line 113
    .line 114
    iget-object v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 115
    .line 116
    move/from16 v24, v13

    .line 117
    .line 118
    move/from16 v25, v14

    .line 119
    .line 120
    int-to-long v13, v10

    .line 121
    invoke-virtual {v5, v13, v14}, Ll/dvx;->C(J)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    goto/16 :goto_5

    .line 127
    .line 128
    :cond_1
    move/from16 v24, v13

    .line 129
    .line 130
    move/from16 v25, v14

    .line 131
    .line 132
    :goto_1
    if-lez v25, :cond_2

    .line 133
    .line 134
    iget-object v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 135
    .line 136
    move/from16 v10, v25

    .line 137
    .line 138
    int-to-long v13, v10

    .line 139
    invoke-virtual {v5, v13, v14}, Ll/dvx;->u(J)V

    .line 140
    .line 141
    .line 142
    :cond_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    if-ne v12, v15, :cond_3

    .line 147
    .line 148
    move v10, v15

    .line 149
    goto :goto_2

    .line 150
    :cond_3
    const/4 v10, 0x0

    .line 151
    :goto_2
    invoke-virtual {v5, v10}, Ll/csx;->s1(Z)V

    .line 152
    .line 153
    .line 154
    const/4 v5, 0x4

    .line 155
    const/4 v10, 0x0

    .line 156
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 157
    .line 158
    .line 159
    move-result v12

    .line 160
    iput v12, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableLogBufferAndPullSize:I

    .line 161
    .line 162
    const/16 v5, 0x1f4

    .line 163
    .line 164
    const/4 v10, 0x5

    .line 165
    invoke-virtual {v11, v10, v5}, Lorg/json/JSONArray;->optInt(II)I

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 170
    .line 171
    const/4 v5, 0x6

    .line 172
    const/16 v10, 0xa

    .line 173
    .line 174
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 175
    .line 176
    .line 177
    move-result v12

    .line 178
    iput v12, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mPullSizeLogCount:I

    .line 179
    .line 180
    const/4 v5, 0x7

    .line 181
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 182
    .line 183
    .line 184
    move-result v12

    .line 185
    iput v12, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogCount:I

    .line 186
    .line 187
    const/16 v5, 0x8

    .line 188
    .line 189
    const/4 v10, 0x0

    .line 190
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 191
    .line 192
    .line 193
    move-result v12

    .line 194
    iput v12, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoRenderTHold:I

    .line 195
    .line 196
    const/16 v5, 0x9

    .line 197
    .line 198
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 199
    .line 200
    .line 201
    move-result v12

    .line 202
    iput v12, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewEnableLatency:I

    .line 203
    .line 204
    const-wide/high16 v12, 0x3ff8000000000000L    # 1.5

    .line 205
    .line 206
    const/16 v10, 0xa

    .line 207
    .line 208
    invoke-virtual {v11, v10, v12, v13}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 209
    .line 210
    .line 211
    move-result-wide v12

    .line 212
    double-to-float v5, v12

    .line 213
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mAudioPtsValue:F

    .line 214
    .line 215
    const/16 v5, 0xb

    .line 216
    .line 217
    const-wide/high16 v12, 0x3fe0000000000000L    # 0.5

    .line 218
    .line 219
    invoke-virtual {v11, v5, v12, v13}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 220
    .line 221
    .line 222
    move-result-wide v12

    .line 223
    double-to-float v5, v12

    .line 224
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMinVideoJumpDuration:F

    .line 225
    .line 226
    const/16 v5, 0xe

    .line 227
    .line 228
    const/4 v10, -0x1

    .line 229
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDecorderRecordPts:I

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_4
    move/from16 v24, v13

    .line 237
    .line 238
    move/from16 v23, v14

    .line 239
    .line 240
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 241
    .line 242
    .line 243
    move-result-object v10

    .line 244
    invoke-virtual {v10, v5, v6}, Ll/b7y;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    goto :goto_3

    .line 248
    :cond_5
    move/from16 v24, v13

    .line 249
    .line 250
    move/from16 v23, v14

    .line 251
    .line 252
    :goto_3
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    if-eqz v5, :cond_9

    .line 257
    .line 258
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    if-nez v5, :cond_a

    .line 267
    .line 268
    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    if-eqz v5, :cond_6

    .line 273
    .line 274
    invoke-virtual {v4, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    :cond_6
    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 279
    .line 280
    .line 281
    move-result v5

    .line 282
    if-eqz v5, :cond_7

    .line 283
    .line 284
    invoke-virtual {v4, v9, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    :cond_7
    const-string v5, ","

    .line 289
    .line 290
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    if-eqz v4, :cond_a

    .line 295
    .line 296
    array-length v5, v4

    .line 297
    const/4 v10, 0x5

    .line 298
    if-lt v5, v10, :cond_8

    .line 299
    .line 300
    const/16 v22, 0x0

    .line 301
    .line 302
    aget-object v5, v4, v22

    .line 303
    .line 304
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 309
    .line 310
    aget-object v5, v4, v15

    .line 311
    .line 312
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    move-result v5

    .line 316
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 317
    .line 318
    aget-object v5, v4, v23

    .line 319
    .line 320
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    move-result v5

    .line 324
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 325
    .line 326
    aget-object v5, v4, v24

    .line 327
    .line 328
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 333
    .line 334
    const/16 v21, 0x4

    .line 335
    .line 336
    aget-object v5, v4, v21

    .line 337
    .line 338
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 339
    .line 340
    .line 341
    move-result v5

    .line 342
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedRate:F

    .line 343
    .line 344
    :cond_8
    array-length v5, v4

    .line 345
    const/16 v10, 0xa

    .line 346
    .line 347
    if-lt v5, v10, :cond_a

    .line 348
    .line 349
    const/16 v20, 0x5

    .line 350
    .line 351
    aget-object v5, v4, v20

    .line 352
    .line 353
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 354
    .line 355
    .line 356
    move-result v5

    .line 357
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 358
    .line 359
    const/16 v19, 0x6

    .line 360
    .line 361
    aget-object v5, v4, v19

    .line 362
    .line 363
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 364
    .line 365
    .line 366
    move-result v5

    .line 367
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 368
    .line 369
    const/16 v18, 0x7

    .line 370
    .line 371
    aget-object v5, v4, v18

    .line 372
    .line 373
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 374
    .line 375
    .line 376
    move-result v5

    .line 377
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 378
    .line 379
    const/16 v17, 0x8

    .line 380
    .line 381
    aget-object v5, v4, v17

    .line 382
    .line 383
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 384
    .line 385
    .line 386
    move-result v5

    .line 387
    iput v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 388
    .line 389
    const/16 v16, 0x9

    .line 390
    .line 391
    aget-object v4, v4, v16

    .line 392
    .line 393
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 394
    .line 395
    .line 396
    move-result v4

    .line 397
    iput v4, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 398
    .line 399
    goto :goto_4

    .line 400
    :cond_9
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 401
    .line 402
    .line 403
    move-result-object v5

    .line 404
    invoke-virtual {v5, v4, v6}, Ll/b7y;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    :cond_a
    :goto_4
    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 408
    .line 409
    .line 410
    move-result v4

    .line 411
    if-eqz v4, :cond_b

    .line 412
    .line 413
    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    const/4 v10, 0x0

    .line 418
    invoke-virtual {v0, v10, v10}, Lorg/json/JSONArray;->optInt(II)I

    .line 419
    .line 420
    .line 421
    move-result v4

    .line 422
    iput v4, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 423
    .line 424
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 425
    .line 426
    invoke-virtual {v0, v15, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 427
    .line 428
    .line 429
    move-result-wide v7

    .line 430
    double-to-float v7, v7

    .line 431
    iput v7, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 432
    .line 433
    const-wide/16 v7, 0x0

    .line 434
    .line 435
    move/from16 v9, v23

    .line 436
    .line 437
    invoke-virtual {v0, v9, v7, v8}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 438
    .line 439
    .line 440
    move-result-wide v7

    .line 441
    double-to-float v7, v7

    .line 442
    iput v7, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 443
    .line 444
    move/from16 v7, v24

    .line 445
    .line 446
    invoke-virtual {v0, v7, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 447
    .line 448
    .line 449
    move-result-wide v7

    .line 450
    double-to-float v7, v7

    .line 451
    iput v7, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurRadius:F

    .line 452
    .line 453
    const/4 v7, 0x4

    .line 454
    invoke-virtual {v0, v7, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 455
    .line 456
    .line 457
    move-result-wide v7

    .line 458
    double-to-float v7, v7

    .line 459
    iput v7, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurThreshold:F

    .line 460
    .line 461
    const/4 v10, 0x5

    .line 462
    invoke-virtual {v0, v10, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    .line 463
    .line 464
    .line 465
    move-result-wide v4

    .line 466
    double-to-float v0, v4

    .line 467
    iput v0, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContrast:F

    .line 468
    .line 469
    goto :goto_6

    .line 470
    :cond_b
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 471
    .line 472
    .line 473
    move-result-object v4

    .line 474
    invoke-virtual {v4, v0, v6}, Ll/b7y;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 475
    .line 476
    .line 477
    goto :goto_6

    .line 478
    :goto_5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    new-instance v5, Ljava/lang/StringBuilder;

    .line 483
    .line 484
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v3

    .line 491
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v3

    .line 498
    invoke-virtual {v4, v3, v6}, Ll/b7y;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    new-instance v4, Ljava/lang/StringBuilder;

    .line 506
    .line 507
    const-string v5, "ijkmediaplayer parse mediaconfig:"

    .line 508
    .line 509
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    .line 518
    .line 519
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object v0

    .line 527
    invoke-virtual {v3, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 528
    .line 529
    .line 530
    goto :goto_6

    .line 531
    :cond_c
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    const-string v3, "config"

    .line 536
    .line 537
    sget-object v4, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 538
    .line 539
    const-string v5, "mediaConfig"

    .line 540
    .line 541
    invoke-virtual {v0, v5, v3, v4}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 542
    .line 543
    .line 544
    :goto_6
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    new-instance v3, Ljava/lang/StringBuilder;

    .line 549
    .line 550
    const-string v4, "player hashcode:"

    .line 551
    .line 552
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 556
    .line 557
    .line 558
    move-result v4

    .line 559
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 560
    .line 561
    .line 562
    const-string v4, ",setMediaConfig:"

    .line 563
    .line 564
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    .line 566
    .line 567
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    const-string v4, "ijkmediaplayer"

    .line 575
    .line 576
    filled-new-array {v4, v3}, [Ljava/lang/Object;

    .line 577
    .line 578
    .line 579
    move-result-object v3

    .line 580
    invoke-virtual {v0, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 581
    .line 582
    .line 583
    new-instance v0, Ljava/lang/StringBuilder;

    .line 584
    .line 585
    const-string v3, "mediaConfig:"

    .line 586
    .line 587
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    .line 592
    .line 593
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 594
    .line 595
    .line 596
    move-result-object v0

    .line 597
    invoke-direct {v1, v4, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    .line 599
    .line 600
    iget v2, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyEnable:I

    .line 601
    .line 602
    iget v3, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyBaseMark:I

    .line 603
    .line 604
    iget v4, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedupMark:I

    .line 605
    .line 606
    iget v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencyDropMark:I

    .line 607
    .line 608
    iget v6, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mLatencySpeedRate:F

    .line 609
    .line 610
    invoke-virtual/range {v1 .. v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mlSetLowerLatency(IIIIF)V

    .line 611
    .line 612
    .line 613
    iget v2, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferFirst:I

    .line 614
    .line 615
    if-lez v2, :cond_d

    .line 616
    .line 617
    iget v3, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferCurrent:I

    .line 618
    .line 619
    if-lez v3, :cond_d

    .line 620
    .line 621
    iget v4, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferNext:I

    .line 622
    .line 623
    if-lez v4, :cond_d

    .line 624
    .line 625
    iget v5, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLast:I

    .line 626
    .line 627
    if-lez v5, :cond_d

    .line 628
    .line 629
    iget v6, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferInterval:I

    .line 630
    .line 631
    if-lez v6, :cond_d

    .line 632
    .line 633
    invoke-virtual/range {v1 .. v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setBufferParams(IIIII)V

    .line 634
    .line 635
    .line 636
    :cond_d
    iget v0, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoRenderTHold:I

    .line 637
    .line 638
    int-to-long v2, v0

    .line 639
    const/16 v0, 0x4e47

    .line 640
    .line 641
    invoke-virtual {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 642
    .line 643
    .line 644
    iget v0, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewEnableLatency:I

    .line 645
    .line 646
    int-to-long v2, v0

    .line 647
    const/16 v0, 0x4e48

    .line 648
    .line 649
    invoke-virtual {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 650
    .line 651
    .line 652
    const/16 v0, 0x2720

    .line 653
    .line 654
    iget v2, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mAudioPtsValue:F

    .line 655
    .line 656
    invoke-direct {v1, v0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 657
    .line 658
    .line 659
    const/16 v0, 0x2721

    .line 660
    .line 661
    iget v2, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMinVideoJumpDuration:F

    .line 662
    .line 663
    invoke-direct {v1, v0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 664
    .line 665
    .line 666
    iget v0, v1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDecorderRecordPts:I

    .line 667
    .line 668
    int-to-long v2, v0

    .line 669
    const/16 v0, 0x4e56

    .line 670
    .line 671
    invoke-direct {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong(IJ)V

    .line 672
    .line 673
    .line 674
    const/16 v22, 0x0

    .line 675
    .line 676
    return v22
.end method

.method public mlSetLowerLatency(IIIIF)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct/range {p0 .. p5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_mlSetLowerLatency(IIIIF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public native native_setGLFilter(Ltv/danmaku/ijk/media/player/IjkFilter;)V
.end method

.method public openAudioTracks(Z)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_openAudioTracks(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public pause()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :goto_0
    return-void
.end method

.method public prepareAsync()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const-string v0, "filterOn:"

    .line 2
    .line 3
    const-string v1, "mUseOpengl:"

    .line 4
    .line 5
    const-string v2, "["

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    :try_start_0
    const-string v4, "IjkMediaPlayer"

    .line 9
    .line 10
    new-instance v5, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "] mediacodec:"

    .line 23
    .line 24
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 28
    .line 29
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, " / "

    .line 33
    .line 34
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 38
    .line 39
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, "/ "

    .line 43
    .line 44
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 48
    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->getSurface()Landroid/view/Surface;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    :goto_0
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v4, v2}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->MediaCfgInit()V

    .line 68
    .line 69
    .line 70
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 71
    .line 72
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled_l(Z)V

    .line 73
    .line 74
    .line 75
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 76
    .line 77
    if-ne v2, v3, :cond_1

    .line 78
    .line 79
    const-string v2, "overlay-format"

    .line 80
    .line 81
    const-string v4, "fcc-_es2"

    .line 82
    .line 83
    const/4 v5, 0x4

    .line 84
    invoke-virtual {p0, v5, v2, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 88
    .line 89
    if-ne v2, v3, :cond_1

    .line 90
    .line 91
    new-instance v2, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 92
    .line 93
    invoke-direct {v2}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setEnable(Z)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 102
    .line 103
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 104
    .line 105
    invoke-virtual {v2, v4}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setSaturation(F)V

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 109
    .line 110
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 111
    .line 112
    invoke-virtual {v2, v4}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setSharpening(F)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 116
    .line 117
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContrast:F

    .line 118
    .line 119
    invoke-virtual {v2, v4}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setContrast(F)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 123
    .line 124
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurThreshold:F

    .line 125
    .line 126
    invoke-virtual {v2, v4}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setDeblurThreshold(F)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 130
    .line 131
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurRadius:F

    .line 132
    .line 133
    float-to-int v4, v4

    .line 134
    invoke-virtual {v2, v4}, Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;->setDeblurRadius(I)V

    .line 135
    .line 136
    .line 137
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 138
    .line 139
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_setGLFilter(Ltv/danmaku/ijk/media/player/IjkFilter;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :catch_0
    move-exception v1

    .line 144
    goto :goto_2

    .line 145
    :catch_1
    move-exception v1

    .line 146
    goto :goto_3

    .line 147
    :cond_1
    :goto_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 148
    .line 149
    const-string v4, "prepareAsync"

    .line 150
    .line 151
    new-instance v5, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 157
    .line 158
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    new-instance v5, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 171
    .line 172
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v6, ",checksei:"

    .line 176
    .line 177
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewcheckSei:I

    .line 181
    .line 182
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v6, ",newsizeChange"

    .line 186
    .line 187
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewSizeChange:I

    .line 191
    .line 192
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    filled-new-array {v4, v1, v5}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v2, v1}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 207
    .line 208
    if-eqz v1, :cond_3

    .line 209
    .line 210
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 211
    .line 212
    if-eqz v2, :cond_2

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 218
    .line 219
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->getSurface()Landroid/view/Surface;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 224
    .line 225
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->getSurface()Landroid/view/Surface;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-direct {p0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 230
    .line 231
    .line 232
    :cond_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFFConcatContent:Ljava/lang/String;

    .line 233
    .line 234
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    if-eqz v1, :cond_4

    .line 239
    .line 240
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_prepareAsync()V

    .line 241
    .line 242
    .line 243
    goto :goto_4

    .line 244
    :cond_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    .line 246
    .line 247
    goto :goto_4

    .line 248
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 249
    .line 250
    .line 251
    goto :goto_4

    .line 252
    :goto_3
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 253
    .line 254
    .line 255
    :goto_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 256
    .line 257
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 258
    .line 259
    iput-object v2, v1, Ll/vvx;->c:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 262
    .line 263
    .line 264
    move-result-wide v4

    .line 265
    iput-wide v4, v1, Ll/vvx;->h0:J

    .line 266
    .line 267
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullInitV2()V

    .line 268
    .line 269
    .line 270
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 271
    .line 272
    iget v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseOpengl:I

    .line 273
    .line 274
    if-ne v2, v3, :cond_5

    .line 275
    .line 276
    const-string v2, "OpengL"

    .line 277
    .line 278
    goto :goto_5

    .line 279
    :cond_5
    const-string v2, "nativeWindow "

    .line 280
    .line 281
    :goto_5
    const-string v3, "setRenderType"

    .line 282
    .line 283
    invoke-virtual {v1, v3, v2}, Ll/dvx;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 287
    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    .line 289
    .line 290
    const-string v3, "mDecorderRecordPts:"

    .line 291
    .line 292
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    iget v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDecorderRecordPts:I

    .line 296
    .line 297
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string v3, ", NewEnableLatency:"

    .line 301
    .line 302
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    iget v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNewEnableLatency:I

    .line 306
    .line 307
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    const-string v3, "mediaconfig"

    .line 315
    .line 316
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v2

    .line 320
    invoke-virtual {v1, v2}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 324
    .line 325
    new-instance v2, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->filterOn:I

    .line 331
    .line 332
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    const-string v0, ",Saturation:"

    .line 336
    .line 337
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 341
    .line 342
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    const-string v0, ", mDeblurWeight"

    .line 346
    .line 347
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 351
    .line 352
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v0, ", mDeblurRadius:"

    .line 356
    .line 357
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurRadius:F

    .line 361
    .line 362
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    const-string v0, ",mDeblurThreshold:"

    .line 366
    .line 367
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurThreshold:F

    .line 371
    .line 372
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    const-string v0, ",mContrast:"

    .line 376
    .line 377
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContrast:F

    .line 381
    .line 382
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    const-string v0, "filterParm"

    .line 390
    .line 391
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    invoke-virtual {v1, p0}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 396
    .line 397
    .line 398
    return-void
.end method

.method public putMediaLogs(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "showId"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setShowId(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "src"

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSrc(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const-string v0, "pullSrc"

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPullSrc(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const-string v0, "cdnType"

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/String;

    .line 68
    .line 69
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setCdnType(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method public declared-synchronized release()V
    .locals 3

    .line 1
    const-string v0, "["

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "IjkMediaPlayer"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "] release."

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    const-string v0, "HWRender"

    .line 35
    .line 36
    const-string v1, "Stop"

    .line 37
    .line 38
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 49
    .line 50
    const-string v1, "ijkmediaplayer release"

    .line 51
    .line 52
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStopV2()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget v1, Ll/yt0;->g:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/yt0;->q(I)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release_l()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 79
    .line 80
    .line 81
    :cond_1
    const/4 v0, 0x0

    .line 82
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 83
    .line 84
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-lez v0, :cond_2

    .line 93
    .line 94
    const-string v0, "release"

    .line 95
    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v2, " release"

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 125
    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/dvx;->c()V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/dvx;->s()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    .line 135
    .line 136
    :cond_2
    monitor-exit p0

    .line 137
    return-void

    .line 138
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    throw v0
.end method

.method public reset()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 53
    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 55
    .line 56
    return-void
.end method

.method public resetInternal()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] resetInternal"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_resetInternal()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mEventHandler:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 53
    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 55
    .line 56
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHasPrepared:Z

    .line 57
    .line 58
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCurrentUrlInfo:Ll/p4k0;

    .line 59
    .line 60
    return-void
.end method

.method public resetListeners()V
    .locals 1

    .line 1
    invoke-super {p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->resetListeners()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 6
    .line 7
    return-void
.end method

.method public seekTo(J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] seekTo "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "IjkMediaPlayer"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_seekTo(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_1
    move-exception p0

    .line 42
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_0
    return-void
.end method

.method public selectAudioTrack(I)V
    .locals 3

    .line 1
    const/16 v0, 0x4e40

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    :try_start_0
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_1
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    :goto_0
    return-void
.end method

.method public final sendJsonData([BILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mJsonDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mJsonDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;->JsonDateCallback([BILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :catch_0
    const-string p0, "IjkMediaPlayer"

    .line 12
    .line 13
    const-string p1, "mJsonDateCallback error."

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setAcceDriveCacheDuration(J)V
    .locals 1

    .line 1
    const/16 v0, 0x4e34

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAccePlayRate(F)V
    .locals 1

    .line 1
    const/16 v0, 0x271e

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAudio3D(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enable3D:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/immomo/baseutil/HeadSetReceiver;->getInstance()Lcom/immomo/baseutil/HeadSetReceiver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/immomo/baseutil/HeadSetReceiver;->getHeadSetState()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->headSetOn:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "[audioEffect:"

    .line 21
    .line 22
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, "]"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "playerAudioEffect"

    .line 38
    .line 39
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->headSetOn:Z

    .line 43
    .line 44
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enable3D:Z

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->set3D(Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setBoost3D(Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public setAudioHiFi(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableHiFi:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/immomo/baseutil/HeadSetReceiver;->getInstance()Lcom/immomo/baseutil/HeadSetReceiver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/immomo/baseutil/HeadSetReceiver;->getHeadSetState()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->headSetOn:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v2, "[audioEffect:"

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, "]"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "playerAudioEffect"

    .line 39
    .line 40
    invoke-direct {p0, v1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->headSetOn:Z

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setHifi(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setBoostHiFi(Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public setAudioOnly(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const/16 p1, 0x4e3c

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setAudioStreamType(I)V
    .locals 0

    return-void
.end method

.method public setAudioTrackIndex(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setAudioTrackIndex(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public setAutoPlayOnPrepared(Z)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const/4 p1, 0x4

    .line 9
    const-string v2, "start-on-prepared"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v2, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setAvCodecOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setAvFormatOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setAvOption(Ltv/danmaku/ijk/media/player/option/AvFormatOption;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/option/AvFormatOption;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/option/AvFormatOption;->getValue()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setAvFormatOption(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setBufferParams(IIIII)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct/range {p0 .. p5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setBufferParams(IIIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public setBusinessType(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "setBusinessType "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 33
    .line 34
    int-to-long v1, p1

    .line 35
    iput-wide v1, v0, Ll/vvx;->O:J

    .line 36
    .line 37
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 38
    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/brx;->p(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public setCutPosition(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/fakeSurface;->updateRect(FFFF)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setCutPosition(FFFF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 119
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    move-result-object v0

    const-string v1, "dataSource"

    sget-object v2, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    const-string v3, "setDataSource"

    invoke-virtual {v0, v3, v1, v2}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 122
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCdnIp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    .line 123
    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 124
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->splitQuery(Ljava/net/URL;)Ljava/util/Map;

    move-result-object v0

    .line 125
    const-string v1, "mtag"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 126
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mTag:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :catch_0
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->costOfsetSurfaceMs:J

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCdnip:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IjkMediaPlayer"

    invoke-static {v0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 129
    :try_start_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setDataSource(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p0

    .line 130
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p0

    .line 131
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public setDataSource(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setDataSource: ipv6Url="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", ipv4Url="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "IjkMediaPlayer"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHasPrepared:Z

    .line 30
    .line 31
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1, p2}, Ll/qj20;->g(Ljava/lang/String;Ljava/lang/String;)Ll/p4k0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-nez p2, :cond_0

    .line 50
    .line 51
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mCurrentUrlInfo:Ll/p4k0;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/p4k0;->a()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->detectStatus:I

    .line 58
    .line 59
    new-instance p2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v0, "setDataSource: using url="

    .line 62
    .line 63
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, ", type="

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-static {v1, p2}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p0, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0, p1}, Ll/qj20;->t(Ll/p4k0;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 108
    .line 109
    if-eqz p0, :cond_1

    .line 110
    .line 111
    const-string p1, "setDataSource"

    .line 112
    .line 113
    const-string p2, "No valid URL available for playback"

    .line 114
    .line 115
    invoke-virtual {p0, p1, p2}, Ll/dvx;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method public setDataSourceAsFFConcatContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFFConcatContent:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDeblurEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblueEnabled:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setDeblurEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDeblurWeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDeblurWeight:F

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setDeblurWeight(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDeceDriveCacheDuration(J)V
    .locals 1

    .line 1
    const/16 v0, 0x4e33

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDecePlayRate(F)V
    .locals 1

    .line 1
    const/16 v0, 0x271d

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyFloat_(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDisplay(Landroid/view/SurfaceHolder;)V
    .locals 9

    .line 1
    const-string v0, "SurfaceHolder:"

    .line 2
    .line 3
    const-string v1, "HW SurfaceHolder:"

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-wide v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->costOfsetSurfaceMs:J

    .line 10
    .line 11
    sub-long/2addr v2, v4

    .line 12
    const-string v4, "IjkMediaPlayer"

    .line 13
    .line 14
    new-instance v5, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v6, "["

    .line 17
    .line 18
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v6, "] cost "

    .line 29
    .line 30
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v6, " mediacodec: "

    .line 37
    .line 38
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-boolean v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v6, "/"

    .line 47
    .line 48
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v6, "/"

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-static {v4, v5}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 69
    .line 70
    .line 71
    const-string v4, "IjkMediaPlayer"

    .line 72
    .line 73
    new-instance v5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v6, "["

    .line 76
    .line 77
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v6, "] getSurface: "

    .line 88
    .line 89
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    if-eqz p1, :cond_0

    .line 94
    .line 95
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    goto :goto_0

    .line 100
    :cond_0
    move-object v7, v6

    .line 101
    :goto_0
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v7, "/ "

    .line 105
    .line 106
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 110
    .line 111
    if-eqz v7, :cond_1

    .line 112
    .line 113
    invoke-virtual {v7}, Ltv/danmaku/ijk/media/player/fakeSurface;->getLastErr()I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    goto :goto_1

    .line 118
    :cond_1
    const/4 v7, -0x1

    .line 119
    :goto_1
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-static {v4, v5}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 127
    .line 128
    .line 129
    iget-wide v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 130
    .line 131
    const-wide/16 v7, 0x0

    .line 132
    .line 133
    cmp-long v4, v4, v7

    .line 134
    .line 135
    if-nez v4, :cond_2

    .line 136
    .line 137
    iput-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 138
    .line 139
    :cond_2
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSynSurface:Ljava/lang/Object;

    .line 140
    .line 141
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    :try_start_1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 143
    .line 144
    if-eqz p1, :cond_3

    .line 145
    .line 146
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :catchall_0
    move-exception p1

    .line 154
    goto :goto_4

    .line 155
    :cond_3
    iput-object v6, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 156
    .line 157
    move-object p1, v6

    .line 158
    :goto_2
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 159
    .line 160
    if-eqz v3, :cond_6

    .line 161
    .line 162
    iget v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 163
    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    iget v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 167
    .line 168
    if-eqz v4, :cond_4

    .line 169
    .line 170
    invoke-virtual {v3, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/player/fakeSurface;->updateRec(IIII)V

    .line 171
    .line 172
    .line 173
    :cond_4
    if-eqz p1, :cond_5

    .line 174
    .line 175
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 176
    .line 177
    invoke-virtual {v0, v6}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 181
    .line 182
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    const-string v0, "setDisplay"

    .line 186
    .line 187
    new-instance v3, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_6
    invoke-direct {p0, p1, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 208
    .line 209
    .line 210
    const-string v1, "setDisplay"

    .line 211
    .line 212
    new-instance v3, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    :goto_3
    monitor-exit v2

    .line 232
    goto :goto_7

    .line 233
    :goto_4
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_0

    .line 235
    :catch_0
    move-exception p1

    .line 236
    goto :goto_5

    .line 237
    :catch_1
    move-exception p1

    .line 238
    goto :goto_6

    .line 239
    :goto_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 240
    .line 241
    .line 242
    goto :goto_7

    .line 243
    :goto_6
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 244
    .line 245
    .line 246
    :goto_7
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 247
    .line 248
    .line 249
    return-void
.end method

.method public setDynamicBuffer(Z)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setDynamicBuffer(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public setFastDnsEnable(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const/16 p1, 0x4e3e

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setFastDnsExpireTime(I)V
    .locals 3

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->fast_dns_expire_time:I

    .line 2
    .line 3
    const/16 v0, 0x4e3f

    .line 4
    .line 5
    int-to-long v1, p1

    .line 6
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFrameDrop(I)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const-string v0, "framedrop"

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    const/4 p1, 0x4

    .line 5
    invoke-virtual {p0, p1, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setJsonDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mJsonDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;

    .line 2
    .line 3
    return-void
.end method

.method public final setLogRoomInfos(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/brx;->s(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaCfgParams:Ll/brx;

    .line 11
    .line 12
    invoke-virtual {v0, p3}, Ll/brx;->r(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/dvx;->y(Ljava/lang/String;Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final setLogUploadCb(IILl/fpf0;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLogUploadCb "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " | "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "IjkMediaPlayer"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    if-lez p1, :cond_0

    .line 35
    .line 36
    if-lez p2, :cond_0

    .line 37
    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p3}, Ll/dvx;->E(IILl/fpf0;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public setManuaRefresh(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mManuaRefresh:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxBufferlingSize(J)V
    .locals 1

    .line 1
    const/16 v0, 0x4e3b

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxTimeOfBuffer(I)V
    .locals 3

    .line 1
    const/16 v0, 0x4e41

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-direct {p0, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setMediaCodecEnabled(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "IjkMediaPlayer"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 33
    .line 34
    return-void
.end method

.method public final setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mMediaDateCallback:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setMediaDateCallbackFlags(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setMediaDateCallbackFlags(I)V
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

.method public setMomoParms(ILjava/lang/String;)I
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "] configdata"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "key "

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, "/"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 47
    .line 48
    .line 49
    const/16 v0, 0x1008

    .line 50
    .line 51
    if-eq p1, v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-direct {p0, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->configDataProcess(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method public setNetAnchorTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mNetDiffTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setOnControlMessageListener(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnControlMessageListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnControlMessageListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnMediaCodecSelectListener(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mOnMediaCodecSelectListener:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$OnMediaCodecSelectListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOpenSLESEnabled(Z)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const/4 p1, 0x4

    .line 9
    const-string v2, "opengles"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v2, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 4

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "category:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "name:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "value:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 55
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setOption(ILjava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "category:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "name:"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "value:"

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setOption(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :catch_0
    return-void
.end method

.method public setOverlayFormat(I)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const-string v0, "overlay-format"

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    const/4 p1, 0x4

    .line 5
    invoke-virtual {p0, p1, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setPlayback(Z)V
    .locals 0

    return-void
.end method

.method public setPlayerFilterSizeChange(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->adjustFilter:Ltv/danmaku/ijk/media/player/PlayerAdjustFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->onSizeChanged(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setPrepared()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mHasPrepared:Z

    .line 3
    .line 4
    return-void
.end method

.method public setPropertyLong(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPullSrc(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogsValOfPull:Ll/vvx;

    .line 2
    .line 3
    iput-object p1, p0, Ll/vvx;->e0:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setQuicProxy(ZLjava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsQuicProxy:Z

    .line 2
    .line 3
    iput-object p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mQuicServerIp:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setQuicProxy(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setRate(F)V
    .locals 0

    return-void
.end method

.method public setSaturation(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSaturation:F

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setSaturation(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setScreenOnWhilePlaying(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setShowId(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "setShowid "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->showId:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/a320;->g(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final setSimpleInfoFromUpStreamCb(Ll/bpf0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->simpleInfoFromUpStream:Ll/bpf0;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public setSpeedControl(IIFIF)V
    .locals 0

    return-void
.end method

.method public setSrc(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "setSrc "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->sourceStr:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->httpMediaLogsUpload:Ll/a320;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/a320;->h(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->costOfsetSurfaceMs:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-string v2, "IjkMediaPlayer"

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v4, "["

    .line 13
    .line 14
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v4, "] cost "

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, " mediacode:"

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-boolean v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mUseAndroidMediaCodec:Z

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v4, " / "

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, " / "

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v2, v3}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 65
    .line 66
    .line 67
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 68
    .line 69
    const-wide/16 v4, 0x0

    .line 70
    .line 71
    cmp-long v2, v2, v4

    .line 72
    .line 73
    if-nez v2, :cond_0

    .line 74
    .line 75
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 76
    .line 77
    :cond_0
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSynSurface:Ljava/lang/Object;

    .line 78
    .line 79
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    const/4 v1, 0x0

    .line 81
    :try_start_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 82
    .line 83
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 84
    .line 85
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 86
    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    iget p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoWidth:I

    .line 90
    .line 91
    if-eqz p1, :cond_1

    .line 92
    .line 93
    iget v3, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mVideoHeight:I

    .line 94
    .line 95
    if-eqz v3, :cond_1

    .line 96
    .line 97
    invoke-virtual {v2, p1, v3, p1, v3}, Ltv/danmaku/ijk/media/player/fakeSurface;->updateRec(IIII)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception p1

    .line 102
    goto :goto_2

    .line 103
    :cond_1
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 104
    .line 105
    if-eqz p1, :cond_2

    .line 106
    .line 107
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 108
    .line 109
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 113
    .line 114
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 115
    .line 116
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    invoke-direct {p0, p1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    monitor-exit v0

    .line 124
    goto :goto_5

    .line 125
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_0

    .line 127
    :catch_0
    move-exception p1

    .line 128
    goto :goto_3

    .line 129
    :catch_1
    move-exception p1

    .line 130
    goto :goto_4

    .line 131
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 132
    .line 133
    .line 134
    goto :goto_5

    .line 135
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 136
    .line 137
    .line 138
    :goto_5
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public setSurfaceH(Landroid/view/Surface;)V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->costOfsetSurfaceMs:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v3, "["

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v3, "] cost "

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, " / "

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "IjkMediaPlayer"

    .line 43
    .line 44
    invoke-static {v3, v2}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    iget-wide v4, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 48
    .line 49
    const-wide/16 v6, 0x0

    .line 50
    .line 51
    cmp-long v2, v4, v6

    .line 52
    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->metaTimeMs:J

    .line 56
    .line 57
    :cond_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenOnWhilePlaying:Z

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const-string v0, "setScreenOnWhilePlaying(true) is ineffective for Surface"

    .line 64
    .line 65
    invoke-static {v3, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 66
    .line 67
    .line 68
    :cond_1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mSurface:Ljava/lang/Object;

    .line 69
    .line 70
    invoke-direct {p0, p1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setVideoSurface(Landroid/view/Surface;Landroid/view/Surface;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->updateSurfaceScreenOn()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public setSwScaleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setTimeOutUS(J)V
    .locals 1

    .line 1
    const/16 v0, 0x4e3a

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoOnly(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const/16 p1, 0x4e3d

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setPropertyLong_(IJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setVodMode()V
    .locals 0

    return-void
.end method

.method public setVolume(FF)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_setVolume(FF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public setWakeMode(Landroid/content/Context;I)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    const-class v2, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

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
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 49
    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :goto_0
    return-void
.end method

.method public startLogTime()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->enableLogBufferAndPullSize:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    iget v1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 11
    .line 12
    int-to-long v3, v1

    .line 13
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->logtimer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;

    .line 17
    .line 18
    iget p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mBufferLogHz:I

    .line 19
    .line 20
    int-to-long v1, p0

    .line 21
    const/4 p0, 0x2

    .line 22
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "IjkMediaPlayer"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mFakeSurface:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "stop HWRende"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "HWRender"

    .line 55
    .line 56
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 64
    .line 65
    const-string v1, "ijkmediaplayer stop"

    .line 66
    .line 67
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/dvx;->k([Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pullStopV2()V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stayAwake(Z)V

    .line 79
    .line 80
    .line 81
    :try_start_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->_stop()V

    .line 82
    .line 83
    .line 84
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mIsQuicProxy:Z

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mQuicServerIp:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :catch_0
    move-exception v0

    .line 91
    goto :goto_0

    .line 92
    :catch_1
    move-exception v0

    .line 93
    goto :goto_1

    .line 94
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 99
    .line 100
    .line 101
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mDataSource:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-lez v0, :cond_1

    .line 110
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, " stop"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v1, "stop()"

    .line 133
    .line 134
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogs2([Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    :cond_1
    return-void
.end method

.method public updateScreenSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenWidth:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mScreenHeight:I

    .line 4
    .line 5
    return-void
.end method

.method public uploadMediaLogs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->mediaLogPullV2:Ll/dvx;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dvx;->G(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
