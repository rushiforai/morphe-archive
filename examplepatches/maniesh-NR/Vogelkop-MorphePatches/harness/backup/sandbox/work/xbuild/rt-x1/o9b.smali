.class public final Lo9b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Z

.field public c:Z


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lo9b;

    if-eqz v0, :cond_1c

    check-cast p1, Lo9b;

    iget-wide v0, p0, Lo9b;->a:J

    iget-wide v2, p1, Lo9b;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lo9b;->b:Z

    iget-boolean v1, p1, Lo9b;->b:Z

    if-ne v0, v1, :cond_1c

    iget-boolean p0, p0, Lo9b;->c:Z

    iget-boolean p1, p1, Lo9b;->c:Z

    if-eq p0, p1, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-wide v0, p0, Lo9b;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lo9b;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lo9b;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
