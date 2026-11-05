.class public Lcom/sauzask/nicoid/NicoidPopupViewService$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidPopupViewService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v1, :cond_21

    if-eqz p1, :cond_21

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopupStarted:Z

    if-nez v1, :cond_21

    const-string v1, ".m3u8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_21

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopupStarted:Z

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c:Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernPopupStart;

    invoke-direct {v2, v0, p1}, Le/e/a/ModernPopupStart;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_21
    return-void
.end method

.method public a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V
    .registers 7

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v1, :cond_25

    if-eqz p1, :cond_22

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopupStarted:Z

    if-nez v1, :cond_25

    const-string v1, ".m3u8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_22

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopupStarted:Z

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c:Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernPopupStart;

    invoke-direct {v2, v0, p1}, Le/e/a/ModernPopupStart;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_25

    :cond_22
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    :cond_25
    :goto_25
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(Lcom/sauzask/nicoid/NicoidPopupViewService;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7a

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v0, :cond_56

    if-nez p1, :cond_56

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 1
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->L:Ljava/lang/String;

    .line 2
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const/4 v2, 0x0

    .line 3
    invoke-static {v1, v2, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 4
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    const/4 v1, 0x1

    .line 5
    sget v2, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    .line 6
    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    move-result v0

    if-nez v0, :cond_56

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 7
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    .line 8
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :cond_56
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    new-instance v1, Le/e/a/o2;

    .line 9
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    .line 10
    iget-object v3, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    .line 11
    invoke-direct {v1, v2, v3, p2}, Le/e/a/o2;-><init>(Landroid/content/Context;Le/e/a/d0;Lorg/apache/http/client/CookieStore;)V

    .line 12
    iput-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    .line 13
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 14
    iget-object v0, p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    .line 15
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    .line 16
    iput-object p2, v0, Le/e/a/o2;->b:Ljava/lang/String;

    .line 17
    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;

    invoke-direct {p2, p0, p1}, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService$g;Ljava/lang/String;)V

    .line 18
    iput-object p2, v0, Le/e/a/o2;->n:Le/e/a/l3/m;

    .line 19
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 20
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    .line 21
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_81

    :cond_7a
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    const-string p2, ""

    invoke-static {p1, p2}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Lcom/sauzask/nicoid/NicoidPopupViewService;Ljava/lang/String;)V

    :goto_81
    return-void
.end method

.method public a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    return-void
.end method
