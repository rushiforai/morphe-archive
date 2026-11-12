.class public final synthetic Lr8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt8l;


# direct methods
.method public synthetic constructor <init>(Lt8l;B)V
    .registers 3

    iput-byte p2, p0, Lr8l;->a:B

    iput-object p1, p0, Lr8l;->b:Lt8l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lr8l;->a:B

    iget-object p0, p0, Lr8l;->b:Lt8l;

    packed-switch v0, :pswitch_data_20

    iget-object v0, p0, Lt8l;->c:Lpde;

    invoke-virtual {p0}, Lt8l;->a()Lq8l;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object v0, p0, Lt8l;->c:Lpde;

    invoke-virtual {p0}, Lt8l;->a()Lq8l;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
