.class public final Leho;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public final a:Llyo;

.field public final b:Llyo;


# direct methods
.method public constructor <init>(Llyo;Llyo;)V
    .registers 3

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    iput-object p1, p0, Leho;->a:Llyo;

    iput-object p2, p0, Leho;->b:Llyo;

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object p0, p0, Leho;->a:Llyo;

    if-eqz p0, :cond_23

    iget-object p0, p0, Llyo;->a:Ldzo;

    iget-boolean p1, p0, Ldzo;->j:Z

    if-nez p1, :cond_23

    const/4 p1, 0x1

    iput-boolean p1, p0, Ldzo;->e:Z

    iget-object p2, p0, Ldzo;->h:Lz4k;

    if-eqz p2, :cond_21

    iget-object p2, p2, Lz4k;->b:Ljava/lang/Object;

    check-cast p2, Llxo;

    iget-object p2, p2, Lk8;->b:Ljava/lang/Object;

    check-cast p2, Ldn;

    if-eqz p2, :cond_21

    invoke-interface {p2}, Ldn;->i()V

    :cond_21
    iput-boolean p1, p0, Ldzo;->j:Z

    :cond_23
    return-void
.end method

.method public final onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .registers 3

    invoke-static {p1, p2}, Lupj;->g(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .registers 3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Leho;->b:Llyo;

    if-eqz p0, :cond_14

    invoke-virtual {p0, p1}, Llyo;->a(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 3

    .line 22
    iget-object p0, p0, Leho;->b:Llyo;

    if-eqz p0, :cond_c

    invoke-virtual {p0, p2}, Llyo;->a(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
