.class public Ll/wmp0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile d:Ll/wmp0;


# instance fields
.field private a:Lcom/ss/bytertc/engine/RTCEngineEx;

.field private b:Ljava/lang/String;

.field private c:Lcom/ss/bytertc/engine/RTCRoomEx;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/wmp0;
    .locals 2

    .line 1
    sget-object v0, Ll/wmp0;->d:Ll/wmp0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/wmp0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/wmp0;->d:Ll/wmp0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/wmp0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/wmp0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/wmp0;->d:Ll/wmp0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/wmp0;->d:Ll/wmp0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/ss/bytertc/engine/RTCEngineEx;->destroyRTCEngineEx()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/engine/RTCEngine;->setRtcVideoEventHandler(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)I

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Lcom/ss/bytertc/engine/RTCEngineEx;->setRtcVideoEventHandlerEx(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 24
    .line 25
    const/16 v0, 0x64

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/RTCEngine;->setPlaybackVolume(I)I

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Lcom/ss/bytertc/engine/RTCEngine;->registerAudioFrameObserver(Lcom/ss/bytertc/engine/IAudioFrameObserver;)I

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 36
    .line 37
    sget-object v2, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_DEFAULT:Lcom/ss/bytertc/engine/type/AudioProfileType;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Lcom/ss/bytertc/engine/RTCEngine;->setAudioProfile(Lcom/ss/bytertc/engine/type/AudioProfileType;)I

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 43
    .line 44
    sget-object v2, Lcom/ss/bytertc/engine/type/AudioScenarioType;->DEFAULT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Lcom/ss/bytertc/engine/RTCEngine;->setAudioScenario(Lcom/ss/bytertc/engine/type/AudioScenarioType;)I

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/RTCEngineEx;->setCaptureVolume(I)I

    .line 52
    .line 53
    .line 54
    sget-object p1, Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;->AUDIO_FRAME_CALLBACK_PLAYBACK:Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;

    .line 55
    .line 56
    sget-object v2, Lcom/ss/bytertc/engine/data/AudioProcessorMethod;->AUDIO_FRAME_PROCESSOR_RECORD:Lcom/ss/bytertc/engine/data/AudioProcessorMethod;

    .line 57
    .line 58
    iget-object v3, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 59
    .line 60
    invoke-virtual {v3, p1}, Lcom/ss/bytertc/engine/RTCEngine;->disableAudioFrameCallback(Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;)I

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Lcom/ss/bytertc/engine/RTCEngine;->disableAudioProcessor(Lcom/ss/bytertc/engine/data/AudioProcessorMethod;)I

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Lcom/ss/bytertc/engine/RTCEngine;->registerAudioFrameObserver(Lcom/ss/bytertc/engine/IAudioFrameObserver;)I

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Lcom/ss/bytertc/engine/RTCEngine;->registerAudioProcessor(Lcom/ss/bytertc/engine/IAudioFrameProcessor;)I

    .line 76
    .line 77
    .line 78
    new-instance p1, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-direct {p1, v1}, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;-><init>(I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 85
    .line 86
    invoke-virtual {v1, p1}, Lcom/ss/bytertc/engine/RTCEngine;->enableAudioPropertiesReport(Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;)I

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 90
    .line 91
    sget-object v1, Lcom/ss/bytertc/engine/data/EarMonitorMode;->EAR_MONITOR_MODE_OFF:Lcom/ss/bytertc/engine/data/EarMonitorMode;

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Lcom/ss/bytertc/engine/RTCEngine;->setEarMonitorMode(Lcom/ss/bytertc/engine/data/EarMonitorMode;)I

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/RTCEngine;->setEarMonitorVolume(I)I

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 102
    .line 103
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_DEFAULT:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/engine/RTCEngine;->setDefaultAudioRoute(Lcom/ss/bytertc/engine/data/AudioRoute;)I

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCEngine;->stopAudioCapture()I

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public c(Lcom/ss/bytertc/engine/data/EngineConfig;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;Z)Lcom/ss/bytertc/engine/RTCEngineEx;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    if-nez p5, :cond_0

    .line 7
    .line 8
    iget-object p5, p0, Ll/wmp0;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p5, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p5

    .line 14
    if-nez p5, :cond_2

    .line 15
    .line 16
    :cond_0
    iget-object p5, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    invoke-virtual {p5}, Lcom/ss/bytertc/engine/RTSRoom;->leaveRoom()I

    .line 21
    .line 22
    .line 23
    iget-object p5, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 24
    .line 25
    invoke-virtual {p5}, Lcom/ss/bytertc/engine/RTCRoom;->destroy()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 29
    .line 30
    :cond_1
    invoke-static {}, Lcom/ss/bytertc/engine/RTCEngineEx;->destroyRTCEngineEx()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 34
    .line 35
    :cond_2
    iget-object p5, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 36
    .line 37
    if-nez p5, :cond_3

    .line 38
    .line 39
    invoke-static {p1, p3, p4}, Lcom/ss/bytertc/engine/RTCEngineEx;->createRTCEngineEx(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    iget-object p1, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 47
    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/RTSRoom;->leaveRoom()I

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/RTCRoom;->destroy()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 59
    .line 60
    :cond_4
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 61
    .line 62
    invoke-virtual {p1, p3}, Lcom/ss/bytertc/engine/RTCEngine;->setRtcVideoEventHandler(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)I

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 66
    .line 67
    invoke-virtual {p1, p4}, Lcom/ss/bytertc/engine/RTCEngineEx;->setRtcVideoEventHandlerEx(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)I

    .line 68
    .line 69
    .line 70
    :goto_0
    iput-object p2, p0, Ll/wmp0;->b:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p0, Ll/wmp0;->a:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 73
    .line 74
    return-object p0
.end method

.method public d(Lcom/ss/bytertc/engine/RTCRoomEx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wmp0;->c:Lcom/ss/bytertc/engine/RTCRoomEx;

    .line 2
    .line 3
    return-void
.end method
