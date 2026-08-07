.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/gxe;",
        "Ll/uxe;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/uxe;

.field public d:Ll/gxe;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
            to = 0x2L
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "email"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "verify_type"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "reason"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "from"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a2()Ll/gxe;
    .locals 1

    .line 1
    new-instance v0, Ll/gxe;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gxe;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->d:Ll/gxe;

    .line 7
    .line 8
    return-object v0
.end method

.method public b2()Ll/uxe;
    .locals 1

    .line 1
    new-instance v0, Ll/uxe;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uxe;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->c:Ll/uxe;

    .line 7
    .line 8
    return-object v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->c:Ll/uxe;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxe;->C()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->a2()Ll/gxe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateSignInViewModel()Ll/jbf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->b2()Ll/uxe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->c:Ll/uxe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/uxe;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initSubscription()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->d:Ll/gxe;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/gxe;->a0()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "+"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->d:Ll/gxe;

    .line 28
    .line 29
    iget-object p0, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v1, "email_number"

    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v1, "login_scene"

    .line 45
    .line 46
    const-string v2, "android_email"

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    filled-new-array {p0, v1}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->c:Ll/uxe;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxe;->C()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "reason"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    const-string v0, "bind-email"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string p0, "p_account_add_email_input_code"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string v0, "change-email"

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const-string p0, "p_account_replace_email_input_code"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "p_intl_sign_in_email_verification_code_view"

    .line 44
    .line 45
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/plm;->a(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "reason"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "from"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->d:Ll/gxe;

    .line 27
    .line 28
    invoke-virtual {v2, v0, v1}, Ll/gxe;->g1(Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public shouldShowGradientActionBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
