.class public Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "YtSDKKitFramework"

.field public static instance:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;


# instance fields
.field public defaultUpdateTimeoutMS:J

.field public detectRect:Landroid/graphics/Rect;

.field public detectRectInset:Landroid/graphics/Rect;

.field public eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

.field public networkRequestTimeoutMS:I

.field public previewRect:Landroid/graphics/Rect;

.field public sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->previewRect:Landroid/graphics/Rect;

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRect:Landroid/graphics/Rect;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Rect;

    .line 20
    .line 21
    const/16 v2, 0xa

    .line 22
    .line 23
    const/16 v3, 0x6e

    .line 24
    .line 25
    invoke-direct {v0, v2, v3, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRectInset:Landroid/graphics/Rect;

    .line 29
    .line 30
    const v0, 0xea60

    .line 31
    .line 32
    .line 33
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->networkRequestTimeoutMS:I

    .line 34
    .line 35
    const-wide/16 v2, 0x1f40

    .line 36
    .line 37
    iput-wide v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->defaultUpdateTimeoutMS:J

    .line 38
    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    return-void
.end method

.method public static declared-synchronized clearInstance()V
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v1

    .line 10
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v1
.end method

.method public static declared-synchronized getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method private parseStateFrom(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    .line 16
    :try_start_1
    invoke-virtual {v0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :catchall_1
    move-exception p2

    .line 23
    move-object v0, p0

    .line 24
    move-object p0, p2

    .line 25
    :goto_0
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 26
    .line 27
    new-instance p3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "Parse state "

    .line 30
    .line 31
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "failed:"

    .line 38
    .line 39
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p2, p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method


# virtual methods
.method public deInit()I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "YouTu SDK Kit framework is not started!!!"

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/16 p0, -0x800

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "sdk framework  deInit"

    .line 29
    .line 30
    invoke-static {p0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    const-class p0, Lcom/tencent/youtu/sdkkitframework/net/a;

    .line 34
    .line 35
    monitor-enter p0

    .line 36
    :try_start_0
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/net/a;->b:Lcom/tencent/youtu/sdkkitframework/net/a;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v3, v2, Lcom/tencent/youtu/sdkkitframework/net/a;->a:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Ljava/util/Map$Entry;

    .line 61
    .line 62
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    if-nez v5, :cond_1

    .line 67
    .line 68
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/net/a;->a:Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "network remove "

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    const-string v3, "a"

    .line 99
    .line 100
    invoke-static {v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catchall_0
    move-exception v0

    .line 105
    goto :goto_1

    .line 106
    :cond_2
    :goto_0
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/net/a;->b:Lcom/tencent/youtu/sdkkitframework/net/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    monitor-exit p0

    .line 109
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stop()V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->clearInstance()V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->exitState()V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->clearInstance()V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->clear()V

    .line 134
    .line 135
    .line 136
    return v0

    .line 137
    :goto_1
    monitor-exit p0

    .line 138
    throw v0
.end method

.method public doPause()V
    .locals 1

    .line 1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "sdk framework  doPause"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->handlePauseEvent()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public doResume()V
    .locals 1

    .line 1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "sdk framework  doResume"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->handleResumeEvent()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public fireEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getDetectRect()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetworkRequestTimeoutMS()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->networkRequestTimeoutMS:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlatformContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPreviewRect()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->previewRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;Ljava/util/ArrayList;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;)I
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;",
            "Lorg/json/JSONObject;",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;",
            ")I"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p5

    .line 8
    .line 9
    const-string v0, "resource_download_path"

    .line 10
    .line 11
    const-string v5, "init module error:"

    .line 12
    .line 13
    sget-object v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v7, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v8, "SDK init sdk config JSON:"

    .line 18
    .line 19
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v8

    .line 26
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-static {v6, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v7, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 37
    .line 38
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    const/4 v8, 0x0

    .line 43
    if-eqz v7, :cond_0

    .line 44
    .line 45
    const-string v0, "YouTu SDK Kit framework is started!!!"

    .line 46
    .line 47
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    const/16 v0, -0x800

    .line 51
    .line 52
    return v0

    .line 53
    :cond_0
    iget-object v7, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->sdkKitFrameworkStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 54
    .line 55
    const/4 v9, 0x1

    .line 56
    invoke-virtual {v7, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 57
    .line 58
    .line 59
    const/4 v7, -0x1

    .line 60
    if-nez v2, :cond_1

    .line 61
    .line 62
    const-string v0, "Context cannot be null"

    .line 63
    .line 64
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return v7

    .line 68
    :cond_1
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    if-eqz v9, :cond_2

    .line 73
    .line 74
    const-string v0, "Pipeline state name cannot be empty"

    .line 75
    .line 76
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    return v7

    .line 80
    :cond_2
    if-nez v4, :cond_3

    .line 81
    .line 82
    const-string v0, "Event listener cannot be null"

    .line 83
    .line 84
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    return v7

    .line 88
    :cond_3
    new-instance v7, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;

    .line 89
    .line 90
    invoke-direct {v7}, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;-><init>()V

    .line 91
    .line 92
    .line 93
    move-object/from16 v11, p3

    .line 94
    .line 95
    invoke-virtual {v7, v11, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;->updateSDKConfig(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;Lorg/json/JSONObject;)I

    .line 96
    .line 97
    .line 98
    const-string v9, "resource_online"

    .line 99
    .line 100
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    const-string v12, "parse json error:"

    .line 105
    .line 106
    if-eqz v10, :cond_6

    .line 107
    .line 108
    const/4 v10, -0x2

    .line 109
    :try_start_0
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v13

    .line 113
    if-eqz v13, :cond_5

    .line 114
    .line 115
    const-string v13, "model validity md5 start"

    .line 116
    .line 117
    invoke-static {v6, v13}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v13

    .line 124
    if-eqz v13, :cond_4

    .line 125
    .line 126
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v13, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;

    .line 131
    .line 132
    invoke-direct {v13}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v13, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->md5ValidityByDir(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget-object v13, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 140
    .line 141
    if-eq v0, v13, :cond_5

    .line 142
    .line 143
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const-string v3, "\u6a21\u578b\u521d\u59cb\u5316\u5931\u8d25"

    .line 148
    .line 149
    const v7, 0x49445

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, v7, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 153
    .line 154
    .line 155
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$1;

    .line 156
    .line 157
    invoke-direct {v2, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$1;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v4, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;->onFrameworkEvent(Ljava/util/HashMap;)V

    .line 161
    .line 162
    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 180
    .line 181
    .line 182
    return v10

    .line 183
    :catch_0
    move-exception v0

    .line 184
    goto :goto_0

    .line 185
    :cond_4
    const-string v0, "resource_download_path is null"

    .line 186
    .line 187
    invoke-static {v6, v0, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .line 189
    .line 190
    return v10

    .line 191
    :cond_5
    const-string v0, "model validity md5 done"

    .line 192
    .line 193
    invoke-static {v6, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :goto_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return v10

    .line 214
    :cond_6
    :goto_1
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    const/4 v5, 0x0

    .line 219
    if-eqz v0, :cond_7

    .line 220
    .line 221
    :try_start_1
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 225
    goto :goto_2

    .line 226
    :catch_1
    move-exception v0

    .line 227
    sget-object v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 228
    .line 229
    const-string v8, "json getBoolean \'resource_online\' error"

    .line 230
    .line 231
    invoke-static {v6, v8, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 235
    .line 236
    .line 237
    move-result-object v6

    .line 238
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v6, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :cond_7
    move v0, v5

    .line 246
    :goto_2
    if-nez v0, :cond_8

    .line 247
    .line 248
    const-string v0, "YTLiveness"

    .line 249
    .line 250
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/FileUtils;->loadLibrary(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    :cond_8
    const-string v0, "need_bugly_shared"

    .line 254
    .line 255
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 256
    .line 257
    .line 258
    move-result v6

    .line 259
    if-eqz v6, :cond_a

    .line 260
    .line 261
    :try_start_2
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_9

    .line 266
    .line 267
    iget-object v0, v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 268
    .line 269
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->openBuglyShared(Landroid/content/Context;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 270
    .line 271
    .line 272
    goto :goto_3

    .line 273
    :catch_2
    move-exception v0

    .line 274
    goto :goto_4

    .line 275
    :cond_9
    :goto_3
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 276
    .line 277
    const-string v6, "update bugly shared data"

    .line 278
    .line 279
    invoke-static {v0, v6}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    goto :goto_5

    .line 283
    :goto_4
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 284
    .line 285
    invoke-static {v1, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 286
    .line 287
    .line 288
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    const/4 v0, -0x3

    .line 300
    return v0

    .line 301
    :cond_a
    :goto_5
    const-string v0, "screen_orientation"

    .line 302
    .line 303
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 304
    .line 305
    .line 306
    move-result v6

    .line 307
    if-eqz v6, :cond_b

    .line 308
    .line 309
    :try_start_3
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v0
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 313
    move v15, v0

    .line 314
    goto :goto_6

    .line 315
    :catch_3
    move-exception v0

    .line 316
    sget-object v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 317
    .line 318
    invoke-static {v6, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 319
    .line 320
    .line 321
    :cond_b
    move v15, v5

    .line 322
    :goto_6
    const-string v0, "rear_camera_tag"

    .line 323
    .line 324
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 325
    .line 326
    .line 327
    move-result v6

    .line 328
    if-eqz v6, :cond_c

    .line 329
    .line 330
    :try_start_4
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    move-result v0
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 334
    move/from16 v16, v0

    .line 335
    .line 336
    goto :goto_7

    .line 337
    :catch_4
    move-exception v0

    .line 338
    sget-object v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 339
    .line 340
    invoke-static {v6, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 341
    .line 342
    .line 343
    :cond_c
    move/from16 v16, v5

    .line 344
    .line 345
    :goto_7
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stop()V

    .line 350
    .line 351
    .line 352
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->setEventListener(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;)V

    .line 357
    .line 358
    .line 359
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->setContext(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    if-eqz v2, :cond_d

    .line 375
    .line 376
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    check-cast v2, Ljava/lang/String;

    .line 381
    .line 382
    invoke-direct {v1, v2, v3, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->parseStateFrom(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 383
    .line 384
    .line 385
    move-result-object v2

    .line 386
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    invoke-virtual {v4, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->registerState(Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;)I

    .line 391
    .line 392
    .line 393
    goto :goto_8

    .line 394
    :cond_d
    const-string v0, "thread_priority"

    .line 395
    .line 396
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 397
    .line 398
    .line 399
    move-result v2

    .line 400
    if-eqz v2, :cond_e

    .line 401
    .line 402
    :try_start_5
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 403
    .line 404
    .line 405
    move-result v0
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 406
    :goto_9
    move v12, v0

    .line 407
    goto :goto_a

    .line 408
    :catch_5
    move-exception v0

    .line 409
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 410
    .line 411
    const-string v4, "failed to get priority "

    .line 412
    .line 413
    invoke-static {v2, v4, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 414
    .line 415
    .line 416
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-virtual {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    :cond_e
    const/16 v0, -0x14

    .line 428
    .line 429
    goto :goto_9

    .line 430
    :goto_a
    iget-wide v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->defaultUpdateTimeoutMS:J

    .line 431
    .line 432
    const-string v2, "frame_update_timeout_ms"

    .line 433
    .line 434
    invoke-virtual {v3, v2, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 435
    .line 436
    .line 437
    move-result-wide v13

    .line 438
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 439
    .line 440
    .line 441
    move-result-object v9

    .line 442
    move-object/from16 v1, p4

    .line 443
    .line 444
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    move-object v10, v0

    .line 449
    check-cast v10, Ljava/lang/String;

    .line 450
    .line 451
    invoke-virtual/range {v9 .. v16}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->start(Ljava/lang/String;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;IJII)V

    .line 452
    .line 453
    .line 454
    return v5
.end method

.method public reset()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "sdk framework  reset"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$2;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$2;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setDetectRect(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "sdk framework detectRect\uff1a"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRect:Landroid/graphics/Rect;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "detectRect is null"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setNetworkRequestTimeoutMS(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->networkRequestTimeoutMS:I

    .line 5
    .line 6
    return-void
.end method

.method public setPreviewRect(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "sdk framework previewRect\uff1a"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->previewRect:Landroid/graphics/Rect;

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Rect;

    .line 29
    .line 30
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRectInset:Landroid/graphics/Rect;

    .line 33
    .line 34
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    add-int/2addr v1, v3

    .line 37
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    iget v4, v2, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    add-int/2addr v3, v4

    .line 42
    iget v4, p1, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    iget v5, v2, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    sub-int/2addr v4, v5

    .line 47
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    sub-int/2addr p1, v2

    .line 52
    invoke-direct {v0, v1, v3, v4, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->detectRect:Landroid/graphics/Rect;

    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    const-string p0, "previewRect is null"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateSDKSetting(Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateWithFrameData([BIII)I
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    const-wide v0, 0xdc6acfac00L

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p0, v4, v0

    .line 11
    .line 12
    if-gtz p0, :cond_0

    .line 13
    .line 14
    const p0, 0x300003

    .line 15
    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v1, p1

    .line 23
    move v2, p2

    .line 24
    move v3, p3

    .line 25
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->update([BIIJ)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public version()Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->getFrameworkVersion()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "so not load"

    .line 10
    .line 11
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string p0, ""

    .line 26
    .line 27
    return-object p0
.end method
