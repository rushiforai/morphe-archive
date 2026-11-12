.class public final Lvs6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnx5;

.field public final b:Lgmc;

.field public final c:Lti9;

.field public final d:Lrs6;

.field public final e:Lqs6;

.field public final f:Le2f;


# direct methods
.method public constructor <init>(Lnx5;Lgmc;Lti9;Lrs6;Lqs6;Le2f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvs6;->a:Lnx5;

    iput-object p2, p0, Lvs6;->b:Lgmc;

    iput-object p3, p0, Lvs6;->c:Lti9;

    iput-object p4, p0, Lvs6;->d:Lrs6;

    iput-object p5, p0, Lvs6;->e:Lqs6;

    iput-object p6, p0, Lvs6;->f:Le2f;

    return-void
.end method


# virtual methods
.method public final a(Ljoc;JLcom/opera/api/Callback;)V
    .registers 12

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    invoke-static {p2, p3, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide p2

    const/16 v0, 0xe

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {p2, p3, v0, v1}, Lpn7;->m(JJ)J

    move-result-wide p2

    invoke-static {p2, p3}, Lpn7;->f(J)J

    move-result-wide v3

    iget-object v1, p0, Lvs6;->f:Le2f;

    iget-object p0, v1, Le2f;->a:Lnx5;

    new-instance v0, Lt3;

    const/4 v6, 0x0

    move-object v2, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lt3;-><init>(Le2f;Ljoc;JLcom/opera/api/Callback;Lmt5;)V

    const/4 p1, 0x3

    const/4 p2, 0x0

    invoke-static {p0, p2, p2, v0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final b(JLapc;ILch9;)V
    .registers 14

    iget-object v2, p0, Lvs6;->b:Lgmc;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzlc;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide v3, p1

    move-object v5, p3

    move v1, p4

    invoke-direct/range {v0 .. v7}, Lzlc;-><init>(ILgmc;JLapc;Lmt5;B)V

    move-wide p3, v3

    invoke-virtual {v2, v0}, Lgmc;->d(Lkotlin/jvm/functions/Function1;)V

    const/4 p1, 0x1

    if-ne v1, p1, :cond_29

    sget-object p1, Lapc;->c:Lapc;

    if-ne v5, p1, :cond_29

    move-object p2, p0

    new-instance p0, Lss6;

    move-object p1, p5

    const/4 p5, 0x0

    invoke-direct/range {p0 .. p5}, Lss6;-><init>(Lch9;Lvs6;JLmt5;)V

    const/4 p1, 0x3

    iget-object p2, p2, Lvs6;->a:Lnx5;

    const/4 p3, 0x0

    invoke-static {p2, p3, p3, p0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_29
    return-void
.end method

.method public final c(JLoi9;Lnt5;)Ljava/lang/Object;
    .registers 29

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p4

    instance-of v4, v3, Lts6;

    if-eqz v4, :cond_19

    move-object v4, v3

    check-cast v4, Lts6;

    iget v5, v4, Lts6;->x:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_19

    sub-int/2addr v5, v6

    iput v5, v4, Lts6;->x:I

    goto :goto_1e

    :cond_19
    new-instance v4, Lts6;

    invoke-direct {v4, v0, v3}, Lts6;-><init>(Lvs6;Lnt5;)V

    :goto_1e
    iget-object v3, v4, Lts6;->v:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lts6;->x:I

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-eqz v6, :cond_42

    if-eq v6, v9, :cond_39

    if-ne v6, v8, :cond_33

    iget-object v0, v4, Lts6;->u:Loi9;

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9b

    :cond_33
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_39
    iget-wide v1, v4, Lts6;->t:J

    iget-object v6, v4, Lts6;->u:Loi9;

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    move-object v10, v6

    goto :goto_69

    :cond_42
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v3, p3

    iput-object v3, v4, Lts6;->u:Loi9;

    iput-wide v1, v4, Lts6;->t:J

    iput v9, v4, Lts6;->x:I

    iget-object v6, v0, Lvs6;->b:Lgmc;

    iget-object v6, v6, Lgmc;->a:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwlc;

    iget-object v6, v6, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v10, Lx41;

    const/16 v11, 0x8

    invoke-direct {v10, v1, v2, v11}, Lx41;-><init>(JB)V

    const/4 v11, 0x0

    invoke-static {v4, v6, v9, v11, v10}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v5, :cond_99

    move-object v10, v3

    move-object v3, v6

    :goto_69
    move-object v9, v3

    check-cast v9, Lruc;

    if-eqz v9, :cond_89

    const/16 v22, 0x0

    const v23, 0x7ffffd

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-static/range {v9 .. v23}, Lruc;->a(Lruc;Loi9;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;I)Lruc;

    move-result-object v0

    return-object v0

    :cond_89
    iput-object v10, v4, Lts6;->u:Loi9;

    iput-wide v1, v4, Lts6;->t:J

    iput v8, v4, Lts6;->x:I

    iget-object v0, v0, Lvs6;->c:Lti9;

    iget-object v0, v0, Lti9;->h:Ldoc;

    invoke-virtual {v0, v1, v2, v4}, Ldoc;->a(JLnt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v5, :cond_9a

    :cond_99
    return-object v5

    :cond_9a
    move-object v0, v10

    :goto_9b
    check-cast v3, Lmme;

    if-eqz v3, :cond_a4

    invoke-static {v3, v0}, Lzi4;->x(Lmme;Loi9;)Lruc;

    move-result-object v0

    return-object v0

    :cond_a4
    return-object v7
.end method

.method public final d(JLapc;I)V
    .registers 19

    iget-object v2, p0, Lvs6;->b:Lgmc;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzlc;

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-wide v3, p1

    move-object/from16 v5, p3

    move/from16 v1, p4

    invoke-direct/range {v0 .. v7}, Lzlc;-><init>(ILgmc;JLapc;Lmt5;B)V

    invoke-virtual {v2, v0}, Lgmc;->d(Lkotlin/jvm/functions/Function1;)V

    const/4 v0, 0x1

    if-ne v1, v0, :cond_2c

    sget-object v0, Lapc;->c:Lapc;

    move-object/from16 v5, p3

    if-ne v5, v0, :cond_2c

    new-instance v8, Lus6;

    const/4 v9, 0x0

    const/4 v12, 0x0

    move-object v13, p0

    move-wide v10, p1

    invoke-direct/range {v8 .. v13}, Lus6;-><init>(BJLmt5;Ljava/lang/Object;)V

    const/4 v0, 0x3

    iget-object p0, p0, Lvs6;->a:Lnx5;

    invoke-static {p0, v12, v12, v8, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_2c
    return-void
.end method
