.class public final Loo;
.super Lo43;
.source "SourceFile"

# interfaces
.implements Lxa2;


# virtual methods
.method public final J(Lwa2;)V
    .registers 2

    iget-object p0, p1, Lwa2;->a:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->setEmpty()V

    const/4 p0, 0x0

    iput-boolean p0, p1, Lwa2;->c:Z

    return-void
.end method

.method public final Z()Lmq;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    check-cast p0, Lno;

    return-object p0
.end method
