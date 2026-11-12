.class public final Lc5d;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lc5d;->a:B

    iput-object p1, p0, Lc5d;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method private final a(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 9

    iget-byte v0, p0, Lc5d;->a:B

    const-string v1, "mraid.fireReadyEvent();"

    const-string v2, "mraid.logLevel = mraid.LogLevelEnum.NONE;"

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, p0, Lc5d;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_11e

    :pswitch_d
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void

    :pswitch_11
    const-string p0, "Finished loading WebView"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :pswitch_1b
    sget-object p0, Lito;->a:[Lito;

    check-cast v5, La3p;

    iget-boolean p0, v5, La3p;->k:Z

    iput-boolean v3, v5, La3p;->G:Z

    iget-object p2, v5, La3p;->v:Ln2p;

    sget-object v0, Ln2p;->b:Ln2p;

    if-ne p2, v0, :cond_77

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "mraid.setPlacementType(\'"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_35

    const-string v0, "interstitial"

    goto :goto_37

    :cond_35
    const-string v0, "inline"

    :goto_37
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\');"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v5, p2}, La3p;->g(Ljava/lang/String;)V

    new-instance p2, Lz4d;

    const/4 v0, 0x5

    invoke-direct {p2, v0}, Lz4d;-><init>(B)V

    invoke-virtual {p1, v2, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    iget-boolean p2, v5, La3p;->H:Z

    if-eqz p2, :cond_77

    invoke-virtual {v5}, La3p;->y()V

    invoke-virtual {v5}, La3p;->x()V

    invoke-virtual {v5}, La3p;->v()V

    invoke-virtual {v5}, La3p;->w()V

    if-eqz p0, :cond_66

    const/4 p0, 0x0

    invoke-virtual {v5, p0}, La3p;->l(Ljava/lang/String;)V

    goto :goto_77

    :cond_66
    sget-object p0, Ln2p;->c:Ln2p;

    iput-object p0, v5, La3p;->v:Ln2p;

    invoke-virtual {v5}, La3p;->r()V

    invoke-virtual {v5, v1}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p0, v5, La3p;->w:Z

    if-eqz p0, :cond_77

    invoke-virtual {v5}, La3p;->s()V

    :cond_77
    :goto_77
    iget-boolean p0, v5, La3p;->L:Z

    if-eqz p0, :cond_87

    iput-boolean v4, v5, La3p;->L:Z

    new-instance p0, Lwr9;

    const/16 p2, 0x19

    invoke-direct {p0, v5, p1, p2}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0}, Lpfp;->a(Ljava/lang/Runnable;)V

    :cond_87
    invoke-virtual {v5}, La3p;->b()V

    iget-object p0, v5, La3p;->d:Lm1p;

    invoke-interface {p0, p1}, Lm1p;->g(Landroid/webkit/WebView;)V

    sget-object p0, Ld1p;->a:Lt5p;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object p1, v5, La3p;->e0:Lkgo;

    invoke-static {p0, p1}, Ld1p;->b(Landroid/content/Context;Ln1p;)V

    return-void

    :pswitch_9b
    check-cast v5, Lt2p;

    iget-object v0, v5, Lt2p;->b:Landroid/content/Context;

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p0

    if-eqz p0, :cond_af

    sget-object p0, Lbbp;->e:Lbbp;

    :goto_aa
    invoke-virtual {p0, v0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p0

    goto :goto_b2

    :cond_af
    sget-object p0, Lbbp;->f:Lbbp;

    goto :goto_aa

    :goto_b2
    iget-object p2, v5, Lt2p;->e:Landroid/widget/ImageButton;

    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result p0

    if-eqz p0, :cond_c4

    sget-object p0, Lbbp;->g:Lbbp;

    :goto_bf
    invoke-virtual {p0, v0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p0

    goto :goto_c7

    :cond_c4
    sget-object p0, Lbbp;->h:Lbbp;

    goto :goto_bf

    :goto_c7
    iget-object p1, v5, Lt2p;->f:Landroid/widget/ImageButton;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_cd
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    check-cast v5, Lcom/opera/ad/mraid/MRAIDView;

    iget-byte p1, v5, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-nez p1, :cond_10a

    iput-boolean v3, v5, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    const-string p1, "mraid.setPlacementType(\'inline\');"

    invoke-virtual {v5, p1}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    const/4 p1, 0x6

    invoke-static {p1}, Lsko;->w(I)Ljava/lang/String;

    iget-object p1, v5, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    new-instance p2, Lz4d;

    invoke-direct {p2, v4}, Lz4d;-><init>(B)V

    invoke-virtual {p1, v2, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    iget-boolean p1, v5, Lcom/opera/ad/mraid/MRAIDView;->O:Z

    if-eqz p1, :cond_10a

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->z()V

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->y()V

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->w()V

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->x()V

    iput-byte v3, v5, Lcom/opera/ad/mraid/MRAIDView;->C:B

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->I()V

    invoke-virtual {v5, v1}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    iget-boolean p1, v5, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    if-eqz p1, :cond_10a

    invoke-virtual {v5}, Lcom/opera/ad/mraid/MRAIDView;->J()V

    :cond_10a
    iget-boolean p1, v5, Lcom/opera/ad/mraid/MRAIDView;->R:Z

    if-eqz p1, :cond_11c

    iput-boolean v4, v5, Lcom/opera/ad/mraid/MRAIDView;->R:Z

    iget-object p1, v5, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    new-instance p2, Ldnb;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v0}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_11c
    return-void

    nop

    :pswitch_data_11e
    .packed-switch 0x0
        :pswitch_cd
        :pswitch_d
        :pswitch_d
        :pswitch_9b
        :pswitch_1b
        :pswitch_d
        :pswitch_11
    .end packed-switch
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 5

    iget-byte v0, p0, Lc5d;->a:B

    sparse-switch v0, :sswitch_data_28

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void

    :sswitch_9
    const-string p0, "Started loading WebView"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :sswitch_13
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, Lt2p;

    iget-object p1, p0, Lt2p;->f:Landroid/widget/ImageButton;

    sget-object p2, Lbbp;->h:Lbbp;

    iget-object p0, p0, Lt2p;->b:Landroid/content/Context;

    invoke-virtual {p2, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :sswitch_data_28
    .sparse-switch
        0x3 -> :sswitch_13
        0x6 -> :sswitch_9
    .end sparse-switch
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 54
    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x6
        :pswitch_8
    .end packed-switch
.end method

.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .registers 6

    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_36

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    return-void

    :pswitch_9
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    iget-object v0, v0, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_31

    new-instance v0, Lacp;

    invoke-direct {v0, p2, p3}, Lacp;-><init>(Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    :cond_31
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x4
        :pswitch_9
    .end packed-switch
.end method

.method public final onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .registers 6

    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_32

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    return-void

    :pswitch_9
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    iget-object v0, v0, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    new-instance v0, Lxcp;

    invoke-direct {v0, p2, p3}, Lxcp;-><init>(Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    :cond_2d
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x4
        :pswitch_9
    .end packed-switch
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .registers 5

    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    return-void

    :pswitch_9
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Lrdp;

    invoke-direct {v0, p3}, Lrdp;-><init>(Landroid/net/http/SslError;)V

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    return-void

    :pswitch_1a
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    return-void

    :pswitch_data_1e
    .packed-switch 0x3
        :pswitch_1a
        :pswitch_9
    .end packed-switch
.end method

.method public final onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .registers 5

    iget-byte v0, p0, Lc5d;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_2c

    :pswitch_6
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    move-result p0

    return p0

    :pswitch_b
    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, La3p;

    iget-object p0, p0, La3p;->d:Lm1p;

    invoke-interface {p0}, Lm1p;->a()V

    new-instance p0, Lqep;

    invoke-direct {p0, p1, p2}, Lqep;-><init>(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    invoke-static {p0}, Lp8p;->a(Lp8p;)V

    invoke-static {p1, p2}, Ltlp;->a(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    return v1

    :pswitch_20
    invoke-static {p1, p2}, Lupj;->g(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    return v1

    :pswitch_24
    invoke-static {p1, p2}, Lupj;->g(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    return v1

    :pswitch_28
    invoke-static {p1, p2}, Lupj;->g(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    return v1

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_28
        :pswitch_6
        :pswitch_24
        :pswitch_20
        :pswitch_b
    .end packed-switch
.end method

.method public final onSafeBrowsingHit(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;ILandroid/webkit/SafeBrowsingResponse;)V
    .registers 6

    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onSafeBrowsingHit(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;ILandroid/webkit/SafeBrowsingResponse;)V

    return-void

    :pswitch_9
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onSafeBrowsingHit(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;ILandroid/webkit/SafeBrowsingResponse;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x4
        :pswitch_9
    .end packed-switch
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .registers 16

    iget-byte v0, p0, Lc5d;->a:B

    packed-switch v0, :pswitch_data_26e

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    iget-wide v0, v0, La3p;->f0:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lez v2, :cond_29

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    add-long/2addr v0, v7

    cmp-long v0, v5, v0

    if-gtz v0, :cond_29

    move v0, v3

    goto :goto_2a

    :cond_29
    move v0, v4

    :goto_2a
    new-instance v1, Lqqo;

    const/16 v2, 0xc

    invoke-direct {v1, p2, v2}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->hasGesture()Z

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v2, Lito;->a:[Lito;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "https://appassets.androidplatform.net/favicon.ico"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v5, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v5, La3p;

    if-eqz v2, :cond_5f

    iget-object p0, v5, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    sget-object p0, La3p;->h0:Ljava/util/Map;

    const-string p0, "image/x-icon"

    invoke-static {p0}, Lmfh;->c(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    goto/16 :goto_26c

    :cond_5f
    iget-object v2, v5, La3p;->m:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpwn;

    iget-object v2, v2, Lpwn;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v4

    :cond_6e
    const-string v7, "appassets.androidplatform.net"

    const/4 v8, 0x0

    if-ge v6, v5, :cond_114

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v6, v6, 0x1

    check-cast v9, Lown;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v10, v9, Lown;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    const-string v12, "http"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_b6

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a2

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    const-string v12, "https"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b6

    :cond_a2
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b6

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_b8

    :cond_b6
    move-object v9, v8

    goto :goto_ba

    :cond_b8
    iget-object v9, v9, Lown;->b:Lnwn;

    :goto_ba
    if-eqz v9, :cond_6e

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v5, ""

    invoke-virtual {v2, v10, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, v9, Lnwn;->a:Ljava/io/File;

    :try_start_c8
    invoke-static {v5}, Luup;->q(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v5, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e1

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_e2

    :cond_e1
    move-object v6, v8

    :goto_e2
    if-eqz v6, :cond_105

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string v9, ".svgz"

    invoke-virtual {v6, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_fb

    new-instance v6, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v6, v5}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v5, v6

    :cond_fb
    invoke-static {v2}, Luup;->u(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v6, Landroid/webkit/WebResourceResponse;

    invoke-direct {v6, v2, v8, v5}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    goto :goto_115

    :cond_105
    const-string v6, "The requested file: %s is outside the mounted directory: %s"

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_10e
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_10e} :catch_10e

    :catch_10e
    new-instance v6, Landroid/webkit/WebResourceResponse;

    invoke-direct {v6, v8, v8, v8}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    goto :goto_115

    :cond_114
    move-object v6, v8

    :goto_115
    const/16 v2, 0x2393

    const-string v5, "text/html"

    if-eqz v6, :cond_1b7

    iget-object v0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    iget-object v3, v0, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Landroid/webkit/WebResourceResponse;->getData()Ljava/io/InputStream;

    move-result-object v3

    if-eqz v3, :cond_166

    :try_start_12a
    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v6}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    move-result p0

    if-nez p0, :cond_139

    const-string p0, "OK"

    const/16 p1, 0xc8

    invoke-virtual {v6, p1, p0}, Landroid/webkit/WebResourceResponse;->setStatusCodeAndReasonPhrase(ILjava/lang/String;)V

    :cond_139
    invoke-virtual {v6}, Landroid/webkit/WebResourceResponse;->getResponseHeaders()Ljava/util/Map;

    move-result-object p0

    if-nez p0, :cond_141

    sget-object p0, Ln08;->a:Ln08;

    :cond_141
    sget-object p1, La3p;->h0:Ljava/util/Map;

    invoke-static {p0, p1}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object p0

    invoke-virtual {v6, p0}, Landroid/webkit/WebResourceResponse;->setResponseHeaders(Ljava/util/Map;)V

    invoke-virtual {v6}, Landroid/webkit/WebResourceResponse;->getData()Ljava/io/InputStream;

    move-result-object p0

    instance-of p1, p0, Ljava/io/BufferedInputStream;

    if-eqz p1, :cond_155

    check-cast p0, Ljava/io/BufferedInputStream;

    goto :goto_15d

    :cond_155
    new-instance p1, Ljava/io/BufferedInputStream;

    const/high16 p2, 0x10000

    invoke-direct {p1, p0, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    move-object p0, p1

    :goto_15d
    invoke-virtual {v6, p0}, Landroid/webkit/WebResourceResponse;->setData(Ljava/io/InputStream;)V
    :try_end_160
    .catchall {:try_start_12a .. :try_end_160} :catchall_161

    goto :goto_163

    :catchall_161
    sget-object p0, Lt0i;->b:Lp0i;

    :cond_163
    :goto_163
    move-object p0, v6

    goto/16 :goto_26c

    :cond_166
    invoke-virtual {v6}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    invoke-virtual {v0, p1}, La3p;->e(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v4

    if-eqz v4, :cond_18d

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, La3p;

    iget-object p0, p0, La3p;->F:Landroid/net/Uri;

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_18d

    iget-object p0, v0, La3p;->g:Lp7p;

    if-eqz p0, :cond_163

    const/16 p1, 0x2392

    invoke-virtual {p0, p1, v3}, Lp7p;->g(ILjava/lang/String;)V

    goto :goto_163

    :cond_18d
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_163

    sget-object p0, La3p;->h0:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_163

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_163

    iget-object p0, v0, La3p;->g:Lp7p;

    if-eqz p0, :cond_1f1

    invoke-virtual {p0, v2, v3}, Lp7p;->g(ILjava/lang/String;)V

    goto :goto_1f1

    :cond_1b7
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1f7

    sget-object v6, La3p;->h0:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f7

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1f7

    iget-object p2, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p2, La3p;

    iget-object p2, p2, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, La3p;

    iget-object p2, p0, La3p;->g:Lp7p;

    if-eqz p2, :cond_1f1

    invoke-virtual {p0, p1}, La3p;->e(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, v2, p0}, Lp7p;->g(ILjava/lang/String;)V

    :cond_1f1
    :goto_1f1
    invoke-static {v5}, Lmfh;->c(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    goto/16 :goto_26c

    :cond_1f7
    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v2

    iget-boolean v2, v2, Lz8p;->B:Z

    if-eqz v2, :cond_26b

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v2

    if-nez v2, :cond_26b

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->hasGesture()Z

    move-result v2

    if-eqz v2, :cond_26b

    if-eqz v0, :cond_26b

    iget-object v0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    iget-object v0, v0, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_26b

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object p2

    const-string v0, "GET"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_26b

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_26b

    sget-object p2, La3p;->h0:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_26b

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_26b

    iget-object p2, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p2, La3p;

    iget-object p2, p2, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2, v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p2

    if-eqz p2, :cond_26b

    iget-object p2, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p2, La3p;

    new-instance v0, Lvr9;

    const/16 v1, 0x1a

    invoke-direct {v0, p2, p1, v1}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, La3p;

    iget-object p0, p0, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    goto :goto_1f1

    :cond_26b
    move-object p0, v8

    :goto_26c
    return-object p0

    nop

    :pswitch_data_26e
    .packed-switch 0x4
        :pswitch_a
    .end packed-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .registers 7

    iget-byte v0, p0, Lc5d;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lc5d;->b:Ljava/lang/Object;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_82

    :pswitch_9
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p0

    return p0

    .line 556
    :pswitch_e
    check-cast v2, La3p;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 557
    sget-object p1, Lito;->a:[Lito;

    .line 558
    :try_start_19
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v0, "mraid"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_29

    .line 559
    invoke-virtual {v2, p0}, La3p;->k(Landroid/net/Uri;)V

    goto :goto_54

    .line 560
    :cond_29
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 561
    invoke-static {p1}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4d

    .line 562
    sget-object p1, La3p;->h0:Ljava/util/Map;

    .line 563
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "appassets.androidplatform.net"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4d

    .line 564
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->hasGesture()Z

    move-result p0

    if-eqz p0, :cond_5d

    .line 565
    iget-object p0, v2, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 566
    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_5d

    :cond_4d
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    .line 567
    invoke-virtual {v2, p0}, La3p;->n(Ljava/lang/String;)V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_54} :catch_56

    :goto_54
    move v1, v3

    goto :goto_5d

    :catch_56
    move-exception p0

    .line 568
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 569
    sget-object p0, Lito;->a:[Lito;

    goto :goto_54

    :cond_5d
    :goto_5d
    return v1

    .line 570
    :pswitch_5e
    check-cast v2, Lplk;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 571
    invoke-virtual {v2, v0}, Lplk;->g(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_74

    .line 572
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p0

    if-eqz p0, :cond_75

    :cond_74
    move v1, v3

    :cond_75
    return v1

    .line 573
    :pswitch_76
    check-cast v2, Lads_mobile_sdk/gx0;

    .line 574
    iget-object p0, v2, Lads_mobile_sdk/gx0;->a:Lads_mobile_sdk/ry0;

    .line 575
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lads_mobile_sdk/ry0;->a(Landroid/net/Uri;)V

    return v3

    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_76
        :pswitch_5e
        :pswitch_9
        :pswitch_e
    .end packed-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-byte v2, v0, Lc5d;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v5, v0, Lc5d;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_22c

    :pswitch_d
    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0

    :pswitch_12
    const-string v0, "gmsg://"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    check-cast v5, Lplk;

    const-string v0, "0"

    invoke-virtual {v5, v1, v0}, Lplk;->w(Ljava/lang/String;Ljava/lang/String;)V

    move v3, v4

    :cond_22
    return v3

    :pswitch_23
    check-cast v5, Lapp;

    iget-object v0, v5, Lapp;->b:Lcom/google/ads/interactivemedia/v3/internal/zzfe;

    invoke-virtual {v0, v1}, Lcom/google/ads/interactivemedia/v3/internal/zzfe;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-object v0, v5, Lapp;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3e

    invoke-static {v0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object v0

    throw v0

    :cond_3e
    return v4

    :pswitch_3f
    check-cast v5, Lt2p;

    iget-object v0, v5, Lt2p;->b:Landroid/content/Context;

    if-eqz v1, :cond_72

    :try_start_45
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {v1}, Ln5p;->e(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-static {v0, v2}, Ln5p;->b(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-static {v5}, Lupj;->e(Landroid/view/View;)Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_66

    invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_6e

    :cond_66
    const/high16 v1, 0x10000000

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_6e
    invoke-virtual {v5}, Lt2p;->c()V
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_71} :catch_72

    move v3, v4

    :catch_72
    :cond_72
    return v3

    :pswitch_73
    check-cast v5, Lplk;

    invoke-virtual {v5, v1}, Lplk;->g(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_81

    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_82

    :cond_81
    move v3, v4

    :cond_82
    return v3

    :pswitch_83
    const-string v0, "mraid://"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    check-cast v5, Lcom/opera/ad/mraid/MRAIDView;

    if-eqz v0, :cond_227

    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/16 v2, 0x3f

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v6, -0x1

    if-eq v2, v6, :cond_ce

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    add-int/2addr v2, v4

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "&"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    move v7, v3

    :goto_b4
    if-ge v7, v2, :cond_cd

    aget-object v8, v0, v7

    const/16 v9, 0x3d

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    invoke-virtual {v8, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    add-int/2addr v9, v4

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_b4

    :cond_cd
    move-object v0, v6

    :cond_ce
    const-string v14, "storePicture"

    const-string v15, "useCustomClose"

    const-string v6, "close"

    const-string v7, "createCalendarEvent"

    const-string v8, "expand"

    const-string v9, "open"

    const-string v10, "playVideo"

    const-string v11, "resize"

    const-string v12, "setOrientationProperties"

    const-string v13, "setResizeProperties"

    filled-new-array/range {v6 .. v15}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    const-string v6, "command"

    const-string v7, "url"

    const-string v8, "setResizeProperties"

    const-string v9, "setOrientationProperties"

    const-string v10, "eventJSON"

    const-string v11, "createCalendarEvent"

    const-string v12, "useCustomClose"

    const/4 v13, 0x0

    if-eqz v2, :cond_184

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10b

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    goto/16 :goto_182

    :cond_10b
    const-string v2, "open"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17e

    const-string v2, "playVideo"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17e

    const-string v2, "storePicture"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17e

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13a

    const-string v2, "allowOrientationChange"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "forceOrientation"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    goto :goto_17c

    :cond_13a
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_171

    const-string v2, "width"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "height"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "offsetX"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "offsetY"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "customClosePosition"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    const-string v2, "allowOffscreen"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    goto :goto_17c

    :cond_171
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17c

    invoke-virtual {v1, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_182

    :cond_17c
    :goto_17c
    move v3, v4

    goto :goto_182

    :cond_17e
    invoke-virtual {v1, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    :cond_182
    :goto_182
    if-nez v3, :cond_186

    :cond_184
    move-object v2, v13

    goto :goto_191

    :cond_186
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :goto_191
    if-eqz v2, :cond_22a

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_22a

    const-string v1, "close"

    const-string v3, "resize"

    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v1

    const-string v18, "storePicture"

    const-string v19, "useCustomClose"

    const-string v14, "createCalendarEvent"

    const-string v15, "expand"

    const-string v16, "open"

    const-string v17, "playVideo"

    filled-new-array/range {v14 .. v19}, [Ljava/lang/String;

    move-result-object v3

    filled-new-array {v9, v8}, [Ljava/lang/String;

    move-result-object v6

    :try_start_1b7
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1cd

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0, v13}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22a

    :cond_1cd
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_202

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1ed

    move-object v7, v10

    goto :goto_1f4

    :cond_1ed
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f4

    move-object v7, v12

    :cond_1f4
    :goto_1f4
    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22a

    :cond_202
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22a

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/util/Map;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_221
    .catch Ljava/lang/Exception; {:try_start_1b7 .. :try_end_221} :catch_222

    goto :goto_22a

    :catch_222
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_22a

    :cond_227
    invoke-virtual {v5, v1}, Lcom/opera/ad/mraid/MRAIDView;->open(Ljava/lang/String;)V

    :cond_22a
    :goto_22a
    return v4

    nop

    :pswitch_data_22c
    .packed-switch 0x0
        :pswitch_83
        :pswitch_d
        :pswitch_73
        :pswitch_3f
        :pswitch_d
        :pswitch_23
        :pswitch_12
    .end packed-switch
.end method
