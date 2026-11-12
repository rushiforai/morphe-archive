.class public final Lvte;
.super Loh4;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lwte;


# direct methods
.method public constructor <init>(Lwte;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvte;->b:Lwte;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-object v0, p0, Lvte;->b:Lwte;

    const/4 v1, 0x0

    iput-object v1, v0, Lwte;->r:Ll0c;

    iput-object v1, v0, Lwte;->p:Lbre;

    invoke-virtual {p0}, Lvte;->e()V

    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lnre;

    if-eqz p1, :cond_7

    iget-object v0, p1, Lnre;->c:Ll0c;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p1, Lnre;->c:Ll0c;

    iget-object p0, p0, Lvte;->b:Lwte;

    iput-object v0, p0, Lwte;->r:Ll0c;

    iget-object v0, p1, Lnre;->g:Lbre;

    iput-object v0, p0, Lwte;->p:Lbre;

    iget-object v0, p1, Lnre;->e:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_3a

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_27
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyqe;

    invoke-virtual {v1}, Lyqe;->a()Z

    move-result v1

    if-eqz v1, :cond_27

    const/4 v2, 0x1

    :cond_3a
    iput-boolean v2, p0, Lwte;->o:Z

    iget-object v0, p0, Lwte;->b:Lyqa;

    new-instance v1, Lx77;

    invoke-direct {v1, p1}, Lx77;-><init>(Lnre;)V

    iput-object v1, v0, Lyqa;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Lwte;->b()V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object v0, p0, Lvte;->b:Lwte;

    iget-object v0, v0, Lwte;->c:Lfqe;

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    invoke-virtual {v0, p0}, Luqe;->g(Lq8j;)V

    return-void
.end method
