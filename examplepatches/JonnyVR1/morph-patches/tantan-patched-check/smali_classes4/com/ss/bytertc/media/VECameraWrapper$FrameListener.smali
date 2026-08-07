.class Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/irh0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FrameListener"
.end annotation


# instance fields
.field private frameCountReturned:J

.field private frameCountSent:J

.field mEglBase:Lcom/bytedance/realx/video/EglBase;

.field private mFreeTexSema:Ljava/util/concurrent/Semaphore;

.field private mHandler:Landroid/os/Handler;

.field private final mISO:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mISOPeriodMillis:I

.field mIsFirstFrame:Z

.field private mSendTexFrameStart:J

.field mStopped:Z

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTexId:I

.field private mTexMat:Landroid/graphics/Matrix;

.field private mThread:Landroid/os/HandlerThread;

.field private mTimestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

.field private mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;

.field private updateISO:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mIsFirstFrame:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mStopped:Z

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexId:I

    .line 17
    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mThread:Landroid/os/HandlerThread;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexMat:Landroid/graphics/Matrix;

    .line 27
    .line 28
    new-instance v1, Lcom/bytedance/realx/video/TimestampAligner;

    .line 29
    .line 30
    invoke-direct {v1}, Lcom/bytedance/realx/video/TimestampAligner;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTimestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mFreeTexSema:Ljava/util/concurrent/Semaphore;

    .line 36
    .line 37
    const-wide/16 v1, 0x0

    .line 38
    .line 39
    iput-wide v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 40
    .line 41
    iput-wide v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountReturned:J

    .line 42
    .line 43
    iput-wide v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountSent:J

    .line 44
    .line 45
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mISO:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 51
    .line 52
    const/16 p1, 0x5dc

    .line 53
    .line 54
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mISOPeriodMillis:I

    .line 55
    .line 56
    new-instance p1, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$6;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->updateISO:Ljava/lang/Runnable;

    .line 62
    .line 63
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->sendTexFrame(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->sendTexFrame(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexId:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1502(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexId:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1600(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1602(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1702(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/bytedance/realx/video/YuvConverter;)Lcom/bytedance/realx/video/YuvConverter;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1800(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->doCleanup()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Ljava/util/concurrent/Semaphore;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mFreeTexSema:Ljava/util/concurrent/Semaphore;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->returnRawFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2200(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mISO:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2300(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->returnTextureFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private doCleanup()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bytedance/realx/video/YuvConverter;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexId:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    filled-new-array {v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 33
    .line 34
    .line 35
    :cond_3
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 37
    .line 38
    iput v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTexId:I

    .line 39
    .line 40
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 43
    .line 44
    return-void
.end method

.method private returnRawFrame()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountReturned:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountReturned:J

    .line 7
    .line 8
    return-void
.end method

.method private returnTextureFrame()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountReturned:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountReturned:J

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mFreeTexSema:Ljava/util/concurrent/Semaphore;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private sendRawFrame(Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$100(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    new-instance v2, Lcom/bytedance/realx/video/NV21Buffer;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->a()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 24
    .line 25
    new-instance v4, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$1;

    .line 26
    .line 27
    invoke-direct {v4, p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$1;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v2, v0, v1, p1, v4}, Lcom/bytedance/realx/video/NV21Buffer;-><init>([BIILjava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/bytedance/realx/video/VideoFrame;

    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-direct/range {v1 .. v6}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJZ)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mISO:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {v1, p1}, Lcom/bytedance/realx/video/VideoFrame;->setIso(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 53
    .line 54
    invoke-static {p1, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$300(Lcom/ss/bytertc/media/VECameraWrapper;Lcom/bytedance/realx/video/VideoFrame;)V

    .line 55
    .line 56
    .line 57
    iget-wide v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountSent:J

    .line 58
    .line 59
    const-wide/16 v4, 0x1

    .line 60
    .line 61
    add-long/2addr v2, v4

    .line 62
    iput-wide v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountSent:J

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private sendTexFrame(Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mStopped:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    const-wide/16 v4, 0x7d0

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v6

    .line 22
    iget-wide v8, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 23
    .line 24
    sub-long/2addr v6, v8

    .line 25
    cmp-long v0, v6, v4

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v6, "toSvr"

    .line 36
    .line 37
    const-string v7, "block by other node"

    .line 38
    .line 39
    invoke-virtual {v0, v1, v6, v7}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-wide v6, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 43
    .line 44
    cmp-long v0, v6, v2

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 49
    .line 50
    .line 51
    move-result-wide v6

    .line 52
    iput-wide v6, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 53
    .line 54
    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mFreeTexSema:Ljava/util/concurrent/Semaphore;

    .line 55
    .line 56
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 57
    .line 58
    const/4 v7, 0x1

    .line 59
    invoke-virtual {v0, v7, v4, v5, v6}, Ljava/util/concurrent/Semaphore;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    iget-object v4, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 66
    .line 67
    invoke-static {v4}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    const-string v5, "toSvr"

    .line 72
    .line 73
    const-string v6, "semaphore interrupted"

    .line 74
    .line 75
    invoke-virtual {v4, v1, v5, v6}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    :goto_0
    if-nez v0, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 85
    .line 86
    new-instance v1, Lcom/ss/bytertc/media/a;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1}, Lcom/ss/bytertc/media/a;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    iput-wide v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSendTexFrameStart:J

    .line 96
    .line 97
    sget-object v2, Lcom/bytedance/realx/video/EglBase;->lock:Ljava/lang/Object;

    .line 98
    .line 99
    monitor-enter v2

    .line 100
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    move-object p0, v0

    .line 108
    goto :goto_2

    .line 109
    :catch_1
    move-exception v0

    .line 110
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const-string v3, ""

    .line 120
    .line 121
    const-string v4, "updateTexImage failed(could be caused by fd leak)"

    .line 122
    .line 123
    invoke-virtual {v0, v1, v3, v4}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    new-instance v10, Landroid/graphics/Matrix;

    .line 128
    .line 129
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 130
    .line 131
    .line 132
    const/16 v0, 0x9

    .line 133
    .line 134
    new-array v0, v0, [F

    .line 135
    .line 136
    fill-array-data v0, :array_0

    .line 137
    .line 138
    .line 139
    invoke-virtual {v10, v0}, Landroid/graphics/Matrix;->setValues([F)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 143
    .line 144
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$100(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 149
    .line 150
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 151
    .line 152
    .line 153
    move-result-wide v1

    .line 154
    iget-object v3, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mTimestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 155
    .line 156
    invoke-virtual {v3, v1, v2}, Lcom/bytedance/realx/video/TimestampAligner;->translateTimestamp(J)J

    .line 157
    .line 158
    .line 159
    move-result-wide v1

    .line 160
    new-instance v5, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iget v6, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 167
    .line 168
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    iget v7, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 173
    .line 174
    sget-object v8, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->c()I

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    iget-object v11, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 181
    .line 182
    iget-object v12, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 183
    .line 184
    new-instance v13, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$2;

    .line 185
    .line 186
    invoke-direct {v13, p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$2;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V

    .line 187
    .line 188
    .line 189
    invoke-direct/range {v5 .. v13}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 190
    .line 191
    .line 192
    new-instance p1, Lcom/bytedance/realx/video/VideoFrame;

    .line 193
    .line 194
    invoke-direct {p1, v5, v0, v1, v2}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mISO:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    invoke-virtual {p1, v0}, Lcom/bytedance/realx/video/VideoFrame;->setIso(I)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 207
    .line 208
    invoke-static {v0, p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$300(Lcom/ss/bytertc/media/VECameraWrapper;Lcom/bytedance/realx/video/VideoFrame;)V

    .line 209
    .line 210
    .line 211
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountSent:J

    .line 212
    .line 213
    const-wide/16 v2, 0x1

    .line 214
    .line 215
    add-long/2addr v0, v2

    .line 216
    iput-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->frameCountSent:J

    .line 217
    .line 218
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :goto_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 223
    throw p0

    .line 224
    nop

    .line 225
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public onFrameCaptured(Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$602(Lcom/ss/bytertc/media/VECameraWrapper;I)I

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$702(Lcom/ss/bytertc/media/VECameraWrapper;I)I

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$800(Lcom/ss/bytertc/media/VECameraWrapper;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    sub-long v2, v0, v2

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    const-wide/16 v4, 0x1f4

    .line 40
    .line 41
    cmp-long v2, v2, v4

    .line 42
    .line 43
    if-lez v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 46
    .line 47
    invoke-static {v2, v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$802(Lcom/ss/bytertc/media/VECameraWrapper;J)J

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->updateUIOrientation()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->getDeviceOrientation()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 63
    .line 64
    invoke-static {v2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$900(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-ne v0, v2, :cond_0

    .line 69
    .line 70
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 71
    .line 72
    invoke-static {v2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1000(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eq v1, v2, :cond_1

    .line 77
    .line 78
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 79
    .line 80
    invoke-static {v2, v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$902(Lcom/ss/bytertc/media/VECameraWrapper;I)I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1002(Lcom/ss/bytertc/media/VECameraWrapper;I)I

    .line 86
    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v1, " startCapture mLastUIOrientation: "

    .line 91
    .line 92
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 96
    .line 97
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$900(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, ", mLastDeviceOrientation: "

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 110
    .line 111
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1000(Lcom/ss/bytertc/media/VECameraWrapper;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v1, ", mUseGravitySensor:"

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 124
    .line 125
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1100(Lcom/ss/bytertc/media/VECameraWrapper;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const-string v1, "CameInfo"

    .line 141
    .line 142
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_1
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mIsFirstFrame:Z

    .line 146
    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 150
    .line 151
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1200(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 152
    .line 153
    .line 154
    const/4 v0, 0x0

    .line 155
    iput-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mIsFirstFrame:Z

    .line 156
    .line 157
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 158
    .line 159
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 160
    .line 161
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 162
    .line 163
    if-eqz v0, :cond_3

    .line 164
    .line 165
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 166
    .line 167
    new-instance v1, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$3;

    .line 168
    .line 169
    invoke-direct {v1, p0, p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$3;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_3
    invoke-direct {p0, p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->sendRawFrame(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public onNewSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, ""

    .line 8
    .line 9
    const-string v0, "IFrameListener.onNewSurfaceTexture"

    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-virtual {p0, v1, p1, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public shutdown()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->updateISO:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    new-instance v2, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;

    .line 17
    .line 18
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$5;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Ljava/util/concurrent/CountDownLatch;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mThread:Landroid/os/HandlerThread;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public startup()V
    .locals 3

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "vecam_handler"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mThread:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/os/Handler;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mThread:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v0, Ljava/util/concurrent/Semaphore;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mFreeTexSema:Ljava/util/concurrent/Semaphore;

    .line 33
    .line 34
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 40
    .line 41
    new-instance v2, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;

    .line 42
    .line 43
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;-><init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Ljava/util/concurrent/CountDownLatch;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    .line 48
    .line 49
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mHandler:Landroid/os/Handler;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->updateISO:Ljava/lang/Runnable;

    .line 60
    .line 61
    const-wide/16 v1, 0x5dc

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method
