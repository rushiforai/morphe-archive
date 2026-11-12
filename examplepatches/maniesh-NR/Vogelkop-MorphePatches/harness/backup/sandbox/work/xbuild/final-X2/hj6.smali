.class public final Lhj6;
.super Ly3d;
.source "SourceFile"

# interfaces
.implements Lysd;


# virtual methods
.method public final entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    check-cast p2, Ljava/lang/String;

    if-nez p3, :cond_b

    if-nez p4, :cond_b

    const/4 p3, 0x0

    invoke-super {p0, p1, p2, p3, p3}, Ly3d;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_b
    invoke-static {}, Lh9o;->t()V

    return-void
.end method

.method public final l(I)V
    .registers 3

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lj7c;->a(II)Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-virtual {p0}, Ly3d;->evictAll()V

    :cond_a
    return-void
.end method

.method public final sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    check-cast p1, Ljava/lang/String;

    invoke-static {p2}, Lsko;->g(Ljava/lang/Object;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method
