.class public final Ladn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lndc;


# direct methods
.method public synthetic constructor <init>(Lndc;B)V
    .registers 3

    iput-byte p2, p0, Ladn;->a:B

    iput-object p1, p0, Ladn;->b:Lndc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 3

    iget-byte v0, p0, Ladn;->a:B

    packed-switch v0, :pswitch_data_2e

    return-void

    :pswitch_6
    iget-object p0, p0, Ladn;->b:Lndc;

    check-cast p0, Lbdn;

    invoke-virtual {p0}, Lbdn;->c()V

    iget-object v0, p0, Lbdn;->d:Lpt1;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p0, Lbdn;->c:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_21

    const p0, 0x7f1413ee

    goto :goto_24

    :cond_21
    const p0, 0x7f141408

    :goto_24
    new-instance v1, Lrxh;

    invoke-direct {v1, p0}, Lrxh;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final N()V
    .registers 2

    iget-byte v0, p0, Ladn;->a:B

    iget-object p0, p0, Ladn;->b:Lndc;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lcgn;

    invoke-virtual {p0}, Lcgn;->O0()V

    return-void

    :pswitch_d
    check-cast p0, Lbdn;

    invoke-virtual {p0}, Lbdn;->c()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final s()V
    .registers 3

    iget-byte v0, p0, Ladn;->a:B

    iget-object p0, p0, Ladn;->b:Lndc;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Lcgn;

    invoke-virtual {p0}, Lcgn;->M0()V

    iget-object v0, p0, Lcgn;->N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_30

    iget-object p0, p0, Lcgn;->v:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->getProtocol()I

    move-result p0

    if-eqz p0, :cond_2a

    const/4 v1, 0x1

    if-eq p0, v1, :cond_26

    const/4 v1, 0x2

    if-eq p0, v1, :cond_22

    const/4 p0, 0x0

    goto :goto_2d

    :cond_22
    const p0, 0x7f1413fd

    goto :goto_2d

    :cond_26
    const p0, 0x7f1413fc

    goto :goto_2d

    :cond_2a
    const p0, 0x7f1413fb

    :goto_2d
    invoke-static {p0, v0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    :cond_30
    return-void

    :pswitch_31
    check-cast p0, Lbdn;

    invoke-virtual {p0}, Lbdn;->b()V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method

.method public final t()V
    .registers 2

    iget-byte v0, p0, Ladn;->a:B

    iget-object p0, p0, Ladn;->b:Lndc;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lcgn;

    invoke-virtual {p0}, Lcgn;->M0()V

    return-void

    :pswitch_d
    check-cast p0, Lbdn;

    invoke-virtual {p0}, Lbdn;->c()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
