.class Lcom/ss/android/ttvecamera/b$b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/b$b;->a(Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/b;

.field final synthetic b:Lcom/ss/android/ttvecamera/b$b;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/b$b;Lcom/ss/android/ttvecamera/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b$b$b;->b:Lcom/ss/android/ttvecamera/b$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/b$b$b;->a:Lcom/ss/android/ttvecamera/b;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$b$b;->a:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$b$b;->a:Lcom/ss/android/ttvecamera/b;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 15
    .line 16
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 17
    .line 18
    const-string v2, "Camera onDisconnected"

    .line 19
    .line 20
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 21
    .line 22
    const/16 v3, -0x199

    .line 23
    .line 24
    invoke-interface {v0, v1, v3, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
