.class public Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->b(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;


# virtual methods
.method public run()V
    .registers 12

    :try_start_0
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/x1;

    const-string v3, "videourl"

    invoke-virtual {v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v5, "$1$2"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 3
    iget-object v4, v4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    .line 4
    invoke-static {v3, v4}, Le/e/a/o;->a(Ljava/lang/String;Landroid/content/Context;)[J

    move-result-object v4

    const/4 v5, 0x0

    aget-wide v5, v4, v5

    const-wide/16 v7, 0x0

    cmp-long v4, v5, v7

    if-lez v4, :cond_10

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 5
    iget-object v4, v4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    .line 6
    invoke-static {v3, v4}, Le/e/a/o;->b(Ljava/lang/String;Landroid/content/Context;)J

    move-result-wide v3

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 7
    iget-wide v9, v6, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->M:J

    sub-long/2addr v9, v3

    .line 8
    iput-wide v9, v5, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->M:J

    cmp-long v5, v3, v7

    .line 9
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_56
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;->b:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 10
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->E:Landroid/os/Handler;

    .line 11
    new-instance v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e$a;

    invoke-direct {v2, p0, v0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e$a;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity$e;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_62} :catch_63

    goto :goto_67

    :catch_63
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_67
    return-void
.end method
