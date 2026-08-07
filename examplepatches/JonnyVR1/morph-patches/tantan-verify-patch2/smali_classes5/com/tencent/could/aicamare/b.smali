.class public Lcom/tencent/could/aicamare/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# instance fields
.field public final synthetic a:Landroid/hardware/Camera;

.field public final synthetic b:Lcom/tencent/could/aicamare/d;


# direct methods
.method public constructor <init>(Lcom/tencent/could/aicamare/d;Landroid/hardware/Camera;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/aicamare/b;->b:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/aicamare/b;->a:Landroid/hardware/Camera;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/tencent/could/aicamare/b;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/could/aicamare/b;->b:Lcom/tencent/could/aicamare/d;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 8
    .line 9
    const-string p1, "CameraHolderImp"

    .line 10
    .line 11
    const-string p2, "currentCamera is null!"

    .line 12
    .line 13
    invoke-static {p1, p2, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, p1}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onDataFrameCallBack([B)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
