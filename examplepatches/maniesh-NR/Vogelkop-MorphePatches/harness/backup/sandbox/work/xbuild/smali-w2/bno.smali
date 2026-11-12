.class public final Lbno;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbno;->a:B

    iput-object p1, p0, Lbno;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lbno;->a:B

    iget-object p0, p0, Lbno;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast p0, Lnxo;

    iget-boolean p1, p0, Lnxo;->r:Z

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Lnxo;->g()V

    goto :goto_25

    :cond_11
    invoke-virtual {p0}, Lnxo;->d()Z

    move-result p1

    if-eqz p1, :cond_25

    iget-boolean p1, p0, Lnxo;->p:Z

    if-nez p1, :cond_25

    iget-object p1, p0, Lnxo;->i:Lxup;

    sget-object v0, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->start:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {p1, v0}, Lxup;->g(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lnxo;->r:Z

    :cond_25
    :goto_25
    return-void

    :pswitch_26
    instance-of v0, p1, Lzro;

    if-eqz v0, :cond_2d

    check-cast p1, Lzro;

    goto :goto_2e

    :cond_2d
    const/4 p1, 0x0

    :goto_2e
    if-eqz p1, :cond_35

    check-cast p0, Lny3;

    invoke-virtual {p0, p1}, Lny3;->a(Lzro;)V

    :cond_35
    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lbno;->a:B

    iget-object p0, p0, Lbno;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lnxo;

    invoke-virtual {p0}, Lnxo;->f()V

    return-void

    :pswitch_d
    check-cast p0, Lny3;

    iget-object v0, p0, Lny3;->j:Ljava/lang/Object;

    check-cast v0, Lzro;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p0, p0, Lny3;->h:Ljava/lang/Object;

    check-cast p0, Llzo;

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Llzo;->b()V

    :cond_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
