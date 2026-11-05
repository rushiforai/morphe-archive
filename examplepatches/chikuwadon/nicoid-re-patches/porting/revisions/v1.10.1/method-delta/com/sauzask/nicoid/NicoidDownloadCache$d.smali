.class public Lcom/sauzask/nicoid/NicoidDownloadCache$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Intent;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidDownloadCache;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidDownloadCache;Landroid/content/Intent;)V
    .registers 3

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->active(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    :try_start_9
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->enter(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Le/e/a/o;->a(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v1, "thumbnail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v2, "id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 3
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 4
    invoke-static {v0, v1, v2}, Le/e/a/o;->a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 5
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->g:Z

    if-eqz v0, :cond_6a

    .line 6
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v2, "infodata"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v4, "commentdata"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v2, "url"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->a:Landroid/content/Intent;

    const-string v3, "cookie"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_63} :catch_66
    .catchall {:try_start_9 .. :try_end_63} :catchall_64

    goto :goto_6a

    :catchall_64
    move-exception v0

    goto :goto_73

    :catch_66
    move-exception v0

    .line 10
    :try_start_67
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_64

    :cond_6a
    :goto_6a
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {}, Le/e/a/CacheControl110;->finish()V

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    return-void

    :goto_73
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$d;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {}, Le/e/a/CacheControl110;->finish()V

    invoke-static {v1}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    throw v0
.end method
