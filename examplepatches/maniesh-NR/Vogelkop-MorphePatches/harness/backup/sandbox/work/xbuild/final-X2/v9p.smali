.class public final Lv9p;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public final synthetic v:Landroid/app/Application;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Application;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lv9p;->t:B

    iput-object p1, p0, Lv9p;->v:Landroid/app/Application;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lv9p;->t:B

    iget-object p0, p0, Lv9p;->v:Landroid/app/Application;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lv9p;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lv9p;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lv9p;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lv9p;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lv9p;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lv9p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lv9p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lv9p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lv9p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lv9p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lv9p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lv9p;->t:B

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v2, 0x1

    const/4 v3, 0x2

    iget-object v4, p0, Lv9p;->v:Landroid/app/Application;

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_b4

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v6, p0, Lv9p;->u:B

    if-eqz v6, :cond_22

    if-eq v6, v2, :cond_1e

    if-ne v6, v3, :cond_1a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6e

    :cond_1a
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_70

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_22
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-byte v2, p0, Lv9p;->u:B

    sget-object p1, Laap;->a:Lzyk;

    invoke-static {}, Lpfp;->b()Z

    sget-object p1, Lfcp;->a:Lzyk;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Laap;->a:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    sget-object v2, Ldze;->b:Ldze;

    invoke-interface {v1, v2}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    new-instance v2, Ljj4;

    const/16 v6, 0x19

    invoke-direct {v2, v6, v5, p1}, Ljj4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_4f

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_4f
    if-eq p1, v0, :cond_6c

    :goto_51
    sget-object p1, Ldap;->a:Ldap;

    iput-byte v3, p0, Lv9p;->u:B

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Lmr6;->b:Lmr6;

    new-instance v2, Lwr;

    invoke-direct {v2, p1, v5}, Lwr;-><init>(Landroid/content/Context;Lmt5;)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_6a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_6a
    if-ne p0, v0, :cond_6e

    :cond_6c
    move-object v5, v0

    goto :goto_70

    :cond_6e
    :goto_6e
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_70
    return-object v5

    :pswitch_71
    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v6, p0, Lv9p;->u:B

    if-eqz v6, :cond_83

    if-eq v6, v2, :cond_7f

    if-eq v6, v3, :cond_7f

    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_b3

    :cond_7f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9e

    :cond_83
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-wide v5, Laap;->f:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    invoke-static {v5, v6, v2}, Laap;->b(JZ)Ljava/lang/String;

    iput-byte v2, p0, Lv9p;->u:B

    invoke-static {v5, v6, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_b2

    :cond_9e
    :goto_9e
    invoke-static {v4}, Laap;->d(Landroid/app/Application;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-wide v5, p1, Lz8p;->C:J

    invoke-static {v5, v6, v2}, Laap;->b(JZ)Ljava/lang/String;

    iput-byte v3, p0, Lv9p;->u:B

    invoke-static {v5, v6, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_9e

    :cond_b2
    move-object v5, v0

    :goto_b3
    return-object v5

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_71
    .end packed-switch
.end method
