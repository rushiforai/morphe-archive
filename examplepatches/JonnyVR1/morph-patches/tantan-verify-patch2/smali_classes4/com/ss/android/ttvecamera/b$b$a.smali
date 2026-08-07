.class Lcom/ss/android/ttvecamera/b$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/b$b;->c(Ljava/lang/Object;)Z
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
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b$b$a;->b:Lcom/ss/android/ttvecamera/b$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/b$b$a;->a:Lcom/ss/android/ttvecamera/b;

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
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$b$a;->a:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-interface {v0, v1, v3, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "TECamera2"

    .line 20
    .line 21
    const-string v0, "mCameraEvents is null!"

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
