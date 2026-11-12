.class public final Lfmc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public A:Ljava/lang/Object;

.field public B:Ljava/util/Collection;

.field public C:Lsmc;

.field public D:Lomc;

.field public E:B

.field public final synthetic F:Lgmc;

.field public t:Ljava/util/List;

.field public u:Ljava/util/List;

.field public v:Ljmc;

.field public w:Ljava/util/Iterator;

.field public x:Ljava/lang/Object;

.field public y:Ljava/util/ArrayList;

.field public z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgmc;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lfmc;->F:Lgmc;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 3

    new-instance p1, Lfmc;

    iget-object p0, p0, Lfmc;->F:Lgmc;

    invoke-direct {p1, p0, p2}, Lfmc;-><init>(Lgmc;Lmt5;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfmc;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfmc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfmc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 50

    move-object/from16 v0, p0

    iget-object v1, v0, Lfmc;->F:Lgmc;

    iget-object v2, v1, Lgmc;->c:Ldx5;

    iget-object v3, v1, Lgmc;->a:Lj4c;

    sget-object v4, Lpx5;->a:Lpx5;

    iget-byte v5, v0, Lfmc;->E:B

    const/4 v7, 0x2

    const/4 v8, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    packed-switch v5, :pswitch_data_70e

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :pswitch_1a
    iget-object v2, v0, Lfmc;->A:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    iget-object v3, v0, Lfmc;->z:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    iget-object v4, v0, Lfmc;->y:Ljava/util/ArrayList;

    iget-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    iget-object v6, v0, Lfmc;->w:Ljava/util/Iterator;

    check-cast v6, Ljava/util/List;

    iget-object v6, v0, Lfmc;->v:Ljmc;

    iget-object v7, v0, Lfmc;->u:Ljava/util/List;

    check-cast v7, Ljava/util/List;

    iget-object v0, v0, Lfmc;->t:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v8, v0

    move-object/from16 v32, v1

    move-object/from16 v0, p1

    goto/16 :goto_688

    :pswitch_40
    iget-object v2, v0, Lfmc;->z:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    iget-object v5, v0, Lfmc;->y:Ljava/util/ArrayList;

    iget-object v7, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v7, Ljava/util/List;

    iget-object v8, v0, Lfmc;->w:Ljava/util/Iterator;

    check-cast v8, Ljava/util/List;

    iget-object v8, v0, Lfmc;->v:Ljmc;

    iget-object v13, v0, Lfmc;->u:Ljava/util/List;

    check-cast v13, Ljava/util/List;

    iget-object v13, v0, Lfmc;->t:Ljava/util/List;

    check-cast v13, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v32, v1

    move-object/from16 v43, v3

    move-object v1, v5

    move-object v5, v7

    move-object v7, v8

    move-object v8, v13

    const/16 v6, 0xa

    move-object v3, v2

    move-object/from16 v2, p1

    goto/16 :goto_62d

    :pswitch_6a
    iget-object v2, v0, Lfmc;->y:Ljava/util/ArrayList;

    iget-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    iget-object v7, v0, Lfmc;->w:Ljava/util/Iterator;

    check-cast v7, Ljava/util/List;

    iget-object v7, v0, Lfmc;->v:Ljmc;

    iget-object v8, v0, Lfmc;->u:Ljava/util/List;

    check-cast v8, Ljava/util/List;

    iget-object v8, v0, Lfmc;->t:Ljava/util/List;

    check-cast v8, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v32, v1

    move-object v1, v2

    move-object/from16 v43, v3

    move-object/from16 v2, p1

    goto/16 :goto_5d6

    :pswitch_8a
    iget-object v2, v0, Lfmc;->v:Ljmc;

    iget-object v5, v0, Lfmc;->u:Ljava/util/List;

    check-cast v5, Ljava/util/List;

    iget-object v5, v0, Lfmc;->t:Ljava/util/List;

    check-cast v5, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v32, v1

    move-object v7, v2

    move-object/from16 v43, v3

    move-object v8, v5

    move-object/from16 v1, p1

    goto/16 :goto_533

    :pswitch_a1
    iget-object v5, v0, Lfmc;->D:Lomc;

    iget-object v7, v0, Lfmc;->C:Lsmc;

    iget-object v13, v0, Lfmc;->B:Ljava/util/Collection;

    check-cast v13, Ljava/util/Collection;

    iget-object v14, v0, Lfmc;->A:Ljava/lang/Object;

    check-cast v14, Ljmc;

    iget-object v15, v0, Lfmc;->z:Ljava/lang/Object;

    check-cast v15, Lruc;

    iget-object v9, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v9, Lruc;

    iget-object v9, v0, Lfmc;->w:Ljava/util/Iterator;

    iget-object v6, v0, Lfmc;->v:Ljmc;

    iget-object v12, v0, Lfmc;->u:Ljava/util/List;

    check-cast v12, Ljava/util/List;

    iget-object v12, v0, Lfmc;->t:Ljava/util/List;

    check-cast v12, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v26, v5

    move-object/from16 v25, v7

    move-object v5, v9

    move-object v8, v15

    move-object/from16 v9, p1

    move-object v7, v6

    move-object v6, v12

    goto/16 :goto_2b6

    :pswitch_d0
    iget-object v5, v0, Lfmc;->C:Lsmc;

    iget-object v6, v0, Lfmc;->B:Ljava/util/Collection;

    check-cast v6, Ljava/util/Collection;

    iget-object v7, v0, Lfmc;->A:Ljava/lang/Object;

    check-cast v7, Ljmc;

    iget-object v9, v0, Lfmc;->z:Ljava/lang/Object;

    check-cast v9, Lruc;

    iget-object v12, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v12, Lruc;

    iget-object v13, v0, Lfmc;->w:Ljava/util/Iterator;

    iget-object v14, v0, Lfmc;->v:Ljmc;

    iget-object v15, v0, Lfmc;->u:Ljava/util/List;

    check-cast v15, Ljava/util/List;

    iget-object v15, v0, Lfmc;->t:Ljava/util/List;

    check-cast v15, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v8, v7

    move-object v7, v5

    move-object v5, v6

    move-object v6, v14

    move-object v14, v8

    move-object v8, v9

    move-object v10, v13

    const/4 v9, 0x0

    move-object/from16 v13, p1

    goto/16 :goto_286

    :pswitch_fd
    iget-object v5, v0, Lfmc;->B:Ljava/util/Collection;

    check-cast v5, Ljava/util/Collection;

    iget-object v6, v0, Lfmc;->A:Ljava/lang/Object;

    check-cast v6, Ljmc;

    iget-object v7, v0, Lfmc;->z:Ljava/lang/Object;

    check-cast v7, Lruc;

    iget-object v9, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v9, Lruc;

    iget-object v12, v0, Lfmc;->w:Ljava/util/Iterator;

    iget-object v13, v0, Lfmc;->v:Ljmc;

    iget-object v14, v0, Lfmc;->u:Ljava/util/List;

    check-cast v14, Ljava/util/List;

    iget-object v14, v0, Lfmc;->t:Ljava/util/List;

    check-cast v14, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v8, p1

    move-object v10, v12

    move-object v11, v13

    move-object v12, v9

    const/4 v9, 0x0

    goto/16 :goto_24c

    :pswitch_124
    iget-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    check-cast v5, Lruc;

    iget-object v6, v0, Lfmc;->w:Ljava/util/Iterator;

    iget-object v7, v0, Lfmc;->v:Ljmc;

    iget-object v9, v0, Lfmc;->u:Ljava/util/List;

    check-cast v9, Ljava/util/List;

    iget-object v9, v0, Lfmc;->t:Ljava/util/List;

    check-cast v9, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v8, p1

    move-object v12, v6

    move-object v6, v7

    move-object v14, v9

    move-object v7, v5

    goto/16 :goto_213

    :pswitch_13f
    iget-object v5, v0, Lfmc;->u:Ljava/util/List;

    check-cast v5, Ljava/util/List;

    iget-object v6, v0, Lfmc;->t:Ljava/util/List;

    check-cast v6, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v7, p1

    goto :goto_1bd

    :pswitch_14d
    iget-object v5, v0, Lfmc;->t:Ljava/util/List;

    check-cast v5, Ljava/util/List;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v6, p1

    goto :goto_195

    :pswitch_157
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_177

    :pswitch_15b
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwlc;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    iput-byte v11, v0, Lfmc;->E:B

    iget-object v6, v5, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v9, Lqv0;

    invoke-direct {v9, v5, v12, v13, v7}, Lqv0;-><init>(Ljava/lang/Object;JB)V

    invoke-static {v6, v9, v0}, Lkfo;->Z(Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v4, :cond_684

    :goto_177
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwlc;

    iput-object v5, v0, Lfmc;->t:Ljava/util/List;

    iput-byte v7, v0, Lfmc;->E:B

    iget-object v6, v6, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v7, Lg8c;

    const/16 v9, 0xc

    invoke-direct {v7, v9}, Lg8c;-><init>(B)V

    invoke-static {v0, v6, v11, v10, v7}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v4, :cond_684

    :goto_195
    check-cast v6, Ljava/util/List;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lwlc;

    move-object v9, v5

    check-cast v9, Ljava/util/List;

    iput-object v9, v0, Lfmc;->t:Ljava/util/List;

    move-object v9, v6

    check-cast v9, Ljava/util/List;

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-byte v8, v0, Lfmc;->E:B

    iget-object v7, v7, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v9, Lg8c;

    const/16 v12, 0x10

    invoke-direct {v9, v12}, Lg8c;-><init>(B)V

    invoke-static {v0, v7, v11, v10, v9}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v7

    if-eq v7, v4, :cond_684

    move-object/from16 v47, v6

    move-object v6, v5

    move-object/from16 v5, v47

    :goto_1bd
    check-cast v7, Lo7f;

    if-eqz v7, :cond_1cb

    new-instance v9, Ljmc;

    iget-object v12, v7, Lo7f;->e:Ljava/lang/String;

    iget-object v7, v7, Lo7f;->f:Ljava/lang/String;

    invoke-direct {v9, v12, v7}, Ljmc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1cc

    :cond_1cb
    const/4 v9, 0x0

    :goto_1cc
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1d0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4f8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lruc;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lwlc;

    iget-wide v13, v7, Lruc;->a:J

    move-object v15, v6

    check-cast v15, Ljava/util/List;

    iput-object v15, v0, Lfmc;->t:Ljava/util/List;

    const/4 v15, 0x0

    iput-object v15, v0, Lfmc;->u:Ljava/util/List;

    iput-object v9, v0, Lfmc;->v:Ljmc;

    iput-object v5, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v7, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v15, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v15, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v15, v0, Lfmc;->A:Ljava/lang/Object;

    iput-object v15, v0, Lfmc;->B:Ljava/util/Collection;

    iput-object v15, v0, Lfmc;->C:Lsmc;

    iput-object v15, v0, Lfmc;->D:Lomc;

    const/4 v15, 0x4

    iput-byte v15, v0, Lfmc;->E:B

    iget-object v12, v12, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v15, Lx41;

    const/16 v8, 0xb

    invoke-direct {v15, v13, v14, v8}, Lx41;-><init>(JB)V

    invoke-static {v0, v12, v11, v10, v15}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v4, :cond_684

    move-object v12, v5

    move-object v14, v6

    move-object v6, v9

    :goto_213
    check-cast v8, Ljava/util/List;

    move-object v5, v8

    check-cast v5, Ljava/util/Collection;

    new-instance v8, Ljoc;

    iget-wide v10, v7, Lruc;->a:J

    sget-object v9, Lapc;->c:Lapc;

    invoke-direct {v8, v10, v11, v9}, Ljoc;-><init>(JLapc;)V

    move-object v9, v14

    check-cast v9, Ljava/util/List;

    iput-object v9, v0, Lfmc;->t:Ljava/util/List;

    const/4 v9, 0x0

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-object v6, v0, Lfmc;->v:Ljmc;

    iput-object v12, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v7, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v9, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v7, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v6, v0, Lfmc;->A:Ljava/lang/Object;

    move-object v10, v5

    check-cast v10, Ljava/util/Collection;

    iput-object v10, v0, Lfmc;->B:Ljava/util/Collection;

    const/4 v10, 0x5

    iput-byte v10, v0, Lfmc;->E:B

    new-instance v10, Lk54;

    const/4 v11, 0x3

    invoke-direct {v10, v1, v8, v9, v11}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v10, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v4, :cond_684

    move-object v11, v6

    move-object v10, v12

    move-object v12, v7

    :goto_24c
    check-cast v8, Lxlc;

    iget-object v8, v8, Lxlc;->a:Lsmc;

    move-object/from16 v16, v14

    iget-wide v13, v12, Lruc;->a:J

    sget-object v17, Lapc;->b:Lix5;

    move-object/from16 v15, v16

    check-cast v15, Ljava/util/List;

    iput-object v15, v0, Lfmc;->t:Ljava/util/List;

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-object v11, v0, Lfmc;->v:Ljmc;

    iput-object v10, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v12, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v9, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v7, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v6, v0, Lfmc;->A:Ljava/lang/Object;

    move-object v15, v5

    check-cast v15, Ljava/util/Collection;

    iput-object v15, v0, Lfmc;->B:Ljava/util/Collection;

    iput-object v8, v0, Lfmc;->C:Lsmc;

    const/4 v15, 0x6

    iput-byte v15, v0, Lfmc;->E:B

    new-instance v15, Lus6;

    invoke-direct {v15, v1, v13, v14, v9}, Lus6;-><init>(Lgmc;JLmt5;)V

    invoke-static {v2, v15, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v13

    if-eq v13, v4, :cond_684

    move-object v14, v8

    move-object v8, v7

    move-object v7, v14

    move-object v14, v6

    move-object v6, v11

    move-object/from16 v15, v16

    :goto_286
    move-object v11, v13

    check-cast v11, Lomc;

    move-object v13, v15

    check-cast v13, Ljava/util/List;

    iput-object v13, v0, Lfmc;->t:Ljava/util/List;

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-object v6, v0, Lfmc;->v:Ljmc;

    iput-object v10, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v9, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v9, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v8, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v14, v0, Lfmc;->A:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Ljava/util/Collection;

    iput-object v9, v0, Lfmc;->B:Ljava/util/Collection;

    iput-object v7, v0, Lfmc;->C:Lsmc;

    iput-object v11, v0, Lfmc;->D:Lomc;

    const/4 v9, 0x7

    iput-byte v9, v0, Lfmc;->E:B

    invoke-virtual {v1, v12, v0}, Lgmc;->e(Lruc;Lnt5;)Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v4, :cond_684

    move-object v13, v5

    move-object/from16 v25, v7

    move-object v5, v10

    move-object/from16 v26, v11

    move-object v7, v6

    move-object v6, v15

    :goto_2b6
    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v29

    new-instance v30, Lrmc;

    iget-wide v9, v8, Lruc;->n:J

    iget v11, v8, Lruc;->j:I

    iget v12, v8, Lruc;->f:I

    iget v15, v8, Lruc;->i:I

    move-object/from16 v42, v2

    iget v2, v8, Lruc;->e:I

    move-object/from16 v43, v3

    iget-object v3, v8, Lruc;->k:Ljava/lang/String;

    move-object/from16 v44, v5

    iget-object v5, v8, Lruc;->o:Ljava/lang/Long;

    move-object/from16 v33, v5

    iget-object v5, v8, Lruc;->p:Ljava/lang/Long;

    move-object/from16 v34, v5

    iget-object v5, v8, Lruc;->q:Ljava/lang/Long;

    move-object/from16 v35, v5

    iget-object v5, v8, Lruc;->r:Ljava/lang/Long;

    move-object/from16 v36, v5

    iget-object v5, v8, Lruc;->s:Ljava/lang/Long;

    move-object/from16 v37, v5

    iget-object v5, v8, Lruc;->t:Ljava/lang/Long;

    move-object/from16 v38, v5

    iget-object v5, v8, Lruc;->u:Ljava/lang/Long;

    move-object/from16 v39, v5

    iget-object v5, v8, Lruc;->v:Ljava/lang/Long;

    move-object/from16 v40, v5

    iget-object v5, v8, Lruc;->w:Ljava/lang/Long;

    move-object/from16 v41, v5

    move-wide/from16 v31, v9

    invoke-direct/range {v30 .. v41}, Lrmc;-><init>(JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V

    new-instance v18, Llmc;

    iget-wide v9, v8, Lruc;->a:J

    sget-object v5, Lapc;->b:Lix5;

    iget-object v5, v8, Lruc;->b:Loi9;

    move-object/from16 v21, v5

    new-instance v5, Lvmc;

    move-object/from16 v31, v7

    new-instance v7, Lymc;

    move-wide/from16 v19, v9

    iget-object v9, v8, Lruc;->c:Ljava/lang/String;

    iget-object v10, v8, Lruc;->d:Ljava/lang/String;

    invoke-direct {v7, v9, v10}, Lymc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v9, Lymc;

    iget-object v10, v8, Lruc;->g:Ljava/lang/String;

    move-object/from16 v22, v13

    iget-object v13, v8, Lruc;->h:Ljava/lang/String;

    invoke-direct {v9, v10, v13}, Lymc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v5, v7, v9}, Lvmc;-><init>(Lymc;Lymc;)V

    iget-object v7, v8, Lruc;->l:Ljava/lang/String;

    const-string v9, "finished"

    if-eqz v14, :cond_40f

    invoke-interface/range {v22 .. v22}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_40f

    new-instance v10, Limc;

    invoke-interface/range {v22 .. v22}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_341

    sget-object v13, Ll08;->a:Ll08;

    move-object/from16 v23, v5

    move-object/from16 v28, v7

    :goto_33a
    move-object/from16 v32, v1

    move-object/from16 v45, v6

    move v1, v15

    goto/16 :goto_409

    :cond_341
    invoke-interface/range {v22 .. v22}, Ljava/util/Collection;->size()I

    move-result v13

    move-object/from16 v23, v5

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v13}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v3, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v24

    invoke-static {v2, v15}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v27

    if-nez v27, :cond_35a

    invoke-static {v12, v11}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v27

    :cond_35a
    check-cast v22, Ljava/lang/Iterable;

    invoke-interface/range {v22 .. v22}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v22

    move-object/from16 v28, v7

    const/4 v7, 0x0

    :goto_363
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_406

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    add-int/lit8 v33, v7, 0x1

    if-ltz v7, :cond_400

    move/from16 v34, v15

    move-object/from16 v15, v32

    check-cast v15, Lvc8;

    if-eqz v24, :cond_37d

    if-nez v7, :cond_384

    if-lez v27, :cond_384

    :cond_37d
    move-object/from16 v32, v1

    :goto_37f
    move/from16 v1, v34

    :goto_381
    const/16 v40, 0x0

    goto :goto_39d

    :cond_384
    move-object/from16 v32, v1

    const/4 v1, 0x3

    if-ne v13, v1, :cond_38f

    const/4 v1, 0x1

    if-ne v7, v1, :cond_390

    if-nez v27, :cond_390

    goto :goto_37f

    :cond_38f
    const/4 v1, 0x1

    :cond_390
    sub-int v7, v13, v7

    if-ne v7, v1, :cond_399

    move/from16 v1, v34

    if-gez v27, :cond_39b

    goto :goto_381

    :cond_399
    move/from16 v1, v34

    :cond_39b
    const/16 v40, 0x1

    :goto_39d
    new-instance v34, Ltmc;

    iget-object v7, v15, Lvc8;->b:Ljava/lang/String;

    move-object/from16 v35, v7

    iget-object v7, v15, Lvc8;->c:Ljava/lang/String;

    move-object/from16 v45, v6

    move-object/from16 v36, v7

    iget-wide v6, v15, Lvc8;->f:D

    const-wide/high16 v37, 0x3ff0000000000000L    # 1.0

    cmpg-double v37, v6, v37

    if-nez v37, :cond_3b8

    const-string v6, "-"

    move/from16 v46, v13

    :goto_3b5
    move-object/from16 v37, v6

    goto :goto_3d2

    :cond_3b8
    move-wide/from16 v37, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static/range {v37 .. v38}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    move/from16 v46, v13

    const/4 v13, 0x1

    invoke-static {v7, v13}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v7

    const-string v13, "%.2f"

    invoke-static {v6, v13, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_3b5

    :goto_3d2
    iget-object v6, v15, Lvc8;->h:Ljava/lang/String;

    xor-int/lit8 v39, v24, 0x1

    iget v7, v15, Lvc8;->g:I

    const/4 v13, -0x1

    if-eq v7, v13, :cond_3ea

    const/4 v15, 0x1

    if-eq v7, v15, :cond_3e3

    move-object/from16 v38, v6

    const/16 v41, 0x0

    goto :goto_3ed

    :cond_3e3
    sget-object v7, Lumc;->a:Lumc;

    :goto_3e5
    move-object/from16 v38, v6

    move-object/from16 v41, v7

    goto :goto_3ed

    :cond_3ea
    sget-object v7, Lumc;->b:Lumc;

    goto :goto_3e5

    :goto_3ed
    invoke-direct/range {v34 .. v41}, Ltmc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLumc;)V

    move-object/from16 v6, v34

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v15, v1

    move-object/from16 v1, v32

    move/from16 v7, v33

    move-object/from16 v6, v45

    move/from16 v13, v46

    goto/16 :goto_363

    :cond_400
    invoke-static {}, Lj95;->n()V

    const/16 v16, 0x0

    throw v16

    :cond_406
    move-object v13, v5

    goto/16 :goto_33a

    :goto_409
    invoke-direct {v10, v14, v13}, Limc;-><init>(Ljmc;Ljava/util/List;)V

    move-object/from16 v27, v10

    goto :goto_41a

    :cond_40f
    move-object/from16 v32, v1

    move-object/from16 v23, v5

    move-object/from16 v45, v6

    move-object/from16 v28, v7

    move v1, v15

    const/16 v27, 0x0

    :goto_41a
    const-string v5, "delayed"

    move-object/from16 v22, v23

    move-object/from16 v23, v28

    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v28

    move-object/from16 v24, v30

    invoke-direct/range {v18 .. v29}, Llmc;-><init>(JLoi9;Lvmc;Ljava/lang/String;Lrmc;Lsmc;Lomc;Limc;ZZ)V

    move-object/from16 v6, v18

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_72a

    goto/16 :goto_4d1

    :sswitch_434
    const-string v1, "deleted"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    goto/16 :goto_4d1

    :sswitch_43b
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4c3

    goto/16 :goto_4d1

    :sswitch_443
    const-string v5, "in progress"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d1

    new-instance v3, Lxmc;

    invoke-direct {v3, v2, v1}, Lxmc;-><init>(II)V

    new-instance v1, Lxmc;

    invoke-direct {v1, v12, v11}, Lxmc;-><init>(II)V

    new-instance v2, Lqmc;

    invoke-direct {v2, v6, v3, v1}, Lqmc;-><init>(Llmc;Lxmc;Lxmc;)V

    goto/16 :goto_4e2

    :sswitch_45c
    const-string v1, "cancelled"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d1

    new-instance v1, Lkmc;

    invoke-direct {v1, v6}, Lkmc;-><init>(Llmc;)V

    :goto_469
    move-object v2, v1

    goto/16 :goto_4e2

    :sswitch_46c
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d1

    iget-object v3, v8, Lruc;->m:Ljava/lang/String;

    if-eqz v3, :cond_4a8

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    const/16 v7, 0xc2f

    if-eq v5, v7, :cond_49d

    const/16 v7, 0xcce

    if-eq v5, v7, :cond_492

    const v7, 0x178d0

    if-ne v5, v7, :cond_4a8

    const-string v5, "aet"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4a8

    sget-object v3, Lmmc;->b:Lmmc;

    goto :goto_4a9

    :cond_492
    const-string v5, "ft"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4a8

    sget-object v3, Lmmc;->a:Lmmc;

    goto :goto_4a9

    :cond_49d
    const-string v5, "ap"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4a8

    sget-object v3, Lmmc;->c:Lmmc;

    goto :goto_4a9

    :cond_4a8
    const/4 v3, 0x0

    :goto_4a9
    if-eqz v3, :cond_4d1

    new-instance v5, Lxmc;

    invoke-direct {v5, v2, v1}, Lxmc;-><init>(II)V

    new-instance v1, Lxmc;

    invoke-direct {v1, v12, v11}, Lxmc;-><init>(II)V

    new-instance v2, Lnmc;

    invoke-direct {v2, v6, v5, v1, v3}, Lnmc;-><init>(Llmc;Lxmc;Lxmc;Lmmc;)V

    goto :goto_4e2

    :sswitch_4bb
    const-string v1, "not started"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d1

    :cond_4c3
    new-instance v1, Lwmc;

    invoke-direct {v1, v6, v3}, Lwmc;-><init>(Llmc;Ljava/lang/String;)V

    goto :goto_469

    :sswitch_4c9
    const-string v5, "interrupted"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4d3

    :cond_4d1
    :goto_4d1
    const/4 v2, 0x0

    goto :goto_4e2

    :cond_4d3
    new-instance v3, Lxmc;

    invoke-direct {v3, v2, v1}, Lxmc;-><init>(II)V

    new-instance v1, Lxmc;

    invoke-direct {v1, v12, v11}, Lxmc;-><init>(II)V

    new-instance v2, Lpmc;

    invoke-direct {v2, v6, v3, v1}, Lpmc;-><init>(Llmc;Lxmc;Lxmc;)V

    :goto_4e2
    move-object/from16 v12, v45

    if-eqz v2, :cond_4e9

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4e9
    move-object v6, v12

    move-object/from16 v9, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v42

    move-object/from16 v3, v43

    move-object/from16 v5, v44

    const/4 v10, 0x0

    const/4 v11, 0x1

    goto/16 :goto_1d0

    :cond_4f8
    move-object/from16 v32, v1

    move-object/from16 v43, v3

    invoke-virtual/range {v43 .. v43}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwlc;

    move-object v2, v6

    check-cast v2, Ljava/util/List;

    iput-object v2, v0, Lfmc;->t:Ljava/util/List;

    const/4 v2, 0x0

    iput-object v2, v0, Lfmc;->u:Ljava/util/List;

    iput-object v9, v0, Lfmc;->v:Ljmc;

    iput-object v2, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v2, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v2, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v2, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v2, v0, Lfmc;->A:Ljava/lang/Object;

    iput-object v2, v0, Lfmc;->B:Ljava/util/Collection;

    iput-object v2, v0, Lfmc;->C:Lsmc;

    iput-object v2, v0, Lfmc;->D:Lomc;

    const/16 v2, 0x8

    iput-byte v2, v0, Lfmc;->E:B

    iget-object v1, v1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v2, Lg8c;

    const/16 v3, 0xd

    invoke-direct {v2, v3}, Lg8c;-><init>(B)V

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v0, v1, v15, v13, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v4, :cond_684

    move-object v8, v6

    move-object v7, v9

    :goto_533
    check-cast v1, Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_546
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_566

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lr0f;

    new-instance v6, Lkoc;

    new-instance v9, Ljoc;

    iget-wide v10, v3, Lr0f;->a:J

    iget-object v12, v3, Lr0f;->b:Lapc;

    invoke-direct {v9, v10, v11, v12}, Ljoc;-><init>(JLapc;)V

    iget-boolean v3, v3, Lr0f;->d:Z

    invoke-direct {v6, v9, v3}, Lkoc;-><init>(Ljoc;Z)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_546

    :cond_566
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_56f
    :goto_56f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_584

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lr0f;

    iget-boolean v6, v6, Lr0f;->d:Z

    if-nez v6, :cond_56f

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_56f

    :cond_584
    new-instance v1, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v6, 0x0

    :goto_594
    if-ge v6, v3, :cond_5ab

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v6, v6, 0x1

    check-cast v9, Lr0f;

    new-instance v10, Ljoc;

    iget-wide v11, v9, Lr0f;->a:J

    iget-object v9, v9, Lr0f;->b:Lapc;

    invoke-direct {v10, v11, v12, v9}, Ljoc;-><init>(JLapc;)V

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_594

    :cond_5ab
    invoke-virtual/range {v43 .. v43}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    move-object v3, v8

    check-cast v3, Ljava/util/List;

    iput-object v3, v0, Lfmc;->t:Ljava/util/List;

    const/4 v9, 0x0

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-object v7, v0, Lfmc;->v:Ljmc;

    iput-object v9, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v1, v0, Lfmc;->y:Ljava/util/ArrayList;

    const/16 v3, 0x9

    iput-byte v3, v0, Lfmc;->E:B

    iget-object v2, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lg8c;

    const/16 v6, 0x12

    invoke-direct {v3, v6}, Lg8c;-><init>(B)V

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v0, v2, v15, v13, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v4, :cond_684

    :goto_5d6
    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v2, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v3, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5e7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_600

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfh9;

    new-instance v9, Ljoc;

    iget-wide v10, v6, Lfh9;->a:J

    iget-object v6, v6, Lfh9;->b:Lapc;

    invoke-direct {v9, v10, v11, v6}, Ljoc;-><init>(JLapc;)V

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5e7

    :cond_600
    invoke-virtual/range {v43 .. v43}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    move-object v6, v8

    check-cast v6, Ljava/util/List;

    iput-object v6, v0, Lfmc;->t:Ljava/util/List;

    const/4 v9, 0x0

    iput-object v9, v0, Lfmc;->u:Ljava/util/List;

    iput-object v7, v0, Lfmc;->v:Ljmc;

    iput-object v9, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v1, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v3, v0, Lfmc;->z:Ljava/lang/Object;

    const/16 v6, 0xa

    iput-byte v6, v0, Lfmc;->E:B

    iget-object v2, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v9, Lg8c;

    const/16 v10, 0x13

    invoke-direct {v9, v10}, Lg8c;-><init>(B)V

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v0, v2, v15, v13, v9}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v4, :cond_684

    :goto_62d
    check-cast v2, Ljava/lang/Iterable;

    new-instance v9, Ljava/util/ArrayList;

    invoke-static {v2, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_63c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_655

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgh9;

    new-instance v10, Lkpc;

    iget-wide v11, v6, Lgh9;->a:J

    iget-object v6, v6, Lgh9;->b:Lapc;

    invoke-direct {v10, v11, v12, v6}, Lkpc;-><init>(JLapc;)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_63c

    :cond_655
    invoke-virtual/range {v43 .. v43}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    move-object v6, v8

    check-cast v6, Ljava/util/List;

    iput-object v6, v0, Lfmc;->t:Ljava/util/List;

    const/4 v6, 0x0

    iput-object v6, v0, Lfmc;->u:Ljava/util/List;

    iput-object v7, v0, Lfmc;->v:Ljmc;

    iput-object v6, v0, Lfmc;->w:Ljava/util/Iterator;

    iput-object v5, v0, Lfmc;->x:Ljava/lang/Object;

    iput-object v1, v0, Lfmc;->y:Ljava/util/ArrayList;

    iput-object v3, v0, Lfmc;->z:Ljava/lang/Object;

    iput-object v9, v0, Lfmc;->A:Ljava/lang/Object;

    const/16 v6, 0xb

    iput-byte v6, v0, Lfmc;->E:B

    iget-object v2, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v6, Lg8c;

    const/16 v10, 0x14

    invoke-direct {v6, v10}, Lg8c;-><init>(B)V

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v0, v2, v15, v13, v6}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v4, :cond_685

    :cond_684
    return-object v4

    :cond_685
    move-object v4, v1

    move-object v6, v7

    move-object v2, v9

    :goto_688
    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v7, 0xa

    invoke-static {v0, v7}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v1, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_699
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6b2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lhh9;

    new-instance v9, Lspc;

    iget-wide v10, v7, Lhh9;->a:J

    iget-object v7, v7, Lhh9;->b:Lapc;

    invoke-direct {v9, v10, v11, v7}, Lspc;-><init>(JLapc;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_699

    :cond_6b2
    move-object/from16 v7, v32

    iget-object v0, v7, Lgmc;->g:Lnak;

    invoke-virtual {v0, v8}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->h:Lnak;

    invoke-virtual {v0, v6}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->n:Lnak;

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    new-instance v8, Ljava/util/ArrayList;

    const/16 v9, 0xa

    invoke-static {v6, v9}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6d2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6e6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lkoc;

    iget-object v9, v9, Lkoc;->a:Ljoc;

    iget-object v9, v9, Ljoc;->b:Lapc;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6d2

    :cond_6e6
    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v6

    invoke-virtual {v0, v6}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->i:Lnak;

    invoke-virtual {v0, v5}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->j:Lnak;

    invoke-virtual {v0, v4}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->k:Lnak;

    invoke-virtual {v0, v3}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->l:Lnak;

    invoke-virtual {v0, v2}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, v7, Lgmc;->m:Lnak;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v9, 0x0

    invoke-virtual {v0, v9, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_70e
    .packed-switch 0x0
        :pswitch_15b
        :pswitch_157
        :pswitch_14d
        :pswitch_13f
        :pswitch_124
        :pswitch_fd
        :pswitch_d0
        :pswitch_a1
        :pswitch_8a
        :pswitch_6a
        :pswitch_40
        :pswitch_1a
    .end packed-switch

    :sswitch_data_72a
    .sparse-switch
        -0x7416d1be -> :sswitch_4c9
        -0x5fcffbcc -> :sswitch_4bb
        -0x28273f8e -> :sswitch_46c
        0x1c682951 -> :sswitch_45c
        0x563e8ec8 -> :sswitch_443
        0x5c687162 -> :sswitch_43b
        0x5c6a3019 -> :sswitch_434
    .end sparse-switch
.end method
