.class public final Ltzi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Le5d;

.field public final b:Lszi;

.field public final c:Lh7f;

.field public final d:Lh7f;

.field public e:Lxph;

.field public f:I

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le5d;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Le5d;-><init>(B)V

    iput-object v0, p0, Ltzi;->a:Le5d;

    new-instance v1, Lszi;

    invoke-direct {v1, p0}, Lszi;-><init>(Ltzi;)V

    iput-object v1, p0, Ltzi;->b:Lszi;

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Ltzi;->c:Lh7f;

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Ltzi;->d:Lh7f;

    new-instance v1, Lrzi;

    invoke-direct {v1, p0}, Lrzi;-><init>(Ltzi;)V

    iget-object p0, v0, Le5d;->b:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-virtual {p0, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object p0, p0, Ltzi;->d:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyyi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lmni;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_6

    :cond_1f
    return-void
.end method

.method public final b(Lxph;)V
    .registers 4

    iget-object v0, p0, Ltzi;->e:Lxph;

    iget-object v1, p0, Ltzi;->b:Lszi;

    if-eqz v0, :cond_f

    iget-object v0, v0, Lxph;->b:La83;

    iget-object v0, v0, La83;->b:Ljava/lang/Object;

    check-cast v0, Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    :cond_f
    iput-object p1, p0, Ltzi;->e:Lxph;

    if-eqz p1, :cond_1f

    iget-object p1, p1, Lxph;->b:La83;

    iget-object p1, p1, La83;->b:Ljava/lang/Object;

    check-cast p1, Lh7f;

    invoke-virtual {p1, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ltzi;->e()V

    :cond_1f
    return-void
.end method

.method public final c()V
    .registers 4

    iget-boolean v0, p0, Ltzi;->g:Z

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltzi;->g:Z

    iget-object v0, p0, Ltzi;->c:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqzi;

    iget-boolean v2, p0, Ltzi;->g:Z

    invoke-interface {v1, v2}, Lqzi;->W(Z)V

    goto :goto_d

    :cond_1f
    return-void
.end method

.method public final d()V
    .registers 4

    iget-boolean v0, p0, Ltzi;->g:Z

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    iput-boolean v0, p0, Ltzi;->g:Z

    iget-object v0, p0, Ltzi;->a:Le5d;

    invoke-virtual {v0}, Le5d;->clear()V

    iget-object v0, p0, Ltzi;->c:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_12
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqzi;

    iget-boolean v2, p0, Ltzi;->g:Z

    invoke-interface {v1, v2}, Lqzi;->W(Z)V

    goto :goto_12

    :cond_24
    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Ltzi;->e:Lxph;

    iget-object v0, v0, Lxph;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v0, :cond_2a

    iget-object v3, p0, Ltzi;->e:Lxph;

    invoke-virtual {v3, v2}, Lxph;->a(I)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object v3, p0, Ltzi;->e:Lxph;

    iget-object v3, v3, Lxph;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_2a
    iget-object v0, p0, Ltzi;->a:Le5d;

    iget-object v2, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->retainAll(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_43

    iget-object v0, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Ltzi;->d()V

    :cond_43
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v2, p0, Ltzi;->f:I

    if-eq v0, v2, :cond_54

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Ltzi;->f:I

    invoke-virtual {p0}, Ltzi;->a()V

    :cond_54
    return-void
.end method
