.class public final Lui5;
.super Lta6;
.source "SourceFile"


# instance fields
.field public d:J

.field public e:J


# virtual methods
.method public final c()Z
    .registers 1

    invoke-virtual {p0}, Lui5;->f()I

    move-result p0

    if-gtz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final f()I
    .registers 7

    iget-wide v0, p0, Lui5;->e:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_20

    iget-wide v4, p0, Lui5;->d:J

    cmp-long p0, v4, v2

    if-lez p0, :cond_20

    cmp-long p0, v4, v0

    if-gez p0, :cond_20

    const-wide/16 v2, 0x64

    mul-long/2addr v4, v2

    div-long/2addr v4, v0

    long-to-int p0, v4

    rsub-int/lit8 p0, p0, 0x64

    const/16 v0, 0x63

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final g()J
    .registers 5

    iget-wide v0, p0, Lui5;->e:J

    iget-wide v2, p0, Lui5;->d:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method
