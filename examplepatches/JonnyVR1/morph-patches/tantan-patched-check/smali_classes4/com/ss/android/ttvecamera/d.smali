.class public Lcom/ss/android/ttvecamera/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/d$c;,
        Lcom/ss/android/ttvecamera/d$a;,
        Lcom/ss/android/ttvecamera/d$e;,
        Lcom/ss/android/ttvecamera/d$d;,
        Lcom/ss/android/ttvecamera/d$b;
    }
.end annotation


# instance fields
.field protected a:Lcom/ss/android/ttvecamera/TECameraSettings;

.field protected b:Lcom/ss/android/ttvecamera/d$b;

.field protected c:Lcom/ss/android/ttvecamera/d$e;

.field protected d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/d$b;Lcom/ss/android/ttvecamera/d$d;)V
    .locals 0
    .param p1    # Lcom/ss/android/ttvecamera/d$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/ss/android/ttvecamera/d$c;->a()Lcom/ss/android/ttvecamera/d$c;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Lcom/ss/android/ttvecamera/d;->b:Lcom/ss/android/ttvecamera/d$b;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    iput-object p2, p0, Lcom/ss/android/ttvecamera/d;->c:Lcom/ss/android/ttvecamera/d$e;

    .line 12
    .line 13
    new-instance p2, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcom/ss/android/ttvecamera/d;->d:Ljava/util/Map;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/ss/android/ttvecamera/d;->b:Lcom/ss/android/ttvecamera/d$b;

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p0}, Ll/dsh0;->c(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static n(BLcom/ss/android/ttvecamera/g$b;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/ss/android/ttvecamera/g;->h(Lcom/ss/android/ttvecamera/g$b;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "VESDK"

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->i(Ljava/lang/String;B)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/jrh0$a;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->addCameraProvider(Lcom/ss/android/ttvecamera/d;Ll/jrh0$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Lcom/ss/android/ttvecamera/TECameraSettings;)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttvecamera/d;->c(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public c(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/d;->a:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->registerFpsConfigListener(Lcom/ss/android/ttvecamera/d$a;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/ss/android/ttvecamera/d;->c:Lcom/ss/android/ttvecamera/d$e;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->registerPreviewSizeListener(Lcom/ss/android/ttvecamera/d$e;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/d;->b:Lcom/ss/android/ttvecamera/d$b;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/ss/android/ttvecamera/d;->a:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    move-object v1, p0

    .line 20
    move-object v5, p2

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/ss/android/ttvecamera/TECameraServer;->connect(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/d$b;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/ss/android/ttvecamera/d$d;Lcom/bytedance/bpea/basics/Cert;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public d()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/d;->e(Lcom/bytedance/bpea/basics/Cert;)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public e(Lcom/bytedance/bpea/basics/Cert;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->registerFpsConfigListener(Lcom/ss/android/ttvecamera/d$a;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->disConnect(Lcom/ss/android/ttvecamera/d;Lcom/bytedance/bpea/basics/Cert;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f(Lcom/ss/android/ttvecamera/TEFocusSettings;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->q()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 5
    .line 6
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->focusAtPoint(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public g()Lcom/ss/android/ttvecamera/TECameraSettings$d;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->getCameraECInfo(Lcom/ss/android/ttvecamera/d;)Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Lcom/ss/android/ttvecamera/TECameraSettings$g;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->getISO(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->isSupportedExposureCompensation(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->isTorchSupported(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/d;->a:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECameraCapture"

    .line 6
    .line 7
    const-string p1, "query features failed, maybe not connet"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/ss/android/ttvecamera/d;->l(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->queryFeatures(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->queryZoomAbility(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public o(Lcom/ss/android/ttvecamera/d$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/d;->c:Lcom/ss/android/ttvecamera/d$e;

    .line 2
    .line 3
    return-void
.end method

.method public p()I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->removeCameraProvider(Lcom/ss/android/ttvecamera/d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->setExposureCompensation(Lcom/ss/android/ttvecamera/d;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->start(Lcom/ss/android/ttvecamera/d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s(FLcom/ss/android/ttvecamera/TECameraSettings$p;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->startZoom(Lcom/ss/android/ttvecamera/d;FLcom/ss/android/ttvecamera/TECameraSettings$p;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/d;->u(Z)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public u(Z)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->stop(Lcom/ss/android/ttvecamera/d;Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public v(Z)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->toggleTorch(Lcom/ss/android/ttvecamera/d;Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
