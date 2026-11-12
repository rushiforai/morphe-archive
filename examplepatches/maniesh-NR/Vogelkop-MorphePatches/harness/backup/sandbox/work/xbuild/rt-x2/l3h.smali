.class public final Ll3h;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Li07;


# direct methods
.method public synthetic constructor <init>(Li07;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Ll3h;->t:B

    iput-object p1, p0, Ll3h;->v:Li07;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Ll3h;->t:B

    iget-object p0, p0, Ll3h;->v:Li07;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Ll3h;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Ll3h;-><init>(Li07;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Ll3h;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Ll3h;-><init>(Li07;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ll3h;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Ll3h;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ll3h;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ll3h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Ll3h;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ll3h;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ll3h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Ll3h;->t:B

    iget-object v1, p0, Ll3h;->v:Li07;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_48

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Ll3h;->u:Z

    if-eqz v5, :cond_1c

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_28

    :cond_17
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_28

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Ll3h;->u:Z

    invoke-virtual {v1, p0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_28

    move-object p1, v0

    :cond_28
    :goto_28
    return-object p1

    :pswitch_29
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Ll3h;->u:Z

    if-eqz v5, :cond_3a

    if-ne v5, v4, :cond_35

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_46

    :cond_35
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_46

    :cond_3a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Ll3h;->u:Z

    invoke-virtual {v1, p0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_46

    move-object p1, v0

    :cond_46
    :goto_46
    return-object p1

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
