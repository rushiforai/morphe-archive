.class public Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidDownloadCache$c;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidDownloadCache$c;)V
    .registers 2

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->active(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v1, :cond_13

    const-string v1, ""

    :cond_13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    goto :goto_44

    :cond_1a
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 2
    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    const-string v3, ".mp4"

    invoke-static {v1, v2, v3}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4c

    :goto_44
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    return-void

    :cond_4c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->a:Landroid/content/Intent;

    const-string v2, "title"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3
    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->b:Ljava/lang/String;

    .line 4
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->a:Landroid/content/Intent;

    const/4 v2, 0x1

    const-string v3, "cache"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 5
    iput-boolean v0, v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->g:Z

    .line 6
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;->a:Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 7
    iget-object v2, v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->b:Ljava/lang/String;

    if-eqz v2, :cond_77

    .line 8
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->a:Landroid/content/Intent;

    .line 9
    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Landroid/content/Intent;)V

    goto :goto_7a

    .line 10
    :cond_77
    invoke-virtual {v1}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a()V

    :goto_7a
    return-void
.end method
