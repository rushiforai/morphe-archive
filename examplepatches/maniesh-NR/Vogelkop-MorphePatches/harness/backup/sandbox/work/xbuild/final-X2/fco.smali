.class public final Lfco;
.super Ll6e;
.source "SourceFile"


# virtual methods
.method public final g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;
    .registers 7

    iget-object p0, p0, Ll6e;->d:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    new-instance p2, Landroid/net/Uri$Builder;

    invoke-direct {p2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "images"

    invoke-virtual {p3, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "touch"

    invoke-virtual {p3, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "search"

    invoke-virtual {p3, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "clid"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string p3, "rpt"

    const-string v0, "imageview"

    invoke-virtual {p0, p3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string p0, "url"

    invoke-virtual {p2, p0, p4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    new-instance p2, Llsc;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lksc;-><init>(Ljava/lang/String;I)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p3, Lg54;

    sget-object p4, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p4

    invoke-direct {p3, p4}, Lg54;-><init>([B)V

    iput-object p0, p3, Lg54;->c:Ljava/lang/String;

    sget-object p0, Lsce;->e:Lesd;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    sget-object p4, Lsce;->e:Lesd;

    iget-object v0, p4, Lesd;->b:Ljava/lang/String;

    const-string v1, "multipart"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_aa

    const-string v0, "image/jpeg"

    :try_start_7d
    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0
    :try_end_81
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7d .. :try_end_81} :catch_82

    goto :goto_83

    :catch_82
    move-object v0, v1

    :goto_83
    invoke-static {p1, v0}, Lrvh;->create([BLesd;)Lrvh;

    move-result-object p1

    const-string v0, "upfile"

    invoke-static {v0, v1, p1}, Lw7d;->l(Ljava/lang/String;Ljava/lang/String;Lrvh;)Lrce;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_a4

    new-instance p1, Lsce;

    invoke-static {p0}, Lokhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-direct {p1, p3, p4, p0}, Lsce;-><init>(Lg54;Lesd;Ljava/util/List;)V

    invoke-static {p2, p1}, Ll6e;->o(Llsc;Lsce;)Llsc;

    move-result-object p0

    return-object p0

    :cond_a4
    const-string p0, "Multipart body must have at least one part."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_aa
    const-string p0, "multipart != "

    invoke-static {p4, p0}, Lodf;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method public final m()I
    .registers 1

    const/16 p0, 0x400

    return p0
.end method
