.class public Ll/ky2;
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
    const-string v0, "facebook"

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
    invoke-virtual {p1}, Ll/qm20;->E0()V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_intl_account_add_facebook_btn"

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

.method public static synthetic j(Ll/ky2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ky2;->k(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ll/tz2;->e(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->x1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->T:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/iy2;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1, p2}, Ll/iy2;-><init>(Ll/ky2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 31
    .line 32
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->H1:I

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 38
    .line 39
    const-string p2, ""

    .line 40
    .line 41
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/jy2;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ll/jy2;-><init>(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->c:Landroid/view/View;

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V
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
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/tz2;->d(Lcom/p1/mobile/putong/data/CommonData;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, p2, v0}, Ll/tz2;->h(Lcom/p1/mobile/putong/data/CommonData;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "facebook"

    .line 42
    .line 43
    invoke-virtual {p3, v0, p0, p1}, Ll/qm20;->f1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
