.class public Ll/ii60;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/li60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/VerifyData;


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

.method public static synthetic e0(Ll/ii60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ii60;->n0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/ii60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ii60;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/ii60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ii60;->k0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic h0(Ll/ii60;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ii60;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/ii60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ii60;->m0()V

    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/li60;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/li60;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/li60;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/li60;->j()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/ei60;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/ei60;-><init>(Ll/ii60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/di60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/di60;-><init>(Ll/ii60;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ii60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic k0(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/li60;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->N9()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lt p1, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Ll/li60;->e(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic m0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/li60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic n0(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "user.reset_password.signin"

    .line 6
    .line 7
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->il(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/li60;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 19
    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->e3:I

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->f3:I

    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {p1, v0}, Ll/o1j0;->A(Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/li60;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->th(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p1, Ll/li60;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p0, Ll/li60;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/li60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/li60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/li60;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ForgetPasswordData;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/ii60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 20
    .line 21
    iget v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    .line 23
    iput v2, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->code:I

    .line 24
    .line 25
    iget v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 26
    .line 27
    iput v2, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->countryCode:I

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->mobileNumber:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->new_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v1, Ll/fi60;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/fi60;-><init>(Ll/ii60;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Em(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/gi60;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/gi60;-><init>(Ll/ii60;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/hi60;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/hi60;-><init>(Ll/ii60;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method
