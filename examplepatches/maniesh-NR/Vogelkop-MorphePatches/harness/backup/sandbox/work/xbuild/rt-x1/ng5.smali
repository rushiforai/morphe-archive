.class public final synthetic Lng5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpg5;


# direct methods
.method public synthetic constructor <init>(Lpg5;B)V
    .registers 3

    iput-byte p2, p0, Lng5;->a:B

    iput-object p1, p0, Lng5;->b:Lpg5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lng5;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    iget-object p0, p0, Lng5;->b:Lpg5;

    const/4 v3, 0x1

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    packed-switch v0, :pswitch_data_5a

    and-int/lit8 v0, p2, 0x3

    if-eq v0, v2, :cond_17

    move v1, v3

    :cond_17
    and-int/2addr p2, v3

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v1}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_2e

    iget-object p2, p0, Lpg5;->d:Ljava/lang/Object;

    check-cast p2, Lrg5;

    iget-object p0, p0, Lpg5;->e:Ljava/lang/Object;

    check-cast p0, Lue5;

    const/16 v0, 0x8

    invoke-static {p2, p0, p1, v0}, Lwyh;->a(Lrg5;Lue5;Lih5;I)V

    goto :goto_31

    :cond_2e
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_31
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_34
    and-int/lit8 v0, p2, 0x3

    if-eq v0, v2, :cond_39

    move v1, v3

    :cond_39
    and-int/2addr p2, v3

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v1}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_53

    new-instance p2, Lng5;

    invoke-direct {p2, p0, v3}, Lng5;-><init>(Lpg5;B)V

    const p0, 0x4648574b

    invoke-static {p0, p2, p1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object p0

    const/4 p2, 0x6

    invoke-static {p0, p1, p2}, Lrof;->a(Lue5;Lih5;I)V

    goto :goto_56

    :cond_53
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_56
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method
