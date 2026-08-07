.class public Lcom/immomo/mmdns/LollipopDNSWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private enableWebDns:Z

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 9
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 10
    iput-boolean p1, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->enableWebDns:Z

    return-void
.end method

.method public constructor <init>(ZLandroid/webkit/WebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->enableWebDns:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->mWebView:Landroid/webkit/WebView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->mWebView:Landroid/webkit/WebView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    instance-of p2, p1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    check-cast p1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object p2, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->mWebView:Landroid/webkit/WebView;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->mWebView:Landroid/webkit/WebView;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->mWebView:Landroid/webkit/WebView;

    .line 27
    .line 28
    :cond_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, p1, p2, v0}, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;[B)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    return-object p0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;[B)Landroid/webkit/WebResourceResponse;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/LollipopDNSWebViewClient;->enableWebDns:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p3, p1, p2}, Ll/jj5;->e([BLandroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    return-object p3

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
