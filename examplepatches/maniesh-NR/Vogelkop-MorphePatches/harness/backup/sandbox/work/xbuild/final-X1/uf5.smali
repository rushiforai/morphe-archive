.class public final synthetic Luf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvf5;


# direct methods
.method public synthetic constructor <init>(Lvf5;B)V
    .registers 3

    iput-byte p2, p0, Luf5;->a:B

    iput-object p1, p0, Luf5;->b:Lvf5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Luf5;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object p0, p0, Luf5;->b:Lvf5;

    const/4 v3, 0x1

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    packed-switch v0, :pswitch_data_6c

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

    if-eqz p2, :cond_40

    invoke-virtual {p1, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p2

    invoke-virtual {p1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v0

    if-nez p2, :cond_30

    sget-object p2, Lhh5;->a:Lzpa;

    if-ne v0, p2, :cond_3a

    :cond_30
    new-instance v0, Lr94;

    const/16 p2, 0xb

    invoke-direct {v0, p0, p2}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_3a
    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-virtual {p0, v0, p1, v2}, Lvf5;->g0(Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_43

    :cond_40
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_46
    and-int/lit8 v0, p2, 0x3

    if-eq v0, v1, :cond_4b

    move v2, v3

    :cond_4b
    and-int/2addr p2, v3

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v2}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_65

    new-instance p2, Luf5;

    invoke-direct {p2, p0, v3}, Luf5;-><init>(Lvf5;B)V

    const p0, 0x6d4e02af

    invoke-static {p0, p2, p1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object p0

    const/4 p2, 0x6

    invoke-static {p0, p1, p2}, Lrof;->a(Lue5;Lih5;I)V

    goto :goto_68

    :cond_65
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_68
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method
