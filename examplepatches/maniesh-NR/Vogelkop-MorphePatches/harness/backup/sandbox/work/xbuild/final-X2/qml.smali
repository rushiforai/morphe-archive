.class public final synthetic Lqml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrml;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lrml;Lkotlin/jvm/functions/Function1;B)V
    .registers 4

    iput-byte p3, p0, Lqml;->a:B

    iput-object p1, p0, Lqml;->b:Lrml;

    iput-object p2, p0, Lqml;->c:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lqml;->a:B

    iget-object v1, p0, Lqml;->c:Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Lqml;->b:Lrml;

    packed-switch v0, :pswitch_data_3e

    iget-object p0, p0, Lrml;->b:Ltcl;

    new-instance v0, Lo62;

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    check-cast p0, Lumi;

    invoke-virtual {p0, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lrml;->b:Ltcl;

    new-instance v0, Lra;

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    new-instance v1, Lpml;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lpml;-><init>(Lra;B)V

    check-cast p0, Lumi;

    invoke-virtual {p0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    return-object p0

    :pswitch_2e
    iget-object p0, p0, Lrml;->b:Ltcl;

    new-instance v0, Lo62;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    check-cast p0, Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_18
    .end packed-switch
.end method
