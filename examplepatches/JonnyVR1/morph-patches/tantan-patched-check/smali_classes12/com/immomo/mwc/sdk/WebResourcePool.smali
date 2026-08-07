.class public final Lcom/immomo/mwc/sdk/WebResourcePool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mwc/sdk/WebResourcePool$b;,
        Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;,
        Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;
    }
.end annotation


# static fields
.field private static a:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/WebResourcePool;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/immomo/mwc/sdk/WebResourcePool;->b(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static b(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache;->a:Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;->access$400(Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    return v1
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/mwc/sdk/WebResourcePool$b;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/immomo/mwc/sdk/WebResourcePool$b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_6

    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_2
    invoke-virtual {v0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/immomo/mwc/sdk/WebResourcePool$b;

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_3
    monitor-enter v0

    .line 41
    :try_start_0
    invoke-static {v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->a(Lcom/immomo/mwc/sdk/WebResourcePool$b;)I

    .line 42
    .line 43
    .line 44
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    if-nez v1, :cond_4

    .line 46
    .line 47
    :try_start_1
    const-string v1, "WebResourcePool"

    .line 48
    .line 49
    const-string v2, "getWebResource::wait @workerId=%s, @key=%s"

    .line 50
    .line 51
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v1, p0, v2, v3}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v1, 0x1388

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_1

    .line 66
    :catch_0
    move-exception v1

    .line 67
    :try_start_2
    const-string v2, "WebResourcePool"

    .line 68
    .line 69
    const-string v3, "getWebResource::wait InterruptedException @error=%s"

    .line 70
    .line 71
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v2, p0, v3, v1}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    sget-object v1, Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;->ONCE:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->b(Lcom/immomo/mwc/sdk/WebResourcePool$b;)Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    if-ne v1, v2, :cond_5

    .line 86
    .line 87
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/WebResourcePool;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    return-object v0

    .line 91
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 92
    throw p0

    .line 93
    :cond_6
    :goto_2
    return-object v1
.end method

.method private static declared-synchronized e()V
    .locals 3

    .line 1
    const-class v0, Lcom/immomo/mwc/sdk/WebResourcePool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;->MEMORY:Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/immomo/mwc/sdk/WebResourcePool;->b(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/immomo/mwc/sdk/WebResourcePool$a;

    .line 13
    .line 14
    const/high16 v2, 0x1000000

    .line 15
    .line 16
    invoke-direct {v1, v2}, Lcom/immomo/mwc/sdk/WebResourcePool$a;-><init>(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v1, Landroid/util/LruCache;

    .line 23
    .line 24
    const/16 v2, 0x40

    .line 25
    .line 26
    invoke-direct {v1, v2}, Landroid/util/LruCache;-><init>(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    sput-object v1, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw v1
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "@"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Ll/d2j0;->a(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static g(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/immomo/mwc/sdk/WebResourcePool;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    sget-object p1, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    const-string p1, "WebResourcePool"

    .line 22
    .line 23
    const-string v0, "[\u79fb\u9664Web\u5bb9\u5668\u4e2d\u6307\u5b9aWorker\u4e0b\u7684\u6240\u6709\u7f13\u5b58]remove::workerResources @workerId=%s, @available=%s"

    .line 24
    .line 25
    sget-object v1, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 26
    .line 27
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p1, p0, v0, v1}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0

    .line 38
    :cond_1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const-string v1, "WebResourcePool"

    .line 52
    .line 53
    const-string v2, "[\u79fb\u9664Web\u5bb9\u5668\u4e2d\u6307\u5b9aKey\u7684\u5355\u4e2a\u7f13\u5b58]remove::webResource @key=%s, @available=%s"

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/util/AbstractMap;->keySet()Ljava/util/Set;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {v1, p0, v2, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void
.end method

.method public static i(Lcom/immomo/mwc/sdk/WebResourcePool$b;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/immomo/mwc/sdk/WebResourcePool$b<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-nez p0, :cond_1

    .line 8
    .line 9
    return v1

    .line 10
    :cond_1
    invoke-virtual {p0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->f()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->i()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-nez v3, :cond_4

    .line 23
    .line 24
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    sget-object v3, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 32
    .line 33
    monitor-enter v3

    .line 34
    :try_start_0
    sget-object v1, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 41
    .line 42
    if-nez v1, :cond_3

    .line 43
    .line 44
    new-instance v1, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-direct {v1, v4}, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;-><init>(Lcom/immomo/mwc/sdk/WebResourcePool$a;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0, p0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    sget-object v4, Lcom/immomo/mwc/sdk/WebResourcePool;->a:Landroid/util/LruCache;

    .line 54
    .line 55
    invoke-virtual {v4, v2, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    invoke-virtual {v1, v0, p0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    const-string v1, "WebResourcePool"

    .line 66
    .line 67
    const-string v3, "set:empty:response:WebResource @key=%s, @webResource=%s"

    .line 68
    .line 69
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {v1, v2, v3, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x1

    .line 77
    return p0

    .line 78
    :goto_1
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    throw p0

    .line 80
    :cond_4
    :goto_2
    return v1
.end method
