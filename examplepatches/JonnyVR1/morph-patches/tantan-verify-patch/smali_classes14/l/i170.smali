.class public Ll/i170;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/l170;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;


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

.method public static synthetic e0(Ll/i170;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i170;->j0(Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    return-void
.end method

.method public static synthetic f0(Ll/i170;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i170;->k0(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/i170;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i170;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/l170;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/l170;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/l170;

    .line 11
    .line 12
    iget v0, p0, Ll/i170;->a:I

    .line 13
    .line 14
    iget-object p0, p0, Ll/i170;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Ll/l170;->j(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private l0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l170;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l170;->e()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v0, 0x56

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

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
    const-string v1, "c_code_extra"

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/i170;->a:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "number_extra"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/i170;->b:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f170;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/f170;-><init>(Ll/i170;)V

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

.method public h0(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/i170;->l0()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "^[0-9]*$"

    .line 17
    .line 18
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v0, 0xb

    .line 36
    .line 37
    if-eq p0, v0, :cond_2

    .line 38
    .line 39
    return v2

    .line 40
    :cond_2
    const-string p0, "^1[0-9]{10}$"

    .line 41
    .line 42
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method public final synthetic j0(Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/l170;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/l170;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "signup"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v2, Ll/l170;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/l170;->e()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p0, Ll/l170;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic k0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    :try_start_0
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 9
    .line 10
    const v1, 0x9c4b

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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
    const-string v2, "forgot-password"

    .line 24
    .line 25
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v3, Ll/l170;

    .line 32
    .line 33
    invoke-virtual {v3}, Ll/l170;->e()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {v1, v2, v3, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catch_0
    move-exception p1

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/l170;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public m0(Ljava/lang/String;)V
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
    const-string v1, "signup"

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
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/l170;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/l170;->e()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 29
    .line 30
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v1, Ll/l170;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 43
    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->E2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/g170;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/g170;-><init>(Ll/i170;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ll/h170;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1}, Ll/h170;-><init>(Ll/i170;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method
