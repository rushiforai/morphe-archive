.class public final Lako;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final b:Lvdi;


# direct methods
.method public constructor <init>(Lvdi;Livg;)V
    .registers 3

    invoke-direct {p0, p2}, Lejo;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lako;->b:Lvdi;

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/Object;)V
    .registers 22

    invoke-static/range {p2 .. p2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    instance-of v1, v0, Ljava/io/IOException;

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v1, :cond_3b

    new-instance v1, Lvjo;

    check-cast v0, Ljava/io/IOException;

    instance-of v5, v0, Ljava/net/ProtocolException;

    if-eqz v5, :cond_30

    check-cast v0, Ljava/net/ProtocolException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2a

    const-string v5, "HTTP 204 had non-zero Content-Length:"

    invoke-static {v0, v5, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_2d

    const-string v5, "HTTP 205 had non-zero Content-Length:"

    invoke-static {v0, v5, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2d

    :cond_2a
    const/16 v0, 0x6a

    goto :goto_32

    :cond_2d
    const/16 v0, 0x65

    goto :goto_32

    :cond_30
    const/16 v0, 0x69

    :goto_32
    invoke-direct {v1, v0, v4}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance v0, Lq0i;

    invoke-direct {v0, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    goto :goto_3d

    :cond_3b
    move-object/from16 v0, p2

    :goto_3d
    new-instance v1, Lt0i;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v5, p0

    iget-object v5, v5, Lako;->b:Lvdi;

    iget-object v6, v5, Lvdi;->b:Ljava/lang/Object;

    check-cast v6, Lwtm;

    iget-object v7, v6, Lwtm;->a:Ljava/lang/Object;

    check-cast v7, Lvdp;

    iget-object v8, v5, Lvdi;->c:Ljava/lang/Object;

    check-cast v8, Lpro;

    iget-object v9, v8, Lpro;->d:Lwjo;

    iget-object v5, v5, Lvdi;->d:Ljava/lang/Object;

    check-cast v5, Lkgo;

    iput-object v1, v7, Lvdp;->c:Ljava/lang/Integer;

    instance-of v1, v0, Lq0i;

    if-nez v1, :cond_23f

    move-object v1, v0

    check-cast v1, Ljava/util/List;

    iget-object v6, v6, Lwtm;->b:Ljava/lang/Object;

    check-cast v6, Landroid/content/Context;

    iget-object v12, v8, Lpro;->a:Ljava/lang/String;

    iget-object v11, v8, Lpro;->e:Ljava/lang/String;

    new-instance v10, Ljava/util/ArrayList;

    const/16 v13, 0xa

    invoke-static {v1, v13}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v14

    invoke-direct {v10, v14}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_79
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8b

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lvoo;

    iget-object v15, v15, Lvoo;->l:Lfuo;

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_79

    :cond_8b
    iget-byte v14, v9, Lwjo;->a:B

    new-instance v15, Lsoo;

    invoke-direct {v15, v11, v12, v10, v14}, Lsoo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V

    invoke-static {v15}, Lp8p;->a(Lp8p;)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_99
    :goto_99
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v14, 0x1

    if-eqz v10, :cond_d6

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lvoo;

    iget-object v15, v10, Lvoo;->i:Ljava/lang/String;

    if-eqz v15, :cond_99

    new-instance v15, Lqxo;

    move/from16 v16, v13

    iget-object v13, v10, Lvoo;->j:Ljava/lang/String;

    move v2, v14

    iget-object v14, v10, Lvoo;->l:Lfuo;

    move-object/from16 v18, v15

    iget-object v15, v10, Lvoo;->i:Ljava/lang/String;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v10, v10, Lvoo;->i:Ljava/lang/String;

    :try_start_bd
    invoke-virtual {v4, v10, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_c0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_bd .. :try_end_c0} :catch_c2

    move v4, v2

    goto :goto_c3

    :catch_c2
    move v4, v3

    :goto_c3
    xor-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move/from16 v4, v16

    move-object/from16 v10, v18

    move-object/from16 v16, v2

    invoke-direct/range {v10 .. v16}, Lqxo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static/range {v18 .. v18}, Lp8p;->a(Lp8p;)V

    move v13, v4

    goto :goto_99

    :cond_d6
    move v4, v13

    move v2, v14

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_dc
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_10a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lvoo;

    sget-object v11, Lapo;->a:Ljava/util/HashMap;

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    if-nez v13, :cond_fc

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v11, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v11, v3

    goto :goto_103

    :cond_fc
    invoke-interface {v13, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v11

    :goto_103
    invoke-interface {v13, v11, v10}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-static {v10}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_dc

    :cond_10a
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_117
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_129

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lvoo;

    iget-object v10, v10, Lvoo;->l:Lfuo;

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_117

    :cond_129
    iput-object v2, v7, Lvdp;->d:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_138
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_14a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvoo;

    iget-object v4, v4, Lvoo;->j:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_138

    :cond_14a
    iput-object v2, v7, Lvdp;->e:Ljava/util/ArrayList;

    sget-object v1, Lapo;->a:Ljava/util/HashMap;

    iget-object v1, v8, Lpro;->b:Lsm;

    sget-object v2, Lapo;->a:Ljava/util/HashMap;

    invoke-virtual {v2, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_180

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_15e
    :goto_15e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_177

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvoo;

    invoke-virtual {v7}, Lvoo;->a()Z

    move-result v10

    if-eqz v10, :cond_15e

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_15e

    :cond_177
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_180

    invoke-virtual {v2, v12}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_180
    invoke-virtual {v2, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_221

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_221

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_197
    :goto_197
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1fa

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Lvoo;

    iget-object v13, v8, Lpro;->f:Ljava/lang/Boolean;

    iget-object v14, v11, Lvoo;->l:Lfuo;

    iget-object v11, v11, Lvoo;->b:Lpro;

    iget-object v15, v1, Lsm;->a:Ljava/util/List;

    invoke-interface {v15, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_197

    iget-object v14, v11, Lpro;->b:Lsm;

    if-ne v1, v14, :cond_197

    sget-object v14, Lsm;->d:Lsm;

    if-ne v1, v14, :cond_1c4

    iget-object v14, v8, Lpro;->c:Leq;

    iget-object v15, v11, Lpro;->c:Leq;

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_197

    :cond_1c4
    iget-object v14, v11, Lpro;->d:Lwjo;

    if-ne v9, v14, :cond_197

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1d8

    iget-object v14, v11, Lpro;->f:Ljava/lang/Boolean;

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_197

    :cond_1d8
    iget-object v13, v8, Lpro;->g:Ljava/lang/String;

    iget-object v14, v11, Lpro;->g:Ljava/lang/String;

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_197

    iget-object v13, v8, Lpro;->h:Ljava/lang/String;

    iget-object v14, v11, Lpro;->h:Ljava/lang/String;

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_197

    iget-object v13, v8, Lpro;->i:Lkotlinx/serialization/json/c;

    iget-object v11, v11, Lpro;->i:Lkotlinx/serialization/json/c;

    invoke-static {v13, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_197

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_197

    :cond_1fa
    new-instance v1, Lw8l;

    const/16 v7, 0xe

    invoke-direct {v1, v7}, Lw8l;-><init>(B)V

    invoke-static {v1, v6}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_221

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvoo;

    invoke-interface {v4, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_21d

    invoke-virtual {v2, v12}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_21d
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_222

    :cond_221
    const/4 v1, 0x0

    :goto_222
    if-eqz v1, :cond_227

    sget-object v2, Lt0i;->b:Lp0i;

    goto :goto_237

    :cond_227
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lvjo;

    const/16 v2, 0x65

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance v2, Lq0i;

    invoke-direct {v2, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v1, v2

    :goto_237
    new-instance v2, Lt0i;

    invoke-direct {v2, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v2}, Lkgo;->invoke(Ljava/lang/Object;)V

    :cond_23f
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_260

    instance-of v0, v3, Lvjo;

    if-nez v0, :cond_24a

    const/4 v3, 0x0

    :cond_24a
    if-nez v3, :cond_253

    new-instance v3, Lvjo;

    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-direct {v3, v0, v1}, Lvjo;-><init>(ILjava/lang/String;)V

    :cond_253
    new-instance v0, Lq0i;

    invoke-direct {v0, v3}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lt0i;

    invoke-direct {v1, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v1}, Lkgo;->invoke(Ljava/lang/Object;)V

    :cond_260
    return-void
.end method
