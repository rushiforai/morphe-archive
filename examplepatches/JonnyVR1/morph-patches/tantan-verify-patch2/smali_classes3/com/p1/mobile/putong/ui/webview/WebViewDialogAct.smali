.class public Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;
.super Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.source "SourceFile"


# instance fields
.field public f:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->f:Ll/kcg0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->p2(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->lambda$initSubscription$4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic i2()Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->q2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l2(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic lambda$initSubscription$4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/esf0;->n()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->f:Ll/kcg0;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->o2(Ll/kcg0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/esf0;->z()Lrx/subjects/b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 48
    .line 49
    if-ne p1, p0, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Ll/esf0;->u(Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/esf0;->f()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/esf0;->z()Lrx/subjects/b;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public static synthetic m2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;

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
    const-string p0, "transparent_webview"

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string p0, "disable_keybord_back"

    .line 30
    .line 31
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method private synthetic q2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->f:Ll/kcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->o2(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public initSubscription()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->c:Ll/lup0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lup0;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Ll/esf0;->u(Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, v1}, Ll/esf0;->t(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v1}, Ll/esf0;->q(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/ttp0;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/ttp0;-><init>()V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/utp0;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/utp0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/vtp0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/vtp0;-><init>(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;)V

    .line 57
    .line 58
    .line 59
    new-instance v3, Ll/wtp0;

    .line 60
    .line 61
    invoke-direct {v3}, Ll/wtp0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/xtp0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/xtp0;-><init>(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->f:Ll/kcg0;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/esf0;->x()Lrx/subjects/b;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/ytp0;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/ytp0;-><init>(Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final o2(Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sup0;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final synthetic p2(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/esf0;->c()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Ll/esf0;->t(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
