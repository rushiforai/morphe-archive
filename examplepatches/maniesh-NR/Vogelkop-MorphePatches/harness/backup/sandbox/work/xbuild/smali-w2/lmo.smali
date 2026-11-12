.class public final Llmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxoo;


# instance fields
.field public final synthetic a:B

.field public final b:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;B)V
    .registers 3

    iput-byte p2, p0, Llmo;->a:B

    iput-object p1, p0, Llmo;->b:Lkotlin/jvm/functions/Function0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Llmo;->a:B

    iget-object p0, p0, Llmo;->b:Lkotlin/jvm/functions/Function0;

    packed-switch v0, :pswitch_data_12

    check-cast p0, Lqqo;

    invoke-virtual {p0}, Lqqo;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_d
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Llmo;->a:B

    packed-switch v0, :pswitch_data_c

    return-void

    :pswitch_6
    iget-object p0, p0, Llmo;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
