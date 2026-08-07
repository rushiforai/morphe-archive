.class public Lorg/spongycastle/crypto/modes/GCMBlockCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private H:[B

.field private J0:[B

.field private S:[B

.field private S_at:[B

.field private S_atPre:[B

.field private atBlock:[B

.field private atBlockPos:I

.field private atLength:J

.field private atLengthPre:J

.field private bufBlock:[B

.field private bufOff:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private counter:[B

.field private exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

.field private forEncryption:Z

.field private initialAssociatedText:[B

.field private macBlock:[B

.field private macSize:I

.field private multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

.field private nonce:[B

.field private totalLength:J


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x10

    .line 9
    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    new-instance p2, Lorg/spongycastle/crypto/modes/gcm/Tables8kGCMMultiplier;

    .line 15
    .line 16
    invoke-direct {p2}, Lorg/spongycastle/crypto/modes/gcm/Tables8kGCMMultiplier;-><init>()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 20
    .line 21
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string p0, "cipher required with a block size of 16."

    .line 25
    .line 26
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    throw p0
.end method

.method private gCTRBlock([B[BI)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->getNextCounterBlock()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    invoke-static {v0, v1, p2, p3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 15
    .line 16
    iget-boolean p3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    move-object p1, v0

    .line 21
    :cond_0
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 22
    .line 23
    .line 24
    iget-wide p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 25
    .line 26
    const-wide/16 v0, 0x10

    .line 27
    .line 28
    add-long/2addr p1, v0

    .line 29
    iput-wide p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 30
    .line 31
    return-void
.end method

.method private gCTRPartial([BII[BI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->getNextCounterBlock()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1, p2, p3}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[BII)V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-static {v0, p2, p4, p5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    iget-object p4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 13
    .line 14
    iget-boolean p5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 15
    .line 16
    if-eqz p5, :cond_0

    .line 17
    .line 18
    move-object p1, v0

    .line 19
    :cond_0
    invoke-direct {p0, p4, p1, p2, p3}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 20
    .line 21
    .line 22
    iget-wide p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 23
    .line 24
    int-to-long p3, p3

    .line 25
    add-long/2addr p1, p3

    .line 26
    iput-wide p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 27
    .line 28
    return-void
.end method

.method private gHASH([B[BI)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p3, :cond_0

    .line 3
    .line 4
    sub-int v1, p3, v0

    .line 5
    .line 6
    const/16 v2, 0x10

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x10

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method private gHASHBlock([B[B)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->multiplyH([B)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private gHASHPartial([B[BII)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[BII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->multiplyH([B)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private getNextCounterBlock()[B
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    aget-byte v2, v0, v1

    .line 6
    .line 7
    and-int/lit16 v2, v2, 0xff

    .line 8
    .line 9
    add-int/lit8 v2, v2, 0x1

    .line 10
    .line 11
    int-to-byte v3, v2

    .line 12
    aput-byte v3, v0, v1

    .line 13
    .line 14
    ushr-int/lit8 v1, v2, 0x8

    .line 15
    .line 16
    const/16 v2, 0xe

    .line 17
    .line 18
    aget-byte v3, v0, v2

    .line 19
    .line 20
    and-int/lit16 v3, v3, 0xff

    .line 21
    .line 22
    add-int/2addr v1, v3

    .line 23
    int-to-byte v3, v1

    .line 24
    aput-byte v3, v0, v2

    .line 25
    .line 26
    ushr-int/lit8 v1, v1, 0x8

    .line 27
    .line 28
    const/16 v2, 0xd

    .line 29
    .line 30
    aget-byte v3, v0, v2

    .line 31
    .line 32
    and-int/lit16 v3, v3, 0xff

    .line 33
    .line 34
    add-int/2addr v1, v3

    .line 35
    int-to-byte v3, v1

    .line 36
    aput-byte v3, v0, v2

    .line 37
    .line 38
    ushr-int/lit8 v1, v1, 0x8

    .line 39
    .line 40
    const/16 v2, 0xc

    .line 41
    .line 42
    aget-byte v3, v0, v2

    .line 43
    .line 44
    and-int/lit16 v3, v3, 0xff

    .line 45
    .line 46
    add-int/2addr v1, v3

    .line 47
    int-to-byte v1, v1

    .line 48
    aput-byte v1, v0, v2

    .line 49
    .line 50
    const/16 v1, 0x10

    .line 51
    .line 52
    new-array v1, v1, [B

    .line 53
    .line 54
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-interface {p0, v0, v2, v1, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 58
    .line 59
    .line 60
    return-object v1
.end method

.method private initCipher()V
    .locals 9

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 13
    .line 14
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 15
    .line 16
    invoke-static {v0, v4, v5, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    iget-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 20
    .line 21
    iput-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 22
    .line 23
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 28
    .line 29
    iget-object v6, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 30
    .line 31
    invoke-direct {p0, v5, v6, v4, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 32
    .line 33
    .line 34
    iget-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 35
    .line 36
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 37
    .line 38
    int-to-long v7, v0

    .line 39
    add-long/2addr v5, v7

    .line 40
    iput-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 41
    .line 42
    :cond_1
    iget-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 43
    .line 44
    cmp-long v0, v5, v2

    .line 45
    .line 46
    if-lez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 49
    .line 50
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 51
    .line 52
    invoke-static {v0, v4, p0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method private outputBlock([BI)V
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    add-int/lit8 v1, p2, 0x10

    .line 3
    .line 4
    if-lt v0, v1, :cond_2

    .line 5
    .line 6
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initCipher()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 18
    .line 19
    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gCTRBlock([B[BI)V

    .line 20
    .line 21
    .line 22
    iget-boolean p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iput p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 31
    .line 32
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 33
    .line 34
    const/16 v1, 0x10

    .line 35
    .line 36
    invoke-static {p1, v1, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    iget p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 40
    .line 41
    iput p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    const-string p0, "Output buffer too short"

    .line 45
    .line 46
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private reset(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x10

    .line 7
    .line 8
    new-array v1, v0, [B

    .line 9
    .line 10
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 11
    .line 12
    new-array v1, v0, [B

    .line 13
    .line 14
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 15
    .line 16
    new-array v1, v0, [B

    .line 17
    .line 18
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 19
    .line 20
    new-array v0, v0, [B

    .line 21
    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 26
    .line 27
    const-wide/16 v1, 0x0

    .line 28
    .line 29
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 30
    .line 31
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 32
    .line 33
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 34
    .line 35
    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iput-object v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    .line 40
    .line 41
    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 42
    .line 43
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 44
    .line 45
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-static {v1, v0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 50
    .line 51
    .line 52
    :cond_0
    if-eqz p1, :cond_1

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 56
    .line 57
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 58
    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    array-length v1, p1

    .line 62
    invoke-virtual {p0, p1, v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->processAADBytes([BII)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initCipher()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 15
    .line 16
    const-string v4, "Output buffer too short"

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    array-length v1, p1

    .line 21
    add-int v5, p2, v0

    .line 22
    .line 23
    iget v6, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 24
    .line 25
    add-int/2addr v5, v6

    .line 26
    if-lt v1, v5, :cond_1

    .line 27
    .line 28
    :goto_0
    move v9, v0

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    invoke-static {v4}, Ll/g;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :goto_1
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_2
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 36
    .line 37
    if-lt v0, v1, :cond_b

    .line 38
    .line 39
    sub-int/2addr v0, v1

    .line 40
    array-length v1, p1

    .line 41
    add-int v5, p2, v0

    .line 42
    .line 43
    if-lt v1, v5, :cond_a

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_2
    if-lez v9, :cond_3

    .line 47
    .line 48
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    move-object v6, p0

    .line 52
    move-object v10, p1

    .line 53
    move v11, p2

    .line 54
    invoke-direct/range {v6 .. v11}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gCTRPartial([BII[BI)V

    .line 55
    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    move-object v6, p0

    .line 59
    move-object v10, p1

    .line 60
    move v11, p2

    .line 61
    :goto_3
    iget-wide p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 62
    .line 63
    iget p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 64
    .line 65
    int-to-long v0, p2

    .line 66
    add-long/2addr p0, v0

    .line 67
    iput-wide p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 68
    .line 69
    iget-wide v0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 70
    .line 71
    cmp-long p0, p0, v0

    .line 72
    .line 73
    const/16 p1, 0x10

    .line 74
    .line 75
    const-wide/16 v0, 0x8

    .line 76
    .line 77
    const/4 v4, 0x0

    .line 78
    if-lez p0, :cond_7

    .line 79
    .line 80
    if-lez p2, :cond_4

    .line 81
    .line 82
    iget-object p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 83
    .line 84
    iget-object v5, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 85
    .line 86
    invoke-direct {v6, p0, v5, v4, p2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-wide v7, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 90
    .line 91
    cmp-long p0, v7, v2

    .line 92
    .line 93
    if-lez p0, :cond_5

    .line 94
    .line 95
    iget-object p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 96
    .line 97
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 98
    .line 99
    invoke-static {p0, p2}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 100
    .line 101
    .line 102
    :cond_5
    iget-wide v2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 103
    .line 104
    mul-long/2addr v2, v0

    .line 105
    const-wide/16 v7, 0x7f

    .line 106
    .line 107
    add-long/2addr v2, v7

    .line 108
    const/4 p0, 0x7

    .line 109
    ushr-long/2addr v2, p0

    .line 110
    new-array p0, p1, [B

    .line 111
    .line 112
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 113
    .line 114
    if-nez p2, :cond_6

    .line 115
    .line 116
    new-instance p2, Lorg/spongycastle/crypto/modes/gcm/Tables1kGCMExponentiator;

    .line 117
    .line 118
    invoke-direct {p2}, Lorg/spongycastle/crypto/modes/gcm/Tables1kGCMExponentiator;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 122
    .line 123
    iget-object v5, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    .line 124
    .line 125
    invoke-interface {p2, v5}, Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;->init([B)V

    .line 126
    .line 127
    .line 128
    :cond_6
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 129
    .line 130
    invoke-interface {p2, v2, v3, p0}, Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;->exponentiateX(J[B)V

    .line 131
    .line 132
    .line 133
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 134
    .line 135
    invoke-static {p2, p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiply([B[B)V

    .line 136
    .line 137
    .line 138
    iget-object p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 139
    .line 140
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 141
    .line 142
    invoke-static {p0, p2}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 143
    .line 144
    .line 145
    :cond_7
    new-array p0, p1, [B

    .line 146
    .line 147
    iget-wide v2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 148
    .line 149
    mul-long/2addr v2, v0

    .line 150
    invoke-static {v2, v3, p0, v4}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 151
    .line 152
    .line 153
    iget-wide v2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 154
    .line 155
    mul-long/2addr v2, v0

    .line 156
    const/16 p2, 0x8

    .line 157
    .line 158
    invoke-static {v2, v3, p0, p2}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 159
    .line 160
    .line 161
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 162
    .line 163
    invoke-direct {v6, p2, p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 164
    .line 165
    .line 166
    new-array p0, p1, [B

    .line 167
    .line 168
    iget-object p1, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 169
    .line 170
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 171
    .line 172
    invoke-interface {p1, p2, v4, p0, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 173
    .line 174
    .line 175
    iget-object p1, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 176
    .line 177
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 178
    .line 179
    .line 180
    iget p1, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 181
    .line 182
    new-array p2, p1, [B

    .line 183
    .line 184
    iput-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 185
    .line 186
    invoke-static {p0, v4, p2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    .line 188
    .line 189
    iget-boolean p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 190
    .line 191
    if-eqz p0, :cond_8

    .line 192
    .line 193
    iget-object p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 194
    .line 195
    iget p1, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 196
    .line 197
    add-int p2, v11, p1

    .line 198
    .line 199
    iget p1, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 200
    .line 201
    invoke-static {p0, v4, v10, p2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 202
    .line 203
    .line 204
    iget p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 205
    .line 206
    add-int/2addr v9, p0

    .line 207
    goto :goto_4

    .line 208
    :cond_8
    iget p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 209
    .line 210
    new-array p1, p0, [B

    .line 211
    .line 212
    iget-object p2, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 213
    .line 214
    invoke-static {p2, v9, p1, v4, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    .line 216
    .line 217
    iget-object p0, v6, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 218
    .line 219
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-eqz p0, :cond_9

    .line 224
    .line 225
    :goto_4
    invoke-direct {v6, v4}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->reset(Z)V

    .line 226
    .line 227
    .line 228
    return v9

    .line 229
    :cond_9
    const-string p0, "mac check in GCM failed"

    .line 230
    .line 231
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    goto/16 :goto_1

    .line 235
    .line 236
    :cond_a
    invoke-static {v4}, Ll/g;->a(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_1

    .line 240
    .line 241
    :cond_b
    const-string p0, "data too short"

    .line 242
    .line 243
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    goto/16 :goto_1
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 7
    .line 8
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "/GCM"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getMac()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOutputSize(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 2
    .line 3
    add-int/2addr p1, v0

    .line 4
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 5
    .line 6
    iget p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    add-int/2addr p1, p0

    .line 11
    return p1

    .line 12
    :cond_0
    if-ge p1, p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    sub-int/2addr p1, p0

    .line 17
    return p1
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUpdateOutputSize(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 2
    .line 3
    add-int/2addr p1, v0

    .line 4
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 9
    .line 10
    if-ge p1, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    sub-int/2addr p1, p0

    .line 15
    :cond_1
    rem-int/lit8 p0, p1, 0x10

    .line 16
    .line 17
    sub-int/2addr p1, p0

    .line 18
    return p1
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 5
    .line 6
    instance-of v1, p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 7
    .line 8
    const/16 v2, 0x8

    .line 9
    .line 10
    const/16 v3, 0x10

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    check-cast p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 15
    .line 16
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 21
    .line 22
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getAssociatedText()[B

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 27
    .line 28
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/16 v4, 0x20

    .line 33
    .line 34
    if-lt v1, v4, :cond_0

    .line 35
    .line 36
    const/16 v4, 0x80

    .line 37
    .line 38
    if-gt v1, v4, :cond_0

    .line 39
    .line 40
    rem-int/lit8 v4, v1, 0x8

    .line 41
    .line 42
    if-nez v4, :cond_0

    .line 43
    .line 44
    div-int/2addr v1, v2

    .line 45
    iput v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 46
    .line 47
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const-string p0, "Invalid value for MAC size: "

    .line 53
    .line 54
    invoke-static {p0, v1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    instance-of v1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 59
    .line 60
    if-eqz v1, :cond_8

    .line 61
    .line 62
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 63
    .line 64
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 69
    .line 70
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 71
    .line 72
    iput v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 73
    .line 74
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 79
    .line 80
    :goto_0
    if-eqz p1, :cond_2

    .line 81
    .line 82
    move p1, v3

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iget p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 85
    .line 86
    add-int/2addr p1, v3

    .line 87
    :goto_1
    new-array p1, p1, [B

    .line 88
    .line 89
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 90
    .line 91
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 92
    .line 93
    if-eqz p1, :cond_7

    .line 94
    .line 95
    array-length p1, p1

    .line 96
    const/4 v1, 0x1

    .line 97
    if-lt p1, v1, :cond_7

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    if-eqz p2, :cond_3

    .line 101
    .line 102
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 103
    .line 104
    invoke-interface {v4, v1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 105
    .line 106
    .line 107
    new-array p2, v3, [B

    .line 108
    .line 109
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    .line 110
    .line 111
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 112
    .line 113
    invoke-interface {v4, p2, p1, p2, p1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .line 117
    .line 118
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    .line 119
    .line 120
    invoke-interface {p2, v4}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->init([B)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    .line 127
    .line 128
    if-eqz p2, :cond_6

    .line 129
    .line 130
    :goto_2
    new-array p2, v3, [B

    .line 131
    .line 132
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 133
    .line 134
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 135
    .line 136
    array-length v4, v0

    .line 137
    const/16 v5, 0xc

    .line 138
    .line 139
    if-ne v4, v5, :cond_4

    .line 140
    .line 141
    array-length v2, v0

    .line 142
    invoke-static {v0, p1, p2, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    .line 144
    .line 145
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 146
    .line 147
    const/16 v0, 0xf

    .line 148
    .line 149
    aput-byte v1, p2, v0

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_4
    array-length v1, v0

    .line 153
    invoke-direct {p0, p2, v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASH([B[BI)V

    .line 154
    .line 155
    .line 156
    new-array p2, v3, [B

    .line 157
    .line 158
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 159
    .line 160
    array-length v0, v0

    .line 161
    int-to-long v0, v0

    .line 162
    const-wide/16 v4, 0x8

    .line 163
    .line 164
    mul-long/2addr v0, v4

    .line 165
    invoke-static {v0, v1, p2, v2}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 169
    .line 170
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 171
    .line 172
    .line 173
    :goto_3
    new-array p2, v3, [B

    .line 174
    .line 175
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 176
    .line 177
    new-array p2, v3, [B

    .line 178
    .line 179
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 180
    .line 181
    new-array p2, v3, [B

    .line 182
    .line 183
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 184
    .line 185
    new-array p2, v3, [B

    .line 186
    .line 187
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 188
    .line 189
    iput p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 190
    .line 191
    const-wide/16 v0, 0x0

    .line 192
    .line 193
    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 194
    .line 195
    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 196
    .line 197
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 198
    .line 199
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    .line 204
    .line 205
    iput p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 206
    .line 207
    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 208
    .line 209
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 210
    .line 211
    if-eqz p2, :cond_5

    .line 212
    .line 213
    array-length v0, p2

    .line 214
    invoke-virtual {p0, p2, p1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->processAADBytes([BII)V

    .line 215
    .line 216
    .line 217
    :cond_5
    return-void

    .line 218
    :cond_6
    const-string p0, "Key must be specified in initial init"

    .line 219
    .line 220
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :cond_7
    const-string p0, "IV must be at least 1 byte"

    .line 225
    .line 226
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_8
    const-string p0, "invalid parameters passed to GCM"

    .line 231
    .line 232
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public processAADByte(B)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 4
    .line 5
    aput-byte p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 10
    .line 11
    const/16 p1, 0x10

    .line 12
    .line 13
    if-ne v1, p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 16
    .line 17
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 22
    .line 23
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 24
    .line 25
    const-wide/16 v2, 0x10

    .line 26
    .line 27
    add-long/2addr v0, v2

    .line 28
    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public processAADBytes([BII)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p3, :cond_1

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 8
    .line 9
    add-int v4, p2, v1

    .line 10
    .line 11
    aget-byte v4, p1, v4

    .line 12
    .line 13
    aput-byte v4, v2, v3

    .line 14
    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    iput v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 18
    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    if-ne v3, v4, :cond_0

    .line 22
    .line 23
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 24
    .line 25
    invoke-direct {p0, v3, v2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 26
    .line 27
    .line 28
    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 29
    .line 30
    iget-wide v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 31
    .line 32
    const-wide/16 v4, 0x10

    .line 33
    .line 34
    add-long/2addr v2, v4

    .line 35
    iput-wide v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 36
    .line 37
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method public processByte(B[BI)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 4
    .line 5
    aput-byte p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 10
    .line 11
    array-length p1, v0

    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, p2, p3}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->outputBlock([BI)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x10

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public processBytes([BII[BI)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    add-int v1, p2, p3

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-lt v0, v1, :cond_2

    .line 6
    .line 7
    move v0, v2

    .line 8
    :goto_0
    if-ge v2, p3, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 11
    .line 12
    iget v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 13
    .line 14
    add-int v4, p2, v2

    .line 15
    .line 16
    aget-byte v4, p1, v4

    .line 17
    .line 18
    aput-byte v4, v1, v3

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    iput v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 23
    .line 24
    array-length v1, v1

    .line 25
    if-ne v3, v1, :cond_0

    .line 26
    .line 27
    add-int v1, p5, v0

    .line 28
    .line 29
    invoke-direct {p0, p4, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->outputBlock([BI)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x10

    .line 33
    .line 34
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return v0

    .line 38
    :cond_2
    const-string p0, "Input buffer too short"

    .line 39
    .line 40
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v2
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x1

    .line 66
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->reset(Z)V

    return-void
.end method
