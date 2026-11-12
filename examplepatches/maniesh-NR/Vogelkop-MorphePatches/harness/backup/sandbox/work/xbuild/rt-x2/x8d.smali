.class public final Lx8d;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:La9d;


# direct methods
.method public synthetic constructor <init>(La9d;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lx8d;->t:B

    iput-object p1, p0, Lx8d;->v:La9d;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lx8d;->t:B

    iget-object p0, p0, Lx8d;->v:La9d;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lx8d;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lx8d;-><init>(La9d;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lx8d;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lx8d;-><init>(La9d;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lx8d;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lx8d;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lx8d;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lx8d;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lx8d;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lx8d;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lx8d;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Lx8d;->t:B

    iget-object v1, p0, Lx8d;->v:La9d;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_74

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lx8d;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_17
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_38

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lx8d;->u:Z

    const-wide/16 v2, 0x9c4

    invoke-static {v2, v3, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2a

    move-object v2, v0

    goto :goto_38

    :cond_2a
    :goto_2a
    iget-object p0, v1, La9d;->d:Lslk;

    new-instance p1, Ldnb;

    const/16 v0, 0x15

    invoke-direct {p1, v1, v0}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lslk;->b(Ljava/lang/Runnable;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_38
    return-object v2

    :pswitch_39
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lx8d;->u:Z

    if-eqz v5, :cond_49

    if-ne v5, v4, :cond_45

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_45
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_73

    :cond_49
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lx8d;->u:Z

    new-instance p1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {p1, v4, p0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    iget-object p0, v1, La9d;->b:Laf3;

    new-instance v2, Lbha;

    invoke-direct {v2, p1, v4}, Lbha;-><init>(Lnh4;B)V

    invoke-virtual {p0, v2}, Laf3;->d(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_6c

    move-object v2, v0

    goto :goto_73

    :cond_6c
    :goto_6c
    check-cast p1, Lyah;

    invoke-virtual {p1, v1}, Lyah;->s0(Labh;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_73
    return-object v2

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
