.class public Ll/kmf0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pmf0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lcom/p1/mobile/putong/data/SignUpData;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/account/data/AccountTestGroup;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/kcg0;

.field public f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/account/data/AccountTestFactor;",
            ">;"
        }
    .end annotation
.end field


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
    iput-boolean p1, p0, Ll/kmf0;->a:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/kmf0;->b:Z

    .line 8
    .line 9
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/kmf0;->d:Lrx/subjects/a;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/kmf0;->e:Ll/kcg0;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/p1/mobile/putong/account/data/AccountTestFactor;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/kmf0;->f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 24
    .line 25
    new-instance p1, Ll/xlf0;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/xlf0;-><init>(Ll/kmf0;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/kmf0;->g:Ll/y20;

    .line 31
    .line 32
    return-void
.end method

.method private L0()V
    .locals 4

    .line 1
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 2
    .line 3
    const-string v1, "Onboarding Completed"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/pmf0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-interface {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "from_sign_up"

    .line 35
    .line 36
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v1, Ll/pmf0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v0, Ll/pmf0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast p0, Ll/pmf0;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic e0(Ll/kmf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kmf0;->y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/kmf0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->F0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/SignupStage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h0(Ll/kmf0;Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->z0(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V

    return-void
.end method

.method public static synthetic i0(Ll/kmf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->A0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/kmf0;Lcom/p1/mobile/putong/data/SignupStage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->C0(Lcom/p1/mobile/putong/data/SignupStage;)V

    return-void
.end method

.method public static synthetic k0(Ll/kmf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kmf0;->E0()V

    return-void
.end method

.method public static synthetic l0(Ll/kmf0;Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->x0(Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V

    return-void
.end method

.method public static synthetic m0(Ll/kmf0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->s0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic n0(Ll/kmf0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->u0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic o0(Ll/kmf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kmf0;->t0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic q0(Ll/kmf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kmf0;->D0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic t0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/pmf0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/pmf0;->j(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/pmf0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Ll/kmf0;->a:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pmf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/kmf0;->a:Z

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/pmf0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/data/SignupStage;)V
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
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Ll/pmf0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/pmf0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast p1, Ll/pmf0;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p1, p1, Ll/ike;->a:Ll/wyd0;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    invoke-direct {p0}, Ll/kmf0;->L0()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 93
    .line 94
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 95
    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->media:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 98
    .line 99
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 100
    .line 101
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, "image/jpeg"

    .line 106
    .line 107
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 110
    .line 111
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/ylf0;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/ylf0;-><init>(Ll/kmf0;)V

    .line 120
    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    const/4 v3, 0x0

    .line 124
    const/4 v4, 0x1

    .line 125
    invoke-static {p1, v1, v4, v2, v3}, Ll/ike;->s(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;ZZLcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v0, Ll/zlf0;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/zlf0;-><init>(Ll/kmf0;)V

    .line 136
    .line 137
    .line 138
    new-instance v1, Ll/amf0;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/amf0;-><init>(Ll/kmf0;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final synthetic D0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/kmf0;->a:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/pmf0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

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
    check-cast p1, Ll/pmf0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pmf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic F0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/pmf0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/kmf0;->L0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public G0(Ll/l4g0;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "phone_num"

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "signup_source"

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string v1, "photo_type"

    .line 27
    .line 28
    iget-object p0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const-string p0, "empty"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string p0, "uploaded"

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public H0()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public I0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    const-string v1, "account"

    .line 4
    .line 5
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "signup_data"

    .line 14
    .line 15
    iget-object p0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public J0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pmf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "phone_num"

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 39
    .line 40
    const-string v3, "signup_source"

    .line 41
    .line 42
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "upload_image_cnt"

    .line 52
    .line 53
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "e_imagepage_signup_start_button"

    .line 62
    .line 63
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/hmf0;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/hmf0;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/imf0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/imf0;-><init>(Ll/kmf0;)V

    .line 92
    .line 93
    .line 94
    new-instance v2, Ll/jmf0;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/jmf0;-><init>(Ll/kmf0;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/bmf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bmf0;-><init>(Ll/kmf0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/cmf0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/cmf0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/dmf0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/dmf0;-><init>(Ll/kmf0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "signup_data"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 24
    .line 25
    iput-object p1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Ll/pmf0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p1, Ll/pmf0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 67
    .line 68
    iput-object p1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 69
    .line 70
    :goto_0
    new-instance p1, Ljava/text/SimpleDateFormat;

    .line 71
    .line 72
    const-string v0, "yyyy-MM-dd"

    .line 73
    .line 74
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 75
    .line 76
    invoke-direct {p1, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/kmf0;->f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 80
    .line 81
    iget-object v1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 86
    .line 87
    :try_start_0
    new-instance v1, Ljava/util/Date;

    .line 88
    .line 89
    iget-object v2, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/Double;->longValue()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :catch_0
    iget-object v0, p0, Ll/kmf0;->f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 108
    .line 109
    new-instance v1, Ljava/util/Date;

    .line 110
    .line 111
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, v0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 119
    .line 120
    :goto_1
    iget-object p1, p0, Ll/kmf0;->f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 121
    .line 122
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 123
    .line 124
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 125
    .line 126
    iput-object v1, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 131
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v1, "+"

    .line 135
    .line 136
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 140
    .line 141
    iget v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 151
    .line 152
    iget-object p1, p0, Ll/kmf0;->f:Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 153
    .line 154
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 157
    .line 158
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 159
    .line 160
    const-string v0, "googleplay"

    .line 161
    .line 162
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 163
    .line 164
    iget-object v0, p0, Ll/kmf0;->g:Ll/y20;

    .line 165
    .line 166
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Ll/h9n;->c()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_2

    .line 174
    .line 175
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 176
    .line 177
    iget-object p0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 178
    .line 179
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 184
    .line 185
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 186
    .line 187
    .line 188
    iput-object p1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 189
    .line 190
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Ll/ike;->k()Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_2

    .line 199
    .line 200
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 201
    .line 202
    check-cast p1, Ll/pmf0;

    .line 203
    .line 204
    invoke-virtual {p1}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    new-instance v0, Ll/emf0;

    .line 219
    .line 220
    invoke-direct {v0, p0}, Ll/emf0;-><init>(Ll/kmf0;)V

    .line 221
    .line 222
    .line 223
    new-instance p0, Ll/fjf0;

    .line 224
    .line 225
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 226
    .line 227
    .line 228
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 233
    .line 234
    .line 235
    :cond_2
    :goto_2
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 10
    .line 11
    iput-object v2, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 v0, 0x0

    .line 51
    :goto_0
    iget-object v1, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 52
    .line 53
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 54
    .line 55
    iput-object v2, v1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 56
    .line 57
    iput-object v0, v1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v0, v1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 66
    .line 67
    iget p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 68
    .line 69
    iput p1, v1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->R0()Ll/wyd0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 90
    .line 91
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 92
    .line 93
    const-string p1, "image/jpeg"

    .line 94
    .line 95
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 96
    .line 97
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 98
    .line 99
    iget-object v0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast p1, Ll/pmf0;

    .line 107
    .line 108
    iget-object p0, p0, Ll/kmf0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    .line 109
    .line 110
    invoke-virtual {p1, p0}, Ll/pmf0;->k(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pmf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kmf0;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "netease"

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/pmf0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->t2(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/fmf0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fmf0;-><init>(Ll/kmf0;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/gmf0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/gmf0;-><init>(Ll/kmf0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method
