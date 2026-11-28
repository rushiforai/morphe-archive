.class public final Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001:\u0001(B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0006\u0010 \u001a\u00020!J\u0008\u0010\"\u001a\u00020!H\u0002J\u0008\u0010#\u001a\u00020!H\u0002J\u0008\u0010$\u001a\u00020!H\u0002J\u0008\u0010%\u001a\u00020!H\u0002J\u0008\u0010&\u001a\u00020!H\u0002J\u0008\u0010\'\u001a\u00020!H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001dX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;",
        "Ljava/io/Closeable;",
        "isClient",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "frameCallback",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;",
        "perMessageDeflate",
        "noContextTakeover",
        "<init>",
        "(ZLnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;ZZ)V",
        "getSource",
        "()Lnicoid/network238/okio/BufferedSource;",
        "closed",
        "receivedCloseFrame",
        "opcode",
        "",
        "frameLength",
        "",
        "isFinalFrame",
        "isControlFrame",
        "readingCompressedMessage",
        "controlFrameBuffer",
        "Lnicoid/network238/okio/Buffer;",
        "messageFrameBuffer",
        "messageInflater",
        "Lnicoid/network238/okhttp3/internal/ws/MessageInflater;",
        "maskKey",
        "",
        "maskCursor",
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "processNextFrame",
        "",
        "readHeader",
        "readControlFrame",
        "readMessageFrame",
        "readUntilNonControlFrame",
        "readMessage",
        "close",
        "FrameCallback",
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

.field private final controlFrameBuffer:Lnicoid/network238/okio/Buffer;

.field private final frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

.field private frameLength:J

.field private final isClient:Z

.field private isControlFrame:Z

.field private isFinalFrame:Z

.field private final maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

.field private final maskKey:[B

.field private final messageFrameBuffer:Lnicoid/network238/okio/Buffer;

.field private messageInflater:Lnicoid/network238/okhttp3/internal/ws/MessageInflater;

.field private final noContextTakeover:Z

.field private opcode:I

.field private final perMessageDeflate:Z

.field private readingCompressedMessage:Z

.field private receivedCloseFrame:Z

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(ZLnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;ZZ)V
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isClient:Z

    .line 57
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 58
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 59
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->perMessageDeflate:Z

    .line 60
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->noContextTakeover:Z

    .line 72
    new-instance p2, Lnicoid/network238/okio/Buffer;

    invoke-direct {p2}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    .line 73
    new-instance p2, Lnicoid/network238/okio/Buffer;

    invoke-direct {p2}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    move-object p3, p2

    goto :goto_0

    .line 79
    :cond_0
    const/4 p3, 0x4

    new-array p3, p3, [B

    :goto_0
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskKey:[B

    if-eqz p1, :cond_1

    goto :goto_1

    .line 80
    :cond_1
    new-instance p2, Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-direct {p2}, Lnicoid/network238/okio/Buffer$UnsafeCursor;-><init>()V

    :goto_1
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    return-void
.end method

.method private final readControlFrame()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 204
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 205
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {v4, v5, v0, v1}, Lnicoid/network238/okio/BufferedSource;->readFully(Lnicoid/network238/okio/Buffer;J)V

    .line 207
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-nez v0, :cond_0

    .line 208
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    .line 209
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    .line 210
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskKey:[B

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v4}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lnicoid/network238/okio/Buffer$UnsafeCursor;[B)V

    .line 211
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->close()V

    .line 215
    :cond_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    packed-switch v0, :pswitch_data_0

    .line 241
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown control opcode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :pswitch_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-interface {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPong(Lnicoid/network238/okio/ByteString;)V

    return-void

    .line 217
    :pswitch_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-interface {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPing(Lnicoid/network238/okio/ByteString;)V

    return-void

    :pswitch_2
    nop

    .line 226
    nop

    .line 227
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v4, 0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_3

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    .line 231
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readShort()S

    move-result v0

    .line 232
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->controlFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v1

    .line 233
    sget-object v2, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->closeCodeExceptionMessage(I)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 234
    :cond_1
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_2
    const/16 v0, 0x3ed

    const-string v1, ""

    .line 236
    :goto_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-interface {v2, v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadClose(ILjava/lang/String;)V

    .line 237
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->receivedCloseFrame:Z

    return-void

    .line 229
    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Malformed close payload length of 1."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final readHeader()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 121
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->receivedCloseFrame:Z

    if-nez v0, :cond_12

    .line 125
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v0

    .line 126
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v2}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Timeout;->clearTimeout()Lnicoid/network238/okio/Timeout;

    .line 128
    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v2

    const/16 v3, 0xff

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v4}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v0, v1, v5}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    and-int/lit8 v0, v2, 0xf

    .line 133
    iput v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    and-int/lit16 v1, v2, 0x80

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_0

    move v1, v5

    goto :goto_0

    :cond_0
    move v1, v4

    .line 134
    :goto_0
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    and-int/lit8 v6, v2, 0x8

    if-eqz v6, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v4

    .line 135
    :goto_1
    iput-boolean v6, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v6, :cond_2

    if-nez v1, :cond_2

    .line 139
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Control frames must be final."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    and-int/lit8 v1, v2, 0x40

    if-eqz v1, :cond_3

    move v1, v5

    goto :goto_2

    :cond_3
    move v1, v4

    :goto_2
    const-string v6, "Unexpected rsv1 flag"

    if-eq v0, v5, :cond_5

    const/4 v7, 0x2

    if-eq v0, v7, :cond_5

    if-nez v1, :cond_4

    goto :goto_4

    .line 155
    :cond_4
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v6}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    if-eqz v1, :cond_7

    .line 147
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->perMessageDeflate:Z

    if-eqz v0, :cond_6

    move v0, v5

    goto :goto_3

    :cond_6
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v6}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    move v0, v4

    .line 145
    :goto_3
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readingCompressedMessage:Z

    :goto_4
    and-int/lit8 v0, v2, 0x20

    if-nez v0, :cond_11

    and-int/lit8 v2, v2, 0x10

    if-nez v2, :cond_10

    .line 165
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    invoke-static {v0, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v0

    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_8

    move v4, v5

    .line 168
    :cond_8
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-ne v4, v1, :cond_a

    .line 170
    new-instance v0, Ljava/net/ProtocolException;

    .line 171
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-eqz v1, :cond_9

    .line 172
    const-string v1, "Server-sent frames must not be masked."

    goto :goto_5

    .line 174
    :cond_9
    const-string v1, "Client-sent frames must be masked."

    .line 170
    :goto_5
    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    and-int/lit8 v0, v0, 0x7f

    int-to-long v0, v0

    .line 180
    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v2, 0x7e

    cmp-long v2, v0, v2

    if-nez v2, :cond_b

    .line 182
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v0

    const v1, 0xffff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(SI)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    goto :goto_6

    :cond_b
    const-wide/16 v2, 0x7f

    cmp-long v2, v0, v2

    if-nez v2, :cond_d

    .line 184
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_c

    goto :goto_6

    .line 186
    :cond_c
    new-instance v0, Ljava/net/ProtocolException;

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Frame length 0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > 0x7FFFFFFFFFFFFFFF"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_d
    :goto_6
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v2, :cond_e

    const-wide/16 v2, 0x7d

    cmp-long v0, v0, v2

    if-lez v0, :cond_e

    .line 193
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Control frame must be less than 125B."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    if-eqz v4, :cond_f

    .line 198
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskKey:[B

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSource;->readFully([B)V

    :cond_f
    return-void

    .line 163
    :cond_10
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Unexpected rsv3 flag"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_11
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Unexpected rsv2 flag"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v2

    .line 130
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v3}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1, v4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    throw v2

    .line 121
    :cond_12
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final readMessage()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    :goto_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->receivedCloseFrame:Z

    if-nez v0, :cond_3

    .line 291
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 292
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {v2, v3, v0, v1}, Lnicoid/network238/okio/BufferedSource;->readFully(Lnicoid/network238/okio/Buffer;J)V

    .line 294
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-nez v0, :cond_0

    .line 295
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    .line 296
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameLength:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    .line 297
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskKey:[B

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lnicoid/network238/okio/Buffer$UnsafeCursor;[B)V

    .line 298
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->maskCursor:Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->close()V

    .line 302
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    if-nez v0, :cond_2

    .line 304
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readUntilNonControlFrame()V

    .line 305
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    if-nez v0, :cond_1

    goto :goto_0

    .line 306
    :cond_1
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected continuation opcode. Got: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return-void

    .line 289
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final readMessageFrame()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->opcode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 250
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown opcode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 253
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readMessage()V

    .line 255
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readingCompressedMessage:Z

    if-eqz v2, :cond_2

    .line 257
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageInflater:Lnicoid/network238/okhttp3/internal/ws/MessageInflater;

    if-nez v2, :cond_1

    .line 258
    new-instance v2, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;

    iget-boolean v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->noContextTakeover:Z

    invoke-direct {v2, v3}, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;-><init>(Z)V

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageInflater:Lnicoid/network238/okhttp3/internal/ws/MessageInflater;

    .line 259
    :cond_1
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/internal/ws/MessageInflater;->inflate(Lnicoid/network238/okio/Buffer;)V

    .line 265
    :cond_2
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->frameCallback:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    if-ne v0, v1, :cond_3

    .line 263
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Ljava/lang/String;)V

    return-void

    .line 265
    :cond_3
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageFrameBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-interface {v2, v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method private final readUntilNonControlFrame()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    :goto_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->receivedCloseFrame:Z

    if-nez v0, :cond_1

    .line 273
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readHeader()V

    .line 274
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 277
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readControlFrame()V

    goto :goto_0

    :cond_1
    :goto_1
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

    .line 313
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 314
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->closed:Z

    .line 315
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->messageInflater:Lnicoid/network238/okhttp3/internal/ws/MessageInflater;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 316
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method

.method public final getSource()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 57
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->source:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method

.method public final processNextFrame()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->closed:Z

    if-nez v0, :cond_1

    .line 111
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readHeader()V

    .line 112
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v0, :cond_0

    .line 113
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readControlFrame()V

    return-void

    .line 115
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->readMessageFrame()V

    return-void

    .line 109
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
