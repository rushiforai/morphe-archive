.class public final synthetic Lip1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqp5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lip1;->a:B

    iput-object p1, p0, Lip1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lip1;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x2

    iget-object v0, v0, Lip1;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_376

    check-cast v0, Lz1h;

    move-object/from16 v1, p1

    check-cast v1, Lq3o;

    invoke-virtual {v0, v1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_15
    check-cast v0, Lcyd;

    move-object/from16 v1, p1

    check-cast v1, Lxo2;

    iget-object v1, v1, Lxo2;->b:Landroid/view/Surface;

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iput-object v2, v0, Lcyd;->g:Ljava/lang/Object;

    iget-object v1, v0, Lcyd;->l:Ljava/lang/Object;

    check-cast v1, Ll94;

    iget-object v2, v0, Lcyd;->f:Ljava/lang/Object;

    check-cast v2, Lf28;

    invoke-virtual {v1, v2}, Ll94;->b(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcyd;->a()V

    return-void

    :pswitch_31
    check-cast v0, Ll94;

    move-object/from16 v1, p1

    check-cast v1, Lxo2;

    invoke-virtual {v0, v1}, Ll94;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_3b
    check-cast v0, La32;

    move-object/from16 v1, p1

    check-cast v1, Lxo2;

    if-eqz v0, :cond_46

    invoke-virtual {v0}, La32;->k()V

    :cond_46
    return-void

    :pswitch_47
    check-cast v0, Ljava/util/Map;

    move-object/from16 v1, p1

    check-cast v1, Lyo2;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_55
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    iget v4, v1, Lyo2;->b:I

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco2;

    iget v5, v5, Lco2;->f:I

    sub-int/2addr v4, v5

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco2;

    iget-boolean v5, v5, Lco2;->g:Z

    if-eqz v5, :cond_77

    neg-int v4, v4

    :cond_77
    invoke-static {v4}, Ld2m;->j(I)I

    move-result v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lntk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lpy4;

    const/4 v6, -0x1

    invoke-direct {v5, v2, v4, v6, v3}, Lpy4;-><init>(Ljava/lang/Object;IIB)V

    invoke-static {v5}, Lxug;->q(Ljava/lang/Runnable;)V

    goto :goto_55

    :cond_8e
    return-void

    :pswitch_8f
    check-cast v0, Ld1i;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Ld1i;->d:Lrmg;

    if-eqz v0, :cond_9c

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9c
    return-void

    :pswitch_9d
    check-cast v0, Lfk5;

    move-object/from16 v1, p1

    check-cast v1, Lek5;

    if-eqz v1, :cond_33a

    iget-object v4, v0, Lfk5;->g:Lx5f;

    iget-object v5, v0, Lfk5;->c:Leej;

    iget-object v6, v0, Lfk5;->h:Lx5f;

    instance-of v7, v1, Lck5;

    sget-object v8, Ly90;->b:Ly90;

    sget-object v9, Ly90;->c:Ly90;

    if-eqz v7, :cond_2d6

    check-cast v1, Lck5;

    iget-object v7, v1, Lck5;->c:Ljava/util/List;

    iget-object v11, v0, Lfk5;->b:Lz77;

    sget-object v12, Lxle;->c:Lxle;

    sget-object v13, Lxle;->d:Lxle;

    sget-object v14, Lxle;->b:Lxle;

    sget-object v15, Lxle;->e:Lxle;

    iget-object v2, v1, Lck5;->b:Lgk5;

    iget-object v1, v1, Lck5;->a:Ljava/lang/String;

    check-cast v7, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_cb
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_de

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v3, v17

    check-cast v3, Lp58;

    iget-boolean v3, v3, Lp58;->a:Z

    if-eqz v3, :cond_cb

    goto :goto_e0

    :cond_de
    const/16 v17, 0x0

    :goto_e0
    move-object/from16 v3, v17

    check-cast v3, Lp58;

    sget-object v10, Li1g;->b:Li1g;

    move-object/from16 v16, v7

    if-eqz v3, :cond_1cb

    instance-of v7, v3, Limm;

    if-nez v7, :cond_1cb

    instance-of v7, v3, Lkye;

    if-nez v7, :cond_1cb

    invoke-virtual {v3, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1cb

    invoke-virtual {v3, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    move/from16 v17, v7

    sget-object v7, Lijm;->b:Lijm;

    if-nez v17, :cond_1b9

    invoke-virtual {v3, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1b9

    invoke-virtual {v3, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1a9

    invoke-virtual {v3, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1a9

    move-object/from16 v17, v8

    instance-of v8, v3, Ljjb;

    if-nez v8, :cond_1a6

    instance-of v8, v3, Ldzh;

    if-nez v8, :cond_1a6

    instance-of v8, v3, Lz5j;

    if-nez v8, :cond_1a6

    instance-of v8, v3, Lhjb;

    if-nez v8, :cond_1a6

    instance-of v8, v3, Ld5b;

    if-eqz v8, :cond_1a1

    check-cast v3, Ld5b;

    iget v3, v3, Ld5b;->b:I

    iget-object v8, v0, Lfk5;->a:Lt5d;

    invoke-static {v8}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v8

    iget-object v11, v8, Lgom;->a:Llom;

    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    move-object/from16 v18, v9

    if-eqz v11, :cond_18c

    const/4 v9, 0x1

    if-eq v11, v9, :cond_150

    const/4 v9, 0x2

    if-eq v11, v9, :cond_14c

    const/4 v9, 0x3

    if-eq v11, v9, :cond_150

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_33a

    :cond_14c
    :goto_14c
    const/16 v8, 0x14

    const/4 v11, 0x0

    goto :goto_18e

    :cond_150
    iget-object v9, v8, Lgom;->c:Ljava/lang/Integer;

    if-eqz v9, :cond_175

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    if-lt v9, v3, :cond_175

    new-instance v3, Lnf;

    const/16 v9, 0x1a

    invoke-direct {v3, v0, v8, v9}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Lg77;

    invoke-direct {v8, v3, v4, v1}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, v5, Leej;->a:Lnej;

    new-instance v4, Log5;

    const/4 v9, 0x2

    invoke-direct {v4, v8, v9}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v7}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1cf

    :cond_175
    const/4 v9, 0x2

    new-instance v3, Lesg;

    const/16 v8, 0x14

    const/4 v11, 0x0

    invoke-direct {v3, v8, v4, v1, v11}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v4, v5, Leej;->a:Lnej;

    new-instance v5, Log5;

    invoke-direct {v5, v3, v9}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v5, v7}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1cf

    :cond_18c
    const/4 v9, 0x2

    goto :goto_14c

    :goto_18e
    new-instance v3, Lesg;

    invoke-direct {v3, v8, v4, v1, v11}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v4, v5, Leej;->a:Lnej;

    new-instance v5, Log5;

    invoke-direct {v5, v3, v9}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v5, v7}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1cf

    :cond_1a1
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_33a

    :cond_1a6
    :goto_1a6
    move-object/from16 v18, v9

    goto :goto_1ac

    :cond_1a9
    move-object/from16 v17, v8

    goto :goto_1a6

    :goto_1ac
    new-instance v3, Lb76;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lb76;-><init>(B)V

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11, v3, v7}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1cf

    :cond_1b9
    move-object/from16 v17, v8

    move-object/from16 v18, v9

    new-instance v3, Lzga;

    iget-object v4, v0, Lfk5;->d:Lzv3;

    invoke-direct {v3, v4, v1, v2}, Lzga;-><init>(Lzv3;Ljava/lang/String;Lgk5;)V

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11, v3, v7}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1cf

    :cond_1cb
    move-object/from16 v17, v8

    move-object/from16 v18, v9

    :goto_1cf
    iget-object v0, v0, Lfk5;->i:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->k:Lvs8;

    iget-object v0, v0, Lvs8;->b:Lekc;

    check-cast v0, Lpde;

    sget-object v3, Lv08;->a:Lv08;

    invoke-static {v0, v3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_1f3

    const/4 v9, 0x1

    if-ne v0, v9, :cond_1ee

    move-object/from16 v8, v18

    goto :goto_1f5

    :cond_1ee
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_33a

    :cond_1f3
    move-object/from16 v8, v17

    :goto_1f5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface/range {v16 .. v16}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1fe
    :goto_1fe
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lp58;

    instance-of v4, v3, Ld5b;

    if-eqz v4, :cond_21f

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Ld5b;

    iget v3, v3, Ld5b;->b:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lw90;->b:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_2c6

    :cond_21f
    instance-of v4, v3, Lhjb;

    if-eqz v4, :cond_230

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Lhjb;

    iget-object v3, v3, Lhjb;->b:Ljava/lang/String;

    sget-object v5, Lw90;->c:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_2c6

    :cond_230
    instance-of v4, v3, Ljjb;

    if-eqz v4, :cond_241

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Ljjb;

    iget-object v3, v3, Ljjb;->b:Ljava/lang/String;

    sget-object v5, Lw90;->d:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_2c6

    :cond_241
    invoke-static {v3, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_252

    new-instance v3, Landroid/util/Pair;

    sget-object v4, Lw90;->e:Lw90;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_24f
    move-object v4, v3

    goto/16 :goto_2c6

    :cond_252
    const/4 v5, 0x0

    invoke-static {v3, v12}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_261

    new-instance v3, Landroid/util/Pair;

    sget-object v4, Lw90;->f:Lw90;

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24f

    :cond_261
    invoke-static {v3, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26f

    new-instance v3, Landroid/util/Pair;

    sget-object v4, Lw90;->g:Lw90;

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24f

    :cond_26f
    instance-of v4, v3, Ldzh;

    if-eqz v4, :cond_27f

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Ldzh;

    iget-object v3, v3, Ldzh;->b:Ljava/lang/String;

    sget-object v5, Lw90;->h:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2c6

    :cond_27f
    instance-of v4, v3, Lz5j;

    if-eqz v4, :cond_28f

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Lz5j;

    iget-object v3, v3, Lz5j;->b:Ljava/lang/String;

    sget-object v5, Lw90;->i:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2c6

    :cond_28f
    invoke-static {v3, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29e

    new-instance v3, Landroid/util/Pair;

    sget-object v4, Lw90;->j:Lw90;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24f

    :cond_29e
    instance-of v4, v3, Limm;

    if-eqz v4, :cond_2ae

    new-instance v4, Landroid/util/Pair;

    check-cast v3, Limm;

    iget-object v3, v3, Limm;->b:Ljava/lang/String;

    sget-object v5, Lw90;->k:Lw90;

    invoke-direct {v4, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2c6

    :cond_2ae
    invoke-static {v3, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b6

    const/4 v4, 0x0

    goto :goto_2c6

    :cond_2b6
    sget-object v4, Lkye;->b:Lkye;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2cd

    new-instance v4, Landroid/util/Pair;

    sget-object v3, Lw90;->l:Lw90;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_2c6
    if-eqz v4, :cond_1fe

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1fe

    :cond_2cd
    invoke-static {}, Lh9o;->p()V

    goto :goto_33a

    :cond_2d1
    const/4 v4, 0x0

    invoke-virtual {v6, v1, v8, v0, v4}, Lx5f;->F(Ljava/lang/String;Ly90;Ljava/util/List;Z)V

    goto :goto_33a

    :cond_2d6
    move-object/from16 v17, v8

    move-object/from16 v18, v9

    instance-of v2, v1, Ldk5;

    if-eqz v2, :cond_337

    check-cast v1, Ldk5;

    iget-object v2, v1, Ldk5;->a:Luj5;

    iget-object v3, v0, Lfk5;->f:Lcom/opera/android/PushedContentHandler;

    const/4 v5, 0x0

    const/4 v9, 0x1

    invoke-virtual {v3, v9, v5}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    iget-object v3, v0, Lfk5;->j:Lwv1;

    iget-object v3, v3, Lwv1;->b:Lb6h;

    invoke-interface {v3}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmdh;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Liqi;->c:Liqi;

    const/4 v7, 0x4

    invoke-static {v3, v9, v4, v5, v7}, Lmdh;->b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V

    iget-object v3, v2, Luj5;->s:Lffb;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    iget-object v0, v0, Lfk5;->e:Lr9c;

    const-string v5, "User applied config bundle"

    if-le v4, v9, :cond_315

    const-string v4, "carousel_wallpapers"

    invoke-static {v4, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v3}, Lcom/leanplum/Leanplum;->trackLocal(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_31b

    :cond_315
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lcom/leanplum/Leanplum;->trackLocal(Ljava/lang/String;)V

    :goto_31b
    iget-object v0, v2, Luj5;->p:Ljava/lang/String;

    iget-object v1, v1, Ldk5;->b:Lgk5;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v9, 0x1

    if-eqz v1, :cond_32f

    if-ne v1, v9, :cond_32b

    move-object/from16 v8, v18

    goto :goto_331

    :cond_32b
    invoke-static {}, Lh9o;->p()V

    goto :goto_33a

    :cond_32f
    move-object/from16 v8, v17

    :goto_331
    sget-object v1, Ll08;->a:Ll08;

    invoke-virtual {v6, v0, v8, v1, v9}, Lx5f;->F(Ljava/lang/String;Ly90;Ljava/util/List;Z)V

    goto :goto_33a

    :cond_337
    invoke-static {}, Lh9o;->p()V

    :cond_33a
    :goto_33a
    return-void

    :pswitch_33b
    check-cast v0, Lqx7;

    move-object/from16 v1, p1

    check-cast v1, Lnz7;

    iget-object v2, v0, Lqx7;->r:Lgjm;

    iget-object v1, v1, Lnz7;->a:Ljava/lang/String;

    const-class v3, Lpx7;

    invoke-virtual {v2, v3, v1}, Lgjm;->h(Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lryl;->g0()V

    return-void

    :pswitch_34e
    check-cast v0, Lf92;

    move-object/from16 v1, p1

    check-cast v1, Lc53;

    invoke-virtual {v0, v1}, Lf92;->f(Lc53;)V

    return-void

    :pswitch_358
    check-cast v0, Lyq1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Typeface;

    invoke-static {v0, v1}, Lyq1;->o(Lyq1;Landroid/graphics/Typeface;)V

    return-void

    :pswitch_362
    check-cast v0, Lbq1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Typeface;

    invoke-static {v0, v1}, Lbq1;->a(Lbq1;Landroid/graphics/Typeface;)V

    return-void

    :pswitch_36c
    check-cast v0, Ljp1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Typeface;

    invoke-static {v0, v1}, Ljp1;->d(Ljp1;Landroid/graphics/Typeface;)V

    return-void

    :pswitch_data_376
    .packed-switch 0x0
        :pswitch_36c
        :pswitch_362
        :pswitch_358
        :pswitch_34e
        :pswitch_33b
        :pswitch_9d
        :pswitch_8f
        :pswitch_47
        :pswitch_3b
        :pswitch_31
        :pswitch_15
    .end packed-switch
.end method
