.class public abstract Lbzj;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a()Z
    .registers 3

    sget-object v0, Lwyj;->a:Lwyj;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    return v1

    :cond_a
    instance-of v0, p0, Lxyj;

    if-eqz v0, :cond_f

    return v1

    :cond_f
    instance-of v0, p0, Lyyj;

    if-eqz v0, :cond_14

    return v1

    :cond_14
    sget-object v0, Lazj;->a:Lazj;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    return v1

    :cond_1d
    sget-object v0, Lzyj;->a:Lzyj;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    return v1

    :cond_27
    instance-of p0, p0, Lvyj;

    if-eqz p0, :cond_2c

    return v1

    :cond_2c
    invoke-static {}, Lh9o;->p()V

    return v1
.end method
