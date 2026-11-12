.class public final synthetic Ljri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ljri;->a:B

    iput-object p1, p0, Ljri;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljri;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 31

    move-object/from16 v0, p0

    iget-byte v1, v0, Ljri;->a:B

    const/high16 v2, 0x3f800000    # 1.0f

    const-wide/16 v3, 0x0

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    packed-switch v1, :pswitch_data_752

    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Ldnb;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/concurrent/CountDownLatch;

    :try_start_18
    invoke-virtual {v1}, Ldnb;->run()V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_1f

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :catchall_1f
    move-exception v0

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0

    :pswitch_24
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Ldnl;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/inputmethod/CorrectionInfo;

    iget-object v1, v1, Ldnl;->d:Lorg/chromium/content/browser/input/ImeAdapterImpl;

    invoke-virtual {v1}, Lorg/chromium/content/browser/input/ImeAdapterImpl;->p()Z

    move-result v2

    if-eqz v2, :cond_5d

    iget-object v1, v1, Lorg/chromium/content/browser/input/ImeAdapterImpl;->C:Li1;

    if-eqz v1, :cond_5d

    iget v2, v1, Li1;->c:I

    if-lez v2, :cond_51

    iput v7, v1, Li1;->c:I

    iget-object v2, v1, Li1;->d:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/input/ImeAdapterImpl;

    invoke-virtual {v2}, Lorg/chromium/content/browser/input/ImeAdapterImpl;->p()Z

    move-result v3

    if-eqz v3, :cond_51

    iget-object v3, v2, Lorg/chromium/content/browser/input/ImeAdapterImpl;->C:Li1;

    if-eqz v3, :cond_51

    iget-wide v2, v2, Lorg/chromium/content/browser/input/ImeAdapterImpl;->a:J

    invoke-static {v2, v3}, LJ/N;->Mm4_bo6O(J)V

    :cond_51
    iget v2, v1, Li1;->b:I

    if-eqz v2, :cond_5b

    if-ne v2, v8, :cond_5d

    invoke-virtual {v1, v0}, Li1;->i(Landroid/view/inputmethod/CorrectionInfo;)V

    goto :goto_5d

    :cond_5b
    iput-object v0, v1, Li1;->e:Ljava/lang/Object;

    :cond_5d
    :goto_5d
    return-void

    :pswitch_5e
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Ldnl;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lvjk;

    iget-object v1, v1, Ldnl;->d:Lorg/chromium/content/browser/input/ImeAdapterImpl;

    invoke-virtual {v1, v0}, Lorg/chromium/content/browser/input/ImeAdapterImpl;->d(Lvjk;)V

    iget-object v2, v1, Lorg/chromium/content/browser/input/ImeAdapterImpl;->w:Lga6;

    if-nez v2, :cond_78

    new-instance v2, Lga6;

    const/16 v3, 0x13

    invoke-direct {v2, v1, v3}, Lga6;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v1, Lorg/chromium/content/browser/input/ImeAdapterImpl;->w:Lga6;

    :cond_78
    invoke-virtual {v2, v6, v0}, Lga6;->o(ILvjk;)V

    return-void

    :pswitch_7c
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Liu2;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_86
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lpqh;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lpqh;

    iget-object v1, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Lnx5;

    invoke-static {v1, v9}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    iget-object v0, v0, Lpqh;->a:Ljava/lang/Object;

    check-cast v0, Lnx5;

    invoke-static {v0, v9}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    return-void

    :pswitch_9d
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lall;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lbuk;

    iget-object v2, v1, Lall;->h:Lbuk;

    if-eqz v2, :cond_af

    if-ne v2, v0, :cond_af

    iput-object v9, v1, Lall;->h:Lbuk;

    iput-object v9, v1, Lall;->g:Lo94;

    :cond_af
    iget-object v0, v1, Lall;->l:La32;

    if-eqz v0, :cond_b8

    invoke-virtual {v0}, La32;->k()V

    iput-object v9, v1, Lall;->l:La32;

    :cond_b8
    return-void

    :pswitch_b9
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lnbl;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lxwh;

    iget-object v1, v1, Lnbl;->e:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_c7
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lh5k;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lx2l;

    iget-object v2, v0, Lx2l;->j:Lypd;

    iget-object v3, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    iput-boolean v7, v1, Lh5k;->a:Z

    sget-object v4, Lx2l;->r:Lo2l;

    iget-object v4, v0, Lx2l;->i:Lpde;

    iget-object v10, v0, Lx2l;->f:Lk6l;

    iget-object v11, v10, Lk6l;->o:Lb2l;

    if-nez v11, :cond_e3

    move v11, v6

    goto :goto_e9

    :cond_e3
    iget-object v12, v0, Lx2l;->o:Lo2l;

    invoke-virtual {v12, v11}, Lo2l;->a(Lb2l;)I

    move-result v11

    :goto_e9
    new-instance v12, La83;

    const/16 v13, 0xd

    invoke-direct {v12, v13}, La83;-><init>(B)V

    invoke-virtual {v0, v12}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object v13, v0, Lx2l;->o:Lo2l;

    iget-object v13, v13, Lo2l;->d:Lp6l;

    sget-object v14, Li2l;->a:Li2l;

    iget-object v15, v0, Lx2l;->n:Ltsd;

    invoke-virtual {v15}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ls2l;

    if-nez v15, :cond_129

    iget-object v14, v0, Lx2l;->o:Lo2l;

    iget-object v14, v14, Lo2l;->d:Lp6l;

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    if-eqz v14, :cond_117

    if-ne v14, v8, :cond_112

    sget-object v14, Lx2l;->s:Lo2l;

    goto :goto_119

    :cond_112
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_3d5

    :cond_117
    sget-object v14, Lx2l;->r:Lo2l;

    :goto_119
    move-object/from16 v19, v1

    move-object/from16 v23, v2

    move-object/from16 v25, v3

    move-object/from16 p0, v4

    move/from16 v20, v11

    move-object/from16 v29, v12

    move-object/from16 v28, v13

    goto/16 :goto_313

    :cond_129
    iget-object v9, v15, Ls2l;->e:Lp6l;

    iget-object v6, v15, Ls2l;->f:Landroidx/recyclerview/widget/i;

    iget-object v5, v15, Ls2l;->d:Ljava/util/Set;

    iget-object v8, v15, Ls2l;->a:Lu3l;

    sget-object v7, Ly6l;->a:Ly6l;

    invoke-static {v10, v8, v7}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v7

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 p0, v4

    instance-of v4, v6, Ljal;

    if-eqz v4, :cond_15a

    check-cast v6, Ljal;

    new-instance v4, Lial;

    invoke-virtual {v6}, Ljal;->X()Ljava/util/List;

    move-result-object v18

    move-object/from16 v19, v6

    move-object/from16 v6, v18

    check-cast v6, Ljava/lang/Iterable;

    invoke-direct {v4, v6}, Lial;-><init>(Ljava/lang/Iterable;)V

    invoke-virtual/range {v19 .. v19}, Ljal;->V()Lhal;

    move-result-object v6

    :goto_157
    move-object/from16 v18, v14

    goto :goto_15d

    :cond_15a
    const/4 v4, 0x0

    const/4 v6, 0x0

    goto :goto_157

    :goto_15d
    new-instance v14, Ljava/util/LinkedHashMap;

    invoke-direct {v14}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v19, v1

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    move/from16 v20, v11

    const/4 v11, 0x0

    :goto_16b
    if-ge v11, v1, :cond_271

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    add-int/lit8 v11, v11, 0x1

    move/from16 v22, v1

    move-object/from16 v1, v21

    check-cast v1, Lb2l;

    move/from16 v21, v11

    move-object v11, v1

    check-cast v11, Ld7l;

    iget-object v11, v11, Ld7l;->j:Le7l;

    invoke-interface {v11}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v11

    iget v11, v11, Lcom/opera/android/browser/TabInfo;->d:I

    move-object/from16 v23, v2

    if-nez v11, :cond_19e

    new-instance v2, Lu2l;

    invoke-direct {v2, v1, v11}, Lu2l;-><init>(Lb2l;I)V

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v25, v3

    move-object/from16 v24, v4

    move-object/from16 v26, v6

    move-object/from16 v29, v12

    move-object/from16 v28, v13

    goto/16 :goto_25f

    :cond_19e
    if-eqz v4, :cond_22f

    iget-object v2, v4, Lial;->a:Ljava/lang/Iterable;

    if-eqz v6, :cond_22f

    move-object/from16 v24, v4

    iget v4, v6, Lhal;->a:I

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lb2l;

    move-object/from16 v26, v6

    move-object/from16 v6, v25

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    iget v6, v6, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v4, v6, :cond_228

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_228

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v5, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_228

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_215

    new-instance v6, Lv2l;

    move-object/from16 v25, v3

    const/4 v3, 0x0

    invoke-direct {v6, v4, v3}, Lv2l;-><init>(IZ)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    if-nez v27, :cond_204

    move-object/from16 v28, v13

    new-instance v13, Lv2l;

    move-object/from16 v29, v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v5, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    invoke-direct {v13, v11, v12}, Lv2l;-><init>(IZ)V

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v14, v3, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v27, v13

    goto :goto_208

    :cond_204
    move-object/from16 v29, v12

    move-object/from16 v28, v13

    :goto_208
    move-object/from16 v3, v27

    check-cast v3, Lv2l;

    iget-object v3, v3, Lv2l;->c:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v14, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21b

    :cond_215
    move-object/from16 v25, v3

    move-object/from16 v29, v12

    move-object/from16 v28, v13

    :goto_21b
    check-cast v6, Lv2l;

    iget-object v2, v6, Lv2l;->c:Ljava/util/ArrayList;

    new-instance v3, Lu2l;

    invoke-direct {v3, v1, v4}, Lu2l;-><init>(Lb2l;I)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25f

    :cond_228
    move-object/from16 v25, v3

    :goto_22a
    move-object/from16 v29, v12

    move-object/from16 v28, v13

    goto :goto_236

    :cond_22f
    move-object/from16 v25, v3

    move-object/from16 v24, v4

    move-object/from16 v26, v6

    goto :goto_22a

    :goto_236
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_253

    new-instance v3, Lv2l;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-direct {v3, v11, v4}, Lv2l;-><init>(IZ)V

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v14, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_253
    check-cast v3, Lv2l;

    iget-object v2, v3, Lv2l;->c:Ljava/util/ArrayList;

    new-instance v3, Lu2l;

    invoke-direct {v3, v1, v11}, Lu2l;-><init>(Lb2l;I)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_25f
    move/from16 v11, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v4, v24

    move-object/from16 v3, v25

    move-object/from16 v6, v26

    move-object/from16 v13, v28

    move-object/from16 v12, v29

    goto/16 :goto_16b

    :cond_271
    move-object/from16 v23, v2

    move-object/from16 v25, v3

    move-object/from16 v29, v12

    move-object/from16 v28, v13

    invoke-virtual {v14}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_283
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2dc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lv2l;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    iget-boolean v4, v2, Lv2l;->b:Z

    iget-object v5, v2, Lv2l;->c:Ljava/util/ArrayList;

    iget v6, v2, Lv2l;->a:I

    if-eqz v4, :cond_2cf

    new-instance v4, Ll2l;

    invoke-virtual {v2}, Lv2l;->a()Ljava/util/List;

    move-result-object v2

    invoke-direct {v4, v2, v6}, Ll2l;-><init>(Ljava/util/List;I)V

    invoke-virtual {v8, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v8, v3, v5}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v2, v3

    invoke-virtual/range {p0 .. p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-boolean v3, v3, Leyj;->r:Z

    if-eqz v3, :cond_2c6

    add-int/lit8 v3, v2, 0x1

    new-instance v4, Lj2l;

    invoke-direct {v4, v6}, Lj2l;-><init>(I)V

    invoke-virtual {v8, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move v2, v3

    :cond_2c6
    new-instance v3, Lk2l;

    invoke-direct {v3, v6}, Lk2l;-><init>(I)V

    invoke-virtual {v8, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_283

    :cond_2cf
    new-instance v4, Lg2l;

    invoke-virtual {v2}, Lv2l;->a()Ljava/util/List;

    move-result-object v2

    invoke-direct {v4, v2, v6}, Lg2l;-><init>(Ljava/util/List;I)V

    invoke-virtual {v8, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_283

    :cond_2dc
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2f3

    iget-boolean v1, v15, Ls2l;->c:Z

    if-nez v1, :cond_2ed

    sget-object v1, Lp6l;->b:Lp6l;

    if-ne v9, v1, :cond_2ed

    sget-object v14, Lh2l;->a:Lh2l;

    goto :goto_2ef

    :cond_2ed
    move-object/from16 v14, v18

    :goto_2ef
    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30c

    :cond_2f3
    new-instance v1, Lr2l;

    sget-object v2, Lq2l;->a:Lq2l;

    invoke-direct {v1, v2}, Lr2l;-><init>(Lq2l;)V

    const/4 v3, 0x0

    invoke-virtual {v8, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-instance v2, Lr2l;

    sget-object v3, Lq2l;->b:Lq2l;

    invoke-direct {v2, v3}, Lr2l;-><init>(Lq2l;)V

    invoke-virtual {v8, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_30c
    new-instance v14, Lo2l;

    iget-object v1, v10, Lk6l;->m:Lz6l;

    invoke-direct {v14, v8, v7, v1, v9}, Lo2l;-><init>(Ljava/util/List;Ljava/util/List;Lz6l;Lp6l;)V

    :goto_313
    iput-object v14, v0, Lx2l;->o:Lo2l;

    iget-object v1, v14, Lo2l;->a:Ljava/util/List;

    sget-object v2, Lx2l;->t:Lnv6;

    invoke-virtual {v0, v1, v2}, Ldt1;->L(Ljava/util/List;Lo87;)V

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    iget-object v2, v0, Lx2l;->l:Lp2l;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_331

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3a1

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_3d5

    :cond_331
    iget-object v1, v1, La83;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpoh;

    instance-of v2, v1, Looh;

    if-eqz v2, :cond_3a4

    check-cast v1, Looh;

    iget v2, v1, Looh;->b:I

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eq v2, v3, :cond_3a4

    iget-object v3, v0, Lx2l;->o:Lo2l;

    iget-object v3, v3, Lo2l;->d:Lp6l;

    move-object/from16 v4, v28

    if-ne v4, v3, :cond_3a4

    const/4 v3, 0x0

    :goto_352
    if-ge v3, v2, :cond_375

    iget v4, v1, Looh;->a:I

    add-int/2addr v4, v3

    move-object/from16 v5, v25

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lu2l;

    if-nez v6, :cond_36e

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lg2l;

    if-nez v6, :cond_36e

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v25, v5

    goto :goto_352

    :cond_36e
    new-instance v9, Looh;

    sub-int/2addr v2, v3

    invoke-direct {v9, v4, v2}, Looh;-><init>(II)V

    goto :goto_376

    :cond_375
    const/4 v9, 0x0

    :goto_376
    if-eqz v9, :cond_3a4

    invoke-virtual/range {p0 .. p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget v0, v0, Leyj;->t:I

    iget v1, v9, Looh;->b:I

    const/16 v16, 0x1

    add-int/lit8 v1, v1, -0x1

    if-le v0, v1, :cond_389

    move v0, v1

    :cond_389
    add-int/lit8 v0, v0, -0x1

    if-gez v0, :cond_38f

    const/4 v7, 0x0

    goto :goto_390

    :cond_38f
    move v7, v0

    :goto_390
    invoke-virtual/range {p0 .. p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget v0, v0, Leyj;->u:I

    mul-int/2addr v7, v0

    iget v0, v9, Looh;->a:I

    move-object/from16 v1, v23

    const/4 v2, 0x2

    invoke-static {v1, v0, v7, v2}, Lypd;->K(Lypd;III)V

    :cond_3a1
    :goto_3a1
    move-object/from16 v1, v19

    goto :goto_3ce

    :cond_3a4
    move-object/from16 v1, v23

    move/from16 v6, v20

    const/4 v2, -0x1

    if-ne v6, v2, :cond_3a1

    iget-object v3, v10, Lk6l;->o:Lb2l;

    if-nez v3, :cond_3b1

    move v0, v2

    goto :goto_3b7

    :cond_3b1
    iget-object v0, v0, Lx2l;->o:Lo2l;

    invoke-virtual {v0, v3}, Lo2l;->a(Lb2l;)I

    move-result v0

    :goto_3b7
    if-eq v0, v2, :cond_3a1

    invoke-virtual/range {p0 .. p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyj;

    iget v2, v2, Leyj;->E:I

    iget-object v1, v1, Lypd;->c:Ljava/lang/Object;

    check-cast v1, Lz5l;

    invoke-virtual {v1}, Lz5l;->b()V

    iget-object v1, v1, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v1, v0, v2}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    goto :goto_3a1

    :goto_3ce
    iget-object v0, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Lvl9;

    invoke-virtual {v0}, Lvl9;->run()V

    :goto_3d5
    return-void

    :pswitch_3d6
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lji2;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lji2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_3e2
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Ln6k;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lswk;

    invoke-virtual {v1, v0}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3ee
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lvtk;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqp5;

    new-instance v2, Lvo2;

    invoke-direct {v2, v1}, Lvo2;-><init>(Lvtk;)V

    invoke-interface {v0, v2}, Lqp5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_405
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lev5;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Late;

    iget-object v1, v1, Lev5;->c:Ljava/lang/Object;

    check-cast v1, Lrse;

    iget-object v0, v0, Late;->f:Ll0c;

    iget-object v2, v1, Lrse;->s:Lua7;

    new-instance v3, Ltse;

    invoke-virtual {v2}, Lua7;->p()Ln37;

    move-result-object v4

    check-cast v4, Lqse;

    iget v4, v4, Lqse;->a:I

    invoke-static {v4}, Lij0;->a(I)Lij0;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ltse;-><init>(Lij0;Ll0c;)V

    invoke-static {v2, v3}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-virtual {v1}, Lryl;->g0()V

    return-void

    :pswitch_42d
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lzwk;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/history/HistoryManager;

    iget-object v2, v1, Lzwk;->c:Le3j;

    if-eqz v2, :cond_43f

    invoke-virtual {v2, v1}, Lno7;->p(Lmo7;)V

    const/4 v2, 0x0

    iput-object v2, v1, Lzwk;->c:Le3j;

    :cond_43f
    invoke-static {}, LJ/N;->MGkjYr2q()V

    iget-wide v1, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v1, v2}, LJ/N;->MX9MmBib(J)V

    iput-wide v3, v0, Lcom/opera/android/history/HistoryManager;->a:J

    return-void

    :pswitch_44a
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lwzg;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljri;

    const/4 v2, 0x0

    iput-object v2, v1, Lwzg;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljri;->run()V

    return-void

    :pswitch_459
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lwzg;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v3, v1, Lwzg;->b:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, v1, Lwzg;->c:Ljava/lang/Object;

    check-cast v4, Landroid/view/ViewPropertyAnimator;

    if-eqz v4, :cond_483

    const-string v4, "User stuck on onboarding"

    const-string v5, "Button fade-out animator was not set to null and skipped fade-in"

    invoke-static {v4, v5}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v1, Lwzg;->c:Ljava/lang/Object;

    check-cast v4, Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v4, 0x0

    iput-object v4, v1, Lwzg;->c:Ljava/lang/Object;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setAlpha(F)V

    goto :goto_4a4

    :cond_483
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iput-object v0, v1, Lwzg;->c:Ljava/lang/Object;

    const-wide/16 v3, 0x15e

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v3, Lmni;

    const/16 v4, 0x1a

    invoke-direct {v3, v1, v4}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :goto_4a4
    return-void

    :pswitch_4a5
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lu9k;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    iget-object v2, v1, Lu9k;->a:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lr9k;

    if-eqz v3, :cond_4d6

    iget-object v3, v1, Lu9k;->b:Ltn;

    if-eqz v3, :cond_4cd

    const/4 v4, 0x0

    iput-object v4, v1, Lu9k;->b:Ltn;

    const/4 v1, 0x1

    iput-boolean v1, v3, Ltn;->a:Z

    iget-object v1, v3, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Ls03;

    sget-object v3, Lcak;->d:Lavj;

    invoke-static {v1}, Lavj;->f(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ls03;->run()V

    :cond_4cd
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/opera/android/startup/WelcomeActivity;->b(Z)V

    sget-object v0, Ls9k;->a:Ls9k;

    invoke-virtual {v2, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_4d6
    return-void

    :pswitch_4d7
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lo9k;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ld0n;

    iget-object v5, v0, Ld0n;->a:Le0n;

    sget-object v6, Le0n;->c:Le0n;

    if-ne v5, v6, :cond_500

    sget-object v2, Le0n;->e:Lh58;

    invoke-static {v2, v2}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v2

    :goto_4eb
    invoke-virtual {v2}, Lw4;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_513

    invoke-virtual {v2}, Lw4;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le0n;

    invoke-virtual {v1, v5}, Lo9k;->h0(Le0n;)Ld0n;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ld0n;->a(F)V

    goto :goto_4eb

    :cond_500
    iget-object v5, v0, Ld0n;->h:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->floatValue()F

    move-result v5

    cmpg-float v5, v5, v2

    if-eqz v5, :cond_513

    invoke-virtual {v0, v2}, Ld0n;->a(F)V

    :cond_513
    iget-boolean v2, v1, Lo9k;->k:Z

    if-eqz v2, :cond_540

    iget-object v0, v0, Ld0n;->a:Le0n;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_537

    const/4 v2, 0x1

    if-eq v0, v2, :cond_530

    const/4 v2, 0x2

    if-ne v0, v2, :cond_52c

    sget-object v0, Le0n;->a:Le0n;

    invoke-virtual {v1, v0}, Lo9k;->h0(Le0n;)Ld0n;

    move-result-object v0

    goto :goto_53d

    :cond_52c
    invoke-static {}, Lh9o;->p()V

    goto :goto_540

    :cond_530
    sget-object v0, Le0n;->c:Le0n;

    invoke-virtual {v1, v0}, Lo9k;->h0(Le0n;)Ld0n;

    move-result-object v0

    goto :goto_53d

    :cond_537
    sget-object v0, Le0n;->b:Le0n;

    invoke-virtual {v1, v0}, Lo9k;->h0(Le0n;)Ld0n;

    move-result-object v0

    :goto_53d
    invoke-virtual {v1, v0, v3, v4}, Lo9k;->k0(Ld0n;J)V

    :cond_540
    :goto_540
    return-void

    :pswitch_541
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lg0k;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/SurfaceTexture;

    sget v2, Lg0k;->l:I

    iget-object v2, v1, Lg0k;->g:Landroid/graphics/SurfaceTexture;

    iget-object v3, v1, Lg0k;->h:Landroid/view/Surface;

    new-instance v4, Landroid/view/Surface;

    invoke-direct {v4, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, v1, Lg0k;->g:Landroid/graphics/SurfaceTexture;

    iput-object v4, v1, Lg0k;->h:Landroid/view/Surface;

    iget-object v0, v1, Lg0k;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_55e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_570

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmi8;

    iget-object v1, v1, Lmi8;->a:Lqi8;

    invoke-virtual {v1, v4}, Lqi8;->R0(Ljava/lang/Object;)V

    goto :goto_55e

    :cond_570
    if-eqz v2, :cond_575

    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->release()V

    :cond_575
    if-eqz v3, :cond_57a

    invoke-virtual {v3}, Landroid/view/Surface;->release()V

    :cond_57a
    return-void

    :pswitch_57b
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Ldhf;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, v1, Ldhf;->g:Lab;

    invoke-virtual {v1, v0}, Lab;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_589
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lxnj;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Lxnj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_599
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lm25;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_5a9

    const/4 v7, 0x1

    goto :goto_5aa

    :cond_5a9
    const/4 v7, 0x0

    :goto_5aa
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v1, v0}, Lm25;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_5b2
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lzcj;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, v1, Lzcj;->d:Loji;

    const-string v2, "target=?"

    const-string v3, "targets"

    const-string v4, "time"

    const-string v5, "priority"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide v8, 0x151f7b1bf80L

    sub-long/2addr v6, v8

    const-wide v8, 0x3ff0000000062028L    # 1.0000000000891394

    long-to-double v10, v6

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    check-cast v1, Lxcj;

    invoke-virtual {v1}, Lxcj;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_5e3
    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v20

    const/4 v1, 0x1

    new-array v10, v1, [Ljava/lang/String;

    const/16 v17, 0x0

    aput-object v0, v10, v17

    const-string v19, "targets"

    const-string v21, "target=?"

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, v10

    invoke-virtual/range {v18 .. v25}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_5fe
    .catchall {:try_start_5e3 .. :try_end_5fe} :catchall_686

    move-object/from16 v10, v18

    move-object/from16 v11, v22

    :try_start_602
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v12

    if-eqz v12, :cond_626

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v12

    add-double/2addr v8, v12

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    const/4 v4, 0x0

    invoke-static {v4, v8, v9, v6, v7}, Loji;->t(Ljava/lang/String;DJ)Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v10, v3, v5, v2, v11}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_66b

    :cond_626
    invoke-static {v0}, Lzcj;->a(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v12

    if-eqz v12, :cond_66e

    iget-object v12, v12, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    const/16 v17, 0x0

    aput-object v12, v11, v17

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    const-string v19, "targets"

    const-string v21, "target=?"
    :try_end_63b
    .catchall {:try_start_602 .. :try_end_63b} :catchall_684

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v23, 0x0

    move-object/from16 v18, v10

    move-object/from16 v22, v11

    :try_start_645
    invoke-virtual/range {v18 .. v25}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_649
    .catchall {:try_start_645 .. :try_end_649} :catchall_686

    :try_start_649
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v12

    if-eqz v12, :cond_66e

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v12

    add-double/2addr v8, v12

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-static {v0, v8, v9, v6, v7}, Loji;->t(Ljava/lang/String;DJ)Landroid/content/ContentValues;

    move-result-object v4

    invoke-virtual {v10, v3, v4, v2, v11}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_66b
    const/16 v16, 0x1

    goto :goto_670

    :cond_66e
    const/16 v16, 0x0

    :goto_670
    if-nez v16, :cond_67a

    invoke-static {v0, v8, v9, v6, v7}, Loji;->t(Ljava/lang/String;DJ)Landroid/content/ContentValues;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v10, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    :cond_67a
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_680
    .catchall {:try_start_649 .. :try_end_680} :catchall_684

    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_684
    move-exception v0

    goto :goto_689

    :catchall_686
    move-exception v0

    move-object/from16 v10, v18

    :goto_689
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :pswitch_68d
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Le2j;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    :try_start_695
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_698
    .catchall {:try_start_695 .. :try_end_698} :catchall_69c

    invoke-virtual {v1}, Le2j;->a()V

    return-void

    :catchall_69c
    move-exception v0

    invoke-virtual {v1}, Le2j;->a()V

    throw v0

    :pswitch_6a1
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lqie;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lq1j;

    iget-object v2, v1, Lqie;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayDeque;

    monitor-enter v2

    :try_start_6ae
    iget-object v3, v1, Lqie;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayDeque;

    invoke-virtual {v3, v0}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    iget-object v0, v1, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    monitor-exit v2
    :try_end_6be
    .catchall {:try_start_6ae .. :try_end_6be} :catchall_6c6

    if-nez v0, :cond_6c3

    invoke-virtual {v1}, Lqie;->o()V

    :cond_6c3
    return-void

    :goto_6c4
    :try_start_6c4
    monitor-exit v2
    :try_end_6c5
    .catchall {:try_start_6c4 .. :try_end_6c5} :catchall_6c6

    throw v0

    :catchall_6c6
    move-exception v0

    goto :goto_6c4

    :pswitch_6c8
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lf1j;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lre7;

    invoke-virtual {v1, v0}, Lf1j;->d(Lre7;)V

    return-void

    :pswitch_6d4
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lf1j;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lf1j;->f(Ljava/lang/String;)V

    return-void

    :pswitch_6e0
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lf1j;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lb2l;

    invoke-virtual {v1, v0}, Lf1j;->e(Lb2l;)V

    return-void

    :pswitch_6ec
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Luvi;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-object v1, v1, Luvi;->a:Lcan;

    invoke-virtual {v1, v0}, Lcan;->a(Landroid/view/View;)V

    return-void

    :pswitch_6fa
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/a;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Llsc;

    iget-object v1, v1, Lcom/opera/android/browser/a;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    return-void

    :pswitch_708
    iget-object v1, v0, Ljri;->b:Ljava/lang/Object;

    check-cast v1, Lehc;

    iget-object v0, v0, Ljri;->c:Ljava/lang/Object;

    check-cast v0, Lghf;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    move v7, v3

    :cond_716
    :goto_716
    move-object v2, v1

    check-cast v2, Lmea;

    invoke-virtual {v2}, Lmea;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_733

    invoke-virtual {v2}, Lmea;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_716

    add-int/lit8 v7, v7, 0x1

    goto :goto_716

    :cond_733
    iget-object v0, v0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->c()Ltb0;

    move-result-object v1

    iget-object v1, v1, Ltb0;->b:Lq56;

    const/16 v3, 0x1c

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v7}, Ljf0;->o(III)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_data_752
    .packed-switch 0x0
        :pswitch_708
        :pswitch_6fa
        :pswitch_6ec
        :pswitch_6e0
        :pswitch_6d4
        :pswitch_6c8
        :pswitch_6a1
        :pswitch_68d
        :pswitch_5b2
        :pswitch_599
        :pswitch_589
        :pswitch_57b
        :pswitch_541
        :pswitch_4d7
        :pswitch_4a5
        :pswitch_459
        :pswitch_44a
        :pswitch_42d
        :pswitch_405
        :pswitch_3ee
        :pswitch_3e2
        :pswitch_3d6
        :pswitch_c7
        :pswitch_b9
        :pswitch_9d
        :pswitch_86
        :pswitch_7c
        :pswitch_5e
        :pswitch_24
    .end packed-switch
.end method
