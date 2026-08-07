.class public Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/ym20;

.field public d:Ll/qm20;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X1()Ll/qm20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->d:Ll/qm20;

    .line 2
    .line 3
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->c:Ll/ym20;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ym20;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ym20;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ym20;-><init>(Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->c:Ll/ym20;

    .line 10
    .line 11
    new-instance v0, Ll/qm20;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qm20;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->d:Ll/qm20;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->c:Ll/ym20;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->d:Ll/qm20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qm20;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->d:Ll/qm20;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/qm20;->d1(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_account_and_security_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
