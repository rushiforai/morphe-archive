.class public Ll/q6f0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/jbf0;",
        ">",
        "Ll/ibf0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Ll/q6f0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q6f0;->l1(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic R0(Ll/q6f0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q6f0;->m1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic S0(Ll/q6f0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q6f0;->i1(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic U0(Ll/q6f0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/q6f0;->n1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X0(Ll/q6f0;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q6f0;->k1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    new-instance v0, Ll/g6f0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/g6f0;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic a1()V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    new-instance v0, Ll/n6f0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/n6f0;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic d1(Ll/q6f0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q6f0;->h1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f1(Ll/q6f0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q6f0;->j1(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public g1(Z)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final synthetic h1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/q6f0;->p1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic i1(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 1

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p2, Ll/jbf0;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/jbf0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget p2, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 p2, 0x0

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {p0, p2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic j1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q6f0;->r1()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bp;->j()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/q6f0;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic k1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/jbf0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p2, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p2, 0x0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-static {p0, p2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic l1(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 1

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-virtual {p0, p2}, Ll/q6f0;->g1(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/jbf0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/jbf0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0, p2}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic m1(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->m2(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/q6f0;->r1()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/bp;->j()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Ll/q6f0;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic n1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/q6f0;->g1(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Ll/jbf0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    instance-of v1, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    move-object v3, p3

    .line 22
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 23
    .line 24
    iget v3, v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 25
    .line 26
    const v4, 0x9c54

    .line 27
    .line 28
    .line 29
    if-eq v3, v4, :cond_0

    .line 30
    .line 31
    const v5, 0x9c9b

    .line 32
    .line 33
    .line 34
    if-ne v3, v5, :cond_2

    .line 35
    .line 36
    :cond_0
    if-ne v3, v4, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v2

    .line 40
    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Ll/q6f0;->o1(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    if-eqz v1, :cond_4

    .line 45
    .line 46
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 47
    .line 48
    iget p3, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 49
    .line 50
    const v1, 0x9c50

    .line 51
    .line 52
    .line 53
    if-ne p3, v1, :cond_4

    .line 54
    .line 55
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 56
    .line 57
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 61
    .line 62
    const-string p3, "cosmos"

    .line 63
    .line 64
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 71
    .line 72
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 73
    .line 74
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 77
    .line 78
    .line 79
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p3, p0, Ll/q6f0;->e:Ljava/lang/String;

    .line 86
    .line 87
    iput-object p3, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 88
    .line 89
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast p1, Ll/jbf0;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 98
    .line 99
    check-cast p3, Ll/jbf0;

    .line 100
    .line 101
    invoke-virtual {p3}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 113
    .line 114
    check-cast p1, Ll/jbf0;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 124
    .line 125
    check-cast p1, Ll/jbf0;

    .line 126
    .line 127
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 132
    .line 133
    .line 134
    invoke-static {}, Ll/bp;->j()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_5

    .line 139
    .line 140
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iget-object p0, p0, Ll/q6f0;->e:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 151
    .line 152
    check-cast p0, Ll/jbf0;

    .line 153
    .line 154
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    sget p1, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0, v2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 167
    .line 168
    .line 169
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_5

    .line 174
    .line 175
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 176
    .line 177
    .line 178
    :cond_5
    return-void
.end method

.method public final o1(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/jbf0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    sget v2, Lcom/p1/mobile/putong/account/R$string;->V2:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget v2, Lcom/p1/mobile/putong/account/R$string;->T2:I

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    sget p1, Lcom/p1/mobile/putong/account/R$string;->W2:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->U2:I

    .line 45
    .line 46
    :goto_1
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget v1, Lcom/p1/mobile/putong/account/R$string;->z:I

    .line 51
    .line 52
    new-instance v2, Ll/l6f0;

    .line 53
    .line 54
    invoke-direct {v2, p0, p2, p3}, Ll/l6f0;-><init>(Ll/q6f0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget p2, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 62
    .line 63
    new-instance p3, Ll/m6f0;

    .line 64
    .line 65
    invoke-direct {p3}, Ll/m6f0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ll/q6f0$a;

    .line 73
    .line 74
    invoke-direct {p2, p0, v0}, Ll/q6f0$a;-><init>(Ll/q6f0;Ll/l4g0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public p1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/jbf0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x1388

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/o6f0;

    .line 34
    .line 35
    invoke-direct {v2, p0, p2}, Ll/o6f0;-><init>(Ll/q6f0;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/p6f0;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/p6f0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/d6f0;

    .line 52
    .line 53
    invoke-direct {v2, p1}, Ll/d6f0;-><init>(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/e6f0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/e6f0;-><init>(Ll/q6f0;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/f6f0;

    .line 71
    .line 72
    invoke-direct {v1, p0, p2}, Ll/f6f0;-><init>(Ll/q6f0;Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public q1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/jbf0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x1388

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/c6f0;

    .line 34
    .line 35
    invoke-direct {v2, p0, p2}, Ll/c6f0;-><init>(Ll/q6f0;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/h6f0;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/h6f0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/i6f0;

    .line 52
    .line 53
    invoke-direct {v2, p1}, Ll/i6f0;-><init>(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/j6f0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/j6f0;-><init>(Ll/q6f0;)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ll/k6f0;

    .line 71
    .line 72
    invoke-direct {v3, p0, p1, p2}, Ll/k6f0;-><init>(Ll/q6f0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v3, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public r1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 14
    .line 15
    const-string v1, "unknown_"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, v0}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x0

    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v1, Ll/jbf0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast v1, Ll/jbf0;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Ll/jbf0;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 81
    .line 82
    .line 83
    return-void
.end method
