.class Lorg/spongycastle/crypto/tls/DTLSEpoch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final cipher:Lorg/spongycastle/crypto/tls/TlsCipher;

.field private final epoch:I

.field private final replayWindow:Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

.field private sequenceNumber:J


# direct methods
.method public constructor <init>(ILorg/spongycastle/crypto/tls/TlsCipher;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->replayWindow:Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->sequenceNumber:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-ltz p1, :cond_1

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->epoch:I

    .line 21
    .line 22
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->cipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "\'cipher\' cannot be null"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :cond_1
    const-string p0, "\'epoch\' must be >= 0"

    .line 32
    .line 33
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw v0
.end method


# virtual methods
.method public allocateSequenceNumber()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->sequenceNumber:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->sequenceNumber:J

    .line 7
    .line 8
    return-wide v0
.end method

.method public getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->cipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEpoch()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->epoch:I

    .line 2
    .line 3
    return p0
.end method

.method public getReplayWindow()Lorg/spongycastle/crypto/tls/DTLSReplayWindow;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->replayWindow:Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSequenceNumber()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSEpoch;->sequenceNumber:J

    .line 2
    .line 3
    return-wide v0
.end method
