.class public Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;
.super Lcom/p1/mobile/putong/app/web/WebViewClientX;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->u()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/web/WebViewClientX;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    xor-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0, p2}, Ll/rx3$a;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onPageStartedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onPageStartedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    const/4 p3, 0x1

    .line 17
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0, p2}, Ll/rx3$a;->b(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Z)V

    .line 8
    .line 9
    .line 10
    const-string v0, "about:blank"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;->this$0:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, p2, p3, p4}, Ll/rx3$a;->c(ILjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string p1, "onReceivedErrorX message = "

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "[live]webDialog"

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-class p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p2, p3, p4, p0}, Ll/awr;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/asp0;)V
    .locals 1

    .line 65
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/asp0;)V

    .line 66
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "onReceivedErrorX webResourceError = "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p3}, Ll/asp0;->a()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 68
    const-string v0, "[live]webDialog"

    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-class p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 70
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 71
    invoke-static {p1, p2, p3, p0}, Ll/awr;->c(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/asp0;Ljava/lang/String;)V

    return-void
.end method
