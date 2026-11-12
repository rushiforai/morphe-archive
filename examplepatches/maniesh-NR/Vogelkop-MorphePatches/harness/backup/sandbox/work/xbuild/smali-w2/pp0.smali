.class public final synthetic Lpp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqp0;


# direct methods
.method public synthetic constructor <init>(Lqp0;B)V
    .registers 3

    iput-byte p2, p0, Lpp0;->a:B

    iput-object p1, p0, Lpp0;->b:Lqp0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lpp0;->a:B

    const/16 v1, 0x14

    const/4 v2, 0x2

    const/16 v3, 0x98b

    const/4 v4, 0x1

    iget-object p0, p0, Lpp0;->b:Lqp0;

    packed-switch v0, :pswitch_data_13e

    new-instance v0, Lb90;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v5, 0x58

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, La90;

    if-nez v6, :cond_2f

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, La90;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, La90;

    :cond_2f
    invoke-direct {v0, v6}, Lb90;-><init>(La90;)V

    return-object v0

    :pswitch_33
    new-instance v0, Lg70;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v5, 0x55

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf70;

    if-nez v6, :cond_55

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lf70;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lf70;

    :cond_55
    invoke-direct {v0, v6}, Lg70;-><init>(Lf70;)V

    return-object v0

    :pswitch_59
    new-instance v0, Lt90;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v5, 0x52

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ls90;

    if-nez v6, :cond_7b

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ls90;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Ls90;

    :cond_7b
    invoke-direct {v0, v6}, Lt90;-><init>(Ls90;)V

    return-object v0

    :pswitch_7f
    new-instance v0, Lqii;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v5, 0x50

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lis0;

    if-nez v6, :cond_a0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lis0;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lis0;

    :cond_a0
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_a4
    new-instance v0, Lujp;

    iget-object v2, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v5, 0x46

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnu0;

    if-nez v6, :cond_c6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lnu0;

    const/4 v6, 0x3

    invoke-direct {v2, v3, v4, v6}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnu0;

    :cond_c6
    invoke-direct {v0, v1}, Lujp;-><init>(B)V

    return-object v0

    :pswitch_ca
    new-instance v0, Lulp;

    iget-object v2, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v3, 0x40

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqu0;

    if-nez v5, :cond_ea

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->N()Lqu0;

    move-result-object v2

    invoke-virtual {p0, v3, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqu0;

    :cond_ea
    invoke-direct {v0, v1}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_ee
    new-instance v0, Lydp;

    iget-object v2, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    invoke-virtual {p0, v2}, Lb66;->C(Lzpa;)Ld66;

    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    return-object v0

    :pswitch_fb
    new-instance v0, Lulp;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    const/16 v2, 0x3e

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lm90;

    if-nez v5, :cond_11e

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lm90;

    const/16 v5, 0xa

    invoke-direct {v1, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm90;

    :cond_11e
    const/16 p0, 0x10

    invoke-direct {v0, p0}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_124
    new-instance v0, Ly55;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    invoke-virtual {p0, v1}, Lb66;->y(Lzpa;)Ldb0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_131
    new-instance v0, Lqii;

    iget-object v1, p0, Lqp0;->a:Lzpa;

    iget-object p0, p0, Lqp0;->b:Lb66;

    invoke-virtual {p0, v1}, Lb66;->B(Lzpa;)Leq0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_131
        :pswitch_124
        :pswitch_fb
        :pswitch_ee
        :pswitch_ca
        :pswitch_a4
        :pswitch_7f
        :pswitch_59
        :pswitch_33
    .end packed-switch
.end method
