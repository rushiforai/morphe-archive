.class public final Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\u0006\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000e\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fJ\u000e\u0010 \u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fJ\u0018\u0010!\u001a\u00020\u001d2\u0006\u0010\"\u001a\u00020#2\u0008\u0010$\u001a\u0004\u0018\u00010\u001fJ\u0018\u0010%\u001a\u00020\u001d2\u0006\u0010&\u001a\u00020#2\u0006\u0010\u001e\u001a\u00020\u001fH\u0002J\u0016\u0010\'\u001a\u00020\u001d2\u0006\u0010(\u001a\u00020#2\u0006\u0010)\u001a\u00020\u001fJ\u0008\u0010*\u001a\u00020\u001dH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u000e\u0010\u0008\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006+"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;",
        "Ljava/io/Closeable;",
        "isClient",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "random",
        "Ljava/util/Random;",
        "perMessageDeflate",
        "noContextTakeover",
        "minimumDeflateSize",
        "",
        "<init>",
        "(ZLnicoid/network238/okio/BufferedSink;Ljava/util/Random;ZZJ)V",
        "getSink",
        "()Lnicoid/network238/okio/BufferedSink;",
        "getRandom",
        "()Ljava/util/Random;",
        "messageBuffer",
        "Lnicoid/network238/okio/Buffer;",
        "sinkBuffer",
        "writerClosed",
        "messageDeflater",
        "Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;",
        "maskKey",
        "",
        "maskCursor",
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "writePing",
        "",
        "payload",
        "Lnicoid/network238/okio/ByteString;",
        "writePong",
        "writeClose",
        "code",
        "",
        "reason",
        "writeControlFrame",
        "opcode",
        "writeMessageFrame",
        "formatOpcode",
        "data",
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
.field private final isClient:Z

.field private final maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

.field private final maskKey:[B

.field private final messageBuffer:Lnicoid/network238/okio/Buffer;

.field private messageDeflater:Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;

.field private final minimumDeflateSize:J

.field private final noContextTakeover:Z

.field private final perMessageDeflate:Z

.field private final random:Ljava/util/Random;

.field private final sink:Lnicoid/network238/okio/BufferedSink;

.field private final sinkBuffer:Lnicoid/network238/okio/Buffer;

.field private writerClosed:Z


# direct methods
.method public constructor <init>(ZLnicoid/network238/okio/BufferedSink;Ljava/util/Random;ZZJ)V
    .registers 8

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 47
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sink:Lnicoid/network238/okio/BufferedSink;

    .line 48
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 49
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->perMessageDeflate:Z

    .line 50
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->noContextTakeover:Z

    .line 51
    iput-wide p6, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->minimumDeflateSize:J

    .line 54
    new-instance p3, Lnicoid/network238/okio/Buffer;

    invoke-direct {p3}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    .line 57
    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object p2

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 64
    const/4 p3, 0x4

    new-array p3, p3, [B

    goto :goto_0

    :cond_0
    move-object p3, p2

    :goto_0
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    if-eqz p1, :cond_1

    .line 65
    new-instance p2, Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-direct {p2}, Lnicoid/network238/okio/Buffer$UnsafeCursor;-><init>()V

    goto :goto_1

    :cond_1
    nop

    :goto_1
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    return-void
.end method

.method private final writeControlFrame(ILnicoid/network238/okio/ByteString;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    if-nez v0, :cond_3

    .line 120
    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    int-to-long v1, v0

    const-wide/16 v3, 0x7d

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    or-int/lit16 p1, p1, 0x80

    .line 126
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 129
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 146
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    if-eqz p1, :cond_0

    or-int/lit16 p1, v0, 0x80

    .line 131
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 133
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 134
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    if-lez v0, :cond_1

    .line 137
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 138
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 140
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    .line 141
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    .line 142
    sget-object p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {p1, p2, v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lnicoid/network238/okio/Buffer$UnsafeCursor;[B)V

    .line 143
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->close()V

    goto :goto_0

    .line 146
    :cond_0
    invoke-virtual {v1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 147
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 150
    :cond_1
    :goto_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void

    .line 121
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Payload size must be less than or equal to 125"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 118
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 213
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageDeflater:Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 214
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method

.method public final getRandom()Ljava/util/Random;
    .registers 2

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    return-object v0
.end method

.method public final getSink()Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 47
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sink:Lnicoid/network238/okio/BufferedSink;

    return-object v0
.end method

.method public final writeClose(ILnicoid/network238/okio/ByteString;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    sget-object v0, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    if-nez p1, :cond_0

    if-eqz p2, :cond_2

    goto :goto_0

    .line 94
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->validateCloseCode(I)V

    .line 97
    :goto_0
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 98
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    if-eqz p2, :cond_1

    .line 100
    invoke-virtual {v0, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 102
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    :cond_2
    nop

    .line 107
    const/4 p1, 0x1

    const/16 p2, 0x8

    :try_start_0
    invoke-direct {p0, p2, v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILnicoid/network238/okio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    return-void

    :catchall_0
    move-exception p2

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    throw p2
.end method

.method public final writeMessageFrame(ILnicoid/network238/okio/ByteString;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    if-nez v0, :cond_6

    .line 160
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    or-int/lit16 v0, p1, 0x80

    .line 163
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->perMessageDeflate:Z

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    int-to-long v1, p2

    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->minimumDeflateSize:J

    cmp-long p2, v1, v3

    if-ltz p2, :cond_1

    .line 165
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageDeflater:Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;

    if-nez p2, :cond_0

    .line 166
    new-instance p2, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->noContextTakeover:Z

    invoke-direct {p2, v0}, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;-><init>(Z)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageDeflater:Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;

    .line 167
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflate(Lnicoid/network238/okio/Buffer;)V

    or-int/lit16 v0, p1, 0xc0

    .line 170
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    .line 171
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 174
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x80

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    const-wide/16 v1, 0x7d

    cmp-long v1, p1, v1

    if-gtz v1, :cond_3

    long-to-int v1, p1

    or-int/2addr v0, v1

    .line 180
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    goto :goto_1

    :cond_3
    const-wide/32 v1, 0xffff

    cmp-long v1, p1, v1

    .line 191
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    if-gtz v1, :cond_4

    or-int/lit8 v0, v0, 0x7e

    .line 185
    invoke-virtual {v2, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 186
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    goto :goto_1

    :cond_4
    or-int/lit8 v0, v0, 0x7f

    .line 191
    invoke-virtual {v2, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 192
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLong(J)Lnicoid/network238/okio/Buffer;

    .line 196
    :goto_1
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v0, :cond_5

    .line 197
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 198
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_5

    .line 201
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    .line 202
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v2, v0, v1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    .line 203
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lnicoid/network238/okio/Buffer$UnsafeCursor;[B)V

    .line 204
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->close()V

    .line 208
    :cond_5
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->messageBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, v1, p1, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 209
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void

    .line 158
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final writePing(Lnicoid/network238/okio/ByteString;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    const/16 v0, 0x9

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public final writePong(Lnicoid/network238/okio/ByteString;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    const/16 v0, 0xa

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILnicoid/network238/okio/ByteString;)V

    return-void
.end method
