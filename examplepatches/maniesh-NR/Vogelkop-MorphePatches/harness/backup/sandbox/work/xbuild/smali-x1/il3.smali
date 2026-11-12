.class public final Lil3;
.super Lll3;
.source "SourceFile"


# virtual methods
.method public final a(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lll3;->a:Lal3;

    check-cast p0, Lpl3;

    invoke-interface {p0}, Lpl3;->getUrl()Lshf;

    move-result-object p0

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_12

    const-string p0, ""

    :cond_12
    return-object p0
.end method

.method public final b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 9

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0, v0}, Lil3;->a(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v2

    sget p0, Lvmj;->g:I

    invoke-static {p1}, Ltmj;->i(Landroid/content/Context;)I

    move-result v3

    sget-object v5, Lna5;->c:Lna5;

    const/16 v6, 0x20

    move v4, v3

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public final c(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lll3;->a:Lal3;

    check-cast p0, Lpl3;

    invoke-static {p0}, Lalo;->K(Lpl3;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
