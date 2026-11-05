.class public Le/e/a/f1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Le/e/a/f1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 2
    iget-object p1, p1, Le/e/a/v;->c:Le/e/a/l3/b;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Le/e/a/l3/b;->b(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Le/e/a/f1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 4
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    goto :goto_20

    .line 5
    :cond_19
    iget-object p1, p0, Le/e/a/f1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 6
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    .line 7
    :goto_20
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    return-void
.end method
