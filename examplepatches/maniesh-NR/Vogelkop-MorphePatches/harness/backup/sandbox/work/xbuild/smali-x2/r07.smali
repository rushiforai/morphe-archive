.class public final Lr07;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public v:Z

.field public synthetic w:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILmt5;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lr07;->t:B

    sget-object v1, Lcak;->d:Lavj;

    .line 12
    iput-byte p1, p0, Lr07;->u:B

    invoke-direct {p0, v0, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lu07;Lmt5;I)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lr07;->t:B

    iput-object p1, p0, Lr07;->w:Ljava/lang/Object;

    iput-byte p3, p0, Lr07;->u:B

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lx4i;ZLmt5;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lr07;->t:B

    .line 13
    iput-object p1, p0, Lr07;->w:Ljava/lang/Object;

    iput-boolean p2, p0, Lr07;->v:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lr07;->t:B

    packed-switch v0, :pswitch_data_2a

    new-instance v0, Lr07;

    sget-object v1, Lcak;->d:Lavj;

    iget-byte p0, p0, Lr07;->u:B

    invoke-direct {v0, p0, p2}, Lr07;-><init>(ILmt5;)V

    iput-object p1, v0, Lr07;->w:Ljava/lang/Object;

    return-object v0

    :pswitch_11
    new-instance p1, Lr07;

    iget-object v0, p0, Lr07;->w:Ljava/lang/Object;

    check-cast v0, Lx4i;

    iget-boolean p0, p0, Lr07;->v:Z

    invoke-direct {p1, v0, p0, p2}, Lr07;-><init>(Lx4i;ZLmt5;)V

    return-object p1

    :pswitch_1d
    new-instance p1, Lr07;

    iget-object v0, p0, Lr07;->w:Ljava/lang/Object;

    check-cast v0, Lu07;

    iget-byte p0, p0, Lr07;->u:B

    invoke-direct {p1, v0, p2, p0}, Lr07;-><init>(Lu07;Lmt5;I)V

    return-object p1

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_11
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lr07;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_30

    invoke-virtual {p0, p1, p2}, Lr07;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lr07;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lr07;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lr07;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lr07;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lr07;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lr07;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lr07;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lr07;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lr07;->t:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_f8

    iget-object v0, p0, Lr07;->w:Ljava/lang/Object;

    check-cast v0, Lnx5;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lr07;->v:Z

    if-eqz v6, :cond_1e

    if-ne v6, v4, :cond_1a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4d

    :cond_1a
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_4f

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcak;->d:Lavj;

    iget-byte p1, p0, Lr07;->u:B

    iput-object v0, p0, Lr07;->w:Ljava/lang/Object;

    iput-boolean v4, p0, Lr07;->v:Z

    new-instance v2, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {v2, v4, p0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {v2}, Lnh4;->s()V

    new-instance p0, Ldak;

    invoke-direct {p0, v2, v1}, Ldak;-><init>(Lnh4;B)V

    invoke-static {p1, p0}, Lavj;->g(ILjava/lang/Runnable;)V

    new-instance p1, Lm91;

    invoke-direct {p1, v0, p0}, Lm91;-><init>(Lnx5;Ldak;)V

    invoke-virtual {v2, p1}, Lnh4;->u(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_4d

    move-object v2, v5

    goto :goto_4f

    :cond_4d
    :goto_4d
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4f
    return-object v2

    :pswitch_50
    iget-object v0, p0, Lr07;->w:Ljava/lang/Object;

    check-cast v0, Lx4i;

    iget-object v5, v0, Lx4i;->a:Ly3i;

    sget-object v6, Lpx5;->a:Lpx5;

    iget-byte v7, p0, Lr07;->u:B

    const/4 v8, 0x2

    if-eqz v7, :cond_71

    if-eq v7, v4, :cond_6d

    if-ne v7, v8, :cond_69

    :try_start_61
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;
    :try_end_68
    .catchall {:try_start_61 .. :try_end_68} :catchall_c2

    goto :goto_b3

    :cond_69
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_c8

    :cond_6d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9c

    :cond_71
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v0, Lx4i;->b:Likc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    sget-object v2, Lm18;->b:Lm18;

    if-ne p1, v2, :cond_c6

    iget-boolean p1, v0, Lx4i;->g:Z

    if-eqz p1, :cond_85

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_c8

    :cond_85
    iget-boolean p1, v0, Lx4i;->f:Z

    if-eqz p1, :cond_8c

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_c8

    :cond_8c
    iget-boolean p1, p0, Lr07;->v:Z

    if-eqz p1, :cond_a7

    iput-byte v4, p0, Lr07;->u:B

    invoke-interface {v5}, Ly3i;->d()Lf99;

    move-result-object p1

    invoke-static {p1, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v6, :cond_b1

    :goto_9c
    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_a7

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_c8

    :cond_a7
    :try_start_a7
    iput-boolean v4, v0, Lx4i;->f:Z

    iput-byte v8, p0, Lr07;->u:B

    invoke-interface {v5, p0}, Ly3i;->o(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v6, :cond_b3

    :cond_b1
    move-object v2, v6

    goto :goto_c8

    :cond_b3
    :goto_b3
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_bd

    check-cast p0, Lkotlin/Unit;

    iput-boolean v4, v0, Lx4i;->g:Z
    :try_end_bd
    .catchall {:try_start_a7 .. :try_end_bd} :catchall_c2

    :cond_bd
    iput-boolean v1, v0, Lx4i;->f:Z

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_c8

    :catchall_c2
    move-exception p0

    iput-boolean v1, v0, Lx4i;->f:Z

    throw p0

    :cond_c6
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_c8
    return-object v2

    :pswitch_c9
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lr07;->v:Z

    if-eqz v1, :cond_da

    if-ne v1, v4, :cond_d5

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_f6

    :cond_d5
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v2

    goto :goto_f6

    :cond_da
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lr07;->w:Ljava/lang/Object;

    check-cast p1, Lu07;

    invoke-virtual {p1}, Lu07;->n()Lism;

    move-result-object p1

    iget-byte v1, p0, Lr07;->u:B

    invoke-virtual {p1, v1}, Lism;->j(I)Lh07;

    move-result-object p1

    iput-boolean v4, p0, Lr07;->v:Z

    check-cast p1, Lcd5;

    invoke-virtual {p1, p0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_f6

    move-object p1, v0

    :cond_f6
    :goto_f6
    return-object p1

    nop

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_c9
        :pswitch_50
    .end packed-switch
.end method
