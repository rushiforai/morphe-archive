.class Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/DatagramTransport;


# static fields
.field private static final MAX_FRAGMENT_LENGTH:I = 0x4000

.field private static final RECORD_HEADER_LENGTH:I = 0xd

.field private static final RETRANSMIT_TIMEOUT:J = 0x3a980L

.field private static final TCP_MSL:J = 0x1d4c0L


# instance fields
.field private volatile closed:Z

.field private final context:Lorg/spongycastle/crypto/tls/TlsContext;

.field private currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile failed:Z

.field private volatile inHandshake:Z

.field private final peer:Lorg/spongycastle/crypto/tls/TlsPeer;

.field private pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile plaintextLimit:I

.field private readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field private final recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

.field private retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

.field private retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private retransmitExpiry:J

.field private final transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

.field private writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/DatagramTransport;Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsPeer;S)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p4, Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 5
    .line 6
    invoke-direct {p4}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 10
    .line 11
    const/4 p4, 0x0

    .line 12
    iput-boolean p4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 13
    .line 14
    iput-boolean p4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 18
    .line 19
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 20
    .line 21
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 22
    .line 23
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 24
    .line 25
    const-wide/16 v1, 0x0

    .line 26
    .line 27
    iput-wide v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    .line 28
    .line 29
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 30
    .line 31
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 32
    .line 33
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 37
    .line 38
    new-instance p1, Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 39
    .line 40
    new-instance p3, Lorg/spongycastle/crypto/tls/TlsNullCipher;

    .line 41
    .line 42
    invoke-direct {p3, p2}, Lorg/spongycastle/crypto/tls/TlsNullCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p1, p4, p3}, Lorg/spongycastle/crypto/tls/DTLSEpoch;-><init>(ILorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 49
    .line 50
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 51
    .line 52
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 53
    .line 54
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 55
    .line 56
    const/16 p1, 0x4000

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setPlaintextLimit(I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private closeTransport()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->warn(SLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 15
    .line 16
    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/DatagramTransport;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method private static getMacSequenceNumber(IJ)J
    .locals 4

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const/16 p0, 0x30

    shl-long/2addr v0, p0

    or-long p0, v0, p1

    return-wide p0
.end method

.method private raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertRaised(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    int-to-byte p1, p1

    .line 7
    int-to-byte p2, p2

    .line 8
    const/4 p3, 0x2

    .line 9
    new-array p4, p3, [B

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    aput-byte p1, p4, v0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    aput-byte p2, p4, p1

    .line 16
    .line 17
    const/16 p1, 0x15

    .line 18
    .line 19
    invoke-direct {p0, p1, p4, v0, p3}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private receiveRecord([BIII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xd

    .line 8
    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object p3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 12
    .line 13
    invoke-virtual {p3}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    const/4 p4, 0x0

    .line 18
    if-lt p3, v1, :cond_0

    .line 19
    .line 20
    const/4 p3, 0x2

    .line 21
    new-array v0, p3, [B

    .line 22
    .line 23
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 24
    .line 25
    const/16 v3, 0xb

    .line 26
    .line 27
    invoke-virtual {v2, v0, p4, p3, v3}, Lorg/spongycastle/crypto/tls/ByteQueue;->read([BIII)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, p4}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move p3, p4

    .line 36
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 37
    .line 38
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    add-int/2addr p3, v1

    .line 43
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData([BIII)V

    .line 50
    .line 51
    .line 52
    return p3

    .line 53
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 54
    .line 55
    invoke-interface {v0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/DatagramTransport;->receive([BIII)I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-lt p3, v1, :cond_2

    .line 60
    .line 61
    add-int/lit8 p4, p2, 0xb

    .line 62
    .line 63
    invoke-static {p1, p4}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    .line 64
    .line 65
    .line 66
    move-result p4

    .line 67
    add-int/2addr p4, v1

    .line 68
    if-le p3, p4, :cond_2

    .line 69
    .line 70
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 71
    .line 72
    add-int/2addr p2, p4

    .line 73
    sub-int/2addr p3, p4

    .line 74
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 75
    .line 76
    .line 77
    return p4

    .line 78
    :cond_2
    return p3
.end method

.method private sendRecord(S[BII)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 7
    .line 8
    const/16 v1, 0x50

    .line 9
    .line 10
    if-gt p4, v0, :cond_3

    .line 11
    .line 12
    const/4 v7, 0x1

    .line 13
    if-ge p4, v7, :cond_2

    .line 14
    .line 15
    const/16 v0, 0x17

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-static {v1}, Ll/f1j0;->a(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 25
    .line 26
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 31
    .line 32
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->allocateSequenceNumber()J

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 37
    .line 38
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v8, v9, v10}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getMacSequenceNumber(IJ)J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    move v3, p1

    .line 47
    move-object v4, p2

    .line 48
    move v5, p3

    .line 49
    move v6, p4

    .line 50
    invoke-interface/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsCipher;->encodePlaintext(JS[BII)[B

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    array-length p3, p2

    .line 55
    const/16 v0, 0xd

    .line 56
    .line 57
    add-int/2addr p3, v0

    .line 58
    new-array v1, p3, [B

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-static {p1, v1, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 65
    .line 66
    invoke-static {p1, v1, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 67
    .line 68
    .line 69
    const/4 p1, 0x3

    .line 70
    invoke-static {v8, v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 71
    .line 72
    .line 73
    const/4 p1, 0x5

    .line 74
    invoke-static {v9, v10, v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint48(J[BI)V

    .line 75
    .line 76
    .line 77
    array-length p1, p2

    .line 78
    const/16 v3, 0xb

    .line 79
    .line 80
    invoke-static {p1, v1, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 81
    .line 82
    .line 83
    array-length p1, p2

    .line 84
    invoke-static {p2, v2, v1, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 88
    .line 89
    invoke-interface {p0, v1, v2, p3}, Lorg/spongycastle/crypto/tls/DatagramTransport;->send([BII)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    invoke-static {v1}, Ll/f1j0;->a(I)V

    .line 94
    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x5a

    .line 10
    .line 11
    const-string v1, "User canceled handshake"

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->warn(SLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public fail(S)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-direct {p0, v0, p1, v1, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :catch_0
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReceiveLimit()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 10
    .line 11
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/DatagramTransport;->getReceiveLimit()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, -0xd

    .line 16
    .line 17
    invoke-interface {v1, p0}, Lorg/spongycastle/crypto/tls/TlsCipher;->getPlaintextLimit(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public getSendLimit()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 10
    .line 11
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/DatagramTransport;->getSendLimit()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, -0xd

    .line 16
    .line 17
    invoke-interface {v1, p0}, Lorg/spongycastle/crypto/tls/TlsCipher;->getPlaintextLimit(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public handshakeSuccessful(Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 14
    .line 15
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/32 v2, 0x3a980

    .line 22
    .line 23
    .line 24
    add-long/2addr v0, v2

    .line 25
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    .line 26
    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 29
    .line 30
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 31
    .line 32
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public initPendingEpoch(Lorg/spongycastle/crypto/tls/TlsCipher;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-direct {v0, v1, p1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;-><init>(ILorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public receive([BIII)I
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move-object v2, v1

    .line 5
    :goto_0
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getReceiveLimit()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    move/from16 v4, p3

    .line 10
    .line 11
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/16 v5, 0xd

    .line 16
    .line 17
    add-int/2addr v3, v5

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    array-length v6, v2

    .line 21
    if-ge v6, v3, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    :goto_1
    move-object v10, v2

    .line 25
    goto :goto_3

    .line 26
    :cond_1
    :goto_2
    new-array v2, v3, [B

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :goto_3
    iget-object v2, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    iget-wide v8, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    .line 38
    .line 39
    cmp-long v2, v6, v8

    .line 40
    .line 41
    if-lez v2, :cond_2

    .line 42
    .line 43
    iput-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 44
    .line 45
    iput-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 46
    .line 47
    :cond_2
    const/4 v2, 0x0

    .line 48
    move/from16 v13, p4

    .line 49
    .line 50
    invoke-direct {v0, v10, v2, v3, v13}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->receiveRecord([BIII)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-gez v3, :cond_3

    .line 55
    .line 56
    return v3

    .line 57
    :cond_3
    if-ge v3, v5, :cond_4

    .line 58
    .line 59
    :goto_4
    move-object/from16 v2, p1

    .line 60
    .line 61
    move/from16 v3, p2

    .line 62
    .line 63
    goto/16 :goto_b

    .line 64
    .line 65
    :cond_4
    const/16 v6, 0xb

    .line 66
    .line 67
    invoke-static {v10, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    add-int/2addr v6, v5

    .line 72
    if-eq v3, v6, :cond_5

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_5
    invoke-static {v10, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    packed-switch v9, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    goto :goto_4

    .line 83
    :pswitch_0
    const/4 v5, 0x3

    .line 84
    invoke-static {v10, v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    iget-object v6, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 89
    .line 90
    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-ne v5, v6, :cond_6

    .line 95
    .line 96
    iget-object v6, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 97
    .line 98
    :goto_5
    move-object v14, v6

    .line 99
    goto :goto_6

    .line 100
    :cond_6
    const/16 v6, 0x16

    .line 101
    .line 102
    if-ne v9, v6, :cond_7

    .line 103
    .line 104
    iget-object v6, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 105
    .line 106
    if-eqz v6, :cond_7

    .line 107
    .line 108
    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-ne v5, v6, :cond_7

    .line 113
    .line 114
    iget-object v6, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_7
    move-object v14, v1

    .line 118
    :goto_6
    if-nez v14, :cond_8

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_8
    const/4 v6, 0x5

    .line 122
    invoke-static {v10, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint48([BI)J

    .line 123
    .line 124
    .line 125
    move-result-wide v6

    .line 126
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getReplayWindow()Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    .line 127
    .line 128
    .line 129
    move-result-object v8

    .line 130
    invoke-virtual {v8, v6, v7}, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->shouldDiscard(J)Z

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    if-eqz v8, :cond_9

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_9
    const/4 v15, 0x1

    .line 138
    invoke-static {v10, v15}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion([BI)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 139
    .line 140
    .line 141
    move-result-object v8

    .line 142
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    .line 143
    .line 144
    .line 145
    move-result v11

    .line 146
    if-nez v11, :cond_a

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_a
    iget-object v11, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 150
    .line 151
    if-eqz v11, :cond_b

    .line 152
    .line 153
    iget-object v11, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 154
    .line 155
    invoke-virtual {v11, v8}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    .line 156
    .line 157
    .line 158
    move-result v11

    .line 159
    if-nez v11, :cond_b

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_b
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 163
    .line 164
    .line 165
    move-result-object v11

    .line 166
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    .line 167
    .line 168
    .line 169
    move-result v12

    .line 170
    invoke-static {v12, v6, v7}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getMacSequenceNumber(IJ)J

    .line 171
    .line 172
    .line 173
    move-result-wide v16

    .line 174
    add-int/lit8 v12, v3, -0xd

    .line 175
    .line 176
    move-wide/from16 v18, v6

    .line 177
    .line 178
    move-object v6, v11

    .line 179
    const/16 v11, 0xd

    .line 180
    .line 181
    move-object v3, v8

    .line 182
    move-wide/from16 v7, v16

    .line 183
    .line 184
    move-wide/from16 v1, v18

    .line 185
    .line 186
    invoke-interface/range {v6 .. v12}, Lorg/spongycastle/crypto/tls/TlsCipher;->decodeCiphertext(JS[BII)[B

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getReplayWindow()Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    invoke-virtual {v7, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->reportAuthenticated(J)V

    .line 195
    .line 196
    .line 197
    array-length v1, v6

    .line 198
    iget v2, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 199
    .line 200
    if-le v1, v2, :cond_d

    .line 201
    .line 202
    :cond_c
    :goto_7
    :pswitch_1
    move-object/from16 v2, p1

    .line 203
    .line 204
    move/from16 v3, p2

    .line 205
    .line 206
    const/4 v1, 0x0

    .line 207
    goto/16 :goto_b

    .line 208
    .line 209
    :cond_d
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 210
    .line 211
    if-nez v1, :cond_e

    .line 212
    .line 213
    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 214
    .line 215
    :cond_e
    packed-switch v9, :pswitch_data_1

    .line 216
    .line 217
    .line 218
    goto :goto_8

    .line 219
    :pswitch_2
    iget-boolean v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 220
    .line 221
    if-eqz v1, :cond_f

    .line 222
    .line 223
    goto :goto_7

    .line 224
    :pswitch_3
    iget-boolean v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 225
    .line 226
    if-nez v1, :cond_f

    .line 227
    .line 228
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 229
    .line 230
    if-eqz v1, :cond_c

    .line 231
    .line 232
    array-length v2, v6

    .line 233
    const/4 v3, 0x0

    .line 234
    invoke-interface {v1, v5, v6, v3, v2}, Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;->receivedHandshakeRecord(I[BII)V

    .line 235
    .line 236
    .line 237
    goto :goto_7

    .line 238
    :cond_f
    :goto_8
    iget-boolean v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 239
    .line 240
    if-nez v1, :cond_10

    .line 241
    .line 242
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 243
    .line 244
    if-eqz v1, :cond_10

    .line 245
    .line 246
    const/4 v1, 0x0

    .line 247
    iput-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 248
    .line 249
    iput-object v1, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 250
    .line 251
    :cond_10
    array-length v0, v6

    .line 252
    move-object/from16 v2, p1

    .line 253
    .line 254
    move/from16 v3, p2

    .line 255
    .line 256
    const/4 v5, 0x0

    .line 257
    invoke-static {v6, v5, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 258
    .line 259
    .line 260
    array-length v0, v6

    .line 261
    return v0

    .line 262
    :pswitch_4
    move-object/from16 v2, p1

    .line 263
    .line 264
    move/from16 v3, p2

    .line 265
    .line 266
    const/4 v1, 0x0

    .line 267
    const/4 v5, 0x0

    .line 268
    array-length v7, v6

    .line 269
    const/4 v8, 0x2

    .line 270
    if-ne v7, v8, :cond_14

    .line 271
    .line 272
    aget-byte v7, v6, v5

    .line 273
    .line 274
    int-to-short v5, v7

    .line 275
    aget-byte v6, v6, v15

    .line 276
    .line 277
    int-to-short v6, v6

    .line 278
    iget-object v7, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    .line 279
    .line 280
    invoke-interface {v7, v5, v6}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertReceived(SS)V

    .line 281
    .line 282
    .line 283
    if-eq v5, v8, :cond_11

    .line 284
    .line 285
    if-nez v6, :cond_14

    .line 286
    .line 287
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    .line 288
    .line 289
    .line 290
    goto :goto_b

    .line 291
    :cond_11
    invoke-virtual {v0, v6}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 292
    .line 293
    .line 294
    invoke-static {v6}, Ll/f1j0;->a(I)V

    .line 295
    .line 296
    .line 297
    const/16 v20, 0x0

    .line 298
    .line 299
    return v20

    .line 300
    :pswitch_5
    move-object/from16 v2, p1

    .line 301
    .line 302
    move/from16 v3, p2

    .line 303
    .line 304
    const/4 v1, 0x0

    .line 305
    const/16 v20, 0x0

    .line 306
    .line 307
    move/from16 v5, v20

    .line 308
    .line 309
    :goto_9
    array-length v7, v6

    .line 310
    if-ge v5, v7, :cond_14

    .line 311
    .line 312
    invoke-static {v6, v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    .line 313
    .line 314
    .line 315
    move-result v7

    .line 316
    if-eq v7, v15, :cond_12

    .line 317
    .line 318
    goto :goto_a

    .line 319
    :cond_12
    iget-object v7, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 320
    .line 321
    if-eqz v7, :cond_13

    .line 322
    .line 323
    iput-object v7, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 324
    .line 325
    :cond_13
    :goto_a
    add-int/lit8 v5, v5, 0x1

    .line 326
    .line 327
    goto :goto_9

    .line 328
    :cond_14
    :goto_b
    move-object v2, v10

    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public resetWriteEpoch()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 11
    .line 12
    return-void
.end method

.method public send([BII)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 v0, 0x17

    .line 13
    .line 14
    goto :goto_3

    .line 15
    :cond_1
    :goto_0
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/16 v1, 0x14

    .line 20
    .line 21
    if-ne v0, v1, :cond_5

    .line 22
    .line 23
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 31
    .line 32
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 33
    .line 34
    if-ne v0, v2, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const/4 v0, 0x0

    .line 40
    :goto_1
    if-eqz v0, :cond_4

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    new-array v3, v2, [B

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    aput-byte v2, v3, v4

    .line 47
    .line 48
    invoke-direct {p0, v1, v3, v4, v2}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_4
    invoke-static {}, Ll/wpg0;->a()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_5
    :goto_2
    const/16 v0, 0x16

    .line 59
    .line 60
    :goto_3
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public setPlaintextLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 2
    .line 3
    return-void
.end method

.method public setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 2
    .line 3
    return-void
.end method

.method public setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 2
    .line 3
    return-void
.end method

.method public warn(SLjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, v0, p1, p2, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
