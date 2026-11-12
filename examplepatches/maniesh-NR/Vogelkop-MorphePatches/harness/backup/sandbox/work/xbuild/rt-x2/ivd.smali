.class public final synthetic Livd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;JB)V
    .registers 5

    iput-byte p4, p0, Livd;->a:B

    iput-object p1, p0, Livd;->b:Ljava/lang/String;

    iput-wide p2, p0, Livd;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Livd;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x2

    iget-wide v3, p0, Livd;->c:J

    iget-object p0, p0, Livd;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_f2

    check-cast p1, Lzj0;

    iget-object v0, p1, Lzj0;->a:Ly55;

    new-instance v0, Lr56;

    const/16 v5, 0x88c

    const/4 v6, -0x1

    invoke-direct {v0, v5, v6, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lzj0;->b:Lu56;

    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_2f

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2f

    new-instance v6, Lif0;

    invoke-direct {v6, p1, v2, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_3c

    :cond_2f
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v2, v1, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, p1, v2, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_3c
    invoke-virtual {v6, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/16 p0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, p0, p1}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v1, v1, v3, v4}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4b
    check-cast p1, Lnd0;

    new-instance v0, Livd;

    invoke-direct {v0, p0, v3, v4, v2}, Livd;-><init>(Ljava/lang/String;JB)V

    iget-object p0, p1, Lnd0;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lld0;

    invoke-virtual {v0, p0}, Livd;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_60
    check-cast p1, Lx60;

    new-instance v0, Lx41;

    const/16 v1, 0xf

    invoke-direct {v0, v3, v4, v1}, Lx41;-><init>(JB)V

    invoke-virtual {p1, p0, v0}, Lx60;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6f
    check-cast p1, Lx60;

    new-instance v0, Lx41;

    const/16 v1, 0x10

    invoke-direct {v0, v3, v4, v1}, Lx41;-><init>(JB)V

    invoke-virtual {p1, p0, v0}, Lx60;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7e
    check-cast p1, Lld0;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v5, 0xbb62ffc

    if-eq v0, v5, :cond_b1

    const v2, 0xd3b656e

    if-eq v0, v2, :cond_a2

    const v2, 0x194d2893

    if-ne v0, v2, :cond_be

    const-string v0, "latest_purchase_time"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_be

    iget-object p0, p1, Lld0;->b:Lkd0;

    const/4 p1, 0x3

    invoke-virtual {p0, p1, v1, v3, v4}, Ljf0;->p(IIJ)V

    goto :goto_be

    :cond_a2
    const-string v0, "latest_free_offer_claim_time"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_be

    iget-object p0, p1, Lld0;->b:Lkd0;

    const/4 p1, 0x7

    invoke-virtual {p0, p1, v1, v3, v4}, Ljf0;->p(IIJ)V

    goto :goto_be

    :cond_b1
    const-string v0, "first_purchase_time"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_be

    iget-object p0, p1, Lld0;->b:Lkd0;

    invoke-virtual {p0, v2, v1, v3, v4}, Ljf0;->p(IIJ)V

    :cond_be
    :goto_be
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c1
    check-cast p1, Lx60;

    new-instance v0, Lx41;

    const/16 v1, 0xe

    invoke-direct {v0, v3, v4, v1}, Lx41;-><init>(JB)V

    invoke-virtual {p1, p0, v0}, Lx60;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d0
    check-cast p1, Losk;

    const-string v0, "UPDATE messages SET local_content = ? WHERE id = ?"

    invoke-virtual {p1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p1

    if-nez p0, :cond_de

    :try_start_da
    invoke-virtual {p1, v1}, Lwsk;->j1(I)V

    goto :goto_e1

    :cond_de
    invoke-virtual {p1, v1, p0}, Lwsk;->h(ILjava/lang/String;)V

    :goto_e1
    invoke-virtual {p1, v2, v3, v4}, Lwsk;->T0(IJ)V

    invoke-virtual {p1}, Lwsk;->n()Z
    :try_end_e7
    .catchall {:try_start_da .. :try_end_e7} :catchall_ec

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    const/4 p0, 0x0

    return-object p0

    :catchall_ec
    move-exception p0

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    throw p0

    nop

    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_d0
        :pswitch_c1
        :pswitch_7e
        :pswitch_6f
        :pswitch_60
        :pswitch_4b
    .end packed-switch
.end method
