.class public final synthetic Lby1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function2;B)V
    .registers 3

    iput-byte p2, p0, Lby1;->a:B

    iput-object p1, p0, Lby1;->b:Lkotlin/jvm/functions/Function2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lby1;->a:B

    iget-object p0, p0, Lby1;->b:Lkotlin/jvm/functions/Function2;

    packed-switch v0, :pswitch_data_26

    check-cast p0, Lnqi;

    invoke-virtual {p0, p1, p2}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_d
    check-cast p0, Lnqi;

    invoke-virtual {p0, p1, p2}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_13
    check-cast p0, Lwhf;

    invoke-virtual {p0, p1, p2}, Lwhf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_19
    check-cast p0, Lwhf;

    invoke-virtual {p0, p1, p2}, Lwhf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1f
    check-cast p0, Ls2;

    invoke-virtual {p0, p1, p2}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
