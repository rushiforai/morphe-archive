.class public final Ld39;
.super Lalo;
.source "SourceFile"


# instance fields
.field public final l:Lvu2;


# direct methods
.method public constructor <init>(Lvu2;)V
    .registers 3

    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lalo;-><init>(B)V

    iput-object p1, p0, Ld39;->l:Lvu2;

    return-void
.end method


# virtual methods
.method public final a0(Ljava/util/List;Lj2g;)Ljava/util/List;
    .registers 12

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b
    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_28

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lf39;

    iget-object v3, v1, Lf39;->b:Lnf2;

    if-eqz v3, :cond_22

    const/16 v3, 0x1f

    invoke-static {v1, v2, v3}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object v2

    :cond_22
    if-eqz v2, :cond_b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_28
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2f

    return-object v2

    :cond_2f
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    move v4, v3

    :goto_3a
    if-ge v4, v1, :cond_5b

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Lvz8;

    iget-object v6, v6, Lvz8;->c:Lnf2;

    invoke-virtual {p1, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_55

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_55
    check-cast v7, Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_5b
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    sget-object v1, Lnf2;->b:Lnf2;

    invoke-virtual {p1, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    const/16 v4, 0xe

    const-string v5, "Too many fields in domain "

    iget-object p0, p0, Ld39;->l:Lvu2;

    const/16 v6, 0x14

    if-eqz v1, :cond_95

    iget-object v7, p2, Lj2g;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-gt v8, v6, :cond_8c

    check-cast v1, Ljava/util/Collection;

    new-array v7, v3, [Lvz8;

    invoke-interface {v1, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lvz8;

    new-instance v7, Lrw;

    invoke-direct {v7, v1, p2}, Lrw;-><init>([Lvz8;Lj2g;)V

    invoke-virtual {v0, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_95

    :cond_8c
    invoke-static {v5, v7}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lvu2;->a:Lx5f;

    invoke-virtual {v7, v4, v1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_95
    :goto_95
    sget-object v1, Lnf2;->c:Lnf2;

    invoke-virtual {p1, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_a1

    sget-object v1, Ll08;->a:Ll08;

    :cond_a1
    check-cast v1, Ljava/util/Collection;

    sget-object v7, Lnf2;->d:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_af

    sget-object v7, Ll08;->a:Ll08;

    :cond_af
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_bc

    move-object v1, v2

    :cond_bc
    if-eqz v1, :cond_e0

    iget-object v7, p2, Lj2g;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-gt v8, v6, :cond_d7

    new-array v7, v3, [Lvz8;

    invoke-interface {v1, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lvz8;

    new-instance v7, Lsp5;

    invoke-direct {v7, v1, p2}, Lsp5;-><init>([Lvz8;Lj2g;)V

    invoke-virtual {v0, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_e0

    :cond_d7
    invoke-static {v5, v7}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lvu2;->a:Lx5f;

    invoke-virtual {v7, v4, v1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_e0
    :goto_e0
    sget-object v1, Lnf2;->k:Lnf2;

    invoke-virtual {p1, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_ec

    sget-object v1, Ll08;->a:Ll08;

    :cond_ec
    check-cast v1, Ljava/util/Collection;

    sget-object v7, Lnf2;->j:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_fa

    sget-object v7, Ll08;->a:Ll08;

    :cond_fa
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v7, Lnf2;->f:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_10c

    sget-object v7, Ll08;->a:Ll08;

    :cond_10c
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v7, Lnf2;->n:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_11e

    sget-object v7, Ll08;->a:Ll08;

    :cond_11e
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_12b

    move-object v1, v2

    :cond_12b
    if-eqz v1, :cond_14f

    iget-object v7, p2, Lj2g;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-gt v8, v6, :cond_146

    new-array v7, v3, [Lvz8;

    invoke-interface {v1, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lvz8;

    new-instance v7, Letf;

    invoke-direct {v7, v1, p2}, Letf;-><init>([Lvz8;Lj2g;)V

    invoke-virtual {v0, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_14f

    :cond_146
    invoke-static {v5, v7}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lvu2;->a:Lx5f;

    invoke-virtual {v7, v4, v1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_14f
    :goto_14f
    sget-object v1, Lnf2;->i:Lnf2;

    invoke-virtual {p1, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_17d

    iget-object v7, p2, Lj2g;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-gt v8, v6, :cond_174

    check-cast v1, Ljava/util/Collection;

    new-array v7, v3, [Lvz8;

    invoke-interface {v1, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lvz8;

    new-instance v7, Lm16;

    invoke-direct {v7, v1, p2}, Lm16;-><init>([Lvz8;Lj2g;)V

    invoke-virtual {v0, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_17d

    :cond_174
    invoke-static {v5, v7}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lvu2;->a:Lx5f;

    invoke-virtual {v7, v4, v1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_17d
    :goto_17d
    sget-object v1, Lnf2;->l:Lnf2;

    invoke-virtual {p1, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_189

    sget-object v1, Ll08;->a:Ll08;

    :cond_189
    check-cast v1, Ljava/util/Collection;

    sget-object v7, Lnf2;->m:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_197

    sget-object v7, Ll08;->a:Ll08;

    :cond_197
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v7, Lnf2;->h:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_1a9

    sget-object v7, Ll08;->a:Ll08;

    :cond_1a9
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v7, Lnf2;->g:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_1bb

    sget-object v7, Ll08;->a:Ll08;

    :cond_1bb
    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v7, Lnf2;->e:Lnf2;

    invoke-virtual {p1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_1cd

    sget-object p1, Ll08;->a:Ll08;

    :cond_1cd
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1da

    move-object v2, p1

    :cond_1da
    if-eqz v2, :cond_1fe

    iget-object p1, p2, Lj2g;->a:Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, v6, :cond_1f5

    new-array p0, v3, [Lvz8;

    invoke-interface {v2, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lvz8;

    new-instance p1, Ld16;

    invoke-direct {p1, p0, p2}, Ld16;-><init>([Lvz8;Lj2g;)V

    invoke-virtual {v0, p1}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_1fe

    :cond_1f5
    invoke-static {v5, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lvu2;->a:Lx5f;

    invoke-virtual {p0, v4, p1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_1fe
    :goto_1fe
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0
.end method
