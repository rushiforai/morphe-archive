.class public final Lt1a;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lv1a;


# direct methods
.method public synthetic constructor <init>(Lv1a;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lt1a;->t:B

    iput-object p1, p0, Lt1a;->v:Lv1a;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lt1a;->t:B

    iget-object p0, p0, Lt1a;->v:Lv1a;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lt1a;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lt1a;-><init>(Lv1a;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lt1a;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lt1a;-><init>(Lv1a;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lt1a;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lt1a;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lt1a;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lt1a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lt1a;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lt1a;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lt1a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lt1a;->t:B

    iget-object v1, p0, Lt1a;->v:Lv1a;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_68

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lt1a;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_34

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lt1a;->u:Z

    const-wide/16 v2, 0xc8

    invoke-static {v2, v3, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2a

    move-object v3, v0

    goto :goto_34

    :cond_2a
    :goto_2a
    new-instance p0, Ls1a;

    invoke-direct {p0, v1, v4}, Ls1a;-><init>(Lv1a;B)V

    invoke-virtual {v1, p0}, Lv1a;->a(Lcom/opera/api/Callback;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_34
    return-object v3

    :pswitch_35
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lt1a;->u:Z

    if-eqz v5, :cond_48

    if-eq v5, v4, :cond_41

    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_67

    :cond_41
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lt3p;->v()V

    goto :goto_67

    :cond_48
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcak;->d:Lavj;

    new-instance p1, Lr1a;

    invoke-direct {p1, v1, v4}, Lr1a;-><init>(Lv1a;B)V

    invoke-static {v4, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    iget-object p1, v1, Lv1a;->e:Ljdj;

    invoke-virtual {p1}, Lc7;->g()Lxkk;

    move-result-object p1

    new-instance v2, Lo71;

    const/4 v3, 0x7

    invoke-direct {v2, v1, v3}, Lo71;-><init>(Ljava/lang/Object;B)V

    iput-boolean v4, p0, Lt1a;->u:Z

    invoke-virtual {p1, v2, p0}, Ljdj;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, v0

    :goto_67
    return-object v3

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
