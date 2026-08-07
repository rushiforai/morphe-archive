.class Lorg/spongycastle/crypto/tls/DTLSReplayWindow;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final VALID_SEQ_MASK:J = 0xffffffffffffL

.field private static final WINDOW_SIZE:J = 0x40L


# instance fields
.field private bitmap:J

.field private latestConfirmedSeq:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->latestConfirmedSeq:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public reportAuthenticated(J)V
    .locals 7

    .line 1
    const-wide v0, 0xffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    and-long/2addr v0, p1

    .line 7
    cmp-long v0, v0, p1

    .line 8
    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->latestConfirmedSeq:J

    .line 12
    .line 13
    cmp-long v2, p1, v0

    .line 14
    .line 15
    const-wide/16 v3, 0x40

    .line 16
    .line 17
    const-wide/16 v5, 0x1

    .line 18
    .line 19
    if-gtz v2, :cond_1

    .line 20
    .line 21
    sub-long/2addr v0, p1

    .line 22
    cmp-long p1, v0, v3

    .line 23
    .line 24
    if-gez p1, :cond_0

    .line 25
    .line 26
    iget-wide p1, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 27
    .line 28
    long-to-int v0, v0

    .line 29
    shl-long v0, v5, v0

    .line 30
    .line 31
    or-long/2addr p1, v0

    .line 32
    iput-wide p1, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    sub-long v0, p1, v0

    .line 36
    .line 37
    cmp-long v2, v0, v3

    .line 38
    .line 39
    if-ltz v2, :cond_2

    .line 40
    .line 41
    iput-wide v5, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-wide v2, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 45
    .line 46
    long-to-int v0, v0

    .line 47
    shl-long v0, v2, v0

    .line 48
    .line 49
    or-long/2addr v0, v5

    .line 50
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 51
    .line 52
    :goto_0
    iput-wide p1, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->latestConfirmedSeq:J

    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    const-string p0, "\'seq\' out of range"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->latestConfirmedSeq:J

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 8
    .line 9
    return-void
.end method

.method public shouldDiscard(J)Z
    .locals 6

    .line 1
    const-wide v0, 0xffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    and-long/2addr v0, p1

    .line 7
    cmp-long v0, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-wide v2, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->latestConfirmedSeq:J

    .line 14
    .line 15
    cmp-long v0, p1, v2

    .line 16
    .line 17
    if-gtz v0, :cond_2

    .line 18
    .line 19
    sub-long/2addr v2, p1

    .line 20
    const-wide/16 p1, 0x40

    .line 21
    .line 22
    cmp-long p1, v2, p1

    .line 23
    .line 24
    if-ltz p1, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    iget-wide p0, p0, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->bitmap:J

    .line 28
    .line 29
    const-wide/16 v4, 0x1

    .line 30
    .line 31
    long-to-int p2, v2

    .line 32
    shl-long v2, v4, p2

    .line 33
    .line 34
    and-long/2addr p0, v2

    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long p0, p0, v2

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return v1

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0
.end method
