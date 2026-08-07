.class public Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final KEY_ENABLE_DEC_VUI:Ljava/lang/String; = "enable_hw_vui"

.field private static final VIDEO_SERVER_CONFIG:Ljava/lang/String; = "trtc_video_server_config"


# instance fields
.field public enableHWVUI:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 6
    .line 7
    return-void
.end method

.method public static loadFromSharedPreferences(Landroid/content/Context;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;
    .locals 4

    .line 1
    const-class v0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 5
    .line 6
    invoke-direct {v1}, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v2, "trtc_video_server_config"

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
    const-string v2, "enable_hw_vui"

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iput-boolean p0, v1, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-object v1

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public static saveToSharedPreferences(Landroid/content/Context;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V
    .locals 3

    .line 1
    const-class v0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "trtc_video_server_config"

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
    const-string v1, "enable_hw_vui"

    .line 16
    .line 17
    iget-boolean p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 18
    .line 19
    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 23
    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableHWVUI: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
