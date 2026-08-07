.class Ll/vrh0$b;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vrh0;->c(Landroid/hardware/camera2/CaptureRequest$Builder;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Ll/vrh0;


# direct methods
.method public constructor <init>(Ll/vrh0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/vrh0$b;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
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
    sget-object p1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 2
    .line 3
    invoke-virtual {p3, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p0, "TEImageFocus"

    .line 12
    .line 13
    const-string p1, "metering failed."

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const/4 v0, 0x3

    .line 24
    if-eq p2, v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x2

    .line 31
    if-ne p1, p2, :cond_3

    .line 32
    .line 33
    :cond_1
    iget-boolean p1, p0, Ll/vrh0$b;->a:Z

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 38
    .line 39
    iget-object p1, p1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p2, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 48
    .line 49
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iget-object v0, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 56
    .line 57
    iget-object v0, v0, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 58
    .line 59
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 60
    .line 61
    const-string v1, "Done"

    .line 62
    .line 63
    invoke-interface {p1, p2, v0, v1}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 67
    .line 68
    iget-object p2, p1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 69
    .line 70
    iget-boolean p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 71
    .line 72
    if-nez p2, :cond_3

    .line 73
    .line 74
    iget-object p1, p1, Ll/vrh0;->f:Ll/p6m$a;

    .line 75
    .line 76
    invoke-interface {p1}, Ll/p6m$a;->d()I

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object p1, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 80
    .line 81
    invoke-static {p1}, Ll/vrh0;->j(Ll/vrh0;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    iget-object p0, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 88
    .line 89
    invoke-static {p3}, Lcom/ss/android/ttvecamera/f;->k(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-static {p0, p1}, Ll/vrh0;->k(Ll/vrh0;Z)Z

    .line 94
    .line 95
    .line 96
    :cond_4
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 1
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
    iget-boolean p1, p0, Ll/vrh0$b;->a:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 9
    .line 10
    iget-object p1, p1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Ll/vrh0$b;->b:Ll/vrh0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 21
    .line 22
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 23
    .line 24
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/16 v0, -0x19b

    .line 29
    .line 30
    invoke-interface {p1, v0, p0, p2}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string p1, "Manual Metering Failed: "

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "TEImageFocus"

    .line 48
    .line 49
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
