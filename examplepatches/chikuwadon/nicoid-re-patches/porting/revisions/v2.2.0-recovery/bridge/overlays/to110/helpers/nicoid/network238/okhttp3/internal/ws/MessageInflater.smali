.class public final Lnicoid/network238/okhttp3/internal/ws/MessageInflater;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0007J\u0008\u0010\u000f\u001a\u00020\rH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/MessageInflater;",
        "Ljava/io/Closeable;",
        "noContextTakeover",
        "",
        "<init>",
        "(Z)V",
        "deflatedBytes",
        "Lnicoid/network238/okio/Buffer;",
        "inflater",
        "Ljava/util/zip/Inflater;",
        "inflaterSource",
        "Lnicoid/network238/okio/InflaterSource;",
        "inflate",
        "",
        "buffer",
        "close",
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
.field private final deflatedBytes:Lnicoid/network238/okio/Buffer;

.field private inflater:Ljava/util/zip/Inflater;

.field private inflaterSource:Lnicoid/network238/okio/InflaterSource;

.field private final noContextTakeover:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->noContextTakeover:Z

    .line 29
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/okio/InflaterSource;->close()V

    .line 75
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    .line 76
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflater:Ljava/util/zip/Inflater;

    return-void
.end method

.method public final inflate(Lnicoid/network238/okio/Buffer;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_5

    .line 41
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflater:Ljava/util/zip/Inflater;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflater:Ljava/util/zip/Inflater;

    .line 44
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    if-nez v1, :cond_1

    .line 45
    new-instance v1, Lnicoid/network238/okio/InflaterSource;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-direct {v1, v2, v0}, Lnicoid/network238/okio/InflaterSource;-><init>(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    .line 47
    :cond_1
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->noContextTakeover:Z

    if-eqz v2, :cond_2

    .line 48
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->reset()V

    .line 51
    :cond_2
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2, p1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 52
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    const v3, 0xffff

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 54
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v2

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    add-long/2addr v2, v4

    :goto_0
    nop

    .line 59
    const-wide v4, 0x7fffffffffffffffL

    invoke-virtual {v1, p1, v4, v5}, Lnicoid/network238/okio/InflaterSource;->readOrInflate(Lnicoid/network238/okio/Buffer;J)J

    .line 60
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v4

    cmp-long v4, v4, v2

    if-gez v4, :cond_3

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v4

    cmp-long p1, v4, v2

    if-gez p1, :cond_4

    .line 65
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->clear()V

    .line 66
    invoke-virtual {v1}, Lnicoid/network238/okio/InflaterSource;->close()V

    .line 67
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    .line 68
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflater:Ljava/util/zip/Inflater;

    :cond_4
    return-void

    .line 38
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
