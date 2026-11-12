.class public final synthetic Lgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhi0;


# direct methods
.method public synthetic constructor <init>(Lhi0;B)V
    .registers 3

    iput-byte p2, p0, Lgi0;->a:B

    iput-object p1, p0, Lgi0;->b:Lhi0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lgi0;->a:B

    const/4 v1, 0x6

    const/4 v2, 0x3

    const/16 v3, 0x98b

    const/4 v4, 0x1

    iget-object p0, p0, Lgi0;->b:Lhi0;

    packed-switch v0, :pswitch_data_f8

    new-instance v0, Lwu0;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v5, 0x2b

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvu0;

    if-nez v6, :cond_2e

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lvu0;

    invoke-direct {v6, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lvu0;

    :cond_2e
    invoke-direct {v0, v1, v6}, Lwu0;-><init>(Lzpa;Lvu0;)V

    return-object v0

    :pswitch_32
    new-instance v0, Lujp;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v5, 0x29

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Loq0;

    if-nez v6, :cond_53

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Loq0;

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loq0;

    :cond_53
    const/16 p0, 0x13

    invoke-direct {v0, p0}, Lujp;-><init>(B)V

    return-object v0

    :pswitch_59
    new-instance v0, Lvg0;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    invoke-virtual {p0, v1}, Lfi0;->y(Lzpa;)Lug0;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lvg0;-><init>(Lzpa;Lug0;)V

    return-object v0

    :pswitch_67
    new-instance v0, Lpad;

    iget-object v2, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v5, 0x23

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lva0;

    if-nez v6, :cond_89

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lva0;

    invoke-direct {v6, v3, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lva0;

    :cond_89
    invoke-direct {v0, v2, v6}, Lpad;-><init>(Lzpa;Lva0;)V

    return-object v0

    :pswitch_8d
    new-instance v0, Lpsp;

    iget-object v2, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v5, 0x16

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lua0;

    if-nez v6, :cond_ae

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lua0;

    invoke-direct {v2, v3, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lua0;

    :cond_ae
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_b2
    new-instance v0, Lrbe;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v2, 0x14

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnf0;

    if-nez v5, :cond_d4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lnf0;

    const/4 v5, 0x5

    invoke-direct {v1, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnf0;

    :cond_d4
    const/16 p0, 0x11

    invoke-direct {v0, p0}, Lrbe;-><init>(B)V

    return-object v0

    :pswitch_da
    new-instance v0, Lrbe;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    invoke-virtual {p0, v1}, Lfi0;->x(Lzpa;)Lm80;

    const/16 p0, 0x10

    invoke-direct {v0, p0}, Lrbe;-><init>(B)V

    return-object v0

    :pswitch_e9
    new-instance v0, Lmj0;

    iget-object v1, p0, Lhi0;->a:Lzpa;

    iget-object p0, p0, Lhi0;->b:Lfi0;

    invoke-virtual {p0, v1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lmj0;-><init>(Lzpa;Llj0;)V

    return-object v0

    nop

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_e9
        :pswitch_da
        :pswitch_b2
        :pswitch_8d
        :pswitch_67
        :pswitch_59
        :pswitch_32
    .end packed-switch
.end method
