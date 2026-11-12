.class public final Lygj;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Li9c;


# direct methods
.method public synthetic constructor <init>(Li9c;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lygj;->t:B

    iput-object p1, p0, Lygj;->w:Li9c;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lygj;->t:B

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lygj;

    iget-object p0, p0, Lygj;->w:Li9c;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lygj;-><init>(Li9c;Lmt5;B)V

    iput-object p1, v0, Lygj;->v:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lygj;

    iget-object p0, p0, Lygj;->w:Li9c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lygj;-><init>(Li9c;Lmt5;B)V

    iput-object p1, v0, Lygj;->v:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lygj;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lygj;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lygj;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lygj;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lygj;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lygj;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lygj;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lygj;->t:B

    iget-object v1, p0, Lygj;->w:Li9c;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_8e

    iget-object v0, p0, Lygj;->v:Ljava/lang/Object;

    check-cast v0, Lnx5;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lygj;->u:Z

    if-eqz v6, :cond_20

    if-ne v6, v3, :cond_1b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_39

    :cond_1b
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v4

    goto :goto_39

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lygj;

    const/4 v2, 0x0

    invoke-direct {p1, v1, v4, v2}, Lygj;-><init>(Li9c;Lmt5;B)V

    const/4 v1, 0x3

    invoke-static {v0, v4, v4, p1, v1}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object p1

    iput-object v4, p0, Lygj;->v:Ljava/lang/Object;

    iput-boolean v3, p0, Lygj;->u:Z

    invoke-virtual {p1, p0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v5, :cond_39

    move-object p1, v5

    :cond_39
    :goto_39
    return-object p1

    :pswitch_3a
    iget-object v0, p0, Lygj;->v:Ljava/lang/Object;

    check-cast v0, Lnx5;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lygj;->u:Z

    if-eqz v5, :cond_4e

    if-ne v5, v3, :cond_4a

    :try_start_46
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_49
    .catchall {:try_start_46 .. :try_end_49} :catchall_7f

    goto :goto_7a

    :cond_4a
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_8c

    :cond_4e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_51
    sget-object p1, Lt0i;->b:Lp0i;

    iput-object v4, p0, Lygj;->v:Ljava/lang/Object;

    iput-boolean v3, p0, Lygj;->u:Z

    new-instance p1, Lbhi;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {p1, p0}, Lbhi;-><init>(Lmt5;)V

    new-instance p0, Lhz;

    const/4 v2, 0x2

    invoke-direct {p0, p1, v2}, Lhz;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v1, Li9c;->d:Ljava/lang/Object;

    check-cast v2, Lghj;

    new-instance v4, Lhu5;

    invoke-direct {v4, v1, p0, v3}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Lghj;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lbhi;->a()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_7a

    move-object v4, v0

    goto :goto_8c

    :cond_7a
    :goto_7a
    check-cast p1, Ljava/lang/String;

    sget-object p0, Lt0i;->b:Lp0i;
    :try_end_7e
    .catchall {:try_start_51 .. :try_end_7e} :catchall_7f

    goto :goto_87

    :catchall_7f
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_87
    new-instance v4, Lt0i;

    invoke-direct {v4, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    :goto_8c
    return-object v4

    nop

    :pswitch_data_8e
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
