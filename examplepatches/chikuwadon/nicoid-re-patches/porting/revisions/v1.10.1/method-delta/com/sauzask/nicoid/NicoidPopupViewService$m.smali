.class public Lcom/sauzask/nicoid/NicoidPopupViewService$m;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnCompletionListener;


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
.method public onCompletion()V
    .registers 3

    const-string v0, "Popup player completed"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$m;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/v0;->a(Z)Z

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    move-result v0

    if-eqz v0, :cond_14

    return-void

    :cond_14
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$m;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/PopupFrame233;->ended(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$m;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    const/4 v1, 0x2

    .line 1
    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(I)Z

    .line 2
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$m;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 3
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    const v1, 0x7f070196

    .line 4
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    return-void
.end method
