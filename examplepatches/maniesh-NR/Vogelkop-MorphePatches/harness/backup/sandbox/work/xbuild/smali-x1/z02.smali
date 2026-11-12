.class public final synthetic Lz02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvr9;


# direct methods
.method public synthetic constructor <init>(Lvr9;B)V
    .registers 3

    iput-byte p2, p0, Lz02;->a:B

    iput-object p1, p0, Lz02;->b:Lvr9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lz02;->a:B

    iget-object p0, p0, Lz02;->b:Lvr9;

    check-cast p1, Lkotlin/Unit;

    packed-switch v0, :pswitch_data_16

    invoke-virtual {p0}, Lvr9;->run()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    invoke-virtual {p0}, Lvr9;->run()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
