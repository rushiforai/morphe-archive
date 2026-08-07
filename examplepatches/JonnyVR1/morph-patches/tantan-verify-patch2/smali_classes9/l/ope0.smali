.class public Ll/ope0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/upe0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/ope0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ope0;->s0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic f0(Landroid/app/Dialog;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g0(Ll/ope0;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ope0;->A0(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    return-void
.end method

.method public static synthetic h0(Ll/ope0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ope0;->x0()V

    return-void
.end method

.method public static synthetic i0(Ll/ope0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ope0;->C0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/ope0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ope0;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Ll/ope0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ope0;->y0()V

    return-void
.end method

.method public static synthetic m0(Ll/ope0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ope0;->t0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic n0(Ll/ope0;Lcom/p1/mobile/putong/core/data/RedPacket;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ope0;->z0(Lcom/p1/mobile/putong/core/data/RedPacket;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Ll/ope0;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ope0;->u0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method private synthetic t0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "group_id"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/ope0;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/upe0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/upe0;->r()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic u0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/upe0;

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/upe0;->w(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 37
    .line 38
    .line 39
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g0:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final synthetic C0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    const v0, 0x3d0a96

    .line 17
    .line 18
    .line 19
    if-ne v0, p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/upe0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/upe0;->y()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const p0, 0x3d0a99

    .line 30
    .line 31
    .line 32
    if-ne p0, p1, :cond_1

    .line 33
    .line 34
    const-string p0, "\u5355\u65e5\u6700\u591a\u53ef\u53d1\u900120000\u5143"

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g0:I

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public D0(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ope0;->a:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "random"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "average"

    .line 13
    .line 14
    :goto_0
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/x;->w3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p2, Ll/hpe0;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Ll/hpe0;-><init>(Ll/ope0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Ll/ipe0;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/ipe0;-><init>(Ll/ope0;)V

    .line 54
    .line 55
    .line 56
    new-instance p3, Ll/jpe0;

    .line 57
    .line 58
    invoke-direct {p3, p0}, Ll/jpe0;-><init>(Ll/ope0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/dpe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dpe0;-><init>(Ll/ope0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "group_id"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/fpe0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/fpe0;-><init>(Ll/ope0;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/gpe0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/gpe0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    new-instance v1, Lcom/alipay/sdk/app/AuthTask;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, v2}, Lcom/alipay/sdk/app/AuthTask;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/lqb;->k4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/npe0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/npe0;-><init>(Ll/ope0;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/epe0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/epe0;-><init>(Ll/ope0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public q0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ope0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/upe0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/upe0;->i(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s0(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/upe0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/upe0;->j(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/upe0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/upe0;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v1, Ll/mpe0;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/mpe0;-><init>(Landroid/app/Dialog;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v2, 0xbb8

    .line 34
    .line 35
    invoke-static {p0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/RedPacket;)Lrx/c;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 4
    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ll/kpe0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/kpe0;-><init>(Ll/ope0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/alipay/sdk/app/PayTask;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v0, v1, v2}, Lcom/alipay/sdk/app/PayTask;->payV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "resultStatus"

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/CharSequence;

    .line 41
    .line 42
    const-string v1, "9000"

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    new-instance v0, Ll/lpe0;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/lpe0;-><init>(Ll/ope0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/x;->s3(Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 74
    .line 75
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method
