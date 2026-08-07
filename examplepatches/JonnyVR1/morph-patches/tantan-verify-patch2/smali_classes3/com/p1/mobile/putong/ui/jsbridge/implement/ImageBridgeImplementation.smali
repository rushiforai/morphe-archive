.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Dialog;Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-interface {p1}, Ll/x20;->call()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/bqq;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/bqq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    new-instance v0, Landroid/content/Intent;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "file://"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 35
    .line 36
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "success"

    .line 43
    .line 44
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Ll/aqq;)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "adtp"

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    const-string v1, "canceled"

    .line 16
    .line 17
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->H(Ll/aqq;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->E(Ll/aqq;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h(Ll/aqq;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/Media;Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "report"

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "app-loading"

    .line 16
    .line 17
    const-string v1, "h5-loading"

    .line 18
    .line 19
    invoke-static {p0, v0, v1, p1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Ll/ahm;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/ahm;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 7

    .line 1
    instance-of v1, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;

    .line 2
    .line 3
    const/16 v2, 0x315

    .line 4
    .line 5
    const/16 v3, 0x316

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/bn5;->P1()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    move v6, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v6, v2

    .line 20
    :goto_0
    const/4 v1, 0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v4, 0x0

    .line 23
    move-object v0, p0

    .line 24
    move v3, p1

    .line 25
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    if-eqz p1, :cond_2

    .line 30
    .line 31
    move v5, v3

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    move v5, v2

    .line 34
    :goto_1
    const/4 v1, 0x1

    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v4, 0x0

    .line 37
    move-object v0, p0

    .line 38
    move v3, p1

    .line 39
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZI)V

    .line 40
    .line 41
    .line 42
    :goto_2
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "cancel"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l7y;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "cancel"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->D(Ll/aqq;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->G(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic n(Ll/bqq;Ll/y20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "failed"

    .line 9
    .line 10
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->F(Ll/aqq;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p(Ll/bqq;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    new-instance p2, Ll/zgm;

    .line 2
    .line 3
    invoke-direct {p2, p0, p1}, Ll/zgm;-><init>(Ll/bqq;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic q(Ll/bqq;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    new-instance p3, Ll/ygm;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2, p1}, Ll/ygm;-><init>(Ll/bqq;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->C(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/String;Ll/aqq;)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "adtp"

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "canceled"

    .line 14
    .line 15
    const-string v1, "false"

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    filled-new-array {v2, v0, v1, v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic t(Ljava/util/List;)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Dialog;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->z(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;IILandroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->I(Ll/aqq;IILandroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final A(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p4, "adtp"

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const-string p3, ""

    .line 20
    .line 21
    :cond_1
    if-eqz p5, :cond_2

    .line 22
    .line 23
    const-string p1, "true"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const-string p1, "false"

    .line 27
    .line 28
    :goto_0
    filled-new-array {p2, p3, p1, p6}, [Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p4, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final B(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/rgm;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p3}, Ll/rgm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/bqq;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->y(Ll/bqq;Ljava/lang/String;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 21
    .line 22
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 23
    .line 24
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$a;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance p2, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$b;

    .line 38
    .line 39
    invoke-direct {p2, p0, p1, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$b;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/bqq;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic C(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "_web_image.png"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v2, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, "Tantan"

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v3, Ljava/io/File;

    .line 55
    .line 56
    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_0

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-nez v4, :cond_1

    .line 70
    .line 71
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_2

    .line 76
    .line 77
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    const/4 v0, 0x0

    .line 97
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    new-instance p3, Ll/ehm;

    .line 104
    .line 105
    invoke-direct {p3, p0, p1, p2}, Ll/ehm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p3}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    new-instance v1, Ljava/io/File;

    .line 113
    .line 114
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p3, v1}, Ll/dxd0;->a(Ljava/lang/String;Ljava/io/File;)Z

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    if-eqz p3, :cond_4

    .line 122
    .line 123
    new-instance p3, Ll/fhm;

    .line 124
    .line 125
    invoke-direct {p3, p0, p1, p2}, Ll/fhm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {p3}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_4
    new-instance p3, Ll/ghm;

    .line 133
    .line 134
    invoke-direct {p3, p0, p1, p2}, Ll/ghm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p3}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic D(Ll/aqq;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "failed"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E(Ll/aqq;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(Ll/aqq;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "failed"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H(Ll/aqq;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_2

    .line 9
    .line 10
    instance-of p2, p4, Lcom/p1/mobile/putong/data/Video;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 v1, 0x1

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    :goto_0
    move-object v8, v0

    .line 34
    move v7, v1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const/4 v1, 0x0

    .line 37
    goto :goto_0

    .line 38
    :goto_1
    iget-object v4, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    move-object v2, p0

    .line 42
    move-object v3, p1

    .line 43
    move-object v6, p3

    .line 44
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->A(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    move-object v2, p0

    .line 49
    move-object v3, p1

    .line 50
    move-object v6, p3

    .line 51
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-virtual {v2, v3, p0, p1, v6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->M(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final I(Ll/aqq;IILandroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/16 v2, 0x315

    .line 2
    .line 3
    const/4 v4, -0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v6, 0x1

    .line 6
    if-ne p2, v2, :cond_1

    .line 7
    .line 8
    if-ne p3, v4, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p4, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v5, v0

    .line 17
    check-cast v5, Ljava/util/ArrayList;

    .line 18
    .line 19
    :cond_0
    move-object v2, v5

    .line 20
    const/4 v5, 0x0

    .line 21
    move-object v0, p0

    .line 22
    move-object v1, p1

    .line 23
    move v3, p3

    .line 24
    move-object v4, p6

    .line 25
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->J(Ll/aqq;Ljava/util/List;ILjava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    return v6

    .line 29
    :cond_1
    const/16 v2, 0x316

    .line 30
    .line 31
    if-ne p2, v2, :cond_3

    .line 32
    .line 33
    if-ne p3, v4, :cond_2

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p4, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v5, v0

    .line 42
    check-cast v5, Ljava/util/ArrayList;

    .line 43
    .line 44
    :cond_2
    move-object v2, v5

    .line 45
    const/4 v5, 0x1

    .line 46
    move-object v0, p0

    .line 47
    move-object v1, p1

    .line 48
    move v3, p3

    .line 49
    move-object v4, p6

    .line 50
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->J(Ll/aqq;Ljava/util/List;ILjava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    return v6

    .line 54
    :cond_3
    const/16 v1, 0x4000

    .line 55
    .line 56
    if-ne p2, v1, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0, p1, p5, p3, p6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->K(Ll/aqq;Ljava/lang/String;ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return v6

    .line 62
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->O(Ll/aqq;)V

    .line 63
    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    return v0
.end method

.method public J(Ll/aqq;Ljava/util/List;ILjava/lang/String;Z)V
    .locals 3
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/aqq;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p3, v0, :cond_4

    .line 3
    .line 4
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-lez p3, :cond_4

    .line 9
    .line 10
    const/4 p3, 0x0

    .line 11
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    const-string v1, "preprocessed"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iput-object p3, p2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 30
    .line 31
    new-instance p3, Ll/sim;

    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p3, v0}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p3, Ll/sim;->c:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 47
    .line 48
    iget-object p3, p3, Ll/sim;->d:[I

    .line 49
    .line 50
    invoke-direct {v0, p3}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    invoke-virtual {p0, p1, p2, p4, p5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->P(Ll/aqq;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    check-cast p2, Lcom/p1/mobile/putong/data/Video;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    const-string v0, "video/mp4"

    .line 78
    .line 79
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 80
    .line 81
    new-instance v0, Ll/wel0;

    .line 82
    .line 83
    new-instance v1, Ll/vel0;

    .line 84
    .line 85
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-direct {v1, v2}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {v0, v1, p3, p3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 95
    .line 96
    .line 97
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/wel0;->m()[I

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 104
    .line 105
    .line 106
    iput-object v1, p2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 107
    .line 108
    :try_start_0
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 109
    .line 110
    invoke-virtual {v0, p3}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-static {p3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    iput-object p3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catch_0
    move-exception p3

    .line 122
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 126
    .line 127
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/wel0;->k()[I

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 134
    .line 135
    .line 136
    iput-object v1, p3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 137
    .line 138
    iget-object p3, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 139
    .line 140
    const-string v0, "image/jpeg"

    .line 141
    .line 142
    iput-object v0, p3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 143
    .line 144
    iget p3, p2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 145
    .line 146
    const/high16 v0, 0x467a0000    # 16000.0f

    .line 147
    .line 148
    cmpl-float v0, p3, v0

    .line 149
    .line 150
    if-ltz v0, :cond_1

    .line 151
    .line 152
    const-string p0, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u957f\u4e86\uff0c\u8bf7\u4fdd\u6301\u572816\u79d2\u5185"

    .line 153
    .line 154
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_1
    const v0, 0x453b8000    # 3000.0f

    .line 159
    .line 160
    .line 161
    cmpg-float p3, p3, v0

    .line 162
    .line 163
    if-gez p3, :cond_2

    .line 164
    .line 165
    const-string p0, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u77ed\u4e86\uff0c\u8bf7\u5927\u4e8e3\u79d2"

    .line 166
    .line 167
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_2
    invoke-virtual {p0, p1, p2, p4, p5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->P(Ll/aqq;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Z)V

    .line 172
    .line 173
    .line 174
    :cond_3
    :goto_1
    return-void

    .line 175
    :cond_4
    const-string p2, ""

    .line 176
    .line 177
    const-string p3, "canceled"

    .line 178
    .line 179
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->M(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public K(Ll/aqq;Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    new-instance p3, Lcom/p1/mobile/putong/data/Picture;

    .line 5
    .line 6
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    const-string p2, "preprocessed"

    .line 16
    .line 17
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 22
    .line 23
    new-instance p2, Ll/sim;

    .line 24
    .line 25
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {p2, v0}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p2, Ll/sim;->c:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    iget-object p2, p2, Ll/sim;->d:[I

    .line 41
    .line 42
    invoke-direct {v0, p2}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-virtual {p0, p1, p3, p4, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->P(Ll/aqq;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const-string p2, ""

    .line 53
    .line 54
    const-string p3, "canceled"

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->M(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;Z)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/jec0;->M:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v0, Ll/ycc0;->E:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/ycc0;->D:I

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v3, Ll/ycc0;->o:I

    .line 26
    .line 27
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    sget v5, Ll/zfc0;->j:I

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4, p0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/jhm;

    .line 53
    .line 54
    invoke-direct {v2, p0, p2}, Ll/jhm;-><init>(Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    const/4 v5, -0x1

    .line 72
    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 73
    .line 74
    const/16 v5, 0x50

    .line 75
    .line 76
    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Ll/sgm;

    .line 82
    .line 83
    invoke-direct {v2, p1, p0}, Ll/sgm;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/android/app/Dialog;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    new-instance v0, Ll/tgm;

    .line 90
    .line 91
    invoke-direct {v0, p1, p3, p0}, Ll/tgm;-><init>(Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/android/app/Dialog;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    new-instance p1, Ll/ugm;

    .line 98
    .line 99
    invoke-direct {p1, p0, p2}, Ll/ugm;-><init>(Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final M(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p4, "adtp"

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p0, p4, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p3, "adtp"

    .line 8
    .line 9
    :cond_0
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p0, p3, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final O(Ll/aqq;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 10
    .line 11
    return-void
.end method

.method public final P(Ll/aqq;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Z)V
    .locals 3
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/i1y;

    .line 11
    .line 12
    filled-new-array {p2}, [Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-direct {v0, v1, v2}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/vgm;

    .line 25
    .line 26
    invoke-direct {v1, p2}, Ll/vgm;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v0, Ll/wgm;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1, p4, p3}, Ll/wgm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;ZLjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/xgm;

    .line 47
    .line 48
    invoke-direct {p0, p1}, Ll/xgm;-><init>(Ll/aqq;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public declared-synchronized a()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/lf2;->a()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;->c()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public imagePicker(Ll/aqq;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "imagePicker"
        uiThread = true
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, p1, v1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ll/lhm;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;->b()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/dhm;

    .line 26
    .line 27
    invoke-direct {v1, p2, p1}, Ll/dhm;-><init>(Ljava/lang/String;Ll/aqq;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->L(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public imagePickerWithVideo(Ll/aqq;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "imagePickerWithVideo"
        uiThread = true
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, p1, v1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ll/lhm;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->b:Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$e;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/bhm;

    .line 25
    .line 26
    invoke-direct {v1, p2, p1}, Ll/bhm;-><init>(Ljava/lang/String;Ll/aqq;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->L(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public imageSave(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "imageSave"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->B(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public saveBase64ImageData(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "saveBase64ImageData"
    .end annotation

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->z(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 16
    .line 17
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 18
    .line 19
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$c;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$c;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;

    .line 33
    .line 34
    invoke-direct {p2, p0, p1, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation$d;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public y(Ll/bqq;Ljava/lang/String;Ll/y20;)V
    .locals 5
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bqq;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "failed"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p3, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "."

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p2, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/16 v1, 0x3f

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, -0x1

    .line 34
    if-ne v1, v2, :cond_1

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    sget-object v2, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v3, "Tantan"

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v3, Ljava/io/File;

    .line 110
    .line 111
    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz v4, :cond_2

    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    if-nez v4, :cond_3

    .line 125
    .line 126
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_4

    .line 131
    .line 132
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    goto :goto_1

    .line 148
    :cond_4
    const/4 p0, 0x0

    .line 149
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_5

    .line 154
    .line 155
    invoke-interface {p3, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_5
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 160
    .line 161
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    new-instance p2, Ll/hhm;

    .line 179
    .line 180
    invoke-direct {p2, p1, p3}, Ll/hhm;-><init>(Ll/bqq;Ll/y20;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    new-instance p2, Ll/ihm;

    .line 188
    .line 189
    invoke-direct {p2, p1, p3}, Ll/ihm;-><init>(Ll/bqq;Ll/y20;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/a;->y(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-nez p1, :cond_6

    .line 213
    .line 214
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 219
    .line 220
    .line 221
    :cond_6
    return-void
.end method

.method public final z(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/chm;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3, p2}, Ll/chm;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
