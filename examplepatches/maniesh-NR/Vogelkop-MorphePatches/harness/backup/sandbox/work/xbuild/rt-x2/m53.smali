.class public final Lm53;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lm53;->i:B

    sget-object v0, Lwjo;->b:Lwjo;

    iput-object p1, p0, Lm53;->j:Ljava/lang/Object;

    iput-object p2, p0, Lm53;->k:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Lm53;->i:B

    iput-object p1, p0, Lm53;->j:Ljava/lang/Object;

    iput-object p2, p0, Lm53;->k:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lm53;->i:B

    const v2, 0x7f0a0bff

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v1, :pswitch_data_4fe

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v4, La3p;

    iget-object v5, v4, La3p;->l:Ljava/lang/String;

    const/16 v6, 0x2f

    invoke-static {v2, v5, v6}, Lo18;->p(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lnwn;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v4, v4, La3p;->a:Ljava/io/File;

    invoke-direct {v5, v0, v4}, Lnwn;-><init>(Landroid/content/Context;Ljava/io/File;)V

    new-instance v0, Llyf;

    invoke-direct {v0, v2, v5}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_41
    if-ge v3, v2, :cond_5c

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Llyf;

    iget-object v5, v4, Llyf;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v4, v4, Llyf;->b:Ljava/lang/Object;

    check-cast v4, Lnwn;

    new-instance v6, Lown;

    invoke-direct {v6, v5, v4}, Lown;-><init>(Ljava/lang/String;Lnwn;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_41

    :cond_5c
    new-instance v1, Lpwn;

    invoke-direct {v1, v0}, Lpwn;-><init>(Ljava/util/ArrayList;)V

    return-object v1

    :pswitch_62
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Ly2p;

    iget-object v2, v1, Ly2p;->z:Lc4p;

    iget-object v2, v2, Lc4p;->p:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_aa

    invoke-static {v2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7a

    move-object v15, v2

    goto :goto_7b

    :cond_7a
    move-object v15, v5

    :goto_7b
    if-eqz v15, :cond_aa

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Loho;

    iget-object v0, v0, Loho;->l:Lsho;

    iget-object v0, v0, Lsho;->e:Liio;

    if-eqz v0, :cond_aa

    new-instance v6, Lylp;

    iget-object v7, v1, Lvoo;->w:Lddp;

    iget-object v8, v1, Lvoo;->b:Lpro;

    iget-object v9, v1, Lvoo;->c:Ljava/lang/String;

    iget-object v10, v1, Lvoo;->d:Ljava/lang/String;

    iget-object v11, v1, Lvoo;->e:Ljava/lang/String;

    iget-object v12, v1, Lvoo;->f:Ljava/lang/String;

    iget-object v13, v1, Lvoo;->g:Lgzo;

    iget-object v14, v1, Lvoo;->a:Loho;

    const/16 v17, 0x0

    const/16 v18, 0x400

    move-object/from16 v16, v0

    invoke-direct/range {v6 .. v18}, Lylp;-><init>(Lddp;Lpro;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgzo;Loho;Ljava/lang/String;Liio;ZI)V

    iget-object v0, v1, Lvoo;->x:Ljava/io/File;

    if-eqz v0, :cond_a7

    move-object v5, v0

    :cond_a7
    iput-object v5, v6, Lvoo;->x:Ljava/io/File;

    move-object v5, v6

    :cond_aa
    return-object v5

    :pswitch_ab
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Landroid/util/Size;

    if-eqz v1, :cond_da

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ltqo;

    iget-object v0, v0, Ltqo;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    iget-object v2, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    if-lez v3, :cond_d6

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    :cond_d6
    invoke-static {v1, v2, v0}, Lelp;->c(Landroid/util/Size;II)Landroid/util/Size;

    move-result-object v5

    :cond_da
    return-object v5

    :pswitch_db
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Saved "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_fa
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unsampled trapped exception ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "): "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_119
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Trapped exception ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "): "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_138
    sget-object v1, Ljso;->a:Lads_mobile_sdk/ob1;

    new-instance v1, Ljava/lang/ref/WeakReference;

    iget-object v2, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Landroid/app/Application;

    new-instance v2, Lads_mobile_sdk/sb0;

    invoke-direct {v2, v0, v0, v1}, Lads_mobile_sdk/sb0;-><init>(Landroid/app/Application;Landroid/app/Application;Ljava/lang/ref/WeakReference;)V

    return-object v2

    :pswitch_14d
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lads_mobile_sdk/q6;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lads_mobile_sdk/q6;->a(Landroid/view/View;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_15b
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lads_mobile_sdk/gj1;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lj7p;

    iget-object v2, v1, Lads_mobile_sdk/gj1;->e:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_16d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lads_mobile_sdk/q6;

    invoke-virtual {v3}, Lads_mobile_sdk/q6;->a()V

    goto :goto_16d

    :cond_17d
    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    new-instance v3, Lads_mobile_sdk/ej1;

    invoke-direct {v3, v1, v0, v2}, Lads_mobile_sdk/ej1;-><init>(Lads_mobile_sdk/gj1;Lj7p;Ljava/util/Timer;)V

    const-wide/16 v0, 0x3e8

    invoke-virtual {v2, v3, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18f
    sget-object v1, Lads_mobile_sdk/fw0;->I:Lads_mobile_sdk/fw0;

    sget-object v2, Ll08;->a:Ll08;

    iget-object v6, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v6, Lprb;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lh07;

    invoke-static {v1, v2, v4}, Lads_mobile_sdk/hh3;->a(Lads_mobile_sdk/fw0;Ljava/util/List;Z)Lads_mobile_sdk/rg3;

    move-result-object v1

    :try_start_19f
    const-string v2, "responses"

    invoke-virtual {v6, v2}, Lprb;->v(Ljava/lang/String;)Lwpb;

    move-result-object v2

    iget-object v4, v2, Lwpb;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1ba

    iget-object v2, v2, Lwpb;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpqb;

    invoke-virtual {v2}, Lpqb;->h()Lprb;

    move-result-object v2

    goto :goto_1bb

    :cond_1ba
    move-object v2, v5

    :goto_1bb
    if-eqz v2, :cond_1c4

    const-string v4, "ad_configs"

    invoke-virtual {v2, v4}, Lprb;->v(Ljava/lang/String;)Lwpb;

    move-result-object v4

    goto :goto_1c5

    :cond_1c4
    move-object v4, v5

    :goto_1c5
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    if-eqz v4, :cond_1f7

    iget-object v4, v4, Lwpb;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v3

    move v10, v9

    :goto_1d4
    if-ge v10, v8, :cond_1f7

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v12, v9, 0x1

    if-ltz v9, :cond_1f3

    check-cast v11, Lpqb;

    sget-object v13, Lads_mobile_sdk/a2;->D0:Ljava/util/List;

    invoke-virtual {v11}, Lpqb;->h()Lprb;

    move-result-object v11

    invoke-static {v11, v9, v0}, Lmfh;->b(Lprb;ILh07;)Lads_mobile_sdk/a2;

    move-result-object v9

    if-eqz v9, :cond_1f1

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1f1
    move v9, v12

    goto :goto_1d4

    :cond_1f3
    invoke-static {}, Lj95;->n()V

    throw v5

    :cond_1f7
    if-eqz v2, :cond_200

    const-string v0, "common"

    invoke-virtual {v2, v0}, Lprb;->w(Ljava/lang/String;)Lprb;

    move-result-object v0

    goto :goto_201

    :cond_200
    move-object v0, v5

    :goto_201
    invoke-static {v0}, Lioh;->e(Lprb;)Lads_mobile_sdk/xv;

    move-result-object v2

    const-string v0, "actions"

    invoke-virtual {v6, v0}, Lprb;->u(Ljava/lang/String;)Lpqb;

    move-result-object v0

    if-eqz v0, :cond_212

    invoke-virtual {v0}, Lpqb;->g()Lwpb;

    move-result-object v0

    goto :goto_213

    :cond_212
    move-object v0, v5

    :goto_213
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_276

    iget-object v6, v0, Lwpb;->a:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v0, v3

    :goto_221
    if-ge v0, v8, :cond_276

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v10, v0, 0x1

    add-int/lit8 v11, v3, 0x1

    if-ltz v3, :cond_272

    check-cast v9, Lpqb;

    invoke-virtual {v9}, Lpqb;->h()Lprb;

    move-result-object v0
    :try_end_233
    .catchall {:try_start_19f .. :try_end_233} :catchall_27f

    :try_start_233
    new-instance v3, Lads_mobile_sdk/h13;

    const-string v9, "name"

    invoke-virtual {v0, v9}, Lprb;->u(Ljava/lang/String;)Lpqb;

    move-result-object v9

    invoke-virtual {v9}, Lpqb;->n()Ljava/lang/String;

    move-result-object v9

    const-string v12, "info"

    invoke-virtual {v0, v12}, Lprb;->u(Ljava/lang/String;)Lpqb;

    move-result-object v0

    if-eqz v0, :cond_24c

    invoke-virtual {v0}, Lpqb;->h()Lprb;

    move-result-object v0

    goto :goto_24d

    :cond_24c
    move-object v0, v5

    :goto_24d
    invoke-direct {v3, v0, v9}, Lads_mobile_sdk/h13;-><init>(Lprb;Ljava/lang/String;)V
    :try_end_250
    .catch Ljava/lang/Exception; {:try_start_233 .. :try_end_250} :catch_251
    .catchall {:try_start_233 .. :try_end_250} :catchall_27f

    goto :goto_26a

    :catch_251
    move-exception v0

    :try_start_252
    invoke-static {v0}, Lw8h;->a(Ljava/lang/Exception;)Lads_mobile_sdk/ub2;

    move-result-object v3

    iget-object v3, v3, Lads_mobile_sdk/ub2;->s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_266

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    :cond_266
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v3, v5

    :goto_26a
    if-eqz v3, :cond_26f

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_26f
    move v0, v10

    move v3, v11

    goto :goto_221

    :cond_272
    invoke-static {}, Lj95;->n()V

    throw v5

    :cond_276
    new-instance v0, Lads_mobile_sdk/j13;

    invoke-direct {v0, v7, v2, v4}, Lads_mobile_sdk/j13;-><init>(Ljava/util/ArrayList;Lads_mobile_sdk/xv;Ljava/util/ArrayList;)V
    :try_end_27b
    .catchall {:try_start_252 .. :try_end_27b} :catchall_27f

    invoke-virtual {v1}, Lads_mobile_sdk/rg3;->close()V

    return-object v0

    :catchall_27f
    move-exception v0

    :try_start_280
    invoke-virtual {v1, v0}, Lads_mobile_sdk/rg3;->b(Ljava/lang/Throwable;)V

    instance-of v2, v0, Liyo;

    if-nez v2, :cond_2ad

    invoke-virtual {v1, v0}, Lads_mobile_sdk/rg3;->a(Ljava/lang/Throwable;)V

    instance-of v2, v0, Lkql;

    if-nez v2, :cond_2a5

    instance-of v2, v0, Ljava/util/concurrent/CancellationException;

    if-nez v2, :cond_29d

    instance-of v2, v0, Lads_mobile_sdk/mv0;

    if-eqz v2, :cond_297

    throw v0

    :cond_297
    new-instance v2, Lads_mobile_sdk/tu0;

    invoke-direct {v2, v0}, Lads_mobile_sdk/tu0;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :cond_29d
    new-instance v2, Lads_mobile_sdk/ou0;

    check-cast v0, Ljava/util/concurrent/CancellationException;

    invoke-direct {v2, v0}, Lads_mobile_sdk/ou0;-><init>(Ljava/util/concurrent/CancellationException;)V

    throw v2

    :cond_2a5
    new-instance v2, Lads_mobile_sdk/uw0;

    check-cast v0, Lkql;

    invoke-direct {v2, v0}, Lads_mobile_sdk/uw0;-><init>(Lkql;)V

    throw v2

    :cond_2ad
    throw v0
    :try_end_2ae
    .catchall {:try_start_280 .. :try_end_2ae} :catchall_2ae

    :catchall_2ae
    move-exception v0

    move-object v2, v0

    :try_start_2b0
    throw v2
    :try_end_2b1
    .catchall {:try_start_2b0 .. :try_end_2b1} :catchall_2b1

    :catchall_2b1
    move-exception v0

    invoke-static {v1, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_2b6
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lami;

    iget-object v1, v1, Lami;->h:Ljava/lang/Object;

    check-cast v1, La33;

    new-instance v2, Ln48;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Ln48;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, v1, La33;->b:Lz6j;

    iget-object v0, v0, Lz6j;->b:Lpac;

    iget-object v3, v1, La33;->h:Lra7;

    new-instance v6, Lvr;

    const/4 v7, 0x5

    invoke-direct {v6, v1, v0, v5, v7}, Lvr;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-virtual {v3, v6}, Lra7;->a(Lkotlin/jvm/functions/Function2;)Lua7;

    move-result-object v3

    new-instance v5, Lrd1;

    invoke-direct {v5, v1, v2, v0, v4}, Lrd1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v5}, Lua7;->I(Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e3
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFData;

    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f1
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    new-instance v2, Lfwm;

    new-instance v3, Lhwm;

    const-string v4, ""

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-direct {v3, v4, v0}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v2, v3}, Lfwm;-><init>(Lhwm;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_30b
    sget-object v1, Lnwm;->a:Lnwm;

    invoke-static {}, Lnwm;->c()Ls5d;

    move-result-object v1

    if-eqz v1, :cond_31e

    invoke-virtual {v1}, Ls5d;->e()Lowm;

    move-result-object v1

    if-eqz v1, :cond_31e

    const-string v2, "Initialize is being invoked more than once, make sure this is the intended behaviour."

    invoke-interface {v1, v2, v5}, Lowm;->b(Ljava/lang/String;Lhwm;)V

    :cond_31e
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lcom/usercentrics/sdk/UsercentricsOptions;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v1, v0}, Lnwm;->a(Lcom/usercentrics/sdk/UsercentricsOptions;Landroid/content/Context;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_32c
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lcom/usercentrics/sdk/UsercentricsDialog;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lcom/usercentrics/sdk/UsercentricsLayout;

    invoke-virtual {v1, v0}, Lcom/usercentrics/sdk/UsercentricsDialog;->h(Lcom/usercentrics/sdk/UsercentricsLayout;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33a
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lcom/usercentrics/sdk/UsercentricsDialog;

    invoke-virtual {v1}, Lcom/usercentrics/sdk/UsercentricsDialog;->e()V

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_34b
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lshf;

    iget-object v1, v1, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Llrk;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lxqg;

    invoke-virtual {v1, v0}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35d
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lshf;

    iget-object v1, v1, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Llrk;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lgrg;

    invoke-virtual {v1, v0}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_36f
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lshf;

    iget-object v1, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Llrk;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_381
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lcom/usercentrics/sdk/ui/secondLayer/component/footer/UCSecondLayerFooter;

    iget-object v1, v1, Lcom/usercentrics/sdk/ui/secondLayer/component/footer/UCSecondLayerFooter;->u:Lxem;

    if-eqz v1, :cond_38a

    move-object v5, v1

    :cond_38a
    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lxbm;

    iget-object v0, v0, Lxbm;->g:Lccm;

    iget-object v1, v5, Lxem;->f:Lkfm;

    invoke-virtual {v1, v0}, Lkfm;->c(Lccm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_398
    new-instance v1, Landroidx/core/widget/NestedScrollView;

    iget-object v3, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    invoke-direct {v1, v3, v5}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ludm;

    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    invoke-virtual {v0, v4}, Lafc;->setOrientation(I)V

    iget-boolean v0, v1, Landroidx/core/widget/NestedScrollView;->l:Z

    if-eq v4, v0, :cond_3b4

    iput-boolean v4, v1, Landroidx/core/widget/NestedScrollView;->l:Z

    invoke-virtual {v1}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    :cond_3b4
    return-object v1

    :pswitch_3b5
    new-instance v1, Landroidx/core/widget/NestedScrollView;

    iget-object v3, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    invoke-direct {v1, v3, v5}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lvcm;

    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    invoke-virtual {v0, v4}, Lafc;->setOrientation(I)V

    iget-boolean v0, v1, Landroidx/core/widget/NestedScrollView;->l:Z

    if-eq v4, v0, :cond_3d1

    iput-boolean v4, v1, Landroidx/core/widget/NestedScrollView;->l:Z

    invoke-virtual {v1}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    :cond_3d1
    return-object v1

    :pswitch_3d2
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lufm;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3eb
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_423

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v4, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_406
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_41f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgqg;

    sget-object v7, Lxbm;->Companion:Lwbm;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6, v0}, Lwbm;->a(Lgqg;Lufm;)Lxbm;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_406

    :cond_41f
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3eb

    :cond_423
    return-object v2

    :pswitch_424
    new-instance v1, Lo7p;

    iget-object v2, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    sget-object v3, Lwjo;->b:Lwjo;

    new-instance v4, Lpro;

    sget-object v6, Lsm;->c:Lsm;

    invoke-direct {v4, v0, v6, v5, v3}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    new-instance v0, Lvdp;

    invoke-direct {v0, v4}, Lvdp;-><init>(Lpro;)V

    new-instance v3, Lq5p;

    sget-object v5, Lwjh;->i:Lcpj;

    invoke-virtual {v5, v2}, Lcpj;->b(Landroid/content/Context;)Lwjh;

    move-result-object v5

    new-instance v6, Lwtm;

    sget-object v7, Lydp;->n:Lydp;

    invoke-direct {v6, v2, v7, v0}, Lwtm;-><init>(Landroid/content/Context;Lqro;Lvdp;)V

    invoke-direct {v3, v4, v0, v5, v6}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v1, v2, v3}, Lo7p;-><init>(Landroid/content/Context;Lq5p;)V

    return-object v1

    :pswitch_452
    new-instance v1, Lyoo;

    iget-object v2, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v2, Lk8;

    iget-object v2, v2, Lk8;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lpro;

    new-instance v3, Lvdp;

    invoke-direct {v3, v0}, Lvdp;-><init>(Lpro;)V

    new-instance v4, Lq5p;

    sget-object v5, Lwjh;->i:Lcpj;

    invoke-virtual {v5, v2}, Lcpj;->b(Landroid/content/Context;)Lwjh;

    move-result-object v5

    new-instance v6, Lwtm;

    sget-object v7, Lujp;->u:Lujp;

    invoke-direct {v6, v2, v7, v3}, Lwtm;-><init>(Landroid/content/Context;Lqro;Lvdp;)V

    invoke-direct {v4, v0, v3, v5, v6}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v1, v2, v4}, Lpxo;-><init>(Landroid/content/Context;Lr22;)V

    return-object v1

    :pswitch_47b
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lb11;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1, v0}, Lb11;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_489
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lb11;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1, v0}, Lb11;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_497
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lvn5;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Lcom/usercentrics/sdk/v2/consent/data/SaveConsentsData;

    iget-object v2, v1, Lvn5;->a:Lra7;

    new-instance v3, Lun5;

    invoke-direct {v3, v1, v0, v5, v4}, Lun5;-><init>(Lvn5;Lcom/usercentrics/sdk/v2/consent/data/SaveConsentsData;Lmt5;B)V

    invoke-virtual {v2, v3}, Lra7;->a(Lkotlin/jvm/functions/Function2;)Lua7;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4ac
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lx4o;

    iget-object v2, v1, Lx4o;->c:Landroidx/work/impl/WorkDatabase;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/UUID;

    new-instance v4, Lfh4;

    invoke-direct {v4, v1, v0, v3}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lj3i;

    const/4 v3, 0x2

    invoke-direct {v0, v4, v3}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Ly5i;->u(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    iget-object v0, v1, Lx4o;->b:Ljl5;

    iget-object v2, v1, Lx4o;->c:Landroidx/work/impl/WorkDatabase;

    iget-object v1, v1, Lx4o;->e:Ljava/util/List;

    invoke-static {v0, v2, v1}, Lymi;->b(Ljl5;Landroidx/work/impl/WorkDatabase;Ljava/util/List;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4d3
    iget-object v1, v0, Lm53;->j:Ljava/lang/Object;

    check-cast v1, Lo53;

    iget-object v1, v1, Lo53;->a:Lk73;

    iget-object v0, v0, Lm53;->k:Ljava/lang/Object;

    check-cast v0, Ln53;

    iget-object v2, v1, Lk73;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_4e0
    iget-object v3, v1, Lk73;->e:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashSet;

    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4f7

    iget-object v0, v1, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4f7

    invoke-virtual {v1}, Lk73;->A()V
    :try_end_4f7
    .catchall {:try_start_4e0 .. :try_end_4f7} :catchall_4fb

    :cond_4f7
    monitor-exit v2

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_4fb
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_data_4fe
    .packed-switch 0x0
        :pswitch_4d3
        :pswitch_4ac
        :pswitch_497
        :pswitch_489
        :pswitch_47b
        :pswitch_452
        :pswitch_424
        :pswitch_3d2
        :pswitch_3b5
        :pswitch_398
        :pswitch_381
        :pswitch_36f
        :pswitch_35d
        :pswitch_34b
        :pswitch_33a
        :pswitch_32c
        :pswitch_30b
        :pswitch_2f1
        :pswitch_2e3
        :pswitch_2b6
        :pswitch_18f
        :pswitch_15b
        :pswitch_14d
        :pswitch_138
        :pswitch_119
        :pswitch_fa
        :pswitch_db
        :pswitch_ab
        :pswitch_62
    .end packed-switch
.end method
