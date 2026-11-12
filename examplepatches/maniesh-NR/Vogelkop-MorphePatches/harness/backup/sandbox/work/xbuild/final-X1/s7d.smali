.class public final synthetic Ls7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;


# direct methods
.method public synthetic constructor <init>(Lp12;B)V
    .registers 3

    iput-byte p2, p0, Ls7d;->a:B

    iput-object p1, p0, Ls7d;->b:Lp12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ls7d;->a:B

    iget-object p0, p0, Ls7d;->b:Lp12;

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lqtg;

    iget-object p1, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Ltsd;

    invoke-virtual {p0}, Lp12;->n()Lp7d;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Lwvg;

    iget-object p1, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Ltsd;

    invoke-virtual {p0}, Lp12;->n()Lp7d;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
