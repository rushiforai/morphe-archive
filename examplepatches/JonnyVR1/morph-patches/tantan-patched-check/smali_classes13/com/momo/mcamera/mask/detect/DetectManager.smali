.class public Lcom/momo/mcamera/mask/detect/DetectManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/detect/IDetectManager;


# static fields
.field private static volatile instance:Lcom/momo/mcamera/mask/detect/DetectManager;


# instance fields
.field private expressDetectListener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

.field private expressDetectListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;",
            ">;"
        }
    .end annotation
.end field

.field private expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

.field private gestureDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

.field private gestureDetectListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;",
            ">;"
        }
    .end annotation
.end field

.field private gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

.field private objectDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

.field private objectDetectListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;",
            ">;"
        }
    .end annotation
.end field

.field private objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

.field private pickNoiseDetectListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile pickNoiseOpen:Z

.field private pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 46
    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseOpen:Z

    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 69
    .line 70
    .line 71
    new-instance v0, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 72
    .line 73
    const/4 v1, 0x0

    .line 74
    invoke-direct {v0, v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;-><init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 78
    .line 79
    new-instance v0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 80
    .line 81
    invoke-direct {v0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 85
    .line 86
    new-instance v0, Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 87
    .line 88
    invoke-direct {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 92
    .line 93
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/detect/DetectManager;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/detect/DetectManager;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/detect/DetectManager;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/detect/DetectManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopObjectDetectInner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/detect/DetectManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopGestureDetectInner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/detect/DetectManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopExpressDetectInner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/mask/detect/DetectManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopPickNoseDetectInner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getExpressDetectListener()Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/detect/DetectManager$3;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$3;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 13
    .line 14
    return-object p0
.end method

.method private getGestureDetectListener()Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/detect/DetectManager$2;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$2;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 13
    .line 14
    return-object p0
.end method

.method public static getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/detect/DetectManager;->instance:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/momo/mcamera/mask/detect/DetectManager;->instance:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/momo/mcamera/mask/detect/DetectManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/momo/mcamera/mask/detect/DetectManager;->instance:Lcom/momo/mcamera/mask/detect/DetectManager;

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
    sget-object v0, Lcom/momo/mcamera/mask/detect/DetectManager;->instance:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 27
    .line 28
    return-object v0
.end method

.method private getObjectDetectListener()Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/detect/DetectManager$1;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$1;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 13
    .line 14
    return-object p0
.end method

.method private declared-synchronized stopExpressDetectInner()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->stopDetect()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->clearAllExpressDetectListener()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw v0
.end method

.method private declared-synchronized stopGestureDetectInner()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->stopDetect()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->clearAllGestureDetectListener()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw v0
.end method

.method private declared-synchronized stopObjectDetectInner()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->stopDetect()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->clearAllObjectDetectListener()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw v0
.end method

.method private stopPickNoseDetect()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/momo/mcamera/mask/detect/DetectManager$7;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$7;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x2ee

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private declared-synchronized stopPickNoseDetectInner()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->release()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->clearAllPickNoiseDetectListener()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method


# virtual methods
.method public clearAll()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopExpressDetect()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopGestureDetect()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopObjectDetect()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopPickNoseDetect()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public clearAllExpressDetectListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearAllGestureDetectListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearAllObjectDetectListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearAllPickNoiseDetectListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public isExpressDetectOpened()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isGestureDetectOpened()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isObjectDetectOpened()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public registerExpressDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public registerGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public registerObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public registerPickNoiseDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopExpressDetectInner()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopGestureDetectInner()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopObjectDetectInner()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopPickNoseDetectInner()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public removeExpressDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public removeGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public removeObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectListeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public removePickNoiseDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public declared-synchronized setExpressModelPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setModelPath(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public setGestureDetectInterval(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->setDetectInterval(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setGestureModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/jxk;->e()Ll/jxk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/jxk;->g(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setHandGestureType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->setHandGestureType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->setMMCVInfo(Ll/omw;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_2

    .line 22
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->setMMCVInfo(Ll/omw;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setMMCVInfo(Ll/omw;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseOpen:Z

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->process(Ll/omw;)Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseDetectListeners:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;

    .line 83
    .line 84
    invoke-interface {v1, p1}, Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;->onPickNoseDetected(Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    monitor-exit p0

    .line 89
    return-void

    .line 90
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p1
.end method

.method public setObjectDetectInterval(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->setDetectInterval(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setObjectModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/c950;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized setPickNoiseDetect(Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseOpen:Z

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoiseOpen:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 v0, 0x2ee

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    new-instance p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->pickNoseDetector:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopPickNoseDetect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public declared-synchronized startExpressDetect()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/16 v1, 0x2eb

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->getExpressDetectListener()Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setExpressDetectListener(Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->startDetect()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->expressDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    :cond_1
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw v0
.end method

.method public declared-synchronized startGestureDetect()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/16 v1, 0x2ec

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->getGestureDetectListener()Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetector:Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->startDetect()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->gestureDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    :cond_1
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw v0
.end method

.method public declared-synchronized startObjectDetect()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/16 v1, 0x2ed

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {v0, v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;-><init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->getObjectDetectListener()Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetector:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->startDetect()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager;->objectDetectOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    :cond_1
    monitor-exit p0

    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw v0
.end method

.method public stopExpressDetect()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/momo/mcamera/mask/detect/DetectManager$6;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$6;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x2eb

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public stopGestureDetect()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/momo/mcamera/mask/detect/DetectManager$5;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$5;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x2ec

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public stopObjectDetect()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/momo/mcamera/mask/detect/DetectManager$4;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/detect/DetectManager$4;-><init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x2ed

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
