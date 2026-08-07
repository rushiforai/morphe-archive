.class Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->startup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

.field final synthetic val$startSignal:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->val$startSignal:Ljava/util/concurrent/CountDownLatch;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 6
    .line 7
    iget-boolean v2, v2, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-static {v1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$1400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/bytedance/realx/video/EglBase$Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->createDummyPbufferSurface()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 33
    .line 34
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 38
    .line 39
    const v1, 0x8d65

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1502(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;I)I

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 50
    .line 51
    new-instance v1, Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 54
    .line 55
    invoke-static {v2}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1500(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-direct {v1, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1602(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 66
    .line 67
    new-instance v1, Lcom/bytedance/realx/video/YuvConverter;

    .line 68
    .line 69
    invoke-direct {v1}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1702(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/bytedance/realx/video/YuvConverter;)Lcom/bytedance/realx/video/YuvConverter;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catch_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1800(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->this$1:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    iput-boolean v1, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 89
    .line 90
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener$4;->val$startSignal:Ljava/util/concurrent/CountDownLatch;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 93
    .line 94
    .line 95
    return-void
.end method
