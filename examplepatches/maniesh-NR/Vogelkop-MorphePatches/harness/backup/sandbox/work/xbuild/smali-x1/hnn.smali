.class public final synthetic Lhnn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Linn;


# direct methods
.method public synthetic constructor <init>(Linn;B)V
    .registers 3

    iput-byte p2, p0, Lhnn;->a:B

    iput-object p1, p0, Lhnn;->b:Linn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lhnn;->a:B

    iget-object p0, p0, Lhnn;->b:Linn;

    packed-switch v0, :pswitch_data_24

    check-cast p1, Ljzk;

    iget-object p1, p0, Linn;->e:Lpde;

    invoke-virtual {p0}, Linn;->a()Landroid/util/Size;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    check-cast p1, Landroid/util/Size;

    iget-object p1, p0, Linn;->e:Lpde;

    invoke-virtual {p0}, Linn;->a()Landroid/util/Size;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
