.class public Ll/eh60;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nh60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/VerifyData;

.field public b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/data/VerifyData;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/eh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/ForgetPasswordData;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/eh60;->b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/eh60;->c:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic e0(Ll/eh60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eh60;->p0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/eh60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eh60;->n0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/eh60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eh60;->o0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/eh60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eh60;->m0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/eh60;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eh60;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method private l0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 16
    .line 17
    iget-object v2, p0, Ll/eh60;->b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 18
    .line 19
    iput v0, v2, Lcom/p1/mobile/putong/data/ForgetPasswordData;->countryCode:I

    .line 20
    .line 21
    iput-object v1, v2, Lcom/p1/mobile/putong/data/ForgetPasswordData;->mobileNumber:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Ll/eh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 24
    .line 25
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v2, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Ll/eh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 32
    .line 33
    iput v0, v2, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 34
    .line 35
    iput-object v1, v2, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 36
    .line 37
    const-string v3, "forgot-password"

    .line 38
    .line 39
    invoke-static {v3}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iput-object v3, v2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 44
    .line 45
    iget-object v2, p0, Ll/eh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 46
    .line 47
    const/4 v3, 0x4

    .line 48
    iput v3, v2, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 49
    .line 50
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p0, Ll/nh60;

    .line 53
    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v3, "+"

    .line 57
    .line 58
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, " "

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/nh60;->F(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private synthetic q0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/nh60;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/nh60;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/eh60;->l0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/zg60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zg60;-><init>(Ll/eh60;)V

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

.method public j0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/eh60;->b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/nh60;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/nh60;->p()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->code:I

    .line 21
    .line 22
    iget-object v0, p0, Ll/eh60;->b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 23
    .line 24
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v1, Ll/nh60;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/nh60;->s()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->new_:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 37
    .line 38
    iget-object v1, p0, Ll/eh60;->b:Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/sw6;->p3(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ah60;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ah60;-><init>(Ll/eh60;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/bh60;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/bh60;-><init>(Ll/eh60;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public k0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/eh60;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/nh60;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/nh60;->G()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/eh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/ch60;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/ch60;-><init>(Ll/eh60;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/dh60;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/dh60;-><init>(Ll/eh60;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic m0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nh60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nh60;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nh60;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nh60;->n(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nh60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nh60;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nh60;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nh60;->q(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
