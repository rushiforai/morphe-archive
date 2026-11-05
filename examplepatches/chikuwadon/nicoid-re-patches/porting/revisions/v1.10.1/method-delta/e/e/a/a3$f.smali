.class public Le/e/a/a3$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/a3;->f(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Le/e/a/a3;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object p1, p0, Le/e/a/a3$f;->b:Le/e/a/a3;

    .line 1
    iget-boolean v0, p1, Le/e/a/a3;->B0:Z

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-boolean v0, p0, Le/e/a/a3$f;->a:Z

    if-eqz v0, :cond_15

    .line 3
    iget-object p1, p1, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    .line 4
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/4 p1, 0x0

    goto :goto_1e

    .line 5
    :cond_15
    iget-object p1, p1, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    .line 6
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/4 p1, 0x1

    :goto_1e
    iput-boolean p1, p0, Le/e/a/a3$f;->a:Z

    iget-object p1, p0, Le/e/a/a3$f;->b:Le/e/a/a3;

    .line 7
    iget-boolean v0, p1, Le/e/a/a3;->B0:Z

    if-nez v0, :cond_27

    goto :goto_42

    :cond_27
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-class v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p1, Le/e/a/a3;->d0:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x4

    const-string v2, "type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p1, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {p1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    :goto_42
    return-void
.end method
