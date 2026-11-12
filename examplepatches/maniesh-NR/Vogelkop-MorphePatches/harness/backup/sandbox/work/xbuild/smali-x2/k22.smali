.class public final synthetic Lk22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;B)V
    .registers 3

    iput-byte p2, p0, Lk22;->a:B

    iput-object p1, p0, Lk22;->b:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lk22;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    iget-object p0, p0, Lk22;->b:Lkotlin/jvm/functions/Function1;

    packed-switch v0, :pswitch_data_be

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 v0, p2, 0x3

    if-eq v0, v3, :cond_17

    move v1, v2

    :cond_17
    and-int/2addr p2, v2

    move-object v8, p1

    check-cast v8, Lvt9;

    invoke-virtual {v8, p2, v1}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_4a

    invoke-virtual {v8, p0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object p2

    if-nez p1, :cond_2f

    sget-object p1, Lhh5;->a:Lzpa;

    if-ne p2, p1, :cond_39

    :cond_2f
    new-instance p2, Ly47;

    const/16 p1, 0xf

    invoke-direct {p2, p0, p1}, Ly47;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v8, p2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_39
    move-object v2, p2

    check-cast v2, Lkotlin/jvm/functions/Function0;

    sget-object v7, Lyi4;->b:Lue5;

    const/high16 v9, 0x180000

    const/16 v10, 0x3e

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v10}, Lf03;->a(Lkotlin/jvm/functions/Function0;Lc8e;ZLpta;Lpaj;Lkotlin/jvm/functions/Function2;Lih5;II)V

    goto :goto_4d

    :cond_4a
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_4d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_50
    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 v0, p2, 0x3

    if-eq v0, v3, :cond_5d

    move v1, v2

    :cond_5d
    and-int/2addr p2, v2

    move-object v8, p1

    check-cast v8, Lvt9;

    invoke-virtual {v8, p2, v1}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_7f

    sget-object v4, Lyi4;->a:Lue5;

    new-instance p1, Lk22;

    invoke-direct {p1, p0, v3}, Lk22;-><init>(Lkotlin/jvm/functions/Function1;B)V

    const p0, 0x6b41ed6c

    invoke-static {p0, p1, v8}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v5

    const/16 v9, 0x36

    const/16 v10, 0xc

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v10}, Lna2;->c(Lue5;Lue5;Lc8e;Lue5;Lih5;II)V

    goto :goto_82

    :cond_7f
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_82
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_85
    check-cast p1, Latn;

    check-cast p2, Lesk;

    if-eqz p1, :cond_a5

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Ll22;

    iget-object v1, p1, Latn;->b:Ljava/util/ArrayList;

    invoke-interface {p2}, Lesk;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lo52;

    iget-object p1, p1, Latn;->a:Ljava/lang/String;

    invoke-direct {v0, v1, p2, p1}, Ll22;-><init>(Ljava/util/ArrayList;Lo52;Ljava/lang/String;)V

    new-instance p1, Lt0i;

    invoke-direct {p1, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_bb

    :cond_a5
    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, ""

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    new-instance p2, Lq0i;

    invoke-direct {p2, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance p1, Lt0i;

    invoke-direct {p1, p2}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_bb
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_85
        :pswitch_50
    .end packed-switch
.end method
