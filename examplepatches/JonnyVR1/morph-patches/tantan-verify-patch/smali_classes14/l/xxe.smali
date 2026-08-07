.class public Ll/xxe;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/zxe;",
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

.method public static synthetic e0(Ll/xxe;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xxe;->f0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic f0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/zxe;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

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
    iput-object p1, p0, Ll/xxe;->a:Lcom/p1/mobile/putong/data/SignInData;

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/zxe;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/zxe;->d(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/wxe;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wxe;-><init>(Ll/xxe;)V

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
    .locals 6

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
    iget-object v0, p0, Ll/xxe;->a:Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/zxe;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v2, Ll/zxe;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "signin"

    .line 29
    .line 30
    invoke-static {v3}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, ""

    .line 35
    .line 36
    const/4 v5, 0x2

    .line 37
    invoke-static {v2, v0, v5, v3, v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Ll/zxe;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/zxe;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
