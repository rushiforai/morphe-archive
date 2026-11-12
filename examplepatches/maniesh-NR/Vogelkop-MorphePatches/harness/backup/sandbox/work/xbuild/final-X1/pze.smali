.class public final Lpze;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lsze;


# direct methods
.method public synthetic constructor <init>(Lsze;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lpze;->t:B

    iput-object p1, p0, Lpze;->v:Lsze;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lpze;->t:B

    iget-object p0, p0, Lpze;->v:Lsze;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lpze;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lpze;-><init>(Lsze;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lpze;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lpze;-><init>(Lsze;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lpze;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lpze;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lpze;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lpze;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lpze;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lpze;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lpze;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lpze;->t:B

    iget-object v1, p0, Lpze;->v:Lsze;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_52

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lpze;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v3, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_28

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2a

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v3, p0, Lpze;->u:Z

    invoke-virtual {v1, p0}, Lsze;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_28

    move-object v4, v0

    goto :goto_2a

    :cond_28
    :goto_28
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2a
    return-object v4

    :pswitch_2b
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lpze;->u:Z

    if-eqz v5, :cond_3b

    if-ne v5, v3, :cond_37

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4e

    :cond_37
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_50

    :cond_3b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lsze;->i:Lswh;

    if-eqz p1, :cond_4e

    iput-object v4, v1, Lsze;->i:Lswh;

    iput-boolean v3, p0, Lpze;->u:Z

    invoke-virtual {v1, p1, p0}, Lsze;->b(Lswh;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_4e

    move-object v4, v0

    goto :goto_50

    :cond_4e
    :goto_4e
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_50
    return-object v4

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
