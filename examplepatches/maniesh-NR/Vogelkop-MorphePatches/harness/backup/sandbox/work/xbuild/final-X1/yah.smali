.class public final Lyah;
.super Lk8;
.source "SourceFile"


# virtual methods
.method public final s0(Labh;)V
    .registers 4

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lcbh;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_16

    const/4 v1, 0x1

    if-eq p0, v1, :cond_10

    return-void

    :cond_10
    check-cast v0, Lzah;

    invoke-interface {p1}, Labh;->D()V

    return-void

    :cond_16
    check-cast v0, Lbbh;

    invoke-interface {p1, v0}, Labh;->a(Lbbh;)V

    return-void
.end method
