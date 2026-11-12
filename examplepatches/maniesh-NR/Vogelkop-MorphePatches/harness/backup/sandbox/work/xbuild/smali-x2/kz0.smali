.class public final synthetic Lkz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/app/Dialog;B)V
    .registers 4

    iput-byte p3, p0, Lkz0;->a:B

    iput-object p1, p0, Lkz0;->b:Ljava/lang/Object;

    iput-object p2, p0, Lkz0;->c:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 4

    iget-byte p1, p0, Lkz0;->a:B

    iget-object v0, p0, Lkz0;->c:Landroid/app/Dialog;

    iget-object p0, p0, Lkz0;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_3e

    check-cast p0, Ll18;

    check-cast v0, Lbz0;

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p1

    new-instance v1, Lyk4;

    invoke-direct {v1, p0, v0}, Lyk4;-><init>(Ll18;Lbz0;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_1b
    check-cast p0, Lc63;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v0, 0x1f4

    if-lt p1, v0, :cond_31

    const/4 p1, 0x1

    goto :goto_32

    :cond_31
    const/4 p1, 0x0

    :goto_32
    invoke-virtual {p0, p1}, Lc63;->i0(Z)V

    return-void

    :pswitch_36
    check-cast p0, Lnz0;

    check-cast v0, Lbz0;

    invoke-virtual {p0, v0}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_36
        :pswitch_1b
    .end packed-switch
.end method
