.class public final Lksl;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lksl;->t:B

    iput-object p1, p0, Lksl;->v:Lxbf;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lksl;->t:B

    iget-object p0, p0, Lksl;->v:Lxbf;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lksl;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lksl;-><init>(Lxbf;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lksl;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lksl;-><init>(Lxbf;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lksl;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lksl;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lksl;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lksl;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lksl;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lksl;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lksl;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Lksl;->t:B

    iget-object v1, p0, Lksl;->v:Lxbf;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_74

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lksl;->u:Z

    if-eqz v5, :cond_1c

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_17
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_3e

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lksl;->u:Z

    new-instance p1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {p1, v4, p0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    new-instance p0, Lbha;

    const/16 v2, 0xa

    invoke-direct {p0, p1, v2}, Lbha;-><init>(Lnh4;B)V

    invoke-virtual {v1, p0}, Lxbf;->A(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3e

    move-object p1, v0

    :cond_3e
    :goto_3e
    return-object p1

    :pswitch_3f
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lksl;->u:Z

    if-eqz v5, :cond_50

    if-ne v5, v4, :cond_4b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_72

    :cond_4b
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_72

    :cond_50
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lksl;->u:Z

    new-instance p1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {p1, v4, p0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    new-instance p0, Lbha;

    const/16 v2, 0x9

    invoke-direct {p0, p1, v2}, Lbha;-><init>(Lnh4;B)V

    invoke-virtual {v1, p0}, Lxbf;->z(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_72

    move-object p1, v0

    :cond_72
    :goto_72
    return-object p1

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_3f
    .end packed-switch
.end method
