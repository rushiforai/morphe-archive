.class public final Lwq6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public A:Ljava/lang/Object;

.field public B:Llla;

.field public C:Z

.field public D:B

.field public synthetic E:Ljava/lang/Object;

.field public final synthetic F:Li06;

.field public final synthetic G:Z

.field public final synthetic H:Z

.field public final synthetic I:Z

.field public final synthetic J:Z

.field public final synthetic K:Leq6;

.field public final synthetic L:Lxm5;

.field public final synthetic M:Lx77;

.field public final synthetic N:Lqe6;

.field public final synthetic O:Lk5o;

.field public t:Li07;

.field public u:Li07;

.field public v:Li07;

.field public w:Li07;

.field public x:Ljava/lang/Object;

.field public y:Ljava/lang/Object;

.field public z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Li06;ZZZZLeq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V
    .registers 12

    iput-object p1, p0, Lwq6;->F:Li06;

    iput-boolean p2, p0, Lwq6;->G:Z

    iput-boolean p3, p0, Lwq6;->H:Z

    iput-boolean p4, p0, Lwq6;->I:Z

    iput-boolean p5, p0, Lwq6;->J:Z

    iput-object p6, p0, Lwq6;->K:Leq6;

    iput-object p7, p0, Lwq6;->L:Lxm5;

    iput-object p8, p0, Lwq6;->M:Lx77;

    iput-object p9, p0, Lwq6;->N:Lqe6;

    iput-object p10, p0, Lwq6;->O:Lk5o;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p11}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 15

    new-instance v0, Lwq6;

    iget-object v9, p0, Lwq6;->N:Lqe6;

    iget-object v10, p0, Lwq6;->O:Lk5o;

    iget-object v1, p0, Lwq6;->F:Li06;

    iget-boolean v2, p0, Lwq6;->G:Z

    iget-boolean v3, p0, Lwq6;->H:Z

    iget-boolean v4, p0, Lwq6;->I:Z

    iget-boolean v5, p0, Lwq6;->J:Z

    iget-object v6, p0, Lwq6;->K:Leq6;

    iget-object v7, p0, Lwq6;->L:Lxm5;

    iget-object v8, p0, Lwq6;->M:Lx77;

    move-object v11, p2

    invoke-direct/range {v0 .. v11}, Lwq6;-><init>(Li06;ZZZZLeq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V

    iput-object p1, v0, Lwq6;->E:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwq6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwq6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwq6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lwq6;->E:Ljava/lang/Object;

    check-cast v1, Lnx5;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-byte v3, v0, Lwq6;->D:B

    const/4 v4, 0x3

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v3, :pswitch_data_1ee

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :pswitch_16
    iget-object v1, v0, Lwq6;->A:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, v0, Lwq6;->z:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    iget-object v3, v0, Lwq6;->y:Ljava/lang/Object;

    check-cast v3, Lsla;

    iget-object v4, v0, Lwq6;->x:Ljava/lang/Object;

    check-cast v4, Lhla;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v10, v4

    move-object v4, v3

    move-object/from16 v3, p1

    goto/16 :goto_1db

    :pswitch_2f
    iget-boolean v1, v0, Lwq6;->C:Z

    iget-object v3, v0, Lwq6;->B:Llla;

    iget-object v4, v0, Lwq6;->A:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v5, v0, Lwq6;->z:Ljava/lang/Object;

    check-cast v5, Ljla;

    iget-object v7, v0, Lwq6;->y:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, v0, Lwq6;->x:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v9, v0, Lwq6;->w:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v14, v3

    move-object v13, v5

    move-object v3, v9

    move-object/from16 v9, p1

    :goto_4d
    move-object v15, v4

    move-object v12, v7

    move-object v11, v8

    goto/16 :goto_194

    :pswitch_52
    iget-object v1, v0, Lwq6;->B:Llla;

    iget-object v3, v0, Lwq6;->A:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v0, Lwq6;->z:Ljava/lang/Object;

    check-cast v4, Ljla;

    iget-object v7, v0, Lwq6;->y:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, v0, Lwq6;->x:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v9, v0, Lwq6;->w:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v10, v3

    move-object v3, v1

    move-object v1, v4

    move-object v4, v10

    move-object v10, v9

    move-object/from16 v9, p1

    goto/16 :goto_168

    :pswitch_72
    iget-object v1, v0, Lwq6;->z:Ljava/lang/Object;

    check-cast v1, Ljla;

    iget-object v3, v0, Lwq6;->y:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v0, Lwq6;->x:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v7, v0, Lwq6;->w:Li07;

    iget-object v8, v0, Lwq6;->v:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v9, v8

    move-object v8, v3

    move-object/from16 v3, p1

    goto/16 :goto_13f

    :pswitch_8b
    iget-object v1, v0, Lwq6;->x:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v3, v0, Lwq6;->w:Li07;

    iget-object v7, v0, Lwq6;->v:Li07;

    iget-object v8, v0, Lwq6;->u:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v9, v7

    move-object v7, v3

    move-object v3, v8

    move-object/from16 v8, p1

    goto/16 :goto_121

    :pswitch_9f
    iget-object v1, v0, Lwq6;->w:Li07;

    iget-object v3, v0, Lwq6;->v:Li07;

    iget-object v7, v0, Lwq6;->u:Li07;

    iget-object v8, v0, Lwq6;->t:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v9, v3

    move-object/from16 v3, p1

    goto :goto_104

    :pswitch_ae
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v3, Lyf;

    iget-object v7, v0, Lwq6;->K:Leq6;

    const/16 v8, 0xf

    invoke-direct {v3, v8, v6, v7}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v6, v6, v3, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v3

    new-instance v7, Lyf;

    iget-object v8, v0, Lwq6;->L:Lxm5;

    const/16 v9, 0xc

    invoke-direct {v7, v9, v6, v8}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v6, v6, v7, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v8

    new-instance v7, Lyf;

    iget-object v9, v0, Lwq6;->M:Lx77;

    const/16 v10, 0xd

    invoke-direct {v7, v10, v6, v9}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v6, v6, v7, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v7

    new-instance v9, Lyf;

    iget-object v10, v0, Lwq6;->N:Lqe6;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v6, v10}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v6, v6, v9, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v9

    new-instance v10, Lyf;

    iget-object v11, v0, Lwq6;->O:Lk5o;

    const/16 v12, 0x10

    invoke-direct {v10, v12, v6, v11}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v6, v6, v10, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v1

    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v8, v0, Lwq6;->t:Li07;

    iput-object v7, v0, Lwq6;->u:Li07;

    iput-object v9, v0, Lwq6;->v:Li07;

    iput-object v1, v0, Lwq6;->w:Li07;

    iput-byte v5, v0, Lwq6;->D:B

    invoke-virtual {v3, v0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v2, :cond_1d7

    :goto_104
    check-cast v3, Ljava/lang/String;

    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->t:Li07;

    iput-object v7, v0, Lwq6;->u:Li07;

    iput-object v9, v0, Lwq6;->v:Li07;

    iput-object v1, v0, Lwq6;->w:Li07;

    iput-object v3, v0, Lwq6;->x:Ljava/lang/Object;

    const/4 v10, 0x2

    iput-byte v10, v0, Lwq6;->D:B

    invoke-interface {v8, v0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v2, :cond_1d7

    move-object/from16 v19, v7

    move-object v7, v1

    move-object v1, v3

    move-object/from16 v3, v19

    :goto_121
    check-cast v8, Ljava/lang/String;

    sget-object v10, Ljla;->c:Ljla;

    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->t:Li07;

    iput-object v6, v0, Lwq6;->u:Li07;

    iput-object v9, v0, Lwq6;->v:Li07;

    iput-object v7, v0, Lwq6;->w:Li07;

    iput-object v1, v0, Lwq6;->x:Ljava/lang/Object;

    iput-object v8, v0, Lwq6;->y:Ljava/lang/Object;

    iput-object v10, v0, Lwq6;->z:Ljava/lang/Object;

    iput-byte v4, v0, Lwq6;->D:B

    invoke-interface {v3, v0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v2, :cond_1d7

    move-object v4, v1

    move-object v1, v10

    :goto_13f
    check-cast v3, Ljava/lang/String;

    sget-object v10, Llla;->c:Llla;

    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->t:Li07;

    iput-object v6, v0, Lwq6;->u:Li07;

    iput-object v6, v0, Lwq6;->v:Li07;

    iput-object v7, v0, Lwq6;->w:Li07;

    iput-object v4, v0, Lwq6;->x:Ljava/lang/Object;

    iput-object v8, v0, Lwq6;->y:Ljava/lang/Object;

    iput-object v1, v0, Lwq6;->z:Ljava/lang/Object;

    iput-object v3, v0, Lwq6;->A:Ljava/lang/Object;

    iput-object v10, v0, Lwq6;->B:Llla;

    const/4 v11, 0x4

    iput-byte v11, v0, Lwq6;->D:B

    invoke-interface {v9, v0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v2, :cond_1d7

    move-object/from16 v19, v4

    move-object v4, v3

    move-object v3, v10

    move-object v10, v7

    move-object v7, v8

    move-object/from16 v8, v19

    :goto_168
    sget-object v11, Lea8;->b:Lea8;

    if-eq v9, v11, :cond_16d

    const/4 v5, 0x0

    :cond_16d
    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->t:Li07;

    iput-object v6, v0, Lwq6;->u:Li07;

    iput-object v6, v0, Lwq6;->v:Li07;

    iput-object v10, v0, Lwq6;->w:Li07;

    iput-object v8, v0, Lwq6;->x:Ljava/lang/Object;

    iput-object v7, v0, Lwq6;->y:Ljava/lang/Object;

    iput-object v1, v0, Lwq6;->z:Ljava/lang/Object;

    iput-object v4, v0, Lwq6;->A:Ljava/lang/Object;

    iput-object v3, v0, Lwq6;->B:Llla;

    iput-boolean v5, v0, Lwq6;->C:Z

    const/4 v9, 0x5

    iput-byte v9, v0, Lwq6;->D:B

    iget-object v9, v0, Lwq6;->F:Li06;

    invoke-virtual {v9, v0}, Li06;->i(Lnt5;)Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v2, :cond_1d7

    move-object v13, v1

    move-object v14, v3

    move v1, v5

    move-object v3, v10

    goto/16 :goto_4d

    :goto_194
    move-object/from16 v17, v9

    check-cast v17, Ljava/lang/String;

    new-instance v10, Lhla;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    iget-boolean v1, v0, Lwq6;->G:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v18

    invoke-direct/range {v10 .. v18}, Lhla;-><init>(Ljava/lang/String;Ljava/lang/String;Ljla;Llla;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;)V

    new-instance v1, Lsla;

    iget-boolean v4, v0, Lwq6;->H:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v1, v4}, Lsla;-><init>(Ljava/lang/Boolean;)V

    iget-boolean v4, v0, Lwq6;->I:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v6, v0, Lwq6;->E:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->t:Li07;

    iput-object v6, v0, Lwq6;->u:Li07;

    iput-object v6, v0, Lwq6;->v:Li07;

    iput-object v6, v0, Lwq6;->w:Li07;

    iput-object v10, v0, Lwq6;->x:Ljava/lang/Object;

    iput-object v1, v0, Lwq6;->y:Ljava/lang/Object;

    iput-object v4, v0, Lwq6;->z:Ljava/lang/Object;

    iput-object v5, v0, Lwq6;->A:Ljava/lang/Object;

    iput-object v6, v0, Lwq6;->B:Llla;

    const/4 v6, 0x6

    iput-byte v6, v0, Lwq6;->D:B

    invoke-interface {v3, v0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v2, :cond_1d8

    :cond_1d7
    return-object v2

    :cond_1d8
    move-object v2, v4

    move-object v4, v1

    move-object v1, v5

    :goto_1db
    check-cast v3, Ljava/lang/Boolean;

    iget-boolean v0, v0, Lwq6;->J:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    new-instance v5, La2g;

    invoke-direct {v5, v2, v1, v3, v0}, La2g;-><init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    new-instance v0, Lbla;

    invoke-direct {v0, v10, v4, v5}, Lbla;-><init>(Lhla;Lsla;La2g;)V

    return-object v0

    :pswitch_data_1ee
    .packed-switch 0x0
        :pswitch_ae
        :pswitch_9f
        :pswitch_8b
        :pswitch_72
        :pswitch_52
        :pswitch_2f
        :pswitch_16
    .end packed-switch
.end method
