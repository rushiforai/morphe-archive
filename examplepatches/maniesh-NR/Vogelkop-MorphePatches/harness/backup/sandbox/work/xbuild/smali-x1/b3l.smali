.class public final synthetic Lb3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj1c;


# direct methods
.method public synthetic constructor <init>(Lj1c;B)V
    .registers 3

    iput-byte p2, p0, Lb3l;->a:B

    iput-object p1, p0, Lb3l;->b:Lj1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lb3l;->a:B

    iget-object p0, p0, Lb3l;->b:Lj1c;

    packed-switch v0, :pswitch_data_30

    iget-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object v1, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_18

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v1

    goto :goto_1a

    :cond_18
    sget-object v1, Lp6l;->a:Lp6l;

    :goto_1a
    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lj1c;->a()V

    :cond_23
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_26
    iget-object p0, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method
