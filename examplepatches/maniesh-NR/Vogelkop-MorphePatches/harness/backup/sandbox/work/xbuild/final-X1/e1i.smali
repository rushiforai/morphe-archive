.class public final synthetic Le1i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld1i;


# direct methods
.method public synthetic constructor <init>(Ld1i;B)V
    .registers 3

    iput-byte p2, p0, Le1i;->a:B

    iput-object p1, p0, Le1i;->b:Ld1i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Le1i;->a:B

    iget-object p0, p0, Le1i;->b:Ld1i;

    packed-switch v0, :pswitch_data_26

    iget-object p0, p0, Ld1i;->b:Lkw6;

    invoke-virtual {p0}, Lkw6;->c()Lk2j;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Ld1i;->a:Lrdc;

    invoke-static {p0}, Lvtp;->T(Lrdc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16
    iget-object p0, p0, Ld1i;->a:Lrdc;

    invoke-static {p0}, Lvtp;->X(Lrdc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e
    iget-object p0, p0, Ld1i;->a:Lrdc;

    invoke-static {p0}, Lvtp;->A(Lrdc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_16
        :pswitch_e
    .end packed-switch
.end method
