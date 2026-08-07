.class public Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
.super Lcom/ss/bytertc/engine/RTCEngineEx;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;
    }
.end annotation


# static fields
.field protected static final TAG:Ljava/lang/String; = "RtcVideoImpl"

.field public static final synthetic a:I = 0x0

.field private static mAudioDeviceManagerEventHandler:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static mDeviceId:Ljava/lang/String; = null

.field private static mLibraryLoaded:Z = false

.field private static mRTCAudioDeviceManagerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioDeviceEventHandler; = null

.field private static mRtcNativeLibraryListener:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener; = null

.field private static final nativeLibraryPrefix:Ljava/lang/String; = "lib"

.field private static final nativeLibrarySurffix:Ljava/lang/String; = ".so"

.field private static sRtcLoaderInfo:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo; = null

.field private static final sSoLibraryName:Ljava/lang/String; = "volcenginertc"


# instance fields
.field private appStateCallback:Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;

.field private isExEngine:Z

.field private mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

.field private mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;

.field private mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

.field private mAudioEffectPlayer:Lcom/ss/bytertc/engine/AudioEffectPlayer;

.field private mChorusObserver:Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

.field private mContext:Landroid/content/Context;

.field private mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

.field private mEglHandler:Landroid/os/Handler;

.field private mEglThread:Landroid/os/HandlerThread;

.field private mEnableTranscode:Z

.field private mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

.field private mExternalVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

.field private mGameRoomMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/bytertc/engine/GameRoomImpl;",
            ">;"
        }
    .end annotation
.end field

.field private mIsFront:Z

.field private mIsUseCustomEglEnv:Z

.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field private mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

.field private mLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;

.field private mLoggerSink:Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

.field private mMetadataObserver:Lcom/ss/bytertc/engine/IMetadataObserver;

.field private mMixedStreamToCDNObserver:Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

.field protected mNativeEngine:J

.field private mOnDestroyCompletedCallback:Ljava/lang/Runnable;

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;

.field private mRoomMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/bytertc/engine/RTCRoomImpl;",
            ">;"
        }
    .end annotation
.end field

.field private mRoomRtsLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/RTSRoomImpl;",
            ">;"
        }
    .end annotation
.end field

.field private mRootEglBase:Lcom/bytedance/realx/video/EglBase;

.field private mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

.field private mRtcEngineHandlerEx:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;

.field private mRtcExVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;

.field private mRtcLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;

.field private mRtcMediaPlayerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/ss/bytertc/engine/RtcMediaPlayer;",
            ">;"
        }
    .end annotation
.end field

.field private mRtcRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;

.field private mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

.field private mSingScoringManager:Lcom/ss/bytertc/engine/SingScoringManager;

.field private mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

.field private mVideoDevicemanager:Lcom/ss/bytertc/engine/VideoDeviceManager;

.field private mVideoSinkTask:Lcom/ss/bytertc/engine/adapter/VideoSinkTask;

