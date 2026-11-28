.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContinuationSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000e\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0018\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0016H\u0016J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016J\u0008\u0010\u001c\u001a\u00020\u001dH\u0016J\u0008\u0010\u001e\u001a\u00020\u001dH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\t\"\u0004\u0008\u000e\u0010\u000bR\u001a\u0010\u000f\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\t\"\u0004\u0008\u0011\u0010\u000bR\u001a\u0010\u0012\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0013\u0010\t\"\u0004\u0008\u0014\u0010\u000b\u00a8\u0006\u001f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;)V",
        "flags",
        "",
        "getFlags",
        "()I",
        "setFlags",
        "(I)V",
        "streamId",
        "getStreamId",
        "setStreamId",
        "left",
        "getLeft",
        "setLeft",
        "padding",
        "getPadding",
        "setPadding",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "",
        "readContinuationHeader",
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
.field private flags:I

.field private left:I

.field private padding:I

.field private final source:Lnicoid/network238/okio/BufferedSource;

.field private streamId:I


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 404
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    return-void
.end method

.method private final readContinuationHeader()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 439
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    .line 441
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->readMedium(Lnicoid/network238/okio/BufferedSource;)I

    move-result v5

    .line 442
    iput v5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    .line 443
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v1

    const/16 v2, 0xff

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v6

    .line 444
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v1

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:I

    .line 445
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;->getLogger()Ljava/util/logging/Logger;

    move-result-object v2

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;->getLogger()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    iget v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    iget v7, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:I

    const/4 v3, 0x1

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLog(ZIIII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 446
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v1

    const v2, 0x7fffffff

    and-int/2addr v1, v2

    iput v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    const/16 v2, 0x9

    if-ne v6, v2, :cond_2

    if-ne v1, v0, :cond_1

    return-void

    .line 448
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TYPE_CONTINUATION streamId changed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 447
    :cond_2
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " != TYPE_CONTINUATION"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public final getFlags()I
    .registers 2

    .line 406
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:I

    return v0
.end method

.method public final getLeft()I
    .registers 2

    .line 409
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    return v0
.end method

.method public final getPadding()I
    .registers 2

    .line 410
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->padding:I

    return v0
.end method

.method public final getStreamId()I
    .registers 2

    .line 407
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    return v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 417
    :goto_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    .line 425
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    const-wide/16 v2, -0x1

    if-nez v0, :cond_1

    .line 418
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->padding:I

    int-to-long v4, v0

    invoke-interface {v1, v4, v5}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 419
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->padding:I

    .line 420
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    goto :goto_1

    .line 421
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->readContinuationHeader()V

    goto :goto_0

    :cond_1
    int-to-long v4, v0

    .line 425
    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-interface {v1, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    cmp-long p3, p1, v2

    if-nez p3, :cond_2

    :goto_1
    return-wide v2

    .line 427
    :cond_2
    iget p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    long-to-int v0, p1

    sub-int/2addr p3, v0

    iput p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    return-wide p1
.end method

.method public final setFlags(I)V
    .registers 2

    .line 406
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:I

    return-void
.end method

.method public final setLeft(I)V
    .registers 2

    .line 409
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    return-void
.end method

.method public final setPadding(I)V
    .registers 2

    .line 410
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->padding:I

    return-void
.end method

.method public final setStreamId(I)V
    .registers 2

    .line 407
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 431
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method
