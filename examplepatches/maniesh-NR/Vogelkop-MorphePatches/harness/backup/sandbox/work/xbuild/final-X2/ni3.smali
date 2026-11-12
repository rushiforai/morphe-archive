.class public final synthetic Lni3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lpi3;

.field public final synthetic b:Z

.field public final synthetic c:J

.field public final synthetic d:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lpi3;ZJLjava/util/Set;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lni3;->a:Lpi3;

    iput-boolean p2, p0, Lni3;->b:Z

    iput-wide p3, p0, Lni3;->c:J

    iput-object p5, p0, Lni3;->d:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    iget-object v1, v0, Lni3;->a:Lpi3;

    iget-object v1, v1, Lpi3;->d:Lmi3;

    iget-object v2, v1, Lmi3;->a:Ly5i;

    new-instance v3, Lt02;

    const/16 v4, 0x19

    invoke-direct {v3, v1, v4}, Lt02;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-static {v2, v4, v5, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-static {v6}, Lqbd;->a(I)I

    move-result v6

    const/16 v7, 0x10

    if-ge v6, v7, :cond_2c

    move v6, v7

    :cond_2c
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7, v6}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_35
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ldj3;

    iget-object v9, v8, Ldj3;->a:Ljava/lang/String;

    iget-object v8, v8, Ldj3;->b:Lsj3;

    new-instance v10, Lkotlin/Pair;

    invoke-direct {v10, v9, v8}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v7, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    :cond_4f
    iget-object v2, v0, Lni3;->d:Ljava/util/Set;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v6, Ljava/util/ArrayList;

    invoke-static {v2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_60
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lts4;

    new-instance v8, Lkotlin/Pair;

    iget-object v9, v3, Lts4;->c:Ljava/lang/String;

    iget-object v10, v3, Lts4;->a:Lsj3;

    invoke-direct {v8, v9, v10}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ldj3;

    iget-boolean v9, v0, Lni3;->b:Z

    iget-wide v10, v0, Lni3;->c:J

    if-nez v9, :cond_bf

    if-eqz v8, :cond_bf

    iget v9, v3, Lts4;->d:I

    iget v12, v8, Ldj3;->f:I

    if-ne v9, v12, :cond_bf

    sget-object v9, Lpn7;->b:Lon7;

    iget-wide v12, v8, Ldj3;->d:J

    sget-object v9, Lun7;->d:Lun7;

    invoke-static {v12, v13, v9}, Lcs5;->y0(JLun7;)J

    move-result-wide v12

    iget-wide v14, v8, Ldj3;->e:J

    invoke-static {v14, v15, v9}, Lcs5;->y0(JLun7;)J

    move-result-wide v14

    invoke-static {v12, v13, v14, v15}, Lpn7;->m(JJ)J

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Lpn7;->c(JJ)I

    move-result v9

    if-gtz v9, :cond_bf

    iget-boolean v3, v3, Lts4;->f:Z

    iget-object v13, v8, Ldj3;->a:Ljava/lang/String;

    iget-object v14, v8, Ldj3;->b:Lsj3;

    iget-object v15, v8, Ldj3;->c:Ljava/lang/String;

    iget-wide v9, v8, Ldj3;->d:J

    iget-wide v11, v8, Ldj3;->e:J

    iget v8, v8, Ldj3;->f:I

    move-wide/from16 v18, v11

    new-instance v12, Ldj3;

    move/from16 v21, v3

    move/from16 v20, v8

    move-wide/from16 v16, v9

    invoke-direct/range {v12 .. v21}, Ldj3;-><init>(Ljava/lang/String;Lsj3;Ljava/lang/String;JJIZ)V

    goto :goto_df

    :cond_bf
    new-instance v13, Ldj3;

    iget-object v14, v3, Lts4;->c:Ljava/lang/String;

    iget-object v15, v3, Lts4;->a:Lsj3;

    iget-object v8, v3, Lts4;->b:Ljava/lang/String;

    invoke-static {v10, v11}, Lpn7;->f(J)J

    move-result-wide v17

    iget-wide v9, v3, Lts4;->e:J

    invoke-static {v9, v10}, Lpn7;->f(J)J

    move-result-wide v19

    iget v9, v3, Lts4;->d:I

    iget-boolean v3, v3, Lts4;->f:Z

    move/from16 v22, v3

    move-object/from16 v16, v8

    move/from16 v21, v9

    invoke-direct/range {v13 .. v22}, Ldj3;-><init>(Ljava/lang/String;Lsj3;Ljava/lang/String;JJIZ)V

    move-object v12, v13

    :goto_df
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_60

    :cond_e4
    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v7, v5

    :goto_f2
    if-ge v7, v3, :cond_109

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ldj3;

    iget-object v9, v8, Ldj3;->a:Ljava/lang/String;

    iget-object v8, v8, Ldj3;->b:Lsj3;

    new-instance v10, Lkotlin/Pair;

    invoke-direct {v10, v9, v8}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_f2

    :cond_109
    invoke-static {v0, v2}, Lb5j;->d(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    iget-object v2, v1, Lmi3;->a:Ly5i;

    new-instance v3, Lf9;

    const/16 v7, 0xd

    invoke-direct {v3, v1, v6, v0, v7}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v5, v4, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
