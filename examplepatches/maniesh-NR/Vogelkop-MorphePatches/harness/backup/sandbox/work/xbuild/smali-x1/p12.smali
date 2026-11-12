.class public final Lp12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt43;


# static fields
.field public static i:Ljava/util/ArrayList;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 5

    sparse-switch p1, :sswitch_data_c8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x10

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->a:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->b:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->c:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->d:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->e:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->f:Ljava/lang/Object;

    new-array v0, p1, [I

    iput-object v0, p0, Lp12;->g:Ljava/lang/Object;

    new-array p1, p1, [I

    iput-object p1, p0, Lp12;->h:Ljava/lang/Object;

    return-void

    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Lp12;->a:Ljava/lang/Object;

    new-instance v0, Lp0g;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Lp0g;-><init>(F)V

    iput-object v0, p0, Lp12;->b:Ljava/lang/Object;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Lp12;->c:Ljava/lang/Object;

    new-instance v0, Lp0g;

    invoke-direct {v0, v1}, Lp0g;-><init>(F)V

    iput-object v0, p0, Lp12;->d:Ljava/lang/Object;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Lp12;->e:Ljava/lang/Object;

    sget-wide v0, La2m;->b:J

    new-instance v2, La2m;

    invoke-direct {v2, v0, v1}, La2m;-><init>(J)V

    invoke-static {v2}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Lp12;->f:Ljava/lang/Object;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lp12;->g:Ljava/lang/Object;

    sget-wide v0, Lu95;->f:J

    new-instance p1, Lu95;

    invoke-direct {p1, v0, v1}, Lu95;-><init>(J)V

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lp12;->h:Ljava/lang/Object;

    return-void

    :sswitch_71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp12;->b:Ljava/lang/Object;

    sget-object p1, Lq0b;->c:Lq0b;

    iput-object p1, p0, Lp12;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lp12;->g:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lp12;->h:Ljava/lang/Object;

    return-void

    :sswitch_8e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Limi;->a:[J

    new-instance p1, Lsee;

    invoke-direct {p1}, Lsee;-><init>()V

    iput-object p1, p0, Lp12;->a:Ljava/lang/Object;

    sget-object p1, Ljmi;->a:Ltee;

    new-instance p1, Ltee;

    invoke-direct {p1}, Ltee;-><init>()V

    iput-object p1, p0, Lp12;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lp12;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lp12;->e:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lp12;->f:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lp12;->g:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lp12;->h:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_c8
    .sparse-switch
        0x8 -> :sswitch_8e
        0x9 -> :sswitch_71
        0x10 -> :sswitch_29
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lgjm;Lyv3;Lqsh;Lg7m;)V
    .registers 6

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput-object p1, p0, Lp12;->a:Ljava/lang/Object;

    .line 203
    iput-object p2, p0, Lp12;->b:Ljava/lang/Object;

    .line 204
    iput-object p3, p0, Lp12;->c:Ljava/lang/Object;

    .line 205
    iput-object p4, p0, Lp12;->d:Ljava/lang/Object;

    .line 206
    iput-object p5, p0, Lp12;->e:Ljava/lang/Object;

    .line 207
    new-instance p1, Lqs7;

    const/16 p2, 0x16

    .line 208
    invoke-direct {p1, p2}, Lqs7;-><init>(B)V

    .line 209
    iput-object p1, p0, Lp12;->f:Ljava/lang/Object;

    .line 210
    new-instance p1, Ly55;

    .line 211
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 212
    iput-object p1, p0, Lp12;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V
    .registers 9

    .line 200
    iput-object p1, p0, Lp12;->a:Ljava/lang/Object;

    iput-object p2, p0, Lp12;->b:Ljava/lang/Object;

    iput-object p3, p0, Lp12;->c:Ljava/lang/Object;

    iput-object p4, p0, Lp12;->d:Ljava/lang/Object;

    iput-object p5, p0, Lp12;->e:Ljava/lang/Object;

    iput-object p6, p0, Lp12;->f:Ljava/lang/Object;

    iput-object p7, p0, Lp12;->g:Ljava/lang/Object;

    iput-object p8, p0, Lp12;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static C([ILn6c;Z)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    aget v1, p0, v0

    invoke-static {p1, p2}, Lcs5;->g0(Ln6c;Z)I

    move-result p1

    add-int/2addr p1, v1

    aput p1, p0, v0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static a(Lp12;Lndc;Ljf4;Lbp3;)Lxcc;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    const-string v3, "CX:bindToLifecycle-internal"

    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_b
    invoke-static {}, Lxug;->i()V

    new-instance v3, Lkotlin/Pair;

    const/4 v4, 0x0

    move-object/from16 v5, p2

    invoke-direct {v3, v5, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v5, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v5, Ljf4;

    iget-object v3, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v3, Ljf4;

    iget-object v6, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v6, Lwg4;

    iget-object v6, v6, Lwg4;->a:Lhf4;

    invoke-virtual {v6}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;

    move-result-object v8

    const/4 v6, 0x1

    invoke-interface {v8, v6}, Lzd4;->q(Z)V

    invoke-virtual {v0, v5}, Lp12;->d(Ljf4;)Lmr;

    move-result-object v10

    const/4 v5, 0x0

    if-eqz v3, :cond_4f

    iget-object v7, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v7, Lwg4;

    iget-object v7, v7, Lwg4;->a:Lhf4;

    invoke-virtual {v7}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;

    move-result-object v7

    invoke-interface {v7, v5}, Lzd4;->q(Z)V

    invoke-virtual {v0, v3}, Lp12;->d(Ljf4;)Lmr;

    move-result-object v3

    move-object v11, v3

    move-object v9, v7

    goto :goto_51

    :cond_4f
    move-object v9, v4

    move-object v11, v9

    :goto_51
    if-eqz v11, :cond_5a

    iget-object v3, v11, Lxj9;->a:Lxd4;

    invoke-interface {v3}, Lxd4;->e()Ljava/lang/String;

    move-result-object v3

    goto :goto_5b

    :cond_5a
    move-object v3, v4

    :goto_5b
    iget-object v7, v10, Lmr;->c:Lec4;

    iget-object v7, v7, Lec4;->a:Lrn2;

    iget-object v12, v10, Lxj9;->a:Lxd4;

    invoke-interface {v12}, Lxd4;->e()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v3, v7}, Ly9m;->v(Ljava/lang/String;Ljava/lang/String;Lrn2;)Ltd4;

    move-result-object v3

    iget-object v7, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v7, Lcdc;

    iget-object v12, v7, Lcdc;->a:Ljava/lang/Object;

    monitor-enter v12
    :try_end_70
    .catchall {:try_start_b .. :try_end_70} :catchall_18e

    :try_start_70
    new-instance v13, Lxn2;

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v14

    invoke-direct {v13, v14, v3}, Lxn2;-><init>(ILtd4;)V

    iget-object v14, v7, Lcdc;->b:Ljava/util/HashMap;

    invoke-virtual {v14, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lxcc;

    if-eqz v13, :cond_a3

    iget-object v14, v13, Lxcc;->c:Lqg4;

    iget-object v15, v14, Lqg4;->a:Lnr;

    iget-object v15, v15, Lnr;->a:Lzd4;

    invoke-interface {v15}, Lzd4;->l()Z

    move-result v15

    if-nez v15, :cond_9b

    iget-object v14, v14, Lqg4;->b:Lnr;

    if-eqz v14, :cond_9c

    iget-object v14, v14, Lnr;->a:Lzd4;

    invoke-interface {v14}, Lzd4;->l()Z

    move-result v14

    if-eqz v14, :cond_9c

    :cond_9b
    move v5, v6

    :cond_9c
    if-eqz v5, :cond_a3

    invoke-virtual {v7, v13}, Lcdc;->l(Lxcc;)V

    monitor-exit v12

    goto :goto_a5

    :cond_a3
    monitor-exit v12
    :try_end_a4
    .catchall {:try_start_70 .. :try_end_a4} :catchall_18c

    move-object v4, v13

    :goto_a5
    :try_start_a5
    iget-object v5, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v5, Lcdc;

    iget-object v7, v5, Lcdc;->a:Ljava/lang/Object;

    monitor-enter v7
    :try_end_ac
    .catchall {:try_start_a5 .. :try_end_ac} :catchall_18e

    :try_start_ac
    iget-object v5, v5, Lcdc;->b:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v5

    monitor-exit v7
    :try_end_b7
    .catchall {:try_start_ac .. :try_end_b7} :catchall_188

    :try_start_b7
    iget-object v7, v2, Lbp3;->h:Ljava/lang/Object;

    check-cast v7, Ljava/util/List;

    check-cast v7, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_c1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_112

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lqrm;

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_d1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_c1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lxcc;

    iget-object v15, v14, Lxcc;->a:Ljava/lang/Object;

    monitor-enter v15
    :try_end_e0
    .catchall {:try_start_b7 .. :try_end_e0} :catchall_18e

    :try_start_e0
    iget-object v6, v14, Lxcc;->c:Lqg4;

    invoke-virtual {v6}, Lqg4;->y()Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    monitor-exit v15
    :try_end_ed
    .catchall {:try_start_e0 .. :try_end_ed} :catchall_110

    if-eqz v6, :cond_d1

    :try_start_ef
    invoke-virtual {v14}, Lxcc;->k()Lndc;

    move-result-object v6

    invoke-static {v6, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_d1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Use case %s already bound to a different lifecycle."

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v6, 0x1

    invoke-static {v2, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_10e
    .catchall {:try_start_ef .. :try_end_10e} :catchall_18e

    :goto_10e
    :try_start_10e
    monitor-exit v15
    :try_end_10f
    .catchall {:try_start_10e .. :try_end_10f} :catchall_110

    :try_start_10f
    throw v0

    :catchall_110
    move-exception v0

    goto :goto_10e

    :cond_112
    if-nez v4, :cond_14d

    iget-object v4, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v4, Lcdc;

    iget-object v5, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v5, Lwg4;

    iget-object v5, v5, Lwg4;->k:Li3j;

    if-eqz v5, :cond_145

    new-instance v7, Lqg4;

    iget-object v6, v5, Li3j;->b:Ljava/lang/Object;

    move-object v12, v6

    check-cast v12, Ltc4;

    iget-object v6, v5, Li3j;->d:Ljava/lang/Object;

    move-object v13, v6

    check-cast v13, Livg;

    iget-object v5, v5, Li3j;->c:Ljava/lang/Object;

    move-object v14, v5

    check-cast v14, Lrg4;

    invoke-direct/range {v7 .. v14}, Lqg4;-><init>(Lzd4;Lzd4;Lmr;Lmr;Ltc4;Livg;Lrg4;)V

    iget-object v5, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v5, Lwg4;

    iget-object v5, v5, Lwg4;->o:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lf8i;

    invoke-virtual {v4, v1, v7, v5}, Lcdc;->b(Lndc;Lqg4;Lf8i;)Lxcc;

    move-result-object v4

    goto :goto_14d

    :cond_145
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraX not initialized yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14d
    :goto_14d
    iget-object v5, v2, Lbp3;->h:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_17a

    iget-object v5, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v5, Lcdc;

    iget-object v6, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v6, Lwg4;

    iget-object v6, v6, Lwg4;->g:Ltah;

    if-eqz v6, :cond_17e

    iget-object v6, v6, Ltah;->f:Ljava/lang/Object;

    check-cast v6, Ltc4;

    invoke-virtual {v5, v4, v2, v6}, Lcdc;->a(Lxcc;Lbp3;Ltc4;)V

    iget-object v0, v0, Lp12;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    new-instance v2, Lxn2;

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {v2, v1, v3}, Lxn2;-><init>(ILtd4;)V

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_17a
    .catchall {:try_start_10f .. :try_end_17a} :catchall_18e

    :cond_17a
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-object v4

    :cond_17e
    :try_start_17e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraX not initialized yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_186
    .catchall {:try_start_17e .. :try_end_186} :catchall_18e

    :goto_186
    :try_start_186
    monitor-exit v7
    :try_end_187
    .catchall {:try_start_186 .. :try_end_187} :catchall_188

    :try_start_187
    throw v0
    :try_end_188
    .catchall {:try_start_187 .. :try_end_188} :catchall_18e

    :catchall_188
    move-exception v0

    goto :goto_186

    :goto_18a
    :try_start_18a
    monitor-exit v12
    :try_end_18b
    .catchall {:try_start_18a .. :try_end_18b} :catchall_18c

    :try_start_18b
    throw v0
    :try_end_18c
    .catchall {:try_start_18b .. :try_end_18c} :catchall_18e

    :catchall_18c
    move-exception v0

    goto :goto_18a

    :catchall_18e
    move-exception v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0
.end method

.method public static c(Ljf4;)Lec4;
    .registers 4

    iget-object p0, p0, Ljf4;->a:Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqbc;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lqbc;->b:Lrn2;

    invoke-static {v0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v1, Lik8;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_20
    sget-object v2, Lik8;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldc4;

    monitor-exit v1

    goto :goto_6

    :goto_2a
    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_20 .. :try_end_2b} :catchall_2c

    throw p0

    :catchall_2c
    move-exception p0

    goto :goto_2a

    :cond_2e
    sget-object p0, Lfc4;->a:Lec4;

    return-object p0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .registers 4

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "play.google.com"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "/store/account/subscriptions"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    if-eqz p0, :cond_1b

    const-string v1, "sku"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_1b
    if-eqz p1, :cond_22

    const-string p0, "package"

    invoke-virtual {v0, p0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_22
    new-instance p0, Landroid/content/Intent;

    const-string p1, "android.intent.action.VIEW"

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.opera.android.extra.DO_NOT_INTERCEPT"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object p0
.end method

.method public static h(Loqe;)Ljava/util/ArrayList;
    .registers 2

    check-cast p0, Lmsh;

    iget-object p0, p0, Lmsh;->A:Lkm5;

    iget-object p0, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-nez p0, :cond_d

    move-object p0, v0

    :cond_d
    check-cast p0, Ljava/util/List;

    const-class v0, Lmsh;

    invoke-static {p0, v0}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static i(Landroid/content/Intent;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.opera.android.action.SHOW_MANAGE_SPACE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "com.opera.android.action.SHOW_WALLET"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "com.opera.android.settings.SITE_SETTING"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2f

    const-string v0, "http://"

    invoke-static {v0, p0}, Lwqm;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2e
    return-object p0

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method

.method public static s(Lwth;Landroid/content/Intent;I)Lfdb;
    .registers 10

    const-string v0, "query"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    const-string v0, "com.opera.android.EXTRA_SEARCH_IN_NEW_TAB"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    const-string v0, "com.opera.android.EXTRA_SEARCH_INCOGNITO_MODE"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x3

    const/4 v4, 0x0

    if-ltz v0, :cond_2e

    invoke-static {v2}, Lvep;->B(I)[I

    move-result-object v6

    array-length v6, v6

    if-ge v0, v6, :cond_2e

    invoke-static {v2}, Lvep;->B(I)[I

    move-result-object v6

    aget v0, v6, v0

    goto :goto_2f

    :cond_2e
    move v0, v4

    :goto_2f
    if-nez v0, :cond_33

    move v6, v2

    goto :goto_34

    :cond_33
    move v6, v0

    :goto_34
    const-string v0, "com.opera.android.EXTRA_SEARCH_URL_ORIGIN"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_53

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ltz p1, :cond_51

    const/16 v0, 0xa

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v1

    array-length v1, v1

    if-ge p1, v1, :cond_51

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    aget v4, v0, p1

    :cond_51
    if-nez v4, :cond_54

    :cond_53
    move v4, p2

    :cond_54
    new-instance v1, Lfdb;

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lfdb;-><init>(Lwth;Ljava/lang/String;IZI)V

    return-object v1
.end method

.method public static y(ZFFFLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;
    .registers 10

    const/4 v0, 0x2

    new-array v1, v0, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const/high16 p2, 0x43160000    # 150.0f

    mul-float/2addr p3, p2

    float-to-long p2, p3

    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    sget-object p2, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p2, Lt05;

    invoke-direct {p2, p5, p6, v0}, Lt05;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    if-nez p0, :cond_2d

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    :cond_2d
    return-object p1
.end method


# virtual methods
.method public final A()V
    .registers 2

    const-string v0, "CX:unbindAll"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_5
    invoke-static {}, Lxug;->i()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lp12;->v(I)V

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lcdc;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Lcdc;->k(Ljava/util/HashSet;)V
    :try_end_17
    .catchall {:try_start_5 .. :try_end_17} :catchall_1b

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_1b
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final B(Z)V
    .registers 6

    invoke-virtual {p0}, Lp12;->w()Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-virtual {p0}, Lp12;->m()Z

    move-result v0

    if-nez v0, :cond_85

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    const v3, 0x7f0d0287

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/media/MediaPlayerMini;

    iput-object v0, p0, Lp12;->c:Ljava/lang/Object;

    invoke-static {v0}, Latj;->a(Landroid/view/View;)V

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Lsjg;

    iget-object v1, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/MediaPlayerMini;

    iget-object v1, v1, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v1, v1, Lei;->f:Ljava/lang/Object;

    check-cast v1, Landroidx/media3/ui/PlayerView;

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object v0, p0, Lp12;->d:Ljava/lang/Object;

    iget-object v1, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Lxbf;

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Ltjg;

    invoke-virtual {v1, v0, p1}, Ltjg;->b(Lsjg;Z)V

    iget-object p1, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p1, Lug7;

    if-eqz p1, :cond_85

    invoke-virtual {p0}, Lp12;->m()Z

    move-result p0

    iget-object p1, p1, Lug7;->a:Lwg7;

    iput-boolean p0, p1, Lwg7;->P:Z

    invoke-virtual {p1}, Lwg7;->K0()V

    iget-object p0, p1, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean p1, p1, Lwg7;->P:Z

    if-eqz p1, :cond_72

    const p1, 0x7f040398

    goto :goto_75

    :cond_72
    const p1, 0x7f040399

    :goto_75
    const v1, 0x7f06063b

    invoke-static {p1, v0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq p1, v0, :cond_85

    iput p1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_85
    return-void

    :cond_86
    invoke-virtual {p0}, Lp12;->j()V

    return-void
.end method

.method public final b()Z
    .registers 6

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lq6e;

    iget-object v1, p0, Lp12;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loim;

    goto :goto_13

    :cond_12
    move-object v1, v2

    :goto_13
    if-eqz v1, :cond_1b

    invoke-interface {v1}, Loim;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_5f

    :cond_1b
    sget-object v1, Lgco;->a:Ljava/util/HashSet;

    iget-object v1, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leri;

    invoke-static {v3}, Lgco;->a(Leri;)Z

    move-result v4

    if-eqz v4, :cond_27

    move-object v2, v3

    :cond_3a
    iput-object v2, p0, Lp12;->g:Ljava/lang/Object;

    if-eqz v2, :cond_5f

    iget-object v1, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "allow_ask_again"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_5f

    invoke-virtual {v0}, Lq6e;->b()Leri;

    move-result-object v0

    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Leri;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    :cond_5f
    const/4 p0, 0x0

    return p0

    :cond_61
    return v3
.end method

.method public final d(Ljf4;)Lmr;
    .registers 6

    const-string v0, "CX:getCameraInfo"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_5
    iget-object v0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lwg4;

    iget-object v0, v0, Lwg4;->a:Lhf4;

    invoke-virtual {v0}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;

    move-result-object v0

    invoke-interface {v0}, Lzd4;->g()Lxd4;

    move-result-object v0

    invoke-static {p1}, Lp12;->c(Ljf4;)Lec4;

    move-result-object p1

    invoke-interface {v0}, Lxd4;->e()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lec4;->a:Lrn2;

    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Ly9m;->v(Ljava/lang/String;Ljava/lang/String;Lrn2;)Ltd4;

    move-result-object v1

    iget-object v2, p0, Lp12;->b:Ljava/lang/Object;

    monitor-enter v2
    :try_end_29
    .catchall {:try_start_5 .. :try_end_29} :catchall_49

    :try_start_29
    iget-object v3, p0, Lp12;->g:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3f

    new-instance v3, Lmr;

    invoke-direct {v3, v0, p1}, Lmr;-><init>(Lxd4;Lec4;)V

    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3f
    .catchall {:try_start_29 .. :try_end_3f} :catchall_46

    :cond_3f
    :try_start_3f
    monitor-exit v2

    check-cast v3, Lmr;
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_49

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-object v3

    :catchall_46
    move-exception p0

    :try_start_47
    monitor-exit v2

    throw p0
    :try_end_49
    .catchall {:try_start_47 .. :try_end_49} :catchall_49

    :catchall_49
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final e()I
    .registers 2

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwg4;

    const/4 v0, 0x0

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lwg4;->g:Ltah;

    if-eqz p0, :cond_19

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Ltc4;

    iget-object v0, p0, Ltc4;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_12
    iget-boolean p0, p0, Ltc4;->f:Z
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_16

    monitor-exit v0

    return p0

    :catchall_16
    move-exception p0

    monitor-exit v0

    throw p0

    :cond_19
    const-string p0, "CameraX not initialized yet."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_1e
    return v0
.end method

.method public final f()J
    .registers 3

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_d

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_d
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lsko;->s(Ljava/lang/Object;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public final j()V
    .registers 4

    invoke-virtual {p0}, Lp12;->m()Z

    move-result v0

    if-eqz v0, :cond_5d

    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lp12;->d:Ljava/lang/Object;

    check-cast v1, Lsjg;

    invoke-virtual {v0, v1}, Ltjg;->j(Lsjg;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lp12;->d:Ljava/lang/Object;

    iget-object v1, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iput-object v0, p0, Lp12;->c:Ljava/lang/Object;

    iget-object v0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lug7;

    if-eqz v0, :cond_5d

    invoke-virtual {p0}, Lp12;->m()Z

    move-result p0

    iget-object v0, v0, Lug7;->a:Lwg7;

    iput-boolean p0, v0, Lwg7;->P:Z

    invoke-virtual {v0}, Lwg7;->K0()V

    iget-object p0, v0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v0, v0, Lwg7;->P:Z

    if-eqz v0, :cond_4a

    const v0, 0x7f040398

    goto :goto_4d

    :cond_4a
    const v0, 0x7f040399

    :goto_4d
    const v2, 0x7f06063b

    invoke-static {v0, v1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq v0, v1, :cond_5d

    iput v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_5d
    return-void
.end method

.method public final k(Lwg4;Landroid/content/Context;)V
    .registers 6

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iput-object p1, p0, Lp12;->e:Ljava/lang/Object;

    iput-object p2, p0, Lp12;->a:Ljava/lang/Object;

    if-eqz p1, :cond_25

    iget-object p1, p1, Lwg4;->n:Lcf4;

    if-eqz p1, :cond_25

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p2

    new-instance v1, Laf4;

    invoke-direct {v1, p0, p2}, Laf4;-><init>(Lp12;Ljava/util/concurrent/ScheduledExecutorService;)V

    iget-object v2, p1, Lcf4;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lye4;

    invoke-direct {v1, p1, p0}, Lye4;-><init>(Lcf4;Lp12;)V

    check-cast p2, Lg7a;

    invoke-virtual {p2, v1}, Lg7a;->execute(Ljava/lang/Runnable;)V
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_27

    :cond_25
    monitor-exit v0

    return-void

    :catchall_27
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final l(Loqe;Ljava/util/ArrayList;IZ)V
    .registers 8

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Low8;

    if-ltz p3, :cond_2e

    iget-object v1, p0, Lp12;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    check-cast p1, Lmsh;

    new-instance v2, Lfve;

    invoke-direct {v2, p1, p2, v1}, Lfve;-><init>(Loqe;Ljava/util/List;Ljava/lang/String;)V

    add-int/lit8 p2, p3, 0x1

    if-ltz p2, :cond_26

    iget-object v1, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p2, v1, :cond_29

    invoke-virtual {v0, p2}, Lha2;->J(I)Lja2;

    move-result-object v1

    invoke-virtual {v2, v1}, Lj82;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_2a

    :cond_26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_29
    const/4 v1, 0x0

    :goto_2a
    if-eqz v1, :cond_2f

    if-nez p4, :cond_37

    :cond_2e
    return-void

    :cond_2f
    invoke-virtual {v0, p2, v2}, Lha2;->H(ILja2;)V

    iget-object p1, p1, Lmsh;->A:Lkm5;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lkm5;->b:Z

    :cond_37
    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    return-void
.end method

.method public final m()Z
    .registers 1

    iget-object p0, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/MediaPlayerMini;

    if-eqz p0, :cond_e

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final n()Lp7d;
    .registers 10

    iget-object v0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lru9;

    iget-object v1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Lkze;

    iget-object v2, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v2, Ljtg;

    invoke-virtual {v2}, Ljtg;->d()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_73

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwvg;

    invoke-static {v2}, Luvg;->d(Lwvg;)Luvg;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const-string v4, "main.menu.premium_promo.top.impressions"

    const/4 v5, 0x4

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v2, :cond_74

    if-eq v2, v6, :cond_73

    const/4 v8, 0x2

    if-eq v2, v8, :cond_44

    const/4 v1, 0x3

    if-eq v2, v1, :cond_74

    if-eq v2, v5, :cond_73

    const/4 v0, 0x5

    if-ne v2, v0, :cond_40

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lp7d;

    return-object p0

    :cond_40
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_44
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    invoke-virtual {p0}, Lwvg;->b()Z

    move-result p0

    if-eqz p0, :cond_73

    new-instance p0, Lp7d;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-lt v0, v5, :cond_5b

    move v6, v7

    :cond_5b
    new-instance v0, Lrxh;

    const v1, 0x7f1413be

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    sget-object v1, Lcxc;->k:Luac;

    new-instance v1, Lrxh;

    const v2, 0x7f1407ef

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const/16 v2, 0xc

    invoke-direct {p0, v2, v6, v0, v1}, Lp7d;-><init>(IZLrxh;Lpxh;)V

    return-object p0

    :cond_73
    return-object v3

    :cond_74
    iget-object p0, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtg;

    iget v1, p0, Lqtg;->a:I

    const v2, 0x7f1413ee

    if-ne v1, v6, :cond_ab

    new-instance v1, Lp7d;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-lt v0, v5, :cond_90

    move v6, v7

    :cond_90
    new-instance v0, Lrxh;

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    iget p0, p0, Lqtg;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Ltxh;

    const v4, 0x7f120039

    invoke-direct {v3, v2, v4, p0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    invoke-direct {v1, v7, v6, v0, v3}, Lp7d;-><init>(IZLrxh;Lpxh;)V

    return-object v1

    :cond_ab
    new-instance p0, Lp7d;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-lt v0, v5, :cond_b6

    move v6, v7

    :cond_b6
    new-instance v0, Lrxh;

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    new-instance v1, Lrxh;

    const v2, 0x7f141333

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    invoke-direct {p0, v7, v6, v0, v1}, Lp7d;-><init>(IZLrxh;Lpxh;)V

    return-object p0
.end method

.method public final o(Lr2k;Lr2k;)V
    .registers 10

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function0;

    iput-object v0, p0, Lp12;->h:Ljava/lang/Object;

    iget-object v0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast v0, Ltn;

    iget-object v1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Lq92;

    iget-object v2, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v2, Ld5o;

    invoke-virtual {v2}, Ld5o;->B()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lq92;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v2, Lj06;

    monitor-enter v2

    :try_start_25
    iput-object v1, v0, Ltn;->c:Ljava/lang/Object;

    iget-boolean v1, v0, Ltn;->a:Z
    :try_end_29
    .catchall {:try_start_25 .. :try_end_29} :catchall_8f

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_2f

    monitor-exit v2

    goto :goto_74

    :cond_2f
    :try_start_2f
    iput-boolean v4, v0, Ltn;->a:Z
    :try_end_31
    .catchall {:try_start_2f .. :try_end_31} :catchall_8f

    monitor-exit v2

    :goto_32
    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lj06;

    monitor-enter v1

    :try_start_37
    iget-object v2, v0, Ltn;->c:Ljava/lang/Object;

    iget-object v5, v0, Ltn;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/Map;
    :try_end_3d
    .catchall {:try_start_37 .. :try_end_3d} :catchall_8c

    monitor-exit v1

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_46
    :goto_46
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_68

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlin/jvm/functions/Function1;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_46

    invoke-interface {v6, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_46

    :cond_68
    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lj06;

    monitor-enter v1

    :try_start_6d
    iget-object v5, v0, Ltn;->c:Ljava/lang/Object;

    if-ne v2, v5, :cond_87

    iput-boolean v3, v0, Ltn;->a:Z
    :try_end_73
    .catchall {:try_start_6d .. :try_end_73} :catchall_89

    monitor-exit v1

    :goto_74
    iget-object v0, p0, Lp12;->d:Ljava/lang/Object;

    check-cast v0, Lj04;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    if-eqz p0, :cond_7f

    move v3, v4

    :cond_7f
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p1, p2, p0}, Lj04;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_87
    monitor-exit v1

    goto :goto_32

    :catchall_89
    move-exception p0

    monitor-exit v1

    throw p0

    :catchall_8c
    move-exception p0

    monitor-exit v1

    throw p0

    :catchall_8f
    move-exception p0

    monitor-exit v2

    throw p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0}, Lesg;->G()V

    return-void
.end method

.method public final p(IILjava/util/ArrayList;Lro9;Lk6c;ZZZII)V
    .registers 38

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, p6

    iget-object v4, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    iget-object v5, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    iget-object v6, v0, Lp12;->c:Ljava/lang/Object;

    check-cast v6, Ltee;

    iget-object v7, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v7, Lsee;

    iget-object v8, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v8, Ljava/util/ArrayList;

    iget-object v9, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v9, Ljava/util/ArrayList;

    iget-object v10, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v10, Lro9;

    iput-object v2, v0, Lp12;->b:Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v11

    const/4 v13, 0x0

    :goto_2b
    if-ge v13, v11, :cond_51

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ln6c;

    iget-object v15, v14, Ln6c;->b:Ljava/util/List;

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    const/4 v12, 0x0

    :goto_3a
    if-ge v12, v15, :cond_4e

    move/from16 p2, v11

    iget-object v11, v14, Ln6c;->b:Ljava/util/List;

    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lifg;

    invoke-virtual {v11}, Lifg;->p()Ljava/lang/Object;

    add-int/lit8 v12, v12, 0x1

    move/from16 v11, p2

    goto :goto_3a

    :cond_4e
    add-int/lit8 v13, v13, 0x1

    goto :goto_2b

    :cond_51
    invoke-virtual {v7}, Lsee;->i()Z

    move-result v11

    if-eqz v11, :cond_5b

    invoke-virtual {v0}, Lp12;->t()V

    return-void

    :cond_5b
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ln6c;

    if-nez p7, :cond_67

    if-eqz p8, :cond_67

    const/4 v12, 0x0

    goto :goto_68

    :cond_67
    const/4 v12, 0x1

    :goto_68
    iget-object v13, v7, Lsee;->b:[Ljava/lang/Object;

    iget-object v14, v7, Lsee;->a:[J

    array-length v15, v14

    const/4 v11, 0x2

    sub-int/2addr v15, v11

    const-wide/16 v16, 0x80

    const-wide/16 v18, 0xff

    const/16 v20, 0x7

    const-wide v21, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    if-ltz v15, :cond_c3

    move/from16 p9, v12

    move-object/from16 p10, v13

    const/4 v11, 0x0

    :goto_81
    const/16 p8, 0x8

    aget-wide v12, v14, v11

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    not-long v8, v12

    shl-long v8, v8, v20

    and-long/2addr v8, v12

    and-long v8, v8, v21

    cmp-long v8, v8, v21

    if-eqz v8, :cond_ba

    sub-int v8, v11, v15

    not-int v8, v8

    ushr-int/lit8 v8, v8, 0x1f

    rsub-int/lit8 v8, v8, 0x8

    const/4 v9, 0x0

    :goto_9b
    if-ge v9, v8, :cond_b6

    and-long v25, v12, v18

    cmp-long v25, v25, v16

    if-gez v25, :cond_af

    shl-int/lit8 v25, v11, 0x3

    add-int v25, v25, v9

    move/from16 v26, v9

    aget-object v9, p10, v25

    invoke-virtual {v6, v9}, Ltee;->a(Ljava/lang/Object;)Z

    goto :goto_b1

    :cond_af
    move/from16 v26, v9

    :goto_b1
    shr-long v12, v12, p8

    add-int/lit8 v9, v26, 0x1

    goto :goto_9b

    :cond_b6
    move/from16 v9, p8

    if-ne v8, v9, :cond_c9

    :cond_ba
    if-eq v11, v15, :cond_c9

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v8, v23

    move-object/from16 v9, v24

    goto :goto_81

    :cond_c3
    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move/from16 p9, v12

    :cond_c9
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v8

    const/4 v9, 0x0

    :goto_ce
    if-ge v9, v8, :cond_100

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ln6c;

    iget-object v12, v11, Ln6c;->i:Ljava/lang/Object;

    iget-object v13, v11, Ln6c;->b:Ljava/util/List;

    invoke-virtual {v6, v12}, Ltee;->l(Ljava/lang/Object;)Z

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v12

    const/4 v14, 0x0

    :goto_e2
    if-ge v14, v12, :cond_f0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lifg;

    invoke-virtual {v15}, Lifg;->p()Ljava/lang/Object;

    add-int/lit8 v14, v14, 0x1

    goto :goto_e2

    :cond_f0
    iget-object v11, v11, Ln6c;->i:Ljava/lang/Object;

    iget-object v12, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v12, Lsee;

    invoke-virtual {v12, v11}, Lsee;->k(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lsko;->s(Ljava/lang/Object;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_ce

    :cond_100
    const/4 v9, 0x1

    new-array v0, v9, [I

    const/4 v8, 0x0

    if-eqz p9, :cond_178

    if-eqz v10, :cond_178

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_13f

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-le v11, v9, :cond_11d

    new-instance v11, Lh5c;

    const/4 v12, 0x2

    invoke-direct {v11, v10, v12}, Lh5c;-><init>(Lro9;B)V

    invoke-static {v11, v5}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    :cond_11d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-gtz v11, :cond_128

    const/4 v11, 0x0

    invoke-static {v0, v11, v9, v11}, Ljava/util/Arrays;->fill([IIII)V

    goto :goto_140

    :cond_128
    const/4 v11, 0x0

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln6c;

    invoke-static {v0, v1, v3}, Lp12;->C([ILn6c;Z)I

    iget-object v0, v1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {v7, v0}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lsko;->s(Ljava/lang/Object;)V

    invoke-virtual {v1, v11}, Ln6c;->b(I)J

    throw v8

    :cond_13f
    const/4 v11, 0x0

    :goto_140
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_178

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v12, 0x1

    if-le v9, v12, :cond_155

    new-instance v9, Lh5c;

    invoke-direct {v9, v10, v11}, Lh5c;-><init>(Lro9;B)V

    invoke-static {v9, v4}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    :cond_155
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-gtz v9, :cond_15f

    invoke-static {v0, v11, v12, v11}, Ljava/util/Arrays;->fill([IIII)V

    goto :goto_178

    :cond_15f
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln6c;

    invoke-static {v0, v1, v3}, Lp12;->C([ILn6c;Z)I

    invoke-static {v1, v3}, Lcs5;->g0(Ln6c;Z)I

    iget-object v0, v1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {v7, v0}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lsko;->s(Ljava/lang/Object;)V

    invoke-virtual {v1, v11}, Ln6c;->b(I)J

    throw v8

    :cond_178
    :goto_178
    iget-object v9, v6, Ltee;->b:[Ljava/lang/Object;

    iget-object v10, v6, Ltee;->a:[J

    array-length v11, v10

    const/4 v12, 0x2

    sub-int/2addr v11, v12

    if-ltz v11, :cond_1d1

    const/4 v12, 0x0

    :goto_182
    aget-wide v13, v10, v12

    move-object/from16 p0, v8

    move-object v15, v9

    not-long v8, v13

    shl-long v8, v8, v20

    and-long/2addr v8, v13

    and-long v8, v8, v21

    cmp-long v8, v8, v21

    if-eqz v8, :cond_1c5

    sub-int v8, v12, v11

    not-int v8, v8

    ushr-int/lit8 v8, v8, 0x1f

    const/16 v9, 0x8

    rsub-int/lit8 v8, v8, 0x8

    const/4 v9, 0x0

    :goto_19b
    if-ge v9, v8, :cond_1be

    and-long v25, v13, v18

    cmp-long v25, v25, v16

    if-gez v25, :cond_1b5

    shl-int/lit8 v25, v12, 0x3

    add-int v25, v25, v9

    move-object/from16 p5, v4

    aget-object v4, v15, v25

    invoke-virtual {v7, v4}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lsko;->s(Ljava/lang/Object;)V

    :goto_1b2
    const/16 v4, 0x8

    goto :goto_1b8

    :cond_1b5
    move-object/from16 p5, v4

    goto :goto_1b2

    :goto_1b8
    shr-long/2addr v13, v4

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v4, p5

    goto :goto_19b

    :cond_1be
    move-object/from16 p5, v4

    const/16 v4, 0x8

    if-ne v8, v4, :cond_1d5

    goto :goto_1c7

    :cond_1c5
    move-object/from16 p5, v4

    :goto_1c7
    if-eq v12, v11, :cond_1d5

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v8, p0

    move-object/from16 v4, p5

    move-object v9, v15

    goto :goto_182

    :cond_1d1
    move-object/from16 p5, v4

    move-object/from16 p0, v8

    :cond_1d5
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_21b

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_1ee

    new-instance v4, Lh5c;

    const/4 v8, 0x3

    invoke-direct {v4, v2, v8}, Lh5c;-><init>(Lro9;B)V

    move-object/from16 v9, v24

    invoke-static {v4, v9}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    goto :goto_1f0

    :cond_1ee
    move-object/from16 v9, v24

    :goto_1f0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v11, 0x0

    if-lez v4, :cond_216

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ln6c;

    iget-object v4, v2, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {v7, v4}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lsko;->s(Ljava/lang/Object;)V

    invoke-static {v0, v2, v3}, Lp12;->C([ILn6c;Z)I

    if-eqz p7, :cond_215

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln6c;

    invoke-virtual {v0, v11}, Ln6c;->b(I)J

    throw p0

    :cond_215
    throw p0

    :cond_216
    const/4 v12, 0x1

    invoke-static {v0, v11, v12, v11}, Ljava/util/Arrays;->fill([IIII)V

    goto :goto_21e

    :cond_21b
    move-object/from16 v9, v24

    const/4 v12, 0x1

    :goto_21e
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_251

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v12, :cond_235

    new-instance v4, Lh5c;

    invoke-direct {v4, v2, v12}, Lh5c;-><init>(Lro9;B)V

    move-object/from16 v8, v23

    invoke-static {v4, v8}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    goto :goto_237

    :cond_235
    move-object/from16 v8, v23

    :goto_237
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v11, 0x0

    if-lez v2, :cond_254

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln6c;

    iget-object v2, v1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {v7, v2}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lsko;->s(Ljava/lang/Object;)V

    invoke-static {v0, v1, v3}, Lp12;->C([ILn6c;Z)I

    throw p0

    :cond_251
    move-object/from16 v8, v23

    const/4 v11, 0x0

    :cond_254
    invoke-static {v9}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    invoke-virtual {v1, v11, v9}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v6}, Ltee;->b()V

    return-void
.end method

.method public final q(Ljava/lang/String;Llqm;Lwth;)Lcdb;
    .registers 14

    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-static {p1}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_dc

    invoke-static {p1}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_dc

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Llcp;->t(Landroid/net/Uri;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_43

    const-string p0, "ofa_cb"

    invoke-virtual {p1, p0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2c

    invoke-static {p0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_2c
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_38

    new-instance p0, Lzcb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_38
    new-instance p0, Lvcb;

    new-instance p1, Lsk5;

    invoke-direct {p1, v3}, Lsk5;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lvcb;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_43
    if-eqz p1, :cond_4e

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    goto :goto_50

    :cond_4e
    move-object v1, v3

    move-object v4, v1

    :goto_50
    invoke-static {v1, v4}, Lbtb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_72

    new-instance p0, Lvcb;

    const/4 p2, 0x0

    invoke-static {p1, v3, v3, p2}, Lbtb;->d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    sget-object p3, Llqm;->d:Llqm;

    invoke-static {p1, p3, p2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, v2}, Lvx3;->c(Z)V

    invoke-virtual {p1, v2}, Lvx3;->a(Z)V

    new-instance p2, Lay3;

    invoke-direct {p2, p1}, Lay3;-><init>(Lvx3;)V

    invoke-direct {p0, p2}, Lvcb;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_72
    const/4 v1, 0x3

    invoke-static {p1, v1}, Lf03;->J(Landroid/net/Uri;I)Z

    move-result v1

    if-eqz v1, :cond_84

    new-instance p0, Lvcb;

    new-instance p3, Lxh2;

    invoke-direct {p3, p1, p2}, Lxh2;-><init>(Landroid/net/Uri;Llqm;)V

    invoke-direct {p0, p3}, Lvcb;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_84
    const-string p2, "www.bing.com"

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_ce

    const-string p2, "/search"

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_ce

    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_ce

    const-string p0, "q"

    invoke-static {p1, p0}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_ce

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string p2, "default_input_method"

    invoke-static {p1, p2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_ce

    const-string p2, "com.touchtype.swiftkey/"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_ce

    move-object v6, p0

    goto :goto_cf

    :cond_ce
    move-object v6, v3

    :goto_cf
    if-eqz v6, :cond_db

    new-instance v4, Lfdb;

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v7, 0x1

    move-object v5, p3

    invoke-direct/range {v4 .. v9}, Lfdb;-><init>(Lwth;Ljava/lang/String;IZI)V

    return-object v4

    :cond_db
    return-object v3

    :cond_dc
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    sget-object p3, Llk6;->a:Llk6;

    sget-object p3, Lik6;->b:Lik6;

    invoke-static {v2, p3, p2, v0, p0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    if-eqz p0, :cond_f9

    new-instance p0, Lvcb;

    new-instance p3, Lbgf;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p3, p1, p2, v2}, Lbgf;-><init>(Landroid/net/Uri;Llqm;I)V

    invoke-direct {p0, p3}, Lvcb;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_f9
    new-instance p0, Lzcb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public final r(Landroid/content/Intent;Lwth;Z)Lcdb;
    .registers 11

    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-static {p1}, Lp12;->i(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_3c

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5a

    invoke-static {v1}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    const-string p0, "query"

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p2, p1, v3}, Lp12;->s(Lwth;Landroid/content/Intent;I)Lfdb;

    move-result-object p0

    return-object p0

    :cond_30
    const-string v2, "http://"

    invoke-static {v2, v1}, Lwqm;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    if-eqz v2, :cond_3c

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3c
    invoke-static {v1}, Lmdb;->e(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5a

    const/4 v2, 0x0

    if-nez v1, :cond_47

    move v5, v2

    goto :goto_50

    :cond_47
    invoke-static {v1}, Lmdb;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lmdb;->d(Ljava/lang/String;)Z

    move-result v5

    xor-int/2addr v5, v3

    :goto_50
    if-eqz v5, :cond_5a

    const-string v5, "com.opera.android.extra.DO_NOT_OPEN_TAB"

    invoke-virtual {p1, v5, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_5b

    :cond_5a
    return-object v4

    :cond_5b
    sget-object v5, Llqm;->i:Llqm;

    invoke-virtual {p0, v1, v5, p2}, Lp12;->q(Ljava/lang/String;Llqm;Lwth;)Lcdb;

    move-result-object p0

    if-eqz p0, :cond_64

    return-object p0

    :cond_64
    const-string p0, "com.android.browser.application_id"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_84

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_84

    const-string p0, "android.intent.action.SEND"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_84

    move p0, v2

    goto :goto_85

    :cond_84
    move p0, v3

    :goto_85
    const-string p2, "content:"

    invoke-virtual {v1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_cf

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p1

    const-string p2, "multipart/related"

    if-eqz p1, :cond_a3

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_c5

    const-string v6, "message/rfc822"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_c5

    :cond_a3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_b1

    const-string v6, "application/octet-stream"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_cf

    :cond_b1
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, "mhtml"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_cf

    :cond_c5
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v3}, Ljava/util/HashMap;-><init>(I)V

    const-string p1, "X-Chrome-intent-type"

    invoke-virtual {v4, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_cf
    const-string p1, "opera://about/"

    const-string p2, "about:"

    if-eqz v4, :cond_fc

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_fc

    new-instance p3, Llsc;

    invoke-virtual {v1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_e4

    move-object v1, p1

    :cond_e4
    invoke-direct {p3, v1, v2}, Lksc;-><init>(Ljava/lang/String;I)V

    iput-object v4, p3, Lksc;->f:Ljava/util/HashMap;

    new-instance p1, Lvx3;

    invoke-direct {p1, v5}, Lvx3;-><init>(Llqm;)V

    new-instance p2, Lxx3;

    invoke-direct {p2, p3}, Lxx3;-><init>(Llsc;)V

    iget-object p3, p1, Lvx3;->p:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, p0}, Lvx3;->c(Z)V

    goto :goto_10c

    :cond_fc
    invoke-virtual {v1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_103

    move-object v1, p1

    :cond_103
    invoke-static {v1, v5, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, p0}, Lvx3;->c(Z)V

    iput-boolean p3, p1, Lvx3;->q:Z

    :goto_10c
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result p0

    const/4 p2, 0x3

    if-ne p0, p2, :cond_122

    invoke-virtual {p1, v3}, Lvx3;->e(Z)V

    :cond_122
    new-instance p0, Lvcb;

    new-instance p2, Lay3;

    invoke-direct {p2, p1}, Lay3;-><init>(Lvx3;)V

    invoke-direct {p0, p2}, Lvcb;-><init>(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final t()V
    .registers 15

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lsee;

    invoke-virtual {p0}, Lsee;->j()Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lsee;->c:[Ljava/lang/Object;

    iget-object v1, p0, Lsee;->a:[J

    array-length v2, v1

    add-int/lit8 v2, v2, -0x2

    if-ltz v2, :cond_4f

    const/4 v3, 0x0

    move v4, v3

    :goto_15
    aget-wide v5, v1, v4

    not-long v7, v5

    const/4 v9, 0x7

    shl-long/2addr v7, v9

    and-long/2addr v7, v5

    const-wide v9, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v7, v9

    cmp-long v7, v7, v9

    if-eqz v7, :cond_4a

    sub-int v7, v4, v2

    not-int v7, v7

    ushr-int/lit8 v7, v7, 0x1f

    const/16 v8, 0x8

    rsub-int/lit8 v7, v7, 0x8

    move v9, v3

    :goto_2f
    if-ge v9, v7, :cond_48

    const-wide/16 v10, 0xff

    and-long/2addr v10, v5

    const-wide/16 v12, 0x80

    cmp-long v10, v10, v12

    if-ltz v10, :cond_3e

    shr-long/2addr v5, v8

    add-int/lit8 v9, v9, 0x1

    goto :goto_2f

    :cond_3e
    shl-int/lit8 v4, v4, 0x3

    add-int/2addr v4, v9

    aget-object p0, v0, v4

    invoke-static {p0}, Lsko;->s(Ljava/lang/Object;)V

    const/4 p0, 0x0

    throw p0

    :cond_48
    if-ne v7, v8, :cond_4f

    :cond_4a
    if-eq v4, v2, :cond_4f

    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_4f
    invoke-virtual {p0}, Lsee;->a()V

    :cond_52
    return-void
.end method

.method public final u(IIILjava/lang/String;)V
    .registers 16

    iget-object v0, p0, Lp12;->h:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljrj;

    iget-object v0, p0, Lp12;->d:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Landroid/os/Handler;

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/base/WindowAndroid;

    const/4 v2, 0x0

    if-eqz v0, :cond_5a

    iget-object v0, v0, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lshf;

    const-string v3, "textclassification"

    if-nez v0, :cond_3e

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/base/WindowAndroid;

    if-eqz v0, :cond_5a

    iget-object v0, v0, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_5a

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/textclassifier/TextClassificationManager;

    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassificationManager;->getTextClassifier()Landroid/view/textclassifier/TextClassifier;

    move-result-object v0

    goto :goto_66

    :cond_3e
    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassifier;

    if-eqz v0, :cond_4a

    invoke-interface {v0}, Landroid/view/textclassifier/TextClassifier;->isDestroyed()Z

    move-result v4

    if-eqz v4, :cond_66

    :cond_4a
    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/base/WindowAndroid;

    if-eqz v0, :cond_5a

    iget-object v0, v0, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_5c

    :cond_5a
    move-object v0, v2

    goto :goto_66

    :cond_5c
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/textclassifier/TextClassificationManager;

    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassificationManager;->getTextClassifier()Landroid/view/textclassifier/TextClassifier;

    move-result-object v0

    :cond_66
    :goto_66
    if-eqz v0, :cond_d9

    sget-object v3, Landroid/view/textclassifier/TextClassifier;->NO_OP:Landroid/view/textclassifier/TextClassifier;

    if-eq v0, v3, :cond_d9

    iget-object v3, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v3, Llrj;

    const/4 v10, 0x0

    if-eqz v3, :cond_80

    iget-object v4, v3, Lfe2;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v3, v3, Lfe2;->a:Lee2;

    invoke-virtual {v3, v10}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    iput-object v2, p0, Lp12;->c:Ljava/lang/Object;

    :cond_80
    invoke-virtual {v9, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    move-object v2, v0

    new-instance v0, Llrj;

    iget-object v3, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Lorg/chromium/ui/base/WindowAndroid;

    iget-object v3, v3, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/content/Context;

    move-object v1, p0

    move v3, p1

    move v5, p2

    move v6, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v7}, Llrj;-><init>(Lp12;Landroid/view/textclassifier/TextClassifier;ILjava/lang/String;IILandroid/content/Context;)V

    iput-object v0, p0, Lp12;->c:Ljava/lang/Object;

    iget-object v1, p0, Lp12;->g:Ljava/lang/Object;

    check-cast v1, Le2j;

    invoke-virtual {v0}, Lfe2;->c()V

    iget-object v0, v0, Lfe2;->a:Lee2;

    invoke-virtual {v1, v0}, Le2j;->r(Ljava/lang/Runnable;)V

    sget-object v0, Lgq5;->k:Lgde;

    invoke-virtual {v0}, Lgde;->a()Z

    move-result v0

    if-eqz v0, :cond_d8

    sget-object v0, Lgq5;->l:Lcde;

    iget-object v1, v0, Lmt8;->e:Ljava/lang/Object;

    if-nez v1, :cond_ce

    sget-object v1, Lwbc;->g:Lwbc;

    invoke-virtual {v1}, Lwbc;->c()Z

    move-result v1

    if-eqz v1, :cond_c3

    invoke-static {}, LJ/N;->MFTJCvBh()Z

    move-result v10

    :cond_c3
    if-eqz v10, :cond_cc

    invoke-virtual {v0}, Lcde;->b()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lmt8;->e:Ljava/lang/Object;

    goto :goto_ce

    :cond_cc
    iget-object v1, v0, Lmt8;->d:Ljava/lang/Object;

    :cond_ce
    :goto_ce
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {v9, v8, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_d8
    return-void

    :cond_d9
    iget-object v0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Ljrj;

    invoke-virtual {v9, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final v(I)V
    .registers 7

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwg4;

    if-eqz p0, :cond_6b

    iget-object p0, p0, Lwg4;->g:Ltah;

    if-eqz p0, :cond_66

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Ltc4;

    iget-object v0, p0, Ltc4;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_11
    iput-boolean p1, p0, Ltc4;->f:Z

    iget-object v1, p0, Ltc4;->c:Lhf4;
    :try_end_15
    .catchall {:try_start_11 .. :try_end_15} :catchall_63

    monitor-exit v0

    if-eqz v1, :cond_62

    const/4 v0, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne p1, v2, :cond_1f

    move v4, v3

    goto :goto_20

    :cond_1f
    move v4, v0

    :goto_20
    iput-boolean v4, p0, Ltc4;->g:Z

    if-nez v4, :cond_28

    sget-object v4, Ll08;->a:Ll08;

    iput-object v4, p0, Ltc4;->d:Ll08;

    :cond_28
    invoke-virtual {v1}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_30
    :goto_30
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzd4;

    instance-of v4, v1, Lbe4;

    if-eqz v4, :cond_43

    check-cast v1, Lbe4;

    goto :goto_44

    :cond_43
    const/4 v1, 0x0

    :goto_44
    if-eqz v1, :cond_30

    if-eq p1, v3, :cond_56

    if-ne p1, v2, :cond_30

    iget-object v1, v1, Lbe4;->a:Lysm;

    iget-object v4, v1, Lysm;->k:Ljava/lang/Object;

    monitor-enter v4

    :try_start_4f
    iput-boolean v0, v1, Lysm;->o:Z
    :try_end_51
    .catchall {:try_start_4f .. :try_end_51} :catchall_53

    monitor-exit v4

    goto :goto_30

    :catchall_53
    move-exception p0

    monitor-exit v4

    throw p0

    :cond_56
    iget-object v1, v1, Lbe4;->a:Lysm;

    iget-object v4, v1, Lysm;->k:Ljava/lang/Object;

    monitor-enter v4

    :try_start_5b
    iput-boolean v3, v1, Lysm;->o:Z
    :try_end_5d
    .catchall {:try_start_5b .. :try_end_5d} :catchall_5f

    monitor-exit v4

    goto :goto_30

    :catchall_5f
    move-exception p0

    monitor-exit v4

    throw p0

    :cond_62
    return-void

    :catchall_63
    move-exception p0

    monitor-exit v0

    throw p0

    :cond_66
    const-string p0, "CameraX not initialized yet."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_6b
    return-void
.end method

.method public final w()Z
    .registers 3

    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    invoke-interface {v1}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v1

    invoke-virtual {v1}, Lgql;->p()Z

    move-result v1

    if-nez v1, :cond_3d

    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_3d

    iget-object p0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->t:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsjg;

    iget v0, v0, Lsjg;->a:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2c

    :cond_3d
    const/4 p0, 0x0

    return p0

    :cond_3f
    const/4 p0, 0x1

    return p0
.end method

.method public final x()V
    .registers 10

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Loqe;

    if-eqz v0, :cond_7a

    const/4 v1, 0x0

    iput-object v1, p0, Lp12;->f:Ljava/lang/Object;

    iget-object v2, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v2, Ltsh;

    move-object v3, v0

    check-cast v3, Lmsh;

    iget-object v3, v3, Lmsh;->v:Lp12;

    iget-object v3, v3, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v2, Ltsh;->g:Laum;

    iget-boolean v5, v2, Lz85;->f:Z

    if-eqz v5, :cond_1e

    move-object v5, v1

    goto :goto_20

    :cond_1e
    iget-object v5, v2, Lz85;->a:Lg82;

    :goto_20
    if-eqz v5, :cond_3f

    iget-object v5, v5, Lg82;->a:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    iget-boolean v1, v2, Lz85;->c:Z

    if-eqz v1, :cond_3d

    new-instance v1, Ly85;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iget-wide v7, v2, Lz85;->d:J

    sub-long/2addr v5, v7

    iget v2, v2, Lz85;->e:I

    invoke-direct {v1, v5, v6, v2}, Ly85;-><init>(JI)V

    goto :goto_3f

    :cond_3d
    iget-object v1, v2, Lz85;->b:Ly85;

    :cond_3f
    :goto_3f
    if-eqz v1, :cond_7a

    iget-wide v2, v1, Ly85;->a:J

    iget-object v5, v4, Laum;->b:Lpu8;

    if-eqz v5, :cond_50

    iget-object v5, v5, Lpu8;->a:Ljava/lang/Integer;

    if-eqz v5, :cond_50

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_52

    :cond_50
    const/16 v5, 0x1e

    :goto_52
    int-to-long v5, v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    cmp-long v2, v2, v5

    if-gtz v2, :cond_70

    iget v1, v1, Ly85;->b:I

    iget-object v2, v4, Laum;->b:Lpu8;

    if-eqz v2, :cond_6c

    iget-object v2, v2, Lpu8;->b:Ljava/lang/Integer;

    if-eqz v2, :cond_6c

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_6e

    :cond_6c
    const/16 v2, 0x32

    :goto_6e
    if-le v1, v2, :cond_7a

    :cond_70
    invoke-static {v0}, Lp12;->h(Loqe;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7b

    :cond_7a
    return-void

    :cond_7b
    iget-object v2, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v2, Low8;

    iget-object v2, v2, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_88
    if-ge v6, v3, :cond_a3

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lja2;

    instance-of v8, v7, Lj82;

    if-eqz v8, :cond_a0

    check-cast v7, Lj82;

    iget-object v7, v7, Lj82;->c:Loqe;

    invoke-virtual {v7, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a4

    :cond_a0
    add-int/lit8 v5, v5, 0x1

    goto :goto_88

    :cond_a3
    const/4 v5, -0x1

    :cond_a4
    invoke-virtual {p0, v0, v1, v5, v4}, Lp12;->l(Loqe;Ljava/util/ArrayList;IZ)V

    return-void
.end method

.method public final z(Ljava/lang/String;IJLab4;Lhh2;Lnt5;)Ljava/lang/Object;
    .registers 31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p7

    instance-of v3, v2, Lqf4;

    if-eqz v3, :cond_19

    move-object v3, v2

    check-cast v3, Lqf4;

    iget v4, v3, Lqf4;->A:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v3, Lqf4;->A:I

    goto :goto_1e

    :cond_19
    new-instance v3, Lqf4;

    invoke-direct {v3, v0, v2}, Lqf4;-><init>(Lp12;Lnt5;)V

    :goto_1e
    iget-object v2, v3, Lqf4;->y:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, Lqf4;->A:I

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v5, :cond_4c

    if-eq v5, v7, :cond_37

    if-ne v5, v6, :cond_31

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    return-object v2

    :cond_31
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_37
    iget-wide v9, v3, Lqf4;->x:J

    iget v1, v3, Lqf4;->w:I

    iget-object v5, v3, Lqf4;->v:Lhh2;

    iget-object v7, v3, Lqf4;->u:Lab4;

    iget-object v11, v3, Lqf4;->t:Ljava/lang/String;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move v12, v1

    move-object/from16 v20, v5

    move-object/from16 v17, v7

    move-wide v13, v9

    move-object v10, v11

    goto :goto_91

    :cond_4c
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v2, Lgb4;

    iput-object v1, v3, Lqf4;->t:Ljava/lang/String;

    move-object/from16 v5, p5

    iput-object v5, v3, Lqf4;->u:Lab4;

    move-object/from16 v9, p6

    iput-object v9, v3, Lqf4;->v:Lhh2;

    move/from16 v10, p2

    iput v10, v3, Lqf4;->w:I

    move-wide/from16 v11, p3

    iput-wide v11, v3, Lqf4;->x:J

    iput v7, v3, Lqf4;->A:I

    check-cast v2, Lfb4;

    iget-object v7, v2, Lfb4;->f:Landroid/util/ArrayMap;

    monitor-enter v7

    :try_start_6c
    iget-object v13, v2, Lfb4;->f:Landroid/util/ArrayMap;

    invoke-virtual {v13, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lge4;
    :try_end_74
    .catchall {:try_start_6c .. :try_end_74} :catchall_d1

    monitor-exit v7

    if-eqz v13, :cond_79

    move-object v2, v13

    goto :goto_88

    :cond_79
    iget-object v7, v2, Lfb4;->b:Lhnl;

    iget-object v7, v7, Lhnl;->f:Ldx5;

    new-instance v13, Lvr;

    const/16 v14, 0x8

    invoke-direct {v13, v2, v1, v8, v14}, Lvr;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v7, v13, v3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    :goto_88
    if-eq v2, v4, :cond_cf

    move-object/from16 v17, v5

    move-object/from16 v20, v9

    move-wide v13, v11

    move v12, v10

    move-object v10, v1

    :goto_91
    move-object v11, v2

    check-cast v11, Lge4;

    new-instance v9, Lz21;

    iget-object v1, v0, Lp12;->e:Ljava/lang/Object;

    move-object v15, v1

    check-cast v15, Lh0l;

    iget-object v1, v0, Lp12;->c:Ljava/lang/Object;

    move-object/from16 v16, v1

    check-cast v16, Ldb4;

    iget-object v1, v0, Lp12;->d:Ljava/lang/Object;

    move-object/from16 v18, v1

    check-cast v18, Lhb4;

    iget-object v1, v0, Lp12;->g:Ljava/lang/Object;

    move-object/from16 v19, v1

    check-cast v19, Lhnl;

    iget-object v1, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v1, Lle4;

    iget-object v2, v1, Lle4;->a:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v1, v1, Lle4;->b:Lf1p;

    move-object/from16 v22, v1

    move-object/from16 v21, v2

    invoke-direct/range {v9 .. v22}, Lz21;-><init>(Ljava/lang/String;Lge4;IJLh0l;Ldb4;Lab4;Lhb4;Lhnl;Lhh2;Landroid/hardware/camera2/CameraDevice$StateCallback;Lf1p;)V

    new-instance v1, Loz1;

    invoke-direct {v1, v0, v10, v9, v8}, Loz1;-><init>(Lp12;Ljava/lang/String;Lz21;Lmt5;)V

    iput-object v8, v3, Lqf4;->t:Ljava/lang/String;

    iput-object v8, v3, Lqf4;->u:Lab4;

    iput-object v8, v3, Lqf4;->v:Lhh2;

    iput v6, v3, Lqf4;->A:I

    invoke-static {v1, v3}, Lzch;->z(Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v4, :cond_d0

    :cond_cf
    return-object v4

    :cond_d0
    return-object v0

    :catchall_d1
    move-exception v0

    monitor-exit v7

    throw v0
.end method
