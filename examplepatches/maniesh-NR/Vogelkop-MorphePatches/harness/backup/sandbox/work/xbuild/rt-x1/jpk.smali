.class public final synthetic Ljpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Ljpk;->a:B

    iput-object p1, p0, Ljpk;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Ljpk;->a:B

    const/4 v2, 0x3

    iget-object v0, v0, Ljpk;->b:Lxbf;

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_228

    move-object/from16 v1, p1

    check-cast v1, Lpok;

    iget-object v6, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v6, Leyi;

    sget-object v7, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    new-instance v8, Ljava/util/ArrayList;

    iget-object v9, v1, Lpok;->a:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    iget-object v11, v1, Lpok;->b:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    add-int/2addr v12, v10

    iget-object v10, v1, Lpok;->c:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    add-int/2addr v13, v12

    iget-object v12, v1, Lpok;->d:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v14

    add-int/2addr v14, v13

    invoke-direct {v8, v14}, Ljava/util/ArrayList;-><init>(I)V

    instance-of v13, v7, Ljava/util/Collection;

    if-eqz v13, :cond_41

    new-instance v13, Ljava/util/HashSet;

    check-cast v7, Ljava/util/Collection;

    invoke-direct {v13, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_4d

    :cond_41
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    invoke-static {v13, v7}, Lipe;->f(Ljava/util/Collection;Ljava/util/Iterator;)Z

    :goto_4d
    iget-object v1, v1, Lpok;->e:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v7, v4

    const/16 v16, 0x1

    :goto_56
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_8e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljn7;

    add-int/lit8 v20, v16, 0x1

    iget-object v15, v6, Leyi;->d:Ljava/lang/Object;

    check-cast v15, Lepk;

    iget-object v3, v14, Ljn7;->b:Ljava/lang/String;

    iget-object v5, v14, Ljn7;->b:Ljava/lang/String;

    invoke-virtual {v15, v3}, Lepk;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, Ljava/lang/String;

    new-instance v3, Look;

    iget-object v14, v14, Ljn7;->a:Ljava/lang/String;

    const/4 v15, 0x6

    move-object/from16 v18, v5

    move-object/from16 v17, v14

    move-object v14, v3

    invoke-direct/range {v14 .. v19}, Look;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v3, v18

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v13, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    move/from16 v16, v20

    goto :goto_56

    :cond_8e
    iget-object v1, v6, Leyi;->c:Ljava/lang/Object;

    check-cast v1, Li32;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-boolean v5, v6, Leyi;->b:Z

    if-eqz v5, :cond_b3

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_b3

    new-instance v5, Lspk;

    new-instance v14, Lqpk;

    invoke-direct {v14, v6, v4}, Lqpk;-><init>(Leyi;B)V

    const/4 v15, 0x1

    invoke-virtual {v1, v15}, Li32;->l(I)Lr7h;

    move-result-object v4

    invoke-direct {v5, v9, v14, v4}, Lspk;-><init>(Ljava/util/List;Lrpk;Lr7h;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b3
    iget-boolean v4, v6, Leyi;->b:Z

    const/4 v5, 0x2

    if-eqz v4, :cond_d0

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_d0

    new-instance v4, Lspk;

    new-instance v9, Lqpk;

    const/4 v15, 0x1

    invoke-direct {v9, v6, v15}, Lqpk;-><init>(Leyi;B)V

    invoke-virtual {v1, v5}, Li32;->l(I)Lr7h;

    move-result-object v14

    invoke-direct {v4, v11, v9, v14}, Lspk;-><init>(Ljava/util/List;Lrpk;Lr7h;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d0
    iget-boolean v4, v6, Leyi;->b:Z

    if-eqz v4, :cond_ed

    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_ed

    new-instance v4, Lspk;

    new-instance v9, Lgpk;

    const/4 v15, 0x1

    invoke-direct {v9, v15}, Lgpk;-><init>(B)V

    const/4 v11, 0x5

    invoke-virtual {v1, v11}, Li32;->l(I)Lr7h;

    move-result-object v11

    invoke-direct {v4, v12, v9, v11}, Lspk;-><init>(Ljava/util/List;Lrpk;Lr7h;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ed
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_18c

    new-instance v4, Lspk;

    new-instance v9, Lgpk;

    invoke-direct {v9, v5}, Lgpk;-><init>(B)V

    invoke-virtual {v1, v2}, Li32;->l(I)Lr7h;

    move-result-object v1

    invoke-direct {v4, v10, v9, v1}, Lspk;-><init>(Ljava/util/List;Lrpk;Lr7h;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_18c

    :goto_106
    if-ge v7, v1, :cond_190

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_190

    new-instance v1, Lomj;

    const/16 v4, 0x9

    invoke-direct {v1, v4}, Lomj;-><init>(B)V

    invoke-static {v3, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lspk;

    iget-object v4, v1, Lspk;->a:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_125

    const/4 v4, 0x0

    goto :goto_138

    :cond_125
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v1, Lspk;->b:Lrpk;

    iget v9, v1, Lspk;->c:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v1, Lspk;->c:I

    iget-wide v10, v1, Lspk;->e:D

    invoke-interface {v5, v10, v11, v9, v4}, Lrpk;->a(DILjava/lang/Object;)Look;

    move-result-object v4

    :goto_138
    iget v5, v1, Lspk;->d:I

    if-ne v5, v2, :cond_142

    iget-boolean v5, v6, Leyi;->b:Z

    if-nez v5, :cond_142

    const/4 v5, 0x1

    goto :goto_143

    :cond_142
    const/4 v5, 0x0

    :goto_143
    if-nez v4, :cond_149

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_18c

    :cond_149
    iget-object v9, v4, Look;->b:Ljava/lang/String;

    invoke-virtual {v13}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_14f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_174

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const/4 v12, 0x0

    const/4 v15, 0x1

    invoke-static {v9, v11, v15, v12}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v14

    if-nez v14, :cond_16b

    if-nez v5, :cond_14f

    invoke-static {v9, v11, v15, v15}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v11

    if-eqz v11, :cond_14f

    :cond_16b
    iget v4, v1, Lspk;->c:I

    if-eq v4, v15, :cond_18c

    add-int/lit8 v4, v4, -0x1

    iput v4, v1, Lspk;->c:I

    goto :goto_18c

    :cond_174
    iget-byte v5, v4, Look;->d:B

    const/4 v10, 0x7

    if-eq v5, v10, :cond_17f

    const/16 v10, 0x8

    if-eq v5, v10, :cond_17f

    add-int/lit8 v7, v7, 0x1

    :cond_17f
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v13, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-wide v4, v1, Lspk;->e:D

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v9, v4

    iput-wide v9, v1, Lspk;->e:D

    :cond_18c
    :goto_18c
    const/16 v1, 0xa

    goto/16 :goto_106

    :cond_190
    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0, v8}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_198
    move-object/from16 v1, p1

    check-cast v1, Lpok;

    iget-object v3, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v3, Lw6j;

    new-instance v4, Ljpk;

    const/4 v15, 0x1

    invoke-direct {v4, v0, v15}, Ljpk;-><init>(Lxbf;B)V

    iget-object v0, v1, Lpok;->a:Ljava/util/List;

    iget-object v5, v3, Lw6j;->a:Ljava/lang/Object;

    check-cast v5, Lepk;

    new-instance v6, Ldpk;

    const/4 v12, 0x0

    invoke-direct {v6, v5, v12}, Ldpk;-><init>(Lepk;B)V

    invoke-static {v0, v6}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v0

    const/16 v5, 0xa

    invoke-static {v0, v5}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v7

    iget-object v0, v1, Lpok;->b:Ljava/util/List;

    iget-object v6, v3, Lw6j;->b:Ljava/lang/Object;

    check-cast v6, Lepk;

    new-instance v8, Ldpk;

    const/4 v15, 0x1

    invoke-direct {v8, v6, v15}, Ldpk;-><init>(Lepk;B)V

    invoke-static {v0, v8}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v0

    invoke-static {v0, v5}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v8

    iget-object v0, v1, Lpok;->c:Ljava/util/List;

    iget-object v6, v3, Lw6j;->c:Ljava/lang/Object;

    check-cast v6, Lepk;

    new-instance v9, Lf15;

    invoke-direct {v9, v6, v2}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v9}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v0

    invoke-static {v0, v5}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v9

    iget-object v0, v1, Lpok;->d:Ljava/util/List;

    iget-object v2, v3, Lw6j;->d:Ljava/lang/Object;

    check-cast v2, Lgpk;

    new-instance v6, Lo00;

    invoke-direct {v6, v2}, Lo00;-><init>(Lgpk;)V

    invoke-static {v0, v6}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v0

    invoke-static {v0, v5}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v10

    iget-object v0, v1, Lpok;->e:Ljava/util/List;

    iget-object v1, v3, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Lepk;

    new-instance v2, Lf15;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v0

    invoke-static {v0, v5}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v11

    new-instance v6, Lpok;

    invoke-direct/range {v6 .. v11}, Lpok;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v4, v6}, Ljpk;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_228
    .packed-switch 0x0
        :pswitch_198
    .end packed-switch
.end method
