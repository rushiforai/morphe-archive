.class public final Lss6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public final synthetic v:J

.field public w:Ljava/lang/Object;

.field public x:Ljava/lang/Object;

.field public y:Ljava/lang/Object;

.field public final synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(JLads_mobile_sdk/fh2;Lmt5;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lss6;->t:B

    .line 14
    iput-wide p1, p0, Lss6;->v:J

    iput-object p3, p0, Lss6;->z:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lch9;Lvs6;JLmt5;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lss6;->t:B

    iput-object p1, p0, Lss6;->z:Ljava/lang/Object;

    iput-object p2, p0, Lss6;->x:Ljava/lang/Object;

    iput-wide p3, p0, Lss6;->v:J

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 13

    iget-byte v0, p0, Lss6;->t:B

    iget-object v1, p0, Lss6;->z:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    new-instance v0, Lss6;

    iget-wide v2, p0, Lss6;->v:J

    check-cast v1, Lads_mobile_sdk/fh2;

    invoke-direct {v0, v2, v3, v1, p2}, Lss6;-><init>(JLads_mobile_sdk/fh2;Lmt5;)V

    iput-object p1, v0, Lss6;->y:Ljava/lang/Object;

    return-object v0

    :pswitch_13
    new-instance v4, Lss6;

    move-object v5, v1

    check-cast v5, Lch9;

    iget-object p1, p0, Lss6;->x:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Lvs6;

    iget-wide v7, p0, Lss6;->v:J

    move-object v9, p2

    invoke-direct/range {v4 .. v9}, Lss6;-><init>(Lch9;Lvs6;JLmt5;)V

    return-object v4

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lss6;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lss6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lss6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lss6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lss6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lss6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lss6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lss6;->t:B

    iget-wide v1, p0, Lss6;->v:J

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    iget-object v5, p0, Lss6;->z:Ljava/lang/Object;

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x0

    packed-switch v0, :pswitch_data_180

    check-cast v5, Lads_mobile_sdk/fh2;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v9, p0, Lss6;->u:B

    if-eqz v9, :cond_43

    if-eq v9, v4, :cond_3b

    if-eq v9, v6, :cond_33

    if-ne v9, v7, :cond_2e

    iget-object v0, p0, Lss6;->x:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lads_mobile_sdk/fh2;

    iget-object v0, p0, Lss6;->w:Ljava/lang/Object;

    check-cast v0, Lpfe;

    iget-object p0, p0, Lss6;->y:Ljava/lang/Object;

    check-cast p0, Lnx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_84

    :cond_2e
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_9e

    :cond_33
    iget-object v1, p0, Lss6;->y:Ljava/lang/Object;

    check-cast v1, Lnx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_70

    :cond_3b
    iget-object v1, p0, Lss6;->y:Ljava/lang/Object;

    check-cast v1, Lnx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_55

    :cond_43
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lss6;->y:Ljava/lang/Object;

    check-cast p1, Lnx5;

    iput-object p1, p0, Lss6;->y:Ljava/lang/Object;

    iput-byte v4, p0, Lss6;->u:B

    invoke-static {v1, v2, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_80

    move-object v1, p1

    :goto_55
    iget-object p1, v5, Lads_mobile_sdk/fh2;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_70

    iget-object p1, v5, Lads_mobile_sdk/fh2;->a:Lads_mobile_sdk/xj2;

    iput-object v1, p0, Lss6;->y:Ljava/lang/Object;

    iput-byte v6, p0, Lss6;->u:B

    sget-object v2, Lads_mobile_sdk/fw0;->s1:Lads_mobile_sdk/fw0;

    invoke-virtual {p1, v2, p0}, Lads_mobile_sdk/xj2;->a(Lads_mobile_sdk/fw0;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_6e

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_6e
    if-eq p1, v0, :cond_80

    :cond_70
    :goto_70
    iget-object p1, v5, Lads_mobile_sdk/fh2;->f:Lpfe;

    iput-object v1, p0, Lss6;->y:Ljava/lang/Object;

    iput-object p1, p0, Lss6;->w:Ljava/lang/Object;

    iput-object v5, p0, Lss6;->x:Ljava/lang/Object;

    iput-byte v7, p0, Lss6;->u:B

    invoke-virtual {p1, p0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_82

    :cond_80
    move-object v8, v0

    goto :goto_9e

    :cond_82
    move-object v0, p1

    move-object p0, v1

    :goto_84
    :try_start_84
    iget-object p1, v5, Lads_mobile_sdk/fh2;->g:Ld3k;

    invoke-interface {p0}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    sget-object v1, Lulp;->h:Lulp;

    invoke-interface {p0, v1}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_98

    iput-object v8, v5, Lads_mobile_sdk/fh2;->g:Ld3k;

    :cond_98
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_9a
    .catchall {:try_start_84 .. :try_end_9a} :catchall_9f

    invoke-virtual {v0, v8}, Lpfe;->l(Ljava/lang/Object;)V

    move-object v8, p0

    :goto_9e
    return-object v8

    :catchall_9f
    move-exception p0

    invoke-virtual {v0, v8}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0

    :pswitch_a4
    iget-object v0, p0, Lss6;->x:Ljava/lang/Object;

    check-cast v0, Lvs6;

    iget-object v9, v0, Lvs6;->b:Lgmc;

    sget-object v10, Lpx5;->a:Lpx5;

    iget-byte v11, p0, Lss6;->u:B

    const/4 v12, 0x5

    const/4 v13, 0x4

    if-eqz v11, :cond_e4

    if-eq v11, v4, :cond_df

    if-eq v11, v6, :cond_d8

    if-eq v11, v7, :cond_d3

    if-eq v11, v13, :cond_cf

    if-ne v11, v12, :cond_ca

    iget-object v0, p0, Lss6;->y:Ljava/lang/Object;

    check-cast v0, Lruc;

    iget-object p0, p0, Lss6;->w:Ljava/lang/Object;

    check-cast p0, Lvs6;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object p1, v0

    move-object v0, p0

    goto :goto_111

    :cond_ca
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_17e

    :cond_cf
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_fd

    :cond_d3
    :goto_d3
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_17c

    :cond_d8
    iget-object p0, p0, Lss6;->w:Ljava/lang/Object;

    check-cast p0, Lvs6;

    check-cast p0, Lruc;

    goto :goto_d3

    :cond_df
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_168

    :cond_e4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v5, Lch9;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_15e

    if-eq p1, v4, :cond_153

    if-ne p1, v6, :cond_14f

    sget-object p1, Loi9;->e:Loi9;

    iput-byte v13, p0, Lss6;->u:B

    invoke-virtual {v0, v1, v2, p1, p0}, Lvs6;->c(JLoi9;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v10, :cond_17a

    :goto_fd
    check-cast p1, Lruc;

    if-eqz p1, :cond_17c

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v0, p0, Lss6;->w:Ljava/lang/Object;

    iput-object p1, p0, Lss6;->y:Ljava/lang/Object;

    iput-byte v12, p0, Lss6;->u:B

    invoke-virtual {v9, v1, p0}, Lgmc;->g(Ljava/util/List;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v10, :cond_17a

    :goto_111
    iget-object p0, v0, Lvs6;->e:Lqs6;

    iget-object p0, p0, Lqs6;->d:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_17c

    iget-object p0, v0, Lvs6;->e:Lqs6;

    iget-object p0, p0, Lqs6;->h:Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-nez p0, :cond_133

    sget-object p0, Lv08;->a:Lv08;

    :cond_133
    sget-object v1, Lapc;->c:Lapc;

    invoke-interface {p0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17c

    new-instance p0, Ljoc;

    iget-wide v2, p1, Lruc;->a:J

    invoke-direct {p0, v2, v3, v1}, Ljoc;-><init>(JLapc;)V

    iget-wide v1, p1, Lruc;->n:J

    new-instance p1, Lvk2;

    const/16 v3, 0xa

    invoke-direct {p1, v3}, Lvk2;-><init>(B)V

    invoke-virtual {v0, p0, v1, v2, p1}, Lvs6;->a(Ljoc;JLcom/opera/api/Callback;)V

    goto :goto_17c

    :cond_14f
    invoke-static {}, Lh9o;->p()V

    goto :goto_17e

    :cond_153
    sget-object p1, Loi9;->e:Loi9;

    iput-byte v7, p0, Lss6;->u:B

    invoke-virtual {v9, v1, v2, p1, p0}, Lgmc;->c(JLoi9;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v10, :cond_17c

    goto :goto_17a

    :cond_15e
    sget-object p1, Loi9;->e:Loi9;

    iput-byte v4, p0, Lss6;->u:B

    invoke-virtual {v0, v1, v2, p1, p0}, Lvs6;->c(JLoi9;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v10, :cond_17a

    :goto_168
    check-cast p1, Lruc;

    if-eqz p1, :cond_17c

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object v8, p0, Lss6;->w:Ljava/lang/Object;

    iput-byte v6, p0, Lss6;->u:B

    invoke-virtual {v9, p1, p0}, Lgmc;->g(Ljava/util/List;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v10, :cond_17c

    :cond_17a
    :goto_17a
    move-object v8, v10

    goto :goto_17e

    :cond_17c
    :goto_17c
    sget-object v8, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_17e
    return-object v8

    nop

    :pswitch_data_180
    .packed-switch 0x0
        :pswitch_a4
    .end packed-switch
.end method
