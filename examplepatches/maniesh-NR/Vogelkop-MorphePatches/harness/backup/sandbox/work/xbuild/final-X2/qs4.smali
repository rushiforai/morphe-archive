.class public final synthetic Lqs4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfr9;


# virtual methods
.method public final k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p1

    check-cast v0, Lui3;

    move-object/from16 v1, p2

    check-cast v1, La7j;

    move-object/from16 v2, p3

    check-cast v2, Ljava/util/Set;

    move-object/from16 v3, p4

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    move-object/from16 v4, p5

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    move-object/from16 v5, p6

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v0, :cond_b9

    iget-object v7, v0, Lui3;->b:Ljava/util/Set;

    sget-object v8, Lzi3;->k:Lui3;

    if-eq v0, v8, :cond_b9

    move-object v8, v7

    check-cast v8, Ljava/lang/Iterable;

    new-instance v9, Ljava/util/LinkedHashSet;

    invoke-direct {v9}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_38
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lxj3;

    move-object v11, v7

    check-cast v11, Ljava/lang/Iterable;

    new-instance v12, Lrs4;

    invoke-direct {v12, v0, v2}, Lrs4;-><init>(Lui3;Ljava/util/Set;)V

    invoke-static {v11, v12}, Lic4;->w(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;)Ljava/util/LinkedHashSet;

    move-result-object v11

    iget-object v12, v10, Lxj3;->a:Lwj3;

    iget-object v13, v10, Lxj3;->b:Ljava/lang/String;

    iget-object v12, v12, Lwj3;->a:Lsj3;

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    const/4 v14, 0x2

    const/4 v15, 0x1

    if-eqz v12, :cond_75

    if-eq v12, v15, :cond_70

    if-eq v12, v14, :cond_6b

    const/16 p0, 0x0

    const/4 v6, 0x3

    if-eq v12, v6, :cond_77

    invoke-static {}, Lh9o;->p()V

    return-object p0

    :cond_6b
    invoke-static {v0, v10, v4}, Lc09;->j(Lui3;Lxj3;Z)Lts4;

    move-result-object v6

    goto :goto_b4

    :cond_70
    invoke-static {v0, v10, v5}, Lc09;->j(Lui3;Lxj3;Z)Lts4;

    move-result-object v6

    goto :goto_b4

    :cond_75
    const/16 p0, 0x0

    :cond_77
    iget-object v6, v0, Lui3;->d:Ljava/util/Map;

    invoke-interface {v6, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwi3;

    if-eqz v6, :cond_b0

    iget-object v6, v6, Lwi3;->a:Lxi3;

    if-eqz v6, :cond_b0

    iget v6, v6, Lxi3;->a:I

    if-eqz v3, :cond_aa

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    if-eqz v12, :cond_a1

    if-eq v12, v15, :cond_9c

    if-ne v12, v14, :cond_98

    invoke-interface {v11, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_a8

    :cond_98
    invoke-static {}, Lh9o;->p()V

    return-object p0

    :cond_9c
    and-int/lit8 v6, v6, 0x2

    if-ne v6, v14, :cond_a7

    goto :goto_a5

    :cond_a1
    and-int/lit8 v6, v6, 0x1

    if-ne v6, v15, :cond_a7

    :goto_a5
    move v6, v15

    goto :goto_a8

    :cond_a7
    const/4 v6, 0x0

    :goto_a8
    if-nez v6, :cond_ab

    :cond_aa
    const/4 v15, 0x0

    :cond_ab
    invoke-static {v0, v10, v15}, Lc09;->j(Lui3;Lxj3;Z)Lts4;

    move-result-object v6

    goto :goto_b4

    :cond_b0
    invoke-static {v0, v10, v3}, Lc09;->j(Lui3;Lxj3;Z)Lts4;

    move-result-object v6

    :goto_b4
    invoke-interface {v9, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_b8
    return-object v9

    :cond_b9
    const/16 p0, 0x0

    return-object p0
.end method
