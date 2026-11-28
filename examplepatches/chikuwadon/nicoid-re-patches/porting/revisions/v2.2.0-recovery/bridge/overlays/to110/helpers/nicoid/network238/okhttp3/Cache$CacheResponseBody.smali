.class final Lnicoid/network238/okhttp3/Cache$CacheResponseBody;
.super Lnicoid/network238/okhttp3/ResponseBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CacheResponseBody"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\'\u0012\n\u0010\u0002\u001a\u00060\u0003R\u00020\u0004\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\n\u0010\u0005\u001a\u0004\u0018\u00010\u000eH\u0016J\u0008\u0010\u0007\u001a\u00020\u000fH\u0016J\u0008\u0010\u0010\u001a\u00020\rH\u0016R\u0015\u0010\u0002\u001a\u00060\u0003R\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cache$CacheResponseBody;",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "snapshot",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "contentType",
        "",
        "contentLength",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V",
        "getSnapshot",
        "()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "bodySource",
        "Lnicoid/network238/okio/BufferedSource;",
        "Lnicoid/network238/okhttp3/MediaType;",
        "",
        "source",
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
.field private final bodySource:Lnicoid/network238/okio/BufferedSource;

.field private final contentLength:Ljava/lang/String;

.field private final contentType:Ljava/lang/String;

.field private final snapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 714
    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;-><init>()V

    .line 715
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->snapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    .line 716
    iput-object p2, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->contentType:Ljava/lang/String;

    .line 717
    iput-object p3, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->contentLength:Ljava/lang/String;

    .line 722
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->getSource(I)Lnicoid/network238/okio/Source;

    move-result-object p1

    .line 724
    new-instance p2, Lnicoid/network238/okhttp3/Cache$CacheResponseBody$1;

    invoke-direct {p2, p1, p0}, Lnicoid/network238/okhttp3/Cache$CacheResponseBody$1;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okhttp3/Cache$CacheResponseBody;)V

    .line 730
    invoke-static {p2}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    .line 723
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->bodySource:Lnicoid/network238/okio/BufferedSource;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 4

    .line 735
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->contentLength:Ljava/lang/String;

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toLongOrDefault(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    :cond_0
    return-wide v1
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 3

    .line 733
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->contentType:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v1, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getSnapshot()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    .registers 2

    .line 715
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->snapshot:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    return-object v0
.end method

.method public source()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 737
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->bodySource:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method
