.class public Lorg/spongycastle/crypto/tls/NewSessionTicket;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected ticket:[B

.field protected ticketLifetimeHint:J


# direct methods
.method public constructor <init>(J[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticketLifetimeHint:J

    .line 5
    .line 6
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticket:[B

    .line 7
    .line 8
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/NewSessionTicket;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint32(Ljava/io/InputStream;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v2, Lorg/spongycastle/crypto/tls/NewSessionTicket;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1, p0}, Lorg/spongycastle/crypto/tls/NewSessionTicket;-><init>(J[B)V

    .line 12
    .line 13
    .line 14
    return-object v2
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticketLifetimeHint:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint32(JLjava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticket:[B

    .line 7
    .line 8
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getTicket()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticket:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getTicketLifetimeHint()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/tls/NewSessionTicket;->ticketLifetimeHint:J

    .line 2
    .line 3
    return-wide v0
.end method
