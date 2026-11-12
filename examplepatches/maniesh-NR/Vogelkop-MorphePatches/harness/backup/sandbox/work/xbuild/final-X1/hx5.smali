.class public final Lhx5;
.super Lh42;
.source "SourceFile"


# instance fields
.field public final synthetic n:B

.field public o:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 17
    iput-byte p1, p0, Lhx5;->n:B

    invoke-direct {p0}, Lh42;-><init>()V

    return-void
.end method

.method public constructor <init>(Lekc;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lhx5;->n:B

    invoke-direct {p0}, Lh42;-><init>()V

    iput-object p2, p0, Lhx5;->o:Ljava/lang/Object;

    new-instance p2, Lu6j;

    invoke-direct {p2, p0}, Lu6j;-><init>(Lhx5;)V

    invoke-virtual {p0, p1, p2}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lv6j;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lhx5;->n:B

    .line 18
    iput-object p1, p0, Lhx5;->o:Ljava/lang/Object;

    invoke-direct {p0}, Lh42;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lhx5;->n:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lhx5;->o:Ljava/lang/Object;

    check-cast p0, Lekc;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    goto :goto_16

    :cond_12
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    :goto_16
    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final l()V
    .registers 5

    iget-byte v0, p0, Lhx5;->n:B

    sparse-switch v0, :sswitch_data_42

    invoke-super {p0}, Lh42;->l()V

    return-void

    :sswitch_9
    invoke-super {p0}, Lh42;->l()V

    iget-object p0, p0, Lhx5;->o:Ljava/lang/Object;

    check-cast p0, Lv6j;

    invoke-virtual {p0}, Lv6j;->e()V

    return-void

    :sswitch_14
    invoke-super {p0}, Lh42;->l()V

    iget-object p0, p0, Lhx5;->o:Ljava/lang/Object;

    check-cast p0, Ligi;

    if-eqz p0, :cond_41

    iget-object v0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Ld3k;

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_27
    iput-object v1, p0, Ligi;->g:Ljava/lang/Object;

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Ld3k;

    if-nez v0, :cond_41

    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, La64;

    new-instance v2, Lr3;

    const/16 v3, 0x8

    invoke-direct {v2, v3, v1, p0}, Lr3;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v3, 0x3

    invoke-static {v0, v1, v1, v2, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Ligi;->f:Ljava/lang/Object;

    :cond_41
    return-void

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_14
        0x3 -> :sswitch_9
    .end sparse-switch
.end method

.method public final m()V
    .registers 6

    iget-byte v0, p0, Lhx5;->n:B

    sparse-switch v0, :sswitch_data_42

    invoke-super {p0}, Lh42;->m()V

    return-void

    :sswitch_9
    invoke-super {p0}, Lh42;->m()V

    iget-object p0, p0, Lhx5;->o:Ljava/lang/Object;

    check-cast p0, Lv6j;

    invoke-virtual {p0}, Lv6j;->f()V

    return-void

    :sswitch_14
    invoke-super {p0}, Lh42;->m()V

    iget-object p0, p0, Lhx5;->o:Ljava/lang/Object;

    check-cast p0, Ligi;

    if-eqz p0, :cond_41

    iget-object v0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Ld3k;

    if-nez v0, :cond_3c

    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, La64;

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Ls6d;->a:Ld7a;

    iget-object v1, v1, Ld7a;->e:Ld7a;

    new-instance v2, Lyf;

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v3, 0x2

    invoke-static {v0, v1, v4, v2, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Ligi;->g:Ljava/lang/Object;

    goto :goto_41

    :cond_3c
    const-string p0, "Cancel call cannot happen without a maybeRun"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_41
    :goto_41
    return-void

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_14
        0x3 -> :sswitch_9
    .end sparse-switch
.end method

.method public final u(Lnt5;)Lkotlin/Unit;
    .registers 6

    instance-of v0, p1, Lgx5;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lgx5;

    iget v1, v0, Lgx5;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lgx5;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lgx5;

    invoke-direct {v0, p0, p1}, Lgx5;-><init>(Lhx5;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lgx5;->t:Ljava/lang/Object;

    sget-object p1, Lpx5;->a:Lpx5;

    iget p1, v0, Lgx5;->v:I

    if-eqz p1, :cond_2a

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2a

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2a
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
