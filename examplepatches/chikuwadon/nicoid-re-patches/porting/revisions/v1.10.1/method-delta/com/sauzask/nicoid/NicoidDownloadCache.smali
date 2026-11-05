.class public Lcom/sauzask/nicoid/NicoidDownloadCache;
.super Landroid/app/Service;
.source ""


# static fields
.field public static r:J = 0x0L

.field public static s:J = 0x0L

.field public static t:Ljava/lang/String; = ""

.field public static u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public static v:Z


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ld/h/d/e;

.field public e:Landroid/app/PendingIntent;

.field public f:Landroid/content/Context;

.field public g:Z

.field public i:Landroid/os/Handler;

.field public j:Z

.field public k:Z

.field public l:Ljava/lang/Runnable;

.field public m:Le/e/a/p2;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Z


# virtual methods
.method public final a()V
    .registers 8

    new-instance v0, Le/e/a/d0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-direct {v0, v1}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->j:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->k:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 1
    iget-object v4, v0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v5, "quality_mode"

    const-string v6, "0"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v0, Le/e/a/d0;->e:I

    iput-object v3, v0, Le/e/a/d0;->p:Ljava/lang/Boolean;

    iput-object v2, v0, Le/e/a/d0;->n:Ljava/lang/Boolean;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v0, Le/e/a/d0;->q:Ljava/lang/Boolean;

    iput-object v1, v0, Le/e/a/d0;->d:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, v0, Le/e/a/d0;->b:Le/e/a/v;

    iput-boolean v2, v0, Le/e/a/d0;->O:Z

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    new-instance v1, Lcom/sauzask/nicoid/NicoidDownloadCache$e;

    invoke-direct {v1, p0, v0}, Lcom/sauzask/nicoid/NicoidDownloadCache$e;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache;Le/e/a/d0;)V

    .line 3
    iput-object v1, v0, Le/e/a/d0;->k:Le/e/a/l3/j;

    .line 4
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final a(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 10

    invoke-static {p1}, Le/e/a/CacheTitles117;->bundle(Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/CacheControl110;->enter()V

    const-string v0, "UTF-8"

    const-string v1, "/nicoid/nicoid_cache/"

    const-string v2, "sessionRequest"

    const-string v3, "cookie"

    const/4 v4, 0x0

    :try_start_f
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_18

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_18
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_21

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_21
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_2a
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v5}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".json"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Le/e/a/CacheOutputStream;

    invoke-direct {v3, v2, v4}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-direct {v2, v3, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v3, Ljava/io/BufferedWriter;

    invoke-direct {v3, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-static {p1}, Le/e/a/v0;->a(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_73} :catch_74

    goto :goto_78

    :catch_74
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_78
    :try_start_78
    new-instance p1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Le/e/a/CacheOutputStream;

    invoke-direct {v1, p1, v4}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance p1, Ljava/io/OutputStreamWriter;

    invoke-direct {p1, v1, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_bd} :catch_be

    goto :goto_c2

    :catch_be
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_c2
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    invoke-static {}, Le/e/a/CacheControl110;->enter()V

    if-eqz p1, :cond_3b

    const-string v7, ".m3u8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3b

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/nicoid/nicoid_cache/"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-static {p1, v8, v9, p2}, Le/e/a/CacheHls;->download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v10

    sput-wide v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    sput-wide v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    invoke-static {v8, v9, v10, v11}, Le/e/a/CachePack;->completed(Ljava/lang/String;Ljava/lang/String;J)V

    const-wide/16 v7, 0x0

    cmp-long v7, v10, v7

    if-lez v7, :cond_3a

    invoke-static {}, Le/e/a/CacheProgress;->done()V

    :cond_3a
    return-void

    :cond_3b
    const-string v0, "\u52d5\u753b\u53d6\u5f97\u958b\u59cb : "

    const-string v1, "Anicoid"

    const-string v2, ".mp4"

    const-string v3, ".json"

    const-string v4, "/nicoid/nicoid_cache/"

    if-nez p1, :cond_48

    return-void

    :cond_48
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "url / "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-wide/16 v5, 0x0

    :try_start_5a
    sput-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    sput-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    const-string v7, "h"

    iget-object v8, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->n:Ljava/lang/String;

    if-eqz v8, :cond_71

    :goto_64
    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->c:Ljava/lang/String;

    if-nez v7, :cond_6e

    const-wide/16 v7, 0xa

    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_64

    :cond_6e
    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->c:Ljava/lang/String;

    goto :goto_86

    :cond_71
    const-string v8, "low"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7c

    const-string v7, "l"

    goto :goto_86

    :cond_7c
    const-string v8, "mid"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_86

    const-string v7, "m"

    :cond_86
    :goto_86
    new-instance v8, Le/e/a/CacheFile;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v10}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    new-instance v7, Le/e/a/CacheFile;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v10}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_109

    const-wide/16 p1, -0x1

    sput-wide p1, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_dc} :catch_240
    .catchall {:try_start_5a .. :try_end_dc} :catchall_23e

    new-instance p1, Le/e/a/CacheFile;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    return-void

    :cond_109
    :try_start_109
    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v9

    sput-wide v9, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    new-instance v2, Le/e/a/CacheOutputStream;

    sget-wide v9, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    cmp-long v11, v9, v5

    if-lez v11, :cond_119

    const/4 v9, 0x1

    goto :goto_11a

    :cond_119
    const/4 v9, 0x0

    :goto_11a
    invoke-direct {v2, v8, v9}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance v9, Ljava/io/BufferedOutputStream;

    invoke-direct {v9, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v11, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v1, v10}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v10}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v11, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v11, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {v11}, Le/e/a/CacheControl110;->request(Ljava/lang/Object;)V

    const-string p1, "Cookie"

    invoke-virtual {v11, p1, p2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Connection"

    const-string p2, "keep-alive"

    invoke-virtual {v11, p1, p2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Accept-Encoding"

    const-string p2, "gzip,deflate"

    invoke-virtual {v11, p1, p2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Accept"

    const-string p2, "*/*"

    invoke-virtual {v11, p1, p2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    sget-wide p1, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    cmp-long v12, p1, v5

    if-lez v12, :cond_180

    const-string p1, "Range"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " bytes="

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    invoke-virtual {p2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, "-"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v11, p1, p2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_180
    invoke-virtual {v10, v11}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v5

    sget-wide v11, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    add-long/2addr v5, v11

    sput-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    invoke-static {v5, v6, v11, v12}, Le/e/a/CacheProgress;->transfer(JJ)V

    new-instance p2, Ljava/io/BufferedInputStream;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p2}, Le/e/a/CacheControl110;->stream(Ljava/io/Closeable;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    sget-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    invoke-static {p1, v5, v6}, Le/e/a/o;->a(Landroid/content/Context;J)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " / "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    :goto_1cd
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    invoke-virtual {p2, p1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1f4

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z
    :try_end_1d9
    .catch Ljava/lang/Exception; {:try_start_109 .. :try_end_1d9} :catch_240
    .catchall {:try_start_109 .. :try_end_1d9} :catchall_23e

    if-nez v1, :cond_1dc

    goto :goto_1f4

    :cond_1dc
    :try_start_1dc
    sget-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    int-to-long v11, v0

    add-long/2addr v5, v11

    sput-wide v5, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    invoke-static {v0}, Le/e/a/CacheProgress;->bytes(I)V

    const/4 v1, 0x0

    invoke-virtual {v9, p1, v1, v0}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_1e9
    .catch Ljava/lang/Exception; {:try_start_1dc .. :try_end_1e9} :catch_1ea
    .catchall {:try_start_1dc .. :try_end_1e9} :catchall_23e

    goto :goto_1cd

    :catch_1ea
    move-exception p1

    :try_start_1eb
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-wide/16 p1, -0x2

    sput-wide p1, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    const/4 p1, 0x1

    goto :goto_1f5

    :cond_1f4
    :goto_1f4
    const/4 p1, 0x0

    :goto_1f5
    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    if-nez p1, :cond_1fd

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    :cond_1fd
    invoke-virtual {v10}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    sget-wide p1, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_217

    sget-wide p1, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    sget-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_217

    invoke-virtual {v8, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_217
    .catch Ljava/lang/Exception; {:try_start_1eb .. :try_end_217} :catch_240
    .catchall {:try_start_1eb .. :try_end_217} :catchall_23e

    :cond_217
    new-instance p1, Le/e/a/CacheFile;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_101

    :catchall_23e
    move-exception p1

    goto :goto_26b

    :catch_240
    move-exception p1

    :try_start_241
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_244
    .catchall {:try_start_241 .. :try_end_244} :catchall_23e

    new-instance p1, Le/e/a/CacheFile;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_101

    :goto_26b
    new-instance p2, Le/e/a/CacheFile;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    goto :goto_299

    :goto_298
    throw p1

    :goto_299
    goto :goto_298
.end method

.method public final b(Landroid/content/Intent;)V
    .registers 4

    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->start(Ljava/lang/Object;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->j:Z

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->k:Z

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->k:Z

    if-eqz v0, :cond_46

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-eqz v0, :cond_46

    :try_start_1f
    const-string v0, "id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/sauzask/nicoid/NicoidDownloadCache$c;

    invoke-direct {v1, p0, p1}, Lcom/sauzask/nicoid/NicoidDownloadCache$c;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache;Landroid/content/Intent;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-static {p0}, Le/e/a/CacheFolders;->started(Landroid/content/Context;)V

    const-string v1, "title"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CacheProgress;->title(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_40} :catch_41

    goto :goto_53

    :catch_41
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_53

    .line 1
    :cond_46
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->i:Landroid/os/Handler;

    new-instance v0, Lcom/sauzask/nicoid/NicoidDownloadCache$f;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidDownloadCache$f;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :goto_53
    return-void
.end method

.method public onDestroy()V
    .registers 3

    invoke-static {p0}, Le/e/a/DownloadWorker115;->destroyed(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/CacheControl110;->destroyed(Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/CacheProgress;->stop()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->u:Ljava/util/List;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->m:Le/e/a/p2;

    if-eqz v0, :cond_23

    iget v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->a:I

    invoke-virtual {v0, v1}, Le/e/a/p2;->a(I)V

    :cond_23
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 8

    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->command(Landroid/app/Service;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x2

    return v0

    :cond_8
    invoke-static {p0}, Le/e/a/CacheControl110;->started(Ljava/lang/Object;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->ready(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    const/4 v0, 0x2

    return v0

    :cond_19
    const/4 p2, 0x2

    if-nez p1, :cond_1d

    return p2

    :cond_1d
    invoke-static {}, Le/e/a/v0;->a()I

    const p3, 0x7f1000a2

    invoke-virtual {p0, p3}, Landroid/app/Service;->setTheme(I)V

    const/4 p3, 0x0

    const-string v0, "isstop"

    invoke-virtual {p1, v0, p3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-static {p0}, Le/e/a/CacheControl110;->stop(Landroid/content/Context;)V

    sput-boolean p3, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    goto/16 :goto_d6

    :cond_36
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-eqz v0, :cond_51

    const/4 p3, 0x0

    const-string v0, "title"

    invoke-virtual {p1, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object p3, Lcom/sauzask/nicoid/NicoidDownloadCache;->u:Ljava/util/List;

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->i:Landroid/os/Handler;

    new-instance p3, Lcom/sauzask/nicoid/NicoidDownloadCache$b;

    invoke-direct {p3, p0}, Lcom/sauzask/nicoid/NicoidDownloadCache$b;-><init>(Lcom/sauzask/nicoid/NicoidDownloadCache;)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_d6

    :cond_51
    const/4 v0, 0x1

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    iget v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->a:I

    .line 1
    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    new-instance v1, Le/e/a/p2;

    invoke-direct {v1, p0}, Le/e/a/p2;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->m:Le/e/a/p2;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->m:Le/e/a/p2;

    invoke-virtual {v1}, Le/e/a/p2;->a()Ld/h/d/e;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.sauzask.nicoid.hls"

    const-string v3, "com.sauzask.nicoid.NicoidDownloadCacheCancel"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    invoke-static {v2, p3, v1, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->e:Landroid/app/PendingIntent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->e:Landroid/app/PendingIntent;

    .line 2
    iput-object v2, v1, Ld/h/d/e;->f:Landroid/app/PendingIntent;

    .line 3
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v3, 0x7f0f002c

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ld/h/d/e;->c(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    const v2, 0x7f070193

    .line 4
    iget-object v3, v1, Ld/h/d/e;->N:Landroid/app/Notification;

    iput v2, v3, Landroid/app/Notification;->icon:I

    const-string v2, "nicoid cache"

    .line 5
    invoke-virtual {v1, v2}, Ld/h/d/e;->b(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->f:Landroid/content/Context;

    const v3, 0x7f0f002b

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ld/h/d/e;->a(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    invoke-virtual {v1, p3}, Ld/h/d/e;->a(Z)Ld/h/d/e;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->m:Le/e/a/p2;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    invoke-virtual {v1}, Ld/h/d/e;->a()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Le/e/a/p2;->a(ILandroid/app/Notification;)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->d:Ld/h/d/e;

    invoke-virtual {p3}, Ld/h/d/e;->a()Landroid/app/Notification;

    move-result-object p3

    invoke-virtual {p0, v0, p3}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    sput-wide v0, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->i:Landroid/os/Handler;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidDownloadCache;->l:Ljava/lang/Runnable;

    const-wide/16 v1, 0x3e8

    invoke-virtual {p3, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 6
    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidDownloadCache;->b(Landroid/content/Intent;)V

    :goto_d6
    return p2
.end method
