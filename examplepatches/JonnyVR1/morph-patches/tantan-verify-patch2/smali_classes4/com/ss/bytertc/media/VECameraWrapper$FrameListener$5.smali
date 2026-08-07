.class Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->shutdown()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

.field final synthetic val$stopSignal:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->val$stopSignal:Ljava/util/concurrent/CountDownLatch;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 6
    .line 7
    iget-boolean v1, v1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1900(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Ljava/util/concurrent/Semaphore;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1900(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Ljava/util/concurrent/Semaphore;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1800(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->val$stopSignal:Ljava/util/concurrent/CountDownLatch;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mStopped:Z

    .line 49
    .line 50
    return-void
.end method
