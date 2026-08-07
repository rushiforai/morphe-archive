.class public Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final AUDIO_SERVER_CONFIG:Ljava/lang/String; = "trtc_audio_server_config"

.field public static final DEFAULT_16K_PACKAGE_STRATEGY:I = 0x0

.field public static final DEFAULT_DEVICE_AUTO_RESTART_MIN_INTERVAL:I = 0x1388

.field public static final DEFAULT_ENABLE_AUTO_RESTART_DEVICE:Z = false

.field public static final DEFAULT_ENABLE_OPENSL:Z = false

.field private static final DEFAULT_IS_LOW_LATENCY_SAMPLERATE_SUPPORTED:Z = false

.field private static final DEFAULT_LOW_LATENCY_SAMPLERATE_BLOCK_TIME:J

.field public static final DEFAULT_MAX_SELECTED_PLAY_STREAMS:I = 0x0

.field private static final KEY_16K_PACKAGE_STRATEGY:Ljava/lang/String; = "16k_package_strategy"

.field private static final KEY_DEVICE_AUTO_RESTART_MIN_INTERVAL:Ljava/lang/String; = "device_auto_restart_interval"

.field private static final KEY_ENABLE_AUTO_RESTART_DEVICE:Ljava/lang/String; = "enable_auto_restart_device"

.field private static final KEY_ENABLE_OPENSL:Ljava/lang/String; = "enable_opensl"

.field private static final KEY_IS_LOW_LATENCY_SAMPLERATE_SUPPORTED:Ljava/lang/String; = "is_low_latency_samplerate_supported"

.field private static final KEY_LOW_LATENCY_SAMPLERATE_BLOCK_TIME:Ljava/lang/String; = "low_latency_samplerate_block_time"

.field private static final KEY_MAX_SELECTED_PLAY_STREAMS:Ljava/lang/String; = "max_selected_play_streams"


# instance fields
.field public audio16KPackageStrategy:I

.field public deviceAutoRestartMinInterval:I

.field public enableAutoRestartDevice:Z

.field public enableOpenSL:Z

.field public isLowLatencySampleRateSupported:Z

.field public lowLatencySampleRateBlockTime:J

.field public maxSelectedPlayStreams:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x240c8400

    .line 2
    .line 3
    .line 4
    sput-wide v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->DEFAULT_LOW_LATENCY_SAMPLERATE_BLOCK_TIME:J

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableOpenSL:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 8
    .line 9
    const/16 v1, 0x1388

    .line 10
    .line 11
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->deviceAutoRestartMinInterval:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->audio16KPackageStrategy:I

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->maxSelectedPlayStreams:I

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->isLowLatencySampleRateSupported:Z

    .line 18
    .line 19
    sget-wide v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->DEFAULT_LOW_LATENCY_SAMPLERATE_BLOCK_TIME:J

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->lowLatencySampleRateBlockTime:J

    .line 22
    .line 23
    return-void
.end method

.method public static loadFromSharedPreferences(Landroid/content/Context;)Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;
    .locals 5

    .line 1
    const-class v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;

    .line 5
    .line 6
    invoke-direct {v1}, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v2, "trtc_audio_server_config"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v2, "enable_opensl"

    .line 17
    .line 18
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iput-boolean v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableOpenSL:Z

    .line 23
    .line 24
    const-string v2, "enable_auto_restart_device"

    .line 25
    .line 26
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iput-boolean v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 31
    .line 32
    const-string v2, "device_auto_restart_interval"

    .line 33
    .line 34
    const/16 v4, 0x1388

    .line 35
    .line 36
    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iput v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->deviceAutoRestartMinInterval:I

    .line 41
    .line 42
    const-string v2, "16k_package_strategy"

    .line 43
    .line 44
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iput v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->audio16KPackageStrategy:I

    .line 49
    .line 50
    const-string v2, "max_selected_play_streams"

    .line 51
    .line 52
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->maxSelectedPlayStreams:I

    .line 57
    .line 58
    const-string v2, "is_low_latency_samplerate_supported"

    .line 59
    .line 60
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iput-boolean v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->isLowLatencySampleRateSupported:Z

    .line 65
    .line 66
    const-string v2, "low_latency_samplerate_block_time"

    .line 67
    .line 68
    sget-wide v3, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->DEFAULT_LOW_LATENCY_SAMPLERATE_BLOCK_TIME:J

    .line 69
    .line 70
    invoke-interface {p0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    iput-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->lowLatencySampleRateBlockTime:J

    .line 75
    .line 76
    monitor-exit v0

    .line 77
    return-object v1

    .line 78
    :catchall_0
    move-exception p0

    .line 79
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    throw p0
.end method

.method public static saveToSharedPreferences(Landroid/content/Context;Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;)V
    .locals 4

    .line 1
    const-class v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "trtc_audio_server_config"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "enable_opensl"

    .line 16
    .line 17
    iget-boolean v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableOpenSL:Z

    .line 18
    .line 19
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    const-string v1, "enable_auto_restart_device"

    .line 23
    .line 24
    iget-boolean v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 25
    .line 26
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    const-string v1, "device_auto_restart_interval"

    .line 30
    .line 31
    iget v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->deviceAutoRestartMinInterval:I

    .line 32
    .line 33
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 34
    .line 35
    .line 36
    const-string v1, "16k_package_strategy"

    .line 37
    .line 38
    iget v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->audio16KPackageStrategy:I

    .line 39
    .line 40
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 41
    .line 42
    .line 43
    const-string v1, "max_selected_play_streams"

    .line 44
    .line 45
    iget v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->maxSelectedPlayStreams:I

    .line 46
    .line 47
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    const-string v1, "is_low_latency_samplerate_supported"

    .line 51
    .line 52
    iget-boolean v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->isLowLatencySampleRateSupported:Z

    .line 53
    .line 54
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 55
    .line 56
    .line 57
    const-string v1, "low_latency_samplerate_block_time"

    .line 58
    .line 59
    iget-wide v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->lowLatencySampleRateBlockTime:J

    .line 60
    .line 61
    invoke-interface {p0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 62
    .line 63
    .line 64
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 65
    .line 66
    .line 67
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableOpenSL: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableOpenSL:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", enableAutoRestartDevice: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", deviceAutoRestartMinInterval: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->deviceAutoRestartMinInterval:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", audio16KPackageStrategy: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->audio16KPackageStrategy:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", isLowLatencySampleRateSupported: "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->isLowLatencySampleRateSupported:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", lowLatencySampleRateBlockTime: "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->lowLatencySampleRateBlockTime:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
