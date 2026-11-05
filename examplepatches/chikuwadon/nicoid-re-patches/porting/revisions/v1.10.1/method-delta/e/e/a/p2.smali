.class public Le/e/a/p2;
.super Landroid/content/ContextWrapper;
.source ""


# instance fields
.field public a:Ld/h/d/h;

.field public b:Landroid/app/NotificationManager;


# virtual methods
.method public a(ILandroid/app/Notification;)V
    .registers 4

    invoke-virtual {p0}, Le/e/a/p2;->b()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 6
    iget-object v0, p0, Le/e/a/p2;->b:Landroid/app/NotificationManager;

    if-nez v0, :cond_14

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Le/e/a/p2;->b:Landroid/app/NotificationManager;

    :cond_14
    iget-object v0, p0, Le/e/a/p2;->b:Landroid/app/NotificationManager;

    .line 7
    invoke-static {v0, p1, p2}, Le/e/a/MediaControls;->notify(Landroid/app/NotificationManager;ILandroid/app/Notification;)V

    goto :goto_2a

    .line 8
    :cond_1a
    iget-object v0, p0, Le/e/a/p2;->a:Ld/h/d/h;

    if-nez v0, :cond_25

    .line 9
    new-instance v0, Ld/h/d/h;

    invoke-direct {v0, p0}, Ld/h/d/h;-><init>(Landroid/content/Context;)V

    .line 10
    iput-object v0, p0, Le/e/a/p2;->a:Ld/h/d/h;

    :cond_25
    iget-object v0, p0, Le/e/a/p2;->a:Ld/h/d/h;

    .line 11
    invoke-virtual {v0, p1, p2}, Ld/h/d/h;->a(ILandroid/app/Notification;)V

    :goto_2a
    return-void
.end method
