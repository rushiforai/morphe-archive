.class public final Lba8;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lba8;->t:B

    iput-object p1, p0, Lba8;->v:Lx5f;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lba8;->t:B

    iget-object p0, p0, Lba8;->v:Lx5f;

    packed-switch v0, :pswitch_data_22

    new-instance v0, Lba8;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lba8;-><init>(Lx5f;Lmt5;B)V

    iput-object p1, v0, Lba8;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lba8;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lba8;-><init>(Lx5f;Lmt5;B)V

    iput-object p1, v0, Lba8;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_19
    new-instance v0, Lba8;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lba8;-><init>(Lx5f;Lmt5;B)V

    iput-object p1, v0, Lba8;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lba8;->t:B

    packed-switch v0, :pswitch_data_38

    check-cast p1, Ldpn;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lba8;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lba8;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lba8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lq3h;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lba8;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lba8;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lba8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lqe0;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lba8;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lba8;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lba8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lba8;->t:B

    const/4 v1, 0x0

    iget-object v2, p0, Lba8;->v:Lx5f;

    iget-object p0, p0, Lba8;->u:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_92

    check-cast p0, Ldpn;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, p0, Lbpn;

    const/16 v0, 0x17

    if-eqz p1, :cond_21

    check-cast p0, Lbpn;

    iget-object p1, p0, Lbpn;->b:Lop0;

    iget-boolean p0, p0, Lbpn;->a:Z

    invoke-virtual {v2, v0, p1, p0}, Lx5f;->M0(ILop0;Z)V

    goto :goto_2c

    :cond_21
    sget-object p1, Lcpn;->a:Lcpn;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2f

    invoke-virtual {v2, v0}, Lx5f;->N0(I)V

    :goto_2c
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_32

    :cond_2f
    invoke-static {}, Lh9o;->p()V

    :goto_32
    return-object v1

    :pswitch_33
    check-cast p0, Lq3h;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p1, p0, Lo3h;

    const/16 v0, 0x18

    if-eqz p1, :cond_4a

    check-cast p0, Lo3h;

    iget-object p1, p0, Lo3h;->b:Lop0;

    iget-boolean p0, p0, Lo3h;->a:Z

    invoke-virtual {v2, v0, p1, p0}, Lx5f;->M0(ILop0;Z)V

    goto :goto_55

    :cond_4a
    sget-object p1, Lp3h;->a:Lp3h;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_58

    invoke-virtual {v2, v0}, Lx5f;->N0(I)V

    :goto_55
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_5b

    :cond_58
    invoke-static {}, Lh9o;->p()V

    :goto_5b
    return-object v1

    :pswitch_5c
    check-cast p0, Lqe0;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, p1, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p1, v1, Lck0;->v:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnd0;

    iget-object p1, p1, Lnd0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lld0;

    iget-object p1, p1, Lld0;->b:Lkd0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p0, :cond_87

    const/4 v1, 0x0

    goto :goto_88

    :cond_87
    const/4 v1, 0x1

    :goto_88
    const/4 v3, 0x5

    invoke-virtual {p1, v3, v1, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v0}, Lx5f;->U0(Lx56;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_33
    .end packed-switch
.end method
