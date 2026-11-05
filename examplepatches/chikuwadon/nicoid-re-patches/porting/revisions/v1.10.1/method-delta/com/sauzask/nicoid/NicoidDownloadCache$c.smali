.class public Lcom/sauzask/nicoid/NicoidDownloadCache$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidDownloadCache;->b(Landroid/content/Intent;)V
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

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->a:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-eqz v0, :cond_45

    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_8} :catch_41

    const-string v2, ""

    if-nez v1, :cond_e

    move-object v1, v2

    goto :goto_10

    :cond_e
    :try_start_e
    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;

    :goto_10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v3, 0x3e8

    if-eqz v0, :cond_1b

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    :cond_1b
    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v1, :cond_23

    move-object v1, v2

    goto :goto_25

    :cond_23
    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;

    :goto_25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    :cond_2e
    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    sget-object v1, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v1, :cond_35

    goto :goto_37

    :cond_35
    sget-object v2, Le/e/a/o2;->w:Ljava/lang/String;

    :goto_37
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_40
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_40} :catch_41

    goto :goto_45

    :catch_41
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_45
    :goto_45
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-nez v0, :cond_4a

    return-void

    :cond_4a
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$c;->b:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->i:Landroid/os/Handler;

    .line 2
    new-instance v1, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidDownloadCache$c$a;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache$c;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
