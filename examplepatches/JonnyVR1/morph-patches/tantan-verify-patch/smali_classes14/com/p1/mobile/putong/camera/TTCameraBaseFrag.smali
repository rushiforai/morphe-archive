.class public Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public final A:Ljava/lang/String;

.field public z:Lcom/p1/mobile/putong/camera/TTCameraConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->A:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static M4(Lcom/p1/mobile/putong/camera/TTCameraConfig;)Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;-><init>()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/p1/mobile/putong/camera/picture/TTCameraPictureFrag;-><init>()V

    .line 16
    .line 17
    .line 18
    :goto_0
    new-instance v1, Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "camera_config"

    .line 24
    .line 25
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v1, "camera_config"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 19
    .line 20
    :cond_0
    return-void
.end method
