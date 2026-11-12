.class public final Lml6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz2;


# instance fields
.field public a:Ljava/util/Set;

.field public b:Lz8b;

.field public c:Ljava/util/Set;

.field public d:Z

.field public final e:Lwg5;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lv08;->a:Lv08;

    iput-object v0, p0, Lml6;->a:Ljava/util/Set;

    iput-object v0, p0, Lml6;->c:Ljava/util/Set;

    new-instance v0, Lwg5;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lwg5;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lml6;->e:Lwg5;

    return-void
.end method


# virtual methods
.method public final a(Lgz2;)V
    .registers 4

    iget-object v0, p0, Lml6;->a:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    iget-object v0, p0, Lml6;->a:Ljava/util/Set;

    invoke-static {v0, p1}, Lb5j;->f(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iput-object v0, p0, Lml6;->a:Ljava/util/Set;

    iget-object v0, p0, Lml6;->e:Lwg5;

    iget-object v1, p1, Lgz2;->b:Ljava/util/Set;

    invoke-static {v1, v0}, Lb5j;->f(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iput-object v0, p1, Lgz2;->b:Ljava/util/Set;

    invoke-virtual {p0}, Lml6;->f()V

    return-void

    :cond_1e
    const-string p0, "Callback is already registered"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Lgz2;)Z
    .registers 2

    iget-object p0, p0, Lml6;->a:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final c(Lgz2;)V
    .registers 5

    iget-object v0, p0, Lml6;->a:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lml6;->a:Ljava/util/Set;

    invoke-static {v0, p1}, Lb5j;->c(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iput-object v0, p0, Lml6;->a:Ljava/util/Set;

    iget-object v0, p0, Lml6;->e:Lwg5;

    iget-object v1, p1, Lgz2;->b:Ljava/util/Set;

    invoke-static {v1, v0}, Lb5j;->c(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iput-object v0, p1, Lgz2;->b:Ljava/util/Set;

    iget-object v0, p0, Lml6;->b:Lz8b;

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    iget-object v2, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v2, Lgz2;

    goto :goto_25

    :cond_24
    move-object v2, v1

    :goto_25
    if-ne p1, v2, :cond_32

    if-eqz v0, :cond_2b

    iput-object v1, v0, Lz8b;->b:Ljava/lang/Object;

    :cond_2b
    iget-object p1, p1, Lgz2;->f:Lq2;

    if-eqz p1, :cond_32

    invoke-virtual {p1}, Lq2;->invoke()Ljava/lang/Object;

    :cond_32
    invoke-virtual {p0}, Lml6;->f()V

    return-void

    :cond_36
    const-string p0, "Callback is not registered"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lml6;->b:Lz8b;

    if-eqz v0, :cond_a

    iget-object v0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lgz2;

    if-nez v0, :cond_12

    :cond_a
    iget-object v0, p0, Lml6;->a:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lxvg;->o(Ljava/lang/Iterable;)Lgz2;

    move-result-object v0

    :cond_12
    const/4 v1, 0x0

    iput-object v1, p0, Lml6;->b:Lz8b;

    if-eqz v0, :cond_1c

    iget-object p0, v0, Lgz2;->g:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_1c
    return-void
.end method

.method public final e()Z
    .registers 4

    iget-object p0, p0, Lml6;->a:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_34

    :cond_12
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgz2;

    iget-object v0, v0, Lgz2;->c:Lfz2;

    sget-object v2, Lgz2;->h:[Lxtb;

    aget-object v2, v2, v1

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_34
    return v1
.end method

.method public final f()V
    .registers 4

    invoke-virtual {p0}, Lml6;->e()Z

    move-result v0

    iget-boolean v1, p0, Lml6;->d:Z

    if-eq v1, v0, :cond_26

    iput-boolean v0, p0, Lml6;->d:Z

    iget-object p0, p0, Lml6;->c:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    :cond_26
    return-void
.end method

.method public final g(Liz2;)V
    .registers 4

    iget-object v0, p0, Lml6;->b:Lz8b;

    if-eqz v0, :cond_2e

    iget-object v1, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v1, Lgz2;

    if-nez v1, :cond_21

    iget-object p0, p0, Lml6;->a:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lxvg;->o(Ljava/lang/Iterable;)Lgz2;

    move-result-object p0

    iput-object p0, v0, Lz8b;->b:Ljava/lang/Object;

    if-eqz p0, :cond_21

    iget-object v1, v0, Lz8b;->a:Ljava/lang/Object;

    check-cast v1, Liz2;

    iget-object p0, p0, Lgz2;->d:Lxm6;

    if-eqz p0, :cond_21

    invoke-virtual {p0, v1}, Lxm6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_21
    iget-object p0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lgz2;

    if-eqz p0, :cond_2e

    iget-object p0, p0, Lgz2;->e:Lr2;

    if-eqz p0, :cond_2e

    invoke-virtual {p0, p1}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2e
    return-void
.end method
