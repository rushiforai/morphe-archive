.class public final Lk2p;
.super Landroid/webkit/WebViewRenderProcessClient;
.source "SourceFile"


# virtual methods
.method public final onRenderProcessResponsive(Landroid/webkit/WebView;Landroid/webkit/WebViewRenderProcess;)V
    .registers 3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    sget-object p0, Lito;->a:[Lito;

    return-void
.end method

.method public final onRenderProcessUnresponsive(Landroid/webkit/WebView;Landroid/webkit/WebViewRenderProcess;)V
    .registers 3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    sget-object p0, Lito;->a:[Lito;

    new-instance p0, Lqfp;

    invoke-direct {p0, p1}, Lqfp;-><init>(Landroid/webkit/WebView;)V

    invoke-static {p0}, Lp8p;->a(Lp8p;)V

    return-void
.end method
