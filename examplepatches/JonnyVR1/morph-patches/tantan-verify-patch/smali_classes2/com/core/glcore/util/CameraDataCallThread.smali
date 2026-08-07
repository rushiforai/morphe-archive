.class public Lcom/core/glcore/util/CameraDataCallThread;
.super Landroid/os/HandlerThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;
    }
.end annotation


# static fields
.field private static final WHAT_DELAY:I = 0x3e8


# instance fields
.field private cameraDataCallback:Ll/xpl$b;

.field private duration:I

.field private handler:Landroid/os/Handler;

.field private final object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILl/xpl$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/core/glcore/util/CameraDataCallThread;->object:Ljava/lang/Object;

    .line 10
    .line 11
    const/16 p1, 0x3e8

    .line 12
    .line 13
    div-int/2addr p1, p2

    .line 14
    iput p1, p0, Lcom/core/glcore/util/CameraDataCallThread;->duration:I

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic access$100(Lcom/core/glcore/util/CameraDataCallThread;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/CameraDataCallThread;->object:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/core/glcore/util/CameraDataCallThread;)Ll/xpl$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic access$300(Lcom/core/glcore/util/CameraDataCallThread;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/CameraDataCallThread;->duration:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/core/glcore/util/CameraDataCallThread;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/CameraDataCallThread;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public destroyThread()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/CameraDataCallThread;->object:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    iget-object v0, p0, Lcom/core/glcore/util/CameraDataCallThread;->handler:Landroid/os/Handler;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0
.end method

.method public declared-synchronized start()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/core/glcore/util/CameraDataCallThread;->object:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception v1

    .line 12
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 13
    :try_start_3
    throw v1

    .line 14
    :catchall_1
    move-exception v0

    .line 15
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 16
    throw v0
.end method
