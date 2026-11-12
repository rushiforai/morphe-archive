.class public final Lhnk;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lshf;

.field public final synthetic w:Ljava/lang/String;

.field public final synthetic x:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V
    .registers 7

    iput-byte p5, p0, Lhnk;->t:B

    const/4 v0, 0x2

    packed-switch p5, :pswitch_data_1e

    sget-object p5, Lenk;->a:Lenk;

    iput-object p1, p0, Lhnk;->v:Lshf;

    iput-object p2, p0, Lhnk;->w:Ljava/lang/String;

    iput-object p3, p0, Lhnk;->x:Ljava/lang/String;

    invoke-direct {p0, v0, p4}, Lkuk;-><init>(ILmt5;)V

    return-void

    :pswitch_12
    sget-object p5, Lenk;->a:Lenk;

    iput-object p1, p0, Lhnk;->v:Lshf;

    iput-object p2, p0, Lhnk;->w:Ljava/lang/String;

    iput-object p3, p0, Lhnk;->x:Ljava/lang/String;

    invoke-direct {p0, v0, p4}, Lkuk;-><init>(ILmt5;)V

    return-void

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 10

    iget-byte p1, p0, Lhnk;->t:B

    packed-switch p1, :pswitch_data_26

    new-instance v0, Lhnk;

    sget-object p1, Lenk;->a:Lenk;

    iget-object v3, p0, Lhnk;->x:Ljava/lang/String;

    const/4 v5, 0x1

    iget-object v1, p0, Lhnk;->v:Lshf;

    iget-object v2, p0, Lhnk;->w:Ljava/lang/String;

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    return-object v0

    :pswitch_15
    move-object v4, p2

    new-instance v1, Lhnk;

    sget-object p1, Lenk;->a:Lenk;

    move-object v5, v4

    iget-object v4, p0, Lhnk;->x:Ljava/lang/String;

    const/4 v6, 0x0

    iget-object v2, p0, Lhnk;->v:Lshf;

    iget-object v3, p0, Lhnk;->w:Ljava/lang/String;

    invoke-direct/range {v1 .. v6}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    return-object v1

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lhnk;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lhnk;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lhnk;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lhnk;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lhnk;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lhnk;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lhnk;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lhnk;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_92

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lhnk;->u:Z

    if-eqz v4, :cond_1a

    if-ne v4, v3, :cond_15

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4d

    :cond_15
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v1

    goto :goto_4d

    :cond_1a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lenk;->a:Lenk;

    iput-boolean v3, p0, Lhnk;->u:Z

    new-instance p1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v1

    invoke-direct {p1, v3, v1}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    new-instance v8, Lbha;

    const/4 v1, 0x7

    invoke-direct {v8, p1, v1}, Lbha;-><init>(Lnh4;B)V

    iget-object v7, p0, Lhnk;->v:Lshf;

    iget-object v1, v7, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lwth;

    new-instance v4, Lxx1;

    const/4 v9, 0x0

    iget-object v5, p0, Lhnk;->w:Ljava/lang/String;

    iget-object v6, p0, Lhnk;->x:Ljava/lang/String;

    invoke-direct/range {v4 .. v9}, Lxx1;-><init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lbha;B)V

    invoke-virtual {v1, v4}, Lwth;->w(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4d

    move-object p1, v0

    :cond_4d
    :goto_4d
    return-object p1

    :pswitch_4e
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lhnk;->u:Z

    if-eqz v4, :cond_5f

    if-ne v4, v3, :cond_5a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_91

    :cond_5a
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v1

    goto :goto_91

    :cond_5f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lenk;->a:Lenk;

    iput-boolean v3, p0, Lhnk;->u:Z

    new-instance p1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v1

    invoke-direct {p1, v3, v1}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    new-instance v1, Lbha;

    const/4 v2, 0x5

    invoke-direct {v1, p1, v2}, Lbha;-><init>(Lnh4;B)V

    iget-object v2, p0, Lhnk;->v:Lshf;

    iget-object v3, v2, Lshf;->a:Ljava/lang/Object;

    check-cast v3, Lwth;

    new-instance v4, Lxx1;

    iget-object v5, p0, Lhnk;->w:Ljava/lang/String;

    iget-object p0, p0, Lhnk;->x:Ljava/lang/String;

    invoke-direct {v4, v5, p0, v2, v1}, Lxx1;-><init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lbha;)V

    invoke-virtual {v3, v4}, Lwth;->w(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_91

    move-object p1, v0

    :cond_91
    :goto_91
    return-object p1

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_4e
    .end packed-switch
.end method
