.class public final Lyka;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lks3;


# direct methods
.method public synthetic constructor <init>(Lks3;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lyka;->t:B

    iput-object p1, p0, Lyka;->v:Lks3;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 4

    iget-byte v0, p0, Lyka;->t:B

    iget-object p0, p0, Lyka;->v:Lks3;

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lyka;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lyka;-><init>(Lks3;Lmt5;B)V

    return-object v0

    :pswitch_e
    new-instance v0, Lyka;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lyka;-><init>(Lks3;Lmt5;B)V

    return-object v0

    :pswitch_15
    new-instance v0, Lyka;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lyka;-><init>(Lks3;Lmt5;B)V

    return-object v0

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyka;->t:B

    check-cast p1, Lmt5;

    packed-switch v0, :pswitch_data_2e

    invoke-virtual {p0, p1}, Lyka;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lyka;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lyka;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-virtual {p0, p1}, Lyka;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lyka;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lyka;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_21
    invoke-virtual {p0, p1}, Lyka;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lyka;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lyka;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_21
        :pswitch_14
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lyka;->t:B

    iget-object v1, p0, Lyka;->v:Lks3;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_78

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lyka;->u:Z

    if-eqz v5, :cond_1c

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_30

    :cond_17
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_30

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lks3;->b:Ljava/lang/Object;

    check-cast p1, Lxm5;

    iget-object p1, p1, Lxm5;->a:Ljava/lang/Object;

    check-cast p1, Lplh;

    iput-boolean v4, p0, Lyka;->u:Z

    invoke-static {p1, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_30

    move-object p1, v0

    :cond_30
    :goto_30
    return-object p1

    :pswitch_31
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lyka;->u:Z

    if-eqz v5, :cond_42

    if-ne v5, v4, :cond_3d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_52

    :cond_3d
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_52

    :cond_42
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lks3;->i:Ljava/lang/Object;

    check-cast p1, Lpn6;

    iput-boolean v4, p0, Lyka;->u:Z

    invoke-virtual {p1, p0}, Lpn6;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_52

    move-object p1, v0

    :cond_52
    :goto_52
    return-object p1

    :pswitch_53
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lyka;->u:Z

    if-eqz v5, :cond_63

    if-ne v5, v4, :cond_5f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_74

    :cond_5f
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_76

    :cond_63
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lks3;->c:Ljava/lang/Object;

    check-cast p1, Lvga;

    iput-boolean v4, p0, Lyka;->u:Z

    invoke-interface {p1, p0}, Lvga;->s(Lyka;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_74

    move-object v2, v0

    goto :goto_76

    :cond_74
    :goto_74
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_76
    return-object v2

    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_53
        :pswitch_31
    .end packed-switch
.end method
