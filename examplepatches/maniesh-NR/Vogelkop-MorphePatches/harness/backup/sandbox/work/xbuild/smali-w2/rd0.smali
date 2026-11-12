.class public final synthetic Lrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltd0;


# direct methods
.method public synthetic constructor <init>(Ltd0;B)V
    .registers 3

    iput-byte p2, p0, Lrd0;->a:B

    iput-object p1, p0, Lrd0;->b:Ltd0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lrd0;->a:B

    const/16 v1, 0x13

    const/4 v2, 0x2

    const/16 v3, 0x98b

    const/4 v4, 0x1

    iget-object p0, p0, Lrd0;->b:Ltd0;

    packed-switch v0, :pswitch_data_c0

    new-instance v0, Ll80;

    iget-object v1, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v5, 0x44

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lk80;

    if-nez v6, :cond_2f

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lk80;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lk80;

    :cond_2f
    invoke-direct {v0, v6}, Ll80;-><init>(Lk80;)V

    return-object v0

    :pswitch_33
    new-instance v0, Laf0;

    iget-object v1, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v2, 0x3f

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lze0;

    if-nez v5, :cond_55

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lze0;

    invoke-direct {v5, v3, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lze0;

    :cond_55
    invoke-direct {v0, v1, v5}, Laf0;-><init>(Lzpa;Lze0;)V

    return-object v0

    :pswitch_59
    new-instance v0, Lydp;

    iget-object v2, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    invoke-virtual {p0, v2}, Lqd0;->y(Lzpa;)Liq0;

    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    return-object v0

    :pswitch_66
    new-instance v0, Lydp;

    iget-object v1, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v5, 0x1f

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbm0;

    if-nez v6, :cond_87

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lbm0;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbm0;

    :cond_87
    const/16 p0, 0x12

    invoke-direct {v0, p0}, Lydp;-><init>(B)V

    return-object v0

    :pswitch_8d
    new-instance v0, Lrbe;

    iget-object v2, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v5, 0x19

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkp0;

    if-nez v6, :cond_ae

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lkp0;

    invoke-direct {v2, v3, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkp0;

    :cond_ae
    invoke-direct {v0, v1}, Lrbe;-><init>(B)V

    return-object v0

    :pswitch_b2
    new-instance v0, Lyb0;

    iget-object v1, p0, Ltd0;->a:Lzpa;

    iget-object p0, p0, Ltd0;->b:Lqd0;

    invoke-virtual {p0, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lyb0;-><init>(Lzpa;Lxb0;)V

    return-object v0

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_b2
        :pswitch_8d
        :pswitch_66
        :pswitch_59
        :pswitch_33
    .end packed-switch
.end method
