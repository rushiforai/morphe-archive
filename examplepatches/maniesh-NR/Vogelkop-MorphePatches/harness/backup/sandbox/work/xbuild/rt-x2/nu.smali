.class public final synthetic Lnu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lnu;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 3

    iget-byte p0, p0, Lnu;->a:B

    packed-switch p0, :pswitch_data_1e

    if-nez p2, :cond_a

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_a
    return-void

    :pswitch_b
    if-eqz p2, :cond_1c

    instance-of p0, p1, Landroid/widget/AutoCompleteTextView;

    if-eqz p0, :cond_1c

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result p0

    if-nez p0, :cond_1c

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    :cond_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
