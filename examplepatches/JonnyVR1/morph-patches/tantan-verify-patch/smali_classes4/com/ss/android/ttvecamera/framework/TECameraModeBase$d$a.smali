.class Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;->b:Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;->b:Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 6
    .line 7
    iget-object v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;->a:I

    .line 12
    .line 13
    const-string v3, "updateCapture : something wrong."

    .line 14
    .line 15
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 16
    .line 17
    invoke-interface {v1, v2, p0, v3, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
