.class public final Lx6p;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lsro;


# direct methods
.method public synthetic constructor <init>(Lsro;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lx6p;->t:B

    iput-object p1, p0, Lx6p;->v:Lsro;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lx6p;->t:B

    iget-object p0, p0, Lx6p;->v:Lsro;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lx6p;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lx6p;-><init>(Lsro;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lx6p;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lx6p;-><init>(Lsro;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lx6p;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lx6p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lx6p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lx6p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lx6p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lx6p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lx6p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lx6p;->t:B

    iget-object v1, p0, Lx6p;->v:Lsro;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_62

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lx6p;->u:Z

    if-eqz v5, :cond_1f

    if-ne v5, v4, :cond_1b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_30

    :cond_1b
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_35

    :cond_1f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lyjo;->a()Ljava/io/File;

    move-result-object p1

    iput-boolean v4, p0, Lx6p;->u:Z

    invoke-static {p1, p0}, Lelp;->b(Ljava/io/File;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_30

    move-object v2, v0

    goto :goto_35

    :cond_30
    :goto_30
    new-instance v2, Lt0i;

    invoke-direct {v2, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    :goto_35
    return-object v2

    :pswitch_36
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lx6p;->u:Z

    if-eqz v5, :cond_4a

    if-ne v5, v4, :cond_46

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_5b

    :cond_46
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_60

    :cond_4a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lyjo;->a()Ljava/io/File;

    move-result-object p1

    iput-boolean v4, p0, Lx6p;->u:Z

    invoke-static {p1, p0}, Lelp;->b(Ljava/io/File;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5b

    move-object v2, v0

    goto :goto_60

    :cond_5b
    :goto_5b
    new-instance v2, Lt0i;

    invoke-direct {v2, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    :goto_60
    return-object v2

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
