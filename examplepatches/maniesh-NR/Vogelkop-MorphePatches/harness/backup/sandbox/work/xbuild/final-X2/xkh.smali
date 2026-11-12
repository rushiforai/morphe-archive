.class public final Lxkh;
.super Lyvj;
.source "SourceFile"


# instance fields
.field public b:I


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lwkh;

    check-cast p2, Lwkh;

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5

    check-cast p1, Lwkh;

    check-cast p2, Lwkh;

    iget-object p0, p1, Lwkh;->a:Lilh;

    iget-wide p0, p0, Lilh;->a:J

    iget-object p2, p2, Lwkh;->a:Lilh;

    iget-wide v0, p2, Lilh;->a:J

    cmp-long p0, p0, v0

    if-nez p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 9

    check-cast p1, Lwkh;

    check-cast p2, Lwkh;

    iget-object v0, p1, Lwkh;->a:Lilh;

    iget-wide v1, v0, Lilh;->a:J

    iget-object v3, p2, Lwkh;->a:Lilh;

    iget-wide v4, v3, Lilh;->a:J

    cmp-long v1, v1, v4

    const/4 v2, 0x0

    if-nez v1, :cond_12

    return v2

    :cond_12
    iget p0, p0, Lxkh;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_4e

    const/4 v1, 0x1

    if-eq p0, v1, :cond_45

    const/4 v4, 0x3

    if-eq p0, v4, :cond_2c

    iget p0, p1, Lwkh;->b:I

    iget p1, p2, Lwkh;->b:I

    if-ge p0, p1, :cond_28

    const/4 p0, -0x1

    return p0

    :cond_28
    if-ne p0, p1, :cond_2b

    return v2

    :cond_2b
    return v1

    :cond_2c
    iget-object p0, v3, Lilh;->i:Ljava/lang/Long;

    const-wide/16 p1, -0x1

    if-nez p0, :cond_34

    move-wide v1, p1

    goto :goto_38

    :cond_34
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_38
    iget-object p0, v0, Lilh;->i:Ljava/lang/Long;

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    :cond_40
    invoke-static {v1, v2, p1, p2}, Lcs5;->p(JJ)I

    move-result p0

    return p0

    :cond_45
    iget-wide p0, v3, Lilh;->d:J

    iget-wide v0, v0, Lilh;->d:J

    invoke-static {p0, p1, v0, v1}, Lcs5;->p(JJ)I

    move-result p0

    return p0

    :cond_4e
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p0

    iget-object p1, v0, Lilh;->c:Ljava/lang/String;

    iget-object p2, v3, Lilh;->c:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method
