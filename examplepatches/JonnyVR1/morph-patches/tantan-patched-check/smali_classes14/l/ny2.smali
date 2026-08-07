.class public Ll/ny2;
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
    const-string v0, "google"

    .line 5
    .line 6
    iput-object v0, p0, Ll/tz2;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->X1()Ll/qm20;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/qm20;->F0()V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_intl_account_add_google_btn"

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic j(Ll/ny2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ny2;->k(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->X1()Ll/qm20;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p0, p2}, Ll/tz2;->g(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/tz2;->d(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "google"

    .line 38
    .line 39
    invoke-virtual {p3, p0, p1, p2}, Ll/qm20;->f1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ll/tz2;->f(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->googleEmail:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->googleEmail:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->T:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    new-instance v0, Ll/ly2;

    .line 44
    .line 45
    invoke-direct {v0, p0, p1, p2}, Ll/ly2;-><init>(Ll/ny2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 53
    .line 54
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->b1:I

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 60
    .line 61
    const-string p2, ""

    .line 62
    .line 63
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Ll/my2;

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ll/my2;-><init>(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->c:Landroid/view/View;

    .line 75
    .line 76
    const/4 p1, 0x0

    .line 77
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
