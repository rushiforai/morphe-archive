.class public Le/e/a/e3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Le/e/a/a3;


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 1
    iget-boolean v1, v0, Le/e/a/a3;->A0:Z

    if-nez v1, :cond_e

    .line 2
    iget-object v0, v0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v1, 0x7f070196

    .line 3
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_e
    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 4
    iget-object v0, v0, Le/e/a/a3;->t1:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 6
    iget-object v0, v0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 8
    iget-object v3, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    if-eqz v3, :cond_31

    .line 9
    iget-object v0, v0, Le/e/a/a3;->m1:Landroid/widget/Button;

    .line 10
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 11
    iget-object v0, v0, Le/e/a/a3;->l1:Landroid/widget/Button;

    .line 12
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    :cond_31
    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 13
    iget-object v0, v0, Le/e/a/a3;->q1:Landroid/widget/Button;

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    .line 15
    iget-object v0, v0, Le/e/a/a3;->p1:Landroid/widget/Button;

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/e3;->a:Le/e/a/a3;

    const/4 v1, 0x5

    .line 17
    invoke-virtual {v0, v1}, Le/e/a/a3;->i(I)V

    return-void
.end method
