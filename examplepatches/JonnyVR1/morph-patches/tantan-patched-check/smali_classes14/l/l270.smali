.class public Ll/l270;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/w270;",
        ">;"
    }
.end annotation


# static fields
.field public static n:I


# instance fields
.field public e:Lcom/p1/mobile/putong/data/VerifyReason;

.field public f:Lcom/p1/mobile/putong/data/SignInData;

.field public g:Lcom/p1/mobile/putong/data/SignUpData;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/l270;->m:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic Q0(Ll/l270;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l270;->g1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic R0(Ll/l270;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l270;->i1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic S0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U0(Ll/l270;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l270;->k1(Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method

.method public static synthetic V0(Ll/l270;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l270;->j1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic W0(Ll/l270;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l270;->n1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X0(Ll/l270;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l270;->h1()V

    return-void
.end method

.method public static synthetic Y0(Ll/l270;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l270;->l1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a1(Ll/l270;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l270;->m1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method private f1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/d270;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/d270;-><init>(Ll/l270;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic j1(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Ll/w270;

    .line 5
    .line 6
    iget-object v1, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    iget-object v2, p0, Ll/l270;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    iget-boolean v3, p0, Ll/l270;->h:Z

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/l270;->i:Z

    .line 13
    .line 14
    iget-boolean v5, p0, Ll/l270;->j:Z

    .line 15
    .line 16
    iget-object v6, p0, Ll/l270;->l:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual/range {v0 .. v6}, Ll/w270;->A(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;ZZZLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c270;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/c270;-><init>(Ll/l270;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/l270;->f1()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public b1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/l270;->h:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public c1(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    .line 5
    .line 6
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v2, 0x1d

    .line 9
    .line 10
    if-gt v1, v2, :cond_0

    .line 11
    .line 12
    const-string v1, "android.permission.READ_PHONE_STATE"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, "android.permission.READ_PHONE_NUMBERS"

    .line 16
    .line 17
    :goto_0
    const/4 v2, 0x0

    .line 18
    aput-object v1, v0, v2

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v0, "phone"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/telephony/TelephonyManager;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    :cond_1
    move-object p1, p0

    .line 40
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    const-string v0, "+86"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    const/4 p0, 0x3

    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :cond_2
    return-object p0
.end method

.method public d1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "signin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/w270;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/w270;->O()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/w270;

    .line 22
    .line 23
    iget-object v0, v0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    check-cast v0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x3c

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/i270;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/i270;-><init>(Ll/l270;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/j270;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/j270;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/k270;

    .line 52
    .line 53
    invoke-direct {v3, p0}, Ll/k270;-><init>(Ll/l270;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/SignUpData;ZZZZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    iput-object p2, p0, Ll/l270;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 4
    .line 5
    iput-object p3, p0, Ll/l270;->g:Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/l270;->h:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/l270;->i:Z

    .line 10
    .line 11
    iput-boolean p6, p0, Ll/l270;->j:Z

    .line 12
    .line 13
    iput-boolean p7, p0, Ll/l270;->k:Z

    .line 14
    .line 15
    iput-object p8, p0, Ll/l270;->l:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public final synthetic g1(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w270;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/w270;->Q(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic h1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/w270;

    .line 4
    .line 5
    iget-object p0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/w270;->R(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic i1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/w270;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/w270;->M()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic k1(Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/l270;->n:I

    .line 12
    .line 13
    add-int/lit8 p1, p1, 0x1

    .line 14
    .line 15
    sput p1, Ll/l270;->n:I

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/w270;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/w270;->T()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/l270;->d1()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic l1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/w270;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/w270;->N()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/w270;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/w270;->S()V

    .line 13
    .line 14
    .line 15
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move-object v1, p1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 21
    .line 22
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 23
    .line 24
    const v2, 0x6263b

    .line 25
    .line 26
    .line 27
    if-ne v1, v2, :cond_0

    .line 28
    .line 29
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    if-eqz v0, :cond_2

    .line 40
    .line 41
    move-object p0, p1

    .line 42
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 45
    .line 46
    const v0, 0x61b12

    .line 47
    .line 48
    .line 49
    if-ne p0, v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic m1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/w270;

    .line 4
    .line 5
    iget-object p2, p2, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    check-cast p2, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Ll/l51;->K(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l270;->o1(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic n1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/l270;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/l270;->m:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/w270;

    .line 10
    .line 11
    iget-object v0, v0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 22
    .line 23
    const-string v0, "bind_mobile"

    .line 24
    .line 25
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const-string p1, "bind_or_change_phone"

    .line 32
    .line 33
    iget-object p0, p0, Ll/l270;->l:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const-string p0, "add_result"

    .line 42
    .line 43
    const-string p1, "fail"

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    filled-new-array {p0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "e_intl_account_add_phone_result"

    .line 54
    .line 55
    const-string v0, "p_account_and_security_view"

    .line 56
    .line 57
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public o1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "signin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l270;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 12
    .line 13
    iget p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 20
    .line 21
    iget-object p1, p0, Ll/l270;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 22
    .line 23
    const-string v0, "confirmation_code"

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 30
    .line 31
    iget-object p1, p0, Ll/l270;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/ibf0;->I0(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v3, -0x1

    .line 52
    sparse-switch v1, :sswitch_data_0

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_0
    const-string v1, "bind_mobile"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/4 v3, 0x2

    .line 66
    goto :goto_0

    .line 67
    :sswitch_1
    const-string v1, "change-phone"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const/4 v3, 0x1

    .line 77
    goto :goto_0

    .line 78
    :sswitch_2
    const-string v1, "forgot-password"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    move v3, v2

    .line 88
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :pswitch_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->refreshUser(Ljava/lang/String;)Lrx/c;

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 106
    .line 107
    check-cast p1, Ll/w270;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    sget v0, Lcom/p1/mobile/putong/account/R$string;->n4:I

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    const-string p1, "bind_or_change_phone"

    .line 123
    .line 124
    iget-object v0, p0, Ll/l270;->l:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_4

    .line 131
    .line 132
    const-string p1, "add_result"

    .line 133
    .line 134
    const-string v0, "success"

    .line 135
    .line 136
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    filled-new-array {p1}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    const-string v0, "e_intl_account_add_phone_result"

    .line 145
    .line 146
    const-string v1, "p_account_and_security_view"

    .line 147
    .line 148
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :pswitch_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->K:I

    .line 153
    .line 154
    invoke-static {p1, v2}, Ll/o1j0;->x(IZ)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :pswitch_2
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 159
    .line 160
    check-cast v0, Ll/w270;

    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 167
    .line 168
    check-cast v2, Ll/w270;

    .line 169
    .line 170
    iget-object v2, v2, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 171
    .line 172
    invoke-interface {v1, v2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toPassWordResetAct(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {v0, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 177
    .line 178
    .line 179
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 180
    .line 181
    check-cast p0, Ll/w270;

    .line 182
    .line 183
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 184
    .line 185
    check-cast p0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->finish()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :sswitch_data_0
    .sparse-switch
        -0x5b94cdfb -> :sswitch_2
        -0x46951eef -> :sswitch_1
        -0x233c651c -> :sswitch_0
    .end sparse-switch

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public p1(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    iget-boolean p0, p0, Ll/l270;->h:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    sget p0, Ll/wcc0;->c0:I

    .line 7
    .line 8
    const-string v1, "\u8df3\u8fc7"

    .line 9
    .line 10
    invoke-interface {p1, v0, p0, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x2

    .line 15
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    return v0
.end method

.method public q1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/g270;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/g270;-><init>(Ll/l270;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/h270;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/h270;-><init>(Ll/l270;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v0, v1, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public r1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "signin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/w270;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/w270;->P()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public s1()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l270;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/og3;->a:Ll/og3;

    .line 8
    .line 9
    const-string v1, "reason"

    .line 10
    .line 11
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public t1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/e270;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/e270;-><init>(Ll/l270;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/f270;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/f270;-><init>(Ll/l270;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v1, p1, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method
