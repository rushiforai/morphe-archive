.class Ll/urh0$d;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/urh0;->Q1()V
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
    iput-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

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
    .locals 0
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
    const-string p1, "TEImage2Mode"

    .line 2
    .line 3
    const-string p2, "onCaptureCompleted, do capture done"

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 p2, 0x3ea

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 20
    .line 21
    invoke-static {p0, p3}, Ll/urh0;->V0(Ll/urh0;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/TotalCaptureResult;

    .line 22
    .line 23
    .line 24
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
    const-string p1, "TEImage2Mode"

    .line 2
    .line 3
    const-string p2, "onCaptureCompleted, do capture failed"

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/urh0;->m1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/urh0;->n1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-boolean p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 28
    .line 29
    invoke-static {p1}, Ll/urh0;->o1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 38
    .line 39
    invoke-static {p1}, Ll/urh0;->p1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-boolean p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 46
    .line 47
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p2, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 52
    .line 53
    invoke-static {p2}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    new-instance v0, Ljava/lang/Exception;

    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "Capture failed: "

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-direct {v0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/16 p3, 0x3eb

    .line 81
    .line 82
    invoke-virtual {p2, p3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/urh0$d;->a:Ll/urh0;

    .line 90
    .line 91
    invoke-static {p0}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/16 p1, 0x3ea

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 98
    .line 99
    .line 100
    return-void
.end method
