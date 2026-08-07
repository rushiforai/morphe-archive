.class public Ll/hy2;
.super Ll/tz2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/tz2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "email"

    .line 5
    .line 6
    iput-object v0, p0, Ll/tz2;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Ll/hy2;Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hy2;->j(Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Ll/tz2;->d(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->ql(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 17
    .line 18
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->w1:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 24
    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->c:Landroid/view/View;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 38
    .line 39
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->G1:I

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->c:Landroid/view/View;

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->G6()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    xor-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :goto_0
    new-instance v0, Ll/gy2;

    .line 69
    .line 70
    invoke-direct {v0, p0, p2, p1}, Ll/gy2;-><init>(Ll/hy2;Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/tz2;->g(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-virtual {p0, p1}, Ll/tz2;->d(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->X1()Ll/qm20;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "email"

    .line 34
    .line 35
    const/4 p3, 0x1

    .line 36
    invoke-virtual {p0, p3, p1, p2}, Ll/qm20;->f1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    const-string v1, "bind_or_change_email"

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-interface {p3, p2, v2, v1, p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->ji(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    const-string p0, "e_intl_account_add_email_btn"

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method
