.class public final Lrz1;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Lrz1;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p0, p0, Lrz1;->t:B

    packed-switch p0, :pswitch_data_56

    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/16 v0, 0x8

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_e
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x7

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_16
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x6

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_1e
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x5

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_26
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x4

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_2e
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x3

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_36
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_3e
    new-instance p0, Lrz1;

    const/4 p1, 0x2

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lrz1;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_46
    new-instance p0, Lrz1;

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lrz1;-><init>(ILmt5;B)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lrz1;->u:Z

    return-object p0

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_46
        :pswitch_3e
        :pswitch_36
        :pswitch_2e
        :pswitch_26
        :pswitch_1e
        :pswitch_16
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lrz1;->t:B

    packed-switch v0, :pswitch_data_a6

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lrz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lrz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Lmt5;

    new-instance p1, Lrz1;

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p1, v0, p2, v1}, Lrz1;-><init>(ILmt5;B)V

    iput-boolean p0, p1, Lrz1;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Lrz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_8d
        :pswitch_7c
        :pswitch_6b
        :pswitch_5a
        :pswitch_49
        :pswitch_38
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lrz1;->t:B

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_15c

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_19

    if-ne v4, v2, :cond_15

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_38

    :cond_15
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_3a

    :cond_19
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Loxo;->a:Loxo;

    iput-boolean v2, p0, Lrz1;->u:Z

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Lmr6;->b:Lmr6;

    new-instance v1, Lwv0;

    const/4 v2, 0x2

    const/16 v4, 0x8

    invoke-direct {v1, v2, v3, v4}, Lwv0;-><init>(ILmt5;B)V

    invoke-static {p1, v1, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_34

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_34
    if-ne p0, v0, :cond_38

    move-object v3, v0

    goto :goto_3a

    :cond_38
    :goto_38
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3a
    return-object v3

    :pswitch_3b
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_4b

    if-ne v4, v2, :cond_47

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_47
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_72

    :cond_4b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-wide v4, p1, Lz8p;->D:J

    iput-boolean v2, p0, Lrz1;->u:Z

    invoke-static {v4, v5, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5e

    move-object v3, v0

    goto :goto_72

    :cond_5e
    :goto_5e
    sget-object p0, Laap;->g:Ld3k;

    if-eqz p0, :cond_65

    invoke-virtual {p0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_65
    sput-object v3, Laap;->g:Ld3k;

    sget-object p0, Laap;->h:Ld3k;

    if-eqz p0, :cond_6e

    invoke-virtual {p0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_6e
    sput-object v3, Laap;->h:Ld3k;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_72
    return-object v3

    :pswitch_73
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_83

    if-ne v4, v2, :cond_7f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_96

    :cond_7f
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_9f

    :cond_83
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-wide v4, p1, Lz8p;->D:J

    iput-boolean v2, p0, Lrz1;->u:Z

    invoke-static {v4, v5, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_96

    move-object v3, v0

    goto :goto_9f

    :cond_96
    :goto_96
    sget-object p0, Ljno;->i:Ld3k;

    if-eqz p0, :cond_9d

    invoke-virtual {p0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_9d
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9f
    return-object v3

    :pswitch_a0
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_b0

    if-ne v4, v2, :cond_ac

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_c1

    :cond_ac
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_c5

    :cond_b0
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcak;->d:Lavj;

    iput-boolean v2, p0, Lrz1;->u:Z

    const/16 p1, 0x9

    invoke-static {p1, p0}, Lmfh;->w(ILmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_c1

    move-object v3, v0

    goto :goto_c5

    :cond_c1
    :goto_c1
    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v3

    :goto_c5
    return-object v3

    :pswitch_c6
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_d6

    if-ne v4, v2, :cond_d2

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_e5

    :cond_d2
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_e7

    :cond_d6
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-wide v3, Ldek;->a:J

    iput-boolean v2, p0, Lrz1;->u:Z

    invoke-static {v3, v4, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_e5

    move-object v3, v0

    goto :goto_e7

    :cond_e5
    :goto_e5
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_e7
    return-object v3

    :pswitch_e8
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_f8

    if-ne v4, v2, :cond_f4

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_107

    :cond_f4
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_10b

    :cond_f8
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcak;->d:Lavj;

    iput-boolean v2, p0, Lrz1;->u:Z

    invoke-static {v2, p0}, Lmfh;->w(ILmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_107

    move-object v3, v0

    goto :goto_10b

    :cond_107
    :goto_107
    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v3

    :goto_10b
    return-object v3

    :pswitch_10c
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_11d

    if-ne v4, v2, :cond_118

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_129

    :cond_118
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v3

    goto :goto_129

    :cond_11d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v2, p0, Lrz1;->u:Z

    invoke-static {p0}, Lc26;->F(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_129

    move-object p1, v0

    :cond_129
    :goto_129
    return-object p1

    :pswitch_12a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lrz1;->u:Z

    if-eqz v4, :cond_13a

    if-ne v4, v2, :cond_136

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_149

    :cond_136
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_14b

    :cond_13a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v2, p0, Lrz1;->u:Z

    const-wide/16 v1, 0xbb8

    invoke-static {v1, v2, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_149

    move-object v3, v0

    goto :goto_14b

    :cond_149
    :goto_149
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_14b
    return-object v3

    :pswitch_14c
    iget-boolean p0, p0, Lrz1;->u:Z

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eq p0, v2, :cond_156

    const/4 v2, 0x0

    :cond_156
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_15c
    .packed-switch 0x0
        :pswitch_14c
        :pswitch_12a
        :pswitch_10c
        :pswitch_e8
        :pswitch_c6
        :pswitch_a0
        :pswitch_73
        :pswitch_3b
    .end packed-switch
.end method
