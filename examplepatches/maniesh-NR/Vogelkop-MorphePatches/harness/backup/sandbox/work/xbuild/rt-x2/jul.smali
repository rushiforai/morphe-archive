.class public final Ljul;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Ljava/util/Iterator;

.field public v:Z

.field public final synthetic w:Lkul;


# direct methods
.method public synthetic constructor <init>(Lkul;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Ljul;->t:B

    iput-object p1, p0, Ljul;->w:Lkul;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Ljul;->t:B

    iget-object p0, p0, Ljul;->w:Lkul;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Ljul;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Ljul;-><init>(Lkul;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Ljul;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Ljul;-><init>(Lkul;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ljul;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Ljul;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ljul;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ljul;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Ljul;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ljul;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ljul;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ljul;->t:B

    iget-object v1, p0, Ljul;->w:Lkul;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_7a

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Ljul;->v:Z

    if-eqz v5, :cond_1d

    if-ne v5, v4, :cond_19

    iget-object v1, p0, Ljul;->u:Ljava/util/Iterator;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_27

    :cond_19
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_41

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lkul;->e:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, p1}, Lg7f;-><init>(Li7f;)V

    :cond_27
    :goto_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldul;

    iput-object v1, p0, Ljul;->u:Ljava/util/Iterator;

    iput-boolean v4, p0, Ljul;->v:Z

    invoke-interface {p1}, Ldul;->b()Lkotlin/Unit;

    move-result-object p1

    if-ne p1, v0, :cond_27

    move-object v2, v0

    goto :goto_41

    :cond_3f
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_41
    return-object v2

    :pswitch_42
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Ljul;->v:Z

    if-eqz v5, :cond_54

    if-ne v5, v4, :cond_50

    iget-object v1, p0, Ljul;->u:Ljava/util/Iterator;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_50
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_78

    :cond_54
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lkul;->e:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, p1}, Lg7f;-><init>(Li7f;)V

    :cond_5e
    :goto_5e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_76

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldul;

    iput-object v1, p0, Ljul;->u:Ljava/util/Iterator;

    iput-boolean v4, p0, Ljul;->v:Z

    invoke-interface {p1, p0}, Ldul;->a(Ljul;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5e

    move-object v2, v0

    goto :goto_78

    :cond_76
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_78
    return-object v2

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method
