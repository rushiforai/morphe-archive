.class public Ll/mnh0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/tnh0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/data/RememberUserInfo;

.field public c:Lcom/p1/mobile/putong/data/RememberUserInfo;


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

.method private synthetic A0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/tnh0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 6
    .line 7
    iget-object p0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Ll/tnh0;->m(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic C0(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p1, Ll/tnh0;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v1}, Ll/tnh0;->l(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 24
    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->G0:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object v0
.end method

.method private synthetic D0(Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "user.change_account"

    .line 6
    .line 7
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->il(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "signin_type"

    .line 11
    .line 12
    const-string v0, "switch_account"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "e_signin_success"

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private synthetic E0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tnh0;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/tnh0;->l(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/eyd0;->i()Z

    .line 25
    .line 26
    .line 27
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    instance-of v0, p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    move-object v0, p1

    .line 40
    check-cast v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v0, v0, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->F0:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 54
    .line 55
    .line 56
    instance-of p0, p1, Ljava/net/UnknownHostException;

    .line 57
    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    instance-of p0, p1, Ljavax/net/ssl/SSLException;

    .line 61
    .line 62
    if-nez p0, :cond_1

    .line 63
    .line 64
    instance-of p0, p1, Ljava/net/SocketTimeoutException;

    .line 65
    .line 66
    if-nez p0, :cond_1

    .line 67
    .line 68
    instance-of p0, p1, Ljava/net/SocketException;

    .line 69
    .line 70
    if-nez p0, :cond_1

    .line 71
    .line 72
    new-instance p0, Ljava/lang/Exception;

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "switchAccount--> message:"

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v1, "--class:"

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void

    .line 111
    :cond_2
    :goto_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->V3:I

    .line 112
    .line 113
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 114
    .line 115
    .line 116
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 119
    .line 120
    invoke-virtual {p1}, Ll/eyd0;->i()Z

    .line 121
    .line 122
    .line 123
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 126
    .line 127
    invoke-virtual {p1}, Ll/eyd0;->i()Z

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const/4 v1, 0x0

    .line 143
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->kg(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method private synthetic F0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tnh0;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/tnh0;->l(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic G0(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    sput-boolean p1, Ll/tmh0;->d:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Mn(Landroid/content/Context;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/jnh0;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Ll/jnh0;-><init>(Ll/mnh0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic H0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/tnh0;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/tnh0;->l(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e0(Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f0(Ll/mnh0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->G0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/AuthData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->setAuthData(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic h0(Ll/mnh0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->D0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/mnh0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->E0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/mnh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mnh0;->F0()V

    return-void
.end method

.method public static synthetic k0(Ll/mnh0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->z0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l0(Ll/mnh0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->A0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m0(Ll/mnh0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->H0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/mnh0;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnh0;->C0(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private r0()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2, v1, v2}, Ll/uqb0;->Y0(ZLjava/lang/Class;ZZZ)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/knh0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/knh0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/lnh0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/lnh0;-><init>(Ll/mnh0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 38
    .line 39
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method private synthetic z0(Ll/uxj0;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast v3, Ll/tnh0;

    .line 62
    .line 63
    invoke-virtual {v3}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    if-eq v2, v3, :cond_1

    .line 68
    .line 69
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    instance-of v2, v2, Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 92
    .line 93
    check-cast p1, Ll/tnh0;

    .line 94
    .line 95
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 96
    .line 97
    iget-object p0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 98
    .line 99
    invoke-virtual {p1, v0, p0}, Ll/tnh0;->v(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method


# virtual methods
.method public I0(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->W3:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "switch_account_delay_millis"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->A(Ljava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-direct {p0}, Ll/mnh0;->r0()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Ll/cnh0;

    .line 26
    .line 27
    invoke-direct {v3, p0}, Ll/cnh0;-><init>(Ll/mnh0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 35
    .line 36
    invoke-virtual {v2, v0, v1, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/dnh0;

    .line 49
    .line 50
    invoke-direct {v1, p1}, Ll/dnh0;-><init>(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance v0, Ll/enh0;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/enh0;-><init>(Ll/mnh0;)V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/fnh0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/fnh0;-><init>(Ll/mnh0;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public J0()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/mnh0;->r0()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hnh0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/hnh0;-><init>(Ll/mnh0;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/inh0;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/inh0;-><init>(Ll/mnh0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/gnh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gnh0;-><init>(Ll/mnh0;)V

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

.method public o0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 14
    .line 15
    iget-object v1, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/sw6;->x3(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mnh0;->u0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/mnh0;->I0(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "e_switch_account_avatar"

    .line 35
    .line 36
    const-string v0, "p_switch_account_view"

    .line 37
    .line 38
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/tnh0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_add_account"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->X3:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/mnh0;->J0()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 48
    .line 49
    iget-object v1, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/sw6;->x3(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/mnh0;->u0()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/mnh0;->I0(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 66
    .line 67
    .line 68
    const-string p0, "e_switch_account_avatar"

    .line 69
    .line 70
    const-string v0, "p_switch_account_view"

    .line 71
    .line 72
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sw6;->x3(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s0()Lcom/p1/mobile/putong/data/RememberUserInfo;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/eyd0;->i()Z

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 37
    .line 38
    return-object p0
.end method

.method public t0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 3
    .line 4
    sget-object p0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/eyd0;->i()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x0()Z
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public y0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/mnh0;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 12
    .line 13
    iput-object p1, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 14
    .line 15
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 24
    .line 25
    iput-object p1, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 52
    .line 53
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RememberUserInfo;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/p1/mobile/putong/data/AuthData;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 73
    .line 74
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 83
    .line 84
    iget-object p0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 89
    .line 90
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 93
    .line 94
    invoke-virtual {p1, p0}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    sget-object p0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/eyd0;->i()Z

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Ll/sw6;->x3(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessToken()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 124
    .line 125
    iget-object v1, v1, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_2

    .line 134
    .line 135
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessToken()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 148
    .line 149
    :cond_2
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_3

    .line 164
    .line 165
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 172
    .line 173
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 174
    .line 175
    :cond_3
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-nez v0, :cond_4

    .line 186
    .line 187
    iget-object v0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 188
    .line 189
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 190
    .line 191
    iput-object p1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 192
    .line 193
    :cond_4
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 194
    .line 195
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 196
    .line 197
    iget-object p0, p0, Ll/mnh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 198
    .line 199
    invoke-virtual {p1, p0}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 204
    .line 205
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 206
    .line 207
    iget-object v1, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ll/sw6;->x3(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_9

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessToken()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 224
    .line 225
    iget-object v1, v1, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 226
    .line 227
    iget-object v1, v1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-nez v0, :cond_6

    .line 234
    .line 235
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 236
    .line 237
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessToken()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 248
    .line 249
    :cond_6
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-nez v0, :cond_7

    .line 264
    .line 265
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 266
    .line 267
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 272
    .line 273
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 274
    .line 275
    :cond_7
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 276
    .line 277
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_8

    .line 286
    .line 287
    iget-object v0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 288
    .line 289
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 290
    .line 291
    iput-object p1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 292
    .line 293
    :cond_8
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 294
    .line 295
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 296
    .line 297
    iget-object p0, p0, Ll/mnh0;->c:Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 298
    .line 299
    invoke-virtual {p1, p0}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    :cond_9
    :goto_0
    return-void
.end method
