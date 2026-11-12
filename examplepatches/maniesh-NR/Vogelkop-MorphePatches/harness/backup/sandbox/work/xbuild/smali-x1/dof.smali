.class public final Ldof;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    if-eq p0, p1, :cond_b8

    instance-of p0, p1, Ldof;

    if-eqz p0, :cond_b6

    const/high16 p0, 0x40000000    # 2.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x40800000    # 4.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x41000000    # 8.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x41400000    # 12.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x41800000    # 16.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x41a00000    # 20.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x41c00000    # 24.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42000000    # 32.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42100000    # 36.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42200000    # 40.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42400000    # 48.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42600000    # 56.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42800000    # 64.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42900000    # 72.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42a00000    # 80.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42b00000    # 88.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42c00000    # 96.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x42e00000    # 112.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x43000000    # 128.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x43100000    # 144.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x43200000    # 160.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-eqz p0, :cond_b6

    const/high16 p0, 0x43600000    # 224.0f

    invoke-static {p0, p0}, Lgh7;->b(FF)Z

    move-result p0

    if-nez p0, :cond_b8

    :cond_b6
    const/4 p0, 0x0

    return p0

    :cond_b8
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    const/high16 p0, -0x1c200000

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
