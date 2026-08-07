.class Lcom/momo/rtcbase/Camera1Session$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/Camera1Session;->listenForBytebufferFrames()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/Camera1Session;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/Camera1Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/Camera1Session$2;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$1000(Lcom/momo/rtcbase/Camera1Session;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/rtcbase/b;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/rtcbase/b;-><init>(Lcom/momo/rtcbase/Camera1Session$2;[B)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Lcom/momo/rtcbase/Camera1Session$2;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$400(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/momo/rtcbase/Camera1Session$SessionState;->RUNNING:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/momo/rtcbase/Camera1Session;->access$300(Lcom/momo/rtcbase/Camera1Session;)Landroid/hardware/Camera;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$200(Lcom/momo/rtcbase/Camera1Session;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$300(Lcom/momo/rtcbase/Camera1Session;)Landroid/hardware/Camera;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "Camera1Session"

    .line 13
    .line 14
    if-eq p2, v0, :cond_0

    .line 15
    .line 16
    const-string p0, "Callback from a different camera. This should never happen."

    .line 17
    .line 18
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 23
    .line 24
    invoke-static {p2}, Lcom/momo/rtcbase/Camera1Session;->access$400(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    sget-object v0, Lcom/momo/rtcbase/Camera1Session$SessionState;->RUNNING:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 29
    .line 30
    if-eq p2, v0, :cond_1

    .line 31
    .line 32
    const-string p0, "Bytebuffer frame captured but camera is no longer running."

    .line 33
    .line 34
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    iget-object p2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 49
    .line 50
    invoke-static {p2}, Lcom/momo/rtcbase/Camera1Session;->access$500(Lcom/momo/rtcbase/Camera1Session;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-nez p2, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    iget-object p2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/momo/rtcbase/Camera1Session;->access$600(Lcom/momo/rtcbase/Camera1Session;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    sub-long/2addr v2, v4

    .line 67
    const-wide/32 v4, 0xf4240

    .line 68
    .line 69
    .line 70
    div-long/2addr v2, v4

    .line 71
    long-to-int p2, v2

    .line 72
    invoke-static {}, Lcom/momo/rtcbase/Camera1Session;->access$700()Lcom/momo/rtcbase/Histogram;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2, p2}, Lcom/momo/rtcbase/Histogram;->addSample(I)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    invoke-static {p2, v2}, Lcom/momo/rtcbase/Camera1Session;->access$502(Lcom/momo/rtcbase/Camera1Session;Z)Z

    .line 83
    .line 84
    .line 85
    :cond_2
    new-instance p2, Lcom/momo/rtcbase/NV21Buffer;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 88
    .line 89
    invoke-static {v2}, Lcom/momo/rtcbase/Camera1Session;->access$800(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget v2, v2, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 94
    .line 95
    iget-object v3, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 96
    .line 97
    invoke-static {v3}, Lcom/momo/rtcbase/Camera1Session;->access$800(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    iget v3, v3, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 102
    .line 103
    new-instance v4, Lcom/momo/rtcbase/c;

    .line 104
    .line 105
    invoke-direct {v4, p0, p1}, Lcom/momo/rtcbase/c;-><init>(Lcom/momo/rtcbase/Camera1Session$2;[B)V

    .line 106
    .line 107
    .line 108
    invoke-direct {p2, p1, v2, v3, v4}, Lcom/momo/rtcbase/NV21Buffer;-><init>([BIILjava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    new-instance p1, Lcom/momo/rtcbase/VideoFrame;

    .line 112
    .line 113
    iget-object v2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 114
    .line 115
    invoke-static {v2}, Lcom/momo/rtcbase/Camera1Session;->access$900(Lcom/momo/rtcbase/Camera1Session;)I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-direct {p1, p2, v2, v0, v1}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 120
    .line 121
    .line 122
    iget-object p2, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 123
    .line 124
    invoke-static {p2}, Lcom/momo/rtcbase/Camera1Session;->access$100(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraSession$Events;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session$2;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 129
    .line 130
    invoke-interface {p2, p0, p1}, Lcom/momo/rtcbase/CameraSession$Events;->onFrameCaptured(Lcom/momo/rtcbase/CameraSession;Lcom/momo/rtcbase/VideoFrame;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 134
    .line 135
    .line 136
    return-void
.end method
