.class public Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;
.super Ll/dpf0;
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
.field public final synthetic c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
    if-nez v0, :cond_1

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
    if-nez v0, :cond_1

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
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Z)V

    .line 34
    .line 35
    .line 36
    const-string v0, "about:blank"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0, p2, p3, p4}, Ll/rx3$a;->c(ILjava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p1, "onReceivedErrorX message = "

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "[live]webDialog"

    .line 77
    .line 78
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-class p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p2, p3, p4, p0}, Ll/awr;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/dpf0;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;->c:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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
