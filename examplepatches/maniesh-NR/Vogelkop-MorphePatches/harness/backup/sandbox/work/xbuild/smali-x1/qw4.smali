.class public abstract Lqw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;
.implements Lsic;


# direct methods
.method public static c(Lpw4;Lpw4;)I
    .registers 4

    iget-boolean v0, p0, Lpw4;->d:Z

    if-eqz v0, :cond_a

    iget-boolean v1, p1, Lpw4;->d:Z

    if-nez v1, :cond_a

    const/4 p0, -0x1

    return p0

    :cond_a
    if-nez v0, :cond_12

    iget-boolean v0, p1, Lpw4;->d:Z

    if-eqz v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    iget-wide v0, p0, Lpw4;->c:J

    iget-wide p0, p1, Lpw4;->c:J

    sub-long/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result p0

    return p0
.end method


# virtual methods
.method public abstract I(IILjava/lang/Object;)V
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lqhc;

    check-cast p2, Lqhc;

    const/4 p0, 0x0

    return p0
.end method

.method public b(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lqhc;

    check-cast p2, Lqhc;

    invoke-virtual {p1, p2}, Lqhc;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public abstract compare(Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    const/4 p0, 0x0

    return-object p0
.end method
