.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/js3;",
        "Ll/ns3;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/ns3;

.field public d:Ll/js3;


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

.method public static Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public a2()Ll/js3;
    .locals 1

    .line 1
    new-instance v0, Ll/js3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/js3;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->d:Ll/js3;

    .line 7
    .line 8
    return-object v0
.end method

.method public b2()Ll/ns3;
    .locals 1

    .line 1
    new-instance v0, Ll/ns3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ns3;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->c:Ll/ns3;

    .line 7
    .line 8
    return-object v0
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->a2()Ll/js3;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->b2()Ll/ns3;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->c:Ll/ns3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ns3;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->d:Ll/js3;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ibf0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_country_code_selection_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/plm;->a(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
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
