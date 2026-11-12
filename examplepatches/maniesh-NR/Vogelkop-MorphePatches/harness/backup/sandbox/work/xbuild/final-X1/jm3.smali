.class public final Ljm3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:J

.field public c:Lnl3;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Ljm3;

    if-eqz v0, :cond_1c

    check-cast p1, Ljm3;

    iget-boolean v0, p0, Ljm3;->a:Z

    iget-boolean v1, p1, Ljm3;->a:Z

    if-ne v0, v1, :cond_1c

    iget-wide v0, p0, Ljm3;->b:J

    iget-wide v2, p1, Ljm3;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1c

    iget-object p0, p0, Ljm3;->c:Lnl3;

    iget-object p1, p1, Ljm3;->c:Lnl3;

    if-eq p0, p1, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-boolean v0, p0, Ljm3;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Ljm3;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Ljm3;->c:Lnl3;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
