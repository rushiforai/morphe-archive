.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->newSource(I)Lnicoid/network238/okio/Source;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1",
        "Lnicoid/network238/okio/ForwardingSource;",
        "closed",
        "",
        "close",
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
.field private closed:Z

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

.field final synthetic this$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V
    .registers 4

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->this$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 1079
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 1083
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSource;->close()V

    .line 1084
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->closed:Z

    if-nez v0, :cond_1

    .line 1085
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->closed:Z

    .line 1086
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;->this$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    monitor-enter v0

    .line 1087
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLockingSourceCount$okhttp()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setLockingSourceCount$okhttp(I)V

    .line 1088
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLockingSourceCount$okhttp()I

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getZombie$okhttp()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1089
    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z

    .line 1091
    :cond_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1086
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :cond_1
    return-void
.end method
