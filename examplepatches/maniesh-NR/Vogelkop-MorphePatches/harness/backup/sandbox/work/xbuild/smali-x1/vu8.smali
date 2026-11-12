.class public final Lvu8;
.super Lba2;
.source "SourceFile"

# interfaces
.implements Lx82;


# instance fields
.field public final b:Low8;

.field public final c:Ld53;

.field public final d:Ljava/lang/Object;

.field public final e:Lnw8;

.field public f:Z

.field public g:Z

.field public h:Luu8;


# direct methods
.method public constructor <init>(Low8;Ld53;Ljava/lang/Object;Lnw8;)V
    .registers 6

    const-class v0, Luu8;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lvu8;->b:Low8;

    iput-object p2, p0, Lvu8;->c:Ld53;

    iput-object p3, p0, Lvu8;->d:Ljava/lang/Object;

    iput-object p4, p0, Lvu8;->e:Lnw8;

    iget-object p3, p2, Ld53;->b:Lh7f;

    invoke-virtual {p3, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p2, p2, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1d

    invoke-virtual {p0}, Lvu8;->l()V

    :cond_1d
    new-instance p2, La83;

    const/4 p3, 0x7

    invoke-direct {p2, p0, p3}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 5

    if-nez p1, :cond_28

    iget-boolean p1, p0, Lvu8;->f:Z

    if-eqz p1, :cond_28

    iget-boolean p1, p0, Lvu8;->g:Z

    if-nez p1, :cond_14

    iget-object p1, p0, Lvu8;->b:Low8;

    const-class v0, Lj82;

    invoke-virtual {p1, v0}, Lha2;->K(Ljava/lang/Class;)Z

    move-result p1

    if-nez p1, :cond_28

    :cond_14
    new-instance p1, Luu8;

    iget-object v0, p0, Lvu8;->c:Ld53;

    iget-object v1, p0, Lvu8;->d:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lvu8;->e:Lnw8;

    invoke-direct {p1, v1, v0}, Luu8;-><init>(Lnw8;Z)V

    iput-object p1, p0, Lvu8;->h:Luu8;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_28
    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    const p0, 0x7f0d01a1

    const/4 v0, 0x0

    if-ne p2, p0, :cond_10

    new-instance p0, Ltu8;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Ltu8;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_10
    const p0, 0x7f0d01aa

    if-ne p2, p0, :cond_1f

    new-instance p0, Lsu8;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final l()V
    .registers 4

    iget-object v0, p0, Lvu8;->c:Ld53;

    iget-object v1, p0, Lvu8;->d:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lvu8;->h:Luu8;

    if-eqz v1, :cond_1e

    iget-boolean v1, v1, Luu8;->d:Z

    if-eq v1, v0, :cond_1e

    new-instance v1, Luu8;

    iget-object v2, p0, Lvu8;->e:Lnw8;

    invoke-direct {v1, v2, v0}, Luu8;-><init>(Lnw8;Z)V

    iput-object v1, p0, Lvu8;->h:Luu8;

    iget-object p0, p0, Lvu8;->b:Low8;

    invoke-virtual {p0, v1, v1}, Lha2;->W(Lja2;Lja2;)V

    :cond_1e
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lvu8;->c:Ld53;

    iget-object v0, v0, Ld53;->b:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget-boolean p0, p0, Lvu8;->g:Z

    if-eqz p0, :cond_8

    const p0, 0x7f0d01a1

    return p0

    :cond_8
    const p0, 0x7f0d01aa

    return p0
.end method

.method public final t()V
    .registers 6

    iget-boolean v0, p0, Lvu8;->f:Z

    iget-object v1, p0, Lvu8;->b:Low8;

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Lvu8;->g:Z

    if-nez v0, :cond_15

    const-class v0, Lj82;

    invoke-virtual {v1, v0}, Lha2;->K(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_15

    :cond_13
    move v0, v2

    goto :goto_16

    :cond_15
    const/4 v0, 0x1

    :goto_16
    iget-object v3, p0, Lvu8;->h:Luu8;

    if-nez v3, :cond_3c

    if-eqz v0, :cond_44

    new-instance v0, Luu8;

    iget-object v3, p0, Lvu8;->c:Ld53;

    iget-object v4, p0, Lvu8;->d:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lvu8;->e:Lnw8;

    invoke-direct {v0, v4, v3}, Luu8;-><init>(Lnw8;Z)V

    iput-object v0, p0, Lvu8;->h:Luu8;

    const-class v0, Lsv8;

    invoke-virtual {v1, v0}, Lha2;->L(Ljava/lang/Class;)I

    move-result v0

    if-ltz v0, :cond_36

    move v2, v0

    :cond_36
    iget-object p0, p0, Lvu8;->h:Luu8;

    invoke-virtual {v1, v2, p0}, Lha2;->H(ILja2;)V

    return-void

    :cond_3c
    if-nez v0, :cond_44

    invoke-virtual {v1, v3}, Lha2;->V(Lja2;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lvu8;->h:Luu8;

    :cond_44
    return-void
.end method
