.class public final synthetic Lxm6;
.super Lkr;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lxm6;->h:B

    invoke-direct/range {p0 .. p6}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(Lmt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lp0o;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lp0o;

    iget v1, v0, Lp0o;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lp0o;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lp0o;

    invoke-direct {v0, p0, p1}, Lp0o;-><init>(Lxm6;Lmt5;)V

    :goto_18
    iget-object p1, v0, Lp0o;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lp0o;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5f

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lkr;->a:Ljava/lang/Object;

    check-cast p0, Li0o;

    iput v3, v0, Lp0o;->v:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lnh4;

    invoke-static {v0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v0

    invoke-direct {p1, v3, v0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V

    iget-object p0, p0, Li0o;->c:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqln;

    iget-object p0, p0, Lqln;->f:Lami;

    new-instance v0, Ldak;

    invoke-direct {v0, p1, v3}, Ldak;-><init>(Lnh4;B)V

    invoke-virtual {p0, v0}, Lami;->r(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_5f

    return-object v1

    :cond_5f
    :goto_5f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lxm6;->h:B

    iget-object v1, p0, Lkr;->a:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_46

    check-cast p1, Lmt5;

    invoke-virtual {p0, p1}, Lxm6;->d(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p1, Lmt5;

    check-cast v1, Ldfg;

    invoke-virtual {v1, p1}, Ldfg;->c(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-eq p0, p1, :cond_1c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1c
    return-object p0

    :pswitch_1d
    check-cast p1, Ljoi;

    check-cast v1, Ldfe;

    invoke-virtual {v1, p1}, Ldfe;->c(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    check-cast p1, Liz2;

    check-cast v1, Lml6;

    iget-object p0, v1, Lml6;->a:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lxvg;->o(Ljava/lang/Iterable;)Lgz2;

    move-result-object p0

    if-eqz p0, :cond_43

    new-instance v0, Lz8b;

    invoke-direct {v0, p1, p0}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v1, Lml6;->b:Lz8b;

    iget-object p0, p0, Lgz2;->d:Lxm6;

    if-eqz p0, :cond_43

    invoke-virtual {p0, p1}, Lxm6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_27
        :pswitch_1d
        :pswitch_e
    .end packed-switch
.end method
