.class public final synthetic Lfv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liv7;


# direct methods
.method public synthetic constructor <init>(Liv7;B)V
    .registers 3

    iput-byte p2, p0, Lfv7;->a:B

    iput-object p1, p0, Lfv7;->b:Liv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lfv7;->a:B

    iget-object p0, p0, Lfv7;->b:Liv7;

    packed-switch v0, :pswitch_data_28

    iget-object v0, p0, Liv7;->f:Lpde;

    iget-object v1, p0, Liv7;->c:Llg;

    invoke-virtual {v1}, Llg;->b()Leri;

    move-result-object v1

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v0, p0, Liv7;->k:Lpde;

    invoke-virtual {p0}, Liv7;->a()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22
    invoke-virtual {p0}, Liv7;->d()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
