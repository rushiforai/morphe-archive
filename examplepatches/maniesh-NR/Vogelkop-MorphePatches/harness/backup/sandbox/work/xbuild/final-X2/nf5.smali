.class public final synthetic Lnf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpf5;

.field public final synthetic c:Lwf5;


# direct methods
.method public synthetic constructor <init>(Lpf5;Lwf5;B)V
    .registers 4

    iput-byte p3, p0, Lnf5;->a:B

    iput-object p1, p0, Lnf5;->b:Lpf5;

    iput-object p2, p0, Lnf5;->c:Lwf5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lnf5;->a:B

    sget-object v1, Lhjm;->b:Lhjm;

    iget-object v2, p0, Lnf5;->c:Lwf5;

    iget-object p0, p0, Lnf5;->b:Lpf5;

    packed-switch v0, :pswitch_data_36

    iget-object p0, p0, Lpf5;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    check-cast v2, Lxf5;

    iget-object p0, v2, Lxf5;->a:Lyf5;

    invoke-virtual {p0, v1}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    iget-object p0, p0, Lpf5;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    check-cast v2, Lxf5;

    invoke-virtual {v2}, Lxf5;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    iget-object p0, p0, Lpf5;->c:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    check-cast v2, Lxf5;

    iget-object p0, v2, Lxf5;->a:Lyf5;

    invoke-virtual {p0, v1}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_27
        :pswitch_1a
    .end packed-switch
.end method
