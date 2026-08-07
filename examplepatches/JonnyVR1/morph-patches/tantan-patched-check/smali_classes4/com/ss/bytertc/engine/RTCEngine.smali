.class public abstract Lcom/ss/bytertc/engine/RTCEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcVideo"

.field protected static mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

.field protected static mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

.field protected static mRtcEglContextChecker:Lcom/ss/bytertc/engine/utils/RTCEglContextChecker;

.field protected static mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized createRTCEngine(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)Lcom/ss/bytertc/engine/RTCEngine;
    .locals 14

    .line 1
    const-string v1, "createRTCEngine: throw exception "

    .line 2
    .line 3
    const-string v2, "error in obtain create engine time. "

    .line 4
    .line 5
    const-string v0, "createRTCEngine: engine config is invalid, error code is "

    .line 6
    .line 7
    const-class v3, Lcom/ss/bytertc/engine/RTCEngine;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v4

    .line 14
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    const/4 v7, 0x0

    .line 19
    if-eqz v6, :cond_0

    .line 20
    .line 21
    const-string p1, "RtcVideo"

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    monitor-exit v3

    .line 43
    return-object v7

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p0, v0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->parameters:Lorg/json/JSONObject;

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    new-instance v0, Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->parameters:Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->parameters:Lorg/json/JSONObject;

    .line 59
    .line 60
    const-string v6, "rtc.platform_init_elapse_ms"

    .line 61
    .line 62
    invoke-virtual {v0, v6, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    :try_start_3
    const-string v4, "RtcVideo"

    .line 68
    .line 69
    new-instance v5, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v4, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    sget-object v0, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    monitor-exit v3

    .line 101
    return-object v0

    .line 102
    :cond_2
    :try_start_4
    new-instance v8, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 103
    .line 104
    const/4 v12, 0x0

    .line 105
    const/4 v13, 0x0

    .line 106
    const/4 v11, 0x0

    .line 107
    move-object v9, p0

    .line 108
    move-object v10, p1

    .line 109
    invoke-direct/range {v8 .. v13}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;-><init>(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;ZZ)V

    .line 110
    .line 111
    .line 112
    sput-object v8, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 113
    .line 114
    monitor-exit v3

    .line 115
    return-object v8

    .line 116
    :catch_1
    move-exception v0

    .line 117
    move-object p0, v0

    .line 118
    :try_start_5
    const-string p1, "RtcVideo"

    .line 119
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 137
    .line 138
    .line 139
    monitor-exit v3

    .line 140
    return-object v7

    .line 141
    :cond_3
    :try_start_6
    const-string p0, "RtcVideo"

    .line 142
    .line 143
    const-string p1, "createRTCEngine: fail to load native library"

    .line 144
    .line 145
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 146
    .line 147
    .line 148
    monitor-exit v3

    .line 149
    return-object v7

    .line 150
    :goto_1
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 151
    throw p0
.end method

.method public static declared-synchronized createRTCEngineMulti(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)Lcom/ss/bytertc/engine/RTCEngine;
    .locals 10

    .line 1
    const-string v0, "createRTCEngine: engine config is invalid, error code is "

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/engine/RTCEngine;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const-string p1, "RtcVideo"

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit v1

    .line 35
    return-object v3

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p0, v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    :try_start_2
    new-instance v4, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 48
    .line 49
    const/4 v8, 0x0

    .line 50
    const/4 v9, 0x1

    .line 51
    const/4 v7, 0x0

    .line 52
    move-object v5, p0

    .line 53
    move-object v6, p1

    .line 54
    invoke-direct/range {v4 .. v9}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;-><init>(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;ZZ)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-object v4

    .line 59
    :catch_0
    monitor-exit v1

    .line 60
    return-object v3

    .line 61
    :cond_1
    :try_start_3
    const-string p0, "RtcVideo"

    .line 62
    .line 63
    const-string p1, "createRTCEngine: fail to load native library"

    .line 64
    .line 65
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 66
    .line 67
    .line 68
    monitor-exit v1

    .line 69
    return-object v3

    .line 70
    :goto_0
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 71
    throw p0
.end method

.method public static declared-synchronized destroyRTCEngine()V
    .locals 3

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/RTCEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->doDestroy(Z)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    sput-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 14
    .line 15
    sput-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 16
    .line 17
    sput-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mRtcEglContextChecker:Lcom/ss/bytertc/engine/utils/RTCEglContextChecker;

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v1
.end method

.method public static declared-synchronized destroyRTCEngineMulti(Lcom/ss/bytertc/engine/RTCEngine;)V
    .locals 2

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/RTCEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 7
    .line 8
    if-ne p0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/ss/bytertc/engine/RTCEngine;->destroyRTCEngine()V

    .line 11
    .line 12
    .line 13
    goto :goto_1

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->doDestroy(Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0

    .line 28
    :cond_1
    :goto_1
    monitor-exit v0

    .line 29
    return-void
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getSdkVersion()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0
.end method

.method public static setLogConfig(Lcom/ss/bytertc/engine/data/RTCLogConfig;)I
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->setLogConfig(Lcom/ss/bytertc/engine/data/RTCLogConfig;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static setRtcNativeLibraryLoader(Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "set rtc native library loader"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcVideo"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-object p0, Lcom/ss/bytertc/engine/RTCEngine;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public abstract clearVideoWatermark(Lcom/ss/bytertc/engine/data/StreamIndex;)I
.end method

.method public abstract createGameRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/GameRoomConfig;)Lcom/ss/bytertc/engine/IGameRoom;
.end method

.method public abstract createRTCRoom(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTCRoom;
.end method

.method public abstract createRTSRoom(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTSRoom;
.end method

.method public abstract disableAlphaChannelVideoEncode(Lcom/ss/bytertc/engine/data/StreamIndex;)I
.end method

.method public abstract disableAudioFrameCallback(Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;)I
.end method

.method public abstract disableAudioProcessor(Lcom/ss/bytertc/engine/data/AudioProcessorMethod;)I
.end method

.method public abstract enableAlphaChannelVideoEncode(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AlphaLayout;)I
.end method

.method public abstract enableAudioAEDReport(I)I
.end method

.method public abstract enableAudioDecoding(Z)V
.end method

.method public abstract enableAudioEncoding(Z)V
.end method

.method public abstract enableAudioFrameCallback(Lcom/ss/bytertc/engine/data/AudioFrameCallbackMethod;Lcom/ss/bytertc/engine/data/AudioFormat;)I
.end method

.method public abstract enableAudioProcessor(Lcom/ss/bytertc/engine/data/AudioProcessorMethod;Lcom/ss/bytertc/engine/data/AudioFormat;)I
.end method

.method public abstract enableAudioPropertiesReport(Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;)I
.end method

.method public abstract enableAudioVADReport(I)I
.end method

.method public abstract enableCameraAutoExposureFaceMode(Z)I
.end method

.method public abstract enableEffectBeauty(Z)I
.end method

.method public abstract enableExternalSoundCard(Z)I
.end method

.method public abstract enableLocalVoiceReverb(Z)I
.end method

.method public abstract enablePlaybackDucking(Z)I
.end method

.method public abstract enableVocalInstrumentBalance(Z)I
.end method

.method public abstract feedback(Ljava/util/List;Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;)I
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
.end method

.method public abstract getAudioDeviceManager()Lcom/ss/bytertc/engine/IRTCAudioDeviceManager;
.end method

.method public abstract getAudioEffectPlayer()Lcom/ss/bytertc/engine/audio/IAudioEffectPlayer;
.end method

.method public abstract getAudioRoute()Lcom/ss/bytertc/engine/data/AudioRoute;
.end method

.method public abstract getCameraZoomMaxRatio()F
.end method

.method public abstract getKTVManager()Lcom/ss/bytertc/ktv/IKTVManager;
.end method

.method public abstract getMediaPlayer(I)Lcom/ss/bytertc/engine/audio/IMediaPlayer;
.end method

.method public abstract getNativeHandle()J
.end method

.method public abstract getNetworkTimeInfo()Lcom/ss/bytertc/engine/NetworkTimeInfo;
.end method

.method public abstract getPeerOnlineStatus(Ljava/lang/String;)I
.end method

.method public abstract getSingScoringManager()Lcom/ss/bytertc/engine/audio/ISingScoringManager;
.end method

.method public abstract getVideoDeviceManager()Lcom/ss/bytertc/engine/video/IVideoDeviceManager;
.end method

.method public abstract getVideoEffectInterface()Lcom/ss/bytertc/engine/video/IVideoEffect;
.end method

.method public abstract getWTNStream()Lcom/ss/bytertc/engine/IWTNStream;
.end method

.method public abstract isCameraExposurePositionSupported()Z
.end method

.method public abstract isCameraFocusPositionSupported()Z
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract login(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract logout()I
.end method

.method public abstract muteAudioCapture(Lcom/ss/bytertc/engine/data/StreamIndex;Z)I
.end method

.method public abstract pullExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
.end method

.method public abstract pushClientMixedStreamExternalVideoFrame(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public abstract pushExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
.end method

.method public abstract pushExternalEncodedAudioFrame(Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;)I
.end method

.method public abstract pushExternalEncodedVideoFrame(Lcom/ss/bytertc/engine/data/StreamIndex;ILcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;)I
.end method

.method public abstract pushExternalVideoFrame(Lcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public abstract pushReferenceAudioPCMData(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
.end method

.method public abstract pushScreenAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
.end method

.method public abstract pushScreenVideoFrame(Lcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public abstract registerAudioFrameObserver(Lcom/ss/bytertc/engine/IAudioFrameObserver;)I
.end method

.method public abstract registerAudioProcessor(Lcom/ss/bytertc/engine/IAudioFrameProcessor;)I
.end method

.method public abstract registerLocalEncodedVideoFrameObserver(Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;)I
.end method

.method public abstract registerLocalVideoProcessor(Lcom/ss/bytertc/engine/video/IVideoProcessor;Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;)I
.end method

.method public abstract registerRemoteEncodedAudioFrameObserver(Lcom/ss/bytertc/engine/IRemoteEncodedAudioFrameObserver;)V
.end method

.method public abstract registerRemoteEncodedVideoFrameObserver(Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;)I
.end method

.method public abstract requestRemoteVideoKeyFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;)I
.end method

.method public abstract sendPublicStreamSEIMessage(Lcom/ss/bytertc/engine/data/StreamIndex;I[BILcom/ss/bytertc/engine/data/SEICountPerFrame;)I
.end method

.method public abstract sendSEIMessage(Lcom/ss/bytertc/engine/data/StreamIndex;[BILcom/ss/bytertc/engine/data/SEICountPerFrame;)I
.end method

.method public abstract sendServerBinaryMessage([B)J
.end method

.method public abstract sendServerMessage(Ljava/lang/String;)J
.end method

.method public abstract sendStreamSyncInfo([BLcom/ss/bytertc/engine/data/StreamSyncInfoConfig;)I
.end method

.method public abstract sendUserBinaryMessageOutsideRoom(Ljava/lang/String;[BLcom/ss/bytertc/engine/type/MessageConfig;)J
.end method

.method public abstract sendUserMessageOutsideRoom(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/MessageConfig;)J
.end method

.method public abstract setAnsMode(Lcom/ss/bytertc/engine/type/AnsMode;)I
.end method

.method public abstract setAudioAlignmentProperty(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/AudioAlignmentMode;)I
.end method

.method public abstract setAudioProfile(Lcom/ss/bytertc/engine/type/AudioProfileType;)I
.end method

.method public abstract setAudioRenderType(Lcom/ss/bytertc/engine/data/AudioRenderType;)I
.end method

.method public abstract setAudioRoute(Lcom/ss/bytertc/engine/data/AudioRoute;)I
.end method

.method public abstract setAudioScenario(Lcom/ss/bytertc/engine/type/AudioScenarioType;)I
.end method

.method public abstract setAudioSourceType(Lcom/ss/bytertc/engine/data/AudioSourceType;)I
.end method

.method public abstract setBeautyIntensity(Lcom/ss/bytertc/engine/data/EffectBeautyMode;F)I
.end method

.method public abstract setBusinessId(Ljava/lang/String;)I
.end method

.method public abstract setCameraAdaptiveMinimumFrameRate(I)I
.end method

.method public abstract setCameraExposureCompensation(F)I
.end method

.method public abstract setCameraExposurePosition(FF)I
.end method

.method public abstract setCameraFocusPosition(FF)I
.end method

.method public abstract setCameraTorch(Lcom/ss/bytertc/engine/type/TorchState;)I
.end method

.method public abstract setCameraZoomRatio(F)I
.end method

.method public abstract setCaptureVolume(Lcom/ss/bytertc/engine/data/StreamIndex;I)I
.end method

.method public abstract setCellularEnhancement(Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;)I
.end method

.method public abstract setClientMixedStreamObserver(Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;)I
.end method

.method public abstract setCustomizeEncryptHandler(Lcom/ss/bytertc/engine/handler/RTCEncryptHandler;)I
.end method

.method public abstract setDefaultAudioRoute(Lcom/ss/bytertc/engine/data/AudioRoute;)I
.end method

.method public abstract setDummyCaptureImagePath(Ljava/lang/String;)I
.end method

.method public abstract setEarMonitorMode(Lcom/ss/bytertc/engine/data/EarMonitorMode;)I
.end method

.method public abstract setEarMonitorMode(Lcom/ss/bytertc/engine/data/EarMonitorMode;I)I
.end method

.method public abstract setEarMonitorVolume(I)I
.end method

.method public abstract setEncryptInfo(ILjava/lang/String;)I
.end method

.method public abstract setExternalVideoEncoderEventHandler(Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;)I
.end method

.method public abstract setLocalProxy(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract setLocalSimulcastMode(Lcom/ss/bytertc/engine/data/VideoSimulcastMode;)I
.end method

.method public abstract setLocalSimulcastMode(Lcom/ss/bytertc/engine/data/VideoSimulcastMode;[Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
.end method

.method public abstract setLocalVideoCanvas(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/VideoCanvas;)I
.end method

.method public abstract setLocalVideoMirrorType(Lcom/ss/bytertc/engine/data/MirrorType;)I
.end method

.method public abstract setLocalVideoSink(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/IVideoSink;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setLocalVideoSink(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;)I
.end method

.method public abstract setLocalVoiceEqualization(Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;)I
.end method

.method public abstract setLocalVoicePitch(I)I
.end method

.method public abstract setLocalVoiceReverbParam(Lcom/ss/bytertc/engine/type/VoiceReverbConfig;)I
.end method

.method public abstract setPlaybackVolume(I)I
.end method

.method public abstract setPublishFallbackOption(Lcom/ss/bytertc/engine/type/PublishFallbackOption;)I
.end method

.method public abstract setRemoteAudioPlaybackVolume(Lcom/ss/bytertc/engine/data/RemoteStreamKey;I)I
.end method

.method public abstract setRemoteUserPriority(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RemoteUserPriority;)I
.end method

.method public abstract setRemoteVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/VideoCanvas;)I
.end method

.method public abstract setRemoteVideoMirrorType(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/RemoteMirrorType;)I
.end method

.method public abstract setRemoteVideoSink(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/IVideoSink;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteVideoSink(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;)I
.end method

.method public abstract setRemoteVideoSuperResolution(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoSuperResolutionMode;)I
.end method

.method public abstract setRtcVideoEventHandler(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;)I
.end method

.method public abstract setRuntimeParameters(Lorg/json/JSONObject;)I
.end method

.method public abstract setScreenAudioSourceType(Lcom/ss/bytertc/engine/data/AudioSourceType;)I
.end method

.method public abstract setScreenAudioStreamIndex(Lcom/ss/bytertc/engine/data/StreamIndex;)I
.end method

.method public abstract setScreenVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
.end method

.method public abstract setServerParams(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract setSubscribeFallbackOption(Lcom/ss/bytertc/engine/type/SubscribeFallbackOptions;)I
.end method

.method public abstract setVideoCaptureConfig(Lcom/ss/bytertc/engine/video/VideoCaptureConfig;)I
.end method

.method public abstract setVideoCaptureRotation(Lcom/ss/bytertc/engine/data/VideoRotation;)I
.end method

.method public abstract setVideoDecoderConfig(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/VideoDecoderConfig;)I
.end method

.method public abstract setVideoDenoiser(Lcom/ss/bytertc/engine/data/VideoDenoiseMode;)I
.end method

.method public abstract setVideoDigitalZoomConfig(Lcom/ss/bytertc/engine/data/ZoomConfigType;F)I
.end method

.method public abstract setVideoDigitalZoomControl(Lcom/ss/bytertc/engine/data/ZoomDirectionType;)I
.end method

.method public abstract setVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;)I
.end method

.method public abstract setVideoEncoderConfig(Lcom/ss/bytertc/engine/VideoEncoderConfig;Lorg/json/JSONObject;)I
.end method

.method public abstract setVideoOrientation(Lcom/ss/bytertc/engine/data/VideoOrientation;)I
.end method

.method public abstract setVideoRotationMode(Lcom/ss/bytertc/engine/data/VideoRotationMode;)I
.end method

.method public abstract setVideoSourceType(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoSourceType;)I
.end method

.method public abstract setVideoWatermark(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/lang/String;Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;)I
.end method

.method public abstract setVoiceChangerType(Lcom/ss/bytertc/engine/type/VoiceChangerType;)I
.end method

.method public abstract setVoiceReverbType(Lcom/ss/bytertc/engine/type/VoiceReverbType;)I
.end method

.method public abstract startAudioCapture()I
.end method

.method public abstract startAudioRecording(Lcom/ss/bytertc/engine/data/AudioRecordingConfig;)I
.end method

.method public abstract startChorusCacheSync(Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;)I
.end method

.method public abstract startClientMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
.end method

.method public abstract startCloudProxy(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/CloudProxyInfo;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract startEchoTest(Lcom/ss/bytertc/engine/data/EchoTestConfig;I)I
.end method

.method public abstract startFileRecording(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/RecordingConfig;Lcom/ss/bytertc/engine/type/RecordingType;)I
.end method

.method public abstract startHardwareEchoDetection(Ljava/lang/String;)I
.end method

.method public abstract startNetworkDetection(ZIZI)I
.end method

.method public abstract startPushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
.end method

.method public abstract startPushSingleStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/PushSingleStreamParam;)I
.end method

.method public abstract startScreenCapture(Lcom/ss/bytertc/engine/data/ScreenMediaType;Landroid/content/Intent;)I
.end method

.method public abstract startVideoCapture()I
.end method

.method public abstract startVideoDigitalZoomControl(Lcom/ss/bytertc/engine/data/ZoomDirectionType;)I
.end method

.method public abstract stopAudioCapture()I
.end method

.method public abstract stopAudioRecording()I
.end method

.method public abstract stopChorusCacheSync()I
.end method

.method public abstract stopClientMixedStream(Ljava/lang/String;)I
.end method

.method public abstract stopCloudProxy()I
.end method

.method public abstract stopEchoTest()I
.end method

.method public abstract stopFileRecording(Lcom/ss/bytertc/engine/data/StreamIndex;)I
.end method

.method public abstract stopHardwareEchoDetection()I
.end method

.method public abstract stopNetworkDetection()I
.end method

.method public abstract stopPushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)I
.end method

.method public abstract stopPushSingleStream(Ljava/lang/String;)I
.end method

.method public abstract stopScreenCapture()I
.end method

.method public abstract stopVideoCapture()I
.end method

.method public abstract stopVideoDigitalZoomControl()I
.end method

.method public abstract switchCamera(Lcom/ss/bytertc/engine/data/CameraId;)I
.end method

.method public abstract takeLocalSnapshot(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
.end method

.method public abstract takeRemoteSnapshot(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
.end method

.method public abstract takeSnapshotToFile(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/lang/String;)J
.end method

.method public abstract updateClientMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
.end method

.method public abstract updateLocalVideoCanvas(Lcom/ss/bytertc/engine/data/StreamIndex;II)I
.end method

.method public abstract updateLoginToken(Ljava/lang/String;)I
.end method

.method public abstract updatePushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
.end method

.method public abstract updateRemoteStreamVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;II)I
.end method

.method public abstract updateRemoteStreamVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/RemoteVideoRenderConfig;)I
.end method

.method public abstract updateScreenCapture(Lcom/ss/bytertc/engine/data/ScreenMediaType;)I
.end method
