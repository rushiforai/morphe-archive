.class public Ll/g8l0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/w8l0;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/g8l0;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method private synthetic B1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w8l0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "Method used"

    .line 18
    .line 19
    const-string v1, "Phone"

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string v0, "Status"

    .line 25
    .line 26
    const-string v1, "Success"

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 32
    .line 33
    invoke-static {v0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "Version"

    .line 38
    .line 39
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 43
    .line 44
    const-string v1, "Login"

    .line 45
    .line 46
    invoke-virtual {v0, v1, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic C1(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/w8l0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/w8l0;->Z()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g8l0;->o1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "e_code_wrong_tip"

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const-string p0, "inActivated"

    .line 31
    .line 32
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    new-instance p0, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string p1, "Method used"

    .line 44
    .line 45
    const-string v0, "Phone"

    .line 46
    .line 47
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const-string p1, "Status"

    .line 51
    .line 52
    const-string v0, "Failure"

    .line 53
    .line 54
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 58
    .line 59
    invoke-static {p1}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v0, "Version"

    .line 64
    .line 65
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 69
    .line 70
    const-string v0, "Login"

    .line 71
    .line 72
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public static synthetic Q0(Ll/g8l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g8l0;->J1()V

    return-void
.end method

.method public static synthetic R0(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8l0;->Q1(Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method

.method public static synthetic S0(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g8l0;->D1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic U0(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g8l0;->t1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method

.method public static synthetic V0(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g8l0;->H1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic W0(Ll/g8l0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8l0;->L1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X0(Ll/g8l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g8l0;->z1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y0(Ll/g8l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g8l0;->B1()V

    return-void
.end method

.method public static synthetic a1(Ll/g8l0;Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g8l0;->s1(Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method

.method public static synthetic b1(Ll/g8l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8l0;->I1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c1(Ll/g8l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g8l0;->q1()V

    return-void
.end method

.method public static synthetic d1(Ll/g8l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g8l0;->u1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e1(Ll/g8l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g8l0;->E1()V

    return-void
.end method

.method public static synthetic f1(Ll/g8l0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8l0;->F1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/data/Captcha;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Captcha;->localExpired:Z

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

.method public static synthetic h1(Ll/g8l0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g8l0;->C1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i1(Ll/g8l0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g8l0;->r1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j1(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g8l0;->x1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k1(Ll/g8l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8l0;->v1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic q1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/w8l0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/w8l0;->r()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/w8l0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/g8l0;->N1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private synthetic r1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    new-instance p1, Ll/a8l0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/a8l0;-><init>(Ll/g8l0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic s1(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/g8l0;->N1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic u1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v1, p1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v2, 0x62639

    .line 14
    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    const-string p1, "show_captcha"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/g8l0;->m1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move-object v0, p1

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 30
    .line 31
    const v1, 0x6263b

    .line 32
    .line 33
    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Ll/w8l0;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ll/w8l0;->X(Ljava/lang/Throwable;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast p0, Ll/w8l0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private synthetic z1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/w8l0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/w8l0;->Z()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/w8l0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/w8l0;->C()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string p1, "Sign up status"

    .line 27
    .line 28
    const-string v0, "Phone number register fail"

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 34
    .line 35
    const-string v0, "Sign Up"

    .line 36
    .line 37
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final synthetic D1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 3

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 7
    .line 8
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 11
    .line 12
    iput v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 15
    .line 16
    iput v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 36
    .line 37
    const-string v1, "pending"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Ll/w8l0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1, p2, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_1

    .line 86
    .line 87
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 88
    .line 89
    const-string v1, "signup"

    .line 90
    .line 91
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 98
    .line 99
    const-string v1, "ttt-signup"

    .line 100
    .line 101
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    new-instance p2, Lcom/p1/mobile/putong/data/SignInData;

    .line 109
    .line 110
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 111
    .line 112
    .line 113
    iget p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 114
    .line 115
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 120
    .line 121
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    iget v0, p0, Ll/g8l0;->f:I

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v0, " "

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 146
    .line 147
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 148
    .line 149
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 153
    .line 154
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 159
    .line 160
    const-string p1, "confirmation_code"

    .line 161
    .line 162
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 167
    .line 168
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 173
    .line 174
    .line 175
    new-instance p1, Ll/v7l0;

    .line 176
    .line 177
    invoke-direct {p1, p0}, Ll/v7l0;-><init>(Ll/g8l0;)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Ll/w7l0;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Ll/w7l0;-><init>(Ll/g8l0;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p2, p1, v0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 190
    .line 191
    check-cast v0, Ll/w8l0;

    .line 192
    .line 193
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const/4 v1, 0x0

    .line 198
    const/4 v2, 0x1

    .line 199
    invoke-static {p2, v1, v2}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    new-instance v0, Ll/t7l0;

    .line 208
    .line 209
    invoke-direct {v0, p0, p1}, Ll/t7l0;-><init>(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 210
    .line 211
    .line 212
    new-instance p1, Ll/u7l0;

    .line 213
    .line 214
    invoke-direct {p1, p0}, Ll/u7l0;-><init>(Ll/g8l0;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 222
    .line 223
    .line 224
    :cond_3
    :goto_1
    invoke-static {}, Ll/bp;->j()Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    if-eqz p1, :cond_4

    .line 229
    .line 230
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    iget-object p0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_4
    return-void
.end method

.method public final synthetic E1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/w8l0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/w8l0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic F1(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/w8l0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p2, Ll/w8l0;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/w8l0;->Z()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    const-string v0, "ttt-signup"

    .line 18
    .line 19
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/w8l0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-static {v0, p1, v1, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic I1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/w8l0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/w8l0;->Z()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/w8l0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/w8l0;->C()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic J1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/w8l0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/w8l0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic L1(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/w8l0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public N1(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/account/R$string;->Z:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "signup_signin"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 32
    .line 33
    iget v1, p0, Ll/g8l0;->f:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 36
    .line 37
    iget-object v1, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v1, 0x4

    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p1, Ll/w8l0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/w8l0;->Y()V

    .line 57
    .line 58
    .line 59
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 60
    .line 61
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v1, Ll/b8l0;

    .line 71
    .line 72
    invoke-direct {v1, p0, v0}, Ll/b8l0;-><init>(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/c8l0;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/c8l0;-><init>(Ll/g8l0;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x0

    .line 81
    invoke-static {v1, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public O1()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "signup_signin"

    .line 13
    .line 14
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 19
    .line 20
    iget v1, p0, Ll/g8l0;->f:I

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 23
    .line 24
    iget-object v1, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v1, Ll/w8l0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/w8l0;->E()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 40
    .line 41
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v1, Ll/w8l0;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/w8l0;->Y()V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    iput-boolean v1, p0, Ll/g8l0;->e:Z

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/n7l0;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0}, Ll/n7l0;-><init>(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/o7l0;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/o7l0;-><init>(Ll/g8l0;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    invoke-static {v2, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public P1()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v1, Ll/w8l0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/w8l0;->E()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    iget v2, p0, Ll/g8l0;->f:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, " "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/data/Device;

    .line 47
    .line 48
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 52
    .line 53
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 58
    .line 59
    const-string v1, "confirmation_code"

    .line 60
    .line 61
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    iput-boolean v1, p0, Ll/g8l0;->e:Z

    .line 69
    .line 70
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v1, Ll/w8l0;

    .line 73
    .line 74
    invoke-virtual {v1}, Ll/w8l0;->Y()V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/e8l0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/e8l0;-><init>(Ll/g8l0;)V

    .line 80
    .line 81
    .line 82
    new-instance v2, Ll/f8l0;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/f8l0;-><init>(Ll/g8l0;)V

    .line 85
    .line 86
    .line 87
    const/4 v3, 0x0

    .line 88
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/ibf0;->L0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;Z)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final Q1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 16
    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 18
    .line 19
    iput v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 20
    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 47
    .line 48
    const-string v2, "pending"

    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast v1, Ll/w8l0;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/w8l0;->F()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Ll/l51;->K(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2, v0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 94
    .line 95
    .line 96
    goto/16 :goto_1

    .line 97
    .line 98
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 99
    .line 100
    const-string v2, "signup"

    .line 101
    .line 102
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-nez v1, :cond_2

    .line 107
    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 109
    .line 110
    const-string v2, "ttt-signup"

    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 120
    .line 121
    check-cast v0, Ll/w8l0;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/w8l0;->Y()V

    .line 124
    .line 125
    .line 126
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 127
    .line 128
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 129
    .line 130
    .line 131
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 132
    .line 133
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 142
    .line 143
    new-instance p1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    iget v1, p0, Ll/g8l0;->f:I

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, " "

    .line 154
    .line 155
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 168
    .line 169
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 170
    .line 171
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 172
    .line 173
    .line 174
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 175
    .line 176
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 181
    .line 182
    const-string p1, "confirmation_code"

    .line 183
    .line 184
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 189
    .line 190
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 195
    .line 196
    .line 197
    new-instance p1, Ll/r7l0;

    .line 198
    .line 199
    invoke-direct {p1, p0}, Ll/r7l0;-><init>(Ll/g8l0;)V

    .line 200
    .line 201
    .line 202
    new-instance v1, Ll/s7l0;

    .line 203
    .line 204
    invoke-direct {v1, p0}, Ll/s7l0;-><init>(Ll/g8l0;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, v0, p1, v1}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 212
    .line 213
    check-cast v1, Ll/w8l0;

    .line 214
    .line 215
    invoke-virtual {v1}, Ll/w8l0;->Y()V

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 219
    .line 220
    check-cast v1, Ll/w8l0;

    .line 221
    .line 222
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const/4 v2, 0x0

    .line 227
    const/4 v3, 0x1

    .line 228
    invoke-static {v0, v2, v3}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    new-instance v1, Ll/p7l0;

    .line 237
    .line 238
    invoke-direct {v1, p0, p1}, Ll/p7l0;-><init>(Ll/g8l0;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 239
    .line 240
    .line 241
    new-instance p1, Ll/q7l0;

    .line 242
    .line 243
    invoke-direct {p1, p0}, Ll/q7l0;-><init>(Ll/g8l0;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 251
    .line 252
    .line 253
    :cond_3
    :goto_1
    invoke-static {}, Ll/bp;->j()Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-eqz p1, :cond_4

    .line 258
    .line 259
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iget-object p0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    :cond_4
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "ccode"

    .line 13
    .line 14
    const/16 v2, 0x56

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Ll/g8l0;->f:I

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "phone"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "verify_type"

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Ll/g8l0;->h:I

    .line 54
    .line 55
    new-instance v0, Ll/m7l0;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/m7l0;-><init>(Ll/g8l0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v1, v1, Ll/esf0;->b:Lrx/subjects/b;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/x7l0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/x7l0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/y7l0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/y7l0;-><init>(Ll/g8l0;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/z7l0;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/z7l0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public m1(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "back_reason"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v1, -0x1

    .line 16
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g8l0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public o1()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/g8l0;->h:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public p1()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/g8l0;->h:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/w8l0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/w8l0;->Z()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/d8l0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/d8l0;-><init>(Ll/g8l0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p2, p1, v1}, Ll/fdd0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/w8l0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/w8l0;->W()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic v1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/g8l0;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g8l0;->o1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "e_code_wrong_tip"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 24
    .line 25
    const v1, 0x62639

    .line 26
    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    move-object v2, p1

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 32
    .line 33
    iget v2, v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 34
    .line 35
    if-ne v2, v1, :cond_1

    .line 36
    .line 37
    const-string v2, "show_captcha"

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/g8l0;->m1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v2, Ll/w8l0;

    .line 46
    .line 47
    invoke-virtual {v2, p1}, Ll/w8l0;->X(Ljava/lang/Throwable;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 57
    .line 58
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 59
    .line 60
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 61
    .line 62
    if-eq p1, v1, :cond_5

    .line 63
    .line 64
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 65
    .line 66
    iget-boolean p1, p1, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 67
    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    new-instance p1, Ljava/util/HashMap;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v0, "Method used"

    .line 76
    .line 77
    const-string v1, "Phone"

    .line 78
    .line 79
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string v0, "Status"

    .line 83
    .line 84
    const-string v1, "Failure"

    .line 85
    .line 86
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 90
    .line 91
    invoke-static {v0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v1, "Version"

    .line 96
    .line 97
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 101
    .line 102
    const-string v1, "Login"

    .line 103
    .line 104
    invoke-virtual {v0, v1, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    new-instance p1, Ljava/util/HashMap;

    .line 109
    .line 110
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v0, "Sign up status"

    .line 114
    .line 115
    const-string v1, "Phone number register fail"

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 121
    .line 122
    const-string v1, "Sign Up"

    .line 123
    .line 124
    invoke-virtual {v0, v1, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 128
    .line 129
    check-cast p0, Ll/w8l0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p2, Ll/w8l0;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/w8l0;->Z()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    const-string v0, "ttt-signup"

    .line 18
    .line 19
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/w8l0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-static {v0, p1, v1, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    new-instance p1, Ljava/util/HashMap;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string p2, "Sign up status"

    .line 55
    .line 56
    const-string v0, "Phone number register success"

    .line 57
    .line 58
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    sget-object p2, Ll/x95;->INSTANCE:Ll/x95;

    .line 62
    .line 63
    const-string v0, "Sign Up"

    .line 64
    .line 65
    invoke-virtual {p2, v0, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 73
    .line 74
    .line 75
    return-void
.end method
