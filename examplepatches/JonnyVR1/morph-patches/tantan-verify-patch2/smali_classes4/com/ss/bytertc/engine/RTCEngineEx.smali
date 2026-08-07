.class public abstract Lcom/ss/bytertc/engine/RTCEngineEx;
.super Lcom/ss/bytertc/engine/RTCEngine;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcVideoEx"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/RTCEngine;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized createRTCEngineEx(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)Lcom/ss/bytertc/engine/RTCEngineEx;
    .locals 10

    .line 1
    const-string v0, "createRTCEngineEx: engine config is invalid, error code is "

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/engine/RTCEngineEx;

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
    const-string p1, "RtcVideoEx"

    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    goto :goto_1

    .line 39
    :cond_0
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/engine/RTCEngine;->mInstance:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->initializeNativeLibs(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    sget-object v0, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    :try_start_2
    new-instance v4, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 56
    .line 57
    const/4 v8, 0x1

    .line 58
    const/4 v9, 0x0

    .line 59
    move-object v5, p0

    .line 60
    move-object v6, p1

    .line 61
    move-object v7, p2

    .line 62
    invoke-direct/range {v4 .. v9}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;-><init>(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;ZZ)V

    .line 63
    .line 64
    .line 65
    sput-object v4, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    monitor-exit v1

    .line 69
    return-object v3

    .line 70
    :cond_1
    :goto_0
    :try_start_3
    sget-object p0, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 71
    .line 72
    monitor-exit v1

    .line 73
    return-object p0

    .line 74
    :cond_2
    monitor-exit v1

    .line 75
    return-object v3

    .line 76
    :goto_1
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 77
    throw p0
.end method

.method public static declared-synchronized createRTCEngineExMulti(Lcom/ss/bytertc/engine/data/EngineConfig;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)Lcom/ss/bytertc/engine/RTCEngineEx;
    .locals 10

    .line 1
    const-string v0, "createRTCEngine: engine config is invalid, error code is "

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/engine/RTCEngineEx;

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
    const-string p1, "RtcVideoEx"

    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/EngineConfigCheck;->checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    const/4 v8, 0x1

    .line 50
    const/4 v9, 0x1

    .line 51
    move-object v5, p0

    .line 52
    move-object v6, p1

    .line 53
    move-object v7, p2

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
    const-string p0, "RtcVideoEx"

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

.method public static declared-synchronized destroyRTCEngineEx()V
    .locals 3

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

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
    sput-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

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

.method public static declared-synchronized destroyRTCEngineExMulti(Lcom/ss/bytertc/engine/RTCEngineEx;)V
    .locals 2

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/RTCEngine;->mInstanceEx:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 7
    .line 8
    if-ne p0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/ss/bytertc/engine/RTCEngineEx;->destroyRTCEngineEx()V

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
    const-string v1, "RtcVideoEx"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/bytertc/engine/RTCEngine;->setRtcNativeLibraryLoader(Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public abstract createRTCRoomEx(Ljava/lang/String;)Lcom/ss/bytertc/engine/RTCRoomEx;
.end method

.method public abstract pushExternalVideoFrame(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public abstract setAudioContentType(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;)I
.end method

.method public abstract setAudioEncodeConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioEncodeConfig;)I
.end method

.method public abstract setAudioSourceVolume(Lcom/ss/bytertc/engine/data/StreamIndex;I)I
.end method

.method public abstract setCaptureVolume(I)I
.end method

.method public abstract setLocalStreamPriority(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/StreamPriority;)I
.end method

.method public abstract setRtcVideoEventHandlerEx(Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;)I
.end method

.method public abstract setScreenCaptureVolume(I)I
.end method

.method public abstract setVideoCaptureConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/video/VideoCaptureConfig;)I
.end method

.method public abstract setVideoEncoderConfig(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/bytertc/engine/data/StreamIndex;",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoEncoderConfig;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract setVideoSource(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/InternalVideoSourceConfig;)I
.end method

.method public abstract startVideoCapture(Lcom/ss/bytertc/engine/data/StreamIndex;Ljava/lang/String;)I
.end method

.method public abstract stopVideoCapture(Lcom/ss/bytertc/engine/data/StreamIndex;)I
.end method
