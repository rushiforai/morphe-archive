.class public Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/ujh0;


# instance fields
.field public c:Ll/jd00;

.field public d:Ll/pd00;


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

.method private X1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/zwk;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "title"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-static {p2}, Ll/pc00;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "url"

    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string p1, "advanceInitJsBridge"

    .line 23
    .line 24
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/zqw;->k(Landroid/content/Intent;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method


# virtual methods
.method public E0(ZFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    return-void
.end method

.method public a2()Ll/jd00;
    .locals 1

    .line 1
    new-instance v0, Ll/jd00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jd00;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public applyOverrideConfiguration(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b2()Ll/pd00;
    .locals 1

    .line 1
    new-instance v0, Ll/pd00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pd00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/pd00;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->a2()Ll/jd00;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->c:Ll/jd00;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->b2()Ll/pd00;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->c:Ll/jd00;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->c:Ll/jd00;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jd00;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 5
    .line 6
    iget-object v0, v0, Ll/pd00;->B:Ll/k7f0;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 15
    .line 16
    iget-object p0, p0, Ll/pd00;->B:Ll/k7f0;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, p3}, Ll/k7f0;->onActivityResult(IILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onHomePressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pd00;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pd00;->A()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    sget p2, Lcom/p1/mobile/putong/ui/jsbridge/implement/WebViewBridgeImplementation;->a:I

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Runnable;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    return p2

    .line 30
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/pd00;->v()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/pd00;->A()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->finish()V

    .line 45
    .line 46
    .line 47
    :goto_0
    return p2

    .line 48
    :cond_3
    :goto_1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/pd00;->U(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/pd00;->s()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->d:Ll/pd00;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/pd00;->M()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, Ll/ux0;->n(Z)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/ux0;->m()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 62
    .line 63
    .line 64
    :cond_3
    :goto_0
    invoke-virtual {p0, p0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public shouldBlockOnCreate(Landroid/os/Bundle;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldBlockOnResume()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->X1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnResume()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public shouldBlockOnStart()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->X1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnResume()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
