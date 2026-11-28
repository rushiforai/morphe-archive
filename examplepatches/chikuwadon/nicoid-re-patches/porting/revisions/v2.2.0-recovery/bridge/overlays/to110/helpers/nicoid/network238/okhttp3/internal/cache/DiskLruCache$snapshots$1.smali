.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->snapshots()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        ">;",
        "Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000-\n\u0000\n\u0002\u0010)\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u000c\u0012\u0008\u0012\u00060\u0002R\u00020\u00030\u0001J\t\u0010\n\u001a\u00020\u000bH\u0096\u0002J\r\u0010\u000c\u001a\u00060\u0002R\u00020\u0003H\u0096\u0002J\u0008\u0010\r\u001a\u00020\u000eH\u0016R.\u0010\u0004\u001a\"\u0012\u001e\u0012\u001c \u0007*\r\u0018\u00010\u0005R\u00020\u0003\u00a2\u0006\u0002\u0008\u00060\u0005R\u00020\u0003\u00a2\u0006\u0002\u0008\u00060\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0008\u0018\u00010\u0002R\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0018\u00010\u0002R\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1",
        "",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "delegate",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
        "Lnicoid/network238/kotlin/jvm/internal/EnhancedNullability;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "nextSnapshot",
        "removeSnapshot",
        "hasNext",
        "",
        "next",
        "remove",
        "",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final delegate:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private nextSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

.field private removeSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    .line 794
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 796
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getLruEntries$okhttp()Ljava/util/LinkedHashMap;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->delegate:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 5

    .line 805
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->nextSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 807
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 809
    :try_start_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getClosed$okhttp()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 807
    goto :goto_0

    .line 811
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->delegate:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 812
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->delegate:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->snapshot$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v2

    if-eqz v2, :cond_1

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->nextSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 807
    monitor-exit v0

    return v1

    .line 815
    :cond_2
    :try_start_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 807
    :goto_0
    monitor-exit v0

    return v3

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 794
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->next()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v0

    return-object v0
.end method

.method public next()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    .registers 3

    .line 821
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 822
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->nextSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->removeSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    .line 823
    const/4 v1, 0x0

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->nextSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    .line 824
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    .line 821
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .registers 4

    .line 828
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->removeSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    if-eqz v0, :cond_0

    .line 831
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->key()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->remove(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 836
    :goto_0
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->removeSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    return-void

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;->removeSnapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 829
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "remove() before next()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
