.class public final Le/e/a/CachedPlayback;
.super Ljava/lang/Object;
.source "CachedPlayback.java"


# static fields
.field private static final ACQUIRE:Ljava/util/concurrent/ExecutorService;

.field private static final MAIN:Landroid/os/Handler;

.field private static final REQUESTED:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final WAITING:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CachedPlayback;->MAIN:Landroid/os/Handler;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    .line 17
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/CachedPlayback;->ACQUIRE:Ljava/util/concurrent/ExecutorService;

    .line 18
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static acquiredAt(Ljava/lang/String;Ljava/lang/String;)J
    .registers 10

    .line 60
    const-string v0, ".mp4"

    const-string v1, ".m3u8"

    const-string v2, ".ncache"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_b
    const/4 v2, 0x3

    if-lt v1, v2, :cond_2b

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ".json"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->lastModified()J

    move-result-wide p0

    return-wide p0

    :cond_2b
    aget-object v2, v0, v1

    new-instance v3, Le/e/a/CacheFile;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, p0, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_58

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide p0

    return-wide p0

    :cond_58
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method

.method public static acquisitionIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 4

    .line 32
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "id"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static cacheWhilePlaying(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 21
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "r"

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7b

    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    goto :goto_7b

    .line 22
    :cond_1f
    const-string v0, "K"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "play_mode"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CachePlaybackPolicy;->acquire(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    return-void

    .line 23
    :cond_3e
    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_7a

    const-string v1, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7a

    invoke-static {v0, p1}, Le/e/a/CachedPlayback;->path(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_53

    goto :goto_7a

    .line 24
    :cond_53
    sget-object v1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter v1
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_56} :catch_7c

    :try_start_56
    sget-object v2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    const/16 v3, 0x20

    if-ge v2, v3, :cond_75

    sget-object v2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_69

    goto :goto_75

    :cond_69
    monitor-exit v1
    :try_end_6a
    .catchall {:try_start_56 .. :try_end_6a} :catchall_77

    .line 25
    :try_start_6a
    sget-object v1, Le/e/a/CachedPlayback;->ACQUIRE:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CachedPlayback$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1, p0, v0}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_74} :catch_7c

    .line 29
    goto :goto_84

    .line 24
    :cond_75
    :goto_75
    :try_start_75
    monitor-exit v1

    return-void

    :catchall_77
    move-exception p0

    monitor-exit v1
    :try_end_79
    .catchall {:try_start_75 .. :try_end_79} :catchall_77

    :try_start_79
    throw p0
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_7a} :catch_7c

    .line 23
    :cond_7a
    :goto_7a
    return-void

    .line 21
    :cond_7b
    :goto_7b
    return-void

    .line 29
    :catch_7c
    move-exception p0

    const-string p1, "nicoid-cache"

    const-string v0, "Unable to prepare background acquisition"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_84
    return-void
.end method

