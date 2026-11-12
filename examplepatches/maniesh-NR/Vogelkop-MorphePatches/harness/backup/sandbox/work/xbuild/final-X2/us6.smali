.class public final Lus6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public final synthetic v:J

.field public final synthetic w:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BJLmt5;Ljava/lang/Object;)V
    .registers 6

    .line 15
    iput-byte p1, p0, Lus6;->t:B

    iput-object p5, p0, Lus6;->w:Ljava/lang/Object;

    iput-wide p2, p0, Lus6;->v:J

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(JLuuk;Lmt5;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lus6;->t:B

    .line 14
    iput-wide p1, p0, Lus6;->v:J

    iput-object p3, p0, Lus6;->w:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lgmc;JLmt5;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lus6;->t:B

    sget-object v0, Lapc;->b:Lix5;

    iput-object p1, p0, Lus6;->w:Ljava/lang/Object;

    iput-wide p2, p0, Lus6;->v:J

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 13

    iget-byte p1, p0, Lus6;->t:B

    iget-wide v0, p0, Lus6;->v:J

    iget-object v2, p0, Lus6;->w:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_38

    new-instance p0, Lus6;

    check-cast v2, Luuk;

    invoke-direct {p0, v0, v1, v2, p2}, Lus6;-><init>(JLuuk;Lmt5;)V

    return-object p0

    :pswitch_11
    new-instance v3, Lus6;

    move-object v8, v2

    check-cast v8, Lsze;

    iget-wide v5, p0, Lus6;->v:J

    const/4 v4, 0x2

    move-object v7, p2

    invoke-direct/range {v3 .. v8}, Lus6;-><init>(BJLmt5;Ljava/lang/Object;)V

    return-object v3

    :pswitch_1e
    move-object v7, p2

    new-instance p0, Lus6;

    check-cast v2, Lgmc;

    sget-object p1, Lapc;->b:Lix5;

    invoke-direct {p0, v2, v0, v1, v7}, Lus6;-><init>(Lgmc;JLmt5;)V

    return-object p0

    :pswitch_29
    move-object v7, p2

    new-instance v4, Lus6;

    move-object v9, v2

    check-cast v9, Lvs6;

    iget-wide p0, p0, Lus6;->v:J

    const/4 v5, 0x0

    move-object v8, v7

    move-wide v6, p0

    invoke-direct/range {v4 .. v9}, Lus6;-><init>(BJLmt5;Ljava/lang/Object;)V

    return-object v4

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_29
        :pswitch_1e
        :pswitch_11
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lus6;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_3e

    invoke-virtual {p0, p1, p2}, Lus6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lus6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lus6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lus6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lus6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lus6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lus6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lus6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lus6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_30
    invoke-virtual {p0, p1, p2}, Lus6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lus6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lus6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_30
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lus6;->t:B

    const/4 v1, 0x3

    iget-object v2, p0, Lus6;->w:Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v5, 0x1

    const/4 v6, 0x2

    iget-wide v7, p0, Lus6;->v:J

    packed-switch v0, :pswitch_data_126

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Lus6;->u:B

    const-wide/16 v9, 0x8

    if-eqz v1, :cond_27

    if-eq v1, v5, :cond_23

    if-ne v1, v6, :cond_1f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_1f
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_55

    :cond_23
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_34

    :cond_27
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sub-long v3, v7, v9

    iput-byte v5, p0, Lus6;->u:B

    invoke-static {v3, v4, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_3c

    :goto_34
    iput-byte v6, p0, Lus6;->u:B

    invoke-static {v9, v10, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_3e

    :cond_3c
    move-object v3, v0

    goto :goto_55

    :cond_3e
    :goto_3e
    check-cast v2, Luuk;

    iget-object p0, v2, Luuk;->c:Lnh4;

    if-eqz p0, :cond_53

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lhmg;

    invoke-direct {p1, v7, v8}, Lhmg;-><init>(J)V

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_53
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_55
    return-object v3

    :pswitch_56
    check-cast v2, Lsze;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Lus6;->u:B

    if-eqz v1, :cond_6e

    if-eq v1, v5, :cond_6a

    if-ne v1, v6, :cond_66

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8e

    :cond_66
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_90

    :cond_6a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7f

    :cond_6e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-wide v3, v2, Lsze;->c:J

    invoke-static {v3, v4, v7, v8}, Lpn7;->l(JJ)J

    move-result-wide v3

    iput-byte v5, p0, Lus6;->u:B

    invoke-static {v3, v4, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_8c

    :goto_7f
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lswh;->b:Lswh;

    iput-byte v6, p0, Lus6;->u:B

    invoke-virtual {v2, p1, p0}, Lsze;->b(Lswh;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_8e

    :cond_8c
    move-object v3, v0

    goto :goto_90

    :cond_8e
    :goto_8e
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_90
    return-object v3

    :pswitch_91
    sget-object v0, Lapc;->b:Lix5;

    check-cast v2, Lgmc;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v9, p0, Lus6;->u:B

    if-eqz v9, :cond_b5

    if-eq v9, v5, :cond_b1

    if-eq v9, v6, :cond_ab

    if-ne v9, v1, :cond_a7

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p1, :cond_d7

    goto :goto_d4

    :cond_a7
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_d9

    :cond_ab
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p1, :cond_d7

    goto :goto_d4

    :cond_b1
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_d2

    :cond_b5
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    iput-byte v5, p0, Lus6;->u:B

    iget-object p1, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v1, Lx41;

    invoke-direct {v1, v7, v8}, Lx41;-><init>(J)V

    const/4 v2, 0x0

    invoke-static {p0, p1, v5, v2, v1}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_d2

    move-object v3, v0

    goto :goto_d9

    :cond_d2
    :goto_d2
    if-eqz p1, :cond_d7

    :goto_d4
    sget-object v3, Lomc;->a:Lomc;

    goto :goto_d9

    :cond_d7
    sget-object v3, Lomc;->b:Lomc;

    :goto_d9
    return-object v3

    :pswitch_da
    check-cast v2, Lvs6;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v9, p0, Lus6;->u:B

    if-eqz v9, :cond_f4

    if-eq v9, v5, :cond_f0

    if-eq v9, v6, :cond_ec

    if-eq v9, v1, :cond_ec

    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_124

    :cond_ec
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_122

    :cond_f0
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_101

    :cond_f4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Lvs6;->c:Lti9;

    iput-byte v5, p0, Lus6;->u:B

    invoke-virtual {p1, v7, v8, p0}, Lti9;->c(JLnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_120

    :goto_101
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v2, v2, Lvs6;->b:Lgmc;

    if-eqz p1, :cond_116

    sget-object p1, Loi9;->c:Loi9;

    iput-byte v6, p0, Lus6;->u:B

    invoke-virtual {v2, v7, v8, p1, p0}, Lgmc;->c(JLoi9;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_122

    goto :goto_120

    :cond_116
    sget-object p1, Loi9;->f:Loi9;

    iput-byte v1, p0, Lus6;->u:B

    invoke-virtual {v2, v7, v8, p1, p0}, Lgmc;->c(JLoi9;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_122

    :cond_120
    :goto_120
    move-object v3, v0

    goto :goto_124

    :cond_122
    :goto_122
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_124
    return-object v3

    nop

    :pswitch_data_126
    .packed-switch 0x0
        :pswitch_da
        :pswitch_91
        :pswitch_56
    .end packed-switch
.end method
