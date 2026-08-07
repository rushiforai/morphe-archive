.class public Ll/h1k0;
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
    const-string v0, "update password"

    .line 5
    .line 6
    iput-object v0, p0, Ll/tz2;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 2
    .line 3
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->q3:I

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 9
    .line 10
    const-string p2, ""

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ll/g1k0;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/g1k0;-><init>(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
