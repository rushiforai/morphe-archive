.class public final Lm8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public a:Landroid/content/Context;

.field public final b:Lq6l;

.field public c:Lk6l;

.field public final d:Lx5f;

.field public final e:Lx5f;


# direct methods
.method public constructor <init>(Lx5f;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lq6l;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lq6l;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lm8l;->b:Lq6l;

    iput-object p1, p0, Lm8l;->d:Lx5f;

    iput-object p2, p0, Lm8l;->e:Lx5f;

    return-void
.end method


# virtual methods
.method public final K(Lbde;)V
    .registers 3

    iget v0, p1, Lbde;->a:I

    if-gtz v0, :cond_8

    iget v0, p1, Lbde;->b:I

    if-lez v0, :cond_b

    :cond_8
    invoke-virtual {p0}, Lm8l;->a()V

    :cond_b
    iget v0, p1, Lbde;->a:I

    if-gtz v0, :cond_18

    iget v0, p1, Lbde;->b:I

    if-gtz v0, :cond_18

    iget p1, p1, Lbde;->c:I

    if-gtz p1, :cond_18

    return-void

    :cond_18
    invoke-virtual {p0}, Lm8l;->b()V

    return-void
.end method

.method public final a()V
    .registers 7

    iget-object v0, p0, Lm8l;->c:Lk6l;

    if-eqz v0, :cond_48

    iget-object v0, v0, Lk6l;->d:Lghf;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Lm8l;->c:Lk6l;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v1}, Lk6l;->s(Lp6l;)I

    move-result v0

    iget-object v1, p0, Lm8l;->c:Lk6l;

    sget-object v2, Lp6l;->b:Lp6l;

    invoke-virtual {v1, v2}, Lk6l;->s(Lp6l;)I

    move-result v1

    iget-object p0, p0, Lm8l;->d:Lx5f;

    iget-boolean v2, p0, Lx5f;->h:Z

    if-eqz v2, :cond_48

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v2, v4, Lck0;->k:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbs0;

    iget-object v4, v2, Lbs0;->a:Lc66;

    const/4 v5, 0x1

    invoke-virtual {v4, v5, v5, v1}, Ljf0;->o(III)V

    iget-object v1, v2, Lbs0;->a:Lc66;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v5, v0}, Ljf0;->o(III)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_48
    return-void
.end method

.method public final b()V
    .registers 8

    iget-object v0, p0, Lm8l;->c:Lk6l;

    if-eqz v0, :cond_8a

    iget-object v0, v0, Lk6l;->d:Lghf;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8a

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p0, Lm8l;->c:Lk6l;

    iget-object v2, v2, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_26
    :goto_26
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_59

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    move-object v4, v3

    check-cast v4, Ld7l;

    iget-object v4, v4, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v4

    iget v4, v4, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz v4, :cond_26

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    if-eqz v3, :cond_51

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_51
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_59
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    iget-object p0, p0, Lm8l;->d:Lx5f;

    iget-boolean v2, p0, Lx5f;->h:Z

    if-eqz v2, :cond_8a

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v2, v4, Lck0;->k:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbs0;

    iget-object v4, v2, Lbs0;->a:Lc66;

    const/4 v5, 0x4

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6, v0}, Ljf0;->o(III)V

    iget-object v0, v2, Lbs0;->a:Lc66;

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v6, v1}, Ljf0;->o(III)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_8a
    return-void
.end method

.method public final d(I)V
    .registers 2

    invoke-virtual {p0}, Lm8l;->a()V

    return-void
.end method
