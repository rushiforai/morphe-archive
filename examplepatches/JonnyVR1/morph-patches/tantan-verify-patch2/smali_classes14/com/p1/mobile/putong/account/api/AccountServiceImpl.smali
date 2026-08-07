.class public Lcom/p1/mobile/putong/account/api/AccountServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "account\u670d\u52a1"
    path = "/account_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qc;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qc;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/AccountServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Ll/y20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    const-string p1, "ccode"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/16 p2, 0x56

    .line 13
    .line 14
    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "+"

    .line 21
    .line 22
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public static synthetic H(Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/data/AuthData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public Aq(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/yx;

    .line 6
    .line 7
    invoke-direct {v0, p2}, Ll/yx;-><init>(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Em(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/api/a;->U0(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G6()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Jm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/api/a;->u2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Jr()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->j1()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public K7()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public Lr(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/ino;->INSTANCE:Ll/ino;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ino;->d(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Mn(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->E2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public N9()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    return p0
.end method

.method public Pd(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->T1(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Qa(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/api/a;->S1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Xg()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/cy;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Ll/bo;
    .locals 0

    .line 1
    invoke-static {}, Ll/co;->d()Ll/co;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public accessOutterToken()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->F0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public accessToken()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->G0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public buildBanReleaseVerifyIntent(Landroid/content/Context;Lcom/p1/mobile/putong/data/PhoneNumber;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "ban-appeal"

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget v0, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget v0, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1, p0, v0, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public checkDownloadData()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/DownloadDataCheck;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->I0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public checkSmartLockSave(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/qsf0;->e()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/util/Pair;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v1, v0}, Ll/qsf0;->h(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public clientNeedsForceUpdate()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dialogCCode(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/sm;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public downloadDataVerifyEmail(Lcom/p1/mobile/putong/data/EmailVerifyData;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/EmailVerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->K0(Lcom/p1/mobile/putong/data/EmailVerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public eq()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    return p0
.end method

.method public getAbHooker()Ll/m2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/AccountServiceImpl;->a:Ll/m2;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthData()Ll/gxd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSignOutJumpAct()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSignUpType()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSignUpType(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;
    .locals 0

    .line 8
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->e1(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public handleAccountErrors(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public hb(Lcom/p1/mobile/putong/data/IntlGender;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/IntlGender;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlGenderItem;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/ino;->INSTANCE:Ll/ino;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ino;->b(Lcom/p1/mobile/putong/data/IntlGender;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public il(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->X1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public isWelcomAct(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeBaseAct;

    .line 2
    .line 3
    return p0
.end method

.method public ji(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "change-email"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "bind-email"

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-static {p1, p0, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;ZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public kg(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->F2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public mp(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->w2(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onActivityResultForSmartLock(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/qsf0;->f(IILandroid/content/Intent;Ll/y20;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public oneClickBindPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/api/a;->P1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0, p3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;->X1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p9()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/mdp;->INSTANCE:Ll/mdp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mdp;->g()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->R1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public ql(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/ino;->INSTANCE:Ll/ino;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ino;->k(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/xx;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/xx;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public sendThirdPartLoginResult(ILjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->k(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAuthData(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->d2(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSignUpData(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public signOut()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->p2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public signedIn()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ixd0;->c()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/wx;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/wx;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public signedIn_()Z
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public startSignInAct(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->r2(Landroid/content/Context;Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t5()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public uk()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public updateLastUsedCCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public userId()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public verify(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public wj(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/gsj0;->d(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y7()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cpi;->c()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y8()V
    .locals 0

    .line 1
    invoke-static {}, Ll/v3q0;->N5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public zh()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/mdp;->INSTANCE:Ll/mdp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mdp;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
