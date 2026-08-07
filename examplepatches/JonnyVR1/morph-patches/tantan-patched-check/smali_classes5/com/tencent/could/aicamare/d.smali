.class public Lcom/tencent/could/aicamare/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/tencent/could/aicamare/entity/a;

.field public b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

.field public c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

.field public d:Lcom/tencent/could/aicamare/entity/CameraConfig;

.field public volatile e:Z

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/could/aicamare/entity/a;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/could/aicamare/entity/a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/aicamare/d;Z)Z
    .locals 0

    .line 70
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/d;->e:Z

    return p1
.end method


# virtual methods
.method public final a(ILjava/lang/String;)V
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    if-eqz v0, :cond_0

    .line 77
    invoke-interface {v0, p1, p2}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onEventError(ILjava/lang/String;)V

    return-void

    .line 78
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sendEventError, code: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " msg: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 1

    if-nez p1, :cond_0

    .line 72
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    const-string p1, "CameraHolderImp"

    const-string v0, "set context input a null"

    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    return-void

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->f:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    :goto_0
    if-nez v0, :cond_2

    .line 75
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/could/aicamare/d;->f:Ljava/lang/ref/WeakReference;

    :cond_2
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    .line 71
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    const-string v0, "CameraHolderImp"

    invoke-static {v0, p1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    return-void
.end method

.method public a(Landroid/hardware/Camera;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isByteDataBuffer()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/tencent/could/aicamare/b;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/tencent/could/aicamare/b;-><init>(Lcom/tencent/could/aicamare/d;Landroid/hardware/Camera;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Lcom/tencent/could/aicamare/c;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Lcom/tencent/could/aicamare/c;-><init>(Lcom/tencent/could/aicamare/d;Landroid/hardware/Camera;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tencent/could/aicamare/entity/a;->d:Landroid/hardware/Camera$Size;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget p0, v0, Landroid/hardware/Camera$Size;->width:I

    .line 33
    .line 34
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 35
    .line 36
    mul-int/2addr p0, v0

    .line 37
    const/16 v0, 0x11

    .line 38
    .line 39
    invoke-static {v0}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    mul-int/2addr p0, v0

    .line 44
    div-int/lit8 p0, p0, 0x8

    .line 45
    .line 46
    new-array p0, p0, [B

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 49
    .line 50
    .line 51
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_1
    const/4 p1, 0x3

    .line 54
    const-string v0, "current size is null"

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 60
    .line 61
    const-string p1, "CameraHolderImp"

    .line 62
    .line 63
    const-string v0, "start Preview buffer happen error!"

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    return p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 2
    .line 3
    const-string v0, "CameraHolderImp"

    .line 4
    .line 5
    invoke-static {v0, p1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
