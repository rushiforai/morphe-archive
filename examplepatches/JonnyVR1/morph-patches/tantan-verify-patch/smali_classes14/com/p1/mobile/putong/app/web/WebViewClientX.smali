.class public Lcom/p1/mobile/putong/app/web/WebViewClientX;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/app/web/WebViewClientX$a;,
        Lcom/p1/mobile/putong/app/web/WebViewClientX$WebViewException;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "WebViewClientX"

.field private static enableWebViewDNS:Z


# instance fields
.field private mOnRenderProcessGoneListener:Lcom/p1/mobile/putong/app/web/WebViewClientX$a;

.field private postMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/app/web/WebViewClientX;->postMap:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method private static getWebDnsEnable()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/app/web/WebViewClientX;->enableWebViewDNS:Z

    .line 2
    .line 3
    return v0
.end method

.method private handleAllRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    invoke-interface {p4}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->getWebDnsEnable()Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p3, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->useDNS(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/app/web/WebViewClientX;->postMap:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {p0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, [B

    .line 38
    .line 39
    invoke-static {p0, p1, p4}, Ll/jj5;->e([BLandroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public static setEnableWebViewDNS(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/app/web/WebViewClientX;->enableWebViewDNS:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public continuePostUrl(Ljava/lang/String;[B)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "WebViewClientX postUrl "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "WebViewClientX"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->getWebDnsEnable()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/immomo/mmdns/MDDNSEntrance;->useDNS(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/app/web/WebViewClientX;->postMap:Ljava/util/Map;

    .line 45
    .line 46
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p2, p3}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onPageStartedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, v0, Lcom/p1/mobile/putong/app/web/WebViewX;->c:Lcom/p1/mobile/putong/app/web/WebViewX$a;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/app/web/WebViewX$a;->a(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onPageStartedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 28
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    if-eqz v0, :cond_0

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    new-instance v1, Ll/bsp0;

    .line 11
    .line 12
    invoke-direct {v1, p2}, Ll/bsp0;-><init>(Landroid/webkit/WebResourceRequest;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object v1, v0

    .line 17
    :goto_0
    if-eqz p3, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/asp0;

    .line 20
    .line 21
    invoke-direct {v0, p3}, Ll/asp0;-><init>(Landroid/webkit/WebResourceError;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/asp0;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    return-void
.end method

.method public onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/asp0;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    iget-object p2, p2, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 6
    .line 7
    iget-object p3, p3, Ll/asp0;->a:Landroid/webkit/WebResourceError;

    .line 8
    .line 9
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x17
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    new-instance v1, Ll/bsp0;

    .line 11
    .line 12
    invoke-direct {v1, p2}, Ll/bsp0;-><init>(Landroid/webkit/WebResourceRequest;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object v1, v0

    .line 17
    :goto_0
    if-eqz p3, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/dsp0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/dsp0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p3, v0, Ll/dsp0;->a:Landroid/webkit/WebResourceResponse;

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getEncoding()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, v0, Ll/dsp0;->c:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getData()Ljava/io/InputStream;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, v0, Ll/dsp0;->g:Ljava/io/InputStream;

    .line 37
    .line 38
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getMimeType()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iput-object p2, v0, Ll/dsp0;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getReasonPhrase()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iput-object p2, v0, Ll/dsp0;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getResponseHeaders()Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, v0, Ll/dsp0;->f:Ljava/util/Map;

    .line 55
    .line 56
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    iput p2, v0, Ll/dsp0;->d:I

    .line 61
    .line 62
    :cond_1
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->onReceivedHttpErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/dsp0;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public onReceivedHttpErrorX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;Ll/dsp0;)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x17
    .end annotation

    .line 1
    iget-object p3, p3, Ll/dsp0;->a:Landroid/webkit/WebResourceResponse;

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 0

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 p1, 0x1a

    .line 4
    .line 5
    if-lt p0, p1, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Ll/ejt0;->a(Landroid/webkit/RenderProcessGoneDetail;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p1, 0x1

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return p1

    .line 15
    :cond_0
    invoke-static {}, Ll/ive0;->m()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    new-instance p0, Lcom/p1/mobile/putong/app/web/WebViewClientX$WebViewException;

    .line 22
    .line 23
    const-string p2, "WebView rendering process crashed!"

    .line 24
    .line 25
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/app/web/WebViewClientX$WebViewException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return p1

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public setOnRenderProcessGoneListener(Lcom/p1/mobile/putong/app/web/WebViewClientX$a;)V
    .locals 0

    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    new-instance v1, Ll/bsp0;

    .line 9
    .line 10
    invoke-direct {v1, p2}, Ll/bsp0;-><init>(Landroid/webkit/WebResourceRequest;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->shouldInterceptRequestX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;)Ll/csp0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v1, v0, Ll/csp0;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_3

    .line 26
    .line 27
    iget-object v1, v0, Ll/csp0;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_3

    .line 34
    .line 35
    iget-object v1, v0, Ll/csp0;->f:Ljava/io/InputStream;

    .line 36
    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance p0, Landroid/webkit/WebResourceResponse;

    .line 41
    .line 42
    iget-object p1, v0, Ll/csp0;->a:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p2, v0, Ll/csp0;->b:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, v0, Ll/csp0;->f:Ljava/io/InputStream;

    .line 47
    .line 48
    invoke-direct {p0, p1, p2, v1}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 49
    .line 50
    .line 51
    iget p1, v0, Ll/csp0;->c:I

    .line 52
    .line 53
    const/4 p2, -0x1

    .line 54
    if-eq p1, p2, :cond_1

    .line 55
    .line 56
    iget-object p1, v0, Ll/csp0;->d:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    iget p1, v0, Ll/csp0;->c:I

    .line 65
    .line 66
    iget-object p2, v0, Ll/csp0;->d:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1, p2}, Landroid/webkit/WebResourceResponse;->setStatusCodeAndReasonPhrase(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p1, v0, Ll/csp0;->e:Ljava/util/Map;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/webkit/WebResourceResponse;->setResponseHeaders(Ljava/util/Map;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-object p0

    .line 79
    :cond_3
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public shouldInterceptRequestX(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/bsp0;)Ll/csp0;
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/bsp0;->getUrl()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2}, Ll/bsp0;->getMethod()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->handleAllRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/csp0;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getMimeType()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getEncoding()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getData()Ljava/io/InputStream;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {p1, p2, v0, v1}, Ll/csp0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p1, Ll/csp0;->c:I

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getReasonPhrase()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iput-object p2, p1, Ll/csp0;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getResponseHeaders()Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, p1, Ll/csp0;->e:Ljava/util/Map;

    .line 53
    .line 54
    return-object p1

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->shouldOverrideUrlLoadingX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/app/web/WebViewX;->c:Lcom/p1/mobile/putong/app/web/WebViewX$a;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/app/web/WebViewX$a;->a(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return p0

    .line 22
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public shouldOverrideUrlLoadingX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
