.class public final Luk3;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    iput-byte p1, p0, Luk3;->t:B

    iput-object p3, p0, Luk3;->u:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    .line 9
    iput-byte p3, p0, Luk3;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Luk3;->t:B

    const/4 v1, 0x3

    packed-switch v0, :pswitch_data_5e

    check-cast p1, Ljava/util/List;

    check-cast p3, Lmt5;

    new-instance p0, Luk3;

    invoke-direct {p0, v1, p3, v1}, Luk3;-><init>(ILmt5;B)V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Luk3;->u:Ljava/lang/Object;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Luk3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1a
    check-cast p1, Ll99;

    check-cast p2, Ljava/lang/Throwable;

    check-cast p3, Lmt5;

    new-instance p1, Luk3;

    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Lpjb;

    const/4 p2, 0x2

    invoke-direct {p1, p2, p3, p0}, Luk3;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Luk3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_31
    check-cast p1, Ll99;

    check-cast p2, Ljava/lang/Throwable;

    check-cast p3, Lmt5;

    new-instance p1, Luk3;

    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Lcq6;

    const/4 p2, 0x1

    invoke-direct {p1, p2, p3, p0}, Luk3;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Luk3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_48
    check-cast p1, Lspa;

    check-cast p2, Ljtf;

    check-cast p3, Lmt5;

    new-instance p0, Luk3;

    const/4 p2, 0x0

    invoke-direct {p0, v1, p3, p2}, Luk3;-><init>(ILmt5;B)V

    iput-object p1, p0, Luk3;->u:Ljava/lang/Object;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Luk3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_48
        :pswitch_31
        :pswitch_1a
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Luk3;->t:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_68

    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/util/List;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :pswitch_12
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Lpjb;

    iget-object p0, p0, Lpjb;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Lcq6;

    iget-object p0, p0, Lcq6;->d:Lti9;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lti9;->n:Z

    iget-object v0, p0, Lti9;->k:Lxh7;

    iget-object v0, v0, Lxh7;->d:Ljava/lang/Object;

    check-cast v0, Lnak;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v0, p0, Lti9;->m:Lnak;

    iget-boolean p0, p0, Lti9;->n:Z

    xor-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, p0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_51
    iget-object p0, p0, Luk3;->u:Ljava/lang/Object;

    check-cast p0, Lspa;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lspa;->f:Lpj5;

    sget-object p1, Lvk3;->a:Ljf2;

    invoke-virtual {p0, p1}, Lpj5;->e(Ljf2;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_67

    invoke-static {}, Lh9o;->t()V

    :cond_67
    return-object v1

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_51
        :pswitch_23
        :pswitch_12
    .end packed-switch
.end method
