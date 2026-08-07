.class public Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;
.super Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field public B:Ll/cth0;

.field public C:Ll/t6m;

.field public D:Ll/ft5;

.field public E:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->D:Ll/ft5;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->E:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->Y4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->f5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->d5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->Z4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->a5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->X4(Z)V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->e5()V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->b5()V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Ll/d3i0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->c5(Ll/d3i0;)V

    return-void
.end method

.method private synthetic Y4(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/camera/R$string;->a:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/cth0;->y()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic Z4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->j5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic a5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private i5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/t6m;->getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ll/buh0;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/buh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 15
    .line 16
    .line 17
    new-instance v3, Ll/cuh0;

    .line 18
    .line 19
    invoke-direct {v3, p0}, Ll/cuh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3}, Ll/cth0;->d(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private j5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->D:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->W4(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/cth0;->destroy()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->l()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    xor-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->y(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->g5()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->i5()V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final W4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Ll/t6m;->q()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/juh0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/juh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic X4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/t6m;->getTakePictureButton()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic b5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c5(Ll/d3i0;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->E:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    add-int/2addr v0, v1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->E:I

    .line 13
    .line 14
    iget-object v2, p1, Ll/d3i0;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->f()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-lt v0, v2, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->i()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->e()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object p1, p1, Ll/d3i0;->b:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v4, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->d(Z)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->c(Lcom/p1/mobile/putong/camera/TTCameraConfig;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->a()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {v2, v3, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->g5()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic d5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/camera/R$string;->d:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic e5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/t6m;->c()Ll/ma5;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/cth0;->x(Ll/ma5;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->W4(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/camera/R$string;->e:I

    .line 5
    .line 6
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->W4(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 5
    .line 6
    invoke-interface {p1}, Ll/t6m;->getTakePictureButton()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/duh0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/duh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->W4(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 23
    .line 24
    invoke-interface {p1}, Ll/t6m;->getSwitchCameraButton()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 31
    .line 32
    invoke-interface {p1}, Ll/t6m;->getSwitchCameraButton()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/euh0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/euh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 45
    .line 46
    invoke-interface {p1}, Ll/t6m;->getCloseButton()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 53
    .line 54
    invoke-interface {p1}, Ll/t6m;->getCloseButton()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/fuh0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/fuh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-interface {p1}, Ll/t6m;->getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public final g5()V
    .locals 2

    .line 1
    new-instance v0, Ll/cth0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/cth0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/ush0;->b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->h5()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final h5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->D:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/cth0;->o()Lrx/subjects/b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->onBackpressureBuffer()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/guh0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/guh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/huh0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/huh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/iuh0;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/iuh0;-><init>(Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->D:Ll/ft5;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "hand_idCard"

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    new-instance p2, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->h()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const-string v0, "avatar"

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    new-instance p2, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->i0(Z)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance p2, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->i0(Z)V

    .line 68
    .line 69
    .line 70
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 71
    .line 72
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->d()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-interface {p1, p2}, Ll/t6m;->setDescriptionText(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->C:Ll/t6m;

    .line 84
    .line 85
    invoke-interface {p0}, Ll/t6m;->q()Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->D:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cth0;->destroy()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->B:Ll/cth0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cth0;->w()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;->i5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
