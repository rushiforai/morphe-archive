.class public Lcom/p1/mobile/putong/ui/webview/mk/SingleTaskMkWebViewAct;
.super Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C2(Lcom/p1/mobile/putong/ui/webview/mk/SingleTaskMkWebViewAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/SingleTaskMkWebViewAct;->E2()V

    return-void
.end method

.method public static synthetic D2()V
    .locals 1

    .line 1
    const-string v0, "\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic E2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "\u5df2\u63d0\u4ea4\u5ba1\u6838"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/facertification/a;->e(Landroid/content/Intent;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/uqf0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/uqf0;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/SingleTaskMkWebViewAct;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/vqf0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/vqf0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/facertification/a;->f(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "url"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string v1, "https://m.staging2.p1staff.com"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "https://m.tantanapp.com"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    sget-object v2, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->preCreateView(Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
