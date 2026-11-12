.class public final Lbmc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic A:Ljoc;

.field public final synthetic B:J

.field public final synthetic C:Z

.field public t:Lpfe;

.field public u:Lgmc;

.field public v:Ljoc;

.field public w:Z

.field public x:B

.field public final synthetic y:Lsmc;

.field public final synthetic z:Lgmc;


# direct methods
.method public constructor <init>(Lsmc;Lgmc;Ljoc;JZLmt5;)V
    .registers 8

    iput-object p1, p0, Lbmc;->y:Lsmc;

    iput-object p2, p0, Lbmc;->z:Lgmc;

    iput-object p3, p0, Lbmc;->A:Ljoc;

    iput-wide p4, p0, Lbmc;->B:J

    iput-boolean p6, p0, Lbmc;->C:Z

    const/4 p1, 0x1

    invoke-direct {p0, p1, p7}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 10

    new-instance v0, Lbmc;

    iget-wide v4, p0, Lbmc;->B:J

    iget-boolean v6, p0, Lbmc;->C:Z

    iget-object v1, p0, Lbmc;->y:Lsmc;

    iget-object v2, p0, Lbmc;->z:Lgmc;

    iget-object v3, p0, Lbmc;->A:Ljoc;

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lbmc;-><init>(Lsmc;Lgmc;Ljoc;JZLmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lmt5;

    invoke-virtual {p0, p1}, Lbmc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbmc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbmc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v0, Lbmc;->x:B

    const/4 v3, 0x5

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    iget-object v8, v0, Lbmc;->A:Ljoc;

    iget-object v9, v0, Lbmc;->z:Lgmc;

    const/4 v10, 0x0

    if-eqz v2, :cond_51

    if-eq v2, v7, :cond_4d

    if-eq v2, v6, :cond_42

    if-eq v2, v5, :cond_3b

    if-eq v2, v4, :cond_2f

    if-ne v2, v3, :cond_29

    iget-boolean v1, v0, Lbmc;->w:Z

    iget-object v8, v0, Lbmc;->v:Ljoc;

    iget-object v9, v0, Lbmc;->u:Lgmc;

    iget-object v0, v0, Lbmc;->t:Lpfe;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v0

    goto :goto_76

    :cond_29
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v10

    :cond_2f
    iget-object v8, v0, Lbmc;->v:Ljoc;

    iget-object v9, v0, Lbmc;->u:Lgmc;

    iget-object v0, v0, Lbmc;->t:Lpfe;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v0

    goto/16 :goto_108

    :cond_3b
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v19, v8

    goto/16 :goto_f4

    :cond_42
    iget-object v8, v0, Lbmc;->v:Ljoc;

    iget-object v9, v0, Lbmc;->u:Lgmc;

    iget-object v0, v0, Lbmc;->t:Lpfe;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v0

    goto :goto_b8

    :cond_4d
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a8

    :cond_51
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lbmc;->y:Lsmc;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v11, 0x0

    if-eqz v2, :cond_c6

    if-eq v2, v7, :cond_8d

    if-ne v2, v6, :cond_89

    iget-object v2, v9, Lgmc;->f:Lpfe;

    iput-object v2, v0, Lbmc;->t:Lpfe;

    iput-object v9, v0, Lbmc;->u:Lgmc;

    iput-object v8, v0, Lbmc;->v:Ljoc;

    iget-boolean v4, v0, Lbmc;->C:Z

    iput-boolean v4, v0, Lbmc;->w:Z

    iput-byte v3, v0, Lbmc;->x:B

    invoke-virtual {v2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_106

    move v1, v4

    :goto_76
    :try_start_76
    iget-object v0, v9, Lgmc;->e:Ljava/util/LinkedHashMap;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7f
    .catchall {:try_start_76 .. :try_end_7f} :catchall_84

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    goto/16 :goto_110

    :catchall_84
    move-exception v0

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0

    :cond_89
    invoke-static {}, Lh9o;->p()V

    return-object v10

    :cond_8d
    iget-object v2, v9, Lgmc;->a:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    iget-wide v3, v8, Ljoc;->a:J

    iget-object v5, v8, Ljoc;->b:Lapc;

    iput-byte v7, v0, Lbmc;->x:B

    iget-object v2, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v12, Lrlc;

    invoke-direct {v12, v3, v4, v5, v11}, Lrlc;-><init>(JLapc;B)V

    invoke-static {v0, v2, v11, v7, v12}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_106

    :goto_a8
    iget-object v2, v9, Lgmc;->f:Lpfe;

    iput-object v2, v0, Lbmc;->t:Lpfe;

    iput-object v9, v0, Lbmc;->u:Lgmc;

    iput-object v8, v0, Lbmc;->v:Ljoc;

    iput-byte v6, v0, Lbmc;->x:B

    invoke-virtual {v2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_106

    :goto_b8
    :try_start_b8
    iget-object v0, v9, Lgmc;->e:Ljava/util/LinkedHashMap;

    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_bd
    .catchall {:try_start_b8 .. :try_end_bd} :catchall_c1

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    goto :goto_110

    :catchall_c1
    move-exception v0

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0

    :cond_c6
    iget-object v2, v9, Lgmc;->a:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    new-instance v12, Lr0f;

    iget-wide v13, v8, Ljoc;->a:J

    iget-object v15, v8, Ljoc;->b:Lapc;

    move-object/from16 v19, v8

    iget-wide v7, v0, Lbmc;->B:J

    iget-boolean v3, v0, Lbmc;->C:Z

    move/from16 v18, v3

    move-wide/from16 v16, v7

    invoke-direct/range {v12 .. v18}, Lr0f;-><init>(JLapc;JZ)V

    iput-byte v5, v0, Lbmc;->x:B

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v5, Ljkc;

    invoke-direct {v5, v2, v12, v6}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v2, 0x1

    invoke-static {v0, v3, v11, v2, v5}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_106

    :goto_f4
    iget-object v2, v9, Lgmc;->f:Lpfe;

    iput-object v2, v0, Lbmc;->t:Lpfe;

    iput-object v9, v0, Lbmc;->u:Lgmc;

    move-object/from16 v3, v19

    iput-object v3, v0, Lbmc;->v:Ljoc;

    iput-byte v4, v0, Lbmc;->x:B

    invoke-virtual {v2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_107

    :cond_106
    return-object v1

    :cond_107
    move-object v8, v3

    :goto_108
    :try_start_108
    iget-object v0, v9, Lgmc;->e:Ljava/util/LinkedHashMap;

    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10d
    .catchall {:try_start_108 .. :try_end_10d} :catchall_113

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    :goto_110
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_113
    move-exception v0

    invoke-virtual {v2, v10}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0
.end method
