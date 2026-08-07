.class Ll/urh0$c;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/urh0;->O1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/urh0;


# direct methods
.method public constructor <init>(Ll/urh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

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
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const/4 p2, 0x2

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v0, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/urh0;->T0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 21
    .line 22
    invoke-static {v0, p3}, Ll/urh0;->V0(Ll/urh0;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/TotalCaptureResult;

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 26
    .line 27
    invoke-static {p3}, Ll/urh0;->W0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    check-cast p3, Ljava/lang/Integer;

    .line 38
    .line 39
    iget-object v1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 40
    .line 41
    invoke-static {v1}, Ll/urh0;->X0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ljava/lang/Integer;

    .line 52
    .line 53
    const/4 v3, 0x1

    .line 54
    if-eqz p3, :cond_1

    .line 55
    .line 56
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    if-eq p3, v3, :cond_2

    .line 61
    .line 62
    :cond_1
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-ne p3, v3, :cond_4

    .line 69
    .line 70
    :cond_2
    const-string p3, "need cancel ae af trigger"

    .line 71
    .line 72
    const-string v1, "TEImage2Mode"

    .line 73
    .line 74
    invoke-static {v1, p3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p3, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 78
    .line 79
    invoke-static {p3}, Ll/urh0;->Y0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-virtual {p3, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object p3, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 87
    .line 88
    invoke-static {p3}, Ll/urh0;->Z0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    invoke-virtual {p3, v2, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 96
    .line 97
    invoke-static {p2}, Ll/urh0;->a1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-static {p2, p3, v3, v3}, Ll/urh0;->b1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 107
    .line 108
    .line 109
    move-result p3

    .line 110
    if-nez p3, :cond_3

    .line 111
    .line 112
    new-instance p0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string p1, "onCaptureSequenceCompleted: error = "

    .line 115
    .line 116
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    iget-object p2, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 135
    .line 136
    invoke-static {p2}, Ll/urh0;->c1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p2, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 144
    .line 145
    invoke-static {p2}, Ll/urh0;->d1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2, v2, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_4
    iget-object p0, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 153
    .line 154
    invoke-static {p0}, Ll/urh0;->f1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {p0, p1}, Ll/urh0;->h1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 3
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
    const-string p1, "TEImage2Mode"

    .line 5
    .line 6
    const-string p2, "captureStillPicture, capture failed"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/urh0;->i1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 23
    .line 24
    invoke-static {p1}, Ll/urh0;->j1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-boolean p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 31
    .line 32
    invoke-static {p1}, Ll/urh0;->k1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 41
    .line 42
    invoke-static {p1}, Ll/urh0;->l1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-boolean p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 49
    .line 50
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 55
    .line 56
    invoke-static {p2}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    new-instance v0, Ljava/lang/Exception;

    .line 61
    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v2, "Capture failed: "

    .line 65
    .line 66
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-direct {v0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const/16 p3, 0x3eb

    .line 84
    .line 85
    invoke-virtual {p2, p3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/urh0$c;->a:Ll/urh0;

    .line 93
    .line 94
    invoke-static {p0}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/16 p1, 0x3ea

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 101
    .line 102
    .line 103
    return-void
.end method
