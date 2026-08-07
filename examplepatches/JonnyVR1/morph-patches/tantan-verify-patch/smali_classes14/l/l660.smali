.class public Ll/l660;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/p660;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z


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
    iput-boolean p1, p0, Ll/l660;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/l660;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l660;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/l660;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l660;->k0(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/l660;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l660;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private i0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "extra_number"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/l660;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "extra_code"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/l660;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "extra_country_code"

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Ll/l660;->c:I

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "extra_mobile_number"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ll/l660;->d:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "extra_action"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Ll/l660;->e:Ljava/lang/String;

    .line 81
    .line 82
    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p660;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p660;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/l660;->i0()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/i660;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/i660;-><init>(Ll/l660;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/l660;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/l660;->f:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/p660;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/p660;->l()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 25
    .line 26
    iget v1, p0, Ll/l660;->c:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/l660;->d:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 36
    .line 37
    const-string v1, "up_link_sms"

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p0, Ll/l660;->e:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 51
    .line 52
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/j660;

    .line 63
    .line 64
    invoke-direct {v2, p0, v0}, Ll/j660;-><init>(Ll/l660;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/k660;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/k660;-><init>(Ll/l660;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final j0(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Ljava/net/SocketTimeoutException;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    if-eqz p0, :cond_2

    .line 12
    .line 13
    instance-of p1, p0, Ljava/net/SocketTimeoutException;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/l660;->f:Z

    .line 3
    .line 4
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p2, Ll/p660;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/p660;->f()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p0, Ll/l660;->e:Ljava/lang/String;

    .line 21
    .line 22
    :goto_0
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 23
    .line 24
    sget v0, Lcom/p1/mobile/putong/account/R$string;->v0:I

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Landroid/content/Intent;

    .line 34
    .line 35
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v0, "extra_result_action"

    .line 39
    .line 40
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v0, -0x1

    .line 48
    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/l660;->f:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v1, Ll/p660;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/p660;->f()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/l660;->j0(Ljava/lang/Throwable;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/account/R$string;->w0:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/account/R$string;->u0:I

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "smsto:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/l660;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Landroid/content/Intent;

    .line 22
    .line 23
    const-string v2, "android.intent.action.SENDTO"

    .line 24
    .line 25
    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "sms_body"

    .line 29
    .line 30
    iget-object v2, p0, Ll/l660;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    :try_start_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    const-string p0, "\u672a\u627e\u5230\u53ef\u53d1\u9001\u77ed\u4fe1\u7684\u5e94\u7528"

    .line 44
    .line 45
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