.field private mWTNStream:Lcom/ss/bytertc/engine/WTNStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryListenerImpl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryListenerImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcNativeLibraryListener:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;

    .line 7
    .line 8
    new-instance v0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->sRtcLoaderInfo:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-object v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRTCAudioDeviceManagerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioDeviceEventHandler;

    .line 17
    .line 18
    const-string v0, ""

    .line 19
    .line 20
    sput-object v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mDeviceId:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;ZZ)V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p4

    .line 1
    const-string v0, "rtc.platform_init_elapse_ms"

    const-string v9, "rtc loader info:"

    const-string v4, "error in recording create engine elpase. "

    invoke-direct {v1}, Lcom/ss/bytertc/engine/RTCEngineEx;-><init>()V

    const/4 v10, 0x0

    .line 2
    iput-boolean v10, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->isExEngine:Z

    .line 3
    iput-boolean v10, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsUseCustomEglEnv:Z

    const-wide/16 v5, 0x0

    .line 4
    iput-wide v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 5
    iput-boolean v10, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEnableTranscode:Z

    const/4 v5, 0x0

    .line 6
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mOnDestroyCompletedCallback:Ljava/lang/Runnable;

    .line 7
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 8
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcExVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;

    .line 9
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;

    .line 10
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;

    .line 11
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 12
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    .line 13
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mChorusObserver:Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

    .line 14
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mMixedStreamToCDNObserver:Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

    const/4 v6, 0x1

    .line 15
    iput-boolean v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsFront:Z

    .line 16
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioEffectPlayer:Lcom/ss/bytertc/engine/AudioEffectPlayer;

    .line 17
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 18
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

    .line 19
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mSingScoringManager:Lcom/ss/bytertc/engine/SingScoringManager;

    .line 20
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 21
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 22
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mWTNStream:Lcom/ss/bytertc/engine/WTNStream;

    .line 23
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoDevicemanager:Lcom/ss/bytertc/engine/VideoDeviceManager;

    .line 24
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;

    .line 25
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 26
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 27
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomRtsLists:Ljava/util/List;

    .line 28
    new-instance v6, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 29
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    iput-object v7, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    iput-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 31
    new-instance v6, Ll/bjc0;

    invoke-direct {v6, v1}, Ll/bjc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLoggerSink:Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

    .line 32
    new-instance v6, Ll/cjc0;

    invoke-direct {v6, v1}, Ll/cjc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->appStateCallback:Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;

    .line 33
    iget-object v11, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->context:Landroid/content/Context;

    .line 34
    iget-object v6, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->appID:Ljava/lang/String;

    .line 35
    iget-boolean v7, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->isGameScene:Z

    .line 36
    iget-object v8, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->eglContext:Ljava/lang/Object;

    .line 37
    iget-object v12, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->parameters:Lorg/json/JSONObject;

    .line 38
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "create RtcEngineImpl with appId: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "RtcVideoImpl"

    invoke-static {v14, v13}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v8, :cond_1

    .line 39
    instance-of v13, v8, Landroid/opengl/EGLContext;

    if-eqz v13, :cond_0

    goto :goto_0

    .line 40
    :cond_0
    const-string v0, "eglContext is not an instance of android.opengl.EGLContext"

    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v5

    .line 41
    :cond_1
    :goto_0
    sget-boolean v5, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z

    if-nez v5, :cond_2

    .line 42
    const-string v5, "rtc sdk load so failed"

    const/16 v13, -0x430

    invoke-direct {v1, v6, v5, v13}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->reportAndThrowError(Ljava/lang/String;Ljava/lang/String;I)V

    :cond_2
    if-nez v6, :cond_3

    .line 43
    const-string v5, "app id is null"

    const/16 v13, -0x3ed

    invoke-direct {v1, v6, v5, v13}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->reportAndThrowError(Ljava/lang/String;Ljava/lang/String;I)V

    .line 44
    :cond_3
    :try_start_0
    new-instance v5, Landroid/os/HandlerThread;

    const-string v13, "rtc_egl_thread"

    invoke-direct {v5, v13}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglThread:Landroid/os/HandlerThread;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 46
    :try_start_2
    new-instance v5, Lcom/ss/bytertc/engine/adapter/VideoSinkTask;

    invoke-direct {v5}, Lcom/ss/bytertc/engine/adapter/VideoSinkTask;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoSinkTask:Lcom/ss/bytertc/engine/adapter/VideoSinkTask;

    .line 47
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/adapter/VideoSinkTask;->init()V

    .line 48
    new-instance v5, Landroid/os/Handler;

    iget-object v13, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v13}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v13

    invoke-direct {v5, v13}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglHandler:Landroid/os/Handler;

    if-nez v8, :cond_5

    .line 49
    new-instance v8, Ll/djc0;

    invoke-direct {v8, v1}, Ll/djc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    invoke-static {v5, v8}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 50
    iget-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    invoke-interface {v5}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    move-result-object v5

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v3, v6

    move-object/from16 v19, v11

    goto/16 :goto_e

    .line 51
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "init egl context failed"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_5
    new-instance v5, Lcom/bytedance/realx/video/EglBase14$Context;

    check-cast v8, Landroid/opengl/EGLContext;

    invoke-direct {v5, v8}, Lcom/bytedance/realx/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    .line 53
    :goto_1
    new-instance v5, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    invoke-direct {v5}, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 54
    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mContext:Landroid/content/Context;

    .line 55
    sget-object v5, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->IDLE:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    move-object/from16 v5, p2

    .line 56
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    move-object/from16 v5, p3

    .line 57
    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandlerEx:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;

    .line 58
    iget-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLoggerSink:Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

    invoke-static {v5}, Lcom/ss/bytertc/engine/utils/LogUtil;->setLoggerSink(Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;)V

    .line 59
    new-instance v5, Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    invoke-direct {v5, v1}, Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    .line 60
    new-instance v5, Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;

    invoke-direct {v5, v1}, Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;

    .line 61
    new-instance v5, Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;

    invoke-direct {v5, v1}, Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;

    .line 62
    new-instance v5, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

    invoke-direct {v5}, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mChorusObserver:Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

    .line 63
    new-instance v5, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

    invoke-direct {v5}, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mMixedStreamToCDNObserver:Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

    .line 64
    new-instance v5, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;

    invoke-direct {v5, v1}, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcExVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;

    .line 65
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 66
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomRtsLists:Ljava/util/List;
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v12, :cond_6

    .line 67
    :try_start_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v15

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v17
    :try_end_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_4

    move-object/from16 v19, v11

    sub-long v10, v15, v17

    .line 68
    :try_start_4
    invoke-virtual {v12, v0, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    :goto_2
    move-object v3, v6

    goto/16 :goto_e

    :catch_2
    move-exception v0

    :goto_3
    move-object v3, v6

    goto/16 :goto_d

    :catch_3
    move-exception v0

    .line 69
    :try_start_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_4

    :catch_4
    move-exception v0

    move-object/from16 v19, v11

    goto :goto_2

    :catch_5
    move-exception v0

    move-object/from16 v19, v11

    goto :goto_3

    :cond_6
    move-object/from16 v19, v11

    .line 70
    :goto_4
    const-string v0, ""

    if-eqz p5, :cond_a

    .line 71
    :try_start_6
    iput-boolean v3, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->isExEngine:Z
    :try_end_6
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_1

    .line 72
    iget-object v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_8

    .line 73
    :try_start_7
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    if-nez v12, :cond_7

    :goto_5
    move-object v5, v0

    move-object v0, v3

    move-object v3, v6

    goto :goto_6

    .line 74
    :cond_7
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_5

    :goto_6
    :try_start_8
    iget-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    iget-object v7, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    move-object v2, v0

    .line 75
    invoke-virtual/range {v1 .. v7}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->createRTCVideoExMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J
    :try_end_8
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_8 .. :try_end_8} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_6

    goto/16 :goto_c

    :catch_6
    move-exception v0

    goto/16 :goto_e

    :catch_7
    move-exception v0

    goto/16 :goto_d

    :cond_8
    move-object v3, v6

    .line 76
    :try_start_9
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    move-object v5, v4

    iget-object v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    if-nez v12, :cond_9

    goto :goto_7

    .line 77
    :cond_9
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_7
    iget-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    iget-object v7, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    move-object v2, v5

    move-object v5, v0

    .line 78
    invoke-virtual/range {v1 .. v7}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->createRTCVideoMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    move-result-wide v4
    :try_end_9
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_9 .. :try_end_9} :catch_9
    .catch Ljava/lang/IllegalStateException; {:try_start_9 .. :try_end_9} :catch_8

    move-object v6, v3

    :try_start_a
    iput-wide v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    move-object v3, v6

    goto :goto_c

    :catch_8
    move-exception v0

    move-object v6, v3

    goto/16 :goto_e

    :catch_9
    move-exception v0

    move-object v6, v3

    goto :goto_d

    .line 79
    :cond_a
    iput-boolean v3, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->isExEngine:Z
    :try_end_a
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_1

    .line 80
    iget-object v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_c

    .line 81
    :try_start_b
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    if-nez v12, :cond_b

    :goto_8
    move-object v5, v0

    move-object v0, v3

    move-object v3, v6

    goto :goto_9

    .line 82
    :cond_b
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_b} :catch_1

    goto :goto_8

    :goto_9
    :try_start_c
    iget-object v6, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    iget-object v7, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    move-object v2, v0

    .line 83
    invoke-virtual/range {v1 .. v7}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->createRTCVideoEx(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    goto :goto_c

    :cond_c
    move-object v3, v6

    .line 84
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEngineEventHandler:Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;

    if-nez v12, :cond_d

    :goto_a
    move-object v6, v0

    move-object v0, v4

    move v4, v7

    goto :goto_b

    .line 85
    :cond_d
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :goto_b
    iget-object v7, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglBaseCtx:Lcom/bytedance/realx/video/EglBase$Context;

    iget-object v8, v2, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    move-object v2, v0

    .line 86
    invoke-virtual/range {v1 .. v8}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->createRTCVideo(Landroid/content/Context;Ljava/lang/String;ZLcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 87
    :goto_c
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_f

    .line 88
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "create native engine error."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_c
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_c .. :try_end_c} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_c} :catch_6

    .line 89
    :goto_d
    :try_start_d
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 90
    new-instance v2, Ljava/lang/UnsatisfiedLinkError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->sRtcLoaderInfo:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;

    invoke-virtual {v5}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " exception info:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    throw v2

    :catch_a
    move-object v3, v6

    move-object/from16 v19, v11

    .line 92
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "egl thread create thread failed as out of memory"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catch Ljava/lang/IllegalStateException; {:try_start_d .. :try_end_d} :catch_6

    .line 93
    :goto_e
    const-string v2, "create native engine error, native engine is invalid."

    invoke-static {v14, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-direct {v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->doDestroyOnCreate()V

    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "system resources check failed. "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v13, 0x0

    invoke-direct {v1, v3, v0, v13}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->reportAndThrowError(Ljava/lang/String;Ljava/lang/String;I)V

    .line 96
    :goto_f
    new-instance v0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    iget-wide v2, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-direct {v0, v2, v3}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;-><init>(J)V

    iput-object v0, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 97
    invoke-static {}, Lcom/ss/bytertc/engine/utils/LogRecover;->getInstance()Lcom/ss/bytertc/engine/utils/LogRecover;

    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/utils/LogRecover;->startTimer()V

    .line 99
    invoke-static/range {v19 .. v19}, Lcom/ss/bytertc/engine/utils/AppMonitor;->get(Landroid/content/Context;)Lcom/ss/bytertc/engine/utils/AppMonitor;

    move-result-object v0

    iget-object v1, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->appStateCallback:Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;

    move-object/from16 v2, v19

    invoke-virtual {v0, v2, v1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->register(Landroid/content/Context;Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;)Lcom/ss/bytertc/engine/utils/AppMonitor;

    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    invoke-direct {p0, v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initEglContext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->createDummyPbufferSurface()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0

    .line 21
    :catch_0
    const-string p0, "RtcVideoImpl"

    .line 22
    .line 23
    const-string v0, "init egl context falied"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    return-object p0
.end method

.method public static synthetic d(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, SetAppState failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-ne p1, v2, :cond_1

    .line 31
    .line 32
    const-string p1, "active"

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const-string p1, "background"

    .line 36
    .line 37
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAppState(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method private doDestroyOnCreate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->dispose()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglHandler:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v1, Ll/ajc0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ajc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglThread:Landroid/os/HandlerThread;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoSinkTask:Lcom/ss/bytertc/engine/adapter/VideoSinkTask;

    .line 31
    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/adapter/VideoSinkTask;->exit()V

    .line 35
    .line 36
    .line 37
    :cond_3
    return-void
.end method

.method public static synthetic e(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getRtcEngineHandler()Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLoggerMessage(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mOnDestroyCompletedCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/utils/RtcContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getAudioDeviceManagerEvent()Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerEventHandler:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;

    .line 8
    .line 9
    return-object v0
.end method

.method public static getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetSDKVersion()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private initEglContext(Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/bytedance/realx/video/EglBase;->create()Lcom/bytedance/realx/video/EglBase;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsUseCustomEglEnv:Z

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    instance-of v0, p1, Ljavax/microedition/khronos/egl/EGLContext;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    check-cast p1, Ljavax/microedition/khronos/egl/EGLContext;

    .line 18
    .line 19
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/bytedance/realx/video/EglBase;->createEgl10(Ljavax/microedition/khronos/egl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    instance-of v0, p1, Landroid/opengl/EGLContext;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    check-cast p1, Landroid/opengl/EGLContext;

    .line 33
    .line 34
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/bytedance/realx/video/EglBase;->createEgl14(Landroid/opengl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    instance-of v0, p1, Lcom/bytedance/realx/video/EglBase;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    check-cast p1, Lcom/bytedance/realx/video/EglBase;

    .line 48
    .line 49
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 54
    .line 55
    invoke-static {p1, v0}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    invoke-static {}, Lcom/bytedance/realx/video/EglBase;->create()Lcom/bytedance/realx/video/EglBase;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 67
    .line 68
    :goto_0
    const/4 p1, 0x1

    .line 69
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsUseCustomEglEnv:Z

    .line 70
    .line 71
    return-void
.end method

.method public static declared-synchronized initializeNativeLibs()Z
    .locals 2

    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    monitor-enter v0

    const/4 v1, 0x0

    .line 68
    :try_start_0
    invoke-static {v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static declared-synchronized initializeNativeLibs(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcNativeLibraryListener:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;

    .line 9
    .line 10
    const-string v1, "volcenginertc"

    .line 11
    .line 12
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;->onLoadAlready(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const-string v1, "volcenginertc"

    .line 19
    .line 20
    invoke-static {p0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->loadNativeLib(Ljava/lang/String;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sput-boolean p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    sget-object p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcNativeLibraryListener:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;

    .line 29
    .line 30
    const-string v1, "volcenginertc"

    .line 31
    .line 32
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;->onLoadError(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-boolean p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    :try_start_1
    sget-object p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcNativeLibraryListener:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;

    .line 40
    .line 41
    const-string v1, "volcenginertc"

    .line 42
    .line 43
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderListener;->onLoadSuccess(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->sRtcLoaderInfo:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;

    .line 47
    .line 48
    sget-boolean v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->setLoadResult(Z)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->sRtcLoaderInfo:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;

    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v1

    .line 59
    invoke-virtual {p0, v1, v2}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->setLoadTimeStampMs(J)V

    .line 60
    .line 61
    .line 62
    sget-boolean p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLibraryLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    monitor-exit v0

    .line 65
    return p0

    .line 66
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    throw p0
.end method

.method private static loadNativeLib(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "loadNativeLib: Failed to load native library: "

    .line 2
    .line 3
    const-string v1, "loadNativeLib: Success Load "

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "Loading library: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "RtcVideoImpl"

    .line 20
    .line 21
    invoke-static {v3, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "lib"

    .line 27
    .line 28
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, ".so"

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v4, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    sget-object v4, Lcom/ss/bytertc/engine/RTCEngine;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 59
    .line 60
    if-eqz v4, :cond_0

    .line 61
    .line 62
    invoke-interface {v4, p1}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;->load(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception p0

    .line 78
    goto :goto_1

    .line 79
    :catch_1
    move-exception p0

    .line 80
    goto :goto_2

    .line 81
    :catch_2
    move-exception p0

    .line 82
    goto :goto_3

    .line 83
    :catch_3
    move-exception p0

    .line 84
    goto :goto_4

    .line 85
    :cond_1
    invoke-static {v2}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const/4 v1, 0x1

    .line 101
    invoke-static {v3, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    return v1

    .line 105
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {v3, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    goto :goto_5

    .line 121
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {v3, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    goto :goto_5

    .line 137
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {v3, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 150
    .line 151
    .line 152
    goto :goto_5

    .line 153
    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {v3, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    :goto_5
    const/4 p0, 0x0

    .line 169
    return p0
.end method

.method private reportAndThrowError(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "event_key"

    .line 7
    .line 8
    const-string v2, "rtc_error"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "rtc_app_id"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string p1, "device_id"

    .line 19
    .line 20
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mDeviceId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    const-string p1, "error_code"

    .line 26
    .line 27
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string p1, "message"

    .line 31
    .line 32
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string p1, "timestamp"

    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string p1, "rtc_timestamp"

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    const-string p1, "os"

    .line 54
    .line 55
    const-string v1, "android"

    .line 56
    .line 57
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string p1, "product_line"

    .line 61
    .line 62
    const-string v1, "rtc"

    .line 63
    .line 64
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    const-string p1, "report_version"

    .line 68
    .line 69
    const/4 v1, 0x5

    .line 70
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception p1

    .line 75
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    .line 79
    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    const-string v1, "live_webrtc_monitor_log"

    .line 83
    .line 84
    invoke-virtual {p1, v1, v0}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLogReport(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    .line 88
    .line 89
    invoke-virtual {p0, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onError(I)V

    .line 90
    .line 91
    .line 92
    :cond_0
    const-string p0, "RtcVideoImpl"

    .line 93
    .line 94
    invoke-static {p0, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 98
    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    const-string p3, "Create engine failed "

    .line 102
    .line 103
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw p0
.end method

.method public static setLogConfig(Lcom/ss/bytertc/engine/data/RTCLogConfig;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logLevel:Lcom/ss/bytertc/engine/data/LocalLogLevel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/LocalLogLevel;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logPath:Ljava/lang/String;

    .line 8
    .line 9
    iget v2, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFileSize:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFilenamePrefix:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1, v2, p0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLogConfig(ILjava/lang/String;ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method


# virtual methods
.method public clearVideoWatermark(Lcom/ss/bytertc/engine/data/StreamIndex;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeClearVideoWatermark(JI)I

    .line 26
    .line 27
    .line 28
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return p1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 38
    .line 39
    const-string v0, "native engine is invalid, clearVideoWatermark failed."

    .line 40
    .line 41
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 47
    .line 48
    .line 49
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    goto :goto_0

    .line 51
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 54
    .line 55
    .line 56
    throw p1
.end method

.method public createGameRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/GameRoomConfig;)Lcom/ss/bytertc/engine/IGameRoom;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string p1, "native engine is invalid, createGameRoom failed."

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    :try_start_2
    const-string p1, ""

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 33
    .line 34
    const-wide/16 v3, 0x0

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getNativeHandle()J

    .line 53
    .line 54
    .line 55
    move-result-wide v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    cmp-long v0, v5, v3

    .line 57
    .line 58
    iget-object v5, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    :try_start_3
    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 69
    .line 70
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/ss/bytertc/engine/IGameRoom;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 79
    .line 80
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 83
    .line 84
    .line 85
    return-object p1

    .line 86
    :cond_3
    :goto_1
    :try_start_4
    iget-wide v5, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 87
    .line 88
    invoke-static {v5, v6, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateGameRoom(JLjava/lang/String;Lcom/ss/bytertc/engine/GameRoomConfig;)J

    .line 89
    .line 90
    .line 91
    move-result-wide v5

    .line 92
    cmp-long p2, v5, v3

    .line 93
    .line 94
    if-nez p2, :cond_4

    .line 95
    .line 96
    const-string p1, "createRoom failed, native room is invalid"

    .line 97
    .line 98
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    new-instance p2, Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 103
    .line 104
    invoke-direct {p2, p1, v5, v6}, Lcom/ss/bytertc/engine/GameRoomImpl;-><init>(Ljava/lang/String;J)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 108
    .line 109
    if-nez v0, :cond_5

    .line 110
    .line 111
    new-instance v0, Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 117
    .line 118
    :cond_5
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 119
    .line 120
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 126
    .line 127
    .line 128
    return-object p2

    .line 129
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 132
    .line 133
    .line 134
    throw p1
.end method

.method public createRTCRoom(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTCRoom;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string p1, "native engine is invalid, createRoom failed."

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    :try_start_2
    const-string p1, ""

    .line 31
    .line 32
    :cond_1
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 33
    .line 34
    invoke-static {v3, v4, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateRoom(JLjava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    const-wide/16 v5, 0x0

    .line 39
    .line 40
    cmp-long v0, v3, v5

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const-string p1, "createRoom failed, native room is invalid"

    .line 45
    .line 46
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getNativeHandle()J

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    cmp-long v1, v1, v5

    .line 73
    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->addRtcRoomCount()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 86
    .line 87
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/ss/bytertc/engine/RTCRoom;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 92
    .line 93
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 96
    .line 97
    .line 98
    return-object p1

    .line 99
    :cond_4
    :goto_1
    :try_start_3
    new-instance v0, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 100
    .line 101
    invoke-direct {v0, p1, v3, v4}, Lcom/ss/bytertc/engine/RTCRoomImpl;-><init>(Ljava/lang/String;J)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 105
    .line 106
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 112
    .line 113
    .line 114
    return-object v0

    .line 115
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 118
    .line 119
    .line 120
    throw p1
.end method

.method public createRTCRoomEx(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTCRoomEx;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string p1, "native engine is invalid, createRoom failed."

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    :try_start_2
    const-string p1, ""

    .line 31
    .line 32
    :cond_1
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 33
    .line 34
    invoke-static {v3, v4, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateRoomEx(JLjava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    const-wide/16 v5, 0x0

    .line 39
    .line 40
    cmp-long v0, v3, v5

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const-string p1, "createRoom failed, native room is invalid"

    .line 45
    .line 46
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getNativeHandle()J

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    cmp-long v1, v1, v5

    .line 73
    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->addRtcRoomCount()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 86
    .line 87
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/ss/bytertc/engine/RTCRoomEx;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 92
    .line 93
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 96
    .line 97
    .line 98
    return-object p1

    .line 99
    :cond_4
    :goto_1
    :try_start_3
    new-instance v0, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 100
    .line 101
    invoke-direct {v0, p1, v3, v4}, Lcom/ss/bytertc/engine/RTCRoomImpl;-><init>(Ljava/lang/String;J)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 105
    .line 106
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 112
    .line 113
    .line 114
    return-object v0

    .line 115
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 118
    .line 119
    .line 120
    throw p1
.end method

.method public createRTCVideo(Landroid/content/Context;Ljava/lang/String;ZLcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateRTCVideo(Landroid/content/Context;Ljava/lang/String;ZLcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public createRTCVideoEx(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeCreateRTCVideoEx(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public createRTCVideoExMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeCreateRTCVideoExMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public createRTCVideoMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateRTCVideoMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public createRTSRoom(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTSRoom;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string p1, "native engine is invalid, createRoom failed."

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    :try_start_2
    const-string p1, ""

    .line 31
    .line 32
    :cond_1
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 33
    .line 34
    invoke-static {v3, v4, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeCreateRtsRoom(JLjava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    const-wide/16 v5, 0x0

    .line 39
    .line 40
    cmp-long v0, v3, v5

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const-string p1, "createRoom failed, native room is invalid"

    .line 45
    .line 46
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/RTSRoomImpl;

    .line 51
    .line 52
    invoke-direct {v0, p1, v3, v4}, Lcom/ss/bytertc/engine/RTSRoomImpl;-><init>(Ljava/lang/String;J)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomRtsLists:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public destroyRTCVideo(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDestroyRTCVideo(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroyRTCVideoEx(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeDestroyRTCVideoEx(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroyRTCVideoExMulti(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeDestroyRTCVideoExMulti(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroyRTCVideoMulti(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDestroyRTCVideoMulti(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public disableAlphaChannelVideoEncode(Lcom/ss/bytertc/engine/data/StreamIndex;)I
    .locals 3

    .line 1
    const-string v0, "disableAlphaChannelVideoEncode"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableAlphaChannelVideoEncode(JI)I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "native engine is invalid, disableAlphaChannelVideoEncode failed."

    .line 45
    .line 46
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 52
    .line 53
    .line 54
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public disableAudioFrameCallback(Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, disableAudioFrameCallback failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableAudioFrameCallback(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public disableAudioProcessor(Lcom/ss/bytertc/engine/data/AudioProcessorMethod;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, disableAudioProcessor failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioProcessorMethod;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableAudioProcessor(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public doDestroy(Z)V
    .locals 6

    .line 1
    const-string v0, "destroy RtcEngineImpl."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, no need to destroy now."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto/16 :goto_6

    .line 32
    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    iput-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 42
    .line 43
    .line 44
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 45
    .line 46
    iput-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mSingScoringManager:Lcom/ss/bytertc/engine/SingScoringManager;

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/SingScoringManager;->destroy()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/ss/bytertc/ktv/KTVManagerImpl;->destroy()V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

    .line 63
    .line 64
    if-eqz v2, :cond_3

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/RTCAudioDeviceManager;->destroy()V

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomMap:Ljava/util/Map;

    .line 70
    .line 71
    if-eqz v2, :cond_4

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 92
    .line 93
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/RTCRoomImpl;->destroy()V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mGameRoomMap:Ljava/util/Map;

    .line 98
    .line 99
    if-eqz v2, :cond_5

    .line 100
    .line 101
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_5

    .line 114
    .line 115
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 120
    .line 121
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/GameRoomImpl;->destroy()V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRoomRtsLists:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v2, :cond_6

    .line 128
    .line 129
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_6

    .line 138
    .line 139
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/ss/bytertc/engine/RTSRoomImpl;

    .line 144
    .line 145
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/RTSRoomImpl;->destroy()V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_6
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioEffectPlayer:Lcom/ss/bytertc/engine/AudioEffectPlayer;

    .line 150
    .line 151
    const/4 v3, 0x0

    .line 152
    if-eqz v2, :cond_7

    .line 153
    .line 154
    invoke-virtual {v2, v3}, Lcom/ss/bytertc/engine/AudioEffectPlayer;->setEventHandler(Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;)I

    .line 155
    .line 156
    .line 157
    :cond_7
    iget-object v4, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 158
    .line 159
    if-eqz v4, :cond_8

    .line 160
    .line 161
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-eqz v5, :cond_8

    .line 174
    .line 175
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, Lcom/ss/bytertc/engine/RtcMediaPlayer;

    .line 180
    .line 181
    invoke-virtual {v5, v3}, Lcom/ss/bytertc/engine/RtcMediaPlayer;->setEventHandler(Lcom/ss/bytertc/engine/IMediaPlayerEventHandler;)I

    .line 182
    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_8
    iget-boolean v4, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->isExEngine:Z

    .line 186
    .line 187
    if-eqz p1, :cond_a

    .line 188
    .line 189
    if-nez v4, :cond_9

    .line 190
    .line 191
    invoke-virtual {p0, v0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->destroyRTCVideoMulti(J)V

    .line 192
    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_9
    invoke-virtual {p0, v0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->destroyRTCVideoExMulti(J)V

    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_a
    if-nez v4, :cond_b

    .line 200
    .line 201
    invoke-virtual {p0, v0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->destroyRTCVideo(J)V

    .line 202
    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_b
    invoke-virtual {p0, v0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->destroyRTCVideoEx(J)V

    .line 206
    .line 207
    .line 208
    :goto_4
    if-eqz v2, :cond_c

    .line 209
    .line 210
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/AudioEffectPlayer;->destroy()V

    .line 211
    .line 212
    .line 213
    :cond_c
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 214
    .line 215
    if-eqz p1, :cond_d

    .line 216
    .line 217
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_d

    .line 230
    .line 231
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Lcom/ss/bytertc/engine/RtcMediaPlayer;

    .line 236
    .line 237
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RtcMediaPlayer;->destroy()V

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_d
    const/4 p1, 0x1

    .line 242
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsFront:Z

    .line 243
    .line 244
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 245
    .line 246
    if-eqz p1, :cond_e

    .line 247
    .line 248
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->destroy()V

    .line 249
    .line 250
    .line 251
    iput-object v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 252
    .line 253
    :cond_e
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;

    .line 254
    .line 255
    if-eqz p1, :cond_f

    .line 256
    .line 257
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/AmazingEffect;->dispose()V

    .line 258
    .line 259
    .line 260
    iput-object v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;

    .line 261
    .line 262
    :cond_f
    new-instance p1, Landroid/os/Handler;

    .line 263
    .line 264
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 269
    .line 270
    .line 271
    new-instance v0, Ll/ejc0;

    .line 272
    .line 273
    invoke-direct {v0, p0}, Ll/ejc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mContext:Landroid/content/Context;

    .line 280
    .line 281
    invoke-static {p1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->get(Landroid/content/Context;)Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->appStateCallback:Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;

    .line 286
    .line 287
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/utils/AppMonitor;->unRegister(Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;)Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mContext:Landroid/content/Context;

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/utils/AppMonitor;->release(Landroid/content/Context;)Z

    .line 294
    .line 295
    .line 296
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 297
    .line 298
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->dispose()V

    .line 299
    .line 300
    .line 301
    iput-object v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 302
    .line 303
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglHandler:Landroid/os/Handler;

    .line 304
    .line 305
    new-instance v0, Ll/fjc0;

    .line 306
    .line 307
    invoke-direct {v0, p0}, Ll/fjc0;-><init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    .line 308
    .line 309
    .line 310
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 311
    .line 312
    .line 313
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEglThread:Landroid/os/HandlerThread;

    .line 314
    .line 315
    if-eqz p1, :cond_10

    .line 316
    .line 317
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 318
    .line 319
    .line 320
    :cond_10
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoSinkTask:Lcom/ss/bytertc/engine/adapter/VideoSinkTask;

    .line 321
    .line 322
    if-eqz p1, :cond_11

    .line 323
    .line 324
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/adapter/VideoSinkTask;->exit()V

    .line 325
    .line 326
    .line 327
    :cond_11
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 328
    .line 329
    if-eqz p1, :cond_12

    .line 330
    .line 331
    invoke-virtual {p1}, Lcom/ss/bytertc/ktv/KTVManagerImpl;->destroy()V

    .line 332
    .line 333
    .line 334
    iput-object v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 335
    .line 336
    :cond_12
    invoke-static {v3}, Lcom/ss/bytertc/engine/utils/LogUtil;->setLoggerSink(Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;)V

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :goto_6
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 341
    .line 342
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 343
    .line 344
    .line 345
    throw p1
.end method

.method public enableAlphaChannelVideoEncode(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AlphaLayout;)I
    .locals 3

    .line 1
    const-string v0, "enableAlphaChannelVideoEncode"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    if-nez p2, :cond_1

    .line 27
    .line 28
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/AlphaLayout;->value()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAlphaChannelVideoEncode(JII)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    :goto_1
    const-string p1, "native engine is invalid, enableAlphaChannelVideoEncode failed."

    .line 58
    .line 59
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 65
    .line 66
    .line 67
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    goto :goto_0

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw p1
.end method

.method public enableAudioAEDReport(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioAEDReport(JI)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v0, "native engine is invalid, enableAudioAEDReport failed."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    goto :goto_0

    .line 47
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public enableAudioDecoding(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioDecoding(JZ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 33
    .line 34
    const-string v0, "native engine is invalid, enableAudioDecoding failed."

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public enableAudioEncoding(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioEncoding(JZ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 33
    .line 34
    const-string v0, "native engine is invalid, enableAudioEncoding failed."

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public enableAudioFrameCallback(Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;Lcom/ss/bytertc/engine/data/AudioFormat;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, enableAudioFrameCallback failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object v2, p2, Lcom/ss/bytertc/engine/data/AudioFormat;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object p2, p2, Lcom/ss/bytertc/engine/data/AudioFormat;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-static {v0, v1, p1, v2, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioFrameCallback(JIII)I

    .line 52
    .line 53
    .line 54
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public enableAudioProcessor(Lcom/ss/bytertc/engine/data/AudioProcessorMethod;Lcom/ss/bytertc/engine/data/AudioFormat;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, enableAudioProcessor failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioProcessorMethod;->value()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iget-object p1, p2, Lcom/ss/bytertc/engine/data/AudioFormat;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget-object p1, p2, Lcom/ss/bytertc/engine/data/AudioFormat;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iget v5, p2, Lcom/ss/bytertc/engine/data/AudioFormat;->samplesPerCall:I

    .line 53
    .line 54
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioProcessor(JIIII)I

    .line 55
    .line 56
    .line 57
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    goto :goto_0

    .line 59
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method public enableAudioPropertiesReport(Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;)I
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget v4, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 22
    .line 23
    iget-boolean v5, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 24
    .line 25
    iget-boolean v6, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 26
    .line 27
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioReportMode;->value()I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    iget v8, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    .line 34
    .line 35
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->value()I

    .line 38
    .line 39
    .line 40
    move-result v9

    .line 41
    iget-boolean v10, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 42
    .line 43
    invoke-static/range {v2 .. v10}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioPropertiesReport(JIZZIFIZ)I

    .line 44
    .line 45
    .line 46
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    return p1

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    move-object p1, v0

    .line 55
    goto :goto_2

    .line 56
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 57
    .line 58
    const-string v0, "native engine is invalid, EnableAudioPropertiesReport failed."

    .line 59
    .line 60
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 66
    .line 67
    .line 68
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    goto :goto_0

    .line 70
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method

.method public enableAudioVADReport(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAudioVADReport(JI)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v0, "native engine is invalid, enableAudioVADReport failed."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    goto :goto_0

    .line 47
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public enableCameraAutoExposureFaceMode(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableCameraAutoExposureFaceMode(JZ)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, -0x1

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public enableEffectBeauty(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, enableEffectBeauty failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x3e8

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableEffectBeauty(JZ)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public enableExternalSoundCard(Z)I
    .locals 2

    .line 1
    const-string v0, "enableExternalSoundCard"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, enableExternalSoundCard failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableExternalSoundCard(JZ)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public enableLocalVoiceReverb(Z)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableLocalVoiceReverb...enable: "

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
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, enableLocalVoiceReverb failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableLocalVoiceReverb(JZ)I

    .line 53
    .line 54
    .line 55
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    goto :goto_0

    .line 57
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public enablePlaybackDucking(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, EnablePlaybackDucking failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnablePlaybackDucking(JZ)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public enableVocalInstrumentBalance(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, EnableVocalInstrumentBalance failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableVocalInstrumentBalance(JZ)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public engineInvalid()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public feedback(Ljava/util/List;Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/type/ProblemFeedbackOption;",
            ">;",
            "Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;",
            ")I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, SetRuntimeParameters failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    :goto_1
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-ge v2, v3, :cond_1

    .line 41
    .line 42
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/ss/bytertc/engine/type/ProblemFeedbackOption;

    .line 47
    .line 48
    iget-wide v3, v3, Lcom/ss/bytertc/engine/type/ProblemFeedbackOption;->value:J

    .line 49
    .line 50
    or-long/2addr v0, v3

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 55
    .line 56
    invoke-static {v2, v3, v0, v1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeReportFeedback(JJLcom/ss/bytertc/engine/type/ProblemFeedbackInfo;)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public getAmazingEffectInterface()Lcom/ss/bytertc/engine/video/IAmazingEffect;
    .locals 7

    .line 1
    const-string v0, "getAmazingEffectInterface"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "native engine is invalid, getAmazingEffectInterface"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return-object v2

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    :try_start_2
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 44
    .line 45
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetAmazingEffectInterface(J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    const-wide/16 v5, 0x0

    .line 50
    .line 51
    cmp-long v0, v3, v5

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    const-string v0, "getAmazingEffectInterface failed"

    .line 56
    .line 57
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/video/AmazingEffect;

    .line 62
    .line 63
    invoke-direct {v0, v3, v4}, Lcom/ss/bytertc/engine/video/AmazingEffect;-><init>(J)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAmazingEffect:Lcom/ss/bytertc/engine/video/AmazingEffect;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw v0
.end method

.method public getAudioDeviceManager()Lcom/ss/bytertc/engine/IRTCAudioDeviceManager;
    .locals 7

    .line 1
    const-string v0, "getAudioDeviceManager"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "native engine is invalid, getAudioDeviceManager failed."

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return-object v2

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :try_start_1
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetAudioDeviceManager(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    const-wide/16 v5, 0x0

    .line 40
    .line 41
    cmp-long v0, v3, v5

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-wide/16 v5, -0x1

    .line 46
    .line 47
    cmp-long v0, v3, v5

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    new-instance v0, Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

    .line 53
    .line 54
    invoke-direct {v0, v3, v4}, Lcom/ss/bytertc/engine/RTCAudioDeviceManager;-><init>(J)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_0
    const-string v0, "getAudioDeviceManager failed"

    .line 61
    .line 62
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;

    .line 66
    .line 67
    :goto_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioDeviceManagerInterval:Lcom/ss/bytertc/engine/RTCAudioDeviceManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    .line 69
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    return-object v0

    .line 75
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 78
    .line 79
    .line 80
    throw v0
.end method

.method public getAudioEffectPlayer()Lcom/ss/bytertc/engine/audio/IAudioEffectPlayer;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string v0, "native engine is invalid, getAudioEffectPlayer"

    .line 16
    .line 17
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioEffectPlayer:Lcom/ss/bytertc/engine/AudioEffectPlayer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    :try_start_3
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetAudioEffectPlayer(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    const-wide/16 v5, 0x0

    .line 45
    .line 46
    cmp-long v0, v3, v5

    .line 47
    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    const-string v0, "getAudioEffectPlayer failed"

    .line 51
    .line 52
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/AudioEffectPlayer;

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 59
    .line 60
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/ss/bytertc/engine/AudioEffectPlayer;-><init>(JJ)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAudioEffectPlayer:Lcom/ss/bytertc/engine/AudioEffectPlayer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw v0
.end method

.method public getAudioRoute()Lcom/ss/bytertc/engine/data/AudioRoute;
    .locals 2

    .line 1
    const-string v0, "getAudioRoute"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, getAudioRoute failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetAudioRoute(J)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Lcom/ss/bytertc/engine/data/AudioRoute;->fromId(I)Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 40
    .line 41
    .line 42
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw v0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetCameraZoomMaxRatio(J)F

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v1, "native engine is invalid, PushScreenAudioFrame failed."

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    const/high16 p0, -0x40800000    # -1.0f

    .line 46
    .line 47
    return p0

    .line 48
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 51
    .line 52
    .line 53
    throw v0
.end method

.method public getEGLContext()Lcom/bytedance/realx/video/EglBase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRootEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public getEncodedVideoFrameObserver()Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mExternalVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKTVManager()Lcom/ss/bytertc/ktv/IKTVManager;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "RtcVideoImpl"

    .line 14
    .line 15
    const-string v2, "native engine is invalid, getKTVManger failed."

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :try_start_1
    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 29
    .line 30
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    :try_start_2
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :catchall_1
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :try_start_3
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 45
    .line 46
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetKTVManager(J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    cmp-long v4, v2, v4

    .line 53
    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    const-string v2, "RtcVideoImpl"

    .line 57
    .line 58
    const-string v3, "getKTVManger failed"

    .line 59
    .line 60
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    monitor-exit v0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    new-instance v1, Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 66
    .line 67
    invoke-direct {v1, v2, v3}, Lcom/ss/bytertc/ktv/KTVManagerImpl;-><init>(J)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mKTVManager:Lcom/ss/bytertc/ktv/KTVManagerImpl;

    .line 71
    .line 72
    monitor-exit v0

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 76
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 79
    .line 80
    .line 81
    throw v0
.end method

.method public getMediaPlayer(I)Lcom/ss/bytertc/engine/audio/IMediaPlayer;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string p1, "native engine is invalid, getMediaPlayer"

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 43
    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/ss/bytertc/engine/audio/IMediaPlayer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 57
    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_1
    :try_start_3
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 61
    .line 62
    invoke-static {v3, v4, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetMediaPlayer(JI)J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    const-wide/16 v5, 0x0

    .line 67
    .line 68
    cmp-long v0, v3, v5

    .line 69
    .line 70
    if-nez v0, :cond_2

    .line 71
    .line 72
    const-string p1, "getMediaPlayer failed"

    .line 73
    .line 74
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/RtcMediaPlayer;

    .line 79
    .line 80
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 81
    .line 82
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/ss/bytertc/engine/RtcMediaPlayer;-><init>(JJ)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 86
    .line 87
    if-nez v1, :cond_3

    .line 88
    .line 89
    new-instance v1, Ljava/util/HashMap;

    .line 90
    .line 91
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 95
    .line 96
    :cond_3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcMediaPlayerMap:Ljava/util/Map;

    .line 97
    .line 98
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 108
    .line 109
    .line 110
    return-object v0

    .line 111
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 114
    .line 115
    .line 116
    throw p1
.end method

.method public getMetadataObserver()Lcom/ss/bytertc/engine/IMetadataObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mMetadataObserver:Lcom/ss/bytertc/engine/IMetadataObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNativeHandle()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "RtcVideoImpl"

    .line 8
    .line 9
    const-string v0, "native engine is invalid, getNativeHandle failed."

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v0, -0x1

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 18
    .line 19
    return-wide v0
.end method

.method public getNetworkTimeInfo()Lcom/ss/bytertc/engine/NetworkTimeInfo;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v1, "native engine is invalid, getNetworkTimeInfo"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetNetworkTimeInfo(J)Lcom/ss/bytertc/engine/NetworkTimeInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public getPeerOnlineStatus(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetPeerOnlineStatus(JLjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public getRemoteEncodedVideoFrameObserver()Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcEngineHandler()Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcEngineHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandlerEx:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSingScoringManager()Lcom/ss/bytertc/engine/audio/ISingScoringManager;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "RtcVideoImpl"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_1
    const-string v0, "native engine is invalid, getSingScoringManager"

    .line 16
    .line 17
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mSingScoringManager:Lcom/ss/bytertc/engine/SingScoringManager;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    :try_start_3
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetSingScoringManager(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    const-wide/16 v5, 0x0

    .line 45
    .line 46
    cmp-long v0, v3, v5

    .line 47
    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    const-string v0, "getSingScoringManager failed"

    .line 51
    .line 52
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/SingScoringManager;

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 59
    .line 60
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/ss/bytertc/engine/SingScoringManager;-><init>(JJ)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mSingScoringManager:Lcom/ss/bytertc/engine/SingScoringManager;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw v0
.end method

.method public getVideoDeviceManager()Lcom/ss/bytertc/engine/video/IVideoDeviceManager;
    .locals 7

    .line 1
    const-string v0, "getVideoDeviceManager"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "native engine is invalid, getVideoDeviceManager"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return-object v2

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoDevicemanager:Lcom/ss/bytertc/engine/VideoDeviceManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    :try_start_2
    iget-wide v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 44
    .line 45
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetVideoDeviceManager(J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    const-wide/16 v5, 0x0

    .line 50
    .line 51
    cmp-long v0, v3, v5

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    const-string v0, "getVideoDeviceManager failed"

    .line 56
    .line 57
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    new-instance v0, Lcom/ss/bytertc/engine/VideoDeviceManager;

    .line 62
    .line 63
    invoke-direct {v0, v3, v4}, Lcom/ss/bytertc/engine/VideoDeviceManager;-><init>(J)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mVideoDevicemanager:Lcom/ss/bytertc/engine/VideoDeviceManager;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw v0
.end method

.method public getVideoEffectInterface()Lcom/ss/bytertc/engine/video/IVideoEffect;
    .locals 2

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    const-string v1, "getVideoEffectInterface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mAdvanceVideoEffect:Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 9
    .line 10
    return-object p0
.end method

.method public getWTNStream()Lcom/ss/bytertc/engine/IWTNStream;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "RtcVideoImpl"

    .line 14
    .line 15
    const-string v2, "native engine is invalid, getKTVManger failed."

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :try_start_1
    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 29
    .line 30
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    :try_start_2
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mWTNStream:Lcom/ss/bytertc/engine/WTNStream;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :catchall_1
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :try_start_3
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 45
    .line 46
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetWTNStream(J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    cmp-long v4, v2, v4

    .line 53
    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    const-string v2, "RtcVideoImpl"

    .line 57
    .line 58
    const-string v3, "getWTNStream failed"

    .line 59
    .line 60
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    monitor-exit v0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    new-instance v1, Lcom/ss/bytertc/engine/WTNStream;

    .line 66
    .line 67
    invoke-direct {v1, v2, v3}, Lcom/ss/bytertc/engine/WTNStream;-><init>(J)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mWTNStream:Lcom/ss/bytertc/engine/WTNStream;

    .line 71
    .line 72
    monitor-exit v0

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 76
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 79
    .line 80
    .line 81
    throw v0
.end method

.method public isCameraExposurePositionSupported()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeIsCameraExposurePositionSupported(J)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public isCameraFocusPositionSupported()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeIsCameraFocusPositionSupported(J)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public isCameraTorchSupported()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeIsSupportFlashLight(J)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v1, "native engine is invalid, PushScreenAudioFrame failed."

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public isCameraZoomSupported()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeIsCameraZoomSupported(J)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v1, "native engine is invalid, PushScreenAudioFrame failed."

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeLogin(JLjava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public logout()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v1, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeLogout(J)I

    .line 36
    .line 37
    .line 38
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public muteAudioCapture(Lcom/ss/bytertc/engine/data/StreamIndex;Z)I
    .locals 2

    .line 1
    const-string v0, "muteAudioCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, muteAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeMuteAudioCapture(JIZ)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public pullExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 22
    .line 23
    iget v5, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 24
    .line 25
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    iget-object p1, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-static/range {v2 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePullExternalAudioFrame(J[BIII)I

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    return p1

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 51
    .line 52
    const-string v0, "native engine is invalid, pullExternalAudioFrame failed."

    .line 53
    .line 54
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    goto :goto_0

    .line 64
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw p1
.end method

.method public pushClientMixedStreamExternalVideoFrame(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoFrameData;)I
    .locals 3

    .line 1
    const-string v0, "pushExternalVideoFrame"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    if-nez p2, :cond_1

    .line 27
    .line 28
    const-string p1, "pushClientMixedStreamExternalVideoFrame: videoFrame is null, drop frame."

    .line 29
    .line 30
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 48
    .line 49
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 50
    .line 51
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushClientMixedStreamExternalVideoFrame(JLjava/lang/String;Lcom/ss/bytertc/engine/data/VideoFrameData;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->fromId(I)Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    const-string p1, "pushClientMixedStreamExternalVideoFrame: native engine is invalid, pushExternalVideoFrame failed."

    .line 65
    .line 66
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 72
    .line 73
    .line 74
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    goto :goto_0

    .line 76
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 79
    .line 80
    .line 81
    throw p1
.end method

.method public pushExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 22
    .line 23
    iget v5, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 24
    .line 25
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    iget-object v8, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->extraInfo:[B

    .line 38
    .line 39
    invoke-static/range {v2 .. v8}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushExternalAudioFrame(J[BIII[B)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 46
    .line 47
    .line 48
    return p1

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p1, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 53
    .line 54
    const-string v0, "native engine is invalid, pushExternalAudioFrame failed."

    .line 55
    .line 56
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 62
    .line 63
    .line 64
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    goto :goto_0

    .line 66
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public pushExternalEncodedAudioFrame(Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;)I
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->extraInfo:Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :try_start_1
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->codecType:Lcom/ss/bytertc/engine/type/AudioCodecType;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/type/AudioCodecType;->value()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->data:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    iget v5, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->size:I

    .line 34
    .line 35
    iget-wide v6, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->timestampUs:J

    .line 36
    .line 37
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->channelNum:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    iget v10, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->frameSizeMs:I

    .line 50
    .line 51
    iget-object v11, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->extraInfo:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    invoke-virtual {v11}, Ljava/nio/Buffer;->capacity()I

    .line 54
    .line 55
    .line 56
    move-result v12

    .line 57
    invoke-static/range {v1 .. v12}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushExternalEncodedAudioFrame(JILjava/nio/ByteBuffer;IJIIILjava/nio/ByteBuffer;I)I

    .line 58
    .line 59
    .line 60
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    return p1

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    move-object p1, v0

    .line 69
    goto :goto_2

    .line 70
    :cond_1
    :try_start_2
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->codecType:Lcom/ss/bytertc/engine/type/AudioCodecType;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/type/AudioCodecType;->value()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->data:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    iget v5, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->size:I

    .line 79
    .line 80
    iget-wide v6, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->timestampUs:J

    .line 81
    .line 82
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->channelNum:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    iget v10, p1, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->frameSizeMs:I

    .line 95
    .line 96
    const/4 v11, 0x0

    .line 97
    const/4 v12, 0x0

    .line 98
    invoke-static/range {v1 .. v12}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushExternalEncodedAudioFrame(JILjava/nio/ByteBuffer;IJIIILjava/nio/ByteBuffer;I)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    goto :goto_0

    .line 103
    :cond_2
    :goto_1
    const-string p1, "RtcVideoImpl"

    .line 104
    .line 105
    const-string v0, "native engine is invalid, pushExternalEncodedAudioFrame failed."

    .line 106
    .line 107
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 113
    .line 114
    .line 115
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 116
    goto :goto_0

    .line 117
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 120
    .line 121
    .line 122
    throw p1
.end method

.method public pushExternalEncodedVideoFrame(Lcom/ss/bytertc/engine/data/StreamIndex;ILcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;)I
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p3

    .line 4
    .line 5
    iget-object v2, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const-string v0, "RtcVideoImpl"

    .line 17
    .line 18
    const-string v2, "native engine is invalid, PushExternalEncodedVideoFrame failed."

    .line 19
    .line 20
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 26
    .line 27
    .line 28
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    :goto_0
    iget-object v1, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return v0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :try_start_1
    iget-wide v2, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 38
    .line 39
    invoke-virtual/range {p1 .. p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget-object v6, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    iget-wide v7, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->timestampUs:J

    .line 46
    .line 47
    iget-wide v9, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->timestampDtsUs:J

    .line 48
    .line 49
    iget v11, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->width:I

    .line 50
    .line 51
    iget v12, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->height:I

    .line 52
    .line 53
    iget-object v5, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoCodecType:Lcom/ss/bytertc/engine/data/VideoCodecType;

    .line 54
    .line 55
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/data/VideoCodecType;->value()I

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    iget-object v5, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoPictureType:Lcom/ss/bytertc/engine/data/VideoPictureType;

    .line 60
    .line 61
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/data/VideoPictureType;->value()I

    .line 62
    .line 63
    .line 64
    move-result v14

    .line 65
    iget-object v0, v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 68
    .line 69
    .line 70
    move-result v15

    .line 71
    move/from16 v5, p2

    .line 72
    .line 73
    invoke-static/range {v2 .. v15}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushExternalEncodedVideoFrame(JIILjava/nio/ByteBuffer;JJIIIII)I

    .line 74
    .line 75
    .line 76
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    goto :goto_0

    .line 78
    :goto_1
    iget-object v1, v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 81
    .line 82
    .line 83
    throw v0
.end method

.method public pushExternalVideoFrame(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameData;)I
    .locals 3

    .line 1
    const-string v0, "pushExternalVideoFrame"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    if-nez p2, :cond_1

    .line 27
    .line 28
    const-string p1, "pushExternalVideoFrame: videoFrame is null, drop frame."

    .line 29
    .line 30
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 48
    .line 49
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativePushExternalVideoFrame(JILcom/ss/bytertc/engine/data/VideoFrameData;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->fromId(I)Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    :goto_1
    const-string p1, "pushExternalVideoFrame: native engine is invalid, pushExternalVideoFrame failed."

    .line 69
    .line 70
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 76
    .line 77
    .line 78
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    goto :goto_0

    .line 80
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 83
    .line 84
    .line 85
    throw p1
.end method

.method public pushExternalVideoFrame(Lcom/ss/bytertc/engine/data/VideoFrameData;)I
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 87
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "RtcVideoImpl"

    if-nez v0, :cond_2

    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    if-ne v0, v2, :cond_0

    goto :goto_1

    :cond_0
    if-nez p1, :cond_1

    .line 88
    const-string p1, "pushExternalVideoFrame: videoFrame is null, drop frame."

    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 91
    :cond_1
    :try_start_2
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 92
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushExternalVideoFrame(JLcom/ss/bytertc/engine/data/VideoFrameData;)I

    move-result p1

    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->fromId(I)Lcom/ss/bytertc/engine/data/ReturnStatus;

    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1

    goto :goto_0

    .line 94
    :cond_2
    :goto_1
    const-string p1, "pushExternalVideoFrame: native engine is invalid, pushExternalVideoFrame failed."

    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 96
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 97
    throw p1
.end method

.method public pushReferenceAudioPCMData(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 22
    .line 23
    iget v5, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 24
    .line 25
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    iget-object p1, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-static/range {v2 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushReferenceAudioPCMData(J[BIII)I

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    return p1

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 51
    .line 52
    const-string v0, "native engine is invalid, pushReferenceAudioPCMData failed."

    .line 53
    .line 54
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    goto :goto_0

    .line 64
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw p1
.end method

.method public pushScreenAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 22
    .line 23
    iget v5, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 24
    .line 25
    iget-object v0, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    iget-object p1, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-static/range {v2 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushScreenAudioFrame(J[BIII)I

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    return p1

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 51
    .line 52
    const-string v0, "native engine is invalid, PushScreenAudioFrame failed."

    .line 53
    .line 54
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    goto :goto_0

    .line 64
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw p1
.end method

.method public pushScreenVideoFrame(Lcom/ss/bytertc/engine/data/VideoFrameData;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 17
    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    if-nez p1, :cond_1

    .line 22
    .line 23
    const-string p1, "pushScreenVideoFrame: videoFrame is null, drop frame."

    .line 24
    .line 25
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :try_start_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 43
    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativePushScreenFrame(JLcom/ss/bytertc/engine/data/VideoFrameData;)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->fromId(I)Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    :goto_1
    const-string p1, "pushScreenVideoFrame: native engine is invalid, pushExternalVideoFrame failed."

    .line 58
    .line 59
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 65
    .line 66
    .line 67
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    goto :goto_0

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw p1
.end method

.method public registerAudioFrameObserver(Lcom/ss/bytertc/engine/IAudioFrameObserver;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, registerAudioFrameObserver failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioFrameObserver(JLcom/ss/bytertc/engine/IAudioFrameObserver;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public registerAudioProcessor(Lcom/ss/bytertc/engine/IAudioFrameProcessor;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, registerAudioProcessor failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioFrameProcessor(JLcom/ss/bytertc/engine/IAudioFrameProcessor;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public registerLocalEncodedVideoFrameObserver(Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, registerAudioFrameObserver failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterLocalEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcLocalEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterLocalEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public registerLocalVideoProcessor(Lcom/ss/bytertc/engine/video/IVideoProcessor;Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, registerLocalVideoProcessor failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    if-nez p2, :cond_1

    .line 34
    .line 35
    :try_start_1
    new-instance p2, Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;

    .line 36
    .line 37
    invoke-direct {p2}, Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;-><init>()V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v0, p2, Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;->requiredPixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 41
    .line 42
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 43
    .line 44
    if-eq v0, v1, :cond_2

    .line 45
    .line 46
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 47
    .line 48
    if-eq v0, v1, :cond_2

    .line 49
    .line 50
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->TEXTURE_2D:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 51
    .line 52
    if-eq v0, v1, :cond_2

    .line 53
    .line 54
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 62
    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->registerLocalVideoProcessor(Lcom/ss/bytertc/engine/video/IVideoProcessor;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p2, p2, Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;->requiredPixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    .line 74
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    :try_start_2
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    const/4 p2, 0x0

    .line 83
    invoke-static {v0, v1, p2, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterLocalVideoProcessor(JLcom/ss/bytertc/engine/handler/RTCVideoProcessor;I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcVideoPreprocessor:Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;

    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterLocalVideoProcessor(JLcom/ss/bytertc/engine/handler/RTCVideoProcessor;I)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    goto :goto_0

    .line 99
    :cond_5
    :goto_1
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_WRONG_STATE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 102
    .line 103
    .line 104
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    goto :goto_0

    .line 106
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 109
    .line 110
    .line 111
    throw p1
.end method

.method public registerRemoteEncodedAudioFrameObserver(Lcom/ss/bytertc/engine/IRemoteEncodedAudioFrameObserver;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, registerRemoteEncodedAudioFrameObserver failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 28
    .line 29
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteEncodedAudioFrameObserver(JLcom/ss/bytertc/engine/IRemoteEncodedAudioFrameObserver;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    throw p1
.end method

.method public registerRemoteEncodedVideoFrameObserver(Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, RegisterRemoteEncodedVideoFrameObserver failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterRemoteEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcRemoteEncodedVideoFrameObserver:Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRegisterRemoteEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public requestRemoteVideoKeyFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, RequestRemoteVideoKeyFrame failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-static {v0, v1, v2, v3, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRequestRemoteVideoKeyFrame(JLjava/lang/String;Ljava/lang/String;I)I

    .line 52
    .line 53
    .line 54
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public sendPublicStreamSEIMessage(Lcom/ss/bytertc/engine/data/StreamIndex;I[BILcom/ss/bytertc/engine/data/SEICountPerFrame;)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, sendPublicStreamSEIMessage failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p5}, Lcom/ss/bytertc/engine/data/SEICountPerFrame;->value()I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    move v3, p2

    .line 45
    move-object v4, p3

    .line 46
    move v5, p4

    .line 47
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendPublicStreamSEIMessage(JII[BII)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public sendSEIMessage(Lcom/ss/bytertc/engine/data/StreamIndex;[BILcom/ss/bytertc/engine/data/SEICountPerFrame;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, registerMetadataObserver failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p4}, Lcom/ss/bytertc/engine/data/SEICountPerFrame;->value()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    move-object v3, p2

    .line 45
    move v4, p3

    .line 46
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendMultiSEIMessagePerVideoFrame(JI[BII)I

    .line 47
    .line 48
    .line 49
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 54
    .line 55
    .line 56
    throw p1
.end method

.method public sendServerBinaryMessage([B)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    int-to-long v0, p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide v0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendServerBinaryMessage(J[B)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    goto :goto_0

    .line 41
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public sendServerMessage(Ljava/lang/String;)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    int-to-long v0, p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide v0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendServerMessage(JLjava/lang/String;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    goto :goto_0

    .line 41
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public sendStreamSyncInfo([BLcom/ss/bytertc/engine/data/StreamSyncInfoConfig;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    iget-object v0, p2, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    iget v6, p2, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->repeatCount:I

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    move-object v4, p1

    .line 31
    invoke-static/range {v2 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendStreamSyncInfo(J[BIII)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p1, v0

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 45
    .line 46
    const-string p2, "native engine is invalid, SendStreamSyncInfo failed."

    .line 47
    .line 48
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 54
    .line 55
    .line 56
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    goto :goto_0

    .line 58
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 61
    .line 62
    .line 63
    throw p1
.end method

.method public sendUserBinaryMessageOutsideRoom(Ljava/lang/String;[BLcom/ss/bytertc/engine/type/MessageConfig;)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    int-to-long p1, p1

    .line 26
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide p1

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_2

    .line 34
    :cond_0
    if-nez p1, :cond_1

    .line 35
    .line 36
    :try_start_2
    const-string p1, "sendUserBinaryMessageOutsideRoom: uid is null send failed"

    .line 37
    .line 38
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 49
    .line 50
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/MessageConfig;->value()I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendUserBinaryMessageOutsideRoom(JLjava/lang/String;[BI)J

    .line 55
    .line 56
    .line 57
    move-result-wide p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    goto :goto_1

    .line 59
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method public sendUserMessageOutsideRoom(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/MessageConfig;)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    int-to-long p1, p1

    .line 26
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide p1

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_2

    .line 34
    :cond_0
    if-nez p1, :cond_1

    .line 35
    .line 36
    :try_start_2
    const-string p1, "sendUserMessageOutsideRoom: uid is null send failed"

    .line 37
    .line 38
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 49
    .line 50
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/MessageConfig;->value()I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSendUserMessageOutsideRoom(JLjava/lang/String;Ljava/lang/String;I)J

    .line 55
    .line 56
    .line 57
    move-result-wide p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    goto :goto_1

    .line 59
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method public setAnsMode(Lcom/ss/bytertc/engine/type/AnsMode;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAnsMode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setAnsMode failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    if-nez p1, :cond_1

    .line 51
    .line 52
    :try_start_1
    const-string p1, "ansMode is invalid, setAnsMode failed."

    .line 53
    .line 54
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/AnsMode;->value()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAnsMode(JI)I

    .line 71
    .line 72
    .line 73
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 78
    .line 79
    .line 80
    throw p1
.end method

.method public setAudioAlignmentProperty(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/AudioAlignmentMode;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, setAudioAlignmentProperty failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    if-nez p1, :cond_1

    .line 35
    .line 36
    :try_start_2
    const-string p1, "setAudioAlignmentProperty: streamKey is null"

    .line 37
    .line 38
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/AudioAlignmentMode;->value()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioAlignmentProperty(JLjava/lang/String;Ljava/lang/String;II)I

    .line 71
    .line 72
    .line 73
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 78
    .line 79
    .line 80
    throw p1
.end method

.method public setAudioContentType(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;)I
    .locals 6

    .line 1
    const-string v0, "SetAudioContentType"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetAudioContentType failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p1, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-boolean v3, p2, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMic:Z

    .line 46
    .line 47
    iget-boolean v4, p2, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasScreenAudio:Z

    .line 48
    .line 49
    iget-boolean v5, p2, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMediaPlayer:Z

    .line 50
    .line 51
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetAudioContentType(JIZZZ)I

    .line 52
    .line 53
    .line 54
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public setAudioEncodeConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioEncodeConfig;)I
    .locals 11

    .line 1
    const-string v0, "SetAudioEncodeConfig"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetAudioEncodeConfig failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p1, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget v3, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->codecType:I

    .line 46
    .line 47
    iget v4, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encMode:I

    .line 48
    .line 49
    iget v5, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->channelNum:I

    .line 50
    .line 51
    iget v6, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encBitrate:I

    .line 52
    .line 53
    iget v7, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useDtx:I

    .line 54
    .line 55
    iget v8, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useInbandfec:I

    .line 56
    .line 57
    iget v9, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->sampleRate:I

    .line 58
    .line 59
    iget v10, p2, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->packetSize:I

    .line 60
    .line 61
    invoke-static/range {v0 .. v10}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetAudioEncodeConfig(JIIIIIIIII)I

    .line 62
    .line 63
    .line 64
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    goto :goto_0

    .line 66
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public setAudioProfile(Lcom/ss/bytertc/engine/type/AudioProfileType;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioProfile:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setAudioProfile failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    if-nez p1, :cond_1

    .line 51
    .line 52
    :try_start_1
    const-string p1, "audioProfile is invalid, setAudioProfile failed."

    .line 53
    .line 54
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/AudioProfileType;->value()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioProfile(JI)I

    .line 71
    .line 72
    .line 73
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 78
    .line 79
    .line 80
    throw p1
.end method

.method public setAudioRenderType(Lcom/ss/bytertc/engine/data/AudioRenderType;)I
    .locals 2

    .line 1
    const-string v0, "SetAudioRenderType"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetAudioRenderType failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioRenderType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioRenderType(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setAudioRoute(Lcom/ss/bytertc/engine/data/AudioRoute;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioRoute: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioRoute;->value()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcVideoImpl"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p1, "native engine is invalid, setAudioRoute failed."

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioRoute;->value()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioRoute(JI)I

    .line 61
    .line 62
    .line 63
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 68
    .line 69
    .line 70
    throw p1
.end method

.method public setAudioScenario(Lcom/ss/bytertc/engine/type/AudioScenarioType;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioScenario...audioScenario: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setAudioScenario failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/AudioScenarioType;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioScenario(JI)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setAudioSourceType(Lcom/ss/bytertc/engine/data/AudioSourceType;)I
    .locals 2

    .line 1
    const-string v0, "SetAudioSourceType"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetAudioSourceType failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioSourceType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetAudioSourceType(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setAudioSourceVolume(Lcom/ss/bytertc/engine/data/StreamIndex;I)I
    .locals 3

    .line 1
    const-string v0, "setSourceVolume"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetAudioSourceVolume(JII)I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setSourceVolume failed."

    .line 45
    .line 46
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    const/4 p0, -0x1

    .line 55
    return p0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public setBeautyIntensity(Lcom/ss/bytertc/engine/data/EffectBeautyMode;F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setBeautyIntensity failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x3e8

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/EffectBeautyMode;->value()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetBeautyIntensity(JIF)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public setBusinessId(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setBusinessId failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetBusinessId(JLjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setCameraAdaptiveMinimumFrameRate(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCameraAdaptiveMinimumFrameRate(JI)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, -0x1

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setCameraExposureCompensation(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCameraExposureCompensation(JF)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, -0x1

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setCameraExposurePosition(FF)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCameraExposurePosition(JFF)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, -0x1

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setCameraFocusPosition(FF)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCameraFocusPosition(JFF)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, -0x1

    .line 39
    return p0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setCameraTorch(Lcom/ss/bytertc/engine/type/TorchState;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    sget-object v0, Lcom/ss/bytertc/engine/type/TorchState;->TORCH_STATE_ON:Lcom/ss/bytertc/engine/type/TorchState;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p1, 0x0

    .line 26
    :goto_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableCameraTorch(JZ)I

    .line 29
    .line 30
    .line 31
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 41
    .line 42
    const-string v0, "native engine is invalid, PushScreenAudioFrame failed."

    .line 43
    .line 44
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    const/4 p0, -0x1

    .line 53
    return p0

    .line 54
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

.method public setCameraZoomRatio(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCameraZoomRatio(JF)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v0, "native engine is invalid, PushScreenAudioFrame failed."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    const/4 p0, -0x1

    .line 46
    return p0

    .line 47
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public setCaptureVolume(I)I
    .locals 3

    .line 1
    const-string v0, "setCaptureVolume"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetCaptureVolume(JI)I

    .line 29
    .line 30
    .line 31
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setCaptureVolume failed."

    .line 41
    .line 42
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    const/4 p0, -0x1

    .line 51
    return p0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public setCaptureVolume(Lcom/ss/bytertc/engine/data/StreamIndex;I)I
    .locals 2

    .line 58
    const-string v0, "setCaptureVolume"

    const-string v1, "RtcVideoImpl"

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 60
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    const-string p1, "native engine is invalid, setCaptureVolume failed."

    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 64
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    move-result p1

    invoke-static {v0, v1, p2, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCaptureVolume(JII)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 65
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 66
    throw p1
.end method

.method public setCellularEnhancement(Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;)I
    .locals 3

    .line 1
    const-string v0, "setCellularEnhancement"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    new-instance v2, Lcom/ss/bytertc/engine/InternalMediaTypeEnhancementConfig;

    .line 29
    .line 30
    invoke-direct {v2, p1}, Lcom/ss/bytertc/engine/InternalMediaTypeEnhancementConfig;-><init>(Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCellularEnhancement(JLcom/ss/bytertc/engine/InternalMediaTypeEnhancementConfig;)I

    .line 34
    .line 35
    .line 36
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 40
    .line 41
    .line 42
    return p1

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setCellularEnhancement failed."

    .line 46
    .line 47
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 53
    .line 54
    .line 55
    const/4 p0, -0x1

    .line 56
    return p0

    .line 57
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public setClientMixedStreamObserver(Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;)I
    .locals 3

    .line 1
    const-string v0, "setClientMixedStreamObserver..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, setClientMixedStreamObserver failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 27
    .line 28
    .line 29
    const/4 p0, -0x1

    .line 30
    return p0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    :try_start_1
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mMixedStreamToCDNObserver:Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->setUserObserver(Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;)V

    .line 39
    .line 40
    .line 41
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mMixedStreamToCDNObserver:Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;

    .line 44
    .line 45
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetClientMixedStreamObserver(JLcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;)I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    return p1

    .line 55
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public setCustomizeEncryptHandler(Lcom/ss/bytertc/engine/handler/RTCEncryptHandler;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setCustomizeEncryptHandler failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetCustomizeEncryptHandler(JLcom/ss/bytertc/engine/handler/RTCEncryptHandler;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setDefaultAudioRoute(Lcom/ss/bytertc/engine/data/AudioRoute;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setDefaultAudioRoute: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioRoute;->value()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcVideoImpl"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p1, "native engine is invalid, setDefaultAudioRoute failed."

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioRoute;->value()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetDefaultAudioRoute(JI)I

    .line 61
    .line 62
    .line 63
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 68
    .line 69
    .line 70
    throw p1
.end method

.method public setDummyCaptureImagePath(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetDummyCaptureImagePath(JLjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    :try_start_1
    const-string p1, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v0, "native engine is invalid, setDummyCaptureImagePath failed."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    goto :goto_0

    .line 47
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public setEarMonitorMode(Lcom/ss/bytertc/engine/data/EarMonitorMode;)I
    .locals 2

    .line 1
    const-string v0, "setEarMonitorMode"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, setEarMonitorMode failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/EarMonitorMode;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetEarMonitorMode(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setEarMonitorMode(Lcom/ss/bytertc/engine/data/EarMonitorMode;I)I
    .locals 2

    .line 55
    const-string v0, "setEarMonitorMode"

    const-string v1, "RtcVideoImpl"

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 57
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    const-string p1, "native engine is invalid, setEarMonitorMode failed."

    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 61
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/EarMonitorMode;->value()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetEarMonitorMode2(JII)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 62
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 63
    throw p1
.end method

.method public setEarMonitorVolume(I)I
    .locals 2

    .line 1
    const-string v0, "setEarMonitorVolume"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, setEarMonitorVolume failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetEarMonitorVolume(JI)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public setEncryptInfo(ILjava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setEncryptInfo failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetEncryptInfo(JILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setExternalVideoEncoderEventHandler(Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setExternalVideoEncoderEventHandler failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mExternalVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetExternalVideoEncoderEventHandler(JLcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcExVideoEncoderHandler:Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetExternalVideoEncoderEventHandler(JLcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public setLocalProxy(Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;",
            ">;)I"
        }
    .end annotation

    .line 1
    const-string v0, "setLocalProxy"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 14
    .line 15
    const-wide/16 v4, -0x1

    .line 16
    .line 17
    cmp-long v0, v2, v4

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 24
    .line 25
    if-ne v0, v2, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;

    .line 48
    .line 49
    new-instance v2, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;

    .line 50
    .line 51
    invoke-direct {v2, v1}, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;-><init>(Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 61
    .line 62
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalProxy(JLjava/util/List;)I

    .line 63
    .line 64
    .line 65
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    return p1

    .line 72
    :cond_2
    :goto_1
    :try_start_1
    const-string p1, "native engine is invalid, setLocalProxy failed."

    .line 73
    .line 74
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 80
    .line 81
    .line 82
    const/4 p0, -0x1

    .line 83
    return p0

    .line 84
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 87
    .line 88
    .line 89
    throw p1
.end method

.method public setLocalSimulcastMode(Lcom/ss/bytertc/engine/data/VideoSimulcastMode;)I
    .locals 2

    .line 102
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 103
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    const-string p1, "RtcVideoImpl"

    const-string v0, "native engine is invalid, setLocalSimulcastMode failed."

    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 107
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 108
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoSimulcastMode;->value()I

    move-result p1

    .line 109
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalSimulcastMode(JI)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 110
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 111
    throw p1
.end method

.method public setLocalSimulcastMode(Lcom/ss/bytertc/engine/data/VideoSimulcastMode;[Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, setVideoEncoderConfig failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_3

    .line 33
    :cond_0
    if-eqz p2, :cond_4

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_1
    :try_start_2
    new-instance v0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    array-length v2, p2

    .line 44
    const/4 v3, 0x0

    .line 45
    :goto_1
    if-ge v3, v2, :cond_3

    .line 46
    .line 47
    aget-object v4, p2, v3

    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/ss/bytertc/engine/VideoEncoderConfig;->isValid()Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-nez v5, :cond_2

    .line 54
    .line 55
    const-string p1, "setVideoEncoderConfig with illegal params"

    .line 56
    .line 57
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    new-instance v5, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    .line 68
    .line 69
    invoke-direct {v5, v4}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoSimulcastMode;->value()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-static {v1, v2, p1, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalSimulcastModeV1(JILjava/util/List;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    goto :goto_0

    .line 89
    :cond_4
    :goto_2
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 92
    .line 93
    .line 94
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    goto :goto_0

    .line 96
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 99
    .line 100
    .line 101
    throw p1
.end method

.method public setLocalStreamPriority(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/StreamPriority;)I
    .locals 3

    .line 1
    const-string v0, "setLocalStreamPriority"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/StreamPriority;->value()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetLocalStreamPriority(JII)I

    .line 37
    .line 38
    .line 39
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    return p1

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setLocalStreamPriority failed."

    .line 49
    .line 50
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 56
    .line 57
    .line 58
    const/4 p0, -0x1

    .line 59
    return p0

    .line 60
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 63
    .line 64
    .line 65
    throw p1
.end method

.method public setLocalVideoCanvas(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/VideoCanvas;)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setLocalVideoCanvas failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_2

    .line 34
    :cond_0
    if-eqz p2, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :try_start_1
    new-instance p2, Lcom/ss/bytertc/engine/VideoCanvas;

    .line 38
    .line 39
    invoke-direct {p2}, Lcom/ss/bytertc/engine/VideoCanvas;-><init>()V

    .line 40
    .line 41
    .line 42
    :goto_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object v3, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 49
    .line 50
    iget-object v4, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 51
    .line 52
    iget v5, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 53
    .line 54
    iget v6, p2, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 55
    .line 56
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVideoCanvas(JILandroid/view/View;Landroid/view/Surface;II)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setLocalVideoMirrorType(Lcom/ss/bytertc/engine/data/MirrorType;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setLocalVideoMirrorType failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/MirrorType;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVideoMirrorType(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setLocalVideoSink(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/IVideoSink;I)I
    .locals 3

    .line 137
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 138
    const-string v0, "RtcVideoImpl"

    if-nez p1, :cond_0

    .line 139
    :try_start_0
    const-string p1, "EventType: setLocalVideoSink, streamIndex is null"

    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 142
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 143
    const-string p1, "native engine is invalid, setLocalVideoSink failed."

    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 145
    new-instance v0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;

    invoke-direct {v0, p2}, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;-><init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 146
    :goto_1
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    move-result p1

    invoke-static {v1, v2, p1, v0, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVideoSink(JILcom/ss/bytertc/engine/video/IVideoSink;I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 147
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 148
    throw p1
.end method

.method public setLocalVideoSink(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    const-string v0, "RtcVideoImpl"

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    :try_start_0
    const-string p1, "EventType: setLocalVideoSink, streamIndex is null"

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 18
    .line 19
    .line 20
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return p1

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto :goto_3

    .line 30
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const-string p1, "native engine is invalid, setLocalVideoSink failed."

    .line 37
    .line 38
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eq v0, v1, :cond_2

    .line 61
    .line 62
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eq v0, v1, :cond_2

    .line 75
    .line 76
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eq v0, v1, :cond_2

    .line 89
    .line 90
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    if-eqz p2, :cond_3

    .line 98
    .line 99
    new-instance v0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;

    .line 100
    .line 101
    invoke-direct {v0, p2}, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;-><init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V

    .line 102
    .line 103
    .line 104
    :goto_1
    move-object v4, v0

    .line 105
    goto :goto_2

    .line 106
    :cond_3
    const/4 v0, 0x0

    .line 107
    goto :goto_1

    .line 108
    :goto_2
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->position:Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;->getValue()I

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    invoke-static/range {v1 .. v6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativesetLocalVideoSink(JILcom/ss/bytertc/engine/video/IVideoSink;II)I

    .line 127
    .line 128
    .line 129
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    goto :goto_0

    .line 131
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 134
    .line 135
    .line 136
    throw p1
.end method

.method public setLocalVoiceEqualization(Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;)I
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLocalVoiceEqualization...frequency : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->frequency:Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", gain: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->gain:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "RtcVideoImpl"

    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 35
    .line 36
    .line 37
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-string p1, "native engine is invalid, setLocalVoiceEqualization failed."

    .line 44
    .line 45
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 51
    .line 52
    .line 53
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 57
    .line 58
    .line 59
    return p1

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 63
    .line 64
    iget-object v2, p1, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->frequency:Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;->value()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget p1, p1, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->gain:I

    .line 71
    .line 72
    invoke-static {v0, v1, v2, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVoiceEqualization(JII)I

    .line 73
    .line 74
    .line 75
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    goto :goto_0

    .line 77
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 80
    .line 81
    .line 82
    throw p1
.end method

.method public setLocalVoicePitch(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setLocalVoicePitch failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVoicePitch(JI)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setLocalVoiceReverbParam(Lcom/ss/bytertc/engine/type/VoiceReverbConfig;)I
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLocalVoiceReverbParam...roomSize: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->roomSize:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", decayTime: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->decayTime:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", damping:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->damping:F

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", wetGain:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->wetGain:F

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", dryGain:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->dryGain:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", preDelay:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->preDelay:F

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "RtcVideoImpl"

    .line 68
    .line 69
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 75
    .line 76
    .line 77
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    const-string p1, "native engine is invalid, setLocalVoiceReverbParam failed."

    .line 84
    .line 85
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 91
    .line 92
    .line 93
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 97
    .line 98
    .line 99
    return p1

    .line 100
    :catchall_0
    move-exception v0

    .line 101
    move-object p1, v0

    .line 102
    goto :goto_1

    .line 103
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 104
    .line 105
    iget v2, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->roomSize:F

    .line 106
    .line 107
    iget v3, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->decayTime:F

    .line 108
    .line 109
    iget v4, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->damping:F

    .line 110
    .line 111
    iget v5, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->wetGain:F

    .line 112
    .line 113
    iget v6, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->dryGain:F

    .line 114
    .line 115
    iget v7, p1, Lcom/ss/bytertc/engine/type/VoiceReverbConfig;->preDelay:F

    .line 116
    .line 117
    invoke-static/range {v0 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetLocalVoiceReverbParam(JFFFFFF)I

    .line 118
    .line 119
    .line 120
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    goto :goto_0

    .line 122
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 125
    .line 126
    .line 127
    throw p1
.end method

.method public setPlaybackVolume(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setPlaybackVolume failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetPlaybackVolume(JI)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setPublishFallbackOption(Lcom/ss/bytertc/engine/type/PublishFallbackOption;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setPublishFallbackOption: option: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setPublishFallbackOption failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/PublishFallbackOption;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetPublishFallbackOption(JI)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setRemoteAudioPlaybackVolume(Lcom/ss/bytertc/engine/data/RemoteStreamKey;I)I
    .locals 6

    .line 1
    const-string v0, "setRemoteAudioPlaybackVolume"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string p1, "setRemoteAudioPlaybackVolume: roomId is null adjust failed"

    .line 33
    .line 34
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 46
    .line 47
    .line 48
    return p1

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p1, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    const-string p1, "setRemoteAudioPlaybackVolume: uid is null adjust failed"

    .line 59
    .line 60
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    move v5, p2

    .line 89
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteAudioPlaybackVolume(JLjava/lang/String;Ljava/lang/String;II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    goto :goto_0

    .line 94
    :cond_3
    :goto_1
    const-string p1, "native engine is invalid, setRemoteAudioPlaybackVolume failed."

    .line 95
    .line 96
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 102
    .line 103
    .line 104
    const/4 p0, -0x1

    .line 105
    return p0

    .line 106
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 109
    .line 110
    .line 111
    throw p1
.end method

.method public setRemoteUserPriority(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RemoteUserPriority;)I
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRemoteUserPriority: uid: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", priority: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RtcVideoImpl"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const-string p1, "native engine is invalid, setRemoteUserPriority failed."

    .line 40
    .line 41
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 47
    .line 48
    .line 49
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 53
    .line 54
    .line 55
    return p1

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    if-nez p2, :cond_1

    .line 59
    .line 60
    :try_start_1
    const-string p1, "setRemoteUserPriority: uid is null set failed"

    .line 61
    .line 62
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 73
    .line 74
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/RemoteUserPriority;->value()I

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteUserPriority(JLjava/lang/String;Ljava/lang/String;I)I

    .line 79
    .line 80
    .line 81
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    goto :goto_0

    .line 83
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 86
    .line 87
    .line 88
    throw p1
.end method

.method public setRemoteVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/VideoCanvas;)I
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    const-string v0, "RtcVideoImpl"

    .line 7
    .line 8
    if-eqz p1, :cond_3

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->hasNullProperty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const-string p1, "native engine is invalid, setRemoteVideoCanvas failed."

    .line 24
    .line 25
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_3

    .line 43
    :cond_1
    if-eqz p2, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :try_start_1
    new-instance p2, Lcom/ss/bytertc/engine/VideoCanvas;

    .line 47
    .line 48
    invoke-direct {p2}, Lcom/ss/bytertc/engine/VideoCanvas;-><init>()V

    .line 49
    .line 50
    .line 51
    :goto_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    iget-object v5, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 70
    .line 71
    iget-object v6, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 72
    .line 73
    iget v7, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 74
    .line 75
    iget v8, p2, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 76
    .line 77
    iget-object p1, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    invoke-static/range {v0 .. v9}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteVideoCanvas(JLjava/lang/String;Ljava/lang/String;ILandroid/view/View;Landroid/view/Surface;III)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    goto :goto_0

    .line 88
    :cond_3
    :goto_2
    const-string p1, "EventType: setupRemoteVideo stream_key has null property"

    .line 89
    .line 90
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 96
    .line 97
    .line 98
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    goto :goto_0

    .line 100
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 103
    .line 104
    .line 105
    throw p1
.end method

.method public setRemoteVideoMirrorType(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/RemoteMirrorType;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setLocalVideoMirrorType failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/RemoteMirrorType;->value()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteVideoMirrorType(JLjava/lang/String;Ljava/lang/String;II)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setRemoteVideoSink(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/IVideoSink;I)I
    .locals 7

    .line 181
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 182
    const-string v0, "RtcVideoImpl"

    if-nez p1, :cond_0

    .line 183
    :try_start_0
    const-string p1, "EventType: setupRemoteRenderInternal, streamKey is null"

    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_3

    .line 186
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    move-result-object v1

    if-nez v1, :cond_1

    .line 187
    const-string p1, "EventType: setupRemoteRenderInternal, streamIndex is null"

    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1

    goto :goto_0

    .line 189
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 190
    const-string p1, "native engine is invalid, setRemoteVideoSink failed."

    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1

    goto :goto_0

    .line 192
    :cond_2
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    move-result-object v2

    if-eqz p2, :cond_3

    .line 193
    new-instance v0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;

    invoke-direct {v0, p2}, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;-><init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V

    :goto_1
    move-object v5, v0

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 194
    :goto_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 195
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    move-result v4

    move v6, p3

    .line 196
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteVideoSink(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/IVideoSink;I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 197
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 198
    throw p1
.end method

.method public setRemoteVideoSink(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;)I
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    const-string v0, "RtcVideoImpl"

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    :try_start_0
    const-string p1, "EventType: setupRemoteRenderInternal, streamKey is null"

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 18
    .line 19
    .line 20
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return p1

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    const-string p1, "EventType: setupRemoteRenderInternal, streamIndex is null"

    .line 38
    .line 39
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    const-string p1, "native engine is invalid, setRemoteVideoSink failed."

    .line 56
    .line 57
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eq v0, v1, :cond_3

    .line 80
    .line 81
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eq v0, v1, :cond_3

    .line 94
    .line 95
    iget-object v0, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eq v0, v1, :cond_3

    .line 108
    .line 109
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    goto :goto_0

    .line 116
    :cond_3
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    if-eqz p2, :cond_4

    .line 121
    .line 122
    new-instance v0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;

    .line 123
    .line 124
    invoke-direct {v0, p2}, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;-><init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V

    .line 125
    .line 126
    .line 127
    :goto_1
    move-object v5, v0

    .line 128
    goto :goto_2

    .line 129
    :cond_4
    const/4 v0, 0x0

    .line 130
    goto :goto_1

    .line 131
    :goto_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->position:Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;->getValue()I

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->applyRotation:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->getValue()I

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    iget-object p1, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->mirrorType:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->getValue()I

    .line 166
    .line 167
    .line 168
    move-result v9

    .line 169
    invoke-static/range {v0 .. v9}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativesetRemoteVideoSink(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/IVideoSink;IIII)I

    .line 170
    .line 171
    .line 172
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 178
    .line 179
    .line 180
    throw p1
.end method

.method public setRemoteVideoSuperResolution(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoSuperResolutionMode;)I
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRemoteVideoSuperResolution: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionMode;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RtcVideoImpl"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 39
    .line 40
    .line 41
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    const-string p1, "native engine is invalid, setRemoteVideoSuperResolution failed."

    .line 48
    .line 49
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 55
    .line 56
    .line 57
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 61
    .line 62
    .line 63
    return p1

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    move-object p1, v0

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionMode;->value()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteVideoSuperResolution(JLjava/lang/String;Ljava/lang/String;II)I

    .line 90
    .line 91
    .line 92
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    goto :goto_0

    .line 94
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 97
    .line 98
    .line 99
    throw p1
.end method

.method public setRtcVideoEventHandler(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)I
    .locals 2

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    const-string v1, "setRtcEngineEventHandler"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandler:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setRtcVideoEventHandlerEx(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)I
    .locals 2

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    const-string v1, "setRtcEngineEventHandlerEx"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mRtcEngineHandlerEx:Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setRuntimeParameters(Lorg/json/JSONObject;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, SetRuntimeParameters failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    const-string p1, ""

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRuntimeParameters(JLjava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setScreenAudioSourceType(Lcom/ss/bytertc/engine/data/AudioSourceType;)I
    .locals 2

    .line 1
    const-string v0, "SetScreenAudioSourceType"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetScreenAudioSourceType failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioSourceType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetScreenAudioSourceType(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setScreenAudioStreamIndex(Lcom/ss/bytertc/engine/data/StreamIndex;)I
    .locals 2

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    const-string v1, "SetScreenAudioStreamIndex"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, SetScreenAudioStreamIndex failed."

    .line 20
    .line 21
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetScreenAudioStreamIndex(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public setScreenCaptureVolume(I)I
    .locals 3

    .line 1
    const-string v0, "setScreenCaptureVolume"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetScreenCaptureVolume(JI)I

    .line 29
    .line 30
    .line 31
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setScreenCaptureVolume failed."

    .line 41
    .line 42
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    const/4 p0, -0x1

    .line 51
    return p0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public setScreenVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setScreenVideoEncoderConfig failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-object v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 34
    .line 35
    sget-object v1, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->AUTO:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 36
    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    sget-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->DISABLED:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 40
    .line 41
    iput-object v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 42
    .line 43
    :cond_1
    new-instance v0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    .line 44
    .line 45
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 46
    .line 47
    .line 48
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 49
    .line 50
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetScreenVideoEncoderConfig(JLcom/ss/bytertc/engine/InternalVideoEncoderConfig;)I

    .line 51
    .line 52
    .line 53
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    goto :goto_0

    .line 55
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public setServerParams(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetServerParams(JLjava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public setSubscribeFallbackOption(Lcom/ss/bytertc/engine/type/SubscribeFallbackOptions;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRemoteSubscribeFallbackOption: option: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setRemoteSubscribeFallbackOption failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/SubscribeFallbackOptions;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetRemoteSubscribeFallbackOption(JI)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setVideoCaptureConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/VideoCaptureConfig;)I
    .locals 4

    .line 96
    const-string v0, "setVideoCaptureConfig"

    const-string v1, "RtcVideoImpl"

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 98
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 99
    :cond_0
    new-instance v0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;

    iget-object v1, p2, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/video/VideoCaptureConfig$CapturePreference;

    invoke-virtual {v1}, Lcom/ss/bytertc/engine/video/VideoCaptureConfig$CapturePreference;->getValue()I

    move-result v1

    iget v2, p2, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->width:I

    iget v3, p2, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->height:I

    iget p2, p2, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->frameRate:I

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;-><init>(IIII)V

    .line 100
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    move-result p1

    invoke-static {v1, v2, p1, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetVideoCaptureConfig(JILcom/ss/bytertc/engine/InternalVideoCaptureConfig;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 102
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setVideoCaptureConfig failed."

    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    const/4 p0, -0x1

    return p0

    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 104
    throw p1
.end method

.method public setVideoCaptureConfig(Lcom/ss/bytertc/engine/video/VideoCaptureConfig;)I
    .locals 4

    .line 1
    const-string v0, "setVideoCaptureConfig: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    const-string v1, "native engine is invalid or videoCaptureConfig is null, setVideoCaptureConfig failed."

    .line 9
    .line 10
    const-string v2, "RtcVideoImpl"

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    :try_start_0
    invoke-static {v2, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 26
    .line 27
    .line 28
    return p1

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {v2, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/video/VideoCaptureConfig$CapturePreference;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/video/VideoCaptureConfig$CapturePreference;->getValue()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget v2, p1, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->width:I

    .line 75
    .line 76
    iget v3, p1, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->height:I

    .line 77
    .line 78
    iget p1, p1, Lcom/ss/bytertc/engine/video/VideoCaptureConfig;->frameRate:I

    .line 79
    .line 80
    invoke-direct {v0, v1, v2, v3, p1}, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;-><init>(IIII)V

    .line 81
    .line 82
    .line 83
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 84
    .line 85
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoCaptureConfig(JLcom/ss/bytertc/engine/InternalVideoCaptureConfig;)I

    .line 86
    .line 87
    .line 88
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    goto :goto_0

    .line 90
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 93
    .line 94
    .line 95
    throw p1
.end method

.method public setVideoCaptureRotation(Lcom/ss/bytertc/engine/data/VideoRotation;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setVideoCaptureRotation failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoCaptureRotation(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setVideoDecoderConfig(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/VideoDecoderConfig;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, SetVideoDecoderConfig failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoDecoderConfig;->value()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoDecoderConfig(JLjava/lang/String;Ljava/lang/String;II)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setVideoDenoiser(Lcom/ss/bytertc/engine/data/VideoDenoiseMode;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setVideoDenoiser: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoDenoiseMode;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcVideoImpl"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p1, "native engine is invalid, setVideoDenoiser failed."

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoDenoiseMode;->value()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoDenoiser(JI)I

    .line 61
    .line 62
    .line 63
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 68
    .line 69
    .line 70
    throw p1
.end method

.method public setVideoDigitalZoomConfig(Lcom/ss/bytertc/engine/data/ZoomConfigType;F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setVideoDigitalZoomConfig failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ZoomConfigType;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoDigitalZoomConfig(JIF)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setVideoDigitalZoomControl(Lcom/ss/bytertc/engine/data/ZoomDirectionType;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setVideoDigitalZoomControl failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ZoomDirectionType;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoDigitalZoomControl(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
    .locals 1

    const/4 v0, 0x0

    .line 121
    invoke-virtual {p0, p1, v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->setVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;Lorg/json/JSONObject;)I

    move-result p0

    return p0
.end method

.method public setVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;Lorg/json/JSONObject;)I
    .locals 3

    .line 110
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 111
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    const-string p1, "RtcVideoImpl"

    const-string p2, "native engine is invalid, setVideoResolutions failed."

    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 115
    :cond_0
    :try_start_1
    const-string v0, ""

    if-eqz p2, :cond_1

    .line 116
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 117
    :cond_1
    new-instance p2, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    invoke-direct {p2, p1}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 118
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-static {v1, v2, p2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEncoderConfigV1(JLcom/ss/bytertc/engine/InternalVideoEncoderConfig;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 119
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 120
    throw p1
.end method

.method public setVideoEncoderConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/bytertc/engine/data/StreamIndex;",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoEncoderConfig;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    :try_start_0
    new-instance p2, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_3

    .line 16
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 17
    .line 18
    .line 19
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    const-string v1, "RtcVideoImpl"

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :try_start_1
    const-string p1, "native engine is invalid, setVideoResolutions failed."

    .line 25
    .line 26
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :cond_1
    :try_start_2
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/ss/bytertc/engine/VideoEncoderConfig;

    .line 61
    .line 62
    sget-object v3, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 63
    .line 64
    if-ne p1, v3, :cond_2

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig;->isValid()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-nez v3, :cond_2

    .line 71
    .line 72
    const-string p1, "setVideoResolutions with illegal params"

    .line 73
    .line 74
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    new-instance v3, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    .line 85
    .line 86
    invoke-direct {v3, v2}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-static {v1, v2, p1, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetVideoEncoderConfig(JILjava/util/List;)I

    .line 100
    .line 101
    .line 102
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 103
    goto :goto_1

    .line 104
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 107
    .line 108
    .line 109
    throw p1
.end method

.method public setVideoOrientation(Lcom/ss/bytertc/engine/data/VideoOrientation;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setVideoOrientation failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoOrientation;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoOrientation(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setVideoRotationMode(Lcom/ss/bytertc/engine/data/VideoRotationMode;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, setVideoRotationMode failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoRotationMode;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoRotationMode(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setVideoSource(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/InternalVideoSourceConfig;)I
    .locals 3

    .line 1
    const-string v0, "setVideoSource"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->getVideoSourceType()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->getVideoSourceCategory()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-static {v0, v1, p1, v2, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeSetVideoSource(JIII)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return p1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, setVideoSource failed."

    .line 53
    .line 54
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    const/4 p0, -0x1

    .line 63
    return p0

    .line 64
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw p1
.end method

.method public setVideoSourceType(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoSourceType;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, setVideoInputType failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoSourceType;->value()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoSourceTypeWithStreamId(JII)I

    .line 44
    .line 45
    .line 46
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    goto :goto_0

    .line 48
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 51
    .line 52
    .line 53
    throw p1
.end method

.method public setVideoWatermark(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/lang/String;Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;)I
    .locals 14

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_3

    .line 13
    .line 14
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    goto :goto_3

    .line 21
    :cond_0
    iget-object v1, v0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->positionInLandscapeMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget v3, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->x:F

    .line 27
    .line 28
    iget v4, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->y:F

    .line 29
    .line 30
    iget v5, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->width:F

    .line 31
    .line 32
    iget v1, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->height:F

    .line 33
    .line 34
    move v9, v1

    .line 35
    move v6, v3

    .line 36
    move v7, v4

    .line 37
    move v8, v5

    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto :goto_4

    .line 41
    :cond_1
    move v6, v2

    .line 42
    move v7, v6

    .line 43
    move v8, v7

    .line 44
    move v9, v8

    .line 45
    :goto_0
    iget-object v1, v0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->positionInPortraitMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget v2, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->x:F

    .line 50
    .line 51
    iget v3, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->y:F

    .line 52
    .line 53
    iget v4, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->width:F

    .line 54
    .line 55
    iget v1, v1, Lcom/ss/bytertc/engine/video/ByteWatermark;->height:F

    .line 56
    .line 57
    move v13, v1

    .line 58
    move v10, v2

    .line 59
    move v11, v3

    .line 60
    move v12, v4

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v10, v2

    .line 63
    move v11, v10

    .line 64
    move v12, v11

    .line 65
    move v13, v12

    .line 66
    :goto_1
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iget-boolean v5, v0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->visibleInPreview:Z

    .line 73
    .line 74
    move-object/from16 v4, p2

    .line 75
    .line 76
    invoke-static/range {v1 .. v13}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoWatermark(JILjava/lang/String;ZFFFFFFFF)I

    .line 77
    .line 78
    .line 79
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 83
    .line 84
    .line 85
    return v0

    .line 86
    :cond_3
    :goto_3
    :try_start_1
    const-string v0, "RtcVideoImpl"

    .line 87
    .line 88
    const-string v1, "native engine is invalid, muteAudioPlayback failed."

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 96
    .line 97
    .line 98
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    goto :goto_2

    .line 100
    :goto_4
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 103
    .line 104
    .line 105
    throw v0
.end method

.method public setVoiceChangerType(Lcom/ss/bytertc/engine/type/VoiceChangerType;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setVoiceChangerType...voiceChanger: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setVoiceChangerType failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/VoiceChangerType;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVoiceChangerType(JI)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public setVoiceReverbType(Lcom/ss/bytertc/engine/type/VoiceReverbType;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setVoiceReverbType...voiceReverb: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideoImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string p1, "native engine is invalid, setVoiceReverbType failed."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 39
    .line 40
    .line 41
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/VoiceReverbType;->value()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVoiceReverbType(JI)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public startAudioCapture()I
    .locals 2

    .line 1
    const-string v0, "startAudioCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, startAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartAudioCapture(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public startAudioRecording(Lcom/ss/bytertc/engine/data/AudioRecordingConfig;)I
    .locals 7

    .line 1
    const-string v0, "startAudioRecording"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, startFileRecording failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p1, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 40
    .line 41
    iget-object v2, p1, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->absoluteFileName:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    iget-object v4, p1, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    iget-object v5, p1, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->frameSource:Lcom/ss/bytertc/engine/data/AudioFrameSource;

    .line 56
    .line 57
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/data/AudioFrameSource;->value()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->quality:Lcom/ss/bytertc/engine/data/AudioQuality;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioQuality;->value()I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartAudioRecording(JLjava/lang/String;IIII)I

    .line 68
    .line 69
    .line 70
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    goto :goto_0

    .line 72
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 75
    .line 76
    .line 77
    throw p1
.end method

.method public startChorusCacheSync(Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;)I
    .locals 2

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mChorusObserver:Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

    .line 11
    .line 12
    invoke-virtual {v1, p2}, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->setUserObserver(Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_2

    .line 18
    :cond_0
    :goto_0
    const-string p2, "startChorusCacheSync..."

    .line 19
    .line 20
    invoke-static {v0, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    const-string p1, "startChorusCacheSync...chorusConfig is null, no effect, please check."

    .line 26
    .line 27
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p1

    .line 42
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_2

    .line 47
    .line 48
    const-string p1, "native engine is invalid, startChorusCacheSync failed."

    .line 49
    .line 50
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 61
    .line 62
    iget-object p2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mChorusObserver:Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;

    .line 63
    .line 64
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartChorusCacheSync(JLcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;)I

    .line 65
    .line 66
    .line 67
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    goto :goto_1

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw p1
.end method

.method public startClientMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
    .locals 4

    .line 1
    const-string v0, "startClientMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-eqz p2, :cond_3

    .line 15
    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    const-string p1, "native engine is invalid, startClientMixedStream failed."

    .line 26
    .line 27
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v2

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :cond_1
    const/4 v3, 0x1

    .line 39
    :try_start_1
    iput-boolean v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEnableTranscode:Z

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->getTranscodeMessage()Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 52
    .line 53
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartClientMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I

    .line 54
    .line 55
    .line 56
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    return p1

    .line 63
    :cond_3
    :goto_1
    :try_start_2
    const-string p1, "startClientMixedStream...liveTranscode is null, no effect, please check."

    .line 64
    .line 65
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw p1
.end method

.method public startCloudProxy(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/CloudProxyInfo;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_3

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    if-nez p1, :cond_1

    .line 20
    .line 21
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 24
    .line 25
    .line 26
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 30
    .line 31
    .line 32
    return p1

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_3

    .line 35
    :cond_1
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/ss/bytertc/engine/data/CloudProxyInfo;

    .line 55
    .line 56
    new-instance v2, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;

    .line 57
    .line 58
    invoke-direct {v2, v1}, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;-><init>(Lcom/ss/bytertc/engine/data/CloudProxyInfo;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-wide v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 66
    .line 67
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartCloudProxy(JLjava/util/List;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    goto :goto_0

    .line 72
    :cond_3
    :goto_2
    const-string p1, "RtcVideoImpl"

    .line 73
    .line 74
    const-string v0, "native engine is invalid, startCloudProxy failed."

    .line 75
    .line 76
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 82
    .line 83
    .line 84
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    goto :goto_0

    .line 86
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 89
    .line 90
    .line 91
    throw p1
.end method

.method public startEchoTest(Lcom/ss/bytertc/engine/data/EchoTestConfig;I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, startEchoTest failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_2
    const-string v0, "startEchoTest"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartEchoTest(JLcom/ss/bytertc/engine/data/EchoTestConfig;I)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public startFileRecording(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/RecordingConfig;Lcom/ss/bytertc/engine/type/RecordingType;)I
    .locals 6

    .line 1
    const-string v0, "startFileRecording"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, startFileRecording failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p1, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object v3, p2, Lcom/ss/bytertc/engine/data/RecordingConfig;->dirPath:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p1, p2, Lcom/ss/bytertc/engine/data/RecordingConfig;->recordingFileType:Lcom/ss/bytertc/engine/type/RecordingFileType;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/RecordingFileType;->value()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/RecordingType;->value()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartFileRecording(JILjava/lang/String;II)I

    .line 58
    .line 59
    .line 60
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    goto :goto_0

    .line 62
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 65
    .line 66
    .line 67
    throw p1
.end method

.method public startHardwareEchoDetection(Ljava/lang/String;)I
    .locals 3

    .line 1
    const-string v0, "startHardwareEchoDetection"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartHardwareEchoDetection(JLjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, startHardwareEchoDetection failed."

    .line 41
    .line 42
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    const/4 p0, -0x2

    .line 51
    return p0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public startNetworkDetection(ZIZI)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, sendCustomMessage failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    move v2, p1

    .line 37
    move v3, p2

    .line 38
    move v4, p3

    .line 39
    move v5, p4

    .line 40
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartNetworkProbe(JZIZI)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public startPushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
    .locals 4

    .line 1
    const-string v0, "startPushMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    const-string p1, "startPushMixedStream...liveTranscode is null, no effect, please check."

    .line 17
    .line 18
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return v2

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    const-string p1, "native engine is invalid, startPushMixedStream failed."

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v3, 0x1

    .line 42
    iput-boolean v3, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mEnableTranscode:Z

    .line 43
    .line 44
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->getTranscodeMessage()Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-nez v3, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 55
    .line 56
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartPushMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 63
    .line 64
    .line 65
    return p1

    .line 66
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public startPushSingleStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/PushSingleStreamParam;)I
    .locals 9

    .line 1
    const-string v0, "RtcVideoImpl"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    const-string v1, "startPushSingleStream..."

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, startPushSingleStream failed."

    .line 20
    .line 21
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p1, v0

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    :try_start_1
    new-instance v7, Ljava/util/LinkedList;

    .line 40
    .line 41
    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->destInfos:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lcom/ss/bytertc/engine/data/DestInfo;

    .line 63
    .line 64
    new-instance v2, Lcom/ss/bytertc/engine/InternalDestInfo;

    .line 65
    .line 66
    invoke-direct {v2, v1}, Lcom/ss/bytertc/engine/InternalDestInfo;-><init>(Lcom/ss/bytertc/engine/data/DestInfo;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 74
    .line 75
    iget-object v3, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->roomId:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v4, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->userId:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v5, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->url:Ljava/lang/String;

    .line 80
    .line 81
    iget-boolean v6, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 82
    .line 83
    iget-object p2, p2, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->pushType:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/SingleStreamPushType;->value()I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    move-object v2, p1

    .line 90
    invoke-static/range {v0 .. v8}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartPushSingleStream(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;I)I

    .line 91
    .line 92
    .line 93
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    goto :goto_0

    .line 95
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 98
    .line 99
    .line 100
    throw p1
.end method

.method public startScreenCapture(Lcom/ss/bytertc/engine/data/ScreenMediaType;Landroid/content/Intent;)I
    .locals 2

    .line 1
    const-string v0, "StartScreenAudioCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, StopScreenAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ScreenMediaType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartScreenCapture(JILandroid/content/Intent;)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public startVideoCapture()I
    .locals 2

    .line 62
    const-string v0, "startVideoCapture"

    const-string v1, "RtcVideoImpl"

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const-string v0, "native engine is invalid, startVideoCapture failed."

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 68
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartVideoCapture(J)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 69
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 70
    throw v0
.end method

.method public startVideoCapture(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/lang/String;)I
    .locals 3

    .line 1
    const-string v0, "startVideoCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeStartVideoCapture(JILjava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, startVideoCapture failed."

    .line 45
    .line 46
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    const/4 p0, -0x1

    .line 55
    return p0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public startVideoDigitalZoomControl(Lcom/ss/bytertc/engine/data/ZoomDirectionType;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, startVideoDigitalZoomControl failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ZoomDirectionType;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStartVideoDigitalZoomControl(JI)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public stopAudioCapture()I
    .locals 2

    .line 1
    const-string v0, "stopAudioCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, stopAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopAudioCapture(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public stopAudioRecording()I
    .locals 2

    .line 1
    const-string v0, "startAudioRecording"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, startFileRecording failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopAudioRecording(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public stopChorusCacheSync()I
    .locals 2

    .line 1
    const-string v0, "stopChorusCacheSync..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, stopChorusCacheSync failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopChorusCacheSync(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public stopClientMixedStream(Ljava/lang/String;)I
    .locals 2

    .line 1
    const-string v0, "stopClientMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, stopClientMixedStream failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopClientMixedStream(JLjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public stopCloudProxy()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 13
    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopCloudProxy(J)I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    :try_start_1
    const-string v0, "RtcVideoImpl"

    .line 34
    .line 35
    const-string v1, "native engine is invalid, stopCloudProxy failed."

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 43
    .line 44
    .line 45
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    goto :goto_0

    .line 47
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public stopEchoTest()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string v0, "native engine is invalid, stopEchoTest failed."

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_2
    const-string v0, "stopEchoTest"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopEchoTest(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public stopFileRecording(Lcom/ss/bytertc/engine/data/StreamIndex;)I
    .locals 2

    .line 1
    const-string v0, "stopFileRecording"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, stopFileRecording failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopFileRecording(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public stopHardwareEchoDetection()I
    .locals 3

    .line 1
    const-string v0, "stopHardwareEchoDetection"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopHardwareEchoDetection(J)I

    .line 29
    .line 30
    .line 31
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 35
    .line 36
    .line 37
    return v0

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "native engine is invalid, stopHardwareEchoDetection failed."

    .line 41
    .line 42
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    const/4 p0, -0x2

    .line 51
    return p0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw v0
.end method

.method public stopNetworkDetection()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v1, "native engine is invalid, sendCustomMessage failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopNetworkProbe(J)I

    .line 36
    .line 37
    .line 38
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public stopPushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)I
    .locals 2

    .line 1
    const-string v0, "stopPushMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, stopPushMixedStream failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopPushMixedStream(JLjava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public stopPushSingleStream(Ljava/lang/String;)I
    .locals 2

    .line 1
    const-string v0, "stopPushSingleStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, stopPushSingleStream failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopPushSingleStream(JLjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public stopScreenCapture()I
    .locals 2

    .line 1
    const-string v0, "StopScreenCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "native engine is invalid, StopScreenAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopScreenCapture(J)I

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public stopVideoCapture()I
    .locals 2

    .line 62
    const-string v0, "stopVideoCapture"

    const-string v1, "RtcVideoImpl"

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const-string v0, "native engine is invalid, stopVideoCapture failed."

    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 68
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopVideoCapture(J)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 69
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 70
    throw v0
.end method

.method public stopVideoCapture(Lcom/ss/bytertc/engine/data/StreamIndex;)I
    .locals 3

    .line 1
    const-string v0, "stopVideoCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mState:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 20
    .line 21
    sget-object v2, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;->DESTORY:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl$State;

    .line 22
    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;->nativeStopVideoCapture(JI)I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    :try_start_1
    const-string p1, "native engine is invalid, stopVideoCapture failed."

    .line 45
    .line 46
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    const/4 p0, -0x1

    .line 55
    return p0

    .line 56
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw p1
.end method

.method public stopVideoDigitalZoomControl()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v1, "native engine is invalid, stopVideoDigitalZoomControl failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeStopVideoDigitalZoomControl(J)I

    .line 36
    .line 37
    .line 38
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public switchCamera(Lcom/ss/bytertc/engine/data/CameraId;)I
    .locals 2

    .line 1
    const-string v0, "switchCamera"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, switchCamera failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/CameraId;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSwitchCamera(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsFront:Z

    .line 49
    .line 50
    xor-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mIsFront:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public takeLocalSnapshot(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, takeLocalSnapshot failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    int-to-long p1, p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide p1

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeTakeLocalSnapshot(JILcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J

    .line 41
    .line 42
    .line 43
    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public takeRemoteSnapshot(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, takeRemoteSnapshot failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    int-to-long p1, p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide p1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p1, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    const-wide/16 v2, -0x1

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    :try_start_2
    const-string p1, "EventType: setupRemoteRenderInternal, streamKey is null"

    .line 40
    .line 41
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    .line 43
    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return-wide v2

    .line 50
    :cond_1
    :try_start_3
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    const-string p1, "EventType: setupRemoteRenderInternal, streamIndex is null"

    .line 57
    .line 58
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    move-object v5, p2

    .line 81
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeTakeRemoteSnapshot(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J

    .line 82
    .line 83
    .line 84
    move-result-wide p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    goto :goto_0

    .line 86
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 89
    .line 90
    .line 91
    throw p1
.end method

.method public takeSnapshotToFile(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/lang/String;)J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RtcVideoImpl"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "native engine is invalid, takeRemoteSnapshot failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    int-to-long p1, p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-wide p1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p1, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    const-wide/16 v2, -0x1

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    :try_start_2
    const-string p1, "EventType: setupRemoteRenderInternal, streamKey is null"

    .line 40
    .line 41
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    .line 43
    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return-wide v2

    .line 50
    :cond_1
    :try_start_3
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    const-string p1, "EventType: setupRemoteRenderInternal, streamIndex is null"

    .line 57
    .line 58
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    move-object v5, p2

    .line 81
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeTakeSnapshotToFile(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)J

    .line 82
    .line 83
    .line 84
    move-result-wide p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    goto :goto_0

    .line 86
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 89
    .line 90
    .line 91
    throw p1
.end method

.method public updateClientMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
    .locals 4

    .line 1
    const-string v0, "updateClientMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-eqz p2, :cond_3

    .line 15
    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    const-string p1, "native engine is invalid, updateClientMixedStream failed."

    .line 26
    .line 27
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v2

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :cond_1
    :try_start_1
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->getTranscodeMessage()Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 49
    .line 50
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateClientMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I

    .line 51
    .line 52
    .line 53
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 57
    .line 58
    .line 59
    return p1

    .line 60
    :cond_3
    :goto_1
    :try_start_2
    const-string p1, "updateClientMixedStream...mLiveTranscoding is null, no effect, please check."

    .line 61
    .line 62
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public updateLocalVideoCanvas(Lcom/ss/bytertc/engine/data/StreamIndex;II)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string p2, "native engine is invalid, updateLocalVideoCanvas failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateLocalVideoCanvas(JIII)I

    .line 40
    .line 41
    .line 42
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public updateLoginToken(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RtcVideoImpl"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, sendBinaryMessage failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateLoginToken(JLjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public updatePushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
    .locals 4

    .line 1
    const-string v0, "updatePushMixedStream..."

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    const-string p1, "updatePushMixedStream...mLiveTranscoding is null, no effect, please check."

    .line 17
    .line 18
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return v2

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    const-string p1, "native engine is invalid, updatePushMixedStream failed."

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->getTranscodeMessage()Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 52
    .line 53
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdatePushMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I

    .line 54
    .line 55
    .line 56
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    return p1

    .line 63
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 66
    .line 67
    .line 68
    throw p1
.end method

.method public updateRemoteStreamVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;II)I
    .locals 1

    .line 105
    new-instance v0, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;

    invoke-direct {v0}, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;-><init>()V

    .line 106
    iput p2, v0, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;->renderMode:I

    .line 107
    iput p3, v0, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;->backgroundColor:I

    .line 108
    invoke-virtual {p0, p1, v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->updateRemoteStreamVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;)I

    move-result p0

    return p0
.end method

.method public updateRemoteStreamVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    const-string v0, "RtcVideoImpl"

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    :try_start_0
    const-string p1, "EventType: updateRemoteStreamVideoCanvas, streamKey is null"

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 18
    .line 19
    .line 20
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return p1

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->hasNullProperty()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const-string p1, "EventType: updateRemoteStreamVideoCanvas, hasNullProperty"

    .line 37
    .line 38
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    const-string p1, "native engine is invalid, updateRemoteStreamVideoCanvas failed."

    .line 55
    .line 56
    invoke-static {v0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getRoomId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    iget v5, p2, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;->renderMode:I

    .line 85
    .line 86
    iget v6, p2, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;->backgroundColor:I

    .line 87
    .line 88
    iget-object p1, p2, Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-static/range {v0 .. v7}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateRemoteVideoCanvas(JLjava/lang/String;Ljava/lang/String;IIII)I

    .line 95
    .line 96
    .line 97
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    goto :goto_0

    .line 99
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 102
    .line 103
    .line 104
    throw p1
.end method

.method public updateScreenCapture(Lcom/ss/bytertc/engine/data/ScreenMediaType;)I
    .locals 2

    .line 1
    const-string v0, "UpdateScreenCapture"

    .line 2
    .line 3
    const-string v1, "RtcVideoImpl"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->engineInvalid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p1, "native engine is invalid, StopScreenAudioCapture failed."

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 27
    .line 28
    .line 29
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mNativeEngine:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ScreenMediaType;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateScreenCapture(JI)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    throw p1
.end method
