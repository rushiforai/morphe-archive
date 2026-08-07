.class Lcom/ss/bytertc/base/media/camera/Camera1Session$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/Camera1Session;->listenForBytebufferFrames()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$500(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->RUNNING:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$400(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/hardware/Camera;

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

.method public static synthetic b(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$1400(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/ss/bytertc/base/media/camera/b;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/ss/bytertc/base/media/camera/b;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$300(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$400(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/hardware/Camera;

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
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 23
    .line 24
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$500(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    sget-object v0, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->RUNNING:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 29
    .line 30
    if-eq p2, v0, :cond_1

    .line 31
    .line 32
    const-string p0, "Bytebuffer frame captured but camera is no longer running."

    .line 33
    .line 34
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

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
    move-result-wide v5

    .line 48
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 49
    .line 50
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$600(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    const/4 v0, 0x1

    .line 55
    if-nez p2, :cond_2

    .line 56
    .line 57
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$700(Lcom/ss/bytertc/base/media/camera/Camera1Session;)J

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 66
    .line 67
    invoke-static {p2, v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$602(Lcom/ss/bytertc/base/media/camera/Camera1Session;Z)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    new-instance v3, Lcom/bytedance/realx/video/NV21Buffer;

    .line 71
    .line 72
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 73
    .line 74
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$800(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget p2, p2, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 79
    .line 80
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$800(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget v1, v1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 87
    .line 88
    new-instance v2, Lcom/ss/bytertc/base/media/camera/c;

    .line 89
    .line 90
    invoke-direct {v2, p0, p1}, Lcom/ss/bytertc/base/media/camera/c;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V

    .line 91
    .line 92
    .line 93
    invoke-direct {v3, p1, p2, v1, v2}, Lcom/bytedance/realx/video/NV21Buffer;-><init>([BIILjava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$900(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 103
    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$1000(Lcom/ss/bytertc/base/media/camera/Camera1Session;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    :goto_0
    move v4, p1

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$1100(Lcom/ss/bytertc/base/media/camera/Camera1Session;)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 117
    .line 118
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$1200(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {p2, v1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :goto_1
    new-instance v2, Lcom/bytedance/realx/video/VideoFrame;

    .line 131
    .line 132
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$1300(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/hardware/Camera$CameraInfo;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iget p1, p1, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 139
    .line 140
    if-ne p1, v0, :cond_4

    .line 141
    .line 142
    :goto_2
    move v7, v0

    .line 143
    goto :goto_3

    .line 144
    :cond_4
    const/4 v0, 0x0

    .line 145
    goto :goto_2

    .line 146
    :goto_3
    invoke-direct/range {v2 .. v7}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJZ)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 150
    .line 151
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$200(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 156
    .line 157
    invoke-interface {p1, p0, v2}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onFrameCaptured(Lcom/ss/bytertc/base/media/camera/CameraSession;Lcom/bytedance/realx/video/VideoFrame;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 161
    .line 162
    .line 163
    return-void
.end method
