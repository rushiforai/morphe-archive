.class public final synthetic Lu5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    iput-byte p2, p0, Lu5f;->a:B

    iput-object p1, p0, Lu5f;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lu5f;->a:B

    const/16 v1, 0x11

    const/16 v2, 0x97f

    const/4 v3, -0x1

    const-wide/16 v4, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    iget-object p0, p0, Lu5f;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_1d4

    check-cast p1, Lldo;

    iget-object p1, p1, Lldo;->a:Ljava/lang/String;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1d
    check-cast p1, Lldo;

    iget-object p1, p1, Lldo;->a:Ljava/lang/String;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2a
    const-string v0, "DELETE FROM activity WHERE url = ?"

    check-cast p1, Losk;

    invoke-virtual {p1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p1

    :try_start_32
    invoke-virtual {p1, v7, p0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-virtual {p1}, Lwsk;->n()Z
    :try_end_38
    .catchall {:try_start_32 .. :try_end_38} :catchall_3e

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_3e
    move-exception p0

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    throw p0

    :pswitch_43
    check-cast p1, Lq0j;

    sget-object v0, Lo0j;->a:[Lxtb;

    sget-object v0, Ln0j;->O:Lp0j;

    invoke-interface {p1, v0, p0}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4f
    check-cast p1, Lkotlin/ranges/IntRange;

    invoke-static {p0, p1}, Lkotlin/text/StringsKt;->d0(Ljava/lang/CharSequence;Lkotlin/ranges/IntRange;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_56
    check-cast p1, Landroid/content/Intent;

    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "text/plain"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_65
    check-cast p1, Lq0j;

    invoke-static {p1, p0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6d
    check-cast p1, Lwa1;

    invoke-interface {p1, v6, p0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_75
    check-cast p1, Lwa1;

    invoke-interface {p1, v6, p0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7d
    check-cast p1, Lwa1;

    invoke-interface {p1, v6, p0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_85
    check-cast p1, Lbk0;

    iget-object v0, p1, Lbk0;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lse0;

    invoke-direct {v0, v2, v3, v7}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lbk0;->b:Lw56;

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_a7

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a7

    new-instance v3, Lif0;

    invoke-direct {v3, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_b4

    :cond_a7
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v1, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_b4
    invoke-virtual {v3, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v6, v7, v4, v5}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_bd
    check-cast p1, Lbk0;

    iget-object v0, p1, Lbk0;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lk70;

    invoke-direct {v0, v2, v3, v7}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lbk0;->b:Lw56;

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_e1

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_e1

    new-instance v3, Lif0;

    invoke-direct {v3, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_ee

    :cond_e1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v1, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_ee
    invoke-virtual {v3, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v6, v7, v4, v5}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f7
    check-cast p1, Lak0;

    iget-object p1, p1, Lak0;->d:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwf0;

    iget-object p1, p1, Lwf0;->a:Lrf0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v6, v7, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10c
    check-cast p1, Lzj0;

    iget-object p1, p1, Lzj0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lvf0;

    iget-object p1, p1, Lvf0;->a:Lqf0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p0, :cond_11e

    move v7, v6

    :cond_11e
    invoke-virtual {p1, v6, v7, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_124
    check-cast p1, Lyj0;

    iget-object p1, p1, Lyj0;->b:Lt56;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_13e

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_13e

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_14b

    :cond_13e
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v0, v7, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_14b
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v2, p0, p1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_155
    check-cast p1, Lyj0;

    iget-object p1, p1, Lyj0;->b:Lt56;

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_16d

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16d

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v1, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_17a

    :cond_16d
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v1, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v1, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_17a
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v2, p0, p1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_184
    check-cast p1, Lhi0;

    iget-object p1, p1, Lhi0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwu0;

    new-instance v0, Lzbe;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lzbe;-><init>(B)V

    iget-object v1, p1, Lwu0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lbv0;

    const/16 v2, 0x98b

    invoke-direct {v1, v2, v3, v7}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lwu0;->b:Lvu0;

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_1b8

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1b8

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_1c5

    :cond_1b8
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v2, v7, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_1c5
    invoke-virtual {v4, p0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lcv0;

    invoke-direct {p0, v1}, Lcv0;-><init>(Lbv0;)V

    invoke-virtual {v0, p0}, Lzbe;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1d4
    .packed-switch 0x0
        :pswitch_184
        :pswitch_155
        :pswitch_124
        :pswitch_10c
        :pswitch_f7
        :pswitch_bd
        :pswitch_85
        :pswitch_7d
        :pswitch_75
        :pswitch_6d
        :pswitch_65
        :pswitch_56
        :pswitch_4f
        :pswitch_43
        :pswitch_2a
        :pswitch_1d
    .end packed-switch
.end method
