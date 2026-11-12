.class public final Ly6p;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lo7p;

.field public final synthetic w:Lsro;


# direct methods
.method public constructor <init>(Lo7p;Lsro;Lmt5;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ly6p;->t:B

    .line 12
    iput-object p1, p0, Ly6p;->v:Lo7p;

    iput-object p2, p0, Ly6p;->w:Lsro;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lsro;Lo7p;Lmt5;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ly6p;->t:B

    iput-object p1, p0, Ly6p;->w:Lsro;

    iput-object p2, p0, Ly6p;->v:Lo7p;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Ly6p;->t:B

    iget-object v0, p0, Ly6p;->w:Lsro;

    iget-object p0, p0, Ly6p;->v:Lo7p;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Ly6p;

    invoke-direct {p1, p0, v0, p2}, Ly6p;-><init>(Lo7p;Lsro;Lmt5;)V

    return-object p1

    :pswitch_f
    new-instance p1, Ly6p;

    invoke-direct {p1, v0, p0, p2}, Ly6p;-><init>(Lsro;Lo7p;Lmt5;)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ly6p;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ly6p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ly6p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ly6p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ly6p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ly6p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ly6p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Ly6p;->t:B

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v2, p0, Ly6p;->w:Lsro;

    iget-object v3, p0, Ly6p;->v:Lo7p;

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_92

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Ly6p;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v4, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_33

    :cond_19
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_54

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Lmr6;->b:Lmr6;

    new-instance v1, Lx6p;

    invoke-direct {v1, v2, v5, v4}, Lx6p;-><init>(Lsro;Lmt5;B)V

    iput-boolean v4, p0, Ly6p;->u:Z

    invoke-static {p1, v1, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_33

    move-object v5, v0

    goto :goto_54

    :cond_33
    :goto_33
    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    sget-object p1, Lt0i;->b:Lp0i;

    iget-object p1, v3, Lpxo;->a:Landroid/content/Context;

    instance-of v0, p0, Lq0i;

    if-nez v0, :cond_40

    move-object v5, p0

    :cond_40
    check-cast v5, Landroid/util/Size;

    new-instance p0, Lu6p;

    const/4 v0, 0x2

    invoke-direct {p0, v3, v0}, Lu6p;-><init>(Lo7p;B)V

    invoke-virtual {v2, p1, v5, p0}, Lsro;->b(Landroid/content/Context;Landroid/util/Size;Lu6p;)V

    iget-object p0, v3, Lpxo;->c:Luuj;

    if-eqz p0, :cond_52

    invoke-virtual {p0}, Luuj;->a()V

    :cond_52
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_54
    return-object v5

    :pswitch_55
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Ly6p;->u:Z

    if-eqz v6, :cond_65

    if-ne v6, v4, :cond_61

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7c

    :cond_61
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_90

    :cond_65
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Lmr6;->b:Lmr6;

    new-instance v1, Lx6p;

    const/4 v6, 0x0

    invoke-direct {v1, v2, v5, v6}, Lx6p;-><init>(Lsro;Lmt5;B)V

    iput-boolean v4, p0, Ly6p;->u:Z

    invoke-static {p1, v1, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_7c

    move-object v5, v0

    goto :goto_90

    :cond_7c
    :goto_7c
    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    sget-object p1, Lt0i;->b:Lp0i;

    iget-object p1, v3, Lpxo;->a:Landroid/content/Context;

    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_89

    move-object p0, v5

    :cond_89
    check-cast p0, Landroid/util/Size;

    invoke-virtual {v2, p1, p0, v5}, Lsro;->b(Landroid/content/Context;Landroid/util/Size;Lu6p;)V

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_90
    return-object v5

    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_55
    .end packed-switch
.end method
