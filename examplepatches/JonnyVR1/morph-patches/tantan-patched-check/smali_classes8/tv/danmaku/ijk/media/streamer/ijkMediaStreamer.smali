.class public Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OutputFormat;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$videoResolution;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnFPSRateListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$ViewShowMode;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$VideoEncoder;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$AudioEncoder;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$VideoSource;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$AudioSource;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;,
        Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;
    }
.end annotation


# static fields
.field public static final CNNModelFileName:Ljava/lang/String; = "alignment_v2.model"

.field public static final CONFERENCE_ROLE_AUDIENCE:I = 0x2

.field public static final CONFERENCE_ROLE_BROADCASTER:I = 0x1

.field public static final FFS_PROP_INT64_BIT_RATE:I = 0x4e84

.field private static final FFS_PROP_INT64_PIX_FMT:I = 0x7530

.field public static final FFS_PROP_INT64_TCP_SPEED:I = 0x4ee8

.field public static final MEDIA_ERROR_SERVER_DIED:I = 0x64

.field public static final MEDIA_RECORDER_INFO_MAX_DURATION_REACHED:I = 0x320

.field public static final MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED:I = 0x321

.field public static final MEDIA_RECORDER_INFO_UNKNOWN:I = 0x1

.field public static final MEDIA_RECORDER_TRACK_INFO_COMPLETION_STATUS:I = 0x3e8

.field public static final MEDIA_RECORDER_TRACK_INFO_DATA_KBYTES:I = 0x3f1

.field public static final MEDIA_RECORDER_TRACK_INFO_INITIAL_DELAY_MS:I = 0x3ef

.field public static final MEDIA_RECORDER_TRACK_INFO_LIST_END:I = 0x7d0

.field public static final MEDIA_RECORDER_TRACK_INFO_LIST_START:I = 0x3e8

.field public static final NpdModelFileName:Ljava/lang/String; = "detect_v1.model"

.field public static final ObjectDetectModelFileName:Ljava/lang/String; = "od_v0.3.2.model"

.field private static final TAG:Ljava/lang/String; = "ijkMediaStreamer"

.field public static final VIEW_MODE_FRIEND:I = 0x2

.field public static final VIEW_MODE_NORMAL:I = 0x1

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;


# instance fields
.field private mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

.field private mAudioHighQualityFlg:Z

.field private mCameraID:I

.field private mCaptureType:I

.field mCmdHT:Landroid/os/HandlerThread;

.field private mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

.field private mContext:Landroid/content/Context;

.field private mCount:I

.field private mDefaultAudioRoutetoSpeakerphone:Z

.field private mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

.field private mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private mFd:Ljava/io/FileDescriptor;

.field mFileType:I

.field private mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

.field private mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

.field mInpath:Ljava/lang/String;

.field private mInterval:I

.field mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

.field mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

.field private mMasterAudioLevel:F

.field private mMonitorHandler:Landroid/os/Handler;

.field private mMonitorTread:Landroid/os/HandlerThread;

.field private mOnCameraSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;

.field public mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

.field private mOnFPSChangeListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnFPSRateListener;

.field private mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

.field private mOnPreparedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

.field private mOnRecordStopedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

.field private mOnRtcStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

.field private mOnlyAudio:Z

.field mOutpath:Ljava/lang/String;

.field private mParent:Landroid/app/Activity;

.field private mPath:Ljava/lang/String;

.field private volatile mPlayStatus:I

.field private mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

.field private mPrepared:Z

.field private mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

.field private mScreenOnWhilePlaying:Z

.field private mSlaveAudioLevel:F

.field private mSurface:Ljava/lang/Object;

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mVenderID:I

.field private mVideoChannelListener:Ll/ebl0;

.field private mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private mVideoQualityFlg:Z

.field private mVideoResolution:I

.field private mZoom:F

