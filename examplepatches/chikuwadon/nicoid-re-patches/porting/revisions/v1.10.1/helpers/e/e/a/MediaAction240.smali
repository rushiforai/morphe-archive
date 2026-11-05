.class public final Le/e/a/MediaAction240;
.super Ljava/lang/Object;
.source "MediaAction240.java"


# static fields
.field private static final TOKENS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized forget(Ljava/lang/Object;)V
    .registers 3

    const-class v0, Le/e/a/MediaAction240;

    monitor-enter v0

    .line 19
    :try_start_3
    sget-object v1, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    monitor-exit v0

    return-void

    .line 19
    :catchall_a
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized sign(Ljava/lang/Object;Landroid/content/Intent;)Landroid/content/Intent;
    .registers 5

    const-class v0, Le/e/a/MediaAction240;

    monitor-enter v0

    .line 11
    :try_start_3
    sget-object v1, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 12
    if-nez v1, :cond_1a

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    :cond_1a
    const-string p0, "nicoid_media_nonce"

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_22

    monitor-exit v0

    return-object p0

    .line 10
    :catchall_22
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized valid(Ljava/lang/Object;Landroid/content/Intent;)Z
    .registers 4

    const-class v0, Le/e/a/MediaAction240;

    monitor-enter v0

    .line 16
    if-eqz p1, :cond_27

    :try_start_5
    sget-object v1, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 17
    sget-object v1, Le/e/a/MediaAction240;->TOKENS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v1, "nicoid_media_nonce"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_24

    if-eqz p0, :cond_27

    .line 16
    monitor-exit v0

    const/4 p0, 0x1

    return p0

    .line 15
    :catchall_24
    move-exception p0

    monitor-exit v0

    throw p0

    .line 16
    :cond_27
    monitor-exit v0

    const/4 p0, 0x0

    return p0
.end method
