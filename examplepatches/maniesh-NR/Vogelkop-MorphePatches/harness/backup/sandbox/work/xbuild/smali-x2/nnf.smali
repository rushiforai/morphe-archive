.class public final synthetic Lnnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls14;


# direct methods
.method public synthetic constructor <init>(Ls14;B)V
    .registers 3

    iput-byte p2, p0, Lnnf;->a:B

    iput-object p1, p0, Lnnf;->b:Ls14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lnnf;->a:B

    iget-object p0, p0, Lnnf;->b:Ls14;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Lnp3;

    invoke-virtual {p0}, Ls14;->M()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Lavl;

    invoke-virtual {p0}, Ls14;->M()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Ljzk;

    invoke-virtual {p0}, Ls14;->M()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
