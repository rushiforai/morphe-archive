.class public final Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;
.super Lnicoid/network238/okhttp3/ResponseBody;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u00012\u00020\u0002B\u0019\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\n\u0010\t\u001a\u0004\u0018\u00010\u0004H\u0016J\u0008\u0010\u0005\u001a\u00020\u0006H\u0016J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u0018\u0010\u000c\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0006H\u0016J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "Lnicoid/network238/okio/Source;",
        "mediaType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/MediaType;J)V",
        "contentType",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
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
.field private final contentLength:J

.field private final mediaType:Lnicoid/network238/okhttp3/MediaType;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/MediaType;J)V
    .registers 4

    .line 26
    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;-><init>()V

    .line 27
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;->mediaType:Lnicoid/network238/okhttp3/MediaType;

    .line 28
    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;->contentLength:J

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    return-void
.end method

.method public contentLength()J
    .registers 3

    .line 33
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;->contentLength:J

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 31
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;->mediaType:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unreadable ResponseBody! These Response objects have bodies that are stripped:\n * Response.cacheResponse\n * Response.networkResponse\n * Response.priorResponse\n * EventSourceListener\n * WebSocketListener\n(It is safe to call contentType() and contentLength() on these response bodies.)"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public source()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 35
    invoke-static {p0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    return-object v0
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 53
    sget-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method
