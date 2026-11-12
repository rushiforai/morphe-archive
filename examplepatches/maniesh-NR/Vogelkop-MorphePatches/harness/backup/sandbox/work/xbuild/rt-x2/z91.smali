.class public final synthetic Lz91;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILvd0;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lz91;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lz91;->b:B

    iput-object p2, p0, Lz91;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/Serializable;IB)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lz91;->a:B

    iput-object p1, p0, Lz91;->c:Ljava/lang/Object;

    iput-byte p2, p0, Lz91;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lz91;->a:B

    iget-object v1, p0, Lz91;->c:Ljava/lang/Object;

    iget-byte p0, p0, Lz91;->b:B

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_aa

    check-cast v1, Lvd0;

    check-cast p1, Lck0;

    iget-object p1, p1, Lck0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lun0;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lo5f;

    invoke-direct {v0, v1, v2}, Lo5f;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p1, Lun0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lqj0;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    invoke-direct {v1, v3, v4, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lun0;->b:Lsn0;

    const/16 v3, 0xc

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_44

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_44

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_51

    :cond_44
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_51
    invoke-virtual {v2, p0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lrj0;

    invoke-direct {p0, v1}, Lrj0;-><init>(Lqj0;)V

    invoke-virtual {v0, p0}, Lo5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_5f
    check-cast v1, Lpqh;

    check-cast p1, Lvg9;

    invoke-virtual {p1, p0}, Lvg9;->a1(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v1, Lpqh;->a:Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_72
    check-cast v1, Ljava/lang/Long;

    check-cast p1, Lrsk;

    add-int/2addr p0, v2

    if-nez v1, :cond_7d

    invoke-interface {p1, p0}, Lrsk;->j1(I)V

    goto :goto_84

    :cond_7d
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lrsk;->T0(IJ)V

    :goto_84
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_87
    check-cast v1, Ljava/lang/String;

    check-cast p1, Lrsk;

    add-int/2addr p0, v2

    if-nez v1, :cond_92

    invoke-interface {p1, p0}, Lrsk;->j1(I)V

    goto :goto_95

    :cond_92
    invoke-interface {p1, p0, v1}, Lrsk;->w(ILjava/lang/String;)V

    :goto_95
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_98
    check-cast v1, [B

    check-cast p1, Lrsk;

    add-int/2addr p0, v2

    if-nez v1, :cond_a3

    invoke-interface {p1, p0}, Lrsk;->j1(I)V

    goto :goto_a6

    :cond_a3
    invoke-interface {p1, p0, v1}, Lrsk;->Z0(I[B)V

    :goto_a6
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_98
        :pswitch_87
        :pswitch_72
        :pswitch_5f
    .end packed-switch
.end method
