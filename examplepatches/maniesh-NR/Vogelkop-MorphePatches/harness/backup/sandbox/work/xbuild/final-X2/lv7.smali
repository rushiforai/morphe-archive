.class public final synthetic Llv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrv7;


# direct methods
.method public synthetic constructor <init>(Lrv7;B)V
    .registers 3

    iput-byte p2, p0, Llv7;->a:B

    iput-object p1, p0, Llv7;->b:Lrv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Llv7;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Llv7;->b:Lrv7;

    packed-switch v0, :pswitch_data_4e

    invoke-virtual {p0, v1}, Lrv7;->c(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e
    invoke-virtual {p0}, Lrv7;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14
    invoke-virtual {p0, v1}, Lrv7;->c(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    invoke-virtual {p0}, Lrv7;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_20
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrv7;->c(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    iget-object v0, p0, Lrv7;->l:Lj1k;

    invoke-virtual {v0}, Lj1k;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Lrv7;->k:Ligi;

    invoke-virtual {p0}, Ligi;->v0()V

    :cond_3a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3d
    iget-object p0, p0, Lrv7;->m:Lhd;

    invoke-virtual {p0}, Lhd;->k()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_48
    invoke-virtual {p0, v1}, Lrv7;->c(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_48
        :pswitch_3d
        :pswitch_27
        :pswitch_20
        :pswitch_1a
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method
