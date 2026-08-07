.class Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2000(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$2200(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    new-instance v3, Ll/oxk0;

    .line 38
    .line 39
    invoke-direct {v3, v2}, Ll/oxk0;-><init>(Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v3}, Lcom/ss/android/ttvecamera/d;->h(Lcom/ss/android/ttvecamera/TECameraSettings$g;)I

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$2300(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Landroid/os/Handler;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-wide/16 v1, 0x5dc

    .line 56
    .line 57
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method
