.class public Ll/z8l0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/b9l0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/SignInData;


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

.method public static synthetic e0(Ll/z8l0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8l0;->f0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic f0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/b9l0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/b9l0;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "signindata"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/data/SignInData;

    .line 20
    .line 21
    iput-object p1, p0, Ll/z8l0;->a:Lcom/p1/mobile/putong/data/SignInData;

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/b9l0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/b9l0;->d(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/y8l0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y8l0;-><init>(Ll/z8l0;)V

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

.method public g0()V
    .locals 8

    .line 1
    const-string v0, "e_new_device_passwordlogin_verify_send_button"

    .line 2
    .line 3
    const-string v1, "p_new_device_passwordlogin_verify_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/z8l0;->a:Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, " "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    aget-object v1, v0, v1

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v1, 0x1

    .line 26
    aget-object v5, v0, v1

    .line 27
    .line 28
    if-nez v5, :cond_0

    .line 29
    .line 30
    new-instance v0, Ljava/lang/Exception;

    .line 31
    .line 32
    const-string v1, "mobileNumber == null in VerifyDeviceIntroPresenter on line 37"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Ll/b9l0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/b9l0;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast v1, Ll/b9l0;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/b9l0;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v1, "signin"

    .line 57
    .line 58
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v1, p0, Ll/z8l0;->a:Lcom/p1/mobile/putong/data/SignInData;

    .line 63
    .line 64
    iget-object v6, v1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 65
    .line 66
    const/4 v7, 0x1

    .line 67
    invoke-static/range {v2 .. v7}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast v0, Ll/b9l0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/b9l0;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast p0, Ll/b9l0;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/b9l0;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
