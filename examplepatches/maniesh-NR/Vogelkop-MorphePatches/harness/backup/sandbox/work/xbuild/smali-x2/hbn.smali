.class public abstract Lhbn;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a()Z
    .registers 3

    sget-object v0, Ldbn;->a:Ldbn;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    return v1

    :cond_a
    instance-of v0, p0, Lgbn;

    if-eqz v0, :cond_f

    return v1

    :cond_f
    instance-of v0, p0, Lbbn;

    if-eqz v0, :cond_14

    return v1

    :cond_14
    sget-object v0, Lcbn;->a:Lcbn;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    return v1

    :cond_1e
    instance-of v0, p0, Lebn;

    if-eqz v0, :cond_23

    return v1

    :cond_23
    instance-of p0, p0, Lfbn;

    if-eqz p0, :cond_28

    return v1

    :cond_28
    invoke-static {}, Lh9o;->p()V

    return v1
.end method
