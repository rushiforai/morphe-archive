.class public final Lejm;
.super Lx1p;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/lang/Iterable;
.implements Lw6f;
.implements Lptb;


# instance fields
.field public final p:Lkotlin/jvm/functions/Function1;

.field public final q:Ljava/util/ArrayDeque;

.field public final r:Ljava/util/LinkedHashMap;

.field public final s:Landroid/os/Handler;

.field public final t:Li7f;

.field public u:Levl;


# direct methods
.method public constructor <init>(Ltcc;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lejm;->p:Lkotlin/jvm/functions/Function1;

    new-instance p2, Ljava/util/ArrayDeque;

    invoke-direct {p2}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p2, p0, Lejm;->q:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lejm;->r:Ljava/util/LinkedHashMap;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lejm;->s:Landroid/os/Handler;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lejm;->t:Li7f;

    new-instance v0, Levl;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Levl;-><init>(Z)V

    iput-object v0, p0, Lejm;->u:Levl;

    new-instance v0, Loje;

    sget-object v2, Lgjm;->g:Ljava/lang/String;

    const/4 v3, 0x6

    invoke-direct {v0, v3, v2, v1}, Loje;-><init>(ILjava/lang/String;Z)V

    new-instance v2, Lfjm;

    new-instance v3, Ldjm;

    invoke-direct {v3, p1, v0}, Ldjm;-><init>(Ltcc;Loje;)V

    invoke-direct {v2, v0, v3}, Lfjm;-><init>(Loje;Ldjm;)V

    invoke-virtual {p2}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfjm;

    if-eqz p1, :cond_4e

    iget-object p1, p1, Lfjm;->b:Ldjm;

    iput-boolean v1, p1, Ldjm;->c:Z

    invoke-virtual {p1}, Ldjm;->a()V

    :cond_4e
    invoke-virtual {p2, v2}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lejm;->run()V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lnim;

    iget-object v0, p0, Lejm;->t:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lejm;->u:Levl;

    iget-object p1, p1, Lnim;->a:Lqim;

    iget-boolean p0, p0, Levl;->a:Z

    iput-boolean p0, p1, Lqim;->q:Z

    if-eqz p0, :cond_19

    invoke-virtual {p1}, Lqim;->d()Z

    move-result p0

    invoke-virtual {p1, p0}, Lqim;->e(Z)V

    return-void

    :cond_19
    invoke-virtual {p1}, Lqim;->a()V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lnim;

    iget-object p0, p0, Lejm;->t:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final K(Landroidx/fragment/app/Fragment;)V
    .registers 4

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "unknown-"

    invoke-static {v0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_14
    iget-object p1, p0, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfjm;

    iget-object v1, v1, Lfjm;->a:Loje;

    iget-object v1, v1, Loje;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    :cond_33
    iget-object p1, p0, Lejm;->s:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final N(Landroidx/fragment/app/Fragment;)V
    .registers 7

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isInBackStack()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown-"

    invoke-static {v1, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1b
    iget-object v1, p0, Lejm;->r:Ljava/util/LinkedHashMap;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loje;

    const/4 v2, 0x0

    if-nez v1, :cond_3f

    iget-object v1, p0, Lejm;->p:Lkotlin/jvm/functions/Function1;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v1, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcjm;

    if-eqz v1, :cond_37

    iget-boolean v1, v1, Lcjm;->b:Z

    goto :goto_38

    :cond_37
    move v1, v2

    :goto_38
    new-instance v3, Loje;

    const/4 v4, 0x2

    invoke-direct {v3, v4, v0, v1}, Loje;-><init>(ILjava/lang/String;Z)V

    move-object v1, v3

    :cond_3f
    new-instance v0, Lfjm;

    new-instance v3, Ldjm;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-direct {v3, p1, v1}, Ldjm;-><init>(Ltcc;Loje;)V

    invoke-direct {v0, v1, v3}, Lfjm;-><init>(Loje;Ldjm;)V

    iget-object p1, p0, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfjm;

    if-eqz v1, :cond_5e

    iget-object v1, v1, Lfjm;->b:Ldjm;

    iput-boolean v2, v1, Ldjm;->c:Z

    invoke-virtual {v1}, Ldjm;->a()V

    :cond_5e
    invoke-virtual {p1, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    iget-object p1, p0, Lejm;->s:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final Z()Levl;
    .registers 3

    iget-object v0, p0, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfjm;

    new-instance v1, Levl;

    iget-object v0, v0, Lfjm;->a:Loje;

    iget-boolean v0, v0, Loje;->c:Z

    if-nez v0, :cond_3c

    iget-object p0, p0, Lejm;->r:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_25

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3a

    :cond_25
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_29
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loje;

    iget-boolean v0, v0, Loje;->c:Z

    if-eqz v0, :cond_29

    goto :goto_3c

    :cond_3a
    const/4 p0, 0x0

    goto :goto_3d

    :cond_3c
    :goto_3c
    const/4 p0, 0x1

    :goto_3d
    invoke-direct {v1, p0}, Levl;-><init>(Z)V

    return-object v1
.end method

.method public final a0(Levl;)V
    .registers 4

    iget-object v0, p0, Lejm;->u:Levl;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    iput-object p1, p0, Lejm;->u:Levl;

    iget-object p0, p0, Lejm;->t:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnim;

    iget-object v0, v0, Lnim;->a:Lqim;

    iget-boolean v1, p1, Levl;->a:Z

    iput-boolean v1, v0, Lqim;->q:Z

    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Lqim;->d()Z

    move-result v1

    invoke-virtual {v0, v1}, Lqim;->e(Z)V

    goto :goto_10

    :cond_2c
    invoke-virtual {v0}, Lqim;->a()V

    goto :goto_10

    :cond_30
    return-void
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 5

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lejm;->r:Ljava/util/LinkedHashMap;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v2

    iget-object p0, p0, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    add-int/2addr v3, v2

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfjm;

    iget-object v1, v1, Lfjm;->a:Loje;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_2f
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public final run()V
    .registers 3

    iget-object v0, p0, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfjm;

    iget-object v0, v0, Lfjm;->b:Ldjm;

    const/4 v1, 0x1

    iput-boolean v1, v0, Ldjm;->c:Z

    invoke-virtual {v0}, Ldjm;->a()V

    invoke-virtual {p0}, Lejm;->Z()Levl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lejm;->a0(Levl;)V

    return-void
.end method
