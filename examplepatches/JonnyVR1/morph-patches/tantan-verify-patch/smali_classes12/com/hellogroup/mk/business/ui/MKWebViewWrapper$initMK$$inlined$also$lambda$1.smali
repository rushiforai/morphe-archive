.class public final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;
.super Ll/wjw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->u0(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000[\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0019\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J7\u0010\u000e\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ7\u0010\u0010\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJA\u0010\u0013\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\t2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0012H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J5\u0010\u0018\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0015\u001a\u00020\t2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\t2\u0008\u0010\u0017\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J#\u0010\u001b\u001a\u00020\t2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ-\u0010\u001f\u001a\u00020\t2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J!\u0010\"\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0006\u0010!\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\"\u0010\u001cJ#\u0010$\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010#\u001a\u0004\u0018\u00010\u001dH\u0016\u00a2\u0006\u0004\u0008$\u0010%J-\u0010*\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\'\u001a\u0004\u0018\u00010&2\u0008\u0010)\u001a\u0004\u0018\u00010(H\u0016\u00a2\u0006\u0004\u0008*\u0010+J#\u0010-\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010,\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008-\u0010\u001cJ#\u00100\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010/\u001a\u0004\u0018\u00010.H\u0016\u00a2\u0006\u0004\u00080\u00101J%\u00103\u001a\u0004\u0018\u0001022\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u00083\u00104J%\u00105\u001a\u0004\u0018\u0001022\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u00085\u00104J#\u00106\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u00086\u00107\u00a8\u00068\u00b8\u0006\u0000"
    }
    d2 = {
        "com/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$3$1",
        "Ll/wjw;",
        "Landroid/webkit/ConsoleMessage;",
        "consoleMessage",
        "",
        "a",
        "(Landroid/webkit/ConsoleMessage;)Z",
        "LLandroid/webkit/WebView;;",
        "view",
        "L;",
        "url",
        "message",
        "LLandroid/webkit/JsResult;;",
        "kotlin/String",
        "onJsAlert",
        "(LLandroid/webkit/WebView;;L;L;LLandroid/webkit/JsResult;;)Z",
        "onJsConfirm",
        "defaultValue",
        "Landroid/webkit/JsPromptResult;",
        "onJsPrompt",
        "(LLandroid/webkit/WebView;;L;L;L;Landroid/webkit/JsPromptResult;)Z",
        "errorCode",
        "description",
        "failingUrl",
        "onPageError",
        "(LLandroid/webkit/WebView;;L;L;L;)L;",
        "webview",
        "onPageFinished",
        "(LLandroid/webkit/WebView;;L;)L;",
        "LLandroid/graphics/Bitmap;;",
        "avico",
        "onPageStarted",
        "(LLandroid/webkit/WebView;;L;LLandroid/graphics/Bitmap;;)L;",
        "newProgress",
        "kotlin/Unit",
        "icon",
        "kotlin/Int",
        "(LLandroid/webkit/WebView;;LLandroid/graphics/Bitmap;;)L;",
        "LLandroid/webkit/SslErrorHandler;;",
        "handler",
        "LLandroid/net/http/SslError;;",
        "error",
        "onReceivedSslError",
        "(LLandroid/webkit/WebView;;LLandroid/webkit/SslErrorHandler;;LLandroid/net/http/SslError;;)L;",
        "title",
        "onReceivedTitle",
        "LLandroid/webkit/RenderProcessGoneDetail;;",
        "detail",
        "onRenderProcessGone",
        "(LLandroid/webkit/WebView;;LLandroid/webkit/RenderProcessGoneDetail;;)L;",
        "LLandroid/webkit/WebResourceResponse;;",
        "shouldInterceptCustomRequest",
        "(LLandroid/webkit/WebView;;L;)LLandroid/webkit/WebResourceResponse;;",
        "shouldInterceptRequest",
        "shouldOverrideUrlLoading",
        "(LLandroid/webkit/WebView;;L;)Z",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic e:Ll/x0c;

.field final synthetic f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

.field final synthetic g:Landroid/app/Activity;

.field final synthetic h:Ll/ilw;


# direct methods
.method public constructor <init>(Ll/x0c;Ll/nxl;Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Landroid/app/Activity;Ll/ilw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->e:Ll/x0c;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->g:Landroid/app/Activity;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ll/wjw;-><init>(Ll/nxl;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/webkit/ConsoleMessage;)Z
    .locals 1
    .param p1    # Landroid/webkit/ConsoleMessage;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/ilw;->a(Landroid/webkit/ConsoleMessage;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1}, Ll/dpf0;->a(Landroid/webkit/ConsoleMessage;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public b(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/webkit/JsResult;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/ilw;->b(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->b(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public c(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/webkit/JsResult;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/ilw;->c(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->c(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 6
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/webkit/JsPromptResult;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v5, p5

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/ilw;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    move-object v0, p0

    .line 16
    move-object v1, p1

    .line 17
    move-object v2, p2

    .line 18
    move-object v3, p3

    .line 19
    move-object v4, p4

    .line 20
    move-object v5, p5

    .line 21
    invoke-super/range {v0 .. v5}, Ll/dpf0;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/wjw;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ilw;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Ll/wjw;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ll/ilw;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->m0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-static {p1, p2}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->n0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->k0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Ll/njw;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 34
    .line 35
    invoke-static {p2}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->h0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Landroid/app/Activity;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getMkWebView()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p2, p0}, Ll/njw;->f(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/wjw;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/ilw;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public h(Landroid/webkit/WebView;I)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->h(Landroid/webkit/WebView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ilw;->h(Landroid/webkit/WebView;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public i(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->i(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ilw;->i(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public j(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/webkit/SslErrorHandler;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/net/http/SslError;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ilw;->j(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/ilw;->j(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public k(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->k(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ilw;->k(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .locals 3
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/webkit/RenderProcessGoneDetail;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Ll/wjw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getMkWhiteScreenUtil()Ll/amw;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->f:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getMkWebView()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1$1;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1$1;-><init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1, p1, v2}, Ll/amw;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/ilw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/ilw;->m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Ll/ilw;->m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public n(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/ilw;->n(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Ll/dpf0;->n(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public o(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1    # Landroid/webkit/WebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$initMK$$inlined$also$lambda$1;->h:Ll/ilw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/ilw;->o(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1, p2}, Ll/ilw;->o(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method
