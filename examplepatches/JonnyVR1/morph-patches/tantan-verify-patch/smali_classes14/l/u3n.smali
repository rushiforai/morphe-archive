.class public final Ll/u3n;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic a(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C5(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lrx/c;
    .locals 3
    .param p0    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    new-array p0, v0, [Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Ll/u3n;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B5(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v2, Ll/t3n;

    .line 43
    .line 44
    invoke-direct {v2, v1, p0}, Ll/t3n;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_2
    :goto_0
    new-array p0, v0, [Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 53
    .line 54
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "svip"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hg()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const-string p0, "tttSvipGoogleplay"

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method
