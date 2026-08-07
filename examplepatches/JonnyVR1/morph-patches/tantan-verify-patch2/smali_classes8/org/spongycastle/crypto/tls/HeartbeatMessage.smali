.class public Lorg/spongycastle/crypto/tls/HeartbeatMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/HeartbeatMessage$PayloadBuffer;
    }
.end annotation


# instance fields
.field protected paddingLength:I

.field protected payload:[B

.field protected type:S


# direct methods
.method public constructor <init>(S[BI)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/HeartbeatMessageType;->isValid(S)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    array-length v0, p2

    .line 14
    const/high16 v2, 0x10000

    .line 15
    .line 16
    if-ge v0, v2, :cond_1

    .line 17
    .line 18
    const/16 v0, 0x10

    .line 19
    .line 20
    if-lt p3, v0, :cond_0

    .line 21
    .line 22
    iput-short p1, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->type:S

    .line 23
    .line 24
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->payload:[B

    .line 25
    .line 26
    iput p3, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->paddingLength:I

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "\'paddingLength\' must be at least 16"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw v1

    .line 35
    :cond_1
    const-string p0, "\'payload\' must have length < 2^16"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw v1

    .line 41
    :cond_2
    const-string p0, "\'type\' is not a valid HeartbeatMessageType value"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw v1
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/HeartbeatMessage;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/HeartbeatMessageType;->isValid(S)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    new-instance v3, Lorg/spongycastle/crypto/tls/HeartbeatMessage$PayloadBuffer;

    .line 17
    .line 18
    invoke-direct {v3}, Lorg/spongycastle/crypto/tls/HeartbeatMessage$PayloadBuffer;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, v3}, Lorg/spongycastle/util/io/Streams;->pipeAll(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v1}, Lorg/spongycastle/crypto/tls/HeartbeatMessage$PayloadBuffer;->toTruncatedByteArray(I)[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    return-object v2

    .line 31
    :cond_0
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    array-length v2, p0

    .line 36
    sub-int/2addr v1, v2

    .line 37
    new-instance v2, Lorg/spongycastle/crypto/tls/HeartbeatMessage;

    .line 38
    .line 39
    invoke-direct {v2, v0, p0, v1}, Lorg/spongycastle/crypto/tls/HeartbeatMessage;-><init>(S[BI)V

    .line 40
    .line 41
    .line 42
    return-object v2

    .line 43
    :cond_1
    const/16 p0, 0x2f

    .line 44
    .line 45
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 46
    .line 47
    .line 48
    return-object v2
.end method


# virtual methods
.method public encode(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->type:S

    .line 2
    .line 3
    invoke-static {v0, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->payload:[B

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->payload:[B

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    invoke-static {v0, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->payload:[B

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 21
    .line 22
    .line 23
    iget p0, p0, Lorg/spongycastle/crypto/tls/HeartbeatMessage;->paddingLength:I

    .line 24
    .line 25
    new-array p0, p0, [B

    .line 26
    .line 27
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1, p0}, Lorg/spongycastle/crypto/prng/RandomGenerator;->nextBytes([B)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0}, Ljava/io/OutputStream;->write([B)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