.method public static completedBytes(Ljava/lang/String;Ljava/lang/String;)J
    .registers 14

    .line 9
    const-wide/16 v0, -0x1

    :try_start_2
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".mp4"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Le/e/a/CacheFile;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".m3u8"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Le/e/a/CacheFile;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, ".ncache"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    const-wide/16 v6, 0x0

    if-eqz v5, :cond_65

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v8

    cmp-long v5, v8, v6

    if-lez v5, :cond_65

    invoke-static {v3}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v5

    if-eqz v5, :cond_65

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide p0

    return-wide p0

    .line 11
    :cond_65
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_6c

    return-wide v0

    .line 12
    :cond_6c
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_b1

    new-instance v2, Le/e/a/CacheFile;

    invoke-direct {v2, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_aa

    array-length v2, p0

    move-wide v8, v6

    :goto_80
    if-lt v4, v2, :cond_83

    goto :goto_ab

    :cond_83
    aget-object v3, p0, v4

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "_asset_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a7

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v10

    add-long/2addr v8, v10

    :cond_a7
    add-int/lit8 v4, v4, 0x1

    goto :goto_80

    :cond_aa
    move-wide v8, v6

    :goto_ab
    cmp-long p0, v8, v6

    if-lez p0, :cond_b0

    move-wide v0, v8

    :cond_b0
    return-wide v0

    .line 13
    :cond_b1
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide p0

    cmp-long v3, p0, v6

    if-lez v3, :cond_fa

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide p0

    const-wide/16 v8, 0x400

    cmp-long v3, p0, v8

    if-gez v3, :cond_fa

    const/16 p0, 0x10

    new-array p0, p0, [B
    :try_end_c7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_c7} :catch_107

    const/4 p1, 0x0

    :try_start_c8
    new-instance v3, Le/e/a/CacheInputStream;

    invoke-direct {v3, v2}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_cd
    .catchall {:try_start_c8 .. :try_end_cd} :catchall_f0

    :try_start_cd
    invoke-virtual {v3, p0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-lez v5, :cond_e6

    new-instance v8, Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-direct {v8, p0, v4, v5, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    const-string p0, "HLS cache:"

    invoke-virtual {v8, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_e0
    .catchall {:try_start_cd .. :try_end_e0} :catchall_ea

    if-eqz p0, :cond_e6

    :try_start_e2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    return-wide v0

    :cond_e6
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    goto :goto_fa

    :catchall_ea
    move-exception p0

    move-object p1, p0

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw p1
    :try_end_f0
    .catchall {:try_start_e2 .. :try_end_f0} :catchall_f0

    :catchall_f0
    move-exception p0

    if-eqz p1, :cond_f9

    if-eq p1, p0, :cond_f8

    :try_start_f5
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_f8
    move-object p0, p1

    :cond_f9
    throw p0

    .line 14
    :cond_fa
    :goto_fa
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide p0

    cmp-long v3, p0, v6

    if-lez v3, :cond_106

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v0
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_106} :catch_107

    :cond_106
    return-wide v0

    .line 15
    :catch_107
    move-exception p0

    return-wide v0
.end method

.method static current(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "d"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_34

    const-string p1, "G"

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_34

    const/4 p0, 0x1

    return p0

    :cond_34
    const/4 p0, 0x0

    return p0
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    return-object p0
.end method

.method public static initializeMetadata(Ljava/lang/Object;Landroid/os/Bundle;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 71
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "r"

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Class;

    const-class v4, Landroid/os/Bundle;

    aput-object v4, v3, v2

    const-string v4, "a"

    invoke-virtual {v0, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_2c
    const-string v0, "L"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v3, "d"

    invoke-static {p0, v3}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "videoTitle"

    aget-object v3, v0, v2

    invoke-virtual {p1, p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v1

    const-string p0, "thumbnailUrl"

    const-string v3, ""

    invoke-virtual {p1, p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v3, "thumbImage"

    invoke-virtual {p1, v3, p0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x2

    aput-object p0, v0, v3

    const-string p0, "length"

    const-string v4, "0"

    invoke-virtual {p1, p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :try_start_6b
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v8, "%d:%02d"

    new-array v3, v3, [Ljava/lang/Object;

    const-wide/16 v9, 0x3c

    div-long v11, v5, v9

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v3, v2

    rem-long/2addr v5, v9

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v7, v8, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_8a
    .catch Ljava/lang/NumberFormatException; {:try_start_6b .. :try_end_8a} :catch_8b

    goto :goto_8c

    :catch_8b
    move-exception v1

    :goto_8c
    const/4 v1, 0x3

    aput-object p0, v0, v1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "\u518d\u751f:"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "viewCount"

    invoke-virtual {p1, v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " \u30b3\u30e1:"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "commentCount"

    invoke-virtual {p1, v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " \u30de\u30a4:"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "mylistCount"

    invoke-virtual {p1, v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x4

    aput-object p0, v0, p1

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V
    .registers 11

    .line 25
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    :goto_a
    const-string v3, "v"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_52

    .line 26
    const-string v1, "a"

    invoke-static {p1, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_45

    invoke-static {p2, p0}, Le/e/a/CachedPlayback;->path(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2a

    goto :goto_45

    .line 27
    :cond_2a
    sget-object v1, Le/e/a/CachedPlayback;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/CachedPlayback$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1, v0, p2}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda4;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result p1
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_35} :catch_a7
    .catchall {:try_start_0 .. :try_end_35} :catchall_a5

    .line 28
    if-nez p1, :cond_b8

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_3a
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    goto/16 :goto_b8

    :catchall_42
    move-exception p0

    monitor-exit p1
    :try_end_44
    .catchall {:try_start_3a .. :try_end_44} :catchall_42

    throw p0

    :cond_45
    :goto_45
    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_48
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    .line 26
    return-void

    .line 28
    :catchall_4f
    move-exception p0

    monitor-exit p1
    :try_end_51
    .catchall {:try_start_48 .. :try_end_51} :catchall_4f

    throw p0

    .line 25
    :cond_52
    :try_start_52
    const-string v3, "t"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_98

    const-string v3, "a"

    invoke-static {p1, v3}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_98

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-eqz v3, :cond_7d

    goto :goto_98

    :cond_7d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v3, v1

    const-wide/32 v5, 0x1b7740

    cmp-long v7, v3, v5

    if-gtz v7, :cond_90

    const-wide/16 v3, 0xfa

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_a

    :cond_90
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Cache queue timed out"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_98} :catch_a7
    .catchall {:try_start_52 .. :try_end_98} :catchall_a5

    .line 28
    :cond_98
    :goto_98
    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_9b
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    .line 25
    return-void

    .line 28
    :catchall_a2
    move-exception p0

    monitor-exit p1
    :try_end_a4
    .catchall {:try_start_9b .. :try_end_a4} :catchall_a2

    throw p0

    :catchall_a5
    move-exception p1

    goto :goto_bc

    :catch_a7
    move-exception p1

    :try_start_a8
    const-string p2, "nicoid-cache"

    const-string v0, "Unable to queue background acquisition"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_af
    .catchall {:try_start_a8 .. :try_end_af} :catchall_a5

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_b2
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    :cond_b8
    :goto_b8
    return-void

    :catchall_b9
    move-exception p0

    monitor-exit p1
    :try_end_bb
    .catchall {:try_start_b2 .. :try_end_bb} :catchall_b9

    throw p0

    :goto_bc
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p2

    :try_start_bf
    sget-object v0, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p2
    :try_end_c5
    .catchall {:try_start_bf .. :try_end_c5} :catchall_c6

    throw p1

    :catchall_c6
    move-exception p0

    :try_start_c7
    monitor-exit p2
    :try_end_c8
    .catchall {:try_start_c7 .. :try_end_c8} :catchall_c6

    throw p0
.end method

.method static synthetic lambda$1(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;Landroid/content/Context;)V
    .registers 5

    .line 27
    :try_start_0
    const-string v0, "a"

    invoke-static {p1, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_49
    .catchall {:try_start_0 .. :try_end_a} :catchall_47

    if-eqz p1, :cond_19

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_f
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    return-void

    :catchall_16
    move-exception p0

    monitor-exit p1
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_16

    throw p0

    :cond_19
    :try_start_19
    const-string p1, "v"

    invoke-virtual {p2, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p1
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_24} :catch_49
    .catchall {:try_start_19 .. :try_end_24} :catchall_47

    if-eqz p1, :cond_33

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_29
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    return-void

    :catchall_30
    move-exception p0

    monitor-exit p1
    :try_end_32
    .catchall {:try_start_29 .. :try_end_32} :catchall_30

    throw p0

    :cond_33
    :try_start_33
    invoke-static {p3, p0}, Le/e/a/CachedPlayback;->acquisitionIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-static {p3, p1}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_3a} :catch_49
    .catchall {:try_start_33 .. :try_end_3a} :catchall_47

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_3d
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    goto :goto_5a

    :catchall_44
    move-exception p0

    monitor-exit p1
    :try_end_46
    .catchall {:try_start_3d .. :try_end_46} :catchall_44

    throw p0

    :catchall_47
    move-exception p1

    goto :goto_5e

    :catch_49
    move-exception p1

    :try_start_4a
    const-string p2, "nicoid-cache"

    const-string p3, "Unable to start background acquisition"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_51
    .catchall {:try_start_4a .. :try_end_51} :catchall_47

    sget-object p1, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p1

    :try_start_54
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    :goto_5a
    return-void

    :catchall_5b
    move-exception p0

    monitor-exit p1
    :try_end_5d
    .catchall {:try_start_54 .. :try_end_5d} :catchall_5b

    throw p0

    :goto_5e
    sget-object p2, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    monitor-enter p2

    :try_start_61
    sget-object p3, Le/e/a/CachedPlayback;->REQUESTED:Ljava/util/Set;

    invoke-interface {p3, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p2
    :try_end_67
    .catchall {:try_start_61 .. :try_end_67} :catchall_68

    throw p1

    :catchall_68
    move-exception p0

    :try_start_69
    monitor-exit p2
    :try_end_6a
    .catchall {:try_start_69 .. :try_end_6a} :catchall_68

    throw p0
.end method

.method static synthetic lambda$2(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 35
    :try_start_0
    const-string v0, "e.e.a.ModernComments"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "load"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, p2}, Le/e/a/CachedPlayback;->refresh(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_22

    goto :goto_2a

    :catch_22
    move-exception p0

    const-string p1, "nicoid-cache"

    const-string p2, "Unable to read cached comments"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2a
    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$4(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8

    .line 76
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_5d
    .catchall {:try_start_0 .. :try_end_a} :catchall_5b

    if-eqz v0, :cond_19

    sget-object v0, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    monitor-enter v0

    :try_start_f
    sget-object p1, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_16

    throw p0

    :cond_19
    :try_start_19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "g"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_53

    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->play(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_46} :catch_5d
    .catchall {:try_start_19 .. :try_end_46} :catchall_5b

    :cond_46
    sget-object p1, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    monitor-enter p1

    :try_start_49
    sget-object v0, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    goto :goto_77

    :catchall_50
    move-exception p0

    monitor-exit p1
    :try_end_52
    .catchall {:try_start_49 .. :try_end_52} :catchall_50

    throw p0

    :cond_53
    :try_start_53
    new-instance p1, Ljava/io/IOException;

    const-string v0, "No playable stream"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_5b} :catch_5d
    .catchall {:try_start_53 .. :try_end_5b} :catchall_5b

    :catchall_5b
    move-exception p1

    goto :goto_7b

    :catch_5d
    move-exception p1

    :try_start_5e
    const-string v0, "nicoid-cache"

    const-string v1, "Unable to start streaming cache playback"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string p1, "\u52d5\u753b\u3092\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->status(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_6e
    .catchall {:try_start_5e .. :try_end_6e} :catchall_5b

    sget-object p1, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    monitor-enter p1

    :try_start_71
    sget-object v0, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    :goto_77
    return-void

    :catchall_78
    move-exception p0

    monitor-exit p1
    :try_end_7a
    .catchall {:try_start_71 .. :try_end_7a} :catchall_78

    throw p0

    :goto_7b
    sget-object v0, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    monitor-enter v0

    :try_start_7e
    sget-object v1, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_84
    .catchall {:try_start_7e .. :try_end_84} :catchall_85

    throw p1

    :catchall_85
    move-exception p0

    :try_start_86
    monitor-exit v0
    :try_end_87
    .catchall {:try_start_86 .. :try_end_87} :catchall_85

    throw p0
.end method

.method static synthetic lambda$5(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 78
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    const-string v0, "k"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_1a

    return-void

    :cond_1a
    const-string v0, "x1"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-nez v0, :cond_29

    return-void

    :cond_29
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "loadstatus"

    const-string v2, "id"

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_43

    const/4 p0, 0x0

    goto :goto_47

    :cond_43
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_47
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_67

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5a

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5a
    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_65} :catch_66

    goto :goto_67

    :catch_66
    move-exception p0

    :cond_67
    :goto_67
    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8

    .line 79
    const-string v0, "a"

    :try_start_2
    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_31

    const-string v1, "k"

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string v1, "e.e.a.l3.j"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2f} :catch_30

    goto :goto_31

    :catch_30
    move-exception p0

    :cond_31
    :goto_31
    return-void
.end method

.method static metadata(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v1, 0x0

    :try_start_35
    new-instance v2, Le/e/a/CacheInputStream;

    invoke-direct {v2, v0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_3a
    .catchall {:try_start_35 .. :try_end_3a} :catchall_a0

    const/16 v0, 0x1000

    :try_start_3c
    new-array v0, v0, [B

    :goto_3e
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3
    :try_end_42
    .catchall {:try_start_3c .. :try_end_42} :catchall_9a

    const/4 v4, -0x1

    if-ne v3, v4, :cond_86

    :try_start_45
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_a0

    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :cond_5c
    :goto_5c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_72

    const-string v1, "videoId"

    invoke-virtual {p0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x2

    const-string v1, "nicovideo_version"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object p0

    :cond_72
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5c

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5c

    :cond_86
    :try_start_86
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v4, v3

    const/high16 v5, 0x200000

    if-gt v4, v5, :cond_94

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_3e

    :cond_94
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_9a
    .catchall {:try_start_86 .. :try_end_9a} :catchall_9a

    :catchall_9a
    move-exception p0

    move-object v1, p0

    :try_start_9c
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v1
    :try_end_a0
    .catchall {:try_start_9c .. :try_end_a0} :catchall_a0

    :catchall_a0
    move-exception p0

    if-eqz v1, :cond_a9

    if-eq v1, p0, :cond_a8

    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a8
    move-object p0, v1

    :cond_a9
    throw p0
.end method

.method public static offline(Ljava/lang/Object;)Z
    .registers 7

    .line 74
    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "r"

    invoke-static {p0, v2}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    return v0

    :cond_14
    const-string v1, "d"

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->stream(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2f

    invoke-static {p0, v2}, Le/e/a/CachedPlayback;->play(Ljava/lang/Object;Ljava/lang/String;)V

    return v3

    .line 75
    :cond_2f
    const-string v2, "K"

    invoke-static {p0, v2}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "play_mode"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/CachePlaybackPolicy;->acquire(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4e

    return v0

    .line 76
    :cond_4e
    sget-object v2, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    monitor-enter v2
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_51} :catch_6f

    :try_start_51
    sget-object v4, Le/e/a/CachedPlayback;->WAITING:Ljava/util/Set;

    invoke-interface {v4, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5b

    monitor-exit v2

    return v3

    :cond_5b
    monitor-exit v2
    :try_end_5c
    .catchall {:try_start_51 .. :try_end_5c} :catchall_6c

    :try_start_5c
    new-instance v2, Ljava/lang/Thread;

    new-instance v4, Le/e/a/CachedPlayback$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0, v1}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "nicoid-cache-stream"

    invoke-direct {v2, v4, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_6b} :catch_6f

    return v3

    :catchall_6c
    move-exception p0

    :try_start_6d
    monitor-exit v2
    :try_end_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_6c

    :try_start_6e
    throw p0
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_6f} :catch_6f

    .line 77
    :catch_6f
    move-exception p0

    const-string v1, "nicoid-cache"

    const-string v2, "Unable to prepare cached playback"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static path(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 7
    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    return-object v1

    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_8e

    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->isFile()Z

    move-result v0

    if-nez v0, :cond_4e

    goto :goto_8e

    :cond_4e
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".m3u8"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_78

    goto :goto_7a

    :cond_78
    const-string v2, ".mp4"

    :goto_7a
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Le/e/a/CacheFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CachePlayback;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8e
    :goto_8e
    return-object v1
.end method

.method static play(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    const-string v0, "I"

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "org.apache.http.client.CookieStore"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/4 v5, 0x1

    aput-object v2, v4, v5

    const-string v2, "a"

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v6

    aput-object v0, v2, v5

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static progress(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .line 78
    sget-object v0, Le/e/a/CachedPlayback;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CachedPlayback$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static refresh(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 19

    .line 38
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "nicoid-cache"

    const-string v0, "a"

    :try_start_8
    invoke-static {v1, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    return-void

    :cond_13
    const-string v4, "K"

    invoke-static {v1, v4}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    invoke-static {v4}, Le/e/a/CachedPlayback;->refreshAllowed(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_26

    return-void

    .line 39
    :cond_26
    invoke-static {v1, v4}, Le/e/a/CachedPlayback;->refreshModel(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "r"

    invoke-static {v5, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/String;

    const-string v8, "n"

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-string v8, "I"

    const/4 v10, 0x1

    aput-object v8, v7, v10

    const/4 v8, 0x0

    :goto_43
    if-lt v8, v6, :cond_149

    .line 41
    const-string v7, "e.e.a.ModernPlayback"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "watch"

    new-array v11, v6, [Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    aput-object v12, v11, v9

    const-class v12, Ljava/lang/String;

    aput-object v12, v11, v10

    invoke-virtual {v7, v8, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 42
    new-array v11, v6, [Ljava/lang/Object;

    aput-object v5, v11, v9

    aput-object v2, v11, v10

    const/4 v12, 0x0

    invoke-virtual {v8, v12, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    if-eqz v8, :cond_148

    invoke-static/range {p0 .. p2}, Le/e/a/CachedPlayback;->current(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_77

    goto/16 :goto_148

    .line 43
    :cond_77
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v13, "b"

    new-array v14, v10, [Ljava/lang/Class;

    const-class v15, Ljava/lang/String;

    aput-object v15, v14, v9

    invoke-virtual {v11, v13, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    new-array v13, v10, [Ljava/lang/Object;

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v9

    invoke-virtual {v11, v5, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/Bundle;

    .line 44
    const-string v11, "fillDescription"

    new-array v13, v6, [Ljava/lang/Class;

    const-class v14, Lorg/json/JSONObject;

    aput-object v14, v13, v9

    const-class v14, Landroid/os/Bundle;

    aput-object v14, v13, v10

    invoke-virtual {v7, v11, v13}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v13, v6, [Ljava/lang/Object;

    aput-object v8, v13, v9

    aput-object v5, v13, v10

    invoke-virtual {v11, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const-string v11, "nicovideo_version"

    invoke-virtual {v5, v11, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v6, "videoId"

    invoke-virtual {v5, v6, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "flvUrl"

    move-object/from16 v11, p2

    invoke-virtual {v5, v6, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-static/range {p0 .. p2}, Le/e/a/CachedPlayback;->current(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_c9

    return-void

    :cond_c9
    const-string v6, "modernWatch"

    invoke-static {v1, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v1, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v6, "m"

    invoke-static {v1, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v6, "l"

    invoke-static {v1, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    invoke-static {v5}, Le/e/a/HistorySupport;->rememberCached(Landroid/os/Bundle;)V

    const-string v6, "k"

    invoke-static {v1, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_10a

    const-string v13, "e.e.a.l3.j"

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    new-array v14, v10, [Ljava/lang/Class;

    const-class v15, Landroid/os/Bundle;

    aput-object v15, v14, v9

    invoke-virtual {v13, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v13, v10, [Ljava/lang/Object;

    aput-object v5, v13, v9

    invoke-virtual {v0, v6, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10a
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_10a} :catch_160

    .line 48
    :cond_10a
    :try_start_10a
    const-string v0, "latestWatch"

    invoke-virtual {v7, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v12, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_113
    .catch Ljava/lang/NoSuchFieldException; {:try_start_10a .. :try_end_113} :catch_114
    .catch Ljava/lang/Exception; {:try_start_10a .. :try_end_113} :catch_160

    goto :goto_115

    :catch_114
    move-exception v0

    .line 49
    :goto_115
    :try_start_115
    invoke-static {v4, v2, v5}, Le/e/a/CachedPlayback;->saveMetadata(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_118
    .catch Ljava/lang/Exception; {:try_start_115 .. :try_end_118} :catch_119

    goto :goto_120

    :catch_119
    move-exception v0

    move-object v5, v0

    :try_start_11b
    const-string v0, "Unable to save refreshed metadata"

    invoke-static {v3, v0, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    :goto_120
    invoke-static/range {p0 .. p2}, Le/e/a/CachedPlayback;->current(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_181

    invoke-static {v4}, Le/e/a/CachedPlayback;->refreshAllowed(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_181

    const-string v0, "e.e.a.ModernComments"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "load"

    new-array v4, v10, [Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v10, [Ljava/lang/Object;

    aput-object v1, v2, v9

    invoke-virtual {v0, v12, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    goto :goto_181

    .line 42
    :cond_148
    :goto_148
    return-void

    .line 40
    :cond_149
    move-object/from16 v11, p2

    aget-object v12, v7, v8

    invoke-static {v5, v12}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    invoke-static {v1, v12}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v13, v5, v12}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_15c
    .catch Ljava/lang/Exception; {:try_start_11b .. :try_end_15c} :catch_160

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_43

    .line 51
    :catch_160
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Metadata refresh unavailable; saved information retained ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_181
    :goto_181
    return-void
.end method

.method static refreshAllowed(Landroid/content/Context;)Z
    .registers 8

    .line 52
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cache_offline"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_16

    return v2

    :cond_16
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_20

    return v1

    :cond_20
    :try_start_20
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "e.e.a.v0"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "g"

    new-array v5, v1, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v5, v2

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v2

    const/4 p0, 0x0

    invoke-virtual {v3, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_41} :catch_42

    return p0

    :catch_42
    move-exception p0

    return v2
.end method

.method static refreshModel(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 55
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    if-ne p0, p1, :cond_18

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->run()V

    goto :goto_20

    :cond_18
    sget-object p0, Le/e/a/CachedPlayback;->MAIN:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result p0

    if-eqz p0, :cond_3e

    .line 56
    :goto_20
    const/4 p0, 0x0

    :try_start_21
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p1
    :try_end_29
    .catchall {:try_start_21 .. :try_end_29} :catchall_33

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->isDone()Z

    move-result v1

    if-nez v1, :cond_32

    invoke-virtual {v0, p0}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    :cond_32
    return-object p1

    :catchall_33
    move-exception p1

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->isDone()Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v0, p0}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    :cond_3d
    throw p1

    .line 55
    :cond_3e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "UI unavailable"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static declared-synchronized saveMetadata(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Le/e/a/CachedPlayback;

    monitor-enter v0

    .line 62
    :try_start_3
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1, p2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    const-string p2, "cookie"

    invoke-virtual {v1, p2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string p2, "sessionRequest"

    invoke-virtual {v1, p2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string p2, "flvUrl"

    invoke-virtual {v1, p2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "cacheAcquiredAt"

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->acquiredAt(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "informationUpdatedAt"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const-string p2, "e.e.a.v0"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    const-string v2, "a"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/os/Bundle;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {p2, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v1, v2, v6

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 65
    new-instance v2, Le/e/a/CacheFile;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".json"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Le/e/a/CacheFile;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ".json.part"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v7, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ".json.backup"

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v5, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_af
    .catchall {:try_start_3 .. :try_end_af} :catchall_12f

    .line 66
    :try_start_af
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result p0
    :try_end_b3
    .catchall {:try_start_af .. :try_end_b3} :catchall_11c

    if-nez p0, :cond_114

    :try_start_b5
    new-instance p0, Le/e/a/CacheOutputStream;

    invoke-direct {p0, v4, v6}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_ba
    .catchall {:try_start_b5 .. :try_end_ba} :catchall_10a

    :try_start_ba
    const-string p1, "UTF-8"

    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_c3
    .catchall {:try_start_ba .. :try_end_c3} :catchall_104

    :try_start_c3
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_c6
    .catchall {:try_start_c3 .. :try_end_c6} :catchall_10a

    .line 67
    :try_start_c6
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_dc

    invoke-virtual {v2, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_d4

    const/4 p0, 0x1

    goto :goto_dd

    :cond_d4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot back up metadata"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_dc
    .catchall {:try_start_c6 .. :try_end_dc} :catchall_11c

    :cond_dc
    const/4 p0, 0x0

    .line 68
    :goto_dd
    :try_start_dd
    invoke-virtual {v4, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1
    :try_end_e1
    .catchall {:try_start_dd .. :try_end_e1} :catchall_100

    if-eqz p1, :cond_f8

    if-eqz p0, :cond_ed

    :try_start_e5
    invoke-virtual {v5}, Ljava/io/File;->delete()Z
    :try_end_e8
    .catchall {:try_start_e5 .. :try_end_e8} :catchall_e9

    .line 69
    goto :goto_ed

    :catchall_e9
    move-exception p1

    move v6, p0

    move-object p0, p1

    goto :goto_11e

    :cond_ed
    :goto_ed
    :try_start_ed
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_f6

    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_f6
    .catchall {:try_start_ed .. :try_end_f6} :catchall_12f

    .line 70
    :cond_f6
    monitor-exit v0

    return-void

    .line 68
    :cond_f8
    :try_start_f8
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Cannot install metadata"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_100
    .catchall {:try_start_f8 .. :try_end_100} :catchall_100

    .line 69
    :catchall_100
    move-exception p1

    move v6, p0

    move-object p0, p1

    goto :goto_11d

    .line 66
    :catchall_104
    move-exception p1

    move-object v1, p1

    :try_start_106
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    throw v1
    :try_end_10a
    .catchall {:try_start_106 .. :try_end_10a} :catchall_10a

    :catchall_10a
    move-exception p0

    if-eqz v1, :cond_113

    if-eq v1, p0, :cond_112

    :try_start_10f
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_112
    move-object p0, v1

    :cond_113
    :goto_113
    throw p0

    :cond_114
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Previous metadata backup retained"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_11b
    .catchall {:try_start_10f .. :try_end_11b} :catchall_11c

    goto :goto_113

    .line 69
    :catchall_11c
    move-exception p0

    :goto_11d
    const/4 v3, 0x0

    :goto_11e
    if-nez v3, :cond_125

    if-eqz v6, :cond_125

    :try_start_122
    invoke-virtual {v5, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_125
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_12e

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    :cond_12e
    throw p0
    :try_end_12f
    .catchall {:try_start_122 .. :try_end_12f} :catchall_12f

    .line 61
    :catchall_12f
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static status(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .line 79
    sget-object v0, Le/e/a/CachedPlayback;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CachedPlayback$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static stream(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 13

    .line 34
    const-string v0, "a"

    const-string v1, "modernCommentsRequested"

    const/4 v2, 0x0

    :try_start_5
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v4, "r"

    invoke-static {p0, v4}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    return-object v2

    :cond_18
    const-string v3, "K"

    invoke-static {p0, v3}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Le/e/a/CachedPlayback;->path(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2f

    return-object v2

    :cond_2f
    invoke-static {v3, p1}, Le/e/a/CachedPlayback;->metadata(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v3}, Le/e/a/HistorySupport;->rememberCached(Landroid/os/Bundle;)V

    const-string v5, "flvUrl"

    invoke-virtual {v3, v5, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "m"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "l"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "G"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "modernWatch"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "b"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_74

    const-string v6, "d"

    invoke-static {v5, v6}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_74
    invoke-static {p0, v3}, Le/e/a/CachedPlayback;->initializeMetadata(Ljava/lang/Object;Landroid/os/Bundle;)V

    const-string v5, "k"

    invoke-static {p0, v5}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 35
    const/4 v6, 0x1

    if-eqz v5, :cond_a6

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a6

    const-string v7, "e.e.a.l3.j"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/os/Bundle;

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-virtual {v7, v0, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v7, v6, [Ljava/lang/Object;

    aput-object v3, v7, v10

    invoke-virtual {v0, v5, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a6
    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c6

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v6}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/CachedPlayback$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, v4}, Le/e/a/CachedPlayback$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "nicoid-cached-comments"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_c6} :catch_c7

    :cond_c6
    return-object v4

    :catch_c7
    move-exception p0

    const-string p1, "nicoid-cache"

    const-string v0, "Unable to restore cached video"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method
