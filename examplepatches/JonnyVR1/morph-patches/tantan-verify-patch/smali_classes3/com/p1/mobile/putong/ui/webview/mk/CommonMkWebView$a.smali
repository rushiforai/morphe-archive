.class public Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;
.super Ll/dpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/dpf0;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, ".js"

    .line 2
    .line 3
    invoke-virtual {p4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ".html"

    .line 10
    .line 11
    invoke-virtual {p4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, ".css"

    .line 18
    .line 19
    invoke-virtual {p4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->i(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Z)V

    .line 32
    .line 33
    .line 34
    const-string v0, "about:blank"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x4

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 52
    .line 53
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0, p2, p3, p4}, Ll/rx3$a;->c(ILjava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

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

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/dpf0;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->i(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Z)V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;

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
