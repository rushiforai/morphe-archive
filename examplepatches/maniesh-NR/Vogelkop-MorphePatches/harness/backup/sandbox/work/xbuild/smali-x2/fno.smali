.class public final Lfno;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Landroid/app/Application;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Application;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lfno;->t:B

    iput-object p1, p0, Lfno;->v:Landroid/app/Application;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lfno;->t:B

    iget-object p0, p0, Lfno;->v:Landroid/app/Application;

    packed-switch p1, :pswitch_data_70

    new-instance p1, Lfno;

    const/16 v0, 0xd

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_f
    new-instance p1, Lfno;

    const/16 v0, 0xc

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_17
    new-instance p1, Lfno;

    const/16 v0, 0xb

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_1f
    new-instance p1, Lfno;

    const/16 v0, 0xa

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_27
    new-instance p1, Lfno;

    const/16 v0, 0x9

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_2f
    new-instance p1, Lfno;

    const/16 v0, 0x8

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_37
    new-instance p1, Lfno;

    const/4 v0, 0x7

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_3e
    new-instance p1, Lfno;

    const/4 v0, 0x6

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_45
    new-instance p1, Lfno;

    const/4 v0, 0x5

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_4c
    new-instance p1, Lfno;

    const/4 v0, 0x4

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_53
    new-instance p1, Lfno;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_5a
    new-instance p1, Lfno;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_61
    new-instance p1, Lfno;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_68
    new-instance p1, Lfno;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_68
        :pswitch_61
        :pswitch_5a
        :pswitch_53
        :pswitch_4c
        :pswitch_45
        :pswitch_3e
        :pswitch_37
        :pswitch_2f
        :pswitch_27
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lfno;->t:B

    packed-switch v0, :pswitch_data_f4

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c0
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_f4
    .packed-switch 0x0
        :pswitch_e2
        :pswitch_d1
        :pswitch_c0
        :pswitch_af
        :pswitch_9e
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
    .registers 9

    iget-byte v0, p0, Lfno;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_2b8

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_1a

    if-ne v1, v3, :cond_16

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_38

    :cond_16
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_3a

    :cond_1a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcbp;->b:Landroid/app/Application;

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Lmr6;->b:Lmr6;

    new-instance v2, Lino;

    invoke-direct {v2, p1, v4, v3}, Lino;-><init>(Landroid/app/Application;Lmt5;B)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_34

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_34
    if-ne p0, v0, :cond_38

    move-object v4, v0

    goto :goto_3a

    :cond_38
    :goto_38
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3a
    return-object v4

    :pswitch_3b
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_4b

    if-ne v1, v3, :cond_47

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5a

    :cond_47
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_5c

    :cond_4b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-static {p1, p0}, Lepo;->a(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5a

    move-object v4, v0

    goto :goto_5c

    :cond_5a
    :goto_5a
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5c
    return-object v4

    :pswitch_5d
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_6d

    if-ne v1, v3, :cond_69

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_91

    :cond_69
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_93

    :cond_6d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    sget-boolean v1, Lzlp;->a:Z

    if-nez v1, :cond_8b

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Lmr6;->b:Lmr6;

    new-instance v3, Loa7;

    invoke-direct {v3, v1, p1, v4}, Loa7;-><init>(Landroid/content/Context;Landroid/content/Context;Lmt5;)V

    invoke-static {v2, v3, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_8d

    :cond_8b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_8d
    if-ne p0, v0, :cond_91

    move-object v4, v0

    goto :goto_93

    :cond_91
    :goto_91
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_93
    return-object v4

    :pswitch_94
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_a4

    if-ne v1, v3, :cond_a0

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_b3

    :cond_a0
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_b5

    :cond_a4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-static {p1, p0}, Lepo;->a(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_b3

    move-object v4, v0

    goto :goto_b5

    :cond_b3
    :goto_b3
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_b5
    return-object v4

    :pswitch_b6
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_c6

    if-ne v1, v3, :cond_c2

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_f1

    :cond_c2
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_f3

    :cond_c6
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lyro;->a:Ljava/lang/String;

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Lyro;->c:Ljava/lang/String;

    if-nez v1, :cond_e7

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Lmr6;->b:Lmr6;

    new-instance v2, Lwr;

    const/4 v3, 0x4

    invoke-direct {v2, p1, v4, v3}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_e9

    :cond_e7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_e9
    if-eq p0, v0, :cond_ed

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_ed
    if-ne p0, v0, :cond_f1

    move-object v4, v0

    goto :goto_f3

    :cond_f1
    :goto_f1
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_f3
    return-object v4

    :pswitch_f4
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_104

    if-ne v1, v3, :cond_100

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_126

    :cond_100
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_128

    :cond_104
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    sget-object v1, Ljko;->a:Ljava/util/TreeSet;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Ljko;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldx5;

    new-instance v2, Ljho;

    invoke-direct {v2, p1, v4}, Ljho;-><init>(Landroid/content/Context;Lmt5;)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_126

    move-object v4, v0

    goto :goto_128

    :cond_126
    :goto_126
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_128
    return-object v4

    :pswitch_129
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_139

    if-ne v1, v3, :cond_135

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_14a

    :cond_135
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_14c

    :cond_139
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lwjh;->i:Lcpj;

    iget-object v1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-virtual {p1, v1, p0}, Lcpj;->e(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_14a

    move-object v4, v0

    goto :goto_14c

    :cond_14a
    :goto_14a
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_14c
    return-object v4

    :pswitch_14d
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lfno;->u:Z

    if-eqz v5, :cond_15d

    if-ne v5, v3, :cond_159

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_180

    :cond_159
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_182

    :cond_15d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    sget-object v2, Llah;->a:Ljava/lang/String;

    if-eqz v2, :cond_16b

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_17c

    :cond_16b
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Lmr6;->b:Lmr6;

    new-instance v3, Ljho;

    invoke-direct {v3, p1, v1, v4}, Ljho;-><init>(Landroid/content/Context;ZLmt5;)V

    invoke-static {v2, v3, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    :goto_17c
    if-ne p0, v0, :cond_180

    move-object v4, v0

    goto :goto_182

    :cond_180
    :goto_180
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_182
    return-object v4

    :pswitch_183
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_193

    if-ne v1, v3, :cond_18f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1c1

    :cond_18f
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1c3

    :cond_193
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    sget-object v1, Luip;->a:Lbxk;

    iget-object v1, v1, Lbxk;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Lmr6;->b:Lmr6;

    new-instance v2, Lwr;

    const/16 v3, 0xc

    invoke-direct {v2, p1, v4, v3}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {v1, v2, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_1bd

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1bd
    if-ne p0, v0, :cond_1c1

    move-object v4, v0

    goto :goto_1c3

    :cond_1c1
    :goto_1c1
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1c3
    return-object v4

    :pswitch_1c4
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_1d4

    if-ne v1, v3, :cond_1d0

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1f2

    :cond_1d0
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1f4

    :cond_1d4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lpn7;->b:Lon7;

    sget-object p1, Lun7;->e:Lun7;

    const/4 v1, 0x5

    invoke-static {v1, p1}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    new-instance p1, Lfno;

    iget-object v5, p0, Lfno;->v:Landroid/app/Application;

    const/4 v6, 0x3

    invoke-direct {p1, v5, v4, v6}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-static {v1, v2, p1, p0}, Luyg;->v(JLkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_1f2

    move-object v4, v0

    goto :goto_1f4

    :cond_1f2
    :goto_1f2
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1f4
    return-object v4

    :pswitch_1f5
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_205

    if-ne v1, v3, :cond_201

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_214

    :cond_201
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_216

    :cond_205
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-static {p1, p0}, Lepo;->a(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_214

    move-object v4, v0

    goto :goto_216

    :cond_214
    :goto_214
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_216
    return-object v4

    :pswitch_217
    iget-object v0, p0, Lfno;->v:Landroid/app/Application;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lfno;->u:Z

    if-eqz v5, :cond_229

    if-ne v5, v3, :cond_225

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_236

    :cond_225
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_25b

    :cond_229
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v3, p0, Lfno;->u:Z

    invoke-static {v0, p0}, Laap;->a(Landroid/app/Application;Lnt5;)Ljava/io/Serializable;

    move-result-object p1

    if-ne p1, v1, :cond_236

    move-object v4, v1

    goto :goto_25b

    :cond_236
    :goto_236
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    sput-object v4, Laap;->h:Ld3k;

    if-eqz p0, :cond_259

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p0

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v1

    iget-wide v1, v1, Lz8p;->C:J

    add-long/2addr p0, v1

    sput-wide p0, Laap;->f:J

    sget-object p0, Laap;->g:Ld3k;

    if-eqz p0, :cond_254

    invoke-virtual {p0, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_254
    sput-object v4, Laap;->g:Ld3k;

    invoke-static {v0}, Laap;->e(Landroid/app/Application;)V

    :cond_259
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_25b
    return-object v4

    :pswitch_25c
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfno;->u:Z

    if-eqz v1, :cond_26c

    if-ne v1, v3, :cond_268

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_27b

    :cond_268
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_289

    :cond_26c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v3, p0, Lfno;->u:Z

    const-wide/16 v1, 0x1388

    invoke-static {v1, v2, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_27b

    move-object v4, v0

    goto :goto_289

    :cond_27b
    :goto_27b
    const-string p1, "scheduleSave"

    const-string v0, "saveImmediately() after delay"

    invoke-static {p1, v0}, Lnxg;->g(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lfno;->v:Landroid/app/Application;

    invoke-static {p0}, Ljno;->c(Landroid/app/Application;)V

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_289
    return-object v4

    :pswitch_28a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lfno;->u:Z

    if-eqz v5, :cond_29b

    if-ne v5, v3, :cond_296

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2b6

    :cond_296
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v4

    goto :goto_2b6

    :cond_29b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Ljno;->a:Ljno;

    iget-object p1, p0, Lfno;->v:Landroid/app/Application;

    invoke-static {p1}, Ljno;->b(Landroid/content/Context;)Loio;

    move-result-object p1

    iput-boolean v3, p0, Lfno;->u:Z

    iget-object v2, p1, Loio;->a:Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Liep;

    invoke-direct {v3, p1, v4, v1}, Liep;-><init>(Loio;Lmt5;B)V

    invoke-static {v2, v3, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2b6

    move-object p1, v0

    :cond_2b6
    :goto_2b6
    return-object p1

    nop

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_28a
        :pswitch_25c
        :pswitch_217
        :pswitch_1f5
        :pswitch_1c4
        :pswitch_183
        :pswitch_14d
        :pswitch_129
        :pswitch_f4
        :pswitch_b6
        :pswitch_94
        :pswitch_5d
        :pswitch_3b
    .end packed-switch
.end method
