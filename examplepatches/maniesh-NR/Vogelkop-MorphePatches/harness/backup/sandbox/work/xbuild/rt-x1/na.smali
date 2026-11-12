.class public final Lna;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public a:Lmyn;

.field public b:Layn;


# virtual methods
.method public final doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .registers 9

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const/4 v4, 0x0

    if-gtz v3, :cond_1a

    const-string v3, "doUpdateVisitedHistory: "

    invoke-static {v3, p2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1a
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    iget-object p2, p0, Lna;->b:Layn;

    if-nez p2, :cond_22

    move-object p2, v4

    :cond_22
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p3

    iget-object p2, p2, Layn;->d:Lt0g;

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p2, p3}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p0, p0, Lna;->b:Layn;

    if-eqz p0, :cond_34

    move-object v4, p0

    :cond_34
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result p0

    iget-object p1, v4, Layn;->e:Lt0g;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 7

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    sget-object p1, Lotb;->d:Lotb;

    iget-object v0, p1, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->b:Leaj;

    iget-object v2, p1, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    const/4 v3, 0x0

    if-gtz v2, :cond_1d

    const-string v2, "onPageFinished: "

    invoke-static {v2, p2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2, v3}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1d
    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_22

    move-object p1, v3

    :cond_22
    sget-object v0, Lhtc;->a:Lhtc;

    iget-object p1, p1, Lmyn;->c:Lt0g;

    invoke-virtual {p1, v0}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p0, p0, Lna;->a:Lmyn;

    if-eqz p0, :cond_2e

    move-object v3, p0

    :cond_2e
    iget-object p0, v3, Lmyn;->a:Lt0g;

    invoke-virtual {p0, p2}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 12

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    sget-object p1, Lotb;->d:Lotb;

    iget-object p3, p1, Lhzc;->b:Ljava/lang/String;

    sget-object v0, Leaj;->b:Leaj;

    iget-object v1, p1, Lhzc;->a:Letb;

    iget-object v1, v1, Letb;->a:Leaj;

    invoke-virtual {v1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    const/4 v5, 0x0

    if-gtz v1, :cond_1d

    const-string v1, "onPageStarted: "

    invoke-static {v1, p2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, p3, v1, v5}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1d
    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_22

    move-object p1, v5

    :cond_22
    new-instance p3, Ljtc;

    const/4 v0, 0x0

    invoke-direct {p3, v0}, Ljtc;-><init>(F)V

    iget-object p1, p1, Lmyn;->c:Lt0g;

    invoke-virtual {p1, p3}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_32

    move-object p1, v5

    :cond_32
    iget-object p1, p1, Lmyn;->e:Lpuj;

    invoke-virtual {p1}, Lpuj;->clear()V

    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_3c

    move-object p1, v5

    :cond_3c
    iget-object p1, p1, Lmyn;->d:Lt0g;

    invoke-virtual {p1, v5}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_46

    move-object p1, v5

    :cond_46
    iget-object p1, p1, Lmyn;->a:Lt0g;

    invoke-virtual {p1, p2}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_50

    move-object p1, v5

    :cond_50
    invoke-virtual {p1}, Lmyn;->b()Ljvn;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lna;->a:Lmyn;

    if-nez p1, :cond_5c

    move-object p1, v5

    :cond_5c
    invoke-virtual {p1}, Lmyn;->b()Ljvn;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lna;->b:Layn;

    if-eqz p0, :cond_69

    move-object v3, p0

    goto :goto_6a

    :cond_69
    move-object v3, v5

    :goto_6a
    iget-object p0, v3, Layn;->a:Lnx5;

    new-instance v2, Lcek;

    const/16 v7, 0x9

    const-string v4, "var meta = document.createElement(\'meta\');meta.setAttribute(\'name\', \'viewport\');meta.setAttribute(\'content\', \'width=device-width, initial-scale=1.0, maximum-scale=10.0, minimum-scale=0.1,user-scalable=yes\');document.getElementsByTagName(\'head\')[0].appendChild(meta);"

    move-object v6, v5

    invoke-direct/range {v2 .. v7}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    invoke-static {p0, v5, v5, v2, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .registers 10

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    sget-object p1, Lotb;->d:Lotb;

    iget-object v0, p1, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->e:Leaj;

    iget-object v2, p1, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    const/4 v3, 0x0

    if-gtz v2, :cond_2d

    if-eqz p3, :cond_1b

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_1c

    :cond_1b
    move-object v2, v3

    :goto_1c
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "onReceivedError: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2, v3}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2d
    if-eqz p3, :cond_52

    iget-object p0, p0, Lna;->a:Lmyn;

    if-eqz p0, :cond_34

    move-object v3, p0

    :cond_34
    iget-object p0, v3, Lmyn;->e:Lpuj;

    new-instance p1, Lxwn;

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    move-result v0

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    if-eqz p2, :cond_4b

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p2

    goto :goto_4c

    :cond_4b
    const/4 p2, 0x0

    :goto_4c
    invoke-direct {p1, v0, p3, p2}, Lxwn;-><init>(ILjava/lang/String;Z)V

    invoke-virtual {p0, p1}, Lpuj;->add(Ljava/lang/Object;)Z

    :cond_52
    return-void
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .registers 9

    const/4 v0, 0x0

    if-eqz p2, :cond_8

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    goto :goto_9

    :cond_8
    move-object v1, v0

    :goto_9
    sget-object v2, Lotb;->d:Lotb;

    iget-object v3, v2, Lhzc;->b:Ljava/lang/String;

    sget-object v4, Leaj;->b:Leaj;

    iget-object v5, v2, Lhzc;->a:Letb;

    iget-object v5, v5, Letb;->a:Leaj;

    invoke-virtual {v5, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v5

    if-gtz v5, :cond_22

    const-string v5, "Intercepting request for URL: "

    invoke-static {v1, v5}, Lfki;->p(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v4, v3, v1, v0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_22
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    return-object p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .registers 14

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const/4 v4, 0x0

    if-gtz v3, :cond_55

    if-eqz p2, :cond_2c

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isRedirect()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object v7

    goto :goto_30

    :cond_2c
    move-object v3, v4

    move-object v5, v3

    move-object v6, v5

    move-object v7, v6

    :goto_30
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "shouldOverrideUrlLoading: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_55
    if-eqz p2, :cond_bd

    iget-object v0, p0, Lna;->b:Layn;

    if-nez v0, :cond_5c

    move-object v0, v4

    :cond_5c
    iget-object v0, v0, Layn;->b:Lrii;

    if-eqz v0, :cond_bd

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isRedirect()Z

    move-result v9

    new-instance v5, Lfvn;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_7b

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    :goto_79
    move-object v7, v0

    goto :goto_81

    :cond_7b
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    goto :goto_79

    :goto_81
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v8

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_8d

    const-string p1, "GET"

    :cond_8d
    move-object v10, p1

    invoke-direct/range {v5 .. v10}, Lfvn;-><init>(Ljava/lang/String;Ljava/util/LinkedHashMap;ZZLjava/lang/String;)V

    iget-object p0, p0, Lna;->b:Layn;

    if-eqz p0, :cond_96

    move-object v4, p0

    :cond_96
    iget-object p0, v4, Layn;->b:Lrii;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_ab

    sget-object p0, Lgvn;->a:Lgvn;

    goto :goto_ad

    :cond_ab
    sget-object p0, Lhvn;->a:Lhvn;

    :goto_ad
    instance-of p1, p0, Lgvn;

    const/4 p2, 0x0

    if-eqz p1, :cond_b3

    return p2

    :cond_b3
    instance-of p0, p0, Lhvn;

    if-eqz p0, :cond_b9

    const/4 p0, 0x1

    return p0

    :cond_b9
    invoke-static {}, Lh9o;->p()V

    return p2

    :cond_bd
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p0

    return p0
.end method
