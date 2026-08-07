.class public Ll/fy50;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/iy50;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;


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

.method public static synthetic e0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/pf60;

    .line 3
    .line 4
    const-string v0, "e_tantan_oauth_begin"

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f0(Ll/fy50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fy50;->y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/fy50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fy50;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/fy50;Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fy50;->r0(Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V

    return-void
.end method

.method public static synthetic i0(Ll/fy50;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fy50;->u0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/fy50;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fy50;->t0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k0(Ll/fy50;Lcom/p1/mobile/putong/data/OpenSDKInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fy50;->x0(Lcom/p1/mobile/putong/data/OpenSDKInfo;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic u0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->P0:Ll/d7a;

    .line 4
    .line 5
    iget-object v1, p0, Ll/fy50;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/fy50;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/d7a;->f3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic y0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/fy50;->m0(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/iy50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fy50;->o0(Ll/iy50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/xx50;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/xx50;-><init>(Ll/fy50;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/fy50;->p0()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/yx50;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/yx50;-><init>(Ll/fy50;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/zx50;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/zx50;-><init>(Ll/fy50;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/ay50;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/ay50;-><init>(Ll/fy50;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance v0, Ll/by50;

    .line 66
    .line 67
    invoke-direct {v0}, Ll/by50;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-instance v0, Ll/cy50;

    .line 75
    .line 76
    invoke-direct {v0}, Ll/cy50;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "tantan_oauth_failed_reason"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "e_tantan_oauth_failed"

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/content/Intent;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "errorMessage"

    .line 24
    .line 25
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/pf60;

    .line 3
    .line 4
    const-string v1, "e_tantan_oauth_success"

    .line 5
    .line 6
    const-string v2, ""

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/content/Intent;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "code"

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;->code:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string v1, "state"

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;->state:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    const/4 v1, -0x1

    .line 33
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public o0(Ll/iy50;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method public final p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "clientId"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/fy50;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "packageName"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/fy50;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "state"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/fy50;->d:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public q0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->P0:Ll/d7a;

    .line 11
    .line 12
    iget-object v2, p0, Ll/fy50;->b:Ljava/lang/String;

    .line 13
    .line 14
    const-string v5, ""

    .line 15
    .line 16
    iget-object v6, p0, Ll/fy50;->d:Ljava/lang/String;

    .line 17
    .line 18
    const-string v3, "code"

    .line 19
    .line 20
    const-string v4, "user_profile"

    .line 21
    .line 22
    invoke-virtual/range {v1 .. v6}, Ll/d7a;->e3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/dy50;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/dy50;-><init>(Ll/fy50;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/ey50;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/ey50;-><init>(Ll/fy50;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;->code:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;->error:I

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/fy50;->n0(Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    const-string p1, "unknow error"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;->message:Ljava/lang/String;

    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0, p1}, Ll/fy50;->m0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/fy50;->m0(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/iy50;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/iy50;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/OpenSDKInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/data/OpenSDKInfo;->error:I

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/iy50;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/iy50;->j(Lcom/p1/mobile/putong/data/OpenSDKInfo;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-string p1, "unknow error"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OpenSDKInfo;->message:Ljava/lang/String;

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0, p1}, Ll/fy50;->m0(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public z0(Landroid/view/MenuItem;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0x102002c

    .line 6
    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    const-string p1, "you have canceled"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/fy50;->m0(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/fy50;->a:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
