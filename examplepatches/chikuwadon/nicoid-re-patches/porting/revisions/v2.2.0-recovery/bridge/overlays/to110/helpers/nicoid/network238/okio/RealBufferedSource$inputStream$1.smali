.class public final Lnicoid/network238/okio/RealBufferedSource$inputStream$1;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/RealBufferedSource;->inputStream()Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J \u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0003H\u0016J\u0008\u0010\u0008\u001a\u00020\u0003H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016\u00a8\u0006\u0011"
    }
    d2 = {
        "nicoid/network238/okio/RealBufferedSource$inputStream$1",
        "Ljava/io/InputStream;",
        "read",
        "",
        "data",
        "",
        "offset",
        "byteCount",
        "available",
        "close",
        "",
        "toString",
        "",
        "transferTo",
        "",
        "out",
        "Ljava/io/OutputStream;",
        "okio"
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
.field final synthetic this$0:Lnicoid/network238/okio/RealBufferedSource;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/RealBufferedSource;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 154
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public available()I
    .registers 5

    .line 177
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-boolean v1, v0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v1, :cond_0

    .line 215
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 178
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 216
    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0

    .line 177
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .registers 2

    .line 181
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSource;->close()V

    return-void
.end method

.method public read()I
    .registers 5

    .line 156
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-boolean v1, v0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v1, :cond_1

    .line 208
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 157
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-object v1, v0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 209
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 158
    const-wide/16 v2, 0x2000

    invoke-interface {v1, v0, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 161
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 210
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 161
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 156
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([BII)I
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-boolean v0, v0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_1

    .line 166
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 168
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 212
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 168
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 169
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-object v1, v0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 213
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 169
    const-wide/16 v2, 0x2000

    invoke-interface {v1, v0, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 173
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 214
    iget-object v0, v0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 173
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result p1

    return p1

    .line 165
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".inputStream()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transferTo(Ljava/io/OutputStream;)J
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-boolean v0, v0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_1

    const-wide/16 v0, 0x0

    move-wide v2, v0

    .line 189
    :goto_0
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 217
    iget-object v4, v4, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 189
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v4, v4, v0

    if-nez v4, :cond_0

    .line 190
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    iget-object v5, v4, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 218
    iget-object v4, v4, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 190
    const-wide/16 v6, 0x2000

    invoke-interface {v5, v4, v6, v7}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    return-wide v2

    .line 193
    :cond_0
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 219
    iget-object v4, v4, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 193
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 194
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;->this$0:Lnicoid/network238/okio/RealBufferedSource;

    .line 220
    iget-object v5, v4, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 194
    const-wide/16 v7, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x0

    move-object v6, p1

    invoke-static/range {v5 .. v10}, Lnicoid/network238/okio/Buffer;->writeTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JILjava/lang/Object;)Lnicoid/network238/okio/Buffer;

    goto :goto_0

    .line 186
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
