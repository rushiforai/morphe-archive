.class public abstract Ltw7;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 2

    instance-of v0, p0, Lrw7;

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    instance-of v0, p0, Lsw7;

    if-eqz v0, :cond_f

    check-cast p0, Lsw7;

    iget-object p0, p0, Lsw7;->a:Ljava/lang/Object;

    return-object p0

    :cond_f
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
