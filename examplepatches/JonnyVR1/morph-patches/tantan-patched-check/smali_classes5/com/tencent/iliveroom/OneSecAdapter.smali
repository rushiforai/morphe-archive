.class public Lcom/tencent/iliveroom/OneSecAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/iliveroom/IOneSecAdapter;


# static fields
.field private static final TAG:Ljava/lang/String; = "OneSecAdapter"

.field private static sIsLoadedSDKSuccess:Z

.field private static sOneSecAdapterInstance:Lcom/tencent/iliveroom/OneSecAdapter;


# instance fields
.field private mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/iliveroom/OneSecAdapter$1;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/tencent/iliveroom/OneSecAdapter$1;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_1
    move-exception v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :goto_0
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/tencent/iliveroom/OneSecAdapter;->sIsLoadedSDKSuccess:Z

    .line 9
    .line 10
    const-string v1, "OneSecAdapter"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string p2, "create: new OneSecAdapter"

    .line 15
    .line 16
    invoke-static {v1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance p2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v0, "new adapter = "

    .line 22
    .line 23
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, " version = "

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/iliveroom/OneSecAdapter;->getSDKVersionStr()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, " delegate = "

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {v1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance p2, Lcom/tencent/iliveroom/a/a;

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-direct {p2, p1, v0, p3}, Lcom/tencent/iliveroom/a/a;-><init>(Landroid/content/Context;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    const-string p0, "initEngine: load liteavsdk.so failed! init engine error!"

    .line 66
    .line 67
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    if-eqz p3, :cond_1

    .line 71
    .line 72
    iget-wide p0, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;->userId:J

    .line 73
    .line 74
    const/16 p2, 0x2c25

    .line 75
    .line 76
    const-string v0, "load LiteAVSDK.so failed"

    .line 77
    .line 78
    invoke-virtual {p3, p0, p1, p2, v0}, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;->onError(JILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public static create(Landroid/content/Context;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)Lcom/tencent/iliveroom/OneSecAdapter;
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/iliveroom/OneSecAdapter;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/iliveroom/OneSecAdapter;->sOneSecAdapterInstance:Lcom/tencent/iliveroom/OneSecAdapter;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/iliveroom/OneSecAdapter;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/iliveroom/OneSecAdapter;-><init>(Landroid/content/Context;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tencent/iliveroom/OneSecAdapter;->sOneSecAdapterInstance:Lcom/tencent/iliveroom/OneSecAdapter;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const-string p0, "OneSecAdapter"

    .line 23
    .line 24
    const-string p1, "create: use old OneSecAdapter."

    .line 25
    .line 26
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    sget-object p0, Lcom/tencent/iliveroom/OneSecAdapter;->sOneSecAdapterInstance:Lcom/tencent/iliveroom/OneSecAdapter;

    .line 31
    .line 32
    return-object p0

    .line 33
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method public static getSDKVersionStr()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/tencent/iliveroom/OneSecAdapter;->sIsLoadedSDKSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0

    .line 14
    :cond_0
    const-string v0, "0.0.0"

    .line 15
    .line 16
    return-object v0
.end method

.method public static setConsoleEnabled(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/tencent/iliveroom/OneSecAdapter;->sIsLoadedSDKSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setConsoleEnabled(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static setLibraryPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/f;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " addDelegate: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->addDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public clearDelegate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " clearDelegate: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->clearDelegate()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public clearLocalMixConfig()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " clearLocalMixConfig: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->clearLocalMixConfig()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public clearMixTranscodingConfig()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " clearMixTranscodingConfig: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->clearMixTranscodingConfig()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public connectOtherRoom(Ljava/lang/String;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " connectOtherRoom roomName = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " userId = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->connectOtherRoom(Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    const-class v0, Lcom/tencent/iliveroom/OneSecAdapter;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    sput-object v1, Lcom/tencent/iliveroom/OneSecAdapter;->sOneSecAdapterInstance:Lcom/tencent/iliveroom/OneSecAdapter;

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "OneSecAdapter"

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, " destroy: "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 35
    .line 36
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->destroy()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p0
.end method

.method public disconnectOtherRoom()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " disconnectOtherRoom"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->disconnectOtherRoom()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public enableAudioMessage(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " enableAudioMessage: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->enableAudioMessage(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public enableEncSmallVideoStream(ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " enableEncSmallVideoStream: enable = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " size = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " fps = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, " videoBitrate = "

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "OneSecAdapter"

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 55
    .line 56
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tencent/iliveroom/IOneSecAdapter;->enableEncSmallVideoStream(ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)I

    .line 57
    .line 58
    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public getAVStatistic()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->getAVStatistic()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;-><init>()V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public getMusicCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->getMusicCurrentPosition()J

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

.method public getMusicDuration()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->getMusicDuration()I

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

.method public joinRoom(Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " joinRoom, params = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ", config = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2}, Lcom/tencent/iliveroom/IOneSecAdapter;->joinRoom(Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public muteAllRemoteAudio(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteAllRemoteAudio: mute = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteAllRemoteAudio(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public muteAllRemoteVideo(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteAllRemoteVideo: mute = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteAllRemoteVideo(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public muteLocalAudio(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteLocalAudio: enable = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteLocalAudio(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public muteLocalVideo(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteLocalVideo: enable = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteLocalVideo(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public muteRemoteAudio(JZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteRemoteAudio: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " mute = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteRemoteAudio(JZ)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public muteRemoteVideo(JZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " muteRemoteVideo: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " mute = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->muteRemoteVideo(JZ)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " pause: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->pause()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public pauseMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " pauseMusic: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->pauseMusic()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public playEffectWithId(ILjava/lang/String;ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " playEffectWithId: effect id = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " path = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " loop = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, " loopback = "

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "OneSecAdapter"

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 55
    .line 56
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tencent/iliveroom/IOneSecAdapter;->playEffectWithId(ILjava/lang/String;ZZ)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public playMusicWithUrl(Ljava/lang/String;ZI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " playMusicWithUrl: url = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " loopback = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " repeat = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "OneSecAdapter"

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 47
    .line 48
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->playMusicWithUrl(Ljava/lang/String;ZI)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public quitRoom()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " quitRoom: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->quitRoom()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public removeDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " removeDelegate: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->removeDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " resume: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->resume()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public resumeMusic()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " resumeMusic: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->resumeMusic()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p7}, Lcom/tencent/iliveroom/IOneSecAdapter;->sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I

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

.method public sendMessageEx([B)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->sendMessageEx([B)Z

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

.method public sendStreamMessage(I[BZZ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tencent/iliveroom/IOneSecAdapter;->sendStreamMessage(I[BZZ)Z

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

.method public setAudioDelegate(Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setAudioDelegate: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setAudioDelegate(Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public setAudioExpandBlockThreshold(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setAudioExpandBlockThreshold: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setAudioExpandBlockThreshold(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setAudioExpandCountPerBlock(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setAudioExpandCountPerBlock: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setAudioExpandCountPerBlock(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setAudioMode(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setAudioRoute: mode = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setAudioMode(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setAudioVolumeIndication(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setAudioVolumeIndication: interval = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setAudioVolumeIndication(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setCustomVideoParam(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setVideoEncParams: size = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string v1, "null"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " bitrate = "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "OneSecAdapter"

    .line 43
    .line 44
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 48
    .line 49
    invoke-interface {p0, p1, p2}, Lcom/tencent/iliveroom/IOneSecAdapter;->setCustomVideoParam(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public setEffectsVolume(D)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setEffectsVolume: volume = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1, p2}, Lcom/tencent/iliveroom/IOneSecAdapter;->setEffectsVolume(D)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public setLocalMixConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setLocalMixConfig: config = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setLocalMixConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setLogPath(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setMicVolume(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setMicVolume: volume = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setMicVolume(F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setMixTranscodingConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setMixTranscodingConfig: config = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setMixTranscodingConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setMusicPitch(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setMusicPitch: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0xc

    .line 31
    .line 32
    if-gt p1, v0, :cond_1

    .line 33
    .line 34
    const/16 v0, -0xc

    .line 35
    .line 36
    if-ge p1, v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setMusicPitch(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_2
    const/4 p0, -0x2

    .line 49
    return p0
.end method

.method public setMusicPosition(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setMusicPosition: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setMusicPosition(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, -0x1

    .line 38
    return p0
.end method

.method public setMusicVolume(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setMusicVolume: volume = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setMusicVolume(F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setPlaybackVolume(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setPlaybackVolume: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    cmpg-float v0, p1, v0

    .line 32
    .line 33
    if-ltz v0, :cond_1

    .line 34
    .line 35
    const/high16 v0, 0x40800000    # 4.0f

    .line 36
    .line 37
    cmpl-float v0, p1, v0

    .line 38
    .line 39
    if-lez v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setPlaybackVolume(F)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "setPlaybackVolume: invalid volume = "

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public setPriorRemoteVideoStreamType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setPriorRemoteVideoStreamType: streamType = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setPriorRemoteVideoStreamType(I)I

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public setRemoteVideoStreamType(Ljava/lang/String;I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setRemoteVideoStreamType: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " streamType = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2}, Lcom/tencent/iliveroom/IOneSecAdapter;->setRemoteVideoStreamType(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public setSurfaceSize(JII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setSurfaceSize: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " w = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " h = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "OneSecAdapter"

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 47
    .line 48
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tencent/iliveroom/IOneSecAdapter;->setSurfaceSize(JII)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public setVideoRenderDelegate(JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setVideoRenderDelegate: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " delegate = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->setVideoRenderDelegate(JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public setVolumeOfEffect(ID)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setVolumeOfEffect: effectId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " volume = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->setVolumeOfEffect(ID)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public setVolumeType(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " setVolumeType: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->setVolumeType(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public startPublishCDNStream(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " startPublishCDNStream:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->startPublishCDNStream(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public startRemoteRender(JLandroid/view/SurfaceView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " startRemoteRender: userId "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " surface view = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "OneSecAdapter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->startRemoteRender(JLandroid/view/SurfaceView;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public startRemoteRender(JLandroid/view/TextureView;)V
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    if-eqz v0, :cond_0

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " startRemoteRender: userId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " textureView = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OneSecAdapter"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    invoke-interface {p0, p1, p2, p3}, Lcom/tencent/iliveroom/IOneSecAdapter;->startRemoteRender(JLandroid/view/TextureView;)V

    :cond_0
    return-void
.end method

.method public stopAllEffect()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopAllEffect: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopAllEffect()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public stopAllRemoteRender()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopAllRemoteRender: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopAllRemoteRender()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public stopEffectWithId(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopEffectWithId: effectId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopEffectWithId(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public stopMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopMusic: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopMusic()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public stopPublishCDNStream()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopPublishCDNStream: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "OneSecAdapter"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopPublishCDNStream()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public stopRemoteRender(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " stopRemoteRender: userId = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1, p2}, Lcom/tencent/iliveroom/IOneSecAdapter;->stopRemoteRender(J)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public switchRole(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " switchRole: role "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OneSecAdapter"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/OneSecAdapter;->mSDKInstance:Lcom/tencent/iliveroom/IOneSecAdapter;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/tencent/iliveroom/IOneSecAdapter;->switchRole(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
