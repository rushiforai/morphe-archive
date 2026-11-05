.class public Lcom/sauzask/nicoid/NicoidDownloadCacheCancel;
.super Landroid/app/Activity;
.source ""


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Le/e/a/CacheControl110;->dialog(Landroid/app/Activity;)V

    return-void
.end method
