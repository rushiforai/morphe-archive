.class public Ll/x03;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/z03;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/x03;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x03;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/x03;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x03;->k0()V

    return-void
.end method

.method public static synthetic g0(Ll/x03;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x03;->j0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/x03;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x03;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 8
    .line 9
    const-string v1, "\u4fe1\u606f\u786e\u8ba4"

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v0}, Ll/c30;->w(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Ll/z03;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/z03;->e()V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t03;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t03;-><init>(Ll/x03;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic j0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Jl:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Q:I

    .line 34
    .line 35
    new-instance v1, Ll/w03;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/w03;-><init>(Ll/x03;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/x03;->a:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/u03;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/u03;-><init>(Ll/x03;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/v03;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/v03;-><init>(Ll/x03;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
