.class public Le/e/a/w;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidDownloadCache;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidDownloadCache;)V
    .registers 2

    iput-object p1, p0, Le/e/a/w;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Le/e/a/w;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-static {v0}, Le/e/a/CacheControl110;->active(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->u:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_33

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-eqz v0, :cond_33

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    sput-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    const-string v0, ""

    sput-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    sget-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->u:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    sget-object v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->u:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/w;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->b(Landroid/content/Intent;)V

    goto :goto_38

    .line 2
    :cond_33
    iget-object v0, p0, Le/e/a/w;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 3
    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidDownloadCache;->c()V

    :goto_38
    return-void
.end method
