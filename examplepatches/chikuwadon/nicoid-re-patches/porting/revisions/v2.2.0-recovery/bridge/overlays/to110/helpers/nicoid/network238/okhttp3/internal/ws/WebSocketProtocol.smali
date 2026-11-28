.class public final Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000e\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"J\u0010\u0010#\u001a\u0004\u0018\u00010\u00052\u0006\u0010$\u001a\u00020\u0007J\u000e\u0010%\u001a\u00020\u001e2\u0006\u0010$\u001a\u00020\u0007J\u000e\u0010&\u001a\u00020\u00052\u0006\u0010!\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0016X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0016X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;",
        "",
        "<init>",
        "()V",
        "ACCEPT_MAGIC",
        "",
        "B0_FLAG_FIN",
        "",
        "B0_FLAG_RSV1",
        "B0_FLAG_RSV2",
        "B0_FLAG_RSV3",
        "B0_MASK_OPCODE",
        "OPCODE_FLAG_CONTROL",
        "B1_FLAG_MASK",
        "B1_MASK_LENGTH",
        "OPCODE_CONTINUATION",
        "OPCODE_TEXT",
        "OPCODE_BINARY",
        "OPCODE_CONTROL_CLOSE",
        "OPCODE_CONTROL_PING",
        "OPCODE_CONTROL_PONG",
        "PAYLOAD_BYTE_MAX",
        "",
        "CLOSE_MESSAGE_MAX",
        "PAYLOAD_SHORT",
        "PAYLOAD_SHORT_MAX",
        "PAYLOAD_LONG",
        "CLOSE_CLIENT_GOING_AWAY",
        "CLOSE_NO_STATUS_CODE",
        "toggleMask",
        "",
        "cursor",
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "key",
        "",
        "closeCodeExceptionMessage",
        "code",
        "validateCloseCode",
        "acceptHeader",
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


# static fields
.field public static final ACCEPT_MAGIC:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field public static final B0_FLAG_FIN:I = 0x80

.field public static final B0_FLAG_RSV1:I = 0x40

.field public static final B0_FLAG_RSV2:I = 0x20

.field public static final B0_FLAG_RSV3:I = 0x10

.field public static final B0_MASK_OPCODE:I = 0xf

.field public static final B1_FLAG_MASK:I = 0x80

.field public static final B1_MASK_LENGTH:I = 0x7f

.field public static final CLOSE_CLIENT_GOING_AWAY:I = 0x3e9

.field public static final CLOSE_MESSAGE_MAX:J = 0x7bL

.field public static final CLOSE_NO_STATUS_CODE:I = 0x3ed

.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

.field public static final OPCODE_BINARY:I = 0x2

.field public static final OPCODE_CONTINUATION:I = 0x0

.field public static final OPCODE_CONTROL_CLOSE:I = 0x8

.field public static final OPCODE_CONTROL_PING:I = 0x9

.field public static final OPCODE_CONTROL_PONG:I = 0xa

.field public static final OPCODE_FLAG_CONTROL:I = 0x8

.field public static final OPCODE_TEXT:I = 0x1

.field public static final PAYLOAD_BYTE_MAX:J = 0x7dL

.field public static final PAYLOAD_LONG:I = 0x7f

.field public static final PAYLOAD_SHORT:I = 0x7e

.field public static final PAYLOAD_SHORT_MAX:J = 0xffffL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final acceptHeader(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->sha1()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final closeCodeExceptionMessage(I)Ljava/lang/String;
    .registers 4

    const/16 v0, 0x3e8

    if-lt p1, v0, :cond_3

    const/16 v0, 0x1388

    if-ge p1, v0, :cond_3

    const/16 v0, 0x3ec

    if-gt v0, p1, :cond_0

    const/16 v0, 0x3ef

    if-lt p1, v0, :cond_1

    :cond_0
    const/16 v0, 0x3f7

    if-gt v0, p1, :cond_2

    const/16 v0, 0xbb8

    if-ge p1, v0, :cond_2

    .line 140
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Code "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " is reserved and may not be used."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1

    .line 138
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Code must be in range [1000,5000): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final toggleMask(Lnicoid/network238/okio/Buffer$UnsafeCursor;[B)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    array-length v0, p2

    const/4 v1, 0x0

    .line 116
    :cond_0
    iget-object v2, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 117
    iget v3, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 118
    iget v4, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    if-eqz v2, :cond_1

    :goto_0
    if-ge v3, v4, :cond_1

    .line 121
    rem-int/2addr v1, v0

    .line 125
    aget-byte v5, v2, v3

    .line 126
    aget-byte v6, p2, v1

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    .line 127
    aput-byte v5, v2, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->next()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    return-void
.end method

.method public final validateCloseCode(I)V
    .registers 3

    .line 146
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->closeCodeExceptionMessage(I)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 147
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
