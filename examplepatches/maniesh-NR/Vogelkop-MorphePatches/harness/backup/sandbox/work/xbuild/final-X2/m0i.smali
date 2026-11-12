.class public final Lm0i;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lo0i;

.field public final synthetic w:Ljoc;


# direct methods
.method public synthetic constructor <init>(Lo0i;Ljoc;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lm0i;->t:B

    iput-object p1, p0, Lm0i;->v:Lo0i;

    iput-object p2, p0, Lm0i;->w:Ljoc;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lm0i;->t:B

    iget-object v1, p0, Lm0i;->w:Ljoc;

    iget-object p0, p0, Lm0i;->v:Lo0i;

    packed-switch v0, :pswitch_data_18

    new-instance v0, Lm0i;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, p1, v2}, Lm0i;-><init>(Lo0i;Ljoc;Lmt5;B)V

    return-object v0

    :pswitch_10
    new-instance v0, Lm0i;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lm0i;-><init>(Lo0i;Ljoc;Lmt5;B)V

    return-object v0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lm0i;->t:B

    check-cast p1, Lmt5;

    packed-switch v0, :pswitch_data_22

    invoke-virtual {p0, p1}, Lm0i;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lm0i;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lm0i;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-virtual {p0, p1}, Lm0i;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lm0i;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lm0i;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lm0i;->t:B

    iget-object v1, p0, Lm0i;->w:Ljoc;

    iget-object v2, p0, Lm0i;->v:Lo0i;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_4e

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lm0i;->u:Z

    if-eqz v6, :cond_1e

    if-ne v6, v5, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2c

    :cond_19
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v3

    goto :goto_2c

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Lo0i;->b:Lqs6;

    iput-boolean v5, p0, Lm0i;->u:Z

    invoke-virtual {p1, v1, p0}, Lqs6;->e(Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2c

    move-object p1, v0

    :cond_2c
    :goto_2c
    return-object p1

    :pswitch_2d
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lm0i;->u:Z

    if-eqz v6, :cond_3e

    if-ne v6, v5, :cond_39

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4c

    :cond_39
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v3

    goto :goto_4c

    :cond_3e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Lo0i;->b:Lqs6;

    iput-boolean v5, p0, Lm0i;->u:Z

    invoke-virtual {p1, v1, p0}, Lqs6;->f(Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4c

    move-object p1, v0

    :cond_4c
    :goto_4c
    return-object p1

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
