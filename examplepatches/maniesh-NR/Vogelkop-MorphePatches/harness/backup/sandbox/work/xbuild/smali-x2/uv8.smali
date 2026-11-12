.class public final Luv8;
.super Lba2;
.source "SourceFile"

# interfaces
.implements Lx82;


# instance fields
.field public final b:Ld53;

.field public final c:Ljava/lang/Object;

.field public final d:Low8;

.field public e:Z


# direct methods
.method public constructor <init>(Ld53;Ljava/lang/Object;Low8;)V
    .registers 5

    const-class v0, Lsv8;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Luv8;->b:Ld53;

    iput-object p2, p0, Luv8;->c:Ljava/lang/Object;

    iput-object p3, p0, Luv8;->d:Low8;

    iget-object p2, p1, Ld53;->b:Lh7f;

    invoke-virtual {p2, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p1, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1b

    invoke-virtual {p0}, Luv8;->l()V

    :cond_1b
    return-void
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    if-nez p1, :cond_e

    new-instance p1, Lsv8;

    invoke-virtual {p0}, Luv8;->t()I

    move-result p0

    invoke-direct {p1, p0}, Lsv8;-><init>(I)V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e
    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    const p0, 0x7f0d0364

    if-ne p2, p0, :cond_10

    new-instance p0, Ltv8;

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Ltv8;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_10
    const/4 p0, 0x0

    return-object p0
.end method

.method public final l()V
    .registers 3

    iget-boolean v0, p0, Luv8;->e:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Luv8;->b:Ld53;

    iget-object v1, p0, Luv8;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    iput-boolean v0, p0, Luv8;->e:Z

    :cond_11
    new-instance v0, Lsv8;

    invoke-virtual {p0}, Luv8;->t()I

    move-result v1

    invoke-direct {v0, v1}, Lsv8;-><init>(I)V

    iget-object p0, p0, Luv8;->d:Low8;

    invoke-virtual {p0, v0, v0}, Lha2;->W(Lja2;Lja2;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Luv8;->b:Ld53;

    iget-object v0, v0, Ld53;->b:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    const p0, 0x7f0d0364

    return p0
.end method

.method public final t()I
    .registers 3

    iget-boolean v0, p0, Luv8;->e:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x3

    return p0

    :cond_6
    iget-object v0, p0, Luv8;->b:Ld53;

    iget-object v1, p0, Luv8;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Luv8;->d:Low8;

    const-class v0, Lj82;

    invoke-virtual {p0, v0}, Lha2;->K(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x2

    return p0
.end method
