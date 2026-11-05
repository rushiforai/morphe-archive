.class public Lcom/sauzask/nicoid/NicoidDownloadCache$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidDownloadCache;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidDownloadCache;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidDownloadCache;)V
    .registers 2

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    sget-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    const/4 v2, 0x0

    const-wide/16 v3, -0x2

    cmp-long v5, v0, v3

    if-nez v5, :cond_1c

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v1, 0x7f0f0026

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 3
    :goto_16
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    .line 4
    invoke-static {v0, v2, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    goto :goto_60

    :cond_1c
    const-wide/16 v3, -0x1

    cmp-long v5, v0, v3

    if-nez v5, :cond_30

    .line 5
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 6
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v1, 0x7f0f0025

    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    goto :goto_16

    :cond_30
    sget-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    sget-wide v3, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    cmp-long v5, v0, v3

    if-nez v5, :cond_4c

    const-wide/16 v0, 0x0

    cmp-long v5, v3, v0

    if-eqz v5, :cond_4c

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 8
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v1, 0x7f0f0024

    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    goto :goto_16

    :cond_4c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    .line 10
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v1, 0x7f0f0027

    invoke-static {v1}, Le/e/a/CacheProgress;->finishResource(I)I

    move-result v1

    if-eqz v1, :cond_60

    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;->a:Lcom/sauzask/nicoid/NicoidDownloadCache;

    goto :goto_16

    :cond_60
    :goto_60
    return-void
.end method
