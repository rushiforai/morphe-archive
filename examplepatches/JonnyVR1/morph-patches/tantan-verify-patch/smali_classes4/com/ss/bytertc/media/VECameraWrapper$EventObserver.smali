.class Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/d$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EventObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCaptureStarted(II)V
    .locals 9

    .line 1
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "CameraObserver.onCaptureStarted ret = "

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v1, 0x8

    .line 22
    .line 23
    const-string v2, "toSvr"

    .line 24
    .line 25
    invoke-virtual {p1, v1, v2, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 35
    .line 36
    iget p2, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 37
    .line 38
    iget p1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 39
    .line 40
    invoke-direct {v4, p2, p1}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 44
    .line 45
    iget-object p2, p1, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 46
    .line 47
    iget-boolean p2, p2, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 48
    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    new-instance v3, Ll/jrh0$a;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1600(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)Landroid/graphics/SurfaceTexture;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->access$1500(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;)I

    .line 74
    .line 75
    .line 76
    move-result v8

    .line 77
    const/4 v6, 0x1

    .line 78
    invoke-direct/range {v3 .. v8}, Ll/jrh0$a;-><init>(Lcom/ss/android/ttvecamera/TEFrameSizei;Ll/irh0$c;ZLandroid/graphics/SurfaceTexture;I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    new-instance v3, Ll/jrh0$a;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    new-instance v7, Landroid/graphics/SurfaceTexture;

    .line 89
    .line 90
    const/4 p1, 0x0

    .line 91
    invoke-direct {v7, p1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 92
    .line 93
    .line 94
    sget-object v8, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_NV21:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 95
    .line 96
    const/4 v6, 0x0

    .line 97
    invoke-direct/range {v3 .. v8}, Ll/jrh0$a;-><init>(Lcom/ss/android/ttvecamera/TEFrameSizei;Ll/irh0$c;ZLandroid/graphics/SurfaceTexture;Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1, v3}, Lcom/ss/android/ttvecamera/d;->a(Ll/jrh0$a;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iget-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 111
    .line 112
    invoke-static {p2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v2, "addCameraProvider rst ="

    .line 119
    .line 120
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const-string v0, ""

    .line 135
    .line 136
    invoke-virtual {p2, v1, v0, p1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 140
    .line 141
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/d;->r()I

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 149
    .line 150
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 151
    .line 152
    const/4 p1, 0x2

    .line 153
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 154
    .line 155
    .line 156
    :cond_1
    return-void
.end method

.method public onCaptureStopped(I)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "toSvr"

    .line 8
    .line 9
    const-string v1, "CameraObserver.onCaptureStopped"

    .line 10
    .line 11
    const/16 v2, 0x8

    .line 12
    .line 13
    invoke-virtual {p1, v2, v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2500(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onError(ILjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "CameraObserver.onError, err="

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " msg="

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    const-string v3, "toSvr"

    .line 36
    .line 37
    invoke-virtual {v0, v2, v3, v1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 41
    .line 42
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2600(Lcom/ss/bytertc/media/VECameraWrapper;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onInfo(IILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "CameraObserver.onInfo, type="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " msg="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    const/16 v0, 0x8

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    invoke-virtual {p2, v0, v1, p3}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    if-ne p1, p2, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    new-instance p1, Landroid/os/Bundle;

    .line 52
    .line 53
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 p2, 0x0

    .line 57
    const-string p3, "camera_support_fps_range"

    .line 58
    .line 59
    invoke-virtual {p1, p3, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2, p1}, Lcom/ss/android/ttvecamera/d;->k(Landroid/os/Bundle;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p3}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p2, "toSvr"

    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, v0, p2, p1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_0
    return-void
.end method
