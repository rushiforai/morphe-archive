.class public final Lorg/chromium/media/PhotoCapabilities;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[Z

.field public b:[D

.field public c:[I

.field public d:[I

.field public e:[I

.field public f:[[I


# virtual methods
.method public final getBool(I)Z
    .registers 3

    if-ltz p1, :cond_a

    const/4 v0, 0x3

    if-ge p1, v0, :cond_a

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->a:[Z

    aget-boolean p0, p0, p1

    return p0

    :cond_a
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return p0
.end method

.method public final getDouble(I)D
    .registers 3

    if-ltz p1, :cond_b

    const/16 v0, 0x10

    if-ge p1, v0, :cond_b

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->b:[D

    aget-wide p0, p0, p1

    return-wide p0

    :cond_b
    invoke-static {}, Lhai;->d()V

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final getFillLightModeArray()[I
    .registers 1

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->d:[I

    if-eqz p0, :cond_b

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    :cond_b
    const/4 p0, 0x0

    new-array p0, p0, [I

    return-object p0
.end method

.method public final getInt(I)I
    .registers 3

    if-ltz p1, :cond_b

    const/16 v0, 0x10

    if-ge p1, v0, :cond_b

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->c:[I

    aget p0, p0, p1

    return p0

    :cond_b
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return p0
.end method

.method public final getMeteringMode(I)I
    .registers 3

    if-ltz p1, :cond_a

    const/4 v0, 0x3

    if-ge p1, v0, :cond_a

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->e:[I

    aget p0, p0, p1

    return p0

    :cond_a
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return p0
.end method

.method public final getMeteringModeArray(I)[I
    .registers 3

    if-ltz p1, :cond_16

    const/4 v0, 0x3

    if-ge p1, v0, :cond_16

    iget-object p0, p0, Lorg/chromium/media/PhotoCapabilities;->f:[[I

    aget-object p0, p0, p1

    if-eqz p0, :cond_12

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    :cond_12
    const/4 p0, 0x0

    new-array p0, p0, [I

    return-object p0

    :cond_16
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0
.end method
