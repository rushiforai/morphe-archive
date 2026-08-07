.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/WebViewActOpt;
.super Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.source "SourceFile"


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


# virtual methods
.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/plm;->b(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 8
    .line 9
    .line 10
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
