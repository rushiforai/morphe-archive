.class public final Le/e/a/CacheControl110;
.super Ljava/lang/Object;
.source "CacheControl110.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheControl110$Job;
    }
.end annotation


# static fields
.field private static final jobs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Thread;",
            "Le/e/a/CacheControl110$Job;",
            ">;"
        }
    .end annotation
.end field

.field private static final services:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    .line 10
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static abort(Ljava/lang/Object;)V
    .registers 5

    instance-of v0, p0, Lnicoid/network238/okhttp3/Call;

    if-eqz v0, :cond_0

    check-cast p0, Lnicoid/network238/okhttp3/Call;

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    return-void

    .line 15
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "abort"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void
.end method

.method public static active(Ljava/lang/Object;)Z
    .registers 3

    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v1, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static await()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x2710

    add-long/2addr v0, v2

    :goto_0
    invoke-static {}, Le/e/a/CacheControl110;->busy()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-gtz v4, :cond_1

    const-wide/16 v2, 0x19

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cache worker still stopping"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static busy()Z
    .registers 1

    .line 23
    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static cancel()V
    .registers 5

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/CacheControl110$$ExternalSyntheticLambda3;

    invoke-direct {v2, v0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda3;-><init>(Ljava/util/List;)V

    const-string v0, "nicoid-cache-interrupt"

    invoke-direct {v1, v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CacheControl110$Job;

    const/4 v4, 0x1

    iput-boolean v4, v3, Le/e/a/CacheControl110$Job;->cancelled:Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CacheControl110$Job;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static captureJobRoot()Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    if-eqz v1, :cond_0

    invoke-static {v1}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "/@nicoid-cache/unselected"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    :cond_0
    return-object v0
.end method

.method public static check()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheControl110$Job;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Le/e/a/CacheControl110$Job;->cancelled:Z

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Cache acquisition cancelled"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static cleanup(Le/e/a/CacheControl110$Job;)V
    .registers 7

    .line 21
    iget-boolean v0, p0, Le/e/a/CacheControl110$Job;->cancelled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/CacheControl110$Job;->id:Ljava/lang/String;

    const-string v1, "(?:sm|so|nm|ss)[0-9]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Le/e/a/CacheControl110$Job;->cacheRoot:Ljava/lang/String;

    if-eqz v1, :cond_3

    invoke-static {}, Le/e/a/CacheControl110;->captureJobRoot()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/nicoid/nicoid_cache/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_1

    sget-object p0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/CacheFolders;->invalidateSummary(Landroid/content/Context;)V

    return-void

    :cond_1
    aget-object v3, v0, v2

    iget-object v4, p0, Le/e/a/CacheControl110$Job;->id:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".json"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".thm"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {v3}, Le/e/a/CachePack;->invalidate(Ljava/io/File;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method public static connection(Ljava/net/HttpURLConnection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheControl110$Job;

    if-eqz v0, :cond_0

    iget-object v1, v0, Le/e/a/CacheControl110$Job;->connections:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-boolean v0, v0, Le/e/a/CacheControl110$Job;->cancelled:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Le/e/a/CacheControl110;->check()V

    :cond_0
    return-void
.end method

.method static deactivate(Ljava/lang/Object;)V
    .registers 6

    .line 8
    sget-object v0, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "q"

    const-string v2, "g"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    return-void

    :cond_0
    aget-object v3, v0, v2

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method static delete(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CacheControl110;->deleteScoped(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static deleteScoped(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const-string v1, "(?:sm|so|nm|ss)[0-9]+"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p2, :cond_2

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    return v0

    :cond_1
    move-object v1, p2

    :cond_2
    new-instance v2, Le/e/a/CacheFile;

    invoke-direct {v2, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_3

    return v0

    :cond_3
    array-length v2, v1

    const/4 v3, 0x1

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v2, :cond_4

    invoke-static {p0}, Le/e/a/CacheFolders;->invalidateSummary(Landroid/content/Context;)V

    return v3

    :cond_4
    aget-object v5, v1, v4

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    if-eqz p1, :cond_5

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_5
    invoke-static {v5}, Le/e/a/CachePack;->invalidate(Ljava/io/File;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_6

    const/4 v3, 0x0

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 1

    .line 9
    invoke-static {p0}, Le/e/a/CacheControl110;->deactivate(Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/CacheControl110;->cancel()V

    return-void
.end method

.method public static dialog(Landroid/app/Activity;)V
    .registers 5

    .line 26
    invoke-static {p0}, Le/e/a/ThemeChoice;->apply(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Stop cache acquisition?"

    const-string v2, "\u4e2d\u65b7\u5feb\u53d6\u4e0b\u8f09\uff1f"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u53d6\u5f97\u3092\u4e2d\u65ad\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Stops the current cache acquisition."

    const-string v2, "\u505c\u6b62\u9032\u884c\u4e2d\u7684\u5feb\u53d6\u4e0b\u8f09\u3002"

    const-string/jumbo v3, "\u9032\u884c\u4e2d\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u3092\u505c\u6b62\u3057\u307e\u3059\u3002"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Stop"

    const-string v2, "\u4e2d\u65b7"

    const-string v3, "\u4e2d\u65ad"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/CacheControl110$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Le/e/a/CacheControl110$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-void
.end method

.method static end(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V
    .registers 5

    .line 20
    iget-object v0, p1, Le/e/a/CacheControl110$Job;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p1}, Le/e/a/CacheControl110;->cleanup(Le/e/a/CacheControl110$Job;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "nicoid-cache"

    const-string v2, "Unable to clean interrupted media"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    :goto_2
    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v1, p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    throw v0
.end method

.method public static enter()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "v"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :goto_0
    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheControl110;->register(Ljava/lang/Thread;)V

    :cond_1
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    return-void
.end method

.method public static enter(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-static {p0}, Le/e/a/CacheControl110;->active(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Le/e/a/CacheControl110;->enter()V

    monitor-exit v0

    return-void

    :cond_0
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static finish()V
    .registers 2

    .line 19
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CacheControl110$Job;

    if-eqz v1, :cond_0

    invoke-static {v0, v1}, Le/e/a/CacheControl110;->end(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V
    .registers 7

    .line 12
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x1388

    add-long/2addr v0, v2

    :goto_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v2

    sget-object v3, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    if-ne v2, v3, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-ltz v4, :cond_0

    goto :goto_1

    :cond_0
    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    invoke-static {p0, p1}, Le/e/a/CacheControl110;->end(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V

    return-void

    :goto_3
    invoke-static {p0, p1}, Le/e/a/CacheControl110;->end(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V

    throw v0
.end method

.method static synthetic lambda$1(Ljava/util/List;)V
    .registers 4

    .line 24
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheControl110$Job;

    iget-object v1, v0, Le/e/a/CacheControl110$Job;->requests:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v1, v0, Le/e/a/CacheControl110$Job;->connections:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, v0, Le/e/a/CacheControl110$Job;->streams:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_3

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_2

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Le/e/a/CacheControl110;->abort(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 26
    invoke-static {p0}, Le/e/a/CacheControl110;->stop(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Landroid/content/DialogInterface;)V
    .registers 2

    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$4(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 4

    .line 28
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u524a\u9664"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CacheControl110$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda5;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$5(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 28
    const/4 p1, 0x0

    invoke-static {p0, p1, p1}, Le/e/a/CacheControl110;->remove(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$6(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V
    .registers 5

    .line 29
    :try_start_0
    invoke-static {}, Le/e/a/CacheControl110;->await()V

    invoke-static {p0, p1, p3}, Le/e/a/CacheControl110;->deleteScoped(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    :goto_0
    new-instance v0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;ZLjava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$7(Landroid/app/Activity;ZLjava/lang/Runnable;)V
    .registers 4

    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_1
    const-string p1, "\u524a\u9664\u3057\u307e\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    goto :goto_0

    :cond_2
    const-string p1, "\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    :goto_0
    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static register(Ljava/lang/Thread;)V
    .registers 4

    .line 12
    new-instance v0, Le/e/a/CacheControl110$Job;

    invoke-direct {v0}, Le/e/a/CacheControl110$Job;-><init>()V

    :try_start_0
    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "t"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheControl110$Job;->id:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    invoke-static {}, Le/e/a/CacheControl110;->captureJobRoot()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheControl110$Job;->cacheRoot:Ljava/lang/String;

    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, v0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V

    const-string p0, "nicoid-cache-worker-watch"

    invoke-direct {v1, v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static remove(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/CacheControl110;->removeScoped(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V

    return-void
.end method

.method static removeScoped(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V
    .registers 8

    .line 29
    const/4 v0, 0x1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    sget-object v2, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3

    if-eqz v1, :cond_2

    invoke-static {p0}, Le/e/a/CacheControl110;->stop(Landroid/content/Context;)V

    :cond_2
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/CacheControl110$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1, p2, p3}, Le/e/a/CacheControl110$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V

    const-string p0, "nicoid-cache-delete"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CacheControl110$Job;

    if-eqz p1, :cond_1

    iget-object v3, v3, Le/e/a/CacheControl110$Job;->id:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    goto :goto_1
.end method

.method public static request(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheControl110$Job;

    if-eqz v0, :cond_0

    iget-object v1, v0, Le/e/a/CacheControl110$Job;->requests:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-boolean v0, v0, Le/e/a/CacheControl110$Job;->cancelled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/CacheControl110;->abort(Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/CacheControl110;->check()V

    :cond_0
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 28
    const-string v0, "cache_all_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Le/e/a/CacheControl110$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Le/e/a/CacheControl110$$ExternalSyntheticLambda7;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_0
    return-void
.end method

.method public static started(Ljava/lang/Object;)V
    .registers 4

    .line 6
    sget-object v0, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 5

    .line 25
    sget-object v0, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/CacheControl110;->services:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-static {}, Le/e/a/CacheControl110;->cancel()V

    :try_start_1
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "v"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_0

    monitor-enter v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    :cond_0
    :goto_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    invoke-static {}, Le/e/a/CacheProgress;->stop()V

    invoke-static {p0}, Le/e/a/CacheFolders;->invalidateSummary(Landroid/content/Context;)V

    return-void

    :cond_1
    :try_start_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Le/e/a/CacheControl110;->deactivate(Ljava/lang/Object;)V

    goto :goto_0

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0
.end method

.method public static stream(Ljava/io/Closeable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    sget-object v0, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheControl110$Job;

    if-eqz v0, :cond_0

    iget-object v1, v0, Le/e/a/CacheControl110$Job;->streams:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-boolean v0, v0, Le/e/a/CacheControl110$Job;->cancelled:Z

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    invoke-static {}, Le/e/a/CacheControl110;->check()V

    :cond_0
    return-void
.end method
