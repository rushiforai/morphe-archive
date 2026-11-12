.class public final synthetic Lsf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltf5;


# direct methods
.method public synthetic constructor <init>(Ltf5;B)V
    .registers 3

    iput-byte p2, p0, Lsf5;->a:B

    iput-object p1, p0, Lsf5;->b:Ltf5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lsf5;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object p0, p0, Lsf5;->b:Ltf5;

    const/4 v3, 0x1

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    packed-switch v0, :pswitch_data_58

    and-int/lit8 v0, p2, 0x3

    if-eq v0, v1, :cond_18

    move v0, v3

    goto :goto_19

    :cond_18
    move v0, v2

    :goto_19
    and-int/2addr p2, v3

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v0}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_2c

    iget-object p0, p0, Ltf5;->c:Lue5;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    :cond_2c
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_2f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32
    and-int/lit8 v0, p2, 0x3

    if-eq v0, v1, :cond_37

    move v2, v3

    :cond_37
    and-int/2addr p2, v3

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v2}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_51

    new-instance p2, Lsf5;

    invoke-direct {p2, p0, v3}, Lsf5;-><init>(Ltf5;B)V

    const p0, -0x770d3d33

    invoke-static {p0, p2, p1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object p0

    const/4 p2, 0x6

    invoke-static {p0, p1, p2}, Lrof;->a(Lue5;Lih5;I)V

    goto :goto_54

    :cond_51
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_54
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
