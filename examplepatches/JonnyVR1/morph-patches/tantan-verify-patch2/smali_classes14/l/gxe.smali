.class public Ll/gxe;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/uxe;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Z

.field public f:Ljava/lang/String;

.field public g:I

.field public h:Lcom/p1/mobile/putong/data/VerifyReason;

.field public i:Ljava/lang/String;


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
    iput-boolean p1, p0, Ll/gxe;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic Q0(Ll/gxe;Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gxe;->n1(Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method

.method public static synthetic R0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S0(Ll/gxe;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gxe;->u1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/data/Captcha;)Ljava/lang/Boolean;
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

.method public static synthetic V0(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gxe;->r1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic W0(Ll/gxe;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gxe;->p1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X0(Ll/gxe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gxe;->t1()V

    return-void
.end method

.method public static synthetic Y0(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gxe;->q1(Lcom/p1/mobile/putong/data/VerifyDataV2;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a1(Ll/gxe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gxe;->l1()V

    return-void
.end method

.method public static synthetic b1(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gxe;->v1(Lcom/p1/mobile/putong/data/VerifyDataV2;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c1(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gxe;->o1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d1(Ll/gxe;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gxe;->m1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e1(Ll/gxe;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gxe;->s1(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic l1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/uxe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/uxe;->r()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/uxe;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/uxe;->B()Ljava/lang/String;

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
    invoke-virtual {p0, v0}, Ll/gxe;->x1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private synthetic m1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    new-instance p1, Ll/axe;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/axe;-><init>(Ll/gxe;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic n1(Lcom/p1/mobile/putong/data/Captcha;)V
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
    invoke-virtual {p0, p1}, Ll/gxe;->x1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
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
    const-string v1, "email"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "verify_type"

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/gxe;->g:I

    .line 36
    .line 37
    new-instance v0, Ll/twe;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/twe;-><init>(Ll/gxe;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Ll/esf0;->b:Lrx/subjects/b;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/xwe;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/xwe;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/ywe;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/ywe;-><init>(Ll/gxe;)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/zwe;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/zwe;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public f1(Ljava/lang/String;)V
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

.method public g1(Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gxe;->h:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    iput-object p2, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public h1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gxe;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public i1()Z
    .locals 1

    .line 1
    const-string v0, "signup_signin"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/gxe;->h:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public j1()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/gxe;->g:I

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

.method public k1()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/gxe;->g:I

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

.method public final synthetic o1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uxe;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uxe;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 9
    .line 10
    const v2, 0x62639

    .line 11
    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    const-string p1, "show_captcha"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/gxe;->f1(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    if-eqz v0, :cond_1

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 25
    .line 26
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 27
    .line 28
    const v1, 0x6263b

    .line 29
    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "e_intl_email_verification_risk_graph"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 47
    .line 48
    const-string v0, "email"

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Ll/olj;->d(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 59
    .line 60
    check-cast v0, Ll/uxe;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ll/uxe;->R(Ljava/lang/Throwable;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p0, Ll/uxe;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/uxe;->T()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/data/VerifyDataV2;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/gxe;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gxe;->j1()Z

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
    const-string v1, "e_intl_email_verification_code_error"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    move-object v1, p2

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 29
    .line 30
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 31
    .line 32
    const v2, 0x62639

    .line 33
    .line 34
    .line 35
    if-ne v1, v2, :cond_1

    .line 36
    .line 37
    const-string p2, "show_captcha"

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/gxe;->f1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    if-eqz v0, :cond_2

    .line 44
    .line 45
    move-object v0, p2

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 47
    .line 48
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 49
    .line 50
    const v1, 0x61b15

    .line 51
    .line 52
    .line 53
    if-ne v0, v1, :cond_2

    .line 54
    .line 55
    sget p2, Lcom/p1/mobile/putong/account/R$string;->b1:I

    .line 56
    .line 57
    invoke-static {p2}, Ll/r1j0;->f(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast v0, Ll/uxe;

    .line 64
    .line 65
    invoke-virtual {v0, p2}, Ll/uxe;->R(Ljava/lang/Throwable;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const-string v1, "Sign Up"

    .line 70
    .line 71
    const-string v2, "Email register fail"

    .line 72
    .line 73
    const-string v3, "Sign up status"

    .line 74
    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    invoke-static {p2}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    new-instance p2, Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 89
    .line 90
    invoke-virtual {v0, v1, p2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    new-instance p2, Ljava/util/HashMap;

    .line 95
    .line 96
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 103
    .line 104
    invoke-virtual {v0, v1, p2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast p2, Ll/uxe;

    .line 110
    .line 111
    invoke-virtual {p2}, Ll/uxe;->T()V

    .line 112
    .line 113
    .line 114
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 115
    .line 116
    const-string v0, "bind-email"

    .line 117
    .line 118
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-nez p2, :cond_4

    .line 123
    .line 124
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 125
    .line 126
    const-string v1, "change-email"

    .line 127
    .line 128
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_7

    .line 133
    .line 134
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 135
    .line 136
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-eqz p2, :cond_5

    .line 141
    .line 142
    const-string p2, "e_account_add_email_code_done"

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_5
    const-string p2, "e_account_replace_email_code_done"

    .line 146
    .line 147
    :goto_1
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 148
    .line 149
    check-cast v1, Ll/uxe;

    .line 150
    .line 151
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 160
    .line 161
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    const-string v3, "add_result"

    .line 166
    .line 167
    if-eqz v2, :cond_6

    .line 168
    .line 169
    move-object v2, v3

    .line 170
    goto :goto_2

    .line 171
    :cond_6
    const-string v2, "replace_result"

    .line 172
    .line 173
    :goto_2
    const-string v4, "fail"

    .line 174
    .line 175
    invoke-static {v2, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    filled-new-array {v2}, [Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-static {p2, v1, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 187
    .line 188
    const-string p2, "bind_or_change_email"

    .line 189
    .line 190
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-eqz p0, :cond_7

    .line 195
    .line 196
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 197
    .line 198
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-eqz p0, :cond_7

    .line 203
    .line 204
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    filled-new-array {p0}, [Ll/pf60;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    const-string p1, "e_intl_account_add_email_result"

    .line 213
    .line 214
    const-string p2, "p_account_and_security_view"

    .line 215
    .line 216
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 217
    .line 218
    .line 219
    :cond_7
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p3, Ll/uxe;

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/uxe;->T()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    const-string p3, "ttt-signup"

    .line 18
    .line 19
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

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
    move-result-object p1

    .line 33
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p3, Ll/uxe;

    .line 36
    .line 37
    invoke-virtual {p3}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    new-instance p1, Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string p2, "Sign up status"

    .line 54
    .line 55
    const-string p3, "Email register success"

    .line 56
    .line 57
    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    sget-object p2, Ll/x95;->INSTANCE:Ll/x95;

    .line 61
    .line 62
    const-string p3, "Sign Up"

    .line 63
    .line 64
    invoke-virtual {p2, p3, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/gxe;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/uxe;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/uxe;->T()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/uxe;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/uxe;->z()V

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
    const-string v0, "Email register fail"

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

.method public final synthetic t1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uxe;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uxe;->B()Ljava/lang/String;

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
    const-string v1, "email"

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

.method public final synthetic u1(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/gxe;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/uxe;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/uxe;->T()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gxe;->j1()Z

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
    const-string v0, "e_intl_email_verification_code_error"

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
    const-string v0, "email"

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

.method public final synthetic v1(Lcom/p1/mobile/putong/data/VerifyDataV2;Ll/uxj0;)V
    .locals 6

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->email:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 7
    .line 8
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 15
    .line 16
    iput v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    if-eqz v0, :cond_b

    .line 50
    .line 51
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Ll/uxe;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/uxe;->B()Ljava/lang/String;

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
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyDataV2;->v2ConvertV1(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lcom/p1/mobile/putong/data/VerifyData;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v0, v1, p2, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 87
    .line 88
    .line 89
    goto/16 :goto_5

    .line 90
    .line 91
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 92
    .line 93
    const-string v1, "signup"

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const/4 v1, 0x1

    .line 100
    if-nez v0, :cond_a

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 103
    .line 104
    const-string v2, "ttt-signup"

    .line 105
    .line 106
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    goto/16 :goto_4

    .line 113
    .line 114
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 115
    .line 116
    const-string v0, "bind-email"

    .line 117
    .line 118
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-nez p2, :cond_3

    .line 123
    .line 124
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 125
    .line 126
    const-string v2, "change-email"

    .line 127
    .line 128
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_2

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    new-instance p2, Lcom/p1/mobile/putong/data/SignInData;

    .line 136
    .line 137
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 138
    .line 139
    .line 140
    iget p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 141
    .line 142
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 147
    .line 148
    iget-object p1, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 149
    .line 150
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 151
    .line 152
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 153
    .line 154
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 155
    .line 156
    .line 157
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 158
    .line 159
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 164
    .line 165
    const-string p1, "email"

    .line 166
    .line 167
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 172
    .line 173
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 178
    .line 179
    .line 180
    new-instance p1, Ll/vwe;

    .line 181
    .line 182
    invoke-direct {p1, p0}, Ll/vwe;-><init>(Ll/gxe;)V

    .line 183
    .line 184
    .line 185
    new-instance v0, Ll/wwe;

    .line 186
    .line 187
    invoke-direct {v0, p0}, Ll/wwe;-><init>(Ll/gxe;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, p2, p1, v0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 191
    .line 192
    .line 193
    goto/16 :goto_5

    .line 194
    .line 195
    :cond_3
    :goto_0
    sget p2, Lcom/p1/mobile/putong/account/R$string;->U0:I

    .line 196
    .line 197
    invoke-static {p2}, Ll/r1j0;->f(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 205
    .line 206
    .line 207
    const-string p2, "home"

    .line 208
    .line 209
    iget-object v2, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    const-string v2, "bind_or_change_email"

    .line 216
    .line 217
    const/4 v3, 0x0

    .line 218
    if-eqz p2, :cond_4

    .line 219
    .line 220
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 221
    .line 222
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    if-eqz p2, :cond_4

    .line 227
    .line 228
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-interface {p2, v4, v3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 252
    .line 253
    .line 254
    goto/16 :goto_1

    .line 255
    .line 256
    :cond_4
    const-string p2, "messageDeeplink"

    .line 257
    .line 258
    iget-object v4, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result p2

    .line 264
    const/high16 v4, 0x4000000

    .line 265
    .line 266
    if-eqz p2, :cond_5

    .line 267
    .line 268
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    const-string v5, "-1"

    .line 277
    .line 278
    invoke-interface {p2, v1, v5, v3, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    invoke-virtual {p2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    invoke-virtual {v1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 290
    .line 291
    .line 292
    goto :goto_1

    .line 293
    :cond_5
    iget-object p2, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 294
    .line 295
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p2

    .line 299
    if-eqz p2, :cond_6

    .line 300
    .line 301
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 302
    .line 303
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 304
    .line 305
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    invoke-interface {p2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Us(Lcom/p1/mobile/android/app/Act;)V

    .line 310
    .line 311
    .line 312
    goto :goto_1

    .line 313
    :cond_6
    const-string p2, "google_login_verify_email"

    .line 314
    .line 315
    iget-object v5, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result p2

    .line 321
    if-eqz p2, :cond_7

    .line 322
    .line 323
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    const-string v1, "verified"

    .line 328
    .line 329
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    const-string v3, "google-email-saved"

    .line 334
    .line 335
    invoke-static {v3}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    filled-new-array {v3}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    invoke-virtual {p2, v1, v3}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 347
    .line 348
    .line 349
    move-result-object p2

    .line 350
    invoke-static {p2}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 351
    .line 352
    .line 353
    move-result-object p2

    .line 354
    invoke-virtual {p2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    invoke-virtual {v1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 362
    .line 363
    .line 364
    goto :goto_1

    .line 365
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 366
    .line 367
    .line 368
    move-result-object p2

    .line 369
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 370
    .line 371
    .line 372
    move-result-object v4

    .line 373
    invoke-interface {p2, v4, v3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 374
    .line 375
    .line 376
    move-result-object p2

    .line 377
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 385
    .line 386
    .line 387
    move-result-object p2

    .line 388
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 389
    .line 390
    .line 391
    :goto_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 392
    .line 393
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 394
    .line 395
    .line 396
    move-result p2

    .line 397
    if-eqz p2, :cond_8

    .line 398
    .line 399
    const-string p2, "e_account_add_email_code_done"

    .line 400
    .line 401
    goto :goto_2

    .line 402
    :cond_8
    const-string p2, "e_account_replace_email_code_done"

    .line 403
    .line 404
    :goto_2
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 405
    .line 406
    check-cast v1, Ll/uxe;

    .line 407
    .line 408
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 417
    .line 418
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result v3

    .line 422
    const-string v4, "add_result"

    .line 423
    .line 424
    if-eqz v3, :cond_9

    .line 425
    .line 426
    move-object v3, v4

    .line 427
    goto :goto_3

    .line 428
    :cond_9
    const-string v3, "replace_result"

    .line 429
    .line 430
    :goto_3
    const-string v5, "success"

    .line 431
    .line 432
    invoke-static {v3, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 433
    .line 434
    .line 435
    move-result-object v3

    .line 436
    filled-new-array {v3}, [Ll/pf60;

    .line 437
    .line 438
    .line 439
    move-result-object v3

    .line 440
    invoke-static {p2, v1, v3}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 441
    .line 442
    .line 443
    iget-object p0, p0, Ll/gxe;->i:Ljava/lang/String;

    .line 444
    .line 445
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 446
    .line 447
    .line 448
    move-result p0

    .line 449
    if-eqz p0, :cond_b

    .line 450
    .line 451
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 452
    .line 453
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 454
    .line 455
    .line 456
    move-result p0

    .line 457
    if-eqz p0, :cond_b

    .line 458
    .line 459
    invoke-static {v4, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 460
    .line 461
    .line 462
    move-result-object p0

    .line 463
    filled-new-array {p0}, [Ll/pf60;

    .line 464
    .line 465
    .line 466
    move-result-object p0

    .line 467
    const-string p1, "e_intl_account_add_email_result"

    .line 468
    .line 469
    const-string p2, "p_account_and_security_view"

    .line 470
    .line 471
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 472
    .line 473
    .line 474
    goto :goto_5

    .line 475
    :cond_a
    :goto_4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 476
    .line 477
    check-cast v0, Ll/uxe;

    .line 478
    .line 479
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    const/4 v2, 0x0

    .line 484
    invoke-static {p2, v2, v1}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    new-instance v1, Ll/fxe;

    .line 493
    .line 494
    invoke-direct {v1, p0, p1, p2}, Ll/fxe;-><init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 495
    .line 496
    .line 497
    new-instance p1, Ll/uwe;

    .line 498
    .line 499
    invoke-direct {p1, p0}, Ll/uwe;-><init>(Ll/gxe;)V

    .line 500
    .line 501
    .line 502
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 503
    .line 504
    .line 505
    move-result-object p0

    .line 506
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 507
    .line 508
    .line 509
    :cond_b
    :goto_5
    invoke-static {}, Ll/bp;->j()Z

    .line 510
    .line 511
    .line 512
    return-void
.end method

.method public x1(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gxe;->f:Ljava/lang/String;

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
    sget p0, Lcom/p1/mobile/putong/account/R$string;->j2:I

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
    iget-object v1, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v1, 0x4

    .line 38
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/uxe;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/uxe;->S()V

    .line 53
    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/pw;->I(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v1, Ll/bxe;

    .line 70
    .line 71
    invoke-direct {v1, p0, v0}, Ll/bxe;-><init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/cxe;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/cxe;-><init>(Ll/gxe;)V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x0

    .line 80
    invoke-static {v1, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public z1()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/gxe;->h:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    iget-object v1, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/uxe;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/uxe;->A()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 32
    .line 33
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v1, Ll/uxe;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/uxe;->S()V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    iput-boolean v1, p0, Ll/gxe;->e:Z

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->M0(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/dxe;

    .line 50
    .line 51
    invoke-direct {v2, p0, v0}, Ll/dxe;-><init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ll/exe;

    .line 55
    .line 56
    invoke-direct {v3, p0, v0}, Ll/exe;-><init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    invoke-static {v2, v3, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method
