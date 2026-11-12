.class public final Lbz3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Z

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# virtual methods
.method public final a(I)V
    .registers 4

    iget v0, p0, Lbz3;->c:I

    sub-int/2addr v0, p1

    iget-boolean p1, p0, Lbz3;->d:Z

    const/4 v1, 0x0

    if-nez p1, :cond_c

    if-ltz v0, :cond_c

    move p1, v1

    goto :goto_d

    :cond_c
    const/4 p1, 0x1

    :goto_d
    iput-boolean p1, p0, Lbz3;->d:Z

    if-gez v0, :cond_12

    move v0, v1

    :cond_12
    iput v0, p0, Lbz3;->c:I

    return-void
.end method

.method public final b(Le6k;)Z
    .registers 7

    iget-object v0, p0, Lbz3;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_21

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v2

    :cond_10
    if-ge v3, v1, :cond_21

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, La6k;

    iget-object v4, v4, La6k;->a:Lk6k;

    iget-object v4, v4, Lk6k;->a:Le6k;

    if-ne v4, p1, :cond_10

    goto :goto_40

    :cond_21
    iget-object p0, p0, Lbz3;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_42

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v2

    :cond_30
    if-ge v1, v0, :cond_42

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, La6k;

    iget-object v3, v3, La6k;->a:Lk6k;

    iget-object v3, v3, Lk6k;->a:Le6k;

    if-ne v3, p1, :cond_30

    :goto_40
    const/4 p0, 0x1

    return p0

    :cond_42
    return v2
.end method

.method public final c()Z
    .registers 3

    iget v0, p0, Lbz3;->a:I

    if-nez v0, :cond_14

    iget-object v0, p0, Lbz3;->e:Ljava/lang/Object;

    check-cast v0, Lbvl;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast v0, Ldtl;

    iget v1, v0, Ldtl;->a:I

    iget v0, v0, Ldtl;->b:I

    if-gt v1, v0, :cond_28

    :cond_14
    iget v0, p0, Lbz3;->c:I

    if-nez v0, :cond_2a

    iget-object v0, p0, Lbz3;->f:Ljava/lang/Object;

    check-cast v0, Lr22;

    if-eqz v0, :cond_2a

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget v0, p0, Ldtl;->e:I

    iget p0, p0, Ldtl;->d:I

    if-le v0, p0, :cond_2a

    :cond_28
    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final d(Z)V
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    move v1, v0

    goto :goto_1a

    :cond_5
    iget-object v1, p0, Lbz3;->e:Ljava/lang/Object;

    check-cast v1, Lbvl;

    if-eqz v1, :cond_18

    invoke-interface {v1}, Lbvl;->getState()Lpde;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lavl;

    iget v1, v1, Lavl;->d:I

    goto :goto_19

    :cond_18
    move v1, v0

    :goto_19
    neg-int v1, v1

    :goto_1a
    if-eqz p1, :cond_23

    iget-object v2, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast v2, Ldtl;

    iget v2, v2, Ldtl;->a:I

    goto :goto_24

    :cond_23
    move v2, v0

    :goto_24
    invoke-virtual {p0, v1, v2}, Lbz3;->e(II)V

    if-nez p1, :cond_2f

    iget-object p1, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p1, Ldtl;

    iget v0, p1, Ldtl;->e:I

    :cond_2f
    iput v0, p0, Lbz3;->c:I

    invoke-virtual {p0}, Lbz3;->f()V

    return-void
.end method

.method public final e(II)V
    .registers 4

    iput p1, p0, Lbz3;->a:I

    iput p2, p0, Lbz3;->b:I

    iget-object p1, p0, Lbz3;->e:Ljava/lang/Object;

    check-cast p1, Lbvl;

    if-nez p1, :cond_b

    return-void

    :cond_b
    iget-object p1, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p1, Ldtl;

    iget p1, p1, Ldtl;->a:I

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-boolean v0, p0, Lbz3;->d:Z

    if-eqz v0, :cond_20

    iget v0, p0, Lbz3;->a:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    :cond_20
    iget-boolean v0, p0, Lbz3;->d:Z

    if-eqz v0, :cond_2a

    iget v0, p0, Lbz3;->b:I

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :cond_2a
    iget-object p0, p0, Lbz3;->e:Ljava/lang/Object;

    check-cast p0, Lbvl;

    new-instance v0, Lzul;

    invoke-direct {v0, p2, p1}, Lzul;-><init>(II)V

    invoke-interface {p0, v0}, Lbvl;->D(Lzul;)V

    return-void
.end method

.method public final f()V
    .registers 4

    iget-object v0, p0, Lbz3;->f:Ljava/lang/Object;

    check-cast v0, Lr22;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-boolean v1, p0, Lbz3;->d:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    iget p0, p0, Lbz3;->c:I

    invoke-static {p0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_12
    invoke-virtual {v0, v2}, Lr22;->M(I)V

    return-void
.end method
