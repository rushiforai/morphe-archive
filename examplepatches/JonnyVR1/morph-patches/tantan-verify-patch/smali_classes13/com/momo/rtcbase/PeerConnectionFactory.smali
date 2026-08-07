.class public Lcom/momo/rtcbase/PeerConnectionFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/PeerConnectionFactory$Builder;,
        Lcom/momo/rtcbase/PeerConnectionFactory$Options;,
        Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PeerConnectionFactory"

.field public static final TRIAL_ENABLED:Ljava/lang/String; = "Enabled"

.field private static final VIDEO_CAPTURER_THREAD_NAME:Ljava/lang/String; = "VideoCapturerThread"

.field public static final VIDEO_FRAME_EMIT_TRIAL:Ljava/lang/String; = "VideoFrameEmit"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static volatile internalTracerInitialized:Z

.field private static networkThread:Ljava/lang/Thread;

.field private static signalingThread:Ljava/lang/Thread;

.field private static workerThread:Ljava/lang/Thread;


# instance fields
.field private nativeFactory:J


# direct methods
.method public constructor <init>(J)V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkInitializeHasBeenCalled()V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 89
    iput-wide p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    return-void

    .line 90
    :cond_0
    const-string p0, "Failed to initialize PeerConnectionFactory!"

    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method private constructor <init>(Lcom/momo/rtcbase/PeerConnectionFactory$Options;Lcom/momo/rtcbase/audio/AudioDeviceModule;Lcom/momo/rtcbase/AudioEncoderFactoryFactory;Lcom/momo/rtcbase/AudioDecoderFactoryFactory;Lcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;Lcom/momo/rtcbase/AudioProcessingFactory;Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;Lcom/momo/rtcbase/MediaTransportFactoryFactory;)V
    .locals 18

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct/range {p0 .. p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkInitializeHasBeenCalled()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    move-wide v4, v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface/range {p2 .. p2}, Lcom/momo/rtcbase/audio/AudioDeviceModule;->getNativeAudioDeviceModulePointer()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    move-wide v4, v3

    .line 22
    :goto_0
    invoke-interface/range {p3 .. p3}, Lcom/momo/rtcbase/AudioEncoderFactoryFactory;->createNativeAudioEncoderFactory()J

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    invoke-interface/range {p4 .. p4}, Lcom/momo/rtcbase/AudioDecoderFactoryFactory;->createNativeAudioDecoderFactory()J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    if-nez p7, :cond_1

    .line 31
    .line 32
    move-wide v12, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-interface/range {p7 .. p7}, Lcom/momo/rtcbase/AudioProcessingFactory;->createNative()J

    .line 35
    .line 36
    .line 37
    move-result-wide v10

    .line 38
    move-wide v12, v10

    .line 39
    :goto_1
    if-nez p8, :cond_2

    .line 40
    .line 41
    move-wide v14, v0

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    invoke-interface/range {p8 .. p8}, Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;->createNative()J

    .line 44
    .line 45
    .line 46
    move-result-wide v10

    .line 47
    move-wide v14, v10

    .line 48
    :goto_2
    if-nez p9, :cond_3

    .line 49
    .line 50
    move-wide/from16 v16, v0

    .line 51
    .line 52
    :goto_3
    move-object/from16 v3, p1

    .line 53
    .line 54
    move-object/from16 v10, p5

    .line 55
    .line 56
    move-object/from16 v11, p6

    .line 57
    .line 58
    goto :goto_4

    .line 59
    :cond_3
    invoke-interface/range {p9 .. p9}, Lcom/momo/rtcbase/MediaTransportFactoryFactory;->createNativeMediaTransportFactory()J

    .line 60
    .line 61
    .line 62
    move-result-wide v10

    .line 63
    move-wide/from16 v16, v10

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :goto_4
    invoke-static/range {v2 .. v17}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreatePeerConnectionFactory(Landroid/content/Context;Lcom/momo/rtcbase/PeerConnectionFactory$Options;JJJLcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;JJJ)J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    move-object/from16 v4, p0

    .line 71
    .line 72
    iput-wide v2, v4, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 73
    .line 74
    cmp-long v0, v2, v0

    .line 75
    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    const-string v0, "Failed to initialize PeerConnectionFactory!"

    .line 80
    .line 81
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    throw v0
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/PeerConnectionFactory$Options;Lcom/momo/rtcbase/audio/AudioDeviceModule;Lcom/momo/rtcbase/AudioEncoderFactoryFactory;Lcom/momo/rtcbase/AudioDecoderFactoryFactory;Lcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;Lcom/momo/rtcbase/AudioProcessingFactory;Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;Lcom/momo/rtcbase/MediaTransportFactoryFactory;Lcom/momo/rtcbase/PeerConnectionFactory$1;)V
    .locals 0

    .line 86
    invoke-direct/range {p0 .. p9}, Lcom/momo/rtcbase/PeerConnectionFactory;-><init>(Lcom/momo/rtcbase/PeerConnectionFactory$Options;Lcom/momo/rtcbase/audio/AudioDeviceModule;Lcom/momo/rtcbase/AudioEncoderFactoryFactory;Lcom/momo/rtcbase/AudioDecoderFactoryFactory;Lcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;Lcom/momo/rtcbase/AudioProcessingFactory;Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;Lcom/momo/rtcbase/MediaTransportFactoryFactory;)V

    return-void