.field private streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$1;

    .line 2
    .line 3
    invoke-direct {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    .line 7
    .line 8
    const/high16 v1, 0x3f000000    # 0.5f

    .line 9
    .line 10
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 19
    .line 20
    const/16 v3, 0xa

    .line 21
    .line 22
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 23
    .line 24
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 28
    .line 29
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 30
    .line 31
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 32
    .line 33
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 34
    .line 35
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 36
    .line 37
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 38
    .line 39
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 40
    .line 41
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 42
    .line 43
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 44
    .line 45
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 46
    .line 47
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 48
    .line 49
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 50
    .line 51
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 52
    .line 53
    const/4 v0, -0x1

    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 55
    .line 56
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 57
    .line 58
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 59
    .line 60
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 61
    .line 62
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 63
    .line 64
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 65
    .line 66
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 67
    .line 68
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 69
    .line 70
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 71
    .line 72
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 73
    .line 74
    sget-object p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    .line 75
    .line 76
    invoke-direct {p0, p1, v1, v3, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 209
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    const/high16 p2, 0x3f000000    # 0.5f

    .line 210
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    const/4 p2, 0x1

    .line 211
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    const/4 v0, 0x0

    .line 212
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 213
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    const/16 v1, 0xa

    .line 214
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 215
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v1, 0x0

    .line 216
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 217
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 218
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 219
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 220
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 221
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 222
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 223
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 224
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 225
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 226
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 227
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 228
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 229
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 230
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    const/4 p1, -0x1

    .line 231
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 232
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 233
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 234
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 235
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 236
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 237
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 3

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 81
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    const/high16 v0, 0x3f000000    # 0.5f

    .line 82
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    const/4 v0, 0x1

    .line 83
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    const/4 v1, 0x0

    .line 84
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    const/16 v2, 0xa

    .line 86
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 87
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v2, 0x0

    .line 88
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 89
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 90
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 91
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 92
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 93
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 94
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 95
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 96
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 97
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 98
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 99
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 100
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    const/4 p2, -0x1

    .line 101
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 102
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 103
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 104
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 105
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 106
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 107
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 108
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 109
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 110
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 111
    sget-object p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1, v0, p3, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;)V
    .locals 3

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 145
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    const/high16 v0, 0x3f000000    # 0.5f

    .line 146
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    const/4 v0, 0x1

    .line 147
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    const/4 v1, 0x0

    .line 148
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 149
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    const/16 v2, 0xa

    .line 150
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 151
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v2, 0x0

    .line 152
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 153
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 154
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 155
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 156
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 157
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 158
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 159
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 160
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 161
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 162
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 163
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 164
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    const/4 p2, -0x1

    .line 165
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 166
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 167
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 168
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 169
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 170
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 171
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 172
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 173
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 174
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 175
    sget-object p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1, v0, p3, p4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;Z)V
    .locals 3

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 177
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    const/high16 v0, 0x3f000000    # 0.5f

    .line 178
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    const/4 v0, 0x1

    .line 179
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    const/4 v1, 0x0

    .line 180
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 181
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    const/16 v2, 0xa

    .line 182
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 183
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v2, 0x0

    .line 184
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 185
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 186
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 187
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 188
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 189
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 190
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 191
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 192
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 193
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 194
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 195
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 196
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    const/4 p2, -0x1

    .line 197
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 198
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 199
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 200
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 201
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 202
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 203
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 204
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 205
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 206
    iput-boolean p5, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 207
    sget-object p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1, v0, p3, p4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIZ)V
    .locals 3

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 113
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    const/high16 v0, 0x3f000000    # 0.5f

    .line 114
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    const/4 v0, 0x1

    .line 115
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    const/4 v1, 0x0

    .line 116
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 117
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    const/16 v2, 0xa

    .line 118
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 119
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v2, 0x0

    .line 120
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 121
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPrepared:Z

    .line 122
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 123
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 124
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 125
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 126
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 127
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 128
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 129
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 130
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 131
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 132
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    const/4 p2, -0x1

    .line 133
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 134
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 135
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 136
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 137
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 138
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 139
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 140
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 141
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 142
    iput-boolean p4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 143
    sget-object p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;

    invoke-direct {p0, p1, v0, p3, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V

    return-void
.end method

.method public static synthetic access$000(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->startRecording_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$102(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1102(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Lcom/immomo/mediacore/sink/SinkBase;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1200(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->selectFilter_l(Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->stopRecording_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnRtcStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/StreamProducer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnRecordStopedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnPreparedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private initMediaStreamer(Ltv/danmaku/ijk/media/player/IjkLibLoader;IILjava/lang/String;)V
    .locals 6

    .line 1
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p3}, Ll/l26;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p1, p3}, Ll/pgy;->n(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p3, 0x0

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 26
    .line 27
    invoke-direct {v0, p0, p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;-><init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Landroid/os/Looper;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 40
    .line 41
    invoke-direct {v0, p0, p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;-><init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Landroid/os/Looper;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 48
    .line 49
    :goto_0
    new-instance p1, Landroid/os/HandlerThread;

    .line 50
    .line 51
    const-string v0, "ijkRecordingCmdHandle"

    .line 52
    .line 53
    const/4 v1, -0x4

    .line 54
    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHT:Landroid/os/HandlerThread;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHT:Landroid/os/HandlerThread;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 69
    .line 70
    invoke-direct {v0, p0, p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;-><init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Landroid/os/Looper;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 74
    .line 75
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 76
    .line 77
    if-nez p1, :cond_5

    .line 78
    .line 79
    new-instance p1, Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 80
    .line 81
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 82
    .line 83
    invoke-direct {p1, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;-><init>(I)V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 87
    .line 88
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 89
    .line 90
    const-string v0, ","

    .line 91
    .line 92
    const-string v1, "----initMediaStreamer call getVideoQuality(): "

    .line 93
    .line 94
    const-string v2, "ijkMediaStreamer"

    .line 95
    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    new-instance p1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 104
    .line 105
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 106
    .line 107
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 114
    .line 115
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 116
    .line 117
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {v2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 128
    .line 129
    if-eqz p1, :cond_3

    .line 130
    .line 131
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    goto :goto_1

    .line 136
    :cond_3
    move-object p1, p3

    .line 137
    :goto_1
    if-eqz p1, :cond_4

    .line 138
    .line 139
    new-instance v3, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 145
    .line 146
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 153
    .line 154
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 170
    .line 171
    invoke-virtual {p1, p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 175
    .line 176
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0()I

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 183
    .line 184
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B0()V

    .line 185
    .line 186
    .line 187
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 188
    .line 189
    const-string p1, "mFakeSurface creat error use softdec"

    .line 190
    .line 191
    invoke-static {v2, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    :cond_5
    new-instance p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 195
    .line 196
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 197
    .line 198
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 199
    .line 200
    invoke-direct {p1, p3, p0, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 201
    .line 202
    .line 203
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 204
    .line 205
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 206
    .line 207
    if-eqz p3, :cond_6

    .line 208
    .line 209
    invoke-virtual {p3, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P0(Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;)V

    .line 210
    .line 211
    .line 212
    :cond_6
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 213
    .line 214
    if-eqz p1, :cond_9

    .line 215
    .line 216
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 217
    .line 218
    if-eqz p1, :cond_9

    .line 219
    .line 220
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 221
    .line 222
    if-nez p1, :cond_7

    .line 223
    .line 224
    new-instance p1, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 225
    .line 226
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 227
    .line 228
    iget-boolean p4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 229
    .line 230
    invoke-direct {p1, p3, p4}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    .line 231
    .line 232
    .line 233
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_7
    const/4 p3, 0x1

    .line 237
    if-ne p1, p3, :cond_8

    .line 238
    .line 239
    new-instance v0, Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 240
    .line 241
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 242
    .line 243
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 244
    .line 245
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0()Ljavax/microedition/khronos/egl/EGLContext;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 250
    .line 251
    iget-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 252
    .line 253
    move-object v4, p4

    .line 254
    invoke-direct/range {v0 .. v5}, Ltv/danmaku/ijk/media/sink/AgoraWriter;-><init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ljava/lang/String;Z)V

    .line 255
    .line 256
    .line 257
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 258
    .line 259
    :cond_8
    :goto_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 260
    .line 261
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 262
    .line 263
    invoke-virtual {p1, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q2(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 264
    .line 265
    .line 266
    :cond_9
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 267
    .line 268
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 269
    .line 270
    if-nez p1, :cond_a

    .line 271
    .line 272
    new-instance p1, Landroid/os/HandlerThread;

    .line 273
    .line 274
    const-string p2, "ijkStrMonitor"

    .line 275
    .line 276
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 282
    .line 283
    .line 284
    new-instance p1, Landroid/os/Handler;

    .line 285
    .line 286
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 287
    .line 288
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 293
    .line 294
    .line 295
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 296
    .line 297
    :cond_a
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 298
    .line 299
    if-eqz p1, :cond_b

    .line 300
    .line 301
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 302
    .line 303
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o2(I)V

    .line 304
    .line 305
    .line 306
    :cond_b
    return-void
.end method

.method private static loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    .locals 5

    .line 1
    const-class v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->sLocalLibLoader:Ltv/danmaku/ijk/media/player/IjkLibLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    :try_start_1
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 19
    .line 20
    const-string v4, "mmcrypto"

    .line 21
    .line 22
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 26
    .line 27
    const-string v4, "mmssl"

    .line 28
    .line 29
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 33
    .line 34
    const-string v4, "cosmosffmpeg"

    .line 35
    .line 36
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 40
    .line 41
    const-string v4, "ijklivesdl"

    .line 42
    .line 43
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 47
    .line 48
    const-string v4, "ijkstreamer"

    .line 49
    .line 50
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 54
    .line 55
    const-string v4, "congressUtil"

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 61
    .line 62
    const-string v4, "apm-congressRender"

    .line 63
    .line 64
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-boolean v1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :catch_0
    :try_start_2
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :catch_1
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    .line 75
    :goto_1
    :try_start_3
    sget-object v3, Ll/l26;->a:Landroid/content/Context;

    .line 76
    .line 77
    const-string v4, "ijkaudioprocess"

    .line 78
    .line 79
    invoke-static {v3, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sput-boolean v1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z
    :try_end_3
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :catch_2
    :try_start_4
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :catch_3
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 89
    .line 90
    :goto_2
    :try_start_5
    const-string v3, "yuvutils"

    .line 91
    .line 92
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    const-string v3, "mmcv"

    .line 96
    .line 97
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    const-string v3, "videoprocess"

    .line 101
    .line 102
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    const-string v3, "tracker"

    .line 106
    .line 107
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    const-string v3, "coverpicker"

    .line 111
    .line 112
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    const-string v3, "flowextent"

    .line 116
    .line 117
    invoke-interface {p0, v3}, Ltv/danmaku/ijk/media/player/IjkLibLoader;->loadLibrary(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    sput-boolean v1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z
    :try_end_5
    .catch Ljava/lang/Error; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :catch_4
    :try_start_6
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :catch_5
    sput-boolean v2, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIsLibLoaded:Z

    .line 127
    .line 128
    :cond_1
    :goto_3
    monitor-exit v0

    .line 129
    return-void

    .line 130
    :goto_4
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 131
    throw p0
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 1

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
    check-cast p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public static postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method private release_l()V
    .locals 5

    .line 1
    const-string v0, "ijkMediaStreamer"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setScreenOnWhilePublishing(Z)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :try_start_0
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 16
    .line 17
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v3, v1, v4}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 23
    .line 24
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->j()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 28
    .line 29
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 30
    .line 31
    :cond_0
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 32
    .line 33
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorTread:Landroid/os/HandlerThread;

    .line 46
    .line 47
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    :catch_0
    :cond_1
    :try_start_1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->stopRecording_l()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 53
    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 57
    .line 58
    .line 59
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catch_1
    move-exception v1

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    const-string v1, "MediaStreamer.release _stop"

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 76
    .line 77
    .line 78
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 79
    .line 80
    :cond_3
    const-string v1, "MediaStreamer.release _stop end"

    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->deAttachStreamer()V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 96
    .line 97
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->stopSurroundMusic()V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 101
    .line 102
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->release()V

    .line 103
    .line 104
    .line 105
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 106
    .line 107
    :cond_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->reset()V

    .line 108
    .line 109
    .line 110
    const-string v1, "MediaStreamer.release mFakeSurface.release"

    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 116
    .line 117
    if-eqz v1, :cond_5

    .line 118
    .line 119
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B0()V

    .line 120
    .line 121
    .line 122
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 123
    .line 124
    :cond_5
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 128
    .line 129
    .line 130
    :goto_2
    const-string v1, "MediaStreamer.release end"

    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHT:Landroid/os/HandlerThread;

    .line 136
    .line 137
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 138
    .line 139
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 140
    .line 141
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 142
    .line 143
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 144
    .line 145
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnPreparedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

    .line 146
    .line 147
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnRecordStopedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

    .line 148
    .line 149
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnCameraSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;

    .line 150
    .line 151
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 152
    .line 153
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 154
    .line 155
    return-void
.end method

.method private selectFilter_l(Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ltv/danmaku/ijk/media/util/GPUImageFilterTools;->a(Landroid/content/Context;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;I)Ll/jt2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x1

    .line 8
    if-ne p3, p2, :cond_0

    .line 9
    .line 10
    new-instance p3, Ll/rrf0;

    .line 11
    .line 12
    invoke-direct {p3, p1}, Ll/rrf0;-><init>(Ll/jt2;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {p1, v0, p3}, Ltv/danmaku/ijk/media/source/SourceBase;->t(Landroid/content/Context;Ll/jt2;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->x(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 35
    .line 36
    invoke-virtual {p2, p3, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->t(Landroid/content/Context;Ll/jt2;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->x(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method private startMonitor()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMonitorHandler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$3;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$3;-><init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v2, 0x4e20

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private startRecording_l()V
    .locals 3

    .line 1
    const-string v0, "zjlfound"

    .line 2
    .line 3
    const-string v1, "----startRecording_l mIjkWriter:"

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 25
    .line 26
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setDefaultAudioRoutetoSpeakerphone(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->startRecording()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :catch_0
    move-exception v1

    .line 38
    goto :goto_0

    .line 39
    :catch_1
    move-exception v1

    .line 40
    goto :goto_1

    .line 41
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :cond_0
    :goto_2
    const-string v1, "startRecording_l"

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 55
    .line 56
    return-void
.end method

.method private stopRecording_l()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stopRecording()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stopRecording()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i2()V

    .line 20
    .line 21
    .line 22
    :cond_2
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 24
    .line 25
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 26
    .line 27
    if-eqz v1, :cond_3

    .line 28
    .line 29
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 33
    .line 34
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v0, p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_1
    move-exception p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    :cond_3
    :goto_0
    const-string p0, "zjlfound"

    .line 50
    .line 51
    const-string v0, "stopRecording_l"

    .line 52
    .line 53
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public EnableExternalAudio(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectReset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->SabineEffectReset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->SabineEffectReset()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->SabineEffectSet(IIF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->SabineEffectSet(IIF)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public SetSubVideoFullScreen(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SetSubVideoPos(JIIII)V
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-wide v1, p1

    .line 4
    move v3, p3

    .line 5
    move v4, p4

    .line 6
    move v5, p5

    .line 7
    move v6, p6

    .line 8
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->SetSubVideoPos(JIIIII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public SetSubVideoPos(JIIIII)V
    .locals 0

    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz p0, :cond_0

    .line 13
    invoke-virtual/range {p0 .. p7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K1(JIIIII)V

    :cond_0
    return-void
.end method

.method public addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public addFilterToDestory(Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->a(Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o0(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public addMediaCodecSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z(Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addSoftListener(Ll/qmq0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c0(Ll/qmq0$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustAef(IZ)V
    .locals 0

    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustEQ(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustEQ(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public adjustEf(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustEf(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustEf(II)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public adjustTune(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustTune(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->adjustTune(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public aidGetCurrentPosition(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q0(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-wide/16 p0, 0x0

    .line 11
    .line 12
    return-wide p0
.end method

.method public aidGetDuration(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r0(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-wide/16 p0, 0x0

    .line 11
    .line 12
    return-wide p0
.end method

.method public aidSeekTo(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s0(JJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public attachStreamer(I)V
    .locals 4

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_5

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 8
    .line 9
    instance-of v0, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 25
    .line 26
    :cond_1
    const/4 v0, -0x1

    .line 27
    if-ne p1, v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->deAttachStreamer()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    if-nez p1, :cond_3

    .line 34
    .line 35
    new-instance v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 36
    .line 37
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 38
    .line 39
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 40
    .line 41
    invoke-direct {v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 45
    .line 46
    :cond_3
    const/4 v0, 0x1

    .line 47
    if-ne p1, v0, :cond_4

    .line 48
    .line 49
    new-instance p1, Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 50
    .line 51
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 52
    .line 53
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 54
    .line 55
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0()Ljavax/microedition/khronos/egl/EGLContext;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 60
    .line 61
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 62
    .line 63
    invoke-direct {p1, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;-><init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 67
    .line 68
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 69
    .line 70
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l2(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    :goto_0
    return-void
.end method

.method public attachStreamer(IZ)V
    .locals 3

    .line 76
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    if-eq v0, p1, :cond_5

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    instance-of v0, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    if-nez v0, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 78
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    const/4 v0, 0x0

    .line 80
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    :cond_1
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    .line 81
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->deAttachStreamer()V

    return-void

    :cond_2
    if-nez p1, :cond_3

    .line 82
    new-instance v0, Lcom/immomo/mediacore/sink/IjkWriter;

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    invoke-direct {v0, v1, p2}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    :cond_3
    const/4 v0, 0x1

    if-ne p1, v0, :cond_4

    .line 83
    new-instance p1, Ltv/danmaku/ijk/media/sink/AgoraWriter;

    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    invoke-direct {p1, v0, v1, v2, p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;-><init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)V

    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 84
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l2(Lcom/immomo/mediacore/sink/SinkBase;)V

    :cond_5
    :goto_0
    return-void
.end method

.method public attachStreamerForAudio(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$2;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$2;-><init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public attachToSpecStreamer(I)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----attachToSpecStreamer:"

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
    const-string v1, ",mVenderID="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "zjlfound"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 31
    .line 32
    if-ne v0, p1, :cond_0

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 38
    .line 39
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 40
    .line 41
    const-string v2, "ijkMediaStreamer"

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "----attachToSpecStreamer: call stopRecording()"

    .line 46
    .line 47
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 51
    .line 52
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i2()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    const-string v0, "----attachToSpecStreamer: call mIjkWriter.stopRecording()"

    .line 60
    .line 61
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stopRecording()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 72
    .line 73
    .line 74
    :cond_2
    if-nez p1, :cond_3

    .line 75
    .line 76
    new-instance v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 77
    .line 78
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 79
    .line 80
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 81
    .line 82
    invoke-direct {v0, v2, v3}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 86
    .line 87
    :cond_3
    const/4 v0, 0x1

    .line 88
    if-ne p1, v0, :cond_4

    .line 89
    .line 90
    new-instance v0, Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 91
    .line 92
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 93
    .line 94
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 95
    .line 96
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0()Ljavax/microedition/khronos/egl/EGLContext;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 101
    .line 102
    iget-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnlyAudio:Z

    .line 103
    .line 104
    invoke-direct {v0, v2, v3, v4, v5}, Ltv/danmaku/ijk/media/sink/AgoraWriter;-><init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 108
    .line 109
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 110
    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 114
    .line 115
    invoke-virtual {v2, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoChannellistener(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 119
    .line 120
    if-eqz v0, :cond_6

    .line 121
    .line 122
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setMasterAudioLevel(F)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 128
    .line 129
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setSlaveAudioLevel(F)V

    .line 132
    .line 133
    .line 134
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 135
    .line 136
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q2(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v2, "----attachToSpecStreamer mIjkWriter:"

    .line 144
    .line 145
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v2, ";type="

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p1, "; mIjkWriter"

    .line 162
    .line 163
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 167
    .line 168
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    const/4 p1, 0x0

    .line 179
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPlayStatus:I

    .line 180
    .line 181
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->startMonitor()V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public changeRole(I)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "changeRole:"

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
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->changeRole(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public deAttachStreamer()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l2(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stop()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setAttachedVideoQuality(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public enableAudio(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->enableAudio(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public enableAudioVolumeIndication(II)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->enableAudioVolumeIndication(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u0(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
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

.method public enableCommMode(Z)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->enableCommMode(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public enableConfLog(ZLjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public enableExternStream(Z)V
    .locals 0

    return-void
.end method

.method public enableMulPusherInRoom(Z)V
    .locals 0

    return-void
.end method

.method public enableVideo(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->enableVideo(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public focusOnRect(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->b(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getAVDiff()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAVDiff()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAcodecSendSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAcodecSendSize()J

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
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public getAgoraEngine()Lio/agora/rtc2/RtcEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAgoraEngine()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lio/agora/rtc2/RtcEngine;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getAudioBitRate()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAudioBitRate()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getAudioCacheSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAudioCacheSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioEncoderSizes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioFrameCache()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioFrameCapture()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioPacketCache()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioRxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAudioRxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioTxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAudioTxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getAudioVideoStatics()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAudioVideoStatics()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "[(0)]"

    .line 11
    .line 12
    return-object p0
.end method

.method public getAvFlag()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAvFlag()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getAverageSendBitRateB()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAverageSendBitRateB()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getBusinessType()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getBusinessType()I

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

.method public getCPUandMemStatistics()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pgy;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getConnectTime()J
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e22

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public getCpuVideoProcessingCount()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->c()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getCpuVideoProcessingDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->d()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getCurCamera()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->e()Landroid/hardware/Camera;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getCurrentZoomLevel()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->g()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getDefaultAecParam()I
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getDefaultAecParam()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getDefaultAecParam()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public getExternFileDuration()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getFaceDetectionCount()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->h()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getFaceDetectionDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->i()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getFirstAuidoPacketTime()J
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 8
    .line 9
    if-eqz v3, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    const/16 v0, 0x4e20

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    sub-long/2addr v3, v5

    .line 24
    cmp-long p0, v3, v1

    .line 25
    .line 26
    if-gez p0, :cond_0

    .line 27
    .line 28
    return-wide v1

    .line 29
    :cond_0
    return-wide v3

    .line 30
    :cond_1
    return-wide v1
.end method

.method public getFirstSendPacketTime()J
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e23

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public getFirstVideoPacketTime()J
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 8
    .line 9
    if-eqz v3, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    const/16 v0, 0x4e20

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    sub-long/2addr v3, v5

    .line 24
    cmp-long p0, v3, v1

    .line 25
    .line 26
    if-gez p0, :cond_0

    .line 27
    .line 28
    return-wide v1

    .line 29
    :cond_0
    return-wide v3

    .line 30
    :cond_1
    return-wide v1
.end method

.method public getGpuVideoProcessingCount()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->j()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getGpuVideoProcessingDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->k()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getIjkWriter()Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMasterAudioLevel()F
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    const/high16 v2, 0x3f000000    # 0.5f

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    return v2

    .line 19
    :cond_1
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getMasterAudioLevel()F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_2
    return v2
.end method

.method public getMaxZoomLevel()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->l()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getMediaStatus()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/16 p0, 0x11

    .line 11
    .line 12
    return p0
.end method

.method public getPacketCacheDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getPreviewSize(II)Ll/erf0;
    .locals 0

    .line 1
    new-instance p0, Ll/erf0;

    .line 2
    .line 3
    const/16 p1, 0x160

    .line 4
    .line 5
    const/16 p2, 0x280

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Ll/erf0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public getPropertyFloat(IF)F
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyFloat(IF)F

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

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
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public getPropertyLong(IJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-wide p0

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
    :cond_0
    :goto_0
    const-wide/16 p0, 0x0

    .line 20
    .line 21
    return-wide p0
.end method

.method public getPublisherVideoHigh()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getPublisherVideoHigh()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getPublisherVideoWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getPublisherVideoWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRecordDuration()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRecordHeight()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRecordWidth()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRenderToCodecSurfaceCost()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRenderToDisplayCost()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getRoomType()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRtmpSendSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

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
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public getRxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getRxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getServerIpAddr()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

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
    :cond_0
    :goto_0
    const-string p0, ""

    .line 20
    .line 21
    return-object p0
.end method

.method public getSlaveAudioLevel()F
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    const/high16 v2, 0x3f000000    # 0.5f

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M0()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    return v2

    .line 19
    :cond_1
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getMasterAudioLevel()F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_2
    return v2
.end method

.method public getStreamerType()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVenderID:I

    .line 2
    .line 3
    return p0
.end method

.method public getSurroundMusicDuration()J
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    return-wide v0

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getSurroundMusicPos()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0

    .line 23
    :cond_1
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    return-wide v0
.end method

.method public getSurroundMusicPos()J
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    return-wide v0

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getSurroundMusicPos()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0

    .line 23
    :cond_1
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    return-wide v0
.end method

.method public getTxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getTxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVcodecSendSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVcodecSendSize()J

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
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public getVideoBitRate()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoBitRate()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getVideoCacheSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoCacheSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoChannelListener()Ll/ebl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoEncoderPackets()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoEncoderSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoFrameCapture()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoFrameRate()I
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoFrameRate()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->m()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public getVideoFreezeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getVideoPacketCache()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoPacketCache()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoPts()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoPts()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "----getVideoQuality: "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 19
    .line 20
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ","

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 31
    .line 32
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "ijkMediaStreamer"

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQuality:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public getVideoResolution()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoRxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoRxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoTxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getVideoTxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getWriteByte()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getWriteByte()J

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
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public ignoreMonitor(Z)V
    .locals 0

    return-void
.end method

.method public ignoreWriterSEI(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->ignoreWriterSEI(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->ignoreWriterSEI(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public initConfApi(Ljava/lang/String;IJJZLjava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move v2, p2

    .line 7
    move-wide v3, p3

    .line 8
    move-wide/from16 v5, p5

    .line 9
    .line 10
    move/from16 v7, p7

    .line 11
    .line 12
    move-object/from16 v8, p8

    .line 13
    .line 14
    move-object/from16 v9, p9

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v9}, Lcom/immomo/mediacore/sink/SinkBase;->initConfApi(Ljava/lang/String;IJJZLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    move-object v2, p1

    .line 24
    move v3, p2

    .line 25
    move-wide v4, p3

    .line 26
    move-wide/from16 v6, p5

    .line 27
    .line 28
    move/from16 v8, p7

    .line 29
    .line 30
    move-object/from16 v9, p8

    .line 31
    .line 32
    move-object/from16 v10, p9

    .line 33
    .line 34
    invoke-virtual/range {v1 .. v10}, Lcom/immomo/mediacore/sink/SinkBase;->initConfApi(Ljava/lang/String;IJJZLjava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public isFrontCamera()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->o()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public isRecording()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isWiredHeadsetOn()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public loadFaceModel()V
    .locals 0

    return-void
.end method

.method public loadGestureModel(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/c950;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mixAndSetSubVideoPos(JLjava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/sink/SinkBase;->mixAndSetSubVideoPos(JLjava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public muteAllRemoteAudioStream(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteRemoteAudioStream mute"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y0(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteAllRemoteAudioStream(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteAllRemoteAudioStream(Z)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public muteAllRemoteVideoStream(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteAllRemoteVideoStream(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteAllRemoteVideoStream(Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public muteLocalAudioStream(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalAudioStream(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalAudioStream(Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public muteLocalAudioStreamEx(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteLocalAudioStreamEx mute"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalAudioStreamForGame(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalAudioStreamForGame(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public muteLocalVideoStream(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalVideoStream(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->muteLocalVideoStream(Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public muteRemoteAudioStream(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteRemoteAudioStream uid"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";mute:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "ijkMediaStreamer"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1(JZ)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->muteRemoteAudioStream(JZ)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->muteRemoteAudioStream(JZ)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public muteRemoteVideoStream(JZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d1(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->muteRemoteVideoStream(JZ)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->muteRemoteVideoStream(JZ)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public muteSingerAudioStream(Z)V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public openAudioTracks(Z)V
    .locals 0

    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLandroid/graphics/Bitmap;)V
    .locals 0

    .line 57
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz p0, :cond_0

    .line 58
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e1(Landroid/app/Activity;JLandroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;)V
    .locals 10

    .line 42
    const-string v0, "ijkMediaStreamer"

    const-string v1, "----openPublishHelp 6:"

    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v2, :cond_0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, p0

    move-object v3, p1

    move-wide v5, p2

    move-object v7, p4

    .line 44
    invoke-virtual/range {v2 .. v9}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V

    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;II)V
    .locals 13

    .line 51
    const-string v0, "ijkMediaStreamer"

    const-string v1, "----openPublishHelp 3:"

    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v2, :cond_0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    move-object v3, p1

    move-wide v5, p2

    move-object/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    .line 53
    invoke-virtual/range {v2 .. v12}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;ILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;)V
    .locals 13

    .line 54
    const-string v0, "ijkMediaStreamer"

    const-string v1, "----openPublishHelp 2:"

    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v2, :cond_0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v4, p0

    move-object v3, p1

    move-wide v5, p2

    move-object/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    .line 56
    invoke-virtual/range {v2 .. v12}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;ILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V
    .locals 13

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----openPublishHelp 1:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    move/from16 v11, p8

    .line 9
    .line 10
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "ijkMediaStreamer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const/4 v12, 0x0

    .line 27
    move-object v4, p0

    .line 28
    move-object v3, p1

    .line 29
    move-wide v5, p2

    .line 30
    move-object/from16 v7, p4

    .line 31
    .line 32
    move/from16 v8, p5

    .line 33
    .line 34
    move/from16 v9, p6

    .line 35
    .line 36
    move-object/from16 v10, p7

    .line 37
    .line 38
    invoke-virtual/range {v2 .. v12}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;ILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;)V
    .locals 10

    .line 45
    const-string v0, "ijkMediaStreamer"

    const-string v1, "----openPublishHelp 5:"

    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v2, :cond_0

    const/4 v9, 0x0

    move-object v4, p0

    move-object v3, p1

    move-wide v5, p2

    move-object v7, p4

    move-object v8, p5

    .line 47
    invoke-virtual/range {v2 .. v9}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V

    :cond_0
    return-void
.end method

.method public openPublishHelp(Landroid/app/Activity;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V
    .locals 10

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "----openPublishHelp 4:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v9, p6

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ijkMediaStreamer"

    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v2, :cond_0

    move-object v4, p0

    move-object v3, p1

    move-wide v5, p2

    move-object v7, p4

    move-object v8, p5

    .line 50
    invoke-virtual/range {v2 .. v9}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V

    :cond_0
    return-void
.end method

.method public pauseCamera()V
    .locals 0

    return-void
.end method

.method public pausePlaying()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->pausePlaying()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseRecording()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->pauseRecording()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseSurroundMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->pauseSurroundMusic()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public prepare()Z
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 6
    .line 7
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/mediacore/sink/SinkBase;->setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    goto :goto_2

    .line 15
    :catch_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :catch_1
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    goto :goto_2

    .line 23
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_2
    const/4 v0, 0x1

    .line 27
    :try_start_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->prepare()Z

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_2

    .line 35
    goto :goto_5

    .line 36
    :catch_2
    move-exception p0

    .line 37
    goto :goto_3

    .line 38
    :catch_3
    move-exception p0

    .line 39
    goto :goto_4

    .line 40
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    goto :goto_5

    .line 44
    :goto_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_5
    const-string p0, "zjlfound"

    .line 48
    .line 49
    const-string v1, "prepare"

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    return v0
.end method

.method public qbuffer([BIJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1([BIJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    const-string v0, "ijkMediaStreamer"

    .line 2
    .line 3
    const-string v1, "MediaStreamer.release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->release_l()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final removeRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->removeRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public requestExpectStream(II)V
    .locals 0

    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mEventHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHT:Landroid/os/HandlerThread;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHT:Landroid/os/HandlerThread;

    .line 34
    .line 35
    const-wide/16 v0, 0xbb8

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :cond_2
    return-void
.end method

.method public resetCamera()V
    .locals 0

    return-void
.end method

.method public resumePlaying()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->resumePlaying()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeRecording()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->resumeRecording()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeSurroundMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->resumeSurroundMusic()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public seekToSurroundMusic(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1(J)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->seekToSurroundMusic(J)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public selectAudioTrack(I)V
    .locals 0

    return-void
.end method

.method public selectCamera(Landroid/app/Activity;I)V
    .locals 3

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource;

    .line 13
    .line 14
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 15
    .line 16
    invoke-direct {v0, p1, v1}, Ltv/danmaku/ijk/media/source/CameraSource;-><init>(Landroid/app/Activity;Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 20
    .line 21
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/SourceBase;->C(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 34
    .line 35
    const/16 v1, 0x2d0

    .line 36
    .line 37
    const/16 v2, 0x500

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 44
    .line 45
    const/4 v2, 0x5

    .line 46
    if-ne v0, v2, :cond_3

    .line 47
    .line 48
    const/16 v0, 0x210

    .line 49
    .line 50
    const/16 v2, 0x3c0

    .line 51
    .line 52
    invoke-virtual {v1, v0, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/16 v0, 0x1e0

    .line 57
    .line 58
    const/16 v2, 0x280

    .line 59
    .line 60
    invoke-virtual {v1, v0, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 64
    .line 65
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/SourceBase;->G(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 71
    .line 72
    const-string v1, "ijkMediaStreamer"

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    const-string v0, "set select camere"

    .line 81
    .line 82
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 87
    .line 88
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 89
    .line 90
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 91
    .line 92
    invoke-virtual {v0, p1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 96
    .line 97
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L0(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 103
    .line 104
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 105
    .line 106
    invoke-virtual {v0, p1, p2, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->r(Landroid/app/Activity;ILtv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 110
    .line 111
    if-eqz p0, :cond_5

    .line 112
    .line 113
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notifyResumeRecording()V

    .line 114
    .line 115
    .line 116
    const-string p0, "----selectCamera 1: notifyResumeRecording end"

    .line 117
    .line 118
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :cond_5
    return-void
.end method

.method public selectCameraSize(I)V
    .locals 4

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->o()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 12
    .line 13
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 14
    .line 15
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->f()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 20
    .line 21
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x1

    .line 29
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "----selectCameraSize:level="

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, ";cameraID="

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, "; orient="

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v1, "ijkMediaStreamer"

    .line 62
    .line 63
    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    new-instance p1, Ltv/danmaku/ijk/media/source/CameraSource;

    .line 67
    .line 68
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 69
    .line 70
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 71
    .line 72
    invoke-direct {p1, v2, v3}, Ltv/danmaku/ijk/media/source/CameraSource;-><init>(Landroid/app/Activity;Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/source/SourceBase;->v(I)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 81
    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->C(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 90
    .line 91
    const/4 v0, 0x3

    .line 92
    if-ne p1, v0, :cond_2

    .line 93
    .line 94
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 95
    .line 96
    const/16 v0, 0x2d0

    .line 97
    .line 98
    const/16 v2, 0x500

    .line 99
    .line 100
    invoke-virtual {p1, v0, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 105
    .line 106
    const/4 v2, 0x5

    .line 107
    if-ne p1, v2, :cond_3

    .line 108
    .line 109
    const/16 p1, 0x210

    .line 110
    .line 111
    const/16 v2, 0x3c0

    .line 112
    .line 113
    invoke-virtual {v0, p1, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    const/16 p1, 0x1e0

    .line 118
    .line 119
    const/16 v2, 0x280

    .line 120
    .line 121
    invoke-virtual {v0, p1, v2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 122
    .line 123
    .line 124
    :goto_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 125
    .line 126
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/source/SourceBase;->G(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 132
    .line 133
    if-eqz p1, :cond_4

    .line 134
    .line 135
    const-string p1, "set select camere"

    .line 136
    .line 137
    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    const/4 p1, 0x0

    .line 141
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 142
    .line 143
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 144
    .line 145
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 146
    .line 147
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 148
    .line 149
    invoke-virtual {p1, v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 153
    .line 154
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L0(I)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 160
    .line 161
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mParent:Landroid/app/Activity;

    .line 162
    .line 163
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 164
    .line 165
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 166
    .line 167
    invoke-virtual {p1, v0, v1, p0}, Ltv/danmaku/ijk/media/source/SourceBase;->r(Landroid/app/Activity;ILtv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 168
    .line 169
    .line 170
    :cond_4
    return-void
.end method

.method public selectFaceDetectFilter(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p1, p0, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->s(Landroid/content/Context;Ll/jt2;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public selectFilter(Landroid/app/Activity;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1, v0, p2, p3, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public selectFilter(Landroid/app/Activity;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;II)V
    .locals 1

    .line 31
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    const/16 v0, 0xc8

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 32
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p1, v0, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public selectFilter(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 29
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    if-eqz p1, :cond_0

    .line 30
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p0, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->t(Landroid/content/Context;Ll/jt2;)V

    :cond_0
    return-void
.end method

.method public sendAecParam(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->sendAecParam(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->sendAecParam(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setAttachedVideoQuality(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAudioChannelNum(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioChannelNum(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
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

.method public setAudioEncoder(I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioEncoder(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public setAudioEncodingBitRate(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o1(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioEncodingBitRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_1
    move-exception p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void

    .line 28
    :cond_2
    const-string p0, "Audio encoding bit rate is not positive"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setAudioHighQualityParameters(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAudioHighQualityFlg:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioHighQualityParameters(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setAudioSamplingRate(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioSamplingRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_1
    move-exception p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void

    .line 28
    :cond_2
    const-string p0, "Audio sampling rate is not positive"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setAudioSource(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioSource(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAudioSource(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_1
    move-exception p0

    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public setAudioTrackIndex(I)V
    .locals 0

    return-void
.end method

.method public setAvFlag(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setAvFlag(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBitRateAdaptEnable(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBitRateAdaptiveEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBlinkSwitch(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->u(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBusinessType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setBusinessType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCameraRotation(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCameraSuccess()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnCameraSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getCurCamera()Landroid/hardware/Camera;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;->a(Landroid/hardware/Camera;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setChannalName(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setChannalName(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setChannalName(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-long v0, p1

    .line 20
    invoke-virtual {p0, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setSessionID(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setChannelkey(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setChannelkey(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setChannelkey(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setCrop(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCustZoomFlag(Z)V
    .locals 0

    return-void
.end method

.method public setDefaultAudioRoutetoSpeakerphone(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setDefaultAudioRoutetoSpeakerphone(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDelayoffset(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setDelayoffset(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setDelayoffset(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setDoFaceDetect(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->w(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEnableSpeakerphone(Z)I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEnableSpeakerphone(Z)I

    .line 13
    .line 14
    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public setEncoderSize(II)V
    .locals 0

    return-void
.end method

.method public setEncryptionMode(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEncryptionMode(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEncryptionMode(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEncryptionSecret(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setEncryptionSecret(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final setExternAudioDevStatusCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setExternAudioDevStatusCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setExternEncoderSize(II)V
    .locals 0

    return-void
.end method

.method public setExternVideoEncodingBitRate(I)V
    .locals 0

    return-void
.end method

.method public setFaceBeautiful(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->x(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceDetectEnable(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setFaceDetectModelPath(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->y(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceDetectTimeoutSwitch(Z)V
    .locals 0

    return-void
.end method

.method public setFaceEyeScale(Ljava/lang/Float;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->z(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setFaceThinScale(Ljava/lang/Float;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->A(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setHost(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setHost(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setHost(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final setJsonDataCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setJsonDataCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setJsonForPostion(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setJsonForPostion(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setJsonForPostion(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setLandMode(Z)V
    .locals 0

    return-void
.end method

.method public setLocalMergeSei(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setLogUploadCallBack(IILtv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 2
    .line 3
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 4
    .line 5
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 6
    .line 7
    return-void
.end method

.method public setMasterAudioLevel(F)V
    .locals 2

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mMasterAudioLevel:F

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1(F)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setMasterAudioLevel(F)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setMaxCacheDuration(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x4e24

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyLong(IJ)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setMaxPacketDuration(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMediaCodecEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMinCacheDuration(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x4e2e

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyLong(IJ)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setNetAnchorTime(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setNotifyTriggerDuration(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOnCameraSetListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnCameraSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnCameraSetListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnErrorListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnFPSChangeListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnFPSRateListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnFPSChangeListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnFPSRateListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnInfoListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPreparedListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnPreparedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRecordStoped(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnRecordStopedListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRtcStatusListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnRtcStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnSurroundMusicStatusListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setOnSurroundMusicStatusListener(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setOnWiredHeadsetStatusListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setParameters(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setParameters(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setPlayBackAudioLevel(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setPlayBackAudioLevel(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setPlayerStateCallback(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V
    .locals 0

    return-void
.end method

.method public setPreferCameraSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->B(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSurface:Ljava/lang/Object;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSurface:Ljava/lang/Object;

    .line 13
    .line 14
    :goto_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n0(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public setPreviewScale(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1(Landroid/graphics/PointF;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 0

    return-void
.end method

.method public setPreviewSizeSetListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->C(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setPreviewSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n0(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setPreviewZoom(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->D(F)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mZoom:F

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1(F)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public setPropertyFloat(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyFloat(IF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public setPropertyLong(IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyLong(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setRenderFrameRate(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----setRenderFrameRate:"

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
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q0(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public setRole(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRole(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRoomMode(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRoomMode(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRoomMode(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setRoomMode(IZ)V
    .locals 1

    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    if-eqz v0, :cond_0

    .line 17
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setRoomMode(IZ)V

    .line 18
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    if-eqz p0, :cond_1

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setRoomMode(IZ)V

    :cond_1
    return-void
.end method

.method public setRoomType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRoomType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRtmpPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRtmpPath(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRtmpPath(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setScreenOnWhilePublishing(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setScreenQuality(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSei(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setSei(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setSei(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public setServerSystemTime(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x4e21

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyLong(IJ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setSessionID(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setSessionID(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setSessionID(J)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setSlaveAudioLevel(F)V
    .locals 2

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mSlaveAudioLevel:F

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H1(F)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setSlaveAudioLevel(F)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setStreamPixFmt(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x7530

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setPropertyLong(IJ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "setStreamPixFmt:"

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "ijkMediaStreamer"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setStreamerCaptureType(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->E(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setStreamerInOutAndType:type:"

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
    const-string v1, ";inpath:"

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
    const-string v1, ";;outpath:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ijkMediaStreamer"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInpath:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 39
    .line 40
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFileType:I

    .line 41
    .line 42
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {v0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase;->setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catch_1
    move-exception p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    return-void
.end method

.method public setStreamerType(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setUserID(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setUserID(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setUserID(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N1(I)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public setUserSig(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setVideoChannelListener(Ll/ebl0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O1(Ll/ebl0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoChannellistener(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoChannellistener(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setVideoCodeFrameRate(I)V
    .locals 0

    return-void
.end method

.method public setVideoEncoder(I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoEncoder(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
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
    :cond_0
    :goto_0
    return-void
.end method

.method public setVideoEncodingBitRate(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----setVideoEncodingBitRate: Rate="

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
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    if-gtz p1, :cond_0

    .line 21
    .line 22
    const p1, 0x186a0

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P1(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 33
    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoEncodingBitRate(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_1
    move-exception p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public setVideoFrameRate(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----setVideoFrameRate: videoFrameRate="

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
    const-string v1, "ijkMediaStreamer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q1(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoFrameRate(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->F(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_1
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public setVideoMixerBackgroundImgUrl(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setVideoQualityParameters(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAgoraEngine()Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAgoraEngine()Lio/agora/rtc2/RtcEngine;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoQualityFlg:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lio/agora/rtc2/RtcEngine;->setVideoQualityParameters(Z)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setVideoResolution(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->G(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setVideoSize(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoSize(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
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

.method public setVideoSource(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoSource(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoSource(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S1(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_1
    move-exception p0

    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public setViewShowMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setVoicebackwardsEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVoicebackwardsEnable(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U1(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setWarpType(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->H(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setZoomLevel(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->I(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startAttachStreamer()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->startAttachStreamer()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startAudioCapture()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startCaptureImage(Landroid/app/Activity;Landroid/graphics/Bitmap;III)V
    .locals 9

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/source/ImageSource;

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/source/ImageSource;-><init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "----set select image: "

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ","

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "ijkMediaStreamer"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    const/4 v2, 0x2

    .line 63
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 64
    .line 65
    invoke-virtual {v0, p1, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 69
    .line 70
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L0(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 76
    .line 77
    const/4 v8, 0x0

    .line 78
    move-object v3, p1

    .line 79
    move-object v4, p2

    .line 80
    move v5, p3

    .line 81
    move v6, p4

    .line 82
    move v7, p5

    .line 83
    invoke-virtual/range {v2 .. v8}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X1(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public startCaptureImage(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V
    .locals 3

    .line 87
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 89
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/source/ImageSource;

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/source/ImageSource;-><init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "----set select image: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ijkMediaStreamer"

    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v0, :cond_1

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    if-eqz v1, :cond_1

    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    .line 92
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 93
    invoke-virtual {v0, p1, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V

    .line 94
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L0(I)V

    .line 95
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X1(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V

    :cond_1
    return-void
.end method

.method public startCaptureScreen(Landroid/app/Activity;IILandroid/media/projection/MediaProjection;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/source/ScreenSource;

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/source/ScreenSource;-><init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "----set select screen: "

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ","

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "ijkMediaStreamer"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 64
    .line 65
    invoke-virtual {v0, p1, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 69
    .line 70
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L0(I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 76
    .line 77
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y1(Landroid/app/Activity;IILandroid/media/projection/MediaProjection;I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public startPlaying()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->startPlaying()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 13
    .line 14
    if-lez v4, :cond_1

    .line 15
    .line 16
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 17
    .line 18
    if-lez v5, :cond_1

    .line 19
    .line 20
    new-instance v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 21
    .line 22
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 25
    .line 26
    move-object v3, p0

    .line 27
    invoke-direct/range {v1 .. v6}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IILtv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, v3, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v3, p0

    .line 34
    :goto_0
    iget-object p0, v3, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k()V

    .line 39
    .line 40
    .line 41
    iget-object p0, v3, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 42
    .line 43
    iget-object v0, v3, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->h(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public startPreview(ILjava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public startPreview(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 2
    return-void
.end method

.method public startRecording()V
    .locals 7

    .line 1
    const-string v0, "zjlfound"

    .line 2
    .line 3
    const-string v1, "----startRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/pgy;->r()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 16
    .line 17
    const/16 v1, 0x64

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->startMonitor()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mInterval:I

    .line 46
    .line 47
    if-lez v4, :cond_0

    .line 48
    .line 49
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCount:I

    .line 50
    .line 51
    if-lez v5, :cond_0

    .line 52
    .line 53
    new-instance v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 54
    .line 55
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mContext:Landroid/content/Context;

    .line 56
    .line 57
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 58
    .line 59
    move-object v3, p0

    .line 60
    invoke-direct/range {v1 .. v6}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IILtv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V

    .line 61
    .line 62
    .line 63
    iput-object v1, v3, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->startSurroundMusic(Ljava/lang/String;IJ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/immomo/mediacore/sink/SinkBase;->startSurroundMusic(Ljava/lang/String;IJ)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public startSurroundMusicEx(Ljava/lang/String;ZZI)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const-wide/16 p3, 0x0

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->startSurroundMusic(Ljava/lang/String;IJ)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/immomo/mediacore/sink/SinkBase;->startSurroundMusicEx(Ljava/lang/String;ZZI)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public stopAudioCapture()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopCaptureImage()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->L()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopCaptureScreen()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->M()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopPlaying()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stopPlaying()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public stopPublishHelp(J)V
    .locals 2

    .line 1
    const-string v0, "ijkMediaStreamer"

    .line 2
    .line 3
    const-string v1, "----stopPublishHelp"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h2(J)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public stopRecording()V
    .locals 4

    .line 1
    const-string v0, "zjlfound"

    .line 2
    .line 3
    const-string v1, "stopRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/pgy;->s()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 16
    .line 17
    const/16 v1, 0x65

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCmdHandler:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public stopRenderer()V
    .locals 0

    return-void
.end method

.method public stopSurroundMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->stopSurroundMusic()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->stopSurroundMusic()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public switchCamera()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->N()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 9
    .line 10
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->o()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCameraID:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public switchFilterTo(Landroid/app/Activity;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/SourceBase;->O(Landroid/content/Context;Ll/jt2;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public switchVideoResolution(II)V
    .locals 6

    .line 1
    const/16 v0, 0x2d0

    .line 2
    .line 3
    const-string v1, ",h:"

    .line 4
    .line 5
    const-string v2, "ijkMediaStreamer"

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq p1, v0, :cond_3

    .line 9
    .line 10
    const/16 v0, 0x500

    .line 11
    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/16 v0, 0x210

    .line 16
    .line 17
    if-eq p1, v0, :cond_2

    .line 18
    .line 19
    const/16 v0, 0x3c0

    .line 20
    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 25
    .line 26
    if-eq v0, v3, :cond_4

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v4, "----switchVideoResolution: 1w:"

    .line 31
    .line 32
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {v2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->selectCameraSize(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 56
    .line 57
    const/4 v4, 0x5

    .line 58
    if-eq v0, v4, :cond_4

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v5, "----switchVideoResolution: 5w:"

    .line 63
    .line 64
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {v2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->selectCameraSize(I)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_3
    :goto_1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mVideoResolution:I

    .line 88
    .line 89
    const/4 v4, 0x3

    .line 90
    if-eq v0, v4, :cond_4

    .line 91
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v5, "----switchVideoResolution: 3w:"

    .line 95
    .line 96
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {v2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->selectCameraSize(I)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    const/4 v3, 0x0

    .line 120
    :goto_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 121
    .line 122
    if-eqz p1, :cond_5

    .line 123
    .line 124
    if-eqz v3, :cond_5

    .line 125
    .line 126
    new-instance p1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string p2, "----switchVideoResolution: sizeChanged="

    .line 129
    .line 130
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {v2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 144
    .line 145
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notifyResumeRecording()V

    .line 146
    .line 147
    .line 148
    const-string p0, "----switchVideoResolution: call notifyResumeRecording end"

    .line 149
    .line 150
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    :cond_5
    return-void
.end method

.method public unRegisterHeadsetPlugReceiver()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public unSelectCamera()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->P()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateCaptureImage(Landroid/graphics/Bitmap;III)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mFakeSurface:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mCaptureType:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne p0, v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m2(Landroid/graphics/Bitmap;III)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public updateChannelkey(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->updateChannelkey(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mAttachedWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->updateChannelkey(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public updateVideoVideoQuality(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->streamProduct:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p2(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkSource:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/SourceBase;->R(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public uploadLocalVideo(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mIjkWriter:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->uploadLocalVideo(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
