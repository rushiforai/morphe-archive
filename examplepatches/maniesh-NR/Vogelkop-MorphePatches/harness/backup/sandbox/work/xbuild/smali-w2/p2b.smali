.class public final synthetic Lp2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lal7;


# direct methods
.method public synthetic constructor <init>(Lal7;B)V
    .registers 3

    iput-byte p2, p0, Lp2b;->a:B

    iput-object p1, p0, Lp2b;->b:Lal7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lp2b;->a:B

    iget-object p0, p0, Lp2b;->b:Lal7;

    packed-switch v0, :pswitch_data_1a

    invoke-virtual {p0}, Lal7;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d
    invoke-virtual {p0}, Lal7;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    invoke-virtual {p0}, Lal7;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
