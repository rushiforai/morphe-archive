.class public abstract Lio/agora/spatialaudio/ILocalSpatialAudioEngine;
.super Lio/agora/spatialaudio/IBaseSpatialAudioEngine;


# static fields
.field private static mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/spatialaudio/IBaseSpatialAudioEngine;-><init>()V

    return-void
.end method

.method public static declared-synchronized create()Lio/agora/spatialaudio/ILocalSpatialAudioEngine;
    .locals 2

    const-class v0, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;->mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;

    if-nez v1, :cond_0

    new-instance v1, Lio/agora/spatialaudio/internal/LocalSpatialAudioImpl;

    invoke-direct {v1}, Lio/agora/spatialaudio/internal/LocalSpatialAudioImpl;-><init>()V

    sput-object v1, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;->mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :cond_0
    :goto_0
    sget-object v1, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;->mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    const-class v0, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;->mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lio/agora/spatialaudio/IBaseSpatialAudioEngine;->release()I

    const/4 v1, 0x0

    sput-object v1, Lio/agora/spatialaudio/ILocalSpatialAudioEngine;->mInstance:Lio/agora/spatialaudio/ILocalSpatialAudioEngine;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method public abstract clearRemotePositionsEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract initialize(Lio/agora/spatialaudio/LocalSpatialAudioConfig;)I
.end method

.method public abstract removeRemotePosition(I)I
.end method

.method public abstract removeRemotePositionEx(ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteAudioAttenuation(IDZ)I
.end method

.method public abstract updateRemotePosition(ILio/agora/spatialaudio/RemoteVoicePositionInfo;)I
.end method

.method public abstract updateRemotePositionEx(ILio/agora/spatialaudio/RemoteVoicePositionInfo;Lio/agora/rtc2/RtcConnection;)I
.end method
