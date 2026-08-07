.class public Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/ujh0;


# instance fields
.field public c:Ll/lup0;

.field public d:Ll/sup0;

.field public e:Z


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

.method public static synthetic X1(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic Y1(Ljava/lang/String;[Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    const-string p2, "PV"

    .line 7
    .line 8
    invoke-static {p2, v1, p0, p1}, Ll/jtp0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-ne p2, v0, :cond_1

    .line 15
    .line 16
    const-string p2, "PD"

    .line 17
    .line 18
    invoke-static {p2, v1, p0, p1}, Ll/jtp0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method private Z1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sup0;->l:Ljava/lang/String;

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

.method public static a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/webview/WebViewAct;

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
    const-string p0, "url"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "advanceInitJsBridge"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
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

.method public applyOverrideConfiguration(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c2()Ll/lup0;
    .locals 1

    .line 1
    new-instance v0, Ll/lup0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lup0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/sup0;
    .locals 1

    .line 1
    new-instance v0, Ll/sup0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sup0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public e2(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->e:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ptp0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/ptp0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/qtp0;

    .line 26
    .line 27
    invoke-direct {v1, p1, p2}, Ll/qtp0;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->e:Z

    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sup0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c2()Ll/lup0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d2()Ll/sup0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lup0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/sup0;->C:Ll/k7f0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/sup0;->C:Ll/k7f0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sup0;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/sup0;->w()V

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
    .locals 2
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
    if-nez v0, :cond_4

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/sup0;->k()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/sup0;->w()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 51
    .line 52
    iget-object p1, p1, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    new-instance p1, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v0, "step"

    .line 66
    .line 67
    const-string v1, "onBack"

    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 73
    .line 74
    iget-object v1, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1, p1}, Ll/sup0;->L(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 84
    .line 85
    .line 86
    :goto_0
    return p2

    .line 87
    :cond_4
    :goto_1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_android_web_vue"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/sup0;->K(Landroid/os/Bundle;)V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/sup0;->j()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/sup0;->E()Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/sup0;->N()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 73
    .line 74
    .line 75
    :cond_4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 76
    .line 77
    .line 78
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
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->Z1()Z

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->Z1()Z

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
