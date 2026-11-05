.class public Le/e/a/t1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/Button;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Le/e/a/t1;->b:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    if-eqz p1, :cond_5f

    .line 2
    invoke-virtual {p1}, Le/e/a/n0;->c()Z

    move-result p1

    const-string v0, "isPlayComplete:"

    if-eqz p1, :cond_30

    iget-object p1, p0, Le/e/a/t1;->b:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 3
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    .line 4
    invoke-virtual {p1}, Le/e/a/n0;->d()V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " / vv.pause();"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object p1, p0, Le/e/a/t1;->a:Landroid/widget/Button;

    const v0, 0x7f070196

    goto :goto_5c

    :cond_30
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    if-eqz p1, :cond_3f

    const/4 p1, 0x0

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    iget-object p1, p0, Le/e/a/t1;->b:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 5
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    .line 6
    invoke-virtual {p1}, Le/e/a/n0;->e()V

    goto :goto_57

    :cond_3f
    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " / vv.start();"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object p1, p0, Le/e/a/t1;->b:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 7
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    .line 8
    invoke-virtual {p1}, Le/e/a/n0;->f()V

    :goto_57
    iget-object p1, p0, Le/e/a/t1;->a:Landroid/widget/Button;

    const v0, 0x7f070195

    :goto_5c
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_5f
    return-void
.end method
