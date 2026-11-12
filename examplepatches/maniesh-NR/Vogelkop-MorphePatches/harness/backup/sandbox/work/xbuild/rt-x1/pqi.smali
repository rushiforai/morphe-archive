.class public final Lpqi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Loqi;

.field public b:Ljava/util/Map;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Loqi;

    invoke-direct {v0, p0, p1, p2}, Loqi;-><init>(Lpqi;Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lpqi;->a:Loqi;

    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method


# virtual methods
.method public final a(Lpne;)Lpne;
    .registers 4

    sget-object v0, Lmqi;->a:[Lmqi;

    iget-object v0, p0, Lpqi;->b:Ljava/util/Map;

    if-nez v0, :cond_d

    iget-object v0, p0, Lpqi;->a:Loqi;

    invoke-virtual {v0}, Lldk;->i()V

    iget-object v0, p0, Lpqi;->b:Ljava/util/Map;

    :cond_d
    const-string p0, "bu"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_3f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3f

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3f

    iget-object v0, p1, Lpne;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    new-instance v0, Lpne;

    iget-object p1, p1, Lpne;->b:Ljava/lang/String;

    sget-object v1, Ll08;->a:Ll08;

    invoke-direct {v0, p0, p1, v1}, Lpne;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0

    :cond_3f
    return-object p1
.end method

.method public final b(Ljqi;)Ljqi;
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lpqi;->b:Ljava/util/Map;

    if-nez v2, :cond_f

    iget-object v2, v0, Lpqi;->a:Loqi;

    invoke-virtual {v2}, Lldk;->i()V

    iget-object v2, v0, Lpqi;->b:Ljava/util/Map;

    :cond_f
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_155

    iget-object v4, v1, Ljqi;->a:Ljava/lang/String;

    iget-object v14, v1, Ljqi;->k:Ljava/lang/String;

    iget-wide v5, v1, Ljqi;->l:J

    iget-object v0, v1, Ljqi;->n:Ljava/util/List;

    iget-object v3, v1, Ljqi;->v:Ljava/lang/Integer;

    sget-object v7, Lmqi;->a:[Lmqi;

    const-string v7, "cc"

    iget-object v8, v1, Ljqi;->b:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v8, "lc"

    iget-object v9, v1, Ljqi;->c:Ljava/lang/String;

    invoke-interface {v2, v8, v9}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v9, "pl"

    iget-object v10, v1, Ljqi;->d:Ljava/lang/String;

    invoke-interface {v2, v9, v10}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string v10, "o"

    iget-object v11, v1, Ljqi;->e:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "b"

    iget-object v12, v1, Ljqi;->f:Ljava/lang/String;

    invoke-interface {v2, v11, v12}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const-string v12, "ai"

    iget-object v13, v1, Ljqi;->g:Ljava/lang/String;

    invoke-interface {v2, v12, v13}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    const-string v13, "hi"

    iget-object v15, v1, Ljqi;->h:Ljava/lang/String;

    invoke-interface {v2, v13, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    const-string v15, "uc"

    move-object/from16 v18, v0

    iget-object v0, v1, Ljqi;->i:Ljava/lang/String;

    invoke-interface {v2, v15, v0}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v15, v1, Ljqi;->j:Ljava/util/Set;

    move-object/from16 v19, v15

    check-cast v19, Ljava/lang/Iterable;

    const/16 v24, 0x0

    const/16 v25, 0x3e

    const-string v20, ","

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-static/range {v19 .. v25}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v15

    move-object/from16 p0, v0

    const-string v0, "rsd"

    invoke-interface {v2, v0, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/16 v15, 0x2c

    move-object/from16 v26, v3

    const/4 v3, 0x0

    invoke-static {v3, v0, v15}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v15, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v15, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move-object/from16 v17, v4

    const/4 v4, 0x0

    :goto_ae
    if-ge v4, v3, :cond_c8

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    add-int/lit8 v4, v4, 0x1

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    move-object/from16 v19, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v19

    goto :goto_ae

    :cond_c8
    invoke-static {v15}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    sget-object v3, Lmqi;->a:[Lmqi;

    iget v3, v1, Ljqi;->m:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "usd"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "cb"

    iget-object v15, v1, Ljqi;->o:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Ljava/lang/String;

    const-string v4, "rs"

    iget-object v15, v1, Ljqi;->p:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v20, v4

    check-cast v20, Ljava/lang/String;

    const-string v4, "v"

    iget-object v15, v1, Ljqi;->q:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, Ljava/lang/String;

    const-string v4, "rc"

    iget-object v15, v1, Ljqi;->r:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v22, v4

    check-cast v22, Ljava/lang/String;

    const-string v4, "up"

    iget-object v15, v1, Ljqi;->s:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v23, v4

    check-cast v23, Ljava/lang/String;

    const-string v4, "ab"

    iget-object v15, v1, Ljqi;->t:Ljava/lang/String;

    invoke-interface {v2, v4, v15}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v24, v4

    check-cast v24, Ljava/lang/String;

    const-string v4, "cw"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_141

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    :goto_13a
    move-object/from16 v25, v1

    move-object/from16 v4, v17

    move/from16 v17, v3

    goto :goto_144

    :cond_141
    iget-object v1, v1, Ljqi;->u:Ljava/lang/Boolean;

    goto :goto_13a

    :goto_144
    new-instance v3, Ljqi;

    move-wide v15, v5

    move-object v5, v7

    move-object v6, v8

    move-object v7, v9

    move-object v8, v10

    move-object v9, v11

    move-object v10, v12

    move-object v11, v13

    move-object/from16 v12, p0

    move-object v13, v0

    invoke-direct/range {v3 .. v26}, Ljqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;JILjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-object v3

    :cond_155
    return-object v1
.end method

.method public final c(Ljava/util/Map;Z)V
    .registers 11

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_17
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_cb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const-string v6, ""

    if-eqz v5, :cond_c5

    sget-object v5, Lmqi;->a:[Lmqi;

    const-string v5, "uc"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_58

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c6

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c5

    goto/16 :goto_c6

    :cond_58
    const-string v5, "lc"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    const/4 v7, 0x2

    if-eqz v5, :cond_68

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v7, :cond_c5

    goto :goto_c6

    :cond_68
    const-string v5, "cc"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_77

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v7, :cond_c5

    goto :goto_c6

    :cond_77
    const-string v5, "lf"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c5

    const-string v5, "rsd"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a8

    const/16 v4, 0x2c

    invoke-static {v2, v1, v4}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_c6

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_97
    if-ge v2, v5, :cond_c6

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v2, v2, 0x1

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    if-eqz v7, :cond_c5

    goto :goto_97

    :cond_a8
    const-string v2, "usd"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b7

    invoke-static {v1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_c5

    goto :goto_c6

    :cond_b7
    const-string v2, "cw"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c6

    invoke-static {v1}, Lkotlin/text/StringsKt;->j0(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    if-nez v2, :cond_c6

    :cond_c5
    move-object v1, v6

    :cond_c6
    :goto_c6
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_17

    :cond_cb
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d8
    :goto_d8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fc

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_d8

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v3, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d8

    :cond_fc
    iput-object p1, p0, Lpqi;->b:Ljava/util/Map;

    if-nez p2, :cond_101

    const/4 p1, 0x0

    :cond_101
    iget-object v0, p0, Lpqi;->a:Loqi;

    invoke-virtual {v0, p1}, Lldk;->g(Ljava/lang/Object;)V

    if-eqz p2, :cond_113

    iget-object p0, p0, Lpqi;->b:Ljava/util/Map;

    if-eqz p0, :cond_113

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_113

    const/4 v2, 0x1

    :cond_113
    iput-boolean v2, v0, Loqi;->l:Z

    return-void
.end method
