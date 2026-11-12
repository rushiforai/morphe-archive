.class public final synthetic Lag5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrn9;

.field public final synthetic c:Lue5;


# direct methods
.method public synthetic constructor <init>(Lrn9;Lue5;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lag5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lag5;->b:Lrn9;

    iput-object p2, p0, Lag5;->c:Lue5;

    return-void
.end method

.method public synthetic constructor <init>(Lrn9;Lue5;I)V
    .registers 4

    .line 11
    const/4 p3, 0x1

    iput-byte p3, p0, Lag5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lag5;->b:Lrn9;

    iput-object p2, p0, Lag5;->c:Lue5;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lag5;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lag5;->c:Lue5;

    iget-object p0, p0, Lag5;->b:Lrn9;

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    packed-switch v0, :pswitch_data_3c

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Laoh;->m(I)I

    move-result p2

    invoke-virtual {p0, v2, p1, p2}, Lrn9;->b(Lue5;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 v0, p2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v0, v3, :cond_27

    move v0, v1

    goto :goto_28

    :cond_27
    move v0, v4

    :goto_28
    and-int/2addr p2, v1

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v0}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_35

    invoke-virtual {p0, v2, p1, v4}, Lrn9;->b(Lue5;Lih5;I)V

    goto :goto_38

    :cond_35
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_38
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