.end method

.method public static builder()Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;-><init>(Lcom/momo/rtcbase/PeerConnectionFactory$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method private checkInitializeHasBeenCalled()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NativeLibrary;->isLoaded()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "PeerConnectionFactory.initialize was not called before creating a PeerConnectionFactory."

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private checkPeerConnectionFactoryExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "PeerConnectionFactory has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static fieldTrialsFindFullName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NativeLibrary;->isLoaded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFindFieldTrialsFullName(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, ""

    .line 13
    .line 14
    return-object p0
.end method

.method public static initialize(Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/ContextUtils;->initialize(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->nativeLibraryName:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momo/rtcbase/NativeLibrary;->initialize(Lcom/momo/rtcbase/NativeLibraryLoader;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInitializeAndroidGlobals()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->fieldTrials:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInitializeFieldTrials(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->enableInternalTracer:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-boolean v0, Lcom/momo/rtcbase/PeerConnectionFactory;->internalTracerInitialized:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->initializeInternalTracer()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggable:Lcom/momo/rtcbase/Loggable;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->injectLoggable(Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Lcom/momo/rtcbase/JNILogging;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggable:Lcom/momo/rtcbase/Loggable;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/JNILogging;-><init>(Lcom/momo/rtcbase/Loggable;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {v0, p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInjectLoggable(Lcom/momo/rtcbase/JNILogging;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const-string p0, "PeerConnectionFactory"

    .line 59
    .line 60
    const-string v0, "PeerConnectionFactory was initialized without an injected Loggable. Any existing Loggable will be deleted."

    .line 61
    .line 62
    invoke-static {p0, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/momo/rtcbase/Logging;->deleteInjectedLoggable()V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeDeleteLoggable()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static initializeFieldTrials(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInitializeFieldTrials(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static initializeInternalTracer()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/momo/rtcbase/PeerConnectionFactory;->internalTracerInitialized:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInitializeInternalTracer()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private static native nativeCreateAudioSource(JLcom/momo/rtcbase/MediaConstraints;)J
.end method

.method private static native nativeCreateAudioTrack(JLjava/lang/String;J)J
.end method

.method private static native nativeCreateLocalMediaStream(JLjava/lang/String;)J
.end method

.method private static native nativeCreatePeerConnection(JLcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;JLcom/momo/rtcbase/SSLCertificateVerifier;)J
.end method

.method private static native nativeCreatePeerConnectionFactory(Landroid/content/Context;Lcom/momo/rtcbase/PeerConnectionFactory$Options;JJJLcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;JJJ)J
.end method

.method private static native nativeCreateVideoSource(JZZ)J
.end method

.method private static native nativeCreateVideoTrack(JLjava/lang/String;J)J
.end method

.method private static native nativeDeleteLoggable()V
.end method

.method private static native nativeFindFieldTrialsFullName(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native nativeFreeFactory(J)V
.end method

.method private static native nativeGetNativePeerConnectionFactory(J)J
.end method

.method private static native nativeInitializeAndroidGlobals()V
.end method

.method private static native nativeInitializeFieldTrials(Ljava/lang/String;)V
.end method

.method private static native nativeInitializeInternalTracer()V
.end method

.method private static native nativeInjectLoggable(Lcom/momo/rtcbase/JNILogging;I)V
.end method

.method private static native nativeInvokeThreadsCallbacks(J)V
.end method

.method private static native nativeShutdownInternalTracer()V
.end method

.method private static native nativeStartAecDump(JII)Z
.end method

.method private static native nativeStartInternalTracingCapture(Ljava/lang/String;)Z
.end method

.method private static native nativeStopAecDump(J)V
.end method

.method private static native nativeStopInternalTracingCapture()V
.end method

.method private static onNetworkThreadReady()V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->networkThread:Ljava/lang/Thread;

    .line 6
    .line 7
    const-string v0, "PeerConnectionFactory"

    .line 8
    .line 9
    const-string v1, "onNetworkThreadReady"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static onSignalingThreadReady()V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->signalingThread:Ljava/lang/Thread;

    .line 6
    .line 7
    const-string v0, "PeerConnectionFactory"

    .line 8
    .line 9
    const-string v1, "onSignalingThreadReady"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static onWorkerThreadReady()V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->workerThread:Ljava/lang/Thread;

    .line 6
    .line 7
    const-string v0, "PeerConnectionFactory"

    .line 8
    .line 9
    const-string v1, "onWorkerThreadReady"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static printStackTrace(Ljava/lang/Thread;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " stacks trace:"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "PeerConnectionFactory"

    .line 28
    .line 29
    invoke-static {v0, p1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    array-length p1, p0

    .line 33
    const/4 v1, 0x0

    .line 34
    :goto_0
    if-ge v1, p1, :cond_0

    .line 35
    .line 36
    aget-object v2, p0, v1

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v0, v2}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    return-void
.end method

.method public static printStackTraces()V
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->networkThread:Ljava/lang/Thread;

    .line 2
    .line 3
    const-string v1, "Network thread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->printStackTrace(Ljava/lang/Thread;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->workerThread:Ljava/lang/Thread;

    .line 9
    .line 10
    const-string v1, "Worker thread"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->printStackTrace(Ljava/lang/Thread;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->signalingThread:Ljava/lang/Thread;

    .line 16
    .line 17
    const-string v1, "Signaling thread"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->printStackTrace(Ljava/lang/Thread;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static shutdownInternalTracer()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/momo/rtcbase/PeerConnectionFactory;->internalTracerInitialized:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeShutdownInternalTracer()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static startInternalTracingCapture(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeStartInternalTracingCapture(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static stopInternalTracingCapture()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeStopInternalTracingCapture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createAudioSource(Lcom/momo/rtcbase/MediaConstraints;)Lcom/momo/rtcbase/AudioSource;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/AudioSource;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 7
    .line 8
    invoke-static {v1, v2, p1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreateAudioSource(JLcom/momo/rtcbase/MediaConstraints;)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/AudioSource;-><init>(J)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public createAudioTrack(Ljava/lang/String;Lcom/momo/rtcbase/AudioSource;)Lcom/momo/rtcbase/AudioTrack;
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/AudioTrack;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/momo/rtcbase/AudioSource;->getNativeAudioSource()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    invoke-static {v1, v2, p1, v3, v4}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreateAudioTrack(JLjava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/AudioTrack;-><init>(J)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public createLocalMediaStream(Ljava/lang/String;)Lcom/momo/rtcbase/MediaStream;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/MediaStream;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 7
    .line 8
    invoke-static {v1, v2, p1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreateLocalMediaStream(JLjava/lang/String;)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/MediaStream;-><init>(J)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/PeerConnectionFactory;->createPeerConnectionInternal(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;)Lcom/momo/rtcbase/PeerConnection;

    move-result-object p0

    return-object p0
.end method

.method public createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0, p2}, Lcom/momo/rtcbase/PeerConnectionFactory;->createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;

    move-result-object p0

    return-object p0
.end method

.method public createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/PeerConnectionDependencies;)Lcom/momo/rtcbase/PeerConnection;
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/momo/rtcbase/PeerConnectionDependencies;->getObserver()Lcom/momo/rtcbase/PeerConnection$Observer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2}, Lcom/momo/rtcbase/PeerConnectionDependencies;->getSSLCertificateVerifier()Lcom/momo/rtcbase/SSLCertificateVerifier;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/momo/rtcbase/PeerConnectionFactory;->createPeerConnectionInternal(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;)Lcom/momo/rtcbase/PeerConnection;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public createPeerConnection(Ljava/util/List;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/PeerConnection$IceServer;",
            ">;",
            "Lcom/momo/rtcbase/MediaConstraints;",
            "Lcom/momo/rtcbase/PeerConnection$Observer;",
            ")",
            "Lcom/momo/rtcbase/PeerConnection;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 15
    new-instance v0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;

    invoke-direct {v0, p1}, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;-><init>(Ljava/util/List;)V

    .line 16
    invoke-virtual {p0, v0, p2, p3}, Lcom/momo/rtcbase/PeerConnectionFactory;->createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;

    move-result-object p0

    return-object p0
.end method

.method public createPeerConnection(Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/PeerConnection$IceServer;",
            ">;",
            "Lcom/momo/rtcbase/PeerConnection$Observer;",
            ")",
            "Lcom/momo/rtcbase/PeerConnection;"
        }
    .end annotation

    .line 17
    new-instance v0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;

    invoke-direct {v0, p1}, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;-><init>(Ljava/util/List;)V

    .line 18
    invoke-virtual {p0, v0, p2}, Lcom/momo/rtcbase/PeerConnectionFactory;->createPeerConnection(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnection;

    move-result-object p0

    return-object p0
.end method

.method public createPeerConnectionInternal(Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;)Lcom/momo/rtcbase/PeerConnection;
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Lcom/momo/rtcbase/PeerConnection;->createNativePeerConnectionObserver(Lcom/momo/rtcbase/PeerConnection$Observer;)J

    .line 5
    .line 6
    .line 7
    move-result-wide v4

    .line 8
    const-wide/16 v7, 0x0

    .line 9
    .line 10
    cmp-long p3, v4, v7

    .line 11
    .line 12
    const/4 v9, 0x0

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    return-object v9

    .line 16
    :cond_0
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 17
    .line 18
    move-object v2, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v6, p4

    .line 21
    invoke-static/range {v0 .. v6}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreatePeerConnection(JLcom/momo/rtcbase/PeerConnection$RTCConfiguration;Lcom/momo/rtcbase/MediaConstraints;JLcom/momo/rtcbase/SSLCertificateVerifier;)J

    .line 22
    .line 23
    .line 24
    move-result-wide p0

    .line 25
    cmp-long p2, p0, v7

    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    return-object v9

    .line 30
    :cond_1
    new-instance p2, Lcom/momo/rtcbase/PeerConnection;

    .line 31
    .line 32
    invoke-direct {p2, p0, p1}, Lcom/momo/rtcbase/PeerConnection;-><init>(J)V

    .line 33
    .line 34
    .line 35
    return-object p2
.end method

.method public createVideoSource(Z)Lcom/momo/rtcbase/VideoSource;
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/momo/rtcbase/PeerConnectionFactory;->createVideoSource(ZZ)Lcom/momo/rtcbase/VideoSource;

    move-result-object p0

    return-object p0
.end method

.method public createVideoSource(ZZ)Lcom/momo/rtcbase/VideoSource;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/VideoSource;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 7
    .line 8
    invoke-static {v1, v2, p1, p2}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreateVideoSource(JZZ)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/VideoSource;-><init>(J)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public createVideoTrack(Ljava/lang/String;Lcom/momo/rtcbase/VideoSource;)Lcom/momo/rtcbase/VideoTrack;
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/VideoTrack;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/momo/rtcbase/VideoSource;->getNativeVideoTrackSource()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    invoke-static {v1, v2, p1, v3, v4}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeCreateVideoTrack(JLjava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/VideoTrack;-><init>(J)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFreeFactory(J)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->networkThread:Ljava/lang/Thread;

    .line 11
    .line 12
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->workerThread:Ljava/lang/Thread;

    .line 13
    .line 14
    sput-object v0, Lcom/momo/rtcbase/PeerConnectionFactory;->signalingThread:Ljava/lang/Thread;

    .line 15
    .line 16
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->disposeEglContext()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->disposeEglContext()V

    .line 20
    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 25
    .line 26
    return-void
.end method

.method public getNativeOwnedFactoryAndThreads()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public getNativePeerConnectionFactory()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeGetNativePeerConnectionFactory(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    return-wide v0
.end method

.method public startAecDump(II)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1, p2}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeStartAecDump(JII)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public stopAecDump()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeStopAecDump(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public threadsCallbacks()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory;->checkPeerConnectionFactoryExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeFactory:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/PeerConnectionFactory;->nativeInvokeThreadsCallbacks(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
