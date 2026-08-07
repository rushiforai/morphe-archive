.class public Ll/wqp0;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 6
    .line 7
    new-instance v0, Ll/v0l0;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Ll/v0l0;-><init>(Landroid/webkit/ValueCallback;)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Ll/lii;

    .line 13
    .line 14
    invoke-direct {p2, p3}, Ll/lii;-><init>(Landroid/webkit/WebChromeClient$FileChooserParams;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, p2}, Ll/wqp0;->onShowFileChooserX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/v0l0;Ll/lii;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebChromeClient;->onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public onShowFileChooserX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/v0l0;Ll/lii;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/web/WebViewX;",
            "Ll/v0l0<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Ll/lii;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object p2, p2, Ll/v0l0;->a:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    iget-object p3, p3, Ll/lii;->a:Landroid/webkit/WebChromeClient$FileChooserParams;

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebChromeClient;->onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
