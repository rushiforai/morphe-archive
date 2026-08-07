.class public Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public c:Ll/w0c;

.field public d:Landroid/widget/ProgressBar;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/ImageView;

.field public h:Ll/rx3$a;

.field public i:Z

.field public j:Ll/zpq;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    .line 10
    .line 11
    sget p1, Ll/vec0;->I:I

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k:Z

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l:Z

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    .line 20
    sget p1, Ll/vec0;->I:I

    iput p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k:Z

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l:Z

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    .line 25
    sget p1, Ll/vec0;->I:I

    iput p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k:Z

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->i:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->e:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Ll/rx3$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->h:Ll/rx3$a;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Landroid/widget/ProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Lcom/p1/mobile/putong/app/web/WebViewX;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    return-object p0
.end method

.method private getPageListener()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$c;-><init>(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private getWebview()Landroid/webkit/WebView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l:Z

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->i:Z

    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->e:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d:Landroid/widget/ProgressBar;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public getWebViewHashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public k(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ll/lhl;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 8
    .line 9
    const-string v1, "H5-Authorization"

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Ll/zpq;

    .line 18
    .line 19
    invoke-direct {v2, p1, p2, v0}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 27
    .line 28
    const-string v2, "tantan"

    .line 29
    .line 30
    invoke-virtual {p1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-interface {p4, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 43
    .line 44
    invoke-virtual {p0, p3, p4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    invoke-interface {p4, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 62
    .line 63
    invoke-virtual {p0, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    :cond_4
    return-void
.end method

.method public m(Ll/wqo;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zpq;->d()Ll/gqq;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/gqq;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public o()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    const-string v1, "about:blank"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->canGoBack()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ffv;->b(Lcom/p1/mobile/putong/app/web/WebViewX;Ll/zpq;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->c:Ll/w0c;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/ffv;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->j:Ll/zpq;

    .line 21
    .line 22
    return-void
.end method

.method public final q(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->x0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    .line 12
    .line 13
    sget v1, Ll/vec0;->J:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_4

    .line 16
    .line 17
    const-string v0, "MK \u4f18\u5316  ,\u5f00\u542f WebView\u7f13\u5b58\u6c60"

    .line 18
    .line 19
    const-string v1, "[live]campaign"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget v0, Ll/jdc0;->p1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/LinearLayout;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object v2, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v2, v3, p1, v4}, Ll/mjw;->s(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Intent;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const/4 v3, 0x0

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    new-instance v2, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    check-cast p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/p1/mobile/putong/app/PutongAct;

    .line 74
    .line 75
    iget-object v4, v4, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-static {v4, p1}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-direct {v2, p2, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 86
    .line 87
    .line 88
    const-string p1, "MK \u4f18\u5316  ,\u7f13\u5b58\u6c60\u4e3a\u7a7a \u91cd\u65b0\u521b\u5efawebview"

    .line 89
    .line 90
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 95
    .line 96
    if-eq p2, p1, :cond_1

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 99
    .line 100
    .line 101
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v5, "MK \u4f18\u5316  , \u4f7f\u7528WebView\u7f13\u5b58\u6c60(\u80cc\u666f\u8272"

    .line 104
    .line 105
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    if-eq p2, p1, :cond_2

    .line 109
    .line 110
    const-string p1, "\u900f\u660e\u503c"

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    const-string p1, "\u9ed8\u8ba4\u503c"

    .line 114
    .line 115
    :goto_0
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string p1, ")"

    .line 119
    .line 120
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    if-nez p1, :cond_5

    .line 135
    .line 136
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 140
    .line 141
    const/4 p2, -0x1

    .line 142
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_3
    const/4 v2, 0x0

    .line 150
    goto :goto_2

    .line 151
    :cond_4
    sget p1, Ll/jdc0;->o1:I

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    :cond_5
    :goto_2
    instance-of p1, v2, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 158
    .line 159
    if-eqz p1, :cond_6

    .line 160
    .line 161
    check-cast v2, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 162
    .line 163
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 164
    .line 165
    new-instance p1, Ll/w0c;

    .line 166
    .line 167
    invoke-direct {p1}, Ll/w0c;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->c:Ll/w0c;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    check-cast p2, Landroid/app/Activity;

    .line 177
    .line 178
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 179
    .line 180
    invoke-virtual {p1, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->c:Ll/w0c;

    .line 184
    .line 185
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    check-cast p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 192
    .line 193
    const-string v1, ""

    .line 194
    .line 195
    invoke-virtual {p1, p2, v1, v0, v1}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_6
    check-cast v2, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 200
    .line 201
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 202
    .line 203
    :goto_3
    sget p1, Ll/jdc0;->w0:I

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    check-cast p1, Landroid/widget/ProgressBar;

    .line 210
    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->d:Landroid/widget/ProgressBar;

    .line 212
    .line 213
    sget p1, Ll/jdc0;->K:I

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Landroid/widget/FrameLayout;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->e:Landroid/widget/FrameLayout;

    .line 222
    .line 223
    sget p1, Ll/jdc0;->z0:I

    .line 224
    .line 225
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    check-cast p1, Landroid/widget/FrameLayout;

    .line 230
    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->f:Landroid/widget/FrameLayout;

    .line 232
    .line 233
    sget p1, Ll/jdc0;->h0:I

    .line 234
    .line 235
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    check-cast p1, Landroid/widget/ImageView;

    .line 240
    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->g:Landroid/widget/ImageView;

    .line 242
    .line 243
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final s(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ll/p6s;->x0()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget p2, Ll/vec0;->J:I

    .line 14
    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    .line 16
    .line 17
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget p2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->n:I

    .line 22
    .line 23
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget p2, Ll/vec0;->M:I

    .line 32
    .line 33
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setCanLoadWhiteBgOnError(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnCheckIsTextEditorFlag(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/web/WebViewX;->h(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setVerticalScrollBarEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public setWebChromeClientX(Ll/wqp0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x2

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, -0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v5, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 10
    .line 11
    if-ne p1, v5, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 26
    .line 27
    invoke-virtual {p0, v3}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    sget-object v5, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 54
    .line 55
    if-ne p1, v5, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 70
    .line 71
    invoke-virtual {p0, v3}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method

.method public setWebViewLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public setWebViewMarginTop(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public setWebViewOverScrollMode(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setOverScrollMode(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public setWithErrorView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWithProgressView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->getWebview()Landroid/webkit/WebView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->getPageListener()Ll/rx3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->h:Ll/rx3$a;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 20
    .line 21
    new-instance v2, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$a;-><init>(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->c:Ll/w0c;

    .line 45
    .line 46
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView$b;-><init>(Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;Ll/nxl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    const-string v1, "about:blank"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lhl;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    new-instance v0, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public x(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lhl;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->s(Landroid/content/Context;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->q(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->u()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public z(ILjava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
