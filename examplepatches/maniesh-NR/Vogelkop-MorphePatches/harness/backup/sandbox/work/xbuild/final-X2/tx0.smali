.class public final synthetic Ltx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;B)V
    .registers 4

    .line 10
    iput-byte p3, p0, Ltx0;->a:B

    iput-object p2, p0, Ltx0;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Ltx0;->a:B

    iput-object p1, p0, Ltx0;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lob2;)V
    .registers 3

    const/4 p2, 0x7

    iput-byte p2, p0, Ltx0;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltx0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Ltx0;->a:B

    const-string v2, "domain"

    const-string v3, "flags"

    const-string v4, "timeStamp"

    const-string v5, "imageUrl"

    const-string v6, "pageUrl"

    const/4 v7, 0x5

    const-wide/16 v8, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    iget-object v0, v0, Ltx0;->b:Ljava/lang/String;

    packed-switch v1, :pswitch_data_380

    move-object/from16 v1, p1

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->c()Ltb0;

    move-result-object v1

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    iget-object v1, v1, Ltb0;->b:Lq56;

    invoke-virtual {v1, v12}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_3b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3b

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v12, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_48

    :cond_3b
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v12, v11, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v12, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_48
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_54
    move-object/from16 v1, p1

    check-cast v1, La70;

    iget-object v2, v1, La70;->a:Lz60;

    if-nez v0, :cond_5e

    move v3, v12

    goto :goto_5f

    :cond_5e
    move v3, v11

    :goto_5f
    invoke-virtual {v2, v12, v3, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, v1, La70;->a:Lz60;

    invoke-virtual {v0, v11, v11, v8, v9}, Ljf0;->p(IIJ)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6a
    move-object/from16 v1, p1

    check-cast v1, La70;

    iget-object v2, v1, La70;->a:Lz60;

    if-nez v0, :cond_74

    move v3, v12

    goto :goto_75

    :cond_74
    move v3, v11

    :goto_75
    invoke-virtual {v2, v12, v3, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, v1, La70;->a:Lz60;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v11, v8, v9}, Ljf0;->p(IIJ)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_81
    move-object/from16 v1, p1

    check-cast v1, Llk0;

    new-instance v2, Lzbe;

    const/16 v3, 0x15

    invoke-direct {v2, v3}, Lzbe;-><init>(B)V

    invoke-virtual {v1, v0, v2}, Llk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_92
    move-object/from16 v1, p1

    check-cast v1, Llk0;

    new-instance v2, Lzbe;

    const/16 v3, 0x13

    invoke-direct {v2, v3}, Lzbe;-><init>(B)V

    invoke-virtual {v1, v0, v2}, Llk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a3
    move-object/from16 v1, p1

    check-cast v1, Llk0;

    new-instance v2, Lzbe;

    const/16 v3, 0x14

    invoke-direct {v2, v3}, Lzbe;-><init>(B)V

    invoke-virtual {v1, v0, v2}, Llk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b4
    move-object/from16 v1, p1

    check-cast v1, Lfd0;

    iget-object v1, v1, Lfd0;->a:Led0;

    invoke-virtual {v1, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_ce

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_ce

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v11, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_db

    :cond_ce
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v11, v11, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v11, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_db
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e5
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    invoke-static {v1, v0}, Lo0j;->g(Lq0j;Ljava/lang/String;)V

    sget-object v0, Ln0j;->u:Lp0j;

    sget-object v2, Lo0j;->a:[Lxtb;

    const/16 v3, 0xb

    aget-object v2, v2, v3

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, v0, v2}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_102
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_10c
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_116
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    invoke-static {v1, v0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    invoke-static {v1, v7}, Lo0j;->h(Lq0j;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_123
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    invoke-static {v1, v0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    invoke-static {v1, v7}, Lo0j;->h(Lq0j;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_130
    const-string v1, "DELETE FROM entry WHERE storageId = ?"

    move-object/from16 v2, p1

    check-cast v2, Losk;

    invoke-virtual {v2, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_13a
    invoke-virtual {v1, v11, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-virtual {v1}, Lwsk;->n()Z
    :try_end_140
    .catchall {:try_start_13a .. :try_end_140} :catchall_146

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_146
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_14b
    move-object/from16 v1, p1

    check-cast v1, Llee;

    sget-object v2, Lr9a;->d:Lhsg;

    invoke-virtual {v1, v2, v0}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    invoke-static {v1, v0}, Lr9a;->d(Llee;Ljava/lang/String;)V

    return-object v10

    :pswitch_158
    move-object/from16 v1, p1

    check-cast v1, Lb0a;

    invoke-interface {v1}, Lb0a;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_169
    const-string v1, "SELECT * FROM entry WHERE pageUrl = ?"

    move-object/from16 v2, p1

    check-cast v2, Losk;

    invoke-virtual {v2, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_173
    invoke-virtual {v1, v11, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v5

    if-eqz v5, :cond_1aa

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_19a

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v10

    :cond_19a
    move-object v14, v10

    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v15

    invoke-virtual {v1, v3}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v13, v2

    new-instance v11, Lx4l;

    invoke-direct/range {v11 .. v16}, Lx4l;-><init>(Ljava/lang/String;ILjava/lang/String;J)V
    :try_end_1a9
    .catchall {:try_start_173 .. :try_end_1a9} :catchall_1ae

    move-object v10, v11

    :cond_1aa
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v10

    :catchall_1ae
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_1b3
    const-string v1, "SELECT * FROM entry WHERE pageUrl LIKE ?|| \'%\'"

    move-object/from16 v2, p1

    check-cast v2, Losk;

    invoke-virtual {v2, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_1bd
    invoke-virtual {v1, v11, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :goto_1d5
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v6

    if-eqz v6, :cond_1fe

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_1e7

    move-object v14, v10

    goto :goto_1ec

    :cond_1e7
    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v6

    move-object v14, v6

    :goto_1ec
    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v15

    invoke-virtual {v1, v3}, Lwsk;->getLong(I)J

    move-result-wide v6

    long-to-int v13, v6

    new-instance v11, Lx4l;

    invoke-direct/range {v11 .. v16}, Lx4l;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1fd
    .catchall {:try_start_1bd .. :try_end_1fd} :catchall_202

    goto :goto_1d5

    :cond_1fe
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v5

    :catchall_202
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_207
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    invoke-static {v1, v0}, Lo0j;->g(Lq0j;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_211
    move-object/from16 v1, p1

    check-cast v1, Lb65;

    iget-object v1, v1, Lb65;->b:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "opera-aria"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_231

    const-string v2, "s"

    invoke-static {v1, v2}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :cond_231
    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_23a
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    invoke-static {v1, v12}, Lo0j;->h(Lq0j;I)V

    invoke-static {v1, v0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_247
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    sget-object v2, Lo0j;->a:[Lxtb;

    sget-object v2, Ln0j;->k:Lp0j;

    sget-object v3, Lo0j;->a:[Lxtb;

    const/4 v4, 0x3

    aget-object v3, v3, v4

    new-instance v3, Lnkc;

    invoke-direct {v3, v11}, Lnkc;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, v2, v3}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    invoke-static {v1, v0}, Lo0j;->g(Lq0j;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_265
    const-string v1, "SELECT * FROM whitelisted_domains WHERE ? == domain LIMIT 1"

    move-object/from16 v3, p1

    check-cast v3, Losk;

    invoke-virtual {v3, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_26f
    invoke-virtual {v1, v11, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v2

    if-eqz v2, :cond_285

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    new-instance v10, Ls0o;

    invoke-direct {v10, v0}, Ls0o;-><init>(Ljava/lang/String;)V
    :try_end_285
    .catchall {:try_start_26f .. :try_end_285} :catchall_289

    :cond_285
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v10

    :catchall_289
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_28e
    const-string v1, "SELECT * FROM asset_links WHERE ? == domain"

    move-object/from16 v3, p1

    check-cast v3, Losk;

    invoke-virtual {v3, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_298
    invoke-virtual {v1, v11, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "relation"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "namespace"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "packageName"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "sha256CertFingerprints"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "timestamp"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :goto_2c2
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v8

    if-eqz v8, :cond_317

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lrpb;->d:Lqpb;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lk72;

    sget-object v13, Lxhk;->a:Lxhk;

    invoke-direct {v11, v13, v12}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v9, v8, v11}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Ljava/util/List;

    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_2ec

    move-object/from16 v16, v10

    goto :goto_2f2

    :cond_2ec
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v8

    :goto_2f2
    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v1, v5}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lk72;

    invoke-direct {v11, v13, v12}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v9, v8, v11}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v18, v8

    check-cast v18, Ljava/util/List;

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v19

    new-instance v13, Lpb2;

    invoke-direct/range {v13 .. v20}, Lpb2;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_316
    .catchall {:try_start_298 .. :try_end_316} :catchall_31b

    goto :goto_2c2

    :cond_317
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v7

    :catchall_31b
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_320
    move-object/from16 v1, p1

    check-cast v1, Ljx1;

    invoke-interface {v1}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_331
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33b
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_345
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_34f
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {v1, v11, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35c
    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v12, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_366
    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Pair;

    iget-object v1, v1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_37a

    invoke-static {v1, v0, v12}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_37b

    :cond_37a
    move v11, v12

    :cond_37b
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_data_380
    .packed-switch 0x0
        :pswitch_366
        :pswitch_35c
        :pswitch_34f
        :pswitch_345
        :pswitch_33b
        :pswitch_331
        :pswitch_320
        :pswitch_28e
        :pswitch_265
        :pswitch_247
        :pswitch_23a
        :pswitch_211
        :pswitch_207
        :pswitch_1b3
        :pswitch_169
        :pswitch_158
        :pswitch_14b
        :pswitch_130
        :pswitch_123
        :pswitch_116
        :pswitch_10c
        :pswitch_102
        :pswitch_e5
        :pswitch_b4
        :pswitch_a3
        :pswitch_92
        :pswitch_81
        :pswitch_6a
        :pswitch_54
    .end packed-switch
.end method
