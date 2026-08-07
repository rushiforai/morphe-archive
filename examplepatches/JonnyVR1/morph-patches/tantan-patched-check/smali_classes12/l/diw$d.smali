.class Ll/diw$d;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/diw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/diw;


# direct methods
.method public constructor <init>(Ll/diw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw$d;->a:Ll/diw;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/diw$d;->a:Ll/diw;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Ll/diw;->D(Ll/diw;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/diw$d;->a:Ll/diw;

    .line 11
    .line 12
    invoke-static {p1}, Ll/diw;->W(Ll/diw;)Ll/ypl$e;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "Camera2 config failed !"

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/diw$d;->a:Ll/diw;

    .line 21
    .line 22
    invoke-static {p0}, Ll/diw;->W(Ll/diw;)Ll/ypl$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 p1, 0xfa5

    .line 27
    .line 28
    invoke-interface {p0, p1, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const-string p0, "Camera"

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/diw$d;->a:Ll/diw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/diw;->h(Ll/diw;)Landroid/hardware/camera2/CameraDevice;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/diw$d;->a:Ll/diw;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/diw;->D(Ll/diw;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/diw$d;->a:Ll/diw;

    .line 16
    .line 17
    invoke-static {p0}, Ll/diw;->G(Ll/diw;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
