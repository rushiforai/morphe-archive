.class public Ll/fxb;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pxb;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Ll/x20;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/fxb;->b:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/fxb;->c:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/fxb;->d:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/fxb;->e:Z

    .line 12
    .line 13
    new-instance p1, Ll/qwb;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/qwb;-><init>(Ll/fxb;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/fxb;->f:Ll/x20;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic A0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/pxb;

    .line 12
    .line 13
    iget-object p0, p0, Ll/fxb;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/pxb;->l(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private S0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-interface {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "from_sign_up"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v1, Ll/pxb;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v0, Ll/pxb;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/pxb;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 65
    .line 66
    const-string v0, "Onboarding Completed"

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {p0, v0, v1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private U0(Lcom/p1/mobile/putong/data/SignInGrantType;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->media:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 10
    .line 11
    invoke-static {}, Ll/h9n;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    new-instance p1, Ljava/lang/RuntimeException;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "BirthDateNullException please ignore, class = "

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, ", phoneNumber = "

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v2, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {p1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    new-instance p1, Ll/bxb;

    .line 66
    .line 67
    invoke-direct {p1, p0}, Ll/bxb;-><init>(Ll/fxb;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->q2(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    new-instance v1, Ll/cxb;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/cxb;-><init>(Ll/fxb;)V

    .line 78
    .line 79
    .line 80
    const/4 v2, 0x1

    .line 81
    const/4 v3, 0x0

    .line 82
    invoke-static {v0, v1, v2, v3, p1}, Ll/ike;->s(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;ZZLcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_0
    new-instance v1, Ll/dxb;

    .line 87
    .line 88
    invoke-direct {v1, p0, v0}, Ll/dxb;-><init>(Ll/fxb;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/exb;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/exb;-><init>(Ll/fxb;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private V0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Exception;

    .line 12
    .line 13
    const-string v1, "mobileNumber == null in SignUpProfileImageOptAct on line 383"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/pxb;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Ll/fxb;->c:Z

    .line 42
    .line 43
    return-void
.end method

.method private synthetic c0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fxb;->b:Z

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v2, Ll/pxb;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->h2(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 34
    .line 35
    if-ne v0, v1, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Ll/pxb;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const/16 v2, 0x1388

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/xwb;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/xwb;-><init>(Ll/fxb;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-virtual {p0}, Ll/fxb;->R0()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/SignupStage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f0(Ll/fxb;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->F0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/fxb;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fxb;->A0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fxb;->c0()V

    return-void
.end method

.method public static synthetic i0(Ll/fxb;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->C0(Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic j0(Ll/fxb;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fxb;->L0(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fxb;->I0()V

    return-void
.end method

.method public static synthetic l0(Ll/fxb;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->E0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m0(Ll/fxb;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->H0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fxb;->D0()V

    return-void
.end method

.method public static synthetic o0(Ll/fxb;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p0(Ll/fxb;Lcom/p1/mobile/putong/data/SignupStage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxb;->G0(Lcom/p1/mobile/putong/data/SignupStage;)V

    return-void
.end method

.method public static synthetic q0(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fxb;->J0()V

    return-void
.end method

.method private s0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hve0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/fxb;->d:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-direct {p0}, Ll/fxb;->S0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private t0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Ll/fxb;->V0()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/fxb;->c:Z

    .line 15
    .line 16
    return-void
.end method

.method private y0()Ll/ewb;
    .locals 2

    .line 1
    new-instance v0, Ll/ewb$a;

    .line 2
    .line 3
    invoke-static {}, Ll/sim;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "webp"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "jpg"

    .line 13
    .line 14
    :goto_0
    invoke-static {v1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ll/ewb$a;-><init>(Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/sim;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 35
    .line 36
    :goto_1
    invoke-virtual {v0, v1}, Ll/ewb$a;->b(Landroid/graphics/Bitmap$CompressFormat;)Ll/ewb$a;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/sim;->c()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    new-instance v1, Ll/fxb$a;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/fxb$a;-><init>(Ll/fxb;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/ewb$a;->e(Ll/qcj;)Ll/ewb$a;

    .line 51
    .line 52
    .line 53
    :cond_2
    const/16 p0, 0x438

    .line 54
    .line 55
    invoke-virtual {v0, p0, p0}, Ll/ewb$a;->d(II)Ll/ewb$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/16 v0, 0x64

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/ewb$a;->c(I)Ll/ewb$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/ewb$a;->a()Ll/ewb;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method


# virtual methods
.method public final synthetic C0(Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/fxb;->b:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/pxb;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 17
    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/account/R$string;->T:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/account/api/a;->l2(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 35
    .line 36
    invoke-direct {p0, p1}, Ll/fxb;->U0(Lcom/p1/mobile/putong/data/SignInGrantType;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic D0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final synthetic E0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fxb;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fxb;->b:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/pxb;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/data/SignupStage;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const-string v1, "verified"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    const-string v0, "finished"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/pxb;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p1, p1, Ll/ike;->a:Ll/wyd0;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Ll/fxb;->s0()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 71
    .line 72
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 73
    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->media:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 76
    .line 77
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 78
    .line 79
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 80
    .line 81
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 82
    .line 83
    const-string v1, "image/jpeg"

    .line 84
    .line 85
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/swb;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/swb;-><init>(Ll/fxb;)V

    .line 98
    .line 99
    .line 100
    const/4 v2, 0x0

    .line 101
    const/4 v3, 0x0

    .line 102
    const/4 v4, 0x1

    .line 103
    invoke-static {p1, v1, v4, v2, v3}, Ll/ike;->s(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;ZZLcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    new-instance v0, Ll/twb;

    .line 112
    .line 113
    invoke-direct {v0, p0}, Ll/twb;-><init>(Ll/fxb;)V

    .line 114
    .line 115
    .line 116
    new-instance v1, Ll/uwb;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/uwb;-><init>(Ll/fxb;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final synthetic H0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fxb;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/pxb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    instance-of v0, p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    move-object v0, p1

    .line 28
    check-cast v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    instance-of v0, v0, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p1, Ll/pxb;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0}, Ll/fxb;->r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic I0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final synthetic J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final synthetic L0(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string v0, "male"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const-string p2, "signup_male_hp"

    .line 13
    .line 14
    new-array v0, v0, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {p2, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    const-string v1, "female"

    .line 23
    .line 24
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    const-string p2, "signup_female_hp"

    .line 31
    .line 32
    new-array v0, v0, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->others:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 38
    .line 39
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    new-instance p2, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 52
    .line 53
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->others:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 57
    .line 58
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OtherSettingsOthers;->refuseSMS:Z

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p2, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->refuseSMS:Ljava/lang/Boolean;

    .line 65
    .line 66
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->h:Ll/zyd0;

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-direct {p0}, Ll/fxb;->s0()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fxb;->b:Z

    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v1, 0x9c4b

    .line 14
    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/pxb;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Ll/fxb;->t0()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/pxb;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;Ll/l4g0;)V
    .locals 1

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string p1, "signup_source"

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    return-void
.end method

.method public P0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fxb;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public Q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fxb;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final R0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ywb;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/ywb;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/zwb;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/zwb;-><init>(Ll/fxb;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/axb;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/axb;-><init>(Ll/fxb;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/vwb;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vwb;-><init>(Ll/fxb;)V

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

.method public r0()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pxb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/android/R$string;->k7:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/pxb;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/fxb;->y0()Ll/ewb;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ll/pxb;->k(Ll/ewb;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public x0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    const-string v1, "image/jpeg"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/account/api/a;->k2(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ll/fxb;->b:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/fxb;->f:Ll/x20;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fxb;->e:Z

    .line 2
    .line 3
    return p0
.end method
