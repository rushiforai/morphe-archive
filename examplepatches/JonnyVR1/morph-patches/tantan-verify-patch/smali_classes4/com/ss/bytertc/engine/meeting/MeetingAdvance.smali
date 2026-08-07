.class public abstract Lcom/ss/bytertc/engine/meeting/MeetingAdvance;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static final TAG:Ljava/lang/String; = "MeetingAdvance"

.field private static mGetAmazingEffectMethod:Ljava/lang/reflect/Method;

.field private static mGetNativeMethod:Ljava/lang/reflect/Method;

.field private static mGetNativeVideoMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static enableAutoSubscribe(Lcom/ss/bytertc/engine/RTCRoom;Lcom/ss/bytertc/engine/type/SubscribeMode;Lcom/ss/bytertc/engine/type/SubscribeMode;)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, enableAutoSubscribe failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/SubscribeMode;->value()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/type/SubscribeMode;->value()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-static {v0, v1, p0, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableAutoSubscribe(JII)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public static enableRescaleAudioVolume(Lcom/ss/bytertc/engine/RTCRoom;Z)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, enableRescaleAudioVolume failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEenableRescaleAudioVolume(JZ)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static enableSimulcastMode(Lcom/ss/bytertc/engine/RTCEngine;Z)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "video native handle is invalid, enableSimulcastMode failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableSimulcastMode(JZ)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static getAmazingEffectInterface(Lcom/ss/bytertc/engine/RTCEngine;)Lcom/ss/bytertc/engine/video/IAmazingEffect;
    .locals 4

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetAmazingEffectMethod:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    const-string v1, "MeetingAdvance"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 9
    .line 10
    sget v3, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->a:I

    .line 11
    .line 12
    const-string v3, "getAmazingEffectInterface"

    .line 13
    .line 14
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetAmazingEffectMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    const-string v0, "fail to find method getAmazingEffectInterface"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetAmazingEffectMethod:Ljava/lang/reflect/Method;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    return-object v2

    .line 31
    :cond_1
    :try_start_1
    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/ss/bytertc/engine/video/IAmazingEffect;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :catch_1
    const-string p0, "fail to invoke method getAmazingEffectInterface"

    .line 39
    .line 40
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v2
.end method

.method public static getDownlinkNetworkBandwidthEstimationStatus(Lcom/ss/bytertc/engine/RTCRoom;)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string v0, "room native handle is invalid, getUplinkNetworkBandwidthEstimationStatus failed."

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetDownlinkNetworkBandwidthEstimationStatus(J)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method private static getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J
    .locals 5

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeMethod:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    const-string v1, "MeetingAdvance"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-class v0, Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    const-string v3, "getNativeHandle"

    .line 11
    .line 12
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    const-string v0, "fail to find method getNativeHandle"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    :goto_0
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeMethod:Ljava/lang/reflect/Method;

    .line 25
    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    return-wide v3

    .line 31
    :cond_1
    :try_start_1
    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 41
    return-wide v0

    .line 42
    :catch_1
    const-string p0, "fail to invoke method getNativeHandle"

    .line 43
    .line 44
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-wide v3
.end method

.method private static getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J
    .locals 5

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeVideoMethod:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    const-string v1, "MeetingAdvance"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-class v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 9
    .line 10
    sget v3, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->a:I

    .line 11
    .line 12
    const-string v3, "getNativeHandle"

    .line 13
    .line 14
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeVideoMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    const-string v0, "fail to find method getNativeHandle"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    sget-object v0, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->mGetNativeVideoMethod:Ljava/lang/reflect/Method;

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    return-wide v3

    .line 33
    :cond_1
    :try_start_1
    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Long;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    return-wide v0

    .line 44
    :catch_1
    const-string p0, "fail to invoke method getNativeHandle"

    .line 45
    .line 46
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-wide v3
.end method

.method public static getUplinkNetworkBandwidthEstimationStatus(Lcom/ss/bytertc/engine/RTCRoom;)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string v0, "room native handle is invalid, getUplinkNetworkBandwidthEstimationStatus failed."

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetUplinkNetworkBandwidthEstimationStatus(J)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static isStreamUnpublished(Lcom/ss/bytertc/engine/RTCRoom;I)Z
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, isStreamUnpublished failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeIsStreamUnpublished(JI)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static resetScreenVideoConfigs(Lcom/ss/bytertc/engine/RTCEngine;)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string v0, "video native handle is invalid, resetScreenVideoConfigs failed."

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeResetScreenVideoConfigs(J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static setExternalSurface(Lcom/ss/bytertc/engine/RTCEngine;Lcom/ss/bytertc/engine/data/RemoteStreamKey;Landroid/view/Surface;)V
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    const-string v2, "MeetingAdvance"

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, "room native handle is invalid, setExternalSurface failed."

    .line 14
    .line 15
    invoke-static {v2, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "setExternalSurface, roomId:"

    .line 22
    .line 23
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->roomId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, ", userId: "

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v3, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, ", index: "

    .line 42
    .line 43
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v3, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 47
    .line 48
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v3, ", externalSurface:"

    .line 52
    .line 53
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {v2, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->roomId:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v3, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p0, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    move-object v5, p2

    .line 77
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetExternalSurface(JLjava/lang/String;Ljava/lang/String;ILandroid/view/Surface;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static setPublishChannel(Lcom/ss/bytertc/engine/RTCRoom;Ljava/lang/String;)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, setPublishChannel failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetPublishChannel(JLjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static setPublishSpecialStream(Lcom/ss/bytertc/engine/RTCRoom;I)I
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 29
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    .line 30
    const-string p0, "MeetingAdvance"

    const-string p1, "room native handle is invalid, setPublishSpecialStream failed."

    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0

    .line 31
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetPublishSpecialStream(JI)I

    move-result p0

    return p0
.end method

.method public static setPublishSpecialStream(Lcom/ss/bytertc/engine/RTCRoom;Lcom/ss/bytertc/engine/data/StreamIndex;I)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, setPublishSpecialStream failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->value()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {v0, v1, p0, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetPublishSpecialStreamWithStreamIndex(JII)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public static setScreenVideoConfigs(Lcom/ss/bytertc/engine/RTCEngine;)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string v0, "video native handle is invalid, setScreenVideoConfigs failed."

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetScreenVideoConfigs(J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static setSubscribeBaselineData(Lcom/ss/bytertc/engine/RTCRoom;Ljava/lang/String;ZLcom/ss/bytertc/engine/SubscribeVideoBaseline;)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, setSubscribeBaselineData failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetSubscribeBaselineData(JLjava/lang/String;ZLcom/ss/bytertc/engine/SubscribeVideoBaseline;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static setSubscribeChannels(Lcom/ss/bytertc/engine/RTCRoom;[Ljava/lang/String;Z)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, setSubscribeChannels failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetSubscribeChannels(J[Ljava/lang/String;Z)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static setSubscribeSpecialStream(Lcom/ss/bytertc/engine/RTCRoom;[I)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeRoomHandle(Lcom/ss/bytertc/engine/RTCRoom;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "MeetingAdvance"

    .line 12
    .line 13
    const-string p1, "room native handle is invalid, setSubscribeSpecialStream failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetSubscribeSpecialStream(J[I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static setVideoEncoderConfig(Lcom/ss/bytertc/engine/RTCEngine;Ljava/util/List;Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/bytertc/engine/RTCEngine;",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoEncoderConfig;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoEncoderConfig;",
            ">;)I"
        }
    .end annotation

    .line 1
    const-string v0, "setVideoEncoderConfig "

    .line 2
    .line 3
    const-string v1, "MeetingAdvance"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/ss/bytertc/engine/meeting/MeetingAdvance;->getNativeVideoHandle(Lcom/ss/bytertc/engine/RTCEngine;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    cmp-long p0, v2, v4

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const-string p0, "room native handle is invalid, isMuteLocalVideo failed."

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    if-nez p1, :cond_1

    .line 26
    .line 27
    return v0

    .line 28
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

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
    move-result v4

    .line 41
    const-string v5, "setVideoEncoderConfig with illegal params"

    .line 42
    .line 43
    if-eqz v4, :cond_3

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/ss/bytertc/engine/VideoEncoderConfig;

    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/ss/bytertc/engine/VideoEncoderConfig;->isValid()Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-nez v6, :cond_2

    .line 56
    .line 57
    invoke-static {v1, v5}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v0

    .line 61
    :cond_2
    new-instance v5, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    .line 62
    .line 63
    invoke-direct {v5, v4}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    if-nez p2, :cond_4

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-static {v2, v3, p0, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEncoderConfigWithMain(JLjava/util/List;Ljava/util/List;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_4
    new-instance p1, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_6

    .line 92
    .line 93
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Lcom/ss/bytertc/engine/VideoEncoderConfig;

    .line 98
    .line 99
    invoke-virtual {v4}, Lcom/ss/bytertc/engine/VideoEncoderConfig;->isValid()Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-nez v6, :cond_5

    .line 104
    .line 105
    invoke-static {v1, v5}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return v0

    .line 109
    :cond_5
    new-instance v6, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;

    .line 110
    .line 111
    invoke-direct {v6, v4}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;-><init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_6
    invoke-static {v2, v3, p0, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEncoderConfigWithMain(JLjava/util/List;Ljava/util/List;)I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    return p0
.end method

.method public static writeLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeWriteLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
