.class public Lcom/sauzask/nicoid/NicoidPopupViewService$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnPreparedListener;


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
.method public onPrepared()V
    .registers 6

    const-string v0, "Popup player prepared"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-popup"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getDuration()J

    move-result-wide v1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Popup duration (ms): "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v1, :cond_46

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->H:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c:Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernPopupProbe;

    invoke-direct {v2, v0}, Le/e/a/ModernPopupProbe;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_46
    sget-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->h0:Le/e/a/n0;

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/n0;->c:Z

    sget-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-eqz v0, :cond_62

    sget-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->h0:Le/e/a/n0;

    .line 1
    iget-object v0, v0, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v0, v2, v1}, Le/e/a/l3/b;->a(Le/e/a/n0;Z)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 2
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v0, :cond_62

    :cond_5d
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    :cond_62
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/ModernEnhancements;->prepared(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/PopupAspect214;->changed(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    return-void
.end method
