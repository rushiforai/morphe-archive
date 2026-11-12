.class public final Lnxn;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Layn;

.field public final synthetic w:Lwc1;


# direct methods
.method public synthetic constructor <init>(Layn;Lwc1;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lnxn;->t:B

    iput-object p1, p0, Lnxn;->v:Layn;

    iput-object p2, p0, Lnxn;->w:Lwc1;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Lnxn;->t:B

    iget-object v0, p0, Lnxn;->w:Lwc1;

    iget-object p0, p0, Lnxn;->v:Layn;

    packed-switch p1, :pswitch_data_18

    new-instance p1, Lnxn;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, p2, v1}, Lnxn;-><init>(Layn;Lwc1;Lmt5;B)V

    return-object p1

    :pswitch_10
    new-instance p1, Lnxn;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, p2, v1}, Lnxn;-><init>(Layn;Lwc1;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lnxn;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_26

    invoke-virtual {p0, p1, p2}, Lnxn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnxn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnxn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_17
    invoke-virtual {p0, p1, p2}, Lnxn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnxn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnxn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lnxn;->t:B

    iget-object v1, p0, Lnxn;->w:Lwc1;

    iget-object v2, p0, Lnxn;->v:Layn;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_4e

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lnxn;->u:Z

    if-eqz v6, :cond_20

    if-eq v6, v4, :cond_19

    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_30

    :cond_19
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lt3p;->v()V

    goto :goto_30

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Layn;->c:Ljdj;

    new-instance v2, Loxn;

    invoke-direct {v2, v1, v4}, Loxn;-><init>(Lwc1;B)V

    iput-boolean v4, p0, Lnxn;->u:Z

    invoke-virtual {p1, v2, p0}, Ljdj;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v5, v0

    :goto_30
    return-object v5

    :pswitch_31
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lnxn;->u:Z

    if-eqz v6, :cond_44

    if-eq v6, v4, :cond_3d

    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_4d

    :cond_3d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lt3p;->v()V

    goto :goto_4d

    :cond_44
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lnxn;->u:Z

    invoke-virtual {v2, v1, p0}, Layn;->a(Lwc1;Lnt5;)V

    move-object v5, v0

    :goto_4d
    return-object v5

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method
