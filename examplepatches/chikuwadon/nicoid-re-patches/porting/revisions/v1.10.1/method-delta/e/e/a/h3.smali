.class public Le/e/a/h3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:Le/e/a/a3;


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    iget-object p1, p0, Le/e/a/h3;->a:[Z

    const/4 v0, 0x0

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_1a

    iget-object p1, p0, Le/e/a/h3;->b:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Le/e/a/f0;->start()V

    iget-object p1, p0, Le/e/a/h3;->b:Le/e/a/a3;

    .line 1
    iget-object p1, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v1, 0x7f070195

    .line 2
    invoke-static {p1, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_1a
    iget-object p1, p0, Le/e/a/h3;->b:Le/e/a/a3;

    .line 3
    iput-boolean v0, p1, Le/e/a/a3;->J0:Z

    return-void
.end method
