.class public final Lff3;
.super Lk8;
.source "SourceFile"


# virtual methods
.method public final s0(Lhf3;)V
    .registers 4

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ljf3;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1f

    const/4 v1, 0x1

    if-eq p0, v1, :cond_19

    const/4 v1, 0x2

    if-eq p0, v1, :cond_13

    return-void

    :cond_13
    check-cast v0, Lgf3;

    invoke-interface {p1}, Lhf3;->D()V

    return-void

    :cond_19
    check-cast v0, Lef3;

    invoke-interface {p1}, Lhf3;->v()V

    return-void

    :cond_1f
    check-cast v0, Lif3;

    invoke-interface {p1}, Lhf3;->E()V

    return-void
.end method
