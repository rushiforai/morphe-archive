.class public final Lto8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwv8;


# virtual methods
.method public final a(Lyz;)Ljava/lang/String;
    .registers 2

    const-string p0, "http://localhost:8082/image"

    return-object p0
.end method

.method public final b(Lyz;)D
    .registers 2

    const-wide/high16 p0, 0x4014000000000000L    # 5.0

    return-wide p0
.end method

.method public final c(Lyz;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lbp8;

    iget-object p0, p1, Lyz;->e:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_a

    const-string p0, ""

    :cond_a
    return-object p0
.end method

.method public final d(Lyz;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final e(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lbp8;

    iget-object p0, p1, Lyz;->h:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_a

    const-string p0, ""

    :cond_a
    return-object p0
.end method

.method public final f(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lbp8;

    iget-object p0, p1, Lyz;->b:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_a

    const-string p0, ""

    :cond_a
    return-object p0
.end method

.method public final g(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lbp8;

    iget-object p0, p1, Lyz;->a:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_a

    const-string p0, ""

    :cond_a
    return-object p0
.end method
