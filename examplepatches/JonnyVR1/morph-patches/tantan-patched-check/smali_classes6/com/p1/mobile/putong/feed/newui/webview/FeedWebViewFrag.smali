.class public Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/xbi;",
        "Ll/bci;",
        ">;"
    }
.end annotation


# instance fields
.field public B:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;->U4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic Q4(Ljava/lang/String;[Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
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

.method public static R4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "title"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "url"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "webviewColor"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "notchColor"

    .line 27
    .line 28
    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "hideNavigationBar"

    .line 32
    .line 33
    invoke-virtual {v1, p0, p4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    const-string p0, "hardwareAccelerated"

    .line 37
    .line 38
    invoke-virtual {v1, p0, p5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    const-string p0, "advanceInitJsBridge"

    .line 42
    .line 43
    invoke-virtual {v1, p0, p6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    const-string p0, "transparent_status_bar"

    .line 47
    .line 48
    invoke-virtual {v1, p0, p7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    const-string p0, "playbackRequiresUserGesture"

    .line 52
    .line 53
    invoke-virtual {v1, p0, p8}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    const-string p0, "useActConfig"

    .line 57
    .line 58
    invoke-virtual {v1, p0, p9}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;->S4()Ll/xbi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;->T4()Ll/bci;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4()Ll/xbi;
    .locals 1

    .line 1
    new-instance v0, Ll/xbi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xbi;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public T4()Ll/bci;
    .locals 2

    .line 1
    new-instance v0, Ll/bci;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/bci;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final synthetic U4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/bci;->K(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public V4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bci;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/bci;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bci;->v()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public W4(Ljava/lang/String;[Ljava/lang/String;)V
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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;->B:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/sbi;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/sbi;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/tbi;

    .line 26
    .line 27
    invoke-direct {v1, p1, p2}, Ll/tbi;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;->B:Z

    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->d4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/bci;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/bci;->w()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/rbi;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/rbi;-><init>(Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/bci;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ll/bci;->G(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewAct;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bci;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/bci;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bci;->v()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/bci;

    .line 7
    .line 8
    iget-object v0, v0, Ll/bci;->v:Ll/k7f0;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/bci;

    .line 19
    .line 20
    iget-object p0, p0, Ll/bci;->v:Ll/k7f0;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Ll/k7f0;->onActivityResult(IILandroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
