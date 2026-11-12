.class public final synthetic Larn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrn;


# direct methods
.method public synthetic constructor <init>(Lmrn;B)V
    .registers 3

    iput-byte p2, p0, Larn;->a:B

    iput-object p1, p0, Larn;->b:Lmrn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    iget-byte v0, p0, Larn;->a:B

    iget-object p0, p0, Larn;->b:Lmrn;

    packed-switch v0, :pswitch_data_2e

    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object p1, Ldrn;->k:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    const/4 p0, 0x0

    return p0

    :pswitch_10
    iget-object v0, p0, Lmrn;->p:Lkrn;

    sget-object v1, Ldrn;->h:Ldrn;

    invoke-interface {v0, v1}, Lkrn;->f(Ltc2;)V

    new-instance v0, Lxw;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Lmrn;->a:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljbn;

    invoke-direct {v0, v1, p0}, Lxw;-><init>(Landroid/content/Context;Ljbn;)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
