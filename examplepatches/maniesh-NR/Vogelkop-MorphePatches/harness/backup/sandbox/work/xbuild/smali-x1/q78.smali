.class public final Lq78;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lu78;


# direct methods
.method public synthetic constructor <init>(Lu78;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lq78;->t:B

    iput-object p1, p0, Lq78;->v:Lu78;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lq78;->t:B

    iget-object p0, p0, Lq78;->v:Lu78;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lq78;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lq78;-><init>(Lu78;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lq78;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lq78;-><init>(Lu78;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lq78;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lq78;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lq78;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lq78;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lq78;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lq78;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lq78;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Lq78;->t:B

    iget-object v1, p0, Lq78;->v:Lu78;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_5e

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lq78;->u:Z

    if-eqz v5, :cond_1f

    if-ne v5, v3, :cond_1b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_32

    :cond_1b
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_34

    :cond_1f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lt78;

    const/4 v2, 0x0

    invoke-direct {p1, v2, v4, v1}, Lt78;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-boolean v3, p0, Lq78;->u:Z

    invoke-static {p1, p0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_32

    move-object v4, v0

    goto :goto_34

    :cond_32
    :goto_32
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_34
    return-object v4

    :pswitch_35
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lq78;->u:Z

    if-eqz v5, :cond_46

    if-ne v5, v3, :cond_41

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5c

    :cond_41
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v4

    goto :goto_5c

    :cond_46
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lu78;->m:Lplh;

    new-instance v1, Lxf;

    const/4 v2, 0x2

    const/16 v5, 0xe

    invoke-direct {v1, v2, v4, v5}, Lxf;-><init>(ILmt5;B)V

    iput-boolean v3, p0, Lq78;->u:Z

    invoke-static {p1, v1, p0}, Lcs5;->F(Lf99;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5c

    move-object p1, v0

    :cond_5c
    :goto_5c
    return-object p1

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
