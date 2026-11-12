.class public final synthetic Lo8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lo8f;->a:B

    iput-object p1, p0, Lo8f;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lo8f;->a:B

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    packed-switch v1, :pswitch_data_79a

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lyv4;

    move-object/from16 v1, p1

    check-cast v1, Lh1b;

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1, v7}, Lh1b;->u(I)La1b;

    move-result-object v1

    :goto_22
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    const-string v7, ""

    new-instance v4, Lcom/opera/android/suggestion/Suggestion;

    const/4 v13, 0x0

    const/16 v5, 0xb

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0x7d0

    const/4 v14, -0x1

    const/4 v15, 0x0

    move-object v8, v6

    move-object v12, v7

    invoke-direct/range {v4 .. v15}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    :cond_45
    invoke-virtual {v0, v2}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :pswitch_49
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lwih;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v0, v0, Lwih;->b:Lpde;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v5, v1, Lq0i;

    if-nez v5, :cond_147

    sget-object v5, Lt0i;->b:Lp0i;

    check-cast v1, Lmfj;

    iget-object v1, v1, Lmfj;->b:Ljava/util/List;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_ac

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljfj;

    iget-object v9, v8, Ljfj;->f:Ljava/util/List;

    if-eqz v9, :cond_6a

    check-cast v9, Ljava/lang/Iterable;

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_80
    :goto_80
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ltej;

    sget-object v11, Lwih;->c:Ljava/util/Set;

    iget-object v12, v10, Ltej;->b:Ljava/lang/String;

    invoke-interface {v11, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_80

    iget-object v10, v10, Ltej;->b:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_a6

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v5, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a6
    check-cast v11, Ljava/util/List;

    invoke-interface {v11, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_80

    :cond_ac
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-static {v8}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    goto :goto_b6

    :cond_c6
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/a;->c(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    :goto_da
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_134

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v10, v7

    :cond_e5
    if-ge v10, v9, :cond_124

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    if-eqz v11, :cond_e5

    check-cast v11, Ljava/lang/Iterable;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_fd
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_113

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Ljfj;

    iget-object v13, v13, Ljfj;->a:Ljava/lang/String;

    invoke-interface {v1, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_fd

    goto :goto_114

    :cond_113
    move-object v12, v6

    :goto_114
    check-cast v12, Ljfj;

    if-eqz v12, :cond_e5

    iget-object v11, v12, Ljfj;->a:Ljava/lang/String;

    invoke-interface {v1, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    move-result v11

    if-ne v11, v2, :cond_e5

    goto :goto_134

    :cond_124
    new-instance v9, Lx37;

    invoke-direct {v9, v5, v3}, Lx37;-><init>(Ljava/util/LinkedHashMap;B)V

    new-instance v10, Lzx1;

    const/16 v11, 0xf

    invoke-direct {v10, v9, v11}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    goto :goto_da

    :cond_134
    :goto_134
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    move-result v2

    if-lt v2, v4, :cond_145

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    goto :goto_147

    :cond_145
    sget-object v1, Ll08;->a:Ll08;

    :cond_147
    :goto_147
    sget-object v2, Ll08;->a:Ll08;

    instance-of v3, v1, Lq0i;

    if-eqz v3, :cond_14e

    move-object v1, v2

    :cond_14e
    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_152
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lebh;

    move-object/from16 v1, p1

    check-cast v1, Lyah;

    invoke-virtual {v1, v0}, Lyah;->s0(Labh;)V

    return-void

    :pswitch_15e
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lozg;

    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    iget-object v0, v0, Lozg;->d:Lx5f;

    sget-object v1, Len0;->l:Len0;

    invoke-virtual {v0, v1}, Lx5f;->n0(Len0;)V

    const-string v0, "https://security.opera.com/security-badges/"

    sget-object v1, Llqm;->d:Llqm;

    invoke-static {v0, v1, v7}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v4, v0, Lvx3;->b:I

    invoke-static {v0, v5, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :pswitch_17b
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Loxg;

    move-object/from16 v1, p1

    check-cast v1, Ljxg;

    iget-object v2, v1, Lk8;->a:Ljava/lang/Object;

    iget-object v1, v1, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lmxg;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_199

    if-ne v1, v5, :cond_1a0

    check-cast v2, Lkxg;

    sget-object v1, Lzq0;->c:Lzq0;

    invoke-virtual {v0, v1}, Loxg;->q(Lzq0;)V

    goto :goto_1a0

    :cond_199
    check-cast v2, Llxg;

    sget-object v1, Lzq0;->b:Lzq0;

    invoke-virtual {v0, v1}, Loxg;->q(Lzq0;)V

    :cond_1a0
    :goto_1a0
    return-void

    :pswitch_1a1
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lcvg;

    move-object/from16 v1, p1

    check-cast v1, Lhjm;

    iput-object v6, v0, Lcvg;->w:Los1;

    return-void

    :pswitch_1ac
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Ly73;

    move-object/from16 v1, p1

    check-cast v1, Lqtg;

    iput-boolean v7, v0, Ly73;->b:Z

    return-void

    :pswitch_1b7
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lueg;

    move-object/from16 v1, p1

    check-cast v1, Lzo;

    iget-object v8, v0, Lueg;->d:Ldl;

    iget-object v9, v0, Lueg;->h:Ljava/util/ArrayList;

    iput-boolean v7, v0, Lueg;->g:Z

    if-eqz v1, :cond_323

    iget-boolean v10, v1, Lzo;->a:Z

    xor-int/2addr v10, v5

    iput-boolean v10, v0, Lueg;->f:Z

    iget-object v10, v0, Lueg;->e:Lwy;

    iget-object v11, v10, Lwy;->q:Lw7h;

    iget-object v10, v10, Lwy;->e:Lvzk;

    iget-object v10, v10, Lvzk;->a:Ljava/lang/Object;

    check-cast v10, Lcy;

    invoke-virtual {v10}, Lcy;->c()Lml;

    move-result-object v10

    iget-object v10, v10, Lml;->h:Lil;

    iget-object v12, v11, Lw7h;->s:Lr9g;

    iget-object v13, v11, Lw7h;->h:Ljava/util/HashMap;

    iget-object v14, v11, Lw7h;->g:Ljava/util/HashMap;

    new-instance v15, Lcz;

    iget-object v1, v1, Lzo;->b:Ljava/util/List;

    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1f3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_209

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v2, v16

    check-cast v2, Lvo;

    invoke-static {v2, v10}, Lcz;->a(Lvo;Lil;)Lcz;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f3

    :cond_209
    const-string v2, "false"

    invoke-direct {v15, v6, v2}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_21f

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_220

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_21f
    const/4 v2, 0x0

    :cond_220
    check-cast v2, Lbz;

    if-nez v2, :cond_314

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_231
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_304

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvo;

    instance-of v7, v6, Lxo;

    if-eqz v7, :cond_247

    move-object v7, v6

    check-cast v7, Lxo;

    iget-boolean v7, v7, Lxo;->j:Z

    goto :goto_248

    :cond_247
    const/4 v7, 0x0

    :goto_248
    iget-object v3, v11, Lw7h;->r:Ljava/util/HashSet;

    if-eqz v7, :cond_252

    iget-object v7, v6, Lvo;->a:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_257

    :cond_252
    iget-object v7, v6, Lvo;->a:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :goto_257
    invoke-static {v6, v10}, Lcz;->a(Lvo;Lil;)Lcz;

    move-result-object v3

    invoke-virtual {v13, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ref/WeakReference;

    if-eqz v7, :cond_26c

    invoke-virtual {v7}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_26d

    invoke-virtual {v13, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26c
    const/4 v7, 0x0

    :cond_26d
    check-cast v7, Ldz;

    if-eqz v7, :cond_275

    move/from16 v17, v5

    goto/16 :goto_2f6

    :cond_275
    instance-of v7, v6, Lxo;

    if-eqz v7, :cond_2d7

    move-object v7, v6

    check-cast v7, Lxo;

    iget-object v4, v7, Lvo;->d:Lyo;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    move/from16 v17, v5

    if-eqz v4, :cond_2cc

    if-eq v4, v5, :cond_2c2

    const/4 v5, 0x3

    if-eq v4, v5, :cond_2b7

    const/4 v5, 0x4

    if-eq v4, v5, :cond_2b1

    const/4 v5, 0x5

    if-eq v4, v5, :cond_2a6

    const/4 v5, 0x6

    if-ne v4, v5, :cond_29f

    new-instance v4, Lu7h;

    const/4 v5, 0x2

    invoke-direct {v4, v11, v7, v5}, Lu7h;-><init>(Lw7h;Lxo;B)V

    invoke-virtual {v4}, Ln1;->O()Ldz;

    move-result-object v4

    goto :goto_2e9

    :cond_29f
    const-string v0, "unknown provider sdk source"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_375

    :cond_2a6
    new-instance v4, Lu7h;

    const/4 v5, 0x3

    invoke-direct {v4, v11, v7, v5}, Lu7h;-><init>(Lw7h;Lxo;B)V

    invoke-virtual {v4}, Ln1;->O()Ldz;

    move-result-object v4

    goto :goto_2e9

    :cond_2b1
    new-instance v4, Li0f;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto :goto_2e9

    :cond_2b7
    new-instance v4, Lu7h;

    const/4 v5, 0x4

    invoke-direct {v4, v11, v7, v5}, Lu7h;-><init>(Lw7h;Lxo;B)V

    invoke-virtual {v4}, Ln1;->O()Ldz;

    move-result-object v4

    goto :goto_2e9

    :cond_2c2
    new-instance v4, Lu7h;

    invoke-direct {v4, v11, v7, v10}, Lu7h;-><init>(Lw7h;Lxo;Lil;)V

    invoke-virtual {v4}, Ln1;->O()Ldz;

    move-result-object v4

    goto :goto_2e9

    :cond_2cc
    new-instance v4, Lu7h;

    const/4 v5, 0x0

    invoke-direct {v4, v11, v7, v5}, Lu7h;-><init>(Lw7h;Lxo;B)V

    invoke-virtual {v4}, Ln1;->O()Ldz;

    move-result-object v4

    goto :goto_2e9

    :cond_2d7
    move/from16 v17, v5

    instance-of v4, v6, Lwo;

    if-eqz v4, :cond_2fd

    move-object v4, v6

    check-cast v4, Lwo;

    new-instance v5, Lv7h;

    invoke-direct {v5, v11, v4}, Lv7h;-><init>(Lw7h;Lwo;)V

    invoke-virtual {v5}, Ln1;->O()Ldz;

    move-result-object v4

    :goto_2e9
    new-instance v7, Lp7h;

    invoke-direct {v7, v4, v6, v12}, Lp7h;-><init>(Ldz;Lvo;Lr9g;)V

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2f6
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v5, v17

    goto/16 :goto_231

    :cond_2fd
    const-string v0, "unknown ad provider config"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_375

    :cond_304
    new-instance v1, Lpyg;

    iget-object v3, v11, Lw7h;->l:Lzy9;

    invoke-direct {v1, v2, v3, v12, v10}, Lpyg;-><init>(Ljava/util/ArrayList;Lzy9;Lr9g;Lil;)V

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v14, v15, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_315

    :cond_314
    move-object v1, v2

    :goto_315
    iput-object v1, v0, Lueg;->j:Lbz;

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_324

    iput-object v1, v0, Lueg;->i:Lbz;

    invoke-interface {v1, v8}, Lbz;->g(Ldl;)V

    goto :goto_375

    :cond_323
    const/4 v1, 0x0

    :cond_324
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_375

    if-nez v1, :cond_32e

    iget-object v1, v0, Lueg;->i:Lbz;

    :cond_32e
    const/4 v2, 0x0

    iput-object v2, v0, Lueg;->i:Lbz;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v7, 0x0

    :cond_33e
    :goto_33e
    if-ge v7, v3, :cond_375

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v7, v7, 0x1

    check-cast v4, Llyf;

    iget-object v5, v4, Llyf;->a:Ljava/lang/Object;

    check-cast v5, Lzy;

    if-eqz v1, :cond_36f

    iget-object v6, v4, Llyf;->b:Ljava/lang/Object;

    check-cast v6, Laz;

    invoke-virtual {v0, v6}, Lueg;->m(Laz;)Lyz;

    move-result-object v6

    if-eqz v6, :cond_362

    invoke-interface {v5, v6}, Lzy;->a(Lyz;)Z

    move-result v4

    if-nez v4, :cond_33e

    invoke-virtual {v6}, Lyz;->b()V

    goto :goto_33e

    :cond_362
    iget-object v4, v4, Llyf;->b:Ljava/lang/Object;

    check-cast v4, Laz;

    new-instance v6, Ls7o;

    invoke-direct {v6, v4, v8}, Ls7o;-><init>(Laz;Ldl;)V

    invoke-interface {v1, v5, v6}, Lbz;->e(Lzy;Laz;)V

    goto :goto_33e

    :cond_36f
    const-string v4, "pid config not available"

    invoke-interface {v5, v4}, Lzy;->onFailed(Ljava/lang/String;)V

    goto :goto_33e

    :cond_375
    :goto_375
    return-void

    :pswitch_376
    move/from16 v17, v5

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lz3;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_38e
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lhcg;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_3b9

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    invoke-interface {v2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    check-cast v2, Lqdc;

    iget-object v2, v2, Lqdc;->i:Lqcc;

    sget-object v3, Lqcc;->c:Lqcc;

    invoke-virtual {v2, v3}, Lqcc;->d(Lqcc;)Z

    move-result v2

    if-eqz v2, :cond_3b9

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v0

    iget-object v0, v0, Lkm9;->c:Lcom/opera/android/custom_views/CircleImageView;

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3b9
    return-void

    :pswitch_3ba
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lqag;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3c5
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3c9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3dd

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpag;

    iget-object v4, v3, Lpag;->a:Ljava/net/URI;

    iget-object v3, v3, Lpag;->b:Ljava/net/HttpCookie;

    invoke-virtual {v0, v4, v3}, Lqag;->a(Ljava/net/URI;Ljava/net/HttpCookie;)V

    goto :goto_3c9

    :cond_3dd
    monitor-exit v2

    return-void

    :goto_3df
    monitor-exit v2
    :try_end_3e0
    .catchall {:try_start_3c5 .. :try_end_3e0} :catchall_3e1

    throw v0

    :catchall_3e1
    move-exception v0

    goto :goto_3df

    :pswitch_3e3
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lr9g;

    move-object/from16 v1, p1

    check-cast v1, Lhjm;

    invoke-virtual {v0, v1}, Lr9g;->b(Lhjm;)V

    return-void

    :pswitch_3ef
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Laag;

    move-object/from16 v1, p1

    check-cast v1, Lhjm;

    invoke-virtual {v0, v1}, Laag;->b(Lhjm;)V

    return-void

    :pswitch_3fb
    move/from16 v17, v5

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lg9g;

    move-object/from16 v1, p1

    check-cast v1, Logf;

    iput-object v1, v0, Lg9g;->D:Logf;

    iget-object v1, v0, Lg9g;->x:Luo7;

    if-eqz v1, :cond_411

    iget-object v1, v1, Luo7;->b:Lqo7;

    iget-boolean v1, v1, Lqo7;->e:Z

    if-nez v1, :cond_417

    :cond_411
    invoke-virtual {v0}, Lg9g;->L0()Z

    move-result v1

    if-eqz v1, :cond_41a

    :cond_417
    move/from16 v5, v17

    goto :goto_41b

    :cond_41a
    const/4 v5, 0x0

    :goto_41b
    invoke-virtual {v0, v5}, Lg9g;->J0(Z)V

    return-void

    :pswitch_41f
    move/from16 v17, v5

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lvl6;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, v0, Lvl6;->e:Ljava/lang/Object;

    iget-object v1, v0, Lvl6;->c:Ljava/lang/Object;

    check-cast v1, Lfp1;

    invoke-static {v1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v1

    if-eqz v1, :cond_473

    new-instance v3, Lrxh;

    const v4, 0x7f141178

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lgkj;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5}, Lnz0;-><init>(ZZ)V

    iput-object v2, v4, Lgkj;->a:Ljava/lang/String;

    iput-object v2, v4, Lgkj;->b:Ljava/lang/String;

    iput-object v2, v4, Lgkj;->c:Ljava/lang/String;

    iput-object v2, v4, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v2, v4, Lgkj;->e:Lekj;

    iput-object v2, v4, Lgkj;->f:Lfkj;

    iput-object v2, v4, Lgkj;->g:Lqp2;

    iput-object v2, v4, Lgkj;->h:Ldkj;

    iput-object v2, v4, Lgkj;->i:Ldkj;

    iput-object v2, v4, Lgkj;->j:Lql;

    const v2, 0x7f140bbb

    iput v2, v4, Lgkj;->k:I

    const/4 v5, 0x0

    iput v5, v4, Lgkj;->l:I

    const v2, 0x7f141179

    iput v2, v4, Lgkj;->m:I

    move/from16 v2, v17

    iput-boolean v2, v4, Lgkj;->n:Z

    iput-object v3, v4, Lgkj;->o:Lpxh;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v1, v4, v2}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {v0}, Lvl6;->R()V

    :cond_473
    return-void

    :pswitch_474
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Li8g;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    iget-object v2, v0, Li8g;->h:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_483

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    :cond_483
    iput-object v1, v0, Li8g;->h:Landroid/graphics/Bitmap;

    iget-object v0, v0, Li8g;->b:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :pswitch_48b
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lx5g;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v0, Lx5g;->f:La4g;

    if-eqz v2, :cond_49a

    invoke-virtual {v2}, La4g;->a()V

    :cond_49a
    iput-object v1, v0, Lx5g;->f:La4g;

    iget-object v0, v0, Lx5g;->b:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_4a2
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b2

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lw5g;

    invoke-interface {v1}, Lw5g;->a()V

    goto :goto_4a2

    :cond_4b2
    return-void

    :pswitch_4b3
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lo16;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    new-instance v7, Lvk2;

    const/16 v2, 0x13

    invoke-direct {v7, v2}, Lvk2;-><init>(B)V

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4cc
    :goto_4cc
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_512

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lw3g;

    iget-object v3, v0, Lo16;->b:Ljava/util/HashMap;

    iget-object v4, v2, Lw3g;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_4cc

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4e8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4cc

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-eqz v5, :cond_500

    iget-object v6, v2, Lw3g;->f:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e8

    :cond_500
    iget-object v3, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    iget-object v3, v1, La4g;->a:Ljava/util/List;

    invoke-static {v3, v2}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v4

    iget-wide v2, v1, La4g;->b:J

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, LJ/N;->MjE4dyB7(JILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4cc

    :cond_512
    invoke-virtual {v1}, La4g;->a()V

    return-void

    :pswitch_516
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lb5g;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lb5g;->l(Z)V

    return-void

    :pswitch_526
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lsu;

    move-object/from16 v1, p1

    check-cast v1, Lr4g;

    if-nez v1, :cond_535

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lsu;->run(Ljava/lang/Object;)V

    goto :goto_53a

    :cond_535
    iget-object v1, v1, Lr4g;->a:Lw3g;

    invoke-virtual {v0, v1}, Lsu;->run(Ljava/lang/Object;)V

    :goto_53a
    return-void

    :pswitch_53b
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/PasswordImporter;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-wide v2, v0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_560

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Ll4g;

    const/4 v5, 0x0

    invoke-direct {v1, v5}, Ll4g;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/stream/IntStream;->toArray()[I

    move-result-object v0

    invoke-static {v2, v3, v0}, LJ/N;->MxgzCCjD(JLjava/lang/Object;)V

    :cond_560
    return-void

    :pswitch_561
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Ls3g;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_575
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lw3g;

    iget-object v4, v4, Lw3g;->f:Ljava/lang/String;

    iget-object v5, v0, Ls3g;->a:Ljava/lang/String;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_575

    move-object v6, v3

    goto :goto_58f

    :cond_58e
    const/4 v6, 0x0

    :goto_58f
    check-cast v6, Lw3g;

    if-eqz v6, :cond_5a1

    iget-object v0, v1, La4g;->a:Ljava/util/List;

    invoke-static {v0, v6}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v2

    iget-wide v3, v1, La4g;->b:J

    invoke-static {v3, v4, v2}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_5a1
    invoke-virtual {v1}, La4g;->a()V

    return-void

    :pswitch_5a5
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lve9;

    move-object/from16 v1, p1

    check-cast v1, Lr4g;

    if-eqz v1, :cond_5be

    iget-boolean v1, v1, Lr4g;->b:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lve9;->run(Ljava/lang/Object;)V

    goto :goto_5cb

    :cond_5be
    new-instance v1, Lcd6;

    invoke-direct {v1}, Lcd6;-><init>()V

    new-instance v2, Lrw7;

    invoke-direct {v2, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lve9;->run(Ljava/lang/Object;)V

    :goto_5cb
    return-void

    :pswitch_5cc
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lro9;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x0

    iput-object v2, v0, Lro9;->c:Ljava/lang/Object;

    iget-object v3, v0, Lro9;->d:Ljava/lang/Object;

    check-cast v3, Leof;

    if-eqz v3, :cond_5e5

    iput-object v2, v0, Lro9;->d:Ljava/lang/Object;

    invoke-virtual {v3, v1}, Leof;->run(Ljava/lang/Object;)V

    :cond_5e5
    return-void

    :pswitch_5e6
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OverlayView;

    move-object/from16 v1, p1

    check-cast v1, Lfr8;

    sget v2, Lcom/opera/android/custom_views/OverlayView;->e:I

    iget-object v2, v0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    if-ne v2, v1, :cond_5f7

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_5f7
    return-void

    :pswitch_5f8
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Landroid/text/TextPaint;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void

    :pswitch_604
    move-object v2, v6

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    sget v3, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    instance-of v3, v1, Lrw7;

    if-eqz v3, :cond_61e

    check-cast v1, Lrw7;

    iget-object v1, v1, Lrw7;->a:Ljava/lang/Object;

    check-cast v1, Ljd6;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_706

    :cond_61e
    instance-of v3, v1, Lsw7;

    if-eqz v3, :cond_703

    check-cast v1, Lsw7;

    iget-object v1, v1, Lsw7;->a:Ljava/lang/Object;

    check-cast v1, Las2;

    iget-object v3, v1, Las2;->d:Lt3g;

    if-nez v3, :cond_636

    iget-object v3, v1, Las2;->c:Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lt3g;

    iput-object v3, v1, Las2;->d:Lt3g;

    :cond_636
    iput-object v3, v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->d:Lt3g;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_706

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v4, 0x17

    sparse-switch v3, :sswitch_data_7d8

    goto/16 :goto_706

    :sswitch_64d
    const-string v2, "com.opera.android.autofill.ACTION_AUTHORIZE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v1

    iget-object v1, v1, Lvu2;->a:Lx5f;

    invoke-virtual {v1, v4}, Lx5f;->S(I)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->z(Z)V

    goto/16 :goto_706

    :sswitch_66a
    const-string v3, "com.opera.android.autofill.ACTION_SAVE_PASSWORD"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object v1

    if-eqz v1, :cond_67b

    iget-object v6, v1, Lyif;->d:Ls3g;

    goto :goto_67c

    :cond_67b
    move-object v6, v2

    :goto_67c
    if-eqz v6, :cond_706

    iget-object v1, v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->d:Lt3g;

    if-eqz v1, :cond_706

    new-instance v2, Lsu;

    const/16 v3, 0x1c

    invoke-direct {v2, v0, v6, v1, v3}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v6, v2}, Lt3g;->c(Ls3g;Lsu;)V

    goto/16 :goto_706

    :sswitch_68e
    const-string v2, "com.opera.android.autofill.ACTION_VIEW_ALL"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v1

    iget-object v1, v1, Lvu2;->a:Lx5f;

    invoke-virtual {v1, v4}, Lx5f;->S(I)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->B(Z)V

    goto :goto_706

    :sswitch_6aa
    const/4 v5, 0x0

    const-string v2, "com.opera.android.autofill.ACTION_EDIT_PASSWORD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v1

    iget-object v1, v1, Lvu2;->a:Lx5f;

    invoke-virtual {v1, v4}, Lx5f;->S(I)V

    invoke-virtual {v0, v5}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->A(Z)V

    goto :goto_706

    :sswitch_6c6
    const/4 v5, 0x0

    const-string v2, "com.opera.android.autofill.ACTION_ADD_PASSWORD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v1

    iget-object v1, v1, Lvu2;->a:Lx5f;

    invoke-virtual {v1, v4}, Lx5f;->S(I)V

    invoke-virtual {v0, v5}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->y(Z)V

    goto :goto_706

    :sswitch_6e2
    const-string v2, "com.opera.android.autofill.ACTION_OPEN_APP"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_706

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->r()Lsv1;

    move-result-object v1

    iget-object v1, v1, Lsv1;->a:Lxv1;

    iget-object v1, v1, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "AutofillIntent.Action.OPEN_APP"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_706

    :cond_703
    invoke-static {}, Lh9o;->p()V

    :cond_706
    :goto_706
    return-void

    :pswitch_707
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Ldbf;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Ldbf;->q:Lgbf;

    iget-object v0, v0, Lgbf;->b:Lz43;

    invoke-virtual {v0, v1}, Lz43;->t(Z)V

    return-void

    :pswitch_71b
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lv8f;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lv8f;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, v0, Lv8f;->b:Lode;

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_733
    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Lp8f;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v3, Lc9;

    const/16 v4, 0x18

    invoke-direct {v3, v4}, Lc9;-><init>(B)V

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_752
    :goto_752
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_792

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lilh;

    iget-object v4, v3, Lilh;->b:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_752

    iget-object v4, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v4, Lqhd;

    invoke-virtual {v4, v3}, Lqhd;->test(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_752

    iget-object v4, v0, Lp8f;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v3, v4}, Lolh;->b(Lilh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v4, v3, Lilh;->e:Ljava/lang/String;

    new-instance v5, Ln8f;

    iget-wide v6, v3, Lilh;->a:J

    iget-object v8, v3, Lilh;->b:Ljava/lang/String;

    iget-object v10, v3, Lilh;->c:Ljava/lang/String;

    iget-wide v11, v3, Lilh;->d:J

    sget-object v3, Laik;->a:[Ljava/lang/String;

    if-nez v4, :cond_78a

    const-string v4, ""

    :cond_78a
    move-object v13, v4

    invoke-direct/range {v5 .. v13}, Ln8f;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_752

    :cond_792
    iget-object v0, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_79a
    .packed-switch 0x0
        :pswitch_733
        :pswitch_71b
        :pswitch_707
        :pswitch_604
        :pswitch_5f8
        :pswitch_5e6
        :pswitch_5cc
        :pswitch_5a5
        :pswitch_561
        :pswitch_53b
        :pswitch_526
        :pswitch_516
        :pswitch_4b3
        :pswitch_48b
        :pswitch_474
        :pswitch_41f
        :pswitch_3fb
        :pswitch_3ef
        :pswitch_3e3
        :pswitch_3ba
        :pswitch_38e
        :pswitch_376
        :pswitch_1b7
        :pswitch_1ac
        :pswitch_1a1
        :pswitch_17b
        :pswitch_15e
        :pswitch_152
        :pswitch_49
    .end packed-switch

    :sswitch_data_7d8
    .sparse-switch
        -0x46d6ad60 -> :sswitch_6e2
        -0x9ee8d53 -> :sswitch_6c6
        -0x2b82e64 -> :sswitch_6aa
        0x1e84c0fb -> :sswitch_68e
        0x30acaf89 -> :sswitch_66a
        0x660f5e35 -> :sswitch_64d
    .end sparse-switch
.end method
