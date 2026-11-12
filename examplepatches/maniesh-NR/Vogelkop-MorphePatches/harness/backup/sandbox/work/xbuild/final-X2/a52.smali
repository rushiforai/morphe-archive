.class public final La52;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li52;

.field public b:Lfz1;

.field public c:Z


# direct methods
.method public constructor <init>(Li52;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La52;->a:Li52;

    return-void
.end method


# virtual methods
.method public final a(Lz42;)V
    .registers 8

    iget-object v0, p1, Lz42;->b:Lfz1;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    iget-object v0, v0, Lfz1;->a:Ljava/lang/String;

    goto :goto_9

    :cond_8
    move-object v0, v1

    :goto_9
    iget-object v2, p0, La52;->b:Lfz1;

    if-eqz v2, :cond_10

    iget-object v2, v2, Lfz1;->a:Ljava/lang/String;

    goto :goto_11

    :cond_10
    move-object v2, v1

    :goto_11
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    iput-object v1, p0, La52;->b:Lfz1;

    :cond_19
    iget-object p1, p1, Lz42;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_21
    if-ge v2, v0, :cond_39

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lh52;

    invoke-static {v3, v1}, Lh52;->a(Lh52;Z)Lh52;

    move-result-object v3

    iget-object v4, p0, La52;->a:Li52;

    iget-object v4, v4, Li52;->a:Ljava/util/LinkedHashMap;

    iget-object v5, v3, Lh52;->a:Ljava/lang/String;

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    :cond_39
    iput-boolean v1, p0, La52;->c:Z

    return-void
.end method

.method public final b()Lz42;
    .registers 5

    iget-object v0, p0, La52;->a:Li52;

    iget-object v0, v0, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lh52;

    iget-boolean v3, v3, Lh52;->e:Z

    if-eqz v3, :cond_19

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_2e
    iget-object v0, p0, La52;->b:Lfz1;

    iget-boolean p0, p0, La52;->c:Z

    new-instance v2, Lz42;

    invoke-direct {v2, v1, v0, p0}, Lz42;-><init>(Ljava/util/ArrayList;Lfz1;Z)V

    return-object v2
.end method

.method public final c(Ljava/util/List;Lez1;Z)V
    .registers 8

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljx1;

    if-eqz v0, :cond_49

    instance-of v1, v0, Lvx1;

    if-eqz v1, :cond_35

    check-cast v0, Lvx1;

    iget-object v0, v0, Lvx1;->a:Ljava/lang/String;

    iget-object v1, p0, La52;->a:Li52;

    iget-object v2, v1, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh52;

    if-eqz v0, :cond_6

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lh52;->a(Lh52;Z)Lh52;

    move-result-object v0

    iget-object v1, v1, Li52;->a:Ljava/util/LinkedHashMap;

    iget-object v2, v0, Lh52;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_35
    instance-of v1, v0, Lfz1;

    if-eqz v1, :cond_49

    check-cast v0, Lfz1;

    iget-object v1, v0, Lfz1;->a:Ljava/lang/String;

    iget-object v2, v0, Lfz1;->b:Ljava/lang/String;

    iget-object v0, v0, Lfz1;->c:Landroid/net/Uri;

    new-instance v3, Lfz1;

    invoke-direct {v3, v1, v2, v0, p2}, Lfz1;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lez1;)V

    iput-object v3, p0, La52;->b:Lfz1;

    goto :goto_6

    :cond_49
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_4d
    iput-boolean p3, p0, La52;->c:Z

    return-void
.end method
