.class public final Ld1h;
.super Ldca;
.source "SourceFile"


# instance fields
.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(JLcom/opera/api/Callback;B)V
    .registers 5

    iput-byte p4, p0, Ld1h;->e:B

    invoke-direct {p0, p3, p1, p2}, Ldca;-><init>(Lcom/opera/api/Callback;J)V

    return-void
.end method


# virtual methods
.method public final c(Ljava/util/List;Landroid/util/LongSparseArray;J)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iget-byte v1, v1, Ld1h;->e:B

    packed-switch v1, :pswitch_data_336

    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/HashMap;-><init>(I)V

    new-instance v3, Ljava/util/HashMap;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1f
    :goto_1f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwan;

    invoke-static {v5}, Ldca;->a(Lwan;)Z

    move-result v6

    iget-wide v7, v5, Lwan;->a:J

    if-eqz v6, :cond_1f

    invoke-virtual {v0, v7, v8}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lrqm;

    if-eqz v6, :cond_1f

    iget-boolean v5, v5, Lwan;->d:Z

    const-wide/16 v9, 0x1

    if-eqz v5, :cond_67

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5b

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v5, v9

    goto :goto_5c

    :cond_5b
    move-wide v5, v9

    :goto_5c
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v11, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_67
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_80

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v9, v5

    :cond_80
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    :cond_8c
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Lvd3;

    const/4 v6, 0x6

    invoke-direct {v5, v3, v6}, Lvd3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    const/4 v2, 0x0

    :goto_a9
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v2, v7, :cond_106

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v0, v7, v8}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrqm;

    iget-object v8, v7, Lrqm;->b:Ljava/lang/String;

    iget-wide v9, v7, Lrqm;->a:J

    iget-object v11, v7, Lrqm;->f:Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    invoke-virtual {v6, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_103

    new-instance v12, Lrca;

    iget-object v8, v7, Lrqm;->b:Ljava/lang/String;

    iget-object v11, v7, Lrqm;->g:Ljava/lang/String;

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    iget-wide v9, v7, Lrqm;->h:J

    move-object/from16 v17, v8

    move-wide v15, v9

    move-object/from16 v18, v11

    invoke-direct/range {v12 .. v19}, Lrca;-><init>(JJLjava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_103
    add-int/lit8 v2, v2, 0x1

    goto :goto_a9

    :cond_106
    return-object v5

    :pswitch_107
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_110
    :goto_110
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1fb

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwan;

    invoke-static {v4}, Ldca;->a(Lwan;)Z

    move-result v6

    if-eqz v6, :cond_110

    iget-wide v6, v4, Lwan;->a:J

    invoke-virtual {v0, v6, v7}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lrqm;

    if-eqz v6, :cond_110

    iget-object v7, v6, Lrqm;->f:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ltqm;

    if-nez v8, :cond_141

    new-instance v8, Ltqm;

    move-wide/from16 v9, p3

    invoke-direct {v8, v7, v9, v10}, Ltqm;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_141
    iget-object v12, v6, Lrqm;->b:Ljava/lang/String;

    iget-wide v13, v4, Lwan;->a:J

    iget-wide v6, v4, Lwan;->b:J

    iget-boolean v4, v4, Lwan;->d:Z

    iget-object v11, v8, Ltqm;->a:Landroid/util/LongSparseArray;

    invoke-virtual {v11, v13, v14}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lkqm;

    if-eqz v15, :cond_16b

    iget-object v8, v15, Lkqm;->d:Lipm;

    iget-object v11, v8, Lipm;->a:Ljava/util/ArrayList;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v8, Lipm;->d:Z

    if-eqz v4, :cond_167

    iget v4, v8, Lipm;->f:I

    add-int/2addr v4, v5

    iput v4, v8, Lipm;->f:I

    :cond_167
    move-object/from16 p1, v3

    goto/16 :goto_1f7

    :cond_16b
    move-object v15, v11

    new-instance v11, Lkqm;

    move-object/from16 p1, v3

    iget-wide v2, v8, Ltqm;->b:J

    move-wide/from16 v20, v2

    move-object v2, v15

    move-wide/from16 v15, v20

    invoke-direct/range {v11 .. v16}, Lkqm;-><init>(Ljava/lang/String;JJ)V

    iget-object v3, v11, Lkqm;->d:Lipm;

    iget-object v13, v3, Lipm;->a:Ljava/util/ArrayList;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v3, Lipm;->d:Z

    if-eqz v4, :cond_18e

    iget v4, v3, Lipm;->f:I

    add-int/2addr v4, v5

    iput v4, v3, Lipm;->f:I

    :cond_18e
    iget-object v4, v8, Ltqm;->c:Lkqm;

    invoke-virtual {v4, v11}, Lkqm;->c(Lkqm;)Z

    move-result v6

    if-nez v6, :cond_1a8

    invoke-virtual {v11, v4}, Lkqm;->c(Lkqm;)Z

    move-result v6

    if-nez v6, :cond_1a8

    iget-object v4, v4, Lkqm;->a:Ljava/lang/String;

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a8

    invoke-virtual {v8, v11}, Ltqm;->c(Lkqm;)V

    goto :goto_1f7

    :cond_1a8
    iget-object v4, v8, Ltqm;->c:Lkqm;

    iget-object v6, v4, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v6

    :cond_1b0
    :goto_1b0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1ef

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkqm;

    invoke-virtual {v7, v11}, Lkqm;->c(Lkqm;)Z

    move-result v8

    const/4 v12, 0x4

    const/4 v13, 0x3

    if-eqz v8, :cond_1c6

    move v8, v13

    goto :goto_1db

    :cond_1c6
    invoke-virtual {v11, v7}, Lkqm;->c(Lkqm;)Z

    move-result v8

    if-eqz v8, :cond_1ce

    move v8, v12

    goto :goto_1db

    :cond_1ce
    iget-object v8, v7, Lkqm;->a:Ljava/lang/String;

    iget-object v14, v11, Lkqm;->a:Ljava/lang/String;

    invoke-virtual {v8, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1da

    const/4 v8, 0x2

    goto :goto_1db

    :cond_1da
    move v8, v5

    :goto_1db
    if-eq v8, v13, :cond_1e6

    if-ne v8, v12, :cond_1b0

    invoke-virtual {v11, v7}, Lkqm;->b(Lkqm;)V

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_1b0

    :cond_1e6
    iget-object v4, v7, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v4

    move-object v6, v4

    move-object v4, v7

    goto :goto_1b0

    :cond_1ef
    iget-wide v5, v3, Lipm;->b:J

    invoke-virtual {v2, v5, v6, v11}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    invoke-virtual {v4, v11}, Lkqm;->b(Lkqm;)V

    :goto_1f7
    move-object/from16 v3, p1

    goto/16 :goto_110

    :cond_1fb
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_20e
    if-ge v4, v3, :cond_2f8

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v4, v4, 0x1

    check-cast v7, Ltqm;

    new-instance v8, Lvk2;

    const/16 v9, 0x17

    invoke-direct {v8, v9}, Lvk2;-><init>(B)V

    invoke-virtual {v7, v8}, Ltqm;->a(Lcom/opera/api/Callback;)V

    new-instance v8, Lvk2;

    const/16 v9, 0x16

    invoke-direct {v8, v9}, Lvk2;-><init>(B)V

    invoke-virtual {v7, v8}, Ltqm;->a(Lcom/opera/api/Callback;)V

    new-instance v8, Lvk2;

    const/16 v9, 0x18

    invoke-direct {v8, v9}, Lvk2;-><init>(B)V

    invoke-virtual {v7, v8}, Ltqm;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {v7}, Ltqm;->b()Ljava/util/ArrayDeque;

    move-result-object v8

    :cond_23a
    :goto_23a
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2d4

    invoke-virtual {v8}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lkqm;

    iget-object v13, v9, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    iget-object v14, v9, Lkqm;->b:Ljava/util/ArrayList;

    if-nez v13, :cond_23a

    iget-object v13, v9, Lkqm;->d:Lipm;

    const-wide/16 p3, -0x1

    iget-wide v10, v13, Lipm;->b:J

    cmp-long v10, v10, p3

    if-nez v10, :cond_27e

    invoke-virtual {v14}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkqm;

    :cond_264
    :goto_264
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_27a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lkqm;

    iget-wide v10, v9, Lkqm;->h:D

    iget-wide v13, v8, Lkqm;->h:D

    cmpl-double v10, v10, v13

    if-lez v10, :cond_264

    move-object v8, v9

    goto :goto_264

    :cond_27a
    iput-object v8, v7, Ltqm;->c:Lkqm;

    :goto_27c
    const/4 v11, 0x0

    goto :goto_2d7

    :cond_27e
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-le v10, v5, :cond_2a0

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v11, 0x0

    :goto_289
    if-ge v11, v10, :cond_29b

    invoke-virtual {v14, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lkqm;

    iget-wide v12, v12, Lkqm;->g:D

    iget-wide v5, v9, Lkqm;->g:D

    add-double/2addr v5, v12

    iput-wide v5, v9, Lkqm;->g:D

    goto :goto_289

    :cond_29b
    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V

    :goto_29e
    const/4 v5, 0x1

    goto :goto_23a

    :cond_2a0
    const/4 v5, 0x0

    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkqm;

    iget-wide v10, v9, Lkqm;->g:D

    iget-wide v12, v6, Lkqm;->g:D

    cmpg-double v10, v10, v12

    if-gez v10, :cond_2d0

    iget-object v10, v9, Lkqm;->e:Lkqm;

    if-nez v10, :cond_2ba

    const/4 v11, 0x0

    iput-object v11, v6, Lkqm;->e:Lkqm;

    invoke-virtual {v7, v6}, Ltqm;->c(Lkqm;)V

    goto :goto_29e

    :cond_2ba
    invoke-virtual {v10, v6}, Lkqm;->b(Lkqm;)V

    new-instance v6, Lcrk;

    const/16 v15, 0x1b

    invoke-direct {v6, v9, v15}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iget-object v9, v10, Lkqm;->b:Ljava/util/ArrayList;

    new-instance v10, Lf15;

    const/4 v11, 0x7

    invoke-direct {v10, v6, v11}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9, v10}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    goto :goto_29e

    :cond_2d0
    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V

    goto :goto_29e

    :cond_2d4
    const-wide/16 p3, -0x1

    goto :goto_27c

    :goto_2d7
    iget-object v6, v7, Ltqm;->c:Lkqm;

    iget-object v6, v6, Lkqm;->d:Lipm;

    iget-wide v8, v6, Lipm;->b:J

    cmp-long v8, v8, p3

    if-eqz v8, :cond_2eb

    invoke-virtual {v6}, Lipm;->b()J

    move-result-wide v8

    const-wide/16 v12, 0x3

    cmp-long v6, v8, v12

    if-gez v6, :cond_2ed

    :cond_2eb
    move-object v12, v11

    goto :goto_2ef

    :cond_2ed
    iget-object v12, v7, Ltqm;->c:Lkqm;

    :goto_2ef
    if-nez v12, :cond_2f4

    :goto_2f1
    const/4 v5, 0x1

    goto/16 :goto_20e

    :cond_2f4
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f1

    :cond_2f8
    new-instance v2, Lc9;

    const/16 v15, 0x1b

    invoke-direct {v2, v15}, Lc9;-><init>(B)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_307
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_335

    const/4 v3, 0x1

    invoke-static {v3, v1}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkqm;

    iget-object v5, v4, Lkqm;->d:Lipm;

    iget-wide v5, v5, Lipm;->b:J

    invoke-virtual {v0, v5, v6}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrqm;

    new-instance v6, Lrca;

    iget-object v11, v5, Lrqm;->b:Ljava/lang/String;

    iget-object v12, v5, Lrqm;->g:Ljava/lang/String;

    iget-boolean v13, v4, Lkqm;->f:Z

    iget-object v4, v4, Lkqm;->d:Lipm;

    invoke-virtual {v4}, Lipm;->b()J

    move-result-wide v7

    iget-wide v9, v5, Lrqm;->h:J

    invoke-direct/range {v6 .. v13}, Lrca;-><init>(JJLjava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_307

    :cond_335
    return-object v2

    :pswitch_data_336
    .packed-switch 0x0
        :pswitch_107
    .end packed-switch
.end method
