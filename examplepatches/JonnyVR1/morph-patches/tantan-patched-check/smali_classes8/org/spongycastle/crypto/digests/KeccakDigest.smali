.class public Lorg/spongycastle/crypto/digests/KeccakDigest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;


# static fields
.field private static KeccakRhoOffsets:[I

.field private static KeccakRoundConstants:[J


# instance fields
.field C:[J

.field protected bitsAvailableForSqueezing:I

.field protected bitsInQueue:I

.field chiC:[J

.field protected chunk:[B

.field protected dataQueue:[B

.field protected fixedOutputLength:I

.field protected oneByte:[B

.field protected rate:I

.field protected squeezing:Z

.field protected state:[B

.field tempA:[J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakInitializeRoundConstants()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRoundConstants:[J

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakInitializeRhoOffsets()[I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x120

    .line 90
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc8

    .line 84
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    const/16 v0, 0xc0

    .line 85
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    const/4 v0, 0x5

    .line 86
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    const/16 v1, 0x19

    .line 87
    new-array v1, v1, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 88
    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 89
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->init(I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/KeccakDigest;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xc8

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 9
    .line 10
    const/16 v1, 0xc0

    .line 11
    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    new-array v2, v1, [J

    .line 18
    .line 19
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 20
    .line 21
    const/16 v2, 0x19

    .line 22
    .line 23
    new-array v2, v2, [J

    .line 24
    .line 25
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 26
    .line 27
    new-array v1, v1, [J

    .line 28
    .line 29
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 30
    .line 31
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 32
    .line 33
    array-length v2, v1

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 39
    .line 40
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 41
    .line 42
    array-length v2, v0

    .line 43
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 47
    .line 48
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 49
    .line 50
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 51
    .line 52
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 53
    .line 54
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 55
    .line 56
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 57
    .line 58
    iget-boolean v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 59
    .line 60
    iput-boolean v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 61
    .line 62
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 63
    .line 64
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 65
    .line 66
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 67
    .line 68
    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 73
    .line 74
    iget-object p1, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 75
    .line 76
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 81
    .line 82
    return-void
.end method

.method private KeccakAbsorb([B[BI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutationAfterXor([B[BI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private KeccakExtract([B[BI)V
    .locals 0

    .line 1
    mul-int/lit8 p3, p3, 0x8

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {p1, p0, p2, p0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private KeccakExtract1024bits([B[B)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/16 v0, 0x80

    .line 3
    .line 4
    invoke-static {p1, p0, p2, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private static LFSR86540([B)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-byte v1, p0, v0

    .line 3
    .line 4
    and-int/lit8 v2, v1, 0x1

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    move v2, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v2, v0

    .line 12
    :goto_0
    and-int/lit16 v4, v1, 0x80

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    shl-int/2addr v1, v3

    .line 17
    xor-int/lit8 v1, v1, 0x71

    .line 18
    .line 19
    int-to-byte v1, v1

    .line 20
    aput-byte v1, p0, v0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_1
    shl-int/2addr v1, v3

    .line 24
    int-to-byte v1, v1

    .line 25
    aput-byte v1, p0, v0

    .line 26
    .line 27
    return v2
.end method

.method private absorbQueue()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 6
    .line 7
    div-int/lit8 v2, v2, 0x8

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakAbsorb([B[BI)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 14
    .line 15
    return-void
.end method

.method private chi([J)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x5

    .line 4
    if-ge v1, v2, :cond_2

    .line 5
    .line 6
    move v3, v0

    .line 7
    :goto_1
    if-ge v3, v2, :cond_0

    .line 8
    .line 9
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 10
    .line 11
    mul-int/lit8 v5, v1, 0x5

    .line 12
    .line 13
    add-int v6, v3, v5

    .line 14
    .line 15
    aget-wide v6, p1, v6

    .line 16
    .line 17
    add-int/lit8 v8, v3, 0x1

    .line 18
    .line 19
    rem-int/lit8 v9, v8, 0x5

    .line 20
    .line 21
    add-int/2addr v9, v5

    .line 22
    aget-wide v9, p1, v9

    .line 23
    .line 24
    not-long v9, v9

    .line 25
    add-int/lit8 v11, v3, 0x2

    .line 26
    .line 27
    rem-int/2addr v11, v2

    .line 28
    add-int/2addr v11, v5

    .line 29
    aget-wide v11, p1, v11

    .line 30
    .line 31
    and-long/2addr v9, v11

    .line 32
    xor-long v5, v6, v9

    .line 33
    .line 34
    aput-wide v5, v4, v3

    .line 35
    .line 36
    move v3, v8

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    move v3, v0

    .line 39
    :goto_2
    if-ge v3, v2, :cond_1

    .line 40
    .line 41
    mul-int/lit8 v4, v1, 0x5

    .line 42
    .line 43
    add-int/2addr v4, v3

    .line 44
    iget-object v5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 45
    .line 46
    aget-wide v6, v5, v3

    .line 47
    .line 48
    aput-wide v6, p1, v4

    .line 49
    .line 50
    add-int/lit8 v3, v3, 0x1

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    return-void
.end method

.method private clearDataQueueSection(II)V
    .locals 3

    .line 1
    move v0, p1

    .line 2
    :goto_0
    add-int v1, p1, p2

    .line 3
    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-byte v2, v1, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void
.end method

.method private fromBytesToWords([J[B)V
    .locals 9

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    const/16 v1, 0x19

    .line 4
    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    aput-wide v1, p1, v0

    .line 10
    .line 11
    mul-int/lit8 v1, v0, 0x8

    .line 12
    .line 13
    move v2, p0

    .line 14
    :goto_1
    const/16 v3, 0x8

    .line 15
    .line 16
    if-ge v2, v3, :cond_0

    .line 17
    .line 18
    aget-wide v3, p1, v0

    .line 19
    .line 20
    add-int v5, v1, v2

    .line 21
    .line 22
    aget-byte v5, p2, v5

    .line 23
    .line 24
    int-to-long v5, v5

    .line 25
    const-wide/16 v7, 0xff

    .line 26
    .line 27
    and-long/2addr v5, v7

    .line 28
    mul-int/lit8 v7, v2, 0x8

    .line 29
    .line 30
    shl-long/2addr v5, v7

    .line 31
    or-long/2addr v3, v5

    .line 32
    aput-wide v3, p1, v0

    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method private fromWordsToBytes([B[J)V
    .locals 8

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    const/16 v1, 0x19

    .line 4
    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    mul-int/lit8 v1, v0, 0x8

    .line 8
    .line 9
    move v2, p0

    .line 10
    :goto_1
    const/16 v3, 0x8

    .line 11
    .line 12
    if-ge v2, v3, :cond_0

    .line 13
    .line 14
    add-int v3, v1, v2

    .line 15
    .line 16
    aget-wide v4, p2, v0

    .line 17
    .line 18
    mul-int/lit8 v6, v2, 0x8

    .line 19
    .line 20
    ushr-long/2addr v4, v6

    .line 21
    const-wide/16 v6, 0xff

    .line 22
    .line 23
    and-long/2addr v4, v6

    .line 24
    long-to-int v4, v4

    .line 25
    int-to-byte v4, v4

    .line 26
    aput-byte v4, p1, v3

    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-void
.end method

.method private init(I)V
    .locals 4

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    const/16 v1, 0x100

    .line 4
    .line 5
    if-eq p1, v0, :cond_5

    .line 6
    .line 7
    const/16 v0, 0xe0

    .line 8
    .line 9
    if-eq p1, v0, :cond_4

    .line 10
    .line 11
    const/16 v0, 0x200

    .line 12
    .line 13
    if-eq p1, v1, :cond_3

    .line 14
    .line 15
    const/16 v1, 0x120

    .line 16
    .line 17
    const/16 v2, 0x400

    .line 18
    .line 19
    const/16 v3, 0x240

    .line 20
    .line 21
    if-eq p1, v1, :cond_2

    .line 22
    .line 23
    const/16 v1, 0x180

    .line 24
    .line 25
    if-eq p1, v1, :cond_1

    .line 26
    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    invoke-direct {p0, v3, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const-string p0, "bitLength must be one of 128, 224, 256, 288, 384, or 512."

    .line 34
    .line 35
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const/16 p1, 0x340

    .line 40
    .line 41
    const/16 v0, 0x300

    .line 42
    .line 43
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    const/16 p1, 0x440

    .line 52
    .line 53
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_4
    const/16 p1, 0x480

    .line 58
    .line 59
    const/16 v0, 0x1c0

    .line 60
    .line 61
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_5
    const/16 p1, 0x540

    .line 66
    .line 67
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private initSponge(II)V
    .locals 2

    .line 1
    add-int v0, p1, p2

    .line 2
    .line 3
    const/16 v1, 0x640

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    if-ge p1, v1, :cond_0

    .line 10
    .line 11
    rem-int/lit8 v0, p1, 0x40

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iput p1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 16
    .line 17
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 24
    .line 25
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 26
    .line 27
    .line 28
    iput v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 29
    .line 30
    iput-boolean v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 31
    .line 32
    iput v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 33
    .line 34
    div-int/lit8 p2, p2, 0x2

    .line 35
    .line 36
    iput p2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 37
    .line 38
    div-int/lit8 p1, p1, 0x8

    .line 39
    .line 40
    new-array p1, p1, [B

    .line 41
    .line 42
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    new-array p1, p1, [B

    .line 46
    .line 47
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const-string p0, "invalid rate value"

    .line 51
    .line 52
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    const-string p0, "rate + capacity != 1600"

    .line 57
    .line 58
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private iota([JI)V
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-wide v0, p1, p0

    .line 3
    .line 4
    sget-object v2, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRoundConstants:[J

    .line 5
    .line 6
    aget-wide v3, v2, p2

    .line 7
    .line 8
    xor-long/2addr v0, v3

    .line 9
    aput-wide v0, p1, p0

    .line 10
    .line 11
    return-void
.end method

.method private static keccakInitializeRhoOffsets()[I
    .locals 6

    .line 1
    const/16 v0, 0x19

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput v1, v0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    move v3, v2

    .line 10
    move v2, v1

    .line 11
    :goto_0
    const/16 v4, 0x18

    .line 12
    .line 13
    if-ge v1, v4, :cond_0

    .line 14
    .line 15
    rem-int/lit8 v4, v3, 0x5

    .line 16
    .line 17
    rem-int/lit8 v5, v2, 0x5

    .line 18
    .line 19
    mul-int/lit8 v5, v5, 0x5

    .line 20
    .line 21
    add-int/2addr v4, v5

    .line 22
    add-int/lit8 v5, v1, 0x1

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x2

    .line 25
    .line 26
    mul-int/2addr v1, v5

    .line 27
    div-int/lit8 v1, v1, 0x2

    .line 28
    .line 29
    rem-int/lit8 v1, v1, 0x40

    .line 30
    .line 31
    aput v1, v0, v4

    .line 32
    .line 33
    rem-int/lit8 v1, v2, 0x5

    .line 34
    .line 35
    mul-int/lit8 v3, v3, 0x2

    .line 36
    .line 37
    mul-int/lit8 v2, v2, 0x3

    .line 38
    .line 39
    add-int/2addr v3, v2

    .line 40
    rem-int/lit8 v2, v3, 0x5

    .line 41
    .line 42
    move v3, v1

    .line 43
    move v1, v5

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-object v0
.end method

.method private static keccakInitializeRoundConstants()[J
    .locals 12

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    new-array v1, v0, [J

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    new-array v3, v2, [B

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    aput-byte v2, v3, v4

    .line 10
    .line 11
    move v5, v4

    .line 12
    :goto_0
    if-ge v5, v0, :cond_2

    .line 13
    .line 14
    const-wide/16 v6, 0x0

    .line 15
    .line 16
    aput-wide v6, v1, v5

    .line 17
    .line 18
    move v6, v4

    .line 19
    :goto_1
    const/4 v7, 0x7

    .line 20
    if-ge v6, v7, :cond_1

    .line 21
    .line 22
    shl-int v7, v2, v6

    .line 23
    .line 24
    sub-int/2addr v7, v2

    .line 25
    invoke-static {v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->LFSR86540([B)Z

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    if-eqz v8, :cond_0

    .line 30
    .line 31
    aget-wide v8, v1, v5

    .line 32
    .line 33
    const-wide/16 v10, 0x1

    .line 34
    .line 35
    shl-long/2addr v10, v7

    .line 36
    xor-long v7, v8, v10

    .line 37
    .line 38
    aput-wide v7, v1, v5

    .line 39
    .line 40
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return-object v1
.end method

.method private keccakPermutation([B)V
    .locals 1

    .line 1
    array-length v0, p1

    .line 2
    div-int/lit8 v0, v0, 0x8

    .line 3
    .line 4
    new-array v0, v0, [J

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->fromBytesToWords([J[B)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutationOnWords([J)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->fromWordsToBytes([B[J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private keccakPermutationAfterXor([B[BI)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p3, :cond_0

    .line 3
    .line 4
    aget-byte v1, p1, v0

    .line 5
    .line 6
    aget-byte v2, p2, v0

    .line 7
    .line 8
    xor-int/2addr v1, v2

    .line 9
    int-to-byte v1, v1

    .line 10
    aput-byte v1, p1, v0

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutation([B)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private keccakPermutationOnWords([J)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/16 v1, 0x18

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->theta([J)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->rho([J)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->pi([J)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->chi([J)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->iota([JI)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private padAndSwitchToSqueezingPhase()V
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 11
    .line 12
    div-int/lit8 v2, v0, 0x8

    .line 13
    .line 14
    aget-byte v4, v1, v2

    .line 15
    .line 16
    rem-int/lit8 v0, v0, 0x8

    .line 17
    .line 18
    shl-int v0, v3, v0

    .line 19
    .line 20
    or-int/2addr v0, v4

    .line 21
    int-to-byte v0, v0

    .line 22
    aput-byte v0, v1, v2

    .line 23
    .line 24
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 28
    .line 29
    div-int/lit8 v0, v0, 0x8

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->clearDataQueueSection(II)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    add-int/lit8 v1, v0, 0x7

    .line 37
    .line 38
    div-int/lit8 v1, v1, 0x8

    .line 39
    .line 40
    div-int/lit8 v2, v2, 0x8

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x7

    .line 43
    .line 44
    div-int/lit8 v0, v0, 0x8

    .line 45
    .line 46
    sub-int/2addr v2, v0

    .line 47
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->clearDataQueueSection(II)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 51
    .line 52
    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 53
    .line 54
    div-int/lit8 v2, v1, 0x8

    .line 55
    .line 56
    aget-byte v4, v0, v2

    .line 57
    .line 58
    rem-int/lit8 v1, v1, 0x8

    .line 59
    .line 60
    shl-int v1, v3, v1

    .line 61
    .line 62
    or-int/2addr v1, v4

    .line 63
    int-to-byte v1, v1

    .line 64
    aput-byte v1, v0, v2

    .line 65
    .line 66
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 67
    .line 68
    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 69
    .line 70
    add-int/lit8 v2, v1, -0x1

    .line 71
    .line 72
    div-int/lit8 v2, v2, 0x8

    .line 73
    .line 74
    aget-byte v4, v0, v2

    .line 75
    .line 76
    sub-int/2addr v1, v3

    .line 77
    rem-int/lit8 v1, v1, 0x8

    .line 78
    .line 79
    shl-int v1, v3, v1

    .line 80
    .line 81
    or-int/2addr v1, v4

    .line 82
    int-to-byte v1, v1

    .line 83
    aput-byte v1, v0, v2

    .line 84
    .line 85
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 89
    .line 90
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 91
    .line 92
    const/16 v2, 0x400

    .line 93
    .line 94
    if-ne v0, v2, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 97
    .line 98
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract1024bits([B[B)V

    .line 99
    .line 100
    .line 101
    iput v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_1
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 105
    .line 106
    div-int/lit8 v0, v0, 0x40

    .line 107
    .line 108
    invoke-direct {p0, v1, v2, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract([B[BI)V

    .line 109
    .line 110
    .line 111
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 112
    .line 113
    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 114
    .line 115
    :goto_1
    iput-boolean v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 116
    .line 117
    return-void
.end method

.method private pi([J)V
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    .line 7
    .line 8
    move v0, v2

    .line 9
    :goto_0
    const/4 v1, 0x5

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    move v3, v2

    .line 13
    :goto_1
    if-ge v3, v1, :cond_0

    .line 14
    .line 15
    mul-int/lit8 v4, v0, 0x2

    .line 16
    .line 17
    mul-int/lit8 v5, v3, 0x3

    .line 18
    .line 19
    add-int/2addr v4, v5

    .line 20
    rem-int/2addr v4, v1

    .line 21
    mul-int/2addr v4, v1

    .line 22
    add-int/2addr v4, v3

    .line 23
    iget-object v5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 24
    .line 25
    mul-int/lit8 v6, v3, 0x5

    .line 26
    .line 27
    add-int/2addr v6, v0

    .line 28
    aget-wide v6, v5, v6

    .line 29
    .line 30
    aput-wide v6, p1, v4

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method private rho([J)V
    .locals 9

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    const/4 v1, 0x5

    .line 4
    if-ge v0, v1, :cond_2

    .line 5
    .line 6
    move v2, p0

    .line 7
    :goto_1
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    mul-int/lit8 v3, v2, 0x5

    .line 10
    .line 11
    add-int/2addr v3, v0

    .line 12
    sget-object v4, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    .line 13
    .line 14
    aget v4, v4, v3

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    aget-wide v5, p1, v3

    .line 19
    .line 20
    shl-long v7, v5, v4

    .line 21
    .line 22
    rsub-int/lit8 v4, v4, 0x40

    .line 23
    .line 24
    ushr-long v4, v5, v4

    .line 25
    .line 26
    xor-long/2addr v4, v7

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    aget-wide v4, p1, v3

    .line 29
    .line 30
    :goto_2
    aput-wide v4, p1, v3

    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return-void
.end method

.method private theta([J)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x5

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    aput-wide v4, v3, v1

    .line 11
    .line 12
    move v3, v0

    .line 13
    :goto_1
    if-ge v3, v2, :cond_0

    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 16
    .line 17
    aget-wide v5, v4, v1

    .line 18
    .line 19
    mul-int/lit8 v7, v3, 0x5

    .line 20
    .line 21
    add-int/2addr v7, v1

    .line 22
    aget-wide v7, p1, v7

    .line 23
    .line 24
    xor-long/2addr v5, v7

    .line 25
    aput-wide v5, v4, v1

    .line 26
    .line 27
    add-int/lit8 v3, v3, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v1, v0

    .line 34
    :goto_2
    if-ge v1, v2, :cond_3

    .line 35
    .line 36
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 37
    .line 38
    add-int/lit8 v4, v1, 0x1

    .line 39
    .line 40
    rem-int/lit8 v5, v4, 0x5

    .line 41
    .line 42
    aget-wide v5, v3, v5

    .line 43
    .line 44
    const/4 v7, 0x1

    .line 45
    shl-long v7, v5, v7

    .line 46
    .line 47
    const/16 v9, 0x3f

    .line 48
    .line 49
    ushr-long/2addr v5, v9

    .line 50
    xor-long/2addr v5, v7

    .line 51
    add-int/lit8 v7, v1, 0x4

    .line 52
    .line 53
    rem-int/2addr v7, v2

    .line 54
    aget-wide v7, v3, v7

    .line 55
    .line 56
    xor-long/2addr v5, v7

    .line 57
    move v3, v0

    .line 58
    :goto_3
    if-ge v3, v2, :cond_2

    .line 59
    .line 60
    mul-int/lit8 v7, v3, 0x5

    .line 61
    .line 62
    add-int/2addr v7, v1

    .line 63
    aget-wide v8, p1, v7

    .line 64
    .line 65
    xor-long/2addr v8, v5

    .line 66
    aput-wide v8, p1, v7

    .line 67
    .line 68
    add-int/lit8 v3, v3, 0x1

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_2
    move v1, v4

    .line 72
    goto :goto_2

    .line 73
    :cond_3
    return-void
.end method


# virtual methods
.method public absorb([BIJ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 8
    .line 9
    rem-int/lit8 v3, v3, 0x8

    .line 10
    .line 11
    if-nez v3, :cond_7

    .line 12
    .line 13
    iget-boolean v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 14
    .line 15
    if-nez v3, :cond_6

    .line 16
    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    :cond_0
    :goto_0
    cmp-long v7, v5, p3

    .line 20
    .line 21
    if-gez v7, :cond_5

    .line 22
    .line 23
    iget v7, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 24
    .line 25
    const-wide/16 v8, 0x8

    .line 26
    .line 27
    if-nez v7, :cond_2

    .line 28
    .line 29
    iget v10, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 30
    .line 31
    int-to-long v11, v10

    .line 32
    cmp-long v11, p3, v11

    .line 33
    .line 34
    if-ltz v11, :cond_2

    .line 35
    .line 36
    int-to-long v11, v10

    .line 37
    sub-long v11, p3, v11

    .line 38
    .line 39
    cmp-long v11, v5, v11

    .line 40
    .line 41
    if-gtz v11, :cond_2

    .line 42
    .line 43
    sub-long v11, p3, v5

    .line 44
    .line 45
    int-to-long v13, v10

    .line 46
    div-long/2addr v11, v13

    .line 47
    const-wide/16 v13, 0x0

    .line 48
    .line 49
    :goto_1
    cmp-long v7, v13, v11

    .line 50
    .line 51
    if-gez v7, :cond_1

    .line 52
    .line 53
    int-to-long v3, v2

    .line 54
    div-long v15, v5, v8

    .line 55
    .line 56
    add-long/2addr v3, v15

    .line 57
    iget-object v7, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 58
    .line 59
    array-length v10, v7

    .line 60
    move-wide v15, v8

    .line 61
    int-to-long v8, v10

    .line 62
    mul-long/2addr v8, v13

    .line 63
    add-long/2addr v3, v8

    .line 64
    long-to-int v3, v3

    .line 65
    const/4 v4, 0x0

    .line 66
    array-length v8, v7

    .line 67
    invoke-static {v1, v3, v7, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    .line 69
    .line 70
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 71
    .line 72
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 73
    .line 74
    array-length v7, v4

    .line 75
    invoke-direct {v0, v3, v4, v7}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakAbsorb([B[BI)V

    .line 76
    .line 77
    .line 78
    const-wide/16 v3, 0x1

    .line 79
    .line 80
    add-long/2addr v13, v3

    .line 81
    move-wide v8, v15

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    iget v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 84
    .line 85
    int-to-long v3, v3

    .line 86
    mul-long/2addr v11, v3

    .line 87
    add-long/2addr v5, v11

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    move-wide v15, v8

    .line 90
    sub-long v3, p3, v5

    .line 91
    .line 92
    long-to-int v3, v3

    .line 93
    add-int v4, v3, v7

    .line 94
    .line 95
    iget v8, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 96
    .line 97
    if-le v4, v8, :cond_3

    .line 98
    .line 99
    sub-int v3, v8, v7

    .line 100
    .line 101
    :cond_3
    rem-int/lit8 v4, v3, 0x8

    .line 102
    .line 103
    sub-int/2addr v3, v4

    .line 104
    div-long v8, v5, v15

    .line 105
    .line 106
    long-to-int v8, v8

    .line 107
    add-int/2addr v8, v2

    .line 108
    iget-object v9, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 109
    .line 110
    div-int/lit8 v7, v7, 0x8

    .line 111
    .line 112
    div-int/lit8 v10, v3, 0x8

    .line 113
    .line 114
    invoke-static {v1, v8, v9, v7, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    .line 116
    .line 117
    iget v7, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 118
    .line 119
    add-int/2addr v7, v3

    .line 120
    iput v7, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 121
    .line 122
    int-to-long v8, v3

    .line 123
    add-long/2addr v5, v8

    .line 124
    iget v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 125
    .line 126
    if-ne v7, v3, :cond_4

    .line 127
    .line 128
    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 129
    .line 130
    .line 131
    :cond_4
    if-lez v4, :cond_0

    .line 132
    .line 133
    const/4 v3, 0x1

    .line 134
    shl-int v7, v3, v4

    .line 135
    .line 136
    sub-int/2addr v7, v3

    .line 137
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 138
    .line 139
    iget v8, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 140
    .line 141
    div-int/lit8 v9, v8, 0x8

    .line 142
    .line 143
    div-long v10, v5, v15

    .line 144
    .line 145
    long-to-int v10, v10

    .line 146
    add-int/2addr v10, v2

    .line 147
    aget-byte v10, v1, v10

    .line 148
    .line 149
    and-int/2addr v7, v10

    .line 150
    int-to-byte v7, v7

    .line 151
    aput-byte v7, v3, v9

    .line 152
    .line 153
    add-int/2addr v8, v4

    .line 154
    iput v8, v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 155
    .line 156
    int-to-long v3, v4

    .line 157
    add-long/2addr v5, v3

    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_5
    return-void

    .line 161
    :cond_6
    const-string v0, "attempt to absorb while squeezing."

    .line 162
    .line 163
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_7
    const-string v0, "attempt to absorb with odd length queue."

    .line 168
    .line 169
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public doFinal([BI)I
    .locals 2

    .line 26
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 27
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    move-result p0

    return p0
.end method

.method public doFinal([BIBI)I
    .locals 2

    .line 1
    if-lez p4, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput-byte p3, v0, v1

    .line 7
    .line 8
    int-to-long p3, p4

    .line 9
    invoke-virtual {p0, v0, v1, p3, p4}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget p3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 13
    .line 14
    int-to-long p3, p3

    .line 15
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Keccak-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getByteLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x8

    .line 4
    .line 5
    return p0
.end method

.method public getDigestSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x8

    .line 4
    .line 5
    return p0
.end method

.method public reset()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->init(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public squeeze([BIJ)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->padAndSwitchToSqueezingPhase()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const-wide/16 v0, 0x8

    .line 9
    .line 10
    rem-long v2, p3, v0

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    if-nez v2, :cond_5

    .line 17
    .line 18
    :goto_0
    cmp-long v2, v4, p3

    .line 19
    .line 20
    if-gez v2, :cond_4

    .line 21
    .line 22
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 23
    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 27
    .line 28
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutation([B)V

    .line 29
    .line 30
    .line 31
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 32
    .line 33
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 34
    .line 35
    const/16 v6, 0x400

    .line 36
    .line 37
    if-ne v2, v6, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 40
    .line 41
    invoke-direct {p0, v3, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract1024bits([B[B)V

    .line 42
    .line 43
    .line 44
    iput v6, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget-object v6, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 48
    .line 49
    div-int/lit8 v2, v2, 0x40

    .line 50
    .line 51
    invoke-direct {p0, v3, v6, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract([B[BI)V

    .line 52
    .line 53
    .line 54
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 55
    .line 56
    iput v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 57
    .line 58
    :cond_2
    :goto_1
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 59
    .line 60
    int-to-long v6, v2

    .line 61
    sub-long v8, p3, v4

    .line 62
    .line 63
    cmp-long v3, v6, v8

    .line 64
    .line 65
    if-lez v3, :cond_3

    .line 66
    .line 67
    long-to-int v3, v8

    .line 68
    goto :goto_2

    .line 69
    :cond_3
    move v3, v2

    .line 70
    :goto_2
    iget-object v6, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 71
    .line 72
    iget v7, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 73
    .line 74
    sub-int/2addr v7, v2

    .line 75
    div-int/lit8 v7, v7, 0x8

    .line 76
    .line 77
    div-long v8, v4, v0

    .line 78
    .line 79
    long-to-int v2, v8

    .line 80
    add-int/2addr v2, p2

    .line 81
    div-int/lit8 v8, v3, 0x8

    .line 82
    .line 83
    invoke-static {v6, v7, p1, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 87
    .line 88
    sub-int/2addr v2, v3

    .line 89
    iput v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 90
    .line 91
    int-to-long v2, v3

    .line 92
    add-long/2addr v4, v2

    .line 93
    goto :goto_0

    .line 94
    :cond_4
    return-void

    .line 95
    :cond_5
    const-string p0, "outputLength not a multiple of 8"

    .line 96
    .line 97
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public update(B)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput-byte p1, v0, v1

    .line 5
    .line 6
    const-wide/16 v2, 0x8

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public update([BII)V
    .locals 4

    int-to-long v0, p3

    const-wide/16 v2, 0x8

    mul-long/2addr v0, v2

    .line 12
    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    return-void
.end method
