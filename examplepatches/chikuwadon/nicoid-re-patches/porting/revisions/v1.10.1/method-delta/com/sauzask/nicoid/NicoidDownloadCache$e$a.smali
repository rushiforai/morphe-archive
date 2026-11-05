.class public Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidDownloadCache$e;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/os/Bundle;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidDownloadCache$e;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 6

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->b:Ljava/lang/String;

    iput-object p4, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->c:Landroid/os/Bundle;

    iput-object p5, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->active(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    const-string v0, "thumbImage"

    const/4 v1, 0x0

    :try_start_e
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->enter(Ljava/lang/Object;)V

    const-string v0, "thumbImage"

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->a:Ljava/lang/String;

    if-eqz v2, :cond_80

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->a:Le/e/a/d0;

    iget-object v2, v2, Le/e/a/d0;->U:Ljava/lang/String;

    if-eqz v2, :cond_30

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a$a;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a$a;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    :cond_30
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 2
    invoke-static {v2}, Le/e/a/o;->a(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->c:Landroid/os/Bundle;

    invoke-virtual {v2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_48

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->c:Landroid/os/Bundle;

    invoke-virtual {v2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4a

    :cond_48
    const-string v0, ""

    :goto_4a
    sget-object v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 3
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 4
    invoke-static {v0, v2, v3}, Le/e/a/o;->a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 5
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->g:Z

    if-eqz v0, :cond_80

    .line 6
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->c:Landroid/os/Bundle;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->d:Ljava/lang/String;

    .line 7
    invoke-virtual {v0, v2, v3}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->a:Ljava/lang/String;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->b:Ljava/lang/String;

    .line 9
    invoke-virtual {v0, v2, v3}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_73} :catch_76
    .catchall {:try_start_e .. :try_end_73} :catchall_74

    goto :goto_80

    :catchall_74
    move-exception v0

    goto :goto_91

    :catch_76
    move-exception v0

    .line 10
    :try_start_77
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 11
    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->q:Z
    :try_end_80
    .catchall {:try_start_77 .. :try_end_80} :catchall_74

    .line 12
    :cond_80
    :goto_80
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {}, Le/e/a/CacheControl110;->finish()V

    invoke-static {v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 13
    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->q:Z

    return-void

    .line 14
    :goto_91
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {}, Le/e/a/CacheControl110;->finish()V

    invoke-static {v2}, Lcom/sauzask/nicoid/NicoidDownloadCache;->a(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$e$a;->e:Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidDownloadCache$e;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 15
    iput-boolean v1, v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->q:Z

    .line 16
    throw v0
.end method
