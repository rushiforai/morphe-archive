.class public final Lcom/opera/android/articles/NewsfeedArticleExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static playPodcast(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;[Lorg/chromium/url/GURL;)V
    .registers 15
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    invoke-static {v0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v2

    if-eqz v2, :cond_70

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-virtual {v2, p0}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object p0

    if-eqz p0, :cond_1b

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->f0()Ljava/lang/String;

    move-result-object p0

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    const-string v0, ""

    if-eqz p0, :cond_3a

    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->e0:Lc5o;

    iget-object v1, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lg82;

    if-eqz v1, :cond_37

    iget-object p0, v1, Lg82;->a:Ljava/lang/String;

    iget-object v1, v1, Lg82;->g:Ljava/lang/String;

    sget-object v3, Laik;->a:[Ljava/lang/String;

    if-eqz v1, :cond_37

    move-object v0, v1

    :cond_37
    move-object v5, p0

    move-object v7, v0

    goto :goto_3c

    :cond_3a
    move-object v5, v0

    move-object v7, v5

    :goto_3c
    iget-object p0, v2, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->L:Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lbmg;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    new-instance p1, Lmn;

    const/16 p4, 0xb

    invoke-direct {p1, p4}, Lmn;-><init>(B)V

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Ljava/util/List;

    sget-object v9, Lf90;->f:Lf90;

    move-object v4, p2

    move-object v6, p3

    invoke-virtual/range {v1 .. v9}, Lbmg;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lf90;)V

    :cond_70
    return-void
.end method

.method public static shouldInstall(Lorg/chromium/url/GURL;)Z
    .registers 3
    .param p0    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->A()Loue;

    move-result-object v0

    invoke-virtual {v0, p0}, Loue;->a(Lorg/chromium/url/GURL;)Z

    move-result p0

    return p0
.end method
