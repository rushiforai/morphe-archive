.class public final Lpz1;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Ltz1;


# direct methods
.method public synthetic constructor <init>(Ltz1;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lpz1;->t:B

    iput-object p1, p0, Lpz1;->v:Ltz1;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lpz1;->t:B

    iget-object p0, p0, Lpz1;->v:Ltz1;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lpz1;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lpz1;-><init>(Ltz1;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lpz1;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lpz1;-><init>(Ltz1;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lpz1;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lpz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lpz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lpz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lpz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lpz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lpz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lpz1;->t:B

    const/4 v1, 0x0

    iget-object v2, p0, Lpz1;->v:Ltz1;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_b0

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lpz1;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v5, :cond_18

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59

    :cond_18
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    move-object p1, v3

    goto :goto_59

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v5, p0, Lpz1;->u:Z

    new-instance p1, Lbhi;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p0

    invoke-direct {p1, p0}, Lbhi;-><init>(Lmt5;)V

    iget-object p0, v2, Ltz1;->a:Ll32;

    new-instance v2, Llx1;

    const/4 v3, 0x3

    invoke-direct {v2, p1, v3}, Llx1;-><init>(Lbhi;B)V

    iget-object v3, p0, Ll32;->a:Lumi;

    new-instance v4, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v4, v5, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Lb32;

    invoke-direct {v3, p0, v1}, Lb32;-><init>(Ll32;B)V

    invoke-virtual {v4, v3}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v1, Lt02;

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    invoke-virtual {p1}, Lbhi;->a()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_59

    move-object p1, v0

    :cond_59
    :goto_59
    return-object p1

    :pswitch_5a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lpz1;->u:Z

    if-eqz v6, :cond_6a

    if-ne v6, v5, :cond_66

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_81

    :cond_66
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_af

    :cond_6a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Ltz1;->g:Lqca;

    iput-boolean v5, p0, Lpz1;->u:Z

    iget-object p1, p1, Lqca;->a:Ly5i;

    new-instance v2, Lq9a;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lq9a;-><init>(B)V

    invoke-static {p0, p1, v5, v1, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_81

    move-object v3, v0

    goto :goto_af

    :cond_81
    :goto_81
    check-cast p1, Ljava/lang/Iterable;

    const/16 p0, 0xa

    invoke-static {p1, p0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p0

    invoke-static {p0}, Lqbd;->a(I)I

    move-result p0

    const/16 v0, 0x10

    if-ge p0, v0, :cond_92

    move p0, v0

    :cond_92
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, p0}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_af

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyca;

    iget-object v0, p1, Lyca;->a:Ljava/lang/String;

    iget-object p1, p1, Lyca;->b:Ljava/lang/String;

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9b

    :cond_af
    :goto_af
    return-object v3

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_5a
    .end packed-switch
.end method
