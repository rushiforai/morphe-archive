.class public Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;
.super Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;
.implements Ll/crl;


# instance fields
.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g2(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "fromNotif"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "url"

    .line 14
    .line 15
    invoke-static {}, Ll/ktp0;->b()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string p0, "title"

    .line 23
    .line 24
    const-string p1, "\u6211\u7684\u63a2\u63a2"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    return-object v0
.end method


# virtual methods
.method public c2()Ll/lup0;
    .locals 1

    .line 1
    new-instance v0, Ll/h2c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h2c;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/sup0;
    .locals 1

    .line 1
    new-instance v0, Ll/i2c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i2c;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public h0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    check-cast v0, Ll/i2c;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/i2c;->Y(Z)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;->f:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;->g:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public h2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    check-cast v0, Ll/i2c;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;->g:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/i2c;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hackCenterTitle:Z

    .line 6
    .line 7
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    check-cast v0, Ll/i2c;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/i2c;->Q(Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 5
    .line 6
    check-cast p0, Ll/i2c;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/i2c;->U()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_mytantan"

    .line 2
    .line 3
    return-object p0
.end method

.method public y0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    check-cast p0, Ll/i2c;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/i2c;->Y(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
