.class public Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/camera/TTCameraConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

.field public f:Ll/ovh0;

.field public g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->c:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static Z1(Landroid/content/Context;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_preview_config"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "extra_camera_config"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)V
    .locals 3

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/wzx;->k()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p2, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 21
    .line 22
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/kuh0;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/kuh0;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    new-instance p1, Ll/luh0;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/luh0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->q(Ljava/util/List;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/iec0;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ll/ovh0;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->d:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->e:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 13
    .line 14
    invoke-direct {p2, p0, p1, v0, v1}, Ll/ovh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->f:Ll/ovh0;

    .line 18
    .line 19
    new-instance p2, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->d:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->e:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 24
    .line 25
    invoke-direct {p2, p0, v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;-><init>(Ll/ner;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->f:Ll/ovh0;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 36
    .line 37
    .line 38
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "extra_preview_config"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->e:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "extra_camera_config"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->d:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 34
    .line 35
    return-void
.end method
