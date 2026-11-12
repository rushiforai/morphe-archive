.class public final synthetic Lnu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lnu1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-byte p0, p0, Lnu1;->a:B

    packed-switch p0, :pswitch_data_28

    sget p0, Lorg/chromium/components/browser_ui/modaldialog/ModalDialogView;->D:I

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    const/4 p2, 0x1

    if-nez p0, :cond_16

    invoke-virtual {p1, p2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p2, 0x0

    :cond_16
    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusable(Z)V

    return-void

    :pswitch_1a
    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-eq p4, p8, :cond_27

    new-instance p0, Lca;

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lca;-><init>(Landroid/view/View;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
