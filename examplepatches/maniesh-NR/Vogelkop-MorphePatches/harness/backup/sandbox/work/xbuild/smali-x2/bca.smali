.class public abstract Lbca;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# virtual methods
.method public abstract G()I
.end method

.method public abstract H(J)Laca;
.end method

.method public abstract I()Lj4c;
.end method

.method public abstract J()Z
.end method

.method public abstract K(Landroidx/recyclerview/widget/i;)V
.end method

.method public abstract L(Ljava/util/List;)V
.end method

.method public n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p0

    sget-object p1, Ley0;->a:Ley0;

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
