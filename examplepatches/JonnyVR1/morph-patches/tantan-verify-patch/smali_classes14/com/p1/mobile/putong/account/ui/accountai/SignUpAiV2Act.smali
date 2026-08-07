.class public Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiV2Act;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"

# interfaces
.implements Ll/x5m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/ref0;",
        "Ll/mgf0;",
        ">;",
        "Ll/x5m;"
    }
.end annotation


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


# virtual methods
.method public Z1()Ll/ref0;
    .locals 1

    .line 1
    new-instance v0, Ll/ref0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ref0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/mgf0;
    .locals 1

    .line 1
    new-instance v0, Ll/mgf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mgf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiV2Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiV2Act;->Z1()Ll/ref0;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiV2Act;->a2()Ll/mgf0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInViewModel:Ll/jbf0;

    .line 2
    .line 3
    check-cast p0, Ll/mgf0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/mgf0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 5
    .line 6
    check-cast p0, Ll/ref0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ref0;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_ai_signup"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiV2Act;->setTransparentStatusBar()V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 38
    .line 39
    check-cast v1, Ll/ref0;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ll/ref0;->h1(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, -0x80000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, 0x4000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 46
    .line 47
    .line 48
    :cond_0
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
