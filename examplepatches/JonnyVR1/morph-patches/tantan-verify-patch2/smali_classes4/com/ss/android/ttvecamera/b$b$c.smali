.class Lcom/ss/android/ttvecamera/b$b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/b$b;->b(Ljava/lang/Object;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/b;

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Lcom/ss/android/ttvecamera/b$b;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/b$b;Lcom/ss/android/ttvecamera/b;IILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b$b$c;->e:Lcom/ss/android/ttvecamera/b$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/b$b$c;->a:Lcom/ss/android/ttvecamera/b;

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/android/ttvecamera/b$b$c;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/ss/android/ttvecamera/b$b$c;->c:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/ss/android/ttvecamera/b$b$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$b$c;->a:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$b$c;->a:Lcom/ss/android/ttvecamera/b;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget v2, p0, Lcom/ss/android/ttvecamera/b$b$c;->b:I

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    iget v2, p0, Lcom/ss/android/ttvecamera/b$b$c;->c:I

    .line 20
    .line 21
    if-ne v2, v3, :cond_0

    .line 22
    .line 23
    iget-object v3, v0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 24
    .line 25
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 26
    .line 27
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$b$c;->d:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 30
    .line 31
    invoke-interface {v1, v3, v2, p0, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v2, v0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 36
    .line 37
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 38
    .line 39
    iget p0, p0, Lcom/ss/android/ttvecamera/b$b$c;->c:I

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 43
    .line 44
    invoke-interface {v1, v2, p0, v3, v0}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method
