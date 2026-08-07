.class public Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# instance fields
.field public c:Ll/l170;

.field public d:Ll/i170;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "c_code_extra"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "number_extra"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->c:Ll/l170;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/l170;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l170;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/l170;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->c:Ll/l170;

    .line 10
    .line 11
    new-instance v0, Ll/i170;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/i170;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->d:Ll/i170;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->c:Ll/l170;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->d:Ll/i170;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/i170;->Z()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->d:Ll/i170;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/i170;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_reset_password_verify_number_view"

    .line 2
    .line 3
    return-object p0
.end method
