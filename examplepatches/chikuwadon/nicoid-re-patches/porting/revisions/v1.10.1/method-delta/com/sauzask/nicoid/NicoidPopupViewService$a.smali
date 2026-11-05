.class public Lcom/sauzask/nicoid/NicoidPopupViewService$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public onError(Ljava/lang/Exception;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v0, 0x7f0800ea

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 3
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/high16 v1, -0x10000

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    const v1, 0x7f0f00ba

    invoke-virtual {p1, v1}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 5
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-eqz p1, :cond_46

    .line 7
    iget-object p1, p1, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {p1}, Le/e/a/l3/b;->b()V

    :cond_46
    const/4 p1, 0x1

    return p1
.end method
