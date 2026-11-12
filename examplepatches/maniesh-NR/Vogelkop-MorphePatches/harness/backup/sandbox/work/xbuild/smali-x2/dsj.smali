.class public final Ldsj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfsj;


# direct methods
.method public synthetic constructor <init>(Lfsj;B)V
    .registers 3

    iput-byte p2, p0, Ldsj;->a:B

    iput-object p1, p0, Ldsj;->b:Lfsj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Ldsj;->a:B

    packed-switch p1, :pswitch_data_3a

    return-void

    :pswitch_6
    iget-object p0, p0, Ldsj;->b:Lfsj;

    iget-object p1, p0, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object v0, p0, Lfsj;->j:Lj21;

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object p1, p0, Lfsj;->a:Landroid/view/View;

    const v0, 0x7f0a0a8f

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_21

    check-cast v0, Latj;

    goto :goto_36

    :cond_21
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of v0, p1, Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_2d

    check-cast p1, Landroid/view/View;

    goto :goto_2e

    :cond_2d
    move-object p1, v1

    :goto_2e
    if-eqz p1, :cond_35

    invoke-static {p1}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v0

    goto :goto_36

    :cond_35
    move-object v0, v1

    :goto_36
    invoke-virtual {p0, v0}, Lfsj;->a(Latj;)V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Ldsj;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ldsj;->b:Lfsj;

    packed-switch p1, :pswitch_data_3c

    iget-object p1, p0, Lfsj;->a:Landroid/view/View;

    const v1, 0x7f0a0a8f

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_17

    move-object v0, v1

    check-cast v0, Latj;

    goto :goto_29

    :cond_17
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of v1, p1, Landroid/view/View;

    if-eqz v1, :cond_22

    check-cast p1, Landroid/view/View;

    goto :goto_23

    :cond_22
    move-object p1, v0

    :goto_23
    if-eqz p1, :cond_29

    invoke-static {p1}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v0

    :cond_29
    :goto_29
    invoke-virtual {p0, v0}, Lfsj;->a(Latj;)V

    return-void

    :pswitch_2d
    iget-object p1, p0, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object v1, p0, Lfsj;->j:Lj21;

    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0, v0}, Lfsj;->a(Latj;)V

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
