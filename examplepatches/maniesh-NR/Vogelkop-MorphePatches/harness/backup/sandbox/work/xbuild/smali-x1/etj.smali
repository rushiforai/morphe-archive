.class public final synthetic Letj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgtj;


# direct methods
.method public synthetic constructor <init>(Lgtj;B)V
    .registers 3

    iput-byte p2, p0, Letj;->a:B

    iput-object p1, p0, Letj;->b:Lgtj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Letj;->a:B

    iget-object p0, p0, Letj;->b:Lgtj;

    packed-switch v0, :pswitch_data_34

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    instance-of v0, p0, Lqv5;

    if-eqz v0, :cond_19

    check-cast p0, Lqv5;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lqv5;->b(Lnv5;)V

    :cond_19
    return-void

    :pswitch_1a
    iget-object v0, p0, Lgtj;->a:Lasj;

    iget-object v0, v0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-boolean v2, p0, Lgtj;->f:Z

    if-nez v2, :cond_33

    iget-boolean p0, p0, Lgtj;->e:Z

    if-nez p0, :cond_33

    instance-of p0, v1, Landroid/view/ViewGroup;

    if-eqz p0, :cond_33

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_33
    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
