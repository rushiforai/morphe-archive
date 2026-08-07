.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;
.super Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation


# instance fields
.field final synthetic b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;)Lkotlin/Unit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w1()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h2(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/i8g0;->e(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Landroid/webkit/WebView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/ilw;->h(Landroid/webkit/WebView;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/ilw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 5
    .line 6
    invoke-static {p2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->q1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ll/amw;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->q1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ll/amw;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    new-instance v1, Lcom/hellogroup/mk/business/ui/d;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/d;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0, p1, v1}, Ll/amw;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public n(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->b:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->b2(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
