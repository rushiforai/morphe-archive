.class Lio/agora/rtc2/video/VideoCaptureScreen$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureScreen;->stopCaptureAndBlockUntilStopped()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureScreen;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureScreen;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

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
    .locals 5

    .line 1
    const-string v0, "Exception when stopCaptureAndBlockUntilStopped: "

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 4
    .line 5
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 6
    .line 7
    invoke-interface {v1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->stopListening()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 11
    .line 12
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$000(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/hardware/display/VirtualDisplay;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 20
    .line 21
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$000(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/hardware/display/VirtualDisplay;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 29
    .line 30
    invoke-static {v1, v2}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$002(Lio/agora/rtc2/video/VideoCaptureScreen;Landroid/hardware/display/VirtualDisplay;)Landroid/hardware/display/VirtualDisplay;

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 34
    .line 35
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$100(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 42
    .line 43
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$100(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 48
    .line 49
    invoke-static {v3}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$200(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection$Callback;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Landroid/media/projection/MediaProjection;->unregisterCallback(Landroid/media/projection/MediaProjection$Callback;)V

    .line 54
    .line 55
    .line 56
    :try_start_0
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 57
    .line 58
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$100(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Landroid/media/projection/MediaProjection;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 66
    .line 67
    invoke-static {v0, v2}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$102(Lio/agora/rtc2/video/VideoCaptureScreen;Landroid/media/projection/MediaProjection;)Landroid/media/projection/MediaProjection;

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    goto :goto_1

    .line 73
    :catch_0
    move-exception v1

    .line 74
    :try_start_1
    const-string v3, "VideoCaptureScreen"

    .line 75
    .line 76
    new-instance v4, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v3, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :goto_1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 97
    .line 98
    invoke-static {p0, v2}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$102(Lio/agora/rtc2/video/VideoCaptureScreen;Landroid/media/projection/MediaProjection;)Landroid/media/projection/MediaProjection;

    .line 99
    .line 100
    .line 101
    throw v0

    .line 102
    :cond_1
    :goto_2
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen$2;->this$0:Lio/agora/rtc2/video/VideoCaptureScreen;

    .line 103
    .line 104
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureScreen;->access$300(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/os/ConditionVariable;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Landroid/os/ConditionVariable;->open()V

    .line 109
    .line 110
    .line 111
    return-void
.end method
