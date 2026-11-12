.class public final Lra6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public synthetic v:Ll99;

.field public synthetic w:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Lra6;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte p0, p0, Lra6;->t:B

    check-cast p1, Ll99;

    check-cast p2, Ljava/lang/Throwable;

    check-cast p3, Lmt5;

    packed-switch p0, :pswitch_data_66

    new-instance p0, Lra6;

    const/4 v0, 0x3

    const/4 v1, 0x4

    invoke-direct {p0, v0, p3, v1}, Lra6;-><init>(ILmt5;B)V

    iput-object p1, p0, Lra6;->v:Ll99;

    iput-object p2, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lra6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1d
    new-instance p0, Lra6;

    const/4 v0, 0x3

    const/4 v1, 0x3

    invoke-direct {p0, v0, p3, v1}, Lra6;-><init>(ILmt5;B)V

    iput-object p1, p0, Lra6;->v:Ll99;

    iput-object p2, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lra6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2f
    new-instance p0, Lra6;

    const/4 v0, 0x3

    const/4 v1, 0x2

    invoke-direct {p0, v0, p3, v1}, Lra6;-><init>(ILmt5;B)V

    iput-object p1, p0, Lra6;->v:Ll99;

    iput-object p2, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lra6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_41
    new-instance p0, Lra6;

    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-direct {p0, v0, p3, v1}, Lra6;-><init>(ILmt5;B)V

    iput-object p1, p0, Lra6;->v:Ll99;

    iput-object p2, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lra6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_53
    new-instance p0, Lra6;

    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, p3, v1}, Lra6;-><init>(ILmt5;B)V

    iput-object p1, p0, Lra6;->v:Ll99;

    iput-object p2, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lra6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_53
        :pswitch_41
        :pswitch_2f
        :pswitch_1d
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lra6;->t:B

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_10c

    iget-object v0, p0, Lra6;->v:Ll99;

    iget-object v4, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lra6;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v2, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_39

    :cond_19
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_3b

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, v4, Ljava/io/IOException;

    if-eqz p1, :cond_3c

    new-instance p1, Lwch;

    const-string v1, ""

    invoke-direct {p1, v1}, Lwch;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lra6;->v:Ll99;

    iput-object v3, p0, Lra6;->w:Ljava/lang/Throwable;

    iput-boolean v2, p0, Lra6;->u:Z

    invoke-interface {v0, p1, p0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_39

    move-object v3, v5

    goto :goto_3b

    :cond_39
    :goto_39
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3b
    return-object v3

    :cond_3c
    throw v4

    :pswitch_3d
    iget-object v0, p0, Lra6;->v:Ll99;

    iget-object v4, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lra6;->u:Z

    if-eqz v6, :cond_51

    if-ne v6, v2, :cond_4d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6a

    :cond_4d
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_6c

    :cond_51
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, v4, Ljava/io/IOException;

    if-eqz p1, :cond_6d

    invoke-static {}, Lfon;->g()Lfon;

    move-result-object p1

    iput-object v3, p0, Lra6;->v:Ll99;

    iput-object v3, p0, Lra6;->w:Ljava/lang/Throwable;

    iput-boolean v2, p0, Lra6;->u:Z

    invoke-interface {v0, p1, p0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_6a

    move-object v3, v5

    goto :goto_6c

    :cond_6a
    :goto_6a
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6c
    return-object v3

    :cond_6d
    throw v4

    :pswitch_6e
    iget-object v0, p0, Lra6;->v:Ll99;

    iget-object v4, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lra6;->u:Z

    if-eqz v6, :cond_82

    if-ne v6, v2, :cond_7e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9b

    :cond_7e
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_9d

    :cond_82
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, v4, Ljava/io/IOException;

    if-eqz p1, :cond_9e

    invoke-static {}, Liuc;->d()Liuc;

    move-result-object p1

    iput-object v3, p0, Lra6;->v:Ll99;

    iput-object v3, p0, Lra6;->w:Ljava/lang/Throwable;

    iput-boolean v2, p0, Lra6;->u:Z

    invoke-interface {v0, p1, p0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_9b

    move-object v3, v5

    goto :goto_9d

    :cond_9b
    :goto_9b
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9d
    return-object v3

    :cond_9e
    throw v4

    :pswitch_9f
    iget-object v0, p0, Lra6;->v:Ll99;

    iget-object v4, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lra6;->u:Z

    if-eqz v6, :cond_b3

    if-ne v6, v2, :cond_af

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ca

    :cond_af
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_cc

    :cond_b3
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, v4, Ljava/io/IOException;

    if-eqz p1, :cond_cd

    sget-object p1, Lme6;->b:Lfdk;

    iput-object v3, p0, Lra6;->v:Ll99;

    iput-object v3, p0, Lra6;->w:Ljava/lang/Throwable;

    iput-boolean v2, p0, Lra6;->u:Z

    invoke-interface {v0, p1, p0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_ca

    move-object v3, v5

    goto :goto_cc

    :cond_ca
    :goto_ca
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_cc
    return-object v3

    :cond_cd
    throw v4

    :pswitch_ce
    iget-object v0, p0, Lra6;->v:Ll99;

    iget-object v4, p0, Lra6;->w:Ljava/lang/Throwable;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lra6;->u:Z

    if-eqz v6, :cond_e2

    if-ne v6, v2, :cond_de

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_109

    :cond_de
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_10b

    :cond_e2
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lla6;

    new-instance v1, Loa6;

    sget-object v6, Lt0i;->b:Lp0i;

    new-instance v6, Lq0i;

    invoke-direct {v6, v4}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v7, Lq0i;

    invoke-direct {v7, v4}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-direct {v1, v6, v7, v3}, Loa6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Long;)V

    invoke-direct {p1, v1}, Lla6;-><init>(Loa6;)V

    iput-object v3, p0, Lra6;->v:Ll99;

    iput-object v3, p0, Lra6;->w:Ljava/lang/Throwable;

    iput-boolean v2, p0, Lra6;->u:Z

    invoke-interface {v0, p1, p0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_109

    move-object v3, v5

    goto :goto_10b

    :cond_109
    :goto_109
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_10b
    return-object v3

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_ce
        :pswitch_9f
        :pswitch_6e
        :pswitch_3d
    .end packed-switch
.end method
