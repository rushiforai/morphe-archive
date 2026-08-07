.class Ll/ciw$a;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ciw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ciw;


# direct methods
.method public constructor <init>(Ll/ciw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/hardware/camera2/CameraDevice$StateCallback;->onClosed(Landroid/hardware/camera2/CameraDevice;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ciw;->f(Ll/ciw;)Ljava/util/concurrent/Semaphore;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ll/ciw;->o(Ll/ciw;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 20
    .line 21
    invoke-static {p0}, Ll/ciw;->D(Ll/ciw;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "Camera"

    .line 25
    .line 26
    const-string p1, "Camera2 CameraDevice is onDisconnected !!!"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 2
    .line 3
    invoke-static {p2}, Ll/ciw;->f(Ll/ciw;)Ljava/util/concurrent/Semaphore;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-static {p1, p2}, Ll/ciw;->o(Ll/ciw;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 20
    .line 21
    sget-object p2, Ll/s94;->a:Ljava/util/Map;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, v0, p2}, Ll/ciw;->M(Ll/ciw;ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 38
    .line 39
    invoke-static {p1}, Ll/ciw;->N(Ll/ciw;)Ll/xpl$c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "Camera2 open failed !"

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 48
    .line 49
    invoke-static {p0}, Ll/ciw;->N(Ll/ciw;)Ll/xpl$c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const/16 p1, 0xfa4

    .line 54
    .line 55
    invoke-interface {p0, p1, p2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    const-string p0, "Camera"

    .line 59
    .line 60
    invoke-static {p0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ciw;->f(Ll/ciw;)Ljava/util/concurrent/Semaphore;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/ciw;->o(Ll/ciw;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 16
    .line 17
    invoke-static {p1}, Ll/ciw;->A(Ll/ciw;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ciw$a;->a:Ll/ciw;

    .line 21
    .line 22
    invoke-static {p0}, Ll/ciw;->C(Ll/ciw;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p0, p1}, Ll/ciw;->B(Ll/ciw;Z)Z

    .line 27
    .line 28
    .line 29
    const-string p0, "Camera"

    .line 30
    .line 31
    const-string p1, "Camera2 CameraDevice is opened !!!"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
