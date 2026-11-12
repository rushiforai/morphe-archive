.class public final Lh7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public a:Ljava/util/ArrayList;

.field public b:I

.field public c:I

.field public d:Z


# virtual methods
.method public final b(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_15

    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    goto :goto_17

    :cond_f
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    :cond_15
    const/4 p0, 0x0

    return p0

    :cond_17
    :goto_17
    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lh7f;->c:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Lh7f;->c:I

    return v0
.end method

.method public final c(Ljava/lang/Object;)Z
    .registers 5

    if-eqz p1, :cond_2e

    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    if-eqz v0, :cond_2e

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_2e

    iget v0, p0, Lh7f;->b:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_19

    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_20

    :cond_19
    iput-boolean v2, p0, Lh7f;->d:Z

    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_20
    iget p1, p0, Lh7f;->c:I

    sub-int/2addr p1, v2

    iput p1, p0, Lh7f;->c:I

    if-nez p1, :cond_2d

    iget p1, p0, Lh7f;->b:I

    if-nez p1, :cond_2d

    iput-object v1, p0, Lh7f;->a:Ljava/util/ArrayList;

    :cond_2d
    return v2

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final clear()V
    .registers 4

    const/4 v0, 0x0

    iput v0, p0, Lh7f;->c:I

    iget v0, p0, Lh7f;->b:I

    const/4 v1, 0x0

    if-nez v0, :cond_b

    iput-object v1, p0, Lh7f;->a:Ljava/util/ArrayList;

    return-void

    :cond_b
    iget-object v0, p0, Lh7f;->a:Ljava/util/ArrayList;

    if-eqz v0, :cond_15

    const/4 v2, 0x1

    iput-boolean v2, p0, Lh7f;->d:Z

    invoke-static {v0, v1}, Ljava/util/Collections;->fill(Ljava/util/List;Ljava/lang/Object;)V

    :cond_15
    return-void
.end method

.method public final isEmpty()Z
    .registers 1

    iget p0, p0, Lh7f;->c:I

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 2

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    return-object v0
.end method
