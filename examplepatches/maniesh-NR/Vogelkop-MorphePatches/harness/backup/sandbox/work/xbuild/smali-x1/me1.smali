.class public interface abstract Lme1;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract b()Z
.end method

.method public abstract c(J)Lif1;
.end method

.method public d(J)Z
    .registers 5

    invoke-interface {p0}, Lme1;->e()J

    move-result-wide v0

    cmp-long p0, p1, v0

    if-ltz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public abstract e()J
.end method

.method public abstract f()Lj8m;
.end method

.method public abstract g(J)Ljava/lang/Object;
.end method

.method public abstract h()Ljava/lang/Object;
.end method
