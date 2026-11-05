.class public Le/e/a/s0;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p1, p0, Le/e/a/s0;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    const v0, 0x7f070073

    goto :goto_1c

    .line 2
    :cond_15
    iget-object p1, p0, Le/e/a/s0;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 3
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    const v0, 0x7f070072

    .line 4
    :goto_1c
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    return-void
.end method
