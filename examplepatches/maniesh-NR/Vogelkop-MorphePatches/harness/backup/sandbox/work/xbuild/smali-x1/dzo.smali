.class public final Ldzo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbl;

.field public b:Ljava/lang/ref/WeakReference;

.field public final c:Lnyo;

.field public final d:Lfio;

.field public e:Z

.field public f:Z

.field public g:J

.field public final h:Lz4k;

.field public i:I

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lz4k;Lbl;Lfio;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnyo;

    new-instance v1, Llyo;

    invoke-direct {v1, p0}, Llyo;-><init>(Ldzo;)V

    new-instance v2, Llyo;

    invoke-direct {v2, p0}, Llyo;-><init>(Ldzo;)V

    invoke-direct {v0, p1}, Lnyo;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setHorizontalScrollbarOverlay(Z)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setVerticalScrollbarOverlay(Z)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setLongClickable(Z)V

    new-instance p1, Lmyo;

    invoke-direct {p1, v0, v3}, Lmyo;-><init>(Landroid/view/ViewGroup;B)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance p1, Leho;

    invoke-direct {p1, v2, v1}, Leho;-><init>(Llyo;Llyo;)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance p1, Lcpb;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const-string v1, "OperaAdxSdk"

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Ldzo;->c:Lnyo;

    iput-object p3, p0, Ldzo;->a:Lbl;

    iput-object p4, p0, Ldzo;->d:Lfio;

    iput-boolean v3, p0, Ldzo;->j:Z

    iput-object p2, p0, Ldzo;->h:Lz4k;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lltm;Loam;)V
    .registers 6

    sget-object v0, Lsjo;->b:Lygo;

    invoke-virtual {v0}, Li7c;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_32

    if-eqz p3, :cond_32

    sget-object v0, Lezo;->b:Lygo;

    invoke-virtual {v0}, Li7c;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_32

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_32

    invoke-static {v0, p1}, Lvqo;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p3, Loam;->c:Ljava/lang/Object;

    check-cast p3, Ljava/lang/String;

    const-string v0, "[INSERT RESOURCE URL]"

    invoke-virtual {p1, v0, p3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_32
    iget-object p0, p0, Ldzo;->c:Lnyo;

    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p3

    if-eqz p2, :cond_44

    invoke-virtual {p3}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    invoke-interface {p2}, Lltm;->k()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    :cond_44
    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    const/4 p3, 0x0

    invoke-static {p2, p3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_59

    const-string p2, "text/html"

    const-string p3, "UTF-8"

    invoke-virtual {p0, p1, p2, p3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_60

    :cond_59
    const-string p1, "text/html; charset=utf-8"

    const-string p3, "base64"

    invoke-virtual {p0, p2, p1, p3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_60
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p0, p2}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    return-void
.end method
