.class Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

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
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$000(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    const/high16 v1, 0x44fa0000    # 2000.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "Camera fps: "

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, "."

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "CameraStatistics"

    .line 38
    .line 39
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$000(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$104(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)I

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$100(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    mul-int/lit16 v0, v0, 0x7d0

    .line 63
    .line 64
    const/16 v2, 0xfa0

    .line 65
    .line 66
    if-lt v0, v2, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$200(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    const-string v0, "Camera freezed."

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$300(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 92
    .line 93
    if-eqz v0, :cond_0

    .line 94
    .line 95
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$200(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string v0, "Camera failure. Client must return video buffers."

    .line 100
    .line 101
    invoke-interface {p0, v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraFreezed(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_0
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$200(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string v0, "Camera failure."

    .line 110
    .line 111
    invoke-interface {p0, v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraFreezed(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_1
    invoke-static {v2, v3}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$102(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;I)I

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 119
    .line 120
    invoke-static {v0, v3}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$002(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;I)I

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 124
    .line 125
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->access$300(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const-wide/16 v1, 0x7d0

    .line 134
    .line 135
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 136
    .line 137
    .line 138
    return-void
.end method
