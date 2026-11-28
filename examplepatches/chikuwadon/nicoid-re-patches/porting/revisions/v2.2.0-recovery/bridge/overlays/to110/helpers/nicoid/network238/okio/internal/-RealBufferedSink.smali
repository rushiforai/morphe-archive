.class public final Lnicoid/network238/okio/internal/-RealBufferedSink;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000H\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u001d\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0080\u0008\u001a\u0015\u0010\u0000\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0008\u001a\u00020\tH\u0080\u0008\u001a%\u0010\u0000\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u000c\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\r\u001a\u00020\u000eH\u0080\u0008\u001a%\u0010\u000c\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u0011\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0012\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u0000\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0013H\u0080\u0008\u001a%\u0010\u0000\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u0014\u001a\u00020\u0006*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0015H\u0080\u0008\u001a\u001d\u0010\u0000\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00152\u0006\u0010\u0005\u001a\u00020\u0006H\u0080\u0008\u001a\u0015\u0010\u0016\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0017\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u0018\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u001a\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u001b\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u001d\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u000bH\u0080\u0008\u001a\u0015\u0010\u001e\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001f\u001a\u00020\u0006H\u0080\u0008\u001a\u0015\u0010 \u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001f\u001a\u00020\u0006H\u0080\u0008\u001a\u0015\u0010!\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001f\u001a\u00020\u0006H\u0080\u0008\u001a\u0015\u0010\"\u001a\u00020\u0007*\u00020\u00022\u0006\u0010\u001f\u001a\u00020\u0006H\u0080\u0008\u001a\r\u0010#\u001a\u00020\u0007*\u00020\u0002H\u0080\u0008\u001a\r\u0010$\u001a\u00020\u0007*\u00020\u0002H\u0080\u0008\u001a\r\u0010%\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\r\u0010&\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\r\u0010\'\u001a\u00020(*\u00020\u0002H\u0080\u0008\u001a\r\u0010)\u001a\u00020\u000e*\u00020\u0002H\u0080\u0008\u00a8\u0006*"
    }
    d2 = {
        "commonWrite",
        "",
        "Lnicoid/network238/okio/RealBufferedSink;",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "Lnicoid/network238/okio/BufferedSink;",
        "byteString",
        "Lnicoid/network238/okio/ByteString;",
        "offset",
        "",
        "commonWriteUtf8",
        "string",
        "",
        "beginIndex",
        "endIndex",
        "commonWriteUtf8CodePoint",
        "codePoint",
        "",
        "commonWriteAll",
        "Lnicoid/network238/okio/Source;",
        "commonWriteByte",
        "b",
        "commonWriteShort",
        "s",
        "commonWriteShortLe",
        "commonWriteInt",
        "i",
        "commonWriteIntLe",
        "commonWriteLong",
        "v",
        "commonWriteLongLe",
        "commonWriteDecimalLong",
        "commonWriteHexadecimalUnsignedLong",
        "commonEmitCompleteSegments",
        "commonEmit",
        "commonFlush",
        "commonClose",
        "commonTimeout",
        "Lnicoid/network238/okio/Timeout;",
        "commonToString",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final commonClose(Lnicoid/network238/okio/RealBufferedSink;)V
    .registers 8
    .param p0, "$this$commonClose"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 192
    .local v0, "$i$f$commonClose":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-eqz v1, :cond_0

    return-void

    .line 196
    :cond_0
    const/4 v1, 0x0

    .line 197
    .local v1, "thrown":Ljava/lang/Throwable;
    nop

    .line 198
    move-object v2, p0

    .local v2, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v3, 0x0

    .line 246
    .local v3, "$i$f$getBuffer":I
    :try_start_0
    iget-object v4, v2, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 198
    .end local v2    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v3    # "$i$f$getBuffer":I
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 199
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    move-object v3, p0

    .local v3, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v4, 0x0

    .line 247
    .local v4, "$i$f$getBuffer":I
    iget-object v5, v3, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 199
    .end local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v4    # "$i$f$getBuffer":I
    move-object v3, p0

    .restart local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v4, 0x0

    .line 247
    .restart local v4    # "$i$f$getBuffer":I
    iget-object v6, v3, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 199
    .end local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v4    # "$i$f$getBuffer":I
    invoke-virtual {v6}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-interface {v2, v5, v3, v4}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 201
    :catchall_0
    move-exception v2

    .line 202
    .local v2, "e":Ljava/lang/Throwable;
    move-object v1, v2

    .line 205
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_1
    :goto_0
    nop

    .line 206
    :try_start_1
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 207
    :catchall_1
    move-exception v2

    .line 208
    .restart local v2    # "e":Ljava/lang/Throwable;
    if-nez v1, :cond_2

    move-object v1, v2

    .line 211
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_2
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    .line 213
    if-nez v1, :cond_3

    .line 214
    return-void

    .line 213
    :cond_3
    throw v1
.end method

.method public static final commonEmit(Lnicoid/network238/okio/RealBufferedSink;)Lnicoid/network238/okio/BufferedSink;
    .registers 7
    .param p0, "$this$commonEmit"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 177
    .local v0, "$i$f$commonEmit":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_1

    .line 178
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 242
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 178
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 179
    .local v1, "byteCount":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    move-object v4, p0

    .local v4, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v5, 0x0

    .line 243
    .local v5, "$i$f$getBuffer":I
    iget-object v4, v4, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 179
    .end local v4    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v5    # "$i$f$getBuffer":I
    invoke-interface {v3, v4, v1, v2}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 180
    :cond_0
    move-object v3, p0

    check-cast v3, Lnicoid/network238/okio/BufferedSink;

    return-object v3

    .line 220
    .end local v1    # "byteCount":J
    :cond_1
    const/4 v1, 0x0

    .line 177
    .local v1, "$i$a$-check--RealBufferedSink$commonEmit$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonEmit$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonEmitCompleteSegments(Lnicoid/network238/okio/RealBufferedSink;)Lnicoid/network238/okio/BufferedSink;
    .registers 7
    .param p0, "$this$commonEmitCompleteSegments"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 170
    .local v0, "$i$f$commonEmitCompleteSegments":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_1

    .line 171
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 240
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 171
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->completeSegmentByteCount()J

    move-result-wide v1

    .line 172
    .local v1, "byteCount":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    move-object v4, p0

    .local v4, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v5, 0x0

    .line 241
    .local v5, "$i$f$getBuffer":I
    iget-object v4, v4, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 172
    .end local v4    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v5    # "$i$f$getBuffer":I
    invoke-interface {v3, v4, v1, v2}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 173
    :cond_0
    move-object v3, p0

    check-cast v3, Lnicoid/network238/okio/BufferedSink;

    return-object v3

    .line 220
    .end local v1    # "byteCount":J
    :cond_1
    const/4 v1, 0x0

    .line 170
    .local v1, "$i$a$-check--RealBufferedSink$commonEmitCompleteSegments$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonEmitCompleteSegments$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonFlush(Lnicoid/network238/okio/RealBufferedSink;)V
    .registers 6
    .param p0, "$this$commonFlush"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 184
    .local v0, "$i$f$commonFlush":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_1

    .line 185
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 244
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 185
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 186
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    move-object v2, p0

    .local v2, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v3, 0x0

    .line 245
    .local v3, "$i$f$getBuffer":I
    iget-object v2, v2, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 186
    .end local v2    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v3    # "$i$f$getBuffer":I
    move-object v3, p0

    .local v3, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v4, 0x0

    .line 245
    .local v4, "$i$f$getBuffer":I
    iget-object v3, v3, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 186
    .end local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v4    # "$i$f$getBuffer":I
    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 188
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->flush()V

    .line 189
    return-void

    .line 220
    :cond_1
    const/4 v1, 0x0

    .line 184
    .local v1, "$i$a$-check--RealBufferedSink$commonFlush$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonFlush$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonTimeout(Lnicoid/network238/okio/RealBufferedSink;)Lnicoid/network238/okio/Timeout;
    .registers 3
    .param p0, "$this$commonTimeout"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 216
    .local v0, "$i$f$commonTimeout":I
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    return-object v1
.end method

.method public static final commonToString(Lnicoid/network238/okio/RealBufferedSink;)Ljava/lang/String;
    .registers 4
    .param p0, "$this$commonToString"    # Lnicoid/network238/okio/RealBufferedSink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 218
    .local v0, "$i$f$commonToString":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "buffer("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "byteString"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "byteString"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 40
    .local v0, "$i$f$commonWrite":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 41
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 222
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 41
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 42
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 40
    .local v1, "$i$a$-check--RealBufferedSink$commonWrite$2":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWrite$2":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/BufferedSink;
    .registers 7
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "byteString"    # Lnicoid/network238/okio/ByteString;
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "byteString"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 50
    .local v0, "$i$f$commonWrite":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 51
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 223
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 51
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;

    .line 52
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 50
    .local v1, "$i$a$-check--RealBufferedSink$commonWrite$3":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWrite$3":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/BufferedSink;
    .registers 11
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "source"    # Lnicoid/network238/okio/Source;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 105
    .local v0, "$i$f$commonWrite":I
    move-wide v1, p2

    .line 106
    .local v1, "byteCount":J
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_1

    .line 107
    move-object v3, p0

    .local v3, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v4, 0x0

    .line 230
    .local v4, "$i$f$getBuffer":I
    iget-object v3, v3, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 107
    .end local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v4    # "$i$f$getBuffer":I
    invoke-interface {p1, v3, v1, v2}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v3

    .line 108
    .local v3, "read":J
    const-wide/16 v5, -0x1

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    .line 109
    sub-long/2addr v1, v3

    .line 110
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    goto :goto_0

    .line 108
    :cond_0
    new-instance v5, Ljava/io/EOFException;

    invoke-direct {v5}, Ljava/io/EOFException;-><init>()V

    throw v5

    .line 112
    .end local v3    # "read":J
    :cond_1
    move-object v3, p0

    check-cast v3, Lnicoid/network238/okio/BufferedSink;

    return-object v3
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;[B)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "source"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 78
    .local v0, "$i$f$commonWrite":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 79
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 227
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 79
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    .line 80
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 78
    .local v1, "$i$a$-check--RealBufferedSink$commonWrite$4":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWrite$4":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;[BII)Lnicoid/network238/okio/BufferedSink;
    .registers 7
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "source"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 88
    .local v0, "$i$f$commonWrite":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 89
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 228
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 89
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    .line 90
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 88
    .local v1, "$i$a$-check--RealBufferedSink$commonWrite$5":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWrite$5":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/RealBufferedSink;Lnicoid/network238/okio/Buffer;J)V
    .registers 7
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "source"    # Lnicoid/network238/okio/Buffer;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 34
    .local v0, "$i$f$commonWrite":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 35
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 221
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 35
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 36
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    .line 37
    return-void

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 34
    .local v1, "$i$a$-check--RealBufferedSink$commonWrite$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWrite$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteAll(Lnicoid/network238/okio/RealBufferedSink;Lnicoid/network238/okio/Source;)J
    .registers 9
    .param p0, "$this$commonWriteAll"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "source"    # Lnicoid/network238/okio/Source;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 94
    .local v0, "$i$f$commonWriteAll":I
    const-wide/16 v1, 0x0

    .line 95
    .local v1, "totalBytesRead":J
    :goto_0
    nop

    .line 96
    move-object v3, p0

    .local v3, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v4, 0x0

    .line 229
    .local v4, "$i$f$getBuffer":I
    iget-object v3, v3, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 96
    .end local v3    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v4    # "$i$f$getBuffer":I
    const-wide/16 v4, 0x2000

    invoke-interface {p1, v3, v4, v5}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v3

    .line 97
    .local v3, "readCount":J
    const-wide/16 v5, -0x1

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    .line 98
    add-long/2addr v1, v3

    .line 99
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    goto :goto_0

    .line 101
    .end local v3    # "readCount":J
    :cond_0
    return-wide v1
.end method

.method public static final commonWriteByte(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteByte"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "b"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 116
    .local v0, "$i$f$commonWriteByte":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 117
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 231
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 117
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 118
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 116
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteByte$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteByte$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteDecimalLong(Lnicoid/network238/okio/RealBufferedSink;J)Lnicoid/network238/okio/BufferedSink;
    .registers 6
    .param p0, "$this$commonWriteDecimalLong"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 158
    .local v0, "$i$f$commonWriteDecimalLong":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 159
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 238
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 159
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    .line 160
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 158
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteDecimalLong$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteDecimalLong$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteHexadecimalUnsignedLong(Lnicoid/network238/okio/RealBufferedSink;J)Lnicoid/network238/okio/BufferedSink;
    .registers 6
    .param p0, "$this$commonWriteHexadecimalUnsignedLong"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 164
    .local v0, "$i$f$commonWriteHexadecimalUnsignedLong":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 165
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 239
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 165
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    .line 166
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 164
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteHexadecimalUnsignedLong$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteHexadecimalUnsignedLong$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteInt(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteInt"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "i"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 134
    .local v0, "$i$f$commonWriteInt":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 135
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 234
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 135
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 136
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 134
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteInt$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteInt$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteIntLe(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteIntLe"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "i"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 140
    .local v0, "$i$f$commonWriteIntLe":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 141
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 235
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 141
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeIntLe(I)Lnicoid/network238/okio/Buffer;

    .line 142
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 140
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteIntLe$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteIntLe$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteLong(Lnicoid/network238/okio/RealBufferedSink;J)Lnicoid/network238/okio/BufferedSink;
    .registers 6
    .param p0, "$this$commonWriteLong"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 146
    .local v0, "$i$f$commonWriteLong":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 147
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 236
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 147
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLong(J)Lnicoid/network238/okio/Buffer;

    .line 148
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 146
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteLong$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteLong$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteLongLe(Lnicoid/network238/okio/RealBufferedSink;J)Lnicoid/network238/okio/BufferedSink;
    .registers 6
    .param p0, "$this$commonWriteLongLe"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 152
    .local v0, "$i$f$commonWriteLongLe":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 153
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 237
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 153
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLongLe(J)Lnicoid/network238/okio/Buffer;

    .line 154
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 152
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteLongLe$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteLongLe$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteShort(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteShort"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "s"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 122
    .local v0, "$i$f$commonWriteShort":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 123
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 232
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 123
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 124
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 122
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteShort$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteShort$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteShortLe(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteShortLe"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "s"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 128
    .local v0, "$i$f$commonWriteShortLe":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 129
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 233
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 129
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeShortLe(I)Lnicoid/network238/okio/Buffer;

    .line 130
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 128
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteShortLe$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteShortLe$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteUtf8(Lnicoid/network238/okio/RealBufferedSink;Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteUtf8"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "string"    # Ljava/lang/String;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "string"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 56
    .local v0, "$i$f$commonWriteUtf8":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 57
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 224
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 57
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    .line 58
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 56
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteUtf8$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteUtf8$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteUtf8(Lnicoid/network238/okio/RealBufferedSink;Ljava/lang/String;II)Lnicoid/network238/okio/BufferedSink;
    .registers 7
    .param p0, "$this$commonWriteUtf8"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "string"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 66
    .local v0, "$i$f$commonWriteUtf8":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 67
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 225
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 67
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    .line 68
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 66
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteUtf8$2":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteUtf8$2":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWriteUtf8CodePoint(Lnicoid/network238/okio/RealBufferedSink;I)Lnicoid/network238/okio/BufferedSink;
    .registers 5
    .param p0, "$this$commonWriteUtf8CodePoint"    # Lnicoid/network238/okio/RealBufferedSink;
    .param p1, "codePoint"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 72
    .local v0, "$i$f$commonWriteUtf8CodePoint":I
    iget-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v1, :cond_0

    .line 73
    move-object v1, p0

    .local v1, "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    const/4 v2, 0x0

    .line 226
    .local v2, "$i$f$getBuffer":I
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 73
    .end local v1    # "this_$iv":Lnicoid/network238/okio/RealBufferedSink;
    .end local v2    # "$i$f$getBuffer":I
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    .line 74
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 72
    .local v1, "$i$a$-check--RealBufferedSink$commonWriteUtf8CodePoint$1":I
    nop

    .end local v1    # "$i$a$-check--RealBufferedSink$commonWriteUtf8CodePoint$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
