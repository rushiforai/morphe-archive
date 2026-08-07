.class public Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;,
        Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "YtFSM"

.field public static instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;


# instance fields
.field public checkUpdateTimerFlag:Z

.field public currentImageData:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

.field public currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

.field public currentStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

.field public currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

.field public eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

.field public eventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public feedTimeMs:J

.field public firstStateName:Ljava/lang/String;

.field public isStarted:Z

.field public needEventHandler:Z

.field public sdkPlatformContex:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

.field public startStopLock:Ljava/util/concurrent/locks/Lock;

.field public stateLock:Ljava/util/concurrent/locks/Lock;

.field public stateMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;",
            ">;"
        }
    .end annotation
.end field

.field public updateEventHandler:Ljava/lang/Thread;

.field public updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_UNKNOWN:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->needEventHandler:Z

    .line 12
    .line 13
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;->CacheStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->feedTimeMs:J

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->checkUpdateTimerFlag:Z

    .line 23
    .line 24
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 30
    .line 31
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateLock:Ljava/util/concurrent/locks/Lock;

    .line 37
    .line 38
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 44
    .line 45
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 51
    .line 52
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 58
    .line 59
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->needEventHandler:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentImageData:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1102(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/common/YTImageData;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentImageData:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->feedTimeMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->firstStateName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->checkUpdateTimerFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$802(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->checkUpdateTimerFlag:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$900(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/locks/Lock;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    return-object p0
.end method

.method public static declared-synchronized clearInstance()V
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw v1
.end method

.method public static declared-synchronized getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

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
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->instance:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
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


# virtual methods
.method public cleanUpQueue()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sdkPlatformContex:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sdkPlatformContex:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sdkPlatformContex:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 13
    .line 14
    return-object p0
.end method

.method public getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 25
    .line 26
    const-string p2, "Handle event failed:"

    .line 27
    .line 28
    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public handlePauseEvent()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->onPause()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public handleResumeEvent()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->onResume()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public registerState(Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->registerStateName(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public reset()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "FSM reset work mode "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "reset"

    .line 23
    .line 24
    :try_start_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, "handle reset failed:"

    .line 45
    .line 46
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public sendFSMEvent(Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const-string v0, "process_action"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->makePackUseTime()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->makeCatchErrorData()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v4, "FSM EVENT:"

    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v4, "\n"

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v4, "OPERATE"

    .line 58
    .line 59
    invoke-static {v4, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    const-string v3, "operate_catch_error"

    .line 63
    .line 64
    invoke-virtual {p1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const-string v2, "operate_pack_use_time"

    .line 68
    .line 69
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    :cond_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v3, "send framework event result: "

    .line 77
    .line 78
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v0, " errorcode:"

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v0, "error_code"

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v2, "eventDict="

    .line 114
    .line 115
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

    .line 129
    .line 130
    invoke-interface {p0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;->onFrameworkEvent(Ljava/util/HashMap;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 135
    .line 136
    const-string p1, "Event listener not init"

    .line 137
    .line 138
    const/4 v0, 0x0

    .line 139
    invoke-static {p0, p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public sendNetworkRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$2;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$2;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

    .line 14
    .line 15
    invoke-interface {p0, p2, p3, p4, p5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;->onNetworkRequestEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "Event listener not init"

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-static {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setContext(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sdkPlatformContex:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 2
    .line 3
    return-void
.end method

.method public setEventListener(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->eventListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;

    .line 2
    .line 3
    return-void
.end method

.method public start(Ljava/lang/String;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;IJII)V
    .locals 7

    .line 1
    const-string v0, "Start "

    .line 2
    .line 3
    const-string v1, "start set current state:"

    .line 4
    .line 5
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "FSM start use work mode "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 25
    .line 26
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 27
    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->firstStateName:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    iput-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 39
    .line 40
    iput-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->needEventHandler:Z

    .line 41
    .line 42
    iput-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->checkUpdateTimerFlag:Z

    .line 43
    .line 44
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 45
    .line 46
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    :try_start_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 68
    .line 69
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->firstStateName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception v0

    .line 84
    move-object p1, v0

    .line 85
    move-object v1, p0

    .line 86
    goto/16 :goto_5

    .line 87
    .line 88
    :catch_0
    move-exception v0

    .line 89
    move-object p1, v0

    .line 90
    move-object v1, p0

    .line 91
    goto :goto_4

    .line 92
    :cond_0
    :try_start_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p1, " failed which is not found"

    .line 101
    .line 102
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const/4 p2, 0x0

    .line 110
    invoke-static {v2, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 116
    .line 117
    .line 118
    new-instance p1, Ljava/lang/Thread;

    .line 119
    .line 120
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 121
    .line 122
    move-object v1, p0

    .line 123
    move v2, p3

    .line 124
    move-wide v5, p4

    .line 125
    move v3, p6

    .line 126
    move v4, p7

    .line 127
    :try_start_3
    invoke-direct/range {v0 .. v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;IIIJ)V

    .line 128
    .line 129
    .line 130
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 131
    .line 132
    .line 133
    iput-object p1, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateEventHandler:Ljava/lang/Thread;

    .line 134
    .line 135
    const-string p0, "YtEventUpdateThread"

    .line 136
    .line 137
    invoke-virtual {p1, p0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateEventHandler:Ljava/lang/Thread;

    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catchall_1
    move-exception v0

    .line 147
    :goto_1
    move-object p1, v0

    .line 148
    goto :goto_5

    .line 149
    :catch_1
    move-exception v0

    .line 150
    :goto_2
    move-object p1, v0

    .line 151
    goto :goto_4

    .line 152
    :catchall_2
    move-exception v0

    .line 153
    move-object v1, p0

    .line 154
    goto :goto_1

    .line 155
    :catch_2
    move-exception v0

    .line 156
    move-object v1, p0

    .line 157
    goto :goto_2

    .line 158
    :cond_1
    move-object v1, p0

    .line 159
    :goto_3
    iget-object p0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 160
    .line 161
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :goto_4
    :try_start_4
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 166
    .line 167
    const-string p2, "FSM error"

    .line 168
    .line 169
    invoke-static {p0, p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 181
    .line 182
    .line 183
    iget-object p0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 184
    .line 185
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :goto_5
    iget-object p0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 190
    .line 191
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 192
    .line 193
    .line 194
    throw p1
.end method

.method public stop()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "FSM stop work mode "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentWorkMode:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->needEventHandler:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateEventHandler:Ljava/lang/Thread;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateEventHandler:Ljava/lang/Thread;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Thread;->join()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_3

    .line 48
    :catch_0
    move-exception v0

    .line 49
    goto :goto_2

    .line 50
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->unload()V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 93
    .line 94
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :goto_2
    :try_start_1
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 99
    .line 100
    const-string v2, "FSM strop error"

    .line 101
    .line 102
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 117
    .line 118
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :goto_3
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->startStopLock:Ljava/util/concurrent/locks/Lock;

    .line 123
    .line 124
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 125
    .line 126
    .line 127
    throw v0
.end method

.method public transitNextRound(Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "transitnextround set current state:"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    return v1

    .line 47
    :cond_0
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "transitnextround faild:"

    .line 57
    .line 58
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p1, " state is not found"

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/4 v0, 0x0

    .line 74
    invoke-static {p0, p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    return v1
.end method

.method public transitNow(Ljava/lang/String;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "transitnow set current state:"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentImageData:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentState:Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 52
    .line 53
    iget-wide v1, p1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->timeStamp:J

    .line 54
    .line 55
    invoke-virtual {p0, p1, v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return v0

    .line 59
    :cond_1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 60
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v1, "transitnow failed:"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p1, " state is not found"

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-static {p0, p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, -0x1

    .line 85
    return p0
.end method

.method public update([BIIJ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->isStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    const-string p1, "imageData == null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    array-length v0, p1

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 19
    .line 20
    const-string p1, "imageData.length == 0"

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :try_start_0
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-direct {v0, p0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, [B

    .line 50
    .line 51
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageData:[B

    .line 52
    .line 53
    iput p2, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageWidth:I

    .line 54
    .line 55
    iput p3, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageHeight:I

    .line 56
    .line 57
    iput-wide p4, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->timeStamp:J

    .line 58
    .line 59
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catch_0
    move-exception p1

    .line 66
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->TAG:Ljava/lang/String;

    .line 67
    .line 68
    const-string p3, "YtFSMUpdateData create fail"

    .line 69
    .line 70
    invoke-static {p2, p3, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide p1

    .line 77
    iput-wide p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->feedTimeMs:J

    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public updateCacheStrategy(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->currentStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 2
    .line 3
    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->stateMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->updateSDKSetting(Lorg/json/JSONObject;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method
