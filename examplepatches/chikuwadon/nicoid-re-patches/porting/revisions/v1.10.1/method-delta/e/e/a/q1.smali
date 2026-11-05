.class public Le/e/a/q1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    iget-object p1, p0, Le/e/a/q1;->a:[Z

    const/4 v0, 0x0

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_1a

    iget-object p1, p0, Le/e/a/q1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    iget-object p1, p0, Le/e/a/q1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v1, 0x7f070195

    .line 2
    invoke-static {p1, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_1a
    iget-object p1, p0, Le/e/a/q1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 3
    iput-boolean v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->H0:Z

    return-void
.end method
