.class public final Lzlc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public final synthetic v:B

.field public final synthetic w:Lgmc;

.field public final synthetic x:J

.field public final synthetic y:Lapc;


# direct methods
.method public synthetic constructor <init>(ILgmc;JLapc;Lmt5;B)V
    .registers 8

    iput-byte p7, p0, Lzlc;->t:B

    iput-byte p1, p0, Lzlc;->v:B

    iput-object p2, p0, Lzlc;->w:Lgmc;

    iput-wide p3, p0, Lzlc;->x:J

    iput-object p5, p0, Lzlc;->y:Lapc;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p6}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 12

    iget-byte v0, p0, Lzlc;->t:B

    packed-switch v0, :pswitch_data_26

    new-instance v1, Lzlc;

    iget-object v6, p0, Lzlc;->y:Lapc;

    const/4 v8, 0x1

    iget-byte v2, p0, Lzlc;->v:B

    iget-object v3, p0, Lzlc;->w:Lgmc;

    iget-wide v4, p0, Lzlc;->x:J

    move-object v7, p1

    invoke-direct/range {v1 .. v8}, Lzlc;-><init>(ILgmc;JLapc;Lmt5;B)V

    return-object v1

    :pswitch_15
    move-object v7, p1

    new-instance v2, Lzlc;

    move-object v8, v7

    iget-object v7, p0, Lzlc;->y:Lapc;

    const/4 v9, 0x0

    iget-byte v3, p0, Lzlc;->v:B

    iget-object v4, p0, Lzlc;->w:Lgmc;

    iget-wide v5, p0, Lzlc;->x:J

    invoke-direct/range {v2 .. v9}, Lzlc;-><init>(ILgmc;JLapc;Lmt5;B)V

    return-object v2

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lzlc;->t:B

    check-cast p1, Lmt5;

    packed-switch v0, :pswitch_data_22

    invoke-virtual {p0, p1}, Lzlc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lzlc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lzlc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-virtual {p0, p1}, Lzlc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lzlc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lzlc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lzlc;->t:B

    iget-byte v1, p0, Lzlc;->v:B

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x2

    const/4 v5, 0x3

    iget-object v6, p0, Lzlc;->w:Lgmc;

    iget-wide v7, p0, Lzlc;->x:J

    iget-object v9, p0, Lzlc;->y:Lapc;

    const/4 v10, 0x1

    const/4 v11, 0x0

    packed-switch v0, :pswitch_data_116

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v12, p0, Lzlc;->u:B

    if-eqz v12, :cond_29

    if-eq v12, v10, :cond_25

    if-eq v12, v4, :cond_25

    if-eq v12, v5, :cond_25

    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_92

    :cond_25
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_90

    :cond_29
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eq v1, v10, :cond_72

    if-eq v1, v4, :cond_52

    if-ne v1, v5, :cond_90

    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lhh9;

    invoke-direct {v1, v7, v8, v9}, Lhh9;-><init>(JLapc;)V

    iput-byte v5, p0, Lzlc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lslc;

    invoke-direct {v3, p1, v1, v10}, Lslc;-><init>(Lwlc;Lhh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_90

    goto :goto_8e

    :cond_52
    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lgh9;

    invoke-direct {v1, v7, v8, v9}, Lgh9;-><init>(JLapc;)V

    iput-byte v4, p0, Lzlc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lqlc;

    invoke-direct {v3, p1, v1, v11}, Lqlc;-><init>(Lwlc;Lgh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_90

    goto :goto_8e

    :cond_72
    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lfh9;

    invoke-direct {v1, v7, v8, v9}, Lfh9;-><init>(JLapc;)V

    iput-byte v10, p0, Lzlc;->u:B

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Ltlc;

    invoke-direct {v3, p1, v1, v10}, Ltlc;-><init>(Lwlc;Lfh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_90

    :goto_8e
    move-object v2, v0

    goto :goto_92

    :cond_90
    :goto_90
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_92
    return-object v2

    :pswitch_93
    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v12, p0, Lzlc;->u:B

    if-eqz v12, :cond_a8

    if-eq v12, v10, :cond_a4

    if-eq v12, v4, :cond_a4

    if-eq v12, v5, :cond_a4

    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_114

    :cond_a4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_112

    :cond_a8
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eq v1, v10, :cond_f1

    if-eq v1, v4, :cond_d1

    if-ne v1, v5, :cond_112

    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lhh9;

    invoke-direct {v1, v7, v8, v9}, Lhh9;-><init>(JLapc;)V

    iput-byte v5, p0, Lzlc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lslc;

    invoke-direct {v3, p1, v1, v11}, Lslc;-><init>(Lwlc;Lhh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_112

    goto :goto_110

    :cond_d1
    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lgh9;

    invoke-direct {v1, v7, v8, v9}, Lgh9;-><init>(JLapc;)V

    iput-byte v4, p0, Lzlc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lqlc;

    invoke-direct {v3, p1, v1, v10}, Lqlc;-><init>(Lwlc;Lgh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_112

    goto :goto_110

    :cond_f1
    iget-object p1, v6, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    new-instance v1, Lfh9;

    invoke-direct {v1, v7, v8, v9}, Lfh9;-><init>(JLapc;)V

    iput-byte v10, p0, Lzlc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Ltlc;

    invoke-direct {v3, p1, v1, v11}, Ltlc;-><init>(Lwlc;Lfh9;B)V

    invoke-static {p0, v2, v11, v10, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_112

    :goto_110
    move-object v2, v0

    goto :goto_114

    :cond_112
    :goto_112
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_114
    return-object v2

    nop

    :pswitch_data_116
    .packed-switch 0x0
        :pswitch_93
    .end packed-switch
.end method
