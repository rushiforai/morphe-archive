.class public final Lrlm;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lw6j;

.field public final c:Lpde;

.field public final d:Ljava/util/ArrayList;

.field public final e:Ljava/util/LinkedHashMap;

.field public final f:Lsa2;

.field public g:Z


# direct methods
.method public constructor <init>(Lw6j;)V
    .registers 25

    move-object/from16 v0, p0

    invoke-direct {v0}, Ll7n;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lrlm;->b:Lw6j;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lrlm;->d:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, v0, Lrlm;->e:Ljava/util/LinkedHashMap;

    new-instance v1, Lsa2;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lsa2;-><init>(B)V

    iput-object v1, v0, Lrlm;->f:Lsa2;

    new-instance v1, Lpde;

    new-instance v2, Lllm;

    sget-object v3, Lklm;->a:Lklm;

    new-instance v4, Lrxh;

    const v5, 0x7f141314

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    sget-object v5, Lblm;->a:Lblm;

    new-instance v6, Ldlm;

    sget-object v7, Lclm;->b:Lclm;

    new-instance v8, Lrxh;

    const v9, 0x7f141300

    invoke-direct {v8, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lllm;

    sget-object v10, Lklm;->b:Lklm;

    new-instance v11, Lrxh;

    const v12, 0x7f141311

    invoke-direct {v11, v12}, Lrxh;-><init>(I)V

    sget-object v12, Lblm;->b:Lblm;

    new-instance v13, Ldlm;

    sget-object v14, Lclm;->c:Lclm;

    new-instance v15, Lrxh;

    move-object/from16 p1, v1

    const v1, 0x7f141306

    invoke-direct {v15, v1}, Lrxh;-><init>(I)V

    const/4 v1, 0x0

    invoke-direct {v13, v14, v15, v1}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v14, Ldlm;

    sget-object v15, Lclm;->d:Lclm;

    new-instance v1, Lrxh;

    move-object/from16 v16, v13

    const v13, 0x7f141303

    invoke-direct {v1, v13}, Lrxh;-><init>(I)V

    const/4 v13, 0x0

    invoke-direct {v14, v15, v1, v13}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v15, Ldlm;

    sget-object v1, Lclm;->e:Lclm;

    new-instance v13, Lrxh;

    move-object/from16 v17, v14

    const v14, 0x7f141304

    invoke-direct {v13, v14}, Lrxh;-><init>(I)V

    const/4 v14, 0x0

    invoke-direct {v15, v1, v13, v14}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v1, Ldlm;

    sget-object v13, Lclm;->f:Lclm;

    new-instance v14, Lrxh;

    move-object/from16 v18, v15

    const v15, 0x7f141301

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    const/4 v15, 0x0

    invoke-direct {v1, v13, v14, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v13, Ldlm;

    sget-object v14, Lclm;->g:Lclm;

    new-instance v15, Lrxh;

    move-object/from16 v19, v1

    const v1, 0x7f141302

    invoke-direct {v15, v1}, Lrxh;-><init>(I)V

    const/4 v1, 0x0

    invoke-direct {v13, v14, v15, v1}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v14, Ldlm;

    sget-object v15, Lclm;->h:Lclm;

    new-instance v1, Lrxh;

    move-object/from16 v22, v13

    const v13, 0x7f141305

    invoke-direct {v1, v13}, Lrxh;-><init>(I)V

    const/4 v13, 0x0

    invoke-direct {v14, v15, v1, v13}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v1, Ldlm;

    sget-object v15, Lclm;->i:Lclm;

    new-instance v13, Lrxh;

    const v0, 0x7f140767

    invoke-direct {v13, v0}, Lrxh;-><init>(I)V

    const/4 v0, 0x0

    invoke-direct {v1, v15, v13, v0}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    move-object/from16 v13, v16

    move-object/from16 v15, v18

    move-object/from16 v16, v19

    move-object/from16 v19, v1

    move-object/from16 v18, v14

    move-object/from16 v14, v17

    move-object/from16 v17, v22

    filled-new-array/range {v13 .. v19}, [Ldlm;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v9, v10, v11, v12, v0}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v6, v7, v8, v9}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v0, Ldlm;

    sget-object v1, Lclm;->j:Lclm;

    new-instance v7, Lrxh;

    const v8, 0x7f1412f4

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lllm;

    sget-object v9, Lklm;->c:Lklm;

    new-instance v10, Lrxh;

    const v11, 0x7f14130f

    invoke-direct {v10, v11}, Lrxh;-><init>(I)V

    new-instance v13, Ldlm;

    sget-object v11, Lclm;->k:Lclm;

    new-instance v14, Lrxh;

    const v15, 0x7f1412f6

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    const/4 v15, 0x0

    invoke-direct {v13, v11, v14, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v14, Ldlm;

    sget-object v11, Lclm;->l:Lclm;

    new-instance v15, Lrxh;

    move-object/from16 v16, v13

    const v13, 0x7f1412f9

    invoke-direct {v15, v13}, Lrxh;-><init>(I)V

    const/4 v13, 0x0

    invoke-direct {v14, v11, v15, v13}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v15, Ldlm;

    sget-object v11, Lclm;->m:Lclm;

    new-instance v13, Lrxh;

    move-object/from16 v17, v14

    const v14, 0x7f1412f5

    invoke-direct {v13, v14}, Lrxh;-><init>(I)V

    const/4 v14, 0x0

    invoke-direct {v15, v11, v13, v14}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v11, Ldlm;

    sget-object v13, Lclm;->n:Lclm;

    new-instance v14, Lrxh;

    move-object/from16 v18, v15

    const v15, 0x7f1412f7

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    const/4 v15, 0x0

    invoke-direct {v11, v13, v14, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v13, Ldlm;

    sget-object v14, Lclm;->o:Lclm;

    new-instance v15, Lrxh;

    move-object/from16 v19, v11

    const v11, 0x7f1412f8

    invoke-direct {v15, v11}, Lrxh;-><init>(I)V

    const/4 v11, 0x0

    invoke-direct {v13, v14, v15, v11}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v14, Ldlm;

    sget-object v15, Lclm;->p:Lclm;

    move-object/from16 v21, v13

    new-instance v13, Lrxh;

    move-object/from16 v22, v2

    const v2, 0x7f140767

    invoke-direct {v13, v2}, Lrxh;-><init>(I)V

    invoke-direct {v14, v15, v13, v11}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    move-object/from16 v13, v16

    move-object/from16 v15, v18

    move-object/from16 v16, v19

    move-object/from16 v18, v14

    move-object/from16 v14, v17

    move-object/from16 v17, v21

    filled-new-array/range {v13 .. v18}, [Ldlm;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v8, v9, v10, v12, v2}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v1, v7, v8}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v1, Ldlm;

    sget-object v2, Lclm;->q:Lclm;

    new-instance v7, Lrxh;

    const v8, 0x7f141307

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lllm;

    sget-object v9, Lklm;->d:Lklm;

    new-instance v10, Lrxh;

    const v11, 0x7f141312

    invoke-direct {v10, v11}, Lrxh;-><init>(I)V

    new-instance v11, Ldlm;

    sget-object v13, Lclm;->r:Lclm;

    new-instance v14, Lrxh;

    const v15, 0x7f141306

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    const/4 v15, 0x0

    invoke-direct {v11, v13, v14, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v13, Ldlm;

    sget-object v14, Lclm;->s:Lclm;

    new-instance v15, Lrxh;

    move-object/from16 v16, v3

    const v3, 0x7f141309

    invoke-direct {v15, v3}, Lrxh;-><init>(I)V

    const/4 v3, 0x0

    invoke-direct {v13, v14, v15, v3}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v14, Ldlm;

    sget-object v15, Lclm;->t:Lclm;

    new-instance v3, Lrxh;

    move-object/from16 v17, v4

    const v4, 0x7f14130b

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    const/4 v4, 0x0

    invoke-direct {v14, v15, v3, v4}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v3, Ldlm;

    sget-object v15, Lclm;->u:Lclm;

    new-instance v4, Lrxh;

    move-object/from16 v18, v5

    const v5, 0x7f14130a

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    const/4 v5, 0x0

    invoke-direct {v3, v15, v4, v5}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v4, Ldlm;

    sget-object v15, Lclm;->v:Lclm;

    move-object/from16 v19, v0

    new-instance v0, Lrxh;

    move-object/from16 v20, v6

    const v6, 0x7f140767

    invoke-direct {v0, v6}, Lrxh;-><init>(I)V

    invoke-direct {v4, v15, v0, v5}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    filled-new-array {v11, v13, v14, v3, v4}, [Ldlm;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v8, v9, v10, v12, v0}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v1, v2, v7, v8}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v0, Ldlm;

    sget-object v2, Lclm;->w:Lclm;

    new-instance v3, Lrxh;

    const v4, 0x7f1412fa

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lllm;

    sget-object v5, Lklm;->e:Lklm;

    new-instance v6, Lrxh;

    const v7, 0x7f141310

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Ldlm;

    sget-object v8, Lclm;->x:Lclm;

    new-instance v9, Lrxh;

    const v10, 0x7f1412ff

    invoke-direct {v9, v10}, Lrxh;-><init>(I)V

    const/4 v15, 0x0

    invoke-direct {v7, v8, v9, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v8, Ldlm;

    sget-object v9, Lclm;->y:Lclm;

    new-instance v10, Lrxh;

    const v11, 0x7f1412fc

    invoke-direct {v10, v11}, Lrxh;-><init>(I)V

    invoke-direct {v8, v9, v10, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v9, Ldlm;

    sget-object v10, Lclm;->z:Lclm;

    new-instance v11, Lrxh;

    const v13, 0x7f1412fb

    invoke-direct {v11, v13}, Lrxh;-><init>(I)V

    invoke-direct {v9, v10, v11, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v10, Ldlm;

    sget-object v11, Lclm;->A:Lclm;

    new-instance v13, Lrxh;

    const v14, 0x7f1412fe

    invoke-direct {v13, v14}, Lrxh;-><init>(I)V

    invoke-direct {v10, v11, v13, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v11, Ldlm;

    sget-object v13, Lclm;->B:Lclm;

    new-instance v14, Lrxh;

    move-object/from16 v21, v1

    const v1, 0x7f140767

    invoke-direct {v14, v1}, Lrxh;-><init>(I)V

    invoke-direct {v11, v13, v14, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    filled-new-array {v7, v8, v9, v10, v11}, [Ldlm;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v4, v5, v6, v12, v7}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v2, v3, v4}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    new-instance v2, Ldlm;

    sget-object v3, Lclm;->C:Lclm;

    new-instance v4, Lrxh;

    invoke-direct {v4, v1}, Lrxh;-><init>(I)V

    invoke-direct {v2, v3, v4, v15}, Ldlm;-><init>(Lclm;Lrxh;Lr22;)V

    move-object/from16 v3, v19

    move-object/from16 v1, v20

    move-object/from16 v4, v21

    filled-new-array {v1, v3, v4, v0, v2}, [Ldlm;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    move-object/from16 v1, v22

    invoke-direct {v1, v2, v3, v4, v0}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Lv08;->a:Lv08;

    move-object/from16 v2, p0

    invoke-virtual {v2, v1, v0}, Lrlm;->f(Lr22;Ljava/util/Set;)Lnlm;

    move-result-object v0

    move-object/from16 v1, p1

    invoke-direct {v1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v2, Lrlm;->c:Lpde;

    return-void
.end method

.method public static g(Lnlm;)Lr22;
    .registers 2

    iget-object v0, p0, Lnlm;->c:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->a0(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget-object p0, p0, Lnlm;->b:Lr22;

    if-eqz p0, :cond_25

    iget-object p0, p0, Lr22;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_25

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldlm;

    if-eqz p0, :cond_25

    iget-object p0, p0, Ldlm;->c:Lr22;

    return-object p0

    :cond_25
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final f(Lr22;Ljava/util/Set;)Lnlm;
    .registers 13

    new-instance v0, Lnlm;

    iget-object v1, p0, Lrlm;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    sget-object v2, Lqlm;->a:Lolm;

    invoke-virtual {v2, p1, p2}, Lolm;->h(Lr22;Ljava/util/Set;)Z

    move-result v3

    if-eqz v3, :cond_1a

    new-instance v3, Lrxh;

    const v4, 0x7f140769

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    :goto_18
    move-object v4, v3

    goto :goto_3a

    :cond_1a
    if-nez p1, :cond_31

    new-instance v3, Lrxh;

    const v4, 0x7f1401b7

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Lsxh;

    const v5, 0x7f141319

    invoke-direct {v4, v5, v3}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto :goto_3a

    :cond_31
    new-instance v3, Lrxh;

    const v4, 0x7f140b36

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    goto :goto_18

    :goto_3a
    const/4 v3, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_49

    move-object v6, p2

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_49

    move v6, v5

    goto :goto_4b

    :cond_49
    move v6, v5

    move v5, v3

    :goto_4b
    if-nez p1, :cond_56

    new-instance v7, Lrxh;

    const v8, 0x7f14130c

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    goto :goto_5e

    :cond_56
    new-instance v7, Lrxh;

    const v8, 0x7f141315

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    :goto_5e
    iget-object v8, p0, Lrlm;->b:Lw6j;

    iget-object v8, v8, Lw6j;->e:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_70

    invoke-virtual {v2, p1, p2}, Lolm;->h(Lr22;Ljava/util/Set;)Z

    move-result v2

    if-eqz v2, :cond_70

    move v2, v6

    move-object v6, v7

    move v7, v3

    goto :goto_73

    :cond_70
    move v2, v6

    move-object v6, v7

    move v7, v2

    :goto_73
    if-nez p1, :cond_77

    move v8, v3

    goto :goto_78

    :cond_77
    move v8, v2

    :goto_78
    iget-boolean v9, p0, Lrlm;->g:Z

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v9}, Lnlm;-><init>(ZLr22;Ljava/util/Set;Lpxh;ZLrxh;ZZZ)V

    return-object v0
.end method

.method public final h(ILjava/lang/String;Z)V
    .registers 12

    iget-object v0, p0, Lrlm;->c:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnlm;

    iget-object v2, v1, Lnlm;->b:Lr22;

    iget-object v1, v1, Lnlm;->c:Ljava/util/Set;

    if-eqz v2, :cond_19

    iget-object v3, v2, Lr22;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldlm;

    goto :goto_1a

    :cond_19
    const/4 v3, 0x0

    :goto_1a
    if-eqz v3, :cond_36

    iget-object v3, v3, Ldlm;->a:Lclm;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, p0, Lrlm;->e:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-ne v4, p3, :cond_37

    invoke-static {v6, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_66

    :cond_36
    return-void

    :cond_37
    if-eqz v2, :cond_59

    iget-object v6, v2, Lr22;->c:Ljava/lang/Object;

    check-cast v6, Lblm;

    sget-object v7, Lblm;->b:Lblm;

    if-ne v6, v7, :cond_59

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    if-eqz v4, :cond_51

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_66

    :cond_51
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_66

    :cond_59
    if-eqz p3, :cond_64

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    goto :goto_66

    :cond_64
    sget-object v1, Lv08;->a:Lv08;

    :cond_66
    :goto_66
    iget-boolean p1, v3, Lclm;->a:Z

    if-eqz p1, :cond_73

    if-eqz p3, :cond_70

    invoke-interface {v5, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_73

    :cond_70
    invoke-interface {v5, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_73
    :goto_73
    invoke-virtual {p0, v2, v1}, Lrlm;->f(Lr22;Ljava/util/Set;)Lnlm;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final i(Lqlm;)V
    .registers 12

    iget-object v0, p0, Lrlm;->c:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnlm;

    iget-object v2, v1, Lnlm;->b:Lr22;

    iget-object v3, v1, Lnlm;->c:Ljava/util/Set;

    if-eqz v2, :cond_4e

    move-object v4, v3

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v4, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_20
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_49

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    new-instance v7, Lkotlin/Pair;

    iget-object v8, v2, Lr22;->a:Ljava/lang/Object;

    check-cast v8, Lklm;

    iget-object v9, v2, Lr22;->d:Ljava/lang/Object;

    check-cast v9, Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ldlm;

    iget-object v6, v6, Ldlm;->a:Lclm;

    invoke-direct {v7, v8, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_49
    iget-object v2, p0, Lrlm;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_4e
    iget-boolean v2, v1, Lnlm;->g:Z

    iget-object v4, p0, Lrlm;->b:Lw6j;

    if-eqz v2, :cond_59

    iget-object v2, v4, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    goto :goto_5a

    :cond_59
    const/4 v2, 0x0

    :goto_5a
    iget-boolean v5, p0, Lrlm;->g:Z

    if-nez v5, :cond_78

    iget-object v5, v1, Lnlm;->b:Lr22;

    invoke-virtual {p1, v5, v3}, Lqlm;->h(Lr22;Ljava/util/Set;)Z

    move-result v3

    if-eqz v3, :cond_78

    new-instance v3, Leek;

    const/16 v5, 0x13

    invoke-direct {v3, p0, v2, v5}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, p0, Lrlm;->f:Lsa2;

    invoke-virtual {v2}, Lsa2;->e()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-virtual {v3}, Leek;->invoke()Ljava/lang/Object;

    :cond_78
    iget-boolean v2, v1, Lnlm;->h:Z

    invoke-virtual {p1, v2}, Lqlm;->d(Z)Z

    move-result v3

    if-eqz v3, :cond_88

    invoke-virtual {p1, v2}, Lqlm;->g(Z)Z

    move-result p0

    invoke-virtual {v4, p0}, Lw6j;->l(Z)V

    return-void

    :cond_88
    iget-boolean p1, p0, Lrlm;->g:Z

    if-nez p1, :cond_99

    invoke-static {v1}, Lrlm;->g(Lnlm;)Lr22;

    move-result-object p1

    sget-object v1, Lv08;->a:Lv08;

    invoke-virtual {p0, p1, v1}, Lrlm;->f(Lr22;Ljava/util/Set;)Lnlm;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_99
    return-void
.end method
