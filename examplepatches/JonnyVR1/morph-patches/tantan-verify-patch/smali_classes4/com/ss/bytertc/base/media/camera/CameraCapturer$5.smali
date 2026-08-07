.class Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionInternal(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

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
    .locals 11

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    :try_start_1
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 9
    .line 10
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1900(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$2000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$2100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$2200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$2300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I

    .line 47
    .line 48
    .line 49
    move-result v9

    .line 50
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$2400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I

    .line 53
    .line 54
    .line 55
    move-result v10

    .line 56
    invoke-virtual/range {v2 .. v10}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createCameraSession(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V

    .line 57
    .line 58
    .line 59
    monitor-exit v1

    .line 60
    return-void

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v3, "Create VideoCapture Session fail : "

    .line 82
    .line 83
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v1, v0}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 101
    .line 102
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    monitor-enter v1

    .line 107
    :try_start_3
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 108
    .line 109
    const/4 v2, 0x0

    .line 110
    invoke-static {v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$702(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 114
    .line 115
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 120
    .line 121
    .line 122
    monitor-exit v1

    .line 123
    return-void

    .line 124
    :catchall_1
    move-exception v0

    .line 125
    move-object p0, v0

    .line 126
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    throw p0
.end method
