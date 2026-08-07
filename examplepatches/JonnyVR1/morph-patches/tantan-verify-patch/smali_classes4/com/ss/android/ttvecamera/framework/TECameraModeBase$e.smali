.class Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 4
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 7
    .line 8
    sget-object p2, Landroid/hardware/camera2/CaptureResult;->SENSOR_SENSITIVITY:Landroid/hardware/camera2/CaptureResult$Key;

    .line 9
    .line 10
    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 p2, -0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    :goto_0
    iput p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->C:I

    .line 29
    .line 30
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 31
    .line 32
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 43
    .line 44
    iput-boolean p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 51
    .line 52
    iget-wide v2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->J:J

    .line 53
    .line 54
    sub-long/2addr v0, v2

    .line 55
    new-instance p1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v2, "first preview frame callback arrived! consume = "

    .line 58
    .line 59
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v2, ", session consume: "

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 71
    .line 72
    iget-wide v2, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I:J

    .line 73
    .line 74
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v2, "TECameraModeBase"

    .line 82
    .line 83
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string p1, "te_record_camera2_set_repeating_request_cost"

    .line 87
    .line 88
    invoke-static {p1, v0, v1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 101
    .line 102
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->n0:Z

    .line 103
    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraFrame$d;

    .line 107
    .line 108
    invoke-direct {p1}, Lcom/ss/android/ttvecamera/TECameraFrame$d;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    iput-wide v0, p1, Lcom/ss/android/ttvecamera/TECameraFrame$d;->c:J

    .line 116
    .line 117
    iput-object p3, p1, Lcom/ss/android/ttvecamera/TECameraFrame$d;->d:Landroid/hardware/camera2/TotalCaptureResult;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I()[I

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    aget p2, v0, p2

    .line 126
    .line 127
    iput p2, p1, Lcom/ss/android/ttvecamera/TECameraFrame$d;->e:I

    .line 128
    .line 129
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 130
    .line 131
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I()[I

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    const/4 v0, 0x0

    .line 136
    aget p2, p2, v0

    .line 137
    .line 138
    iput p2, p1, Lcom/ss/android/ttvecamera/TECameraFrame$d;->f:I

    .line 139
    .line 140
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 141
    .line 142
    iget-object p2, p2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 143
    .line 144
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p2}, Ll/jrh0;->f()Ll/irh0;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2, p1}, Ll/irh0;->n(Lcom/ss/android/ttvecamera/TECameraFrame$d;)V

    .line 153
    .line 154
    .line 155
    :cond_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 156
    .line 157
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o:Z

    .line 158
    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    invoke-static {p3}, Lcom/ss/android/ttvecamera/f;->k(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o:Z

    .line 166
    .line 167
    :cond_4
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 5
    .line 6
    iget-object p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 7
    .line 8
    iget-boolean p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->g0:Z

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 23
    .line 24
    iget p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->K:I

    .line 25
    .line 26
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    iput p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->K:I

    .line 29
    .line 30
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x5

    .line 36
    if-lt p2, p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 43
    .line 44
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 45
    .line 46
    const-string v0, "Camera previewing failed"

    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 49
    .line 50
    const/16 v1, -0x1b5

    .line 51
    .line 52
    invoke-interface {p1, p2, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string p1, "failure: "

    .line 58
    .line 59
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p1, ",reason:"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "TECameraModeBase"

    .line 82
    .line 83
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
