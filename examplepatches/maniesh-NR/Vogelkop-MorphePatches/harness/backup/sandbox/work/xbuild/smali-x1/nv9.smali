.class public abstract Lnv9;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final b:Lr16;

.field public final c:Low8;

.field public final d:Ltcc;

.field public final e:Lob;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Lyv8;

.field public final k:Lnrl;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lr16;Low8;Ltcc;Lqp5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    invoke-direct {p0, p1}, Lba2;-><init>(Ljava/lang/Class;)V

    new-instance p1, Lob;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lnv9;->e:Lob;

    iput-object p2, p0, Lnv9;->b:Lr16;

    iput-object p3, p0, Lnv9;->c:Low8;

    iput-object p4, p0, Lnv9;->d:Ltcc;

    invoke-virtual {p4, p1}, Ltcc;->a(Lmdc;)V

    new-instance p1, Lnrl;

    invoke-direct {p1, p5}, Lnrl;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnv9;->k:Lnrl;

    iput-object p6, p0, Lnv9;->l:Ljava/lang/Object;

    iput-object p7, p0, Lnv9;->m:Ljava/lang/Object;

    iput-object p8, p0, Lnv9;->n:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public abstract A()V
.end method

.method public final B()V
    .registers 5

    invoke-virtual {p0}, Lnv9;->A()V

    iget-boolean v0, p0, Lnv9;->i:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnv9;->i:Z

    iget-boolean v0, p0, Lnv9;->f:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lnv9;->c:Low8;

    iget-object v1, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v1

    iget-object v2, p0, Lnv9;->b:Lr16;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lba2;->a:Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-static {v2, v3, v1}, Lr16;->m(Ljava/lang/Class;ILjava/util/List;)I

    move-result v1

    if-gez v1, :cond_25

    :cond_24
    return-void

    :cond_25
    iget-object v2, p0, Lnv9;->j:Lyv8;

    if-nez v2, :cond_2f

    invoke-virtual {p0}, Lnv9;->t()Lyv8;

    move-result-object v2

    iput-object v2, p0, Lnv9;->j:Lyv8;

    :cond_2f
    invoke-virtual {v0, v1, v2}, Lha2;->H(ILja2;)V

    return-void
.end method

.method public b(Lsjm;)V
    .registers 2

    invoke-virtual {p1}, Lsjm;->a()Z

    move-result p1

    if-eqz p1, :cond_16

    iget-boolean p1, p0, Lnv9;->h:Z

    if-nez p1, :cond_16

    const/4 p1, 0x1

    iput-boolean p1, p0, Lnv9;->h:Z

    invoke-virtual {p0}, Lnv9;->y()Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lnv9;->B()V

    :cond_16
    return-void
.end method

.method public final d(ILjava/util/ArrayList;)V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnv9;->f:Z

    iget-object v0, p0, Lnv9;->b:Lr16;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lba2;->a:Ljava/lang/Class;

    invoke-static {v0, p1, p2}, Lr16;->m(Ljava/lang/Class;ILjava/util/List;)I

    move-result p1

    if-ltz p1, :cond_21

    iget-boolean v0, p0, Lnv9;->i:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lnv9;->j:Lyv8;

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lnv9;->t()Lyv8;

    move-result-object v0

    iput-object v0, p0, Lnv9;->j:Lyv8;

    :cond_1e
    invoke-virtual {p2, p1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_21
    return-void
.end method

.method public onDestroy()V
    .registers 2

    iget-object v0, p0, Lnv9;->d:Ltcc;

    iget-object p0, p0, Lnv9;->e:Lob;

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public t()Lyv8;
    .registers 2

    new-instance p0, Law8;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public abstract u()Z
.end method

.method public final w()V
    .registers 2

    iget-boolean v0, p0, Lnv9;->i:Z

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnv9;->i:Z

    iget-object v0, p0, Lnv9;->j:Lyv8;

    if-nez v0, :cond_c

    :cond_b
    return-void

    :cond_c
    if-nez v0, :cond_14

    invoke-virtual {p0}, Lnv9;->t()Lyv8;

    move-result-object v0

    iput-object v0, p0, Lnv9;->j:Lyv8;

    :cond_14
    iget-object p0, p0, Lnv9;->c:Low8;

    invoke-virtual {p0, v0}, Lha2;->V(Lja2;)V

    return-void
.end method

.method public y()Z
    .registers 3

    iget-object v0, p0, Lnv9;->c:Low8;

    const-class v1, Lyv8;

    invoke-virtual {v0, v1}, Lha2;->K(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-boolean v0, p0, Lnv9;->g:Z

    if-eqz v0, :cond_14

    iget-boolean p0, p0, Lnv9;->h:Z

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public abstract z()V
.end method
