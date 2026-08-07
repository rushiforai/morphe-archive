.class public Lorg/spongycastle/crypto/engines/RC564Engine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final P64:J = -0x481eae9d7512d595L

.field private static final Q64:J = -0x61c8864680b583ebL

.field private static final bytesPerWord:I = 0x8

.field private static final wordSize:I = 0x40


# instance fields
.field private _S:[J

.field private _noRounds:I

.field private forEncryption:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xc

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 10
    .line 11
    return-void
.end method

.method private bytesToWord([BI)J
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 p0, 0x7

    .line 4
    :goto_0
    if-ltz p0, :cond_0

    .line 5
    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    shl-long/2addr v0, v2

    .line 9
    add-int v2, p0, p2

    .line 10
    .line 11
    aget-byte v2, p1, v2

    .line 12
    .line 13
    and-int/lit16 v2, v2, 0xff

    .line 14
    .line 15
    int-to-long v2, v2

    .line 16
    add-long/2addr v0, v2

    .line 17
    add-int/lit8 p0, p0, -0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-wide v0
.end method

.method private decryptBlock([BI[BI)I
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-int/lit8 p2, p2, 0x8

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    iget v2, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 12
    .line 13
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    if-lt v2, v4, :cond_0

    .line 17
    .line 18
    mul-int/lit8 v4, v2, 0x2

    .line 19
    .line 20
    add-int/lit8 v5, v4, 0x1

    .line 21
    .line 22
    aget-wide v5, v3, v5

    .line 23
    .line 24
    sub-long/2addr p1, v5

    .line 25
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateRight(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    xor-long/2addr p1, v0

    .line 30
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 31
    .line 32
    aget-wide v4, v3, v4

    .line 33
    .line 34
    sub-long/2addr v0, v4

    .line 35
    invoke-direct {p0, v0, v1, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateRight(JJ)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    xor-long/2addr v0, p1

    .line 40
    add-int/lit8 v2, v2, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v2, 0x0

    .line 44
    aget-wide v2, v3, v2

    .line 45
    .line 46
    sub-long/2addr v0, v2

    .line 47
    invoke-direct {p0, v0, v1, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 51
    .line 52
    aget-wide v1, v0, v4

    .line 53
    .line 54
    sub-long/2addr p1, v1

    .line 55
    add-int/lit8 p4, p4, 0x8

    .line 56
    .line 57
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x10

    .line 61
    .line 62
    return p0
.end method

.method private encryptBlock([BI[BI)I
    .locals 8

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    aget-wide v3, v2, v3

    .line 9
    .line 10
    add-long/2addr v0, v3

    .line 11
    add-int/lit8 p2, p2, 0x8

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    .line 14
    .line 15
    .line 16
    move-result-wide p1

    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    aget-wide v4, v2, v3

    .line 21
    .line 22
    add-long/2addr p1, v4

    .line 23
    move v2, v3

    .line 24
    :goto_0
    iget v4, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 25
    .line 26
    if-gt v2, v4, :cond_0

    .line 27
    .line 28
    xor-long/2addr v0, p1

    .line 29
    invoke-direct {p0, v0, v1, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 34
    .line 35
    mul-int/lit8 v5, v2, 0x2

    .line 36
    .line 37
    aget-wide v6, v4, v5

    .line 38
    .line 39
    add-long/2addr v0, v6

    .line 40
    xor-long/2addr p1, v0

    .line 41
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    .line 42
    .line 43
    .line 44
    move-result-wide p1

    .line 45
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 46
    .line 47
    add-int/2addr v5, v3

    .line 48
    aget-wide v5, v4, v5

    .line 49
    .line 50
    add-long/2addr p1, v5

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-direct {p0, v0, v1, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 p4, p4, 0x8

    .line 58
    .line 59
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0x10

    .line 63
    .line 64
    return p0
.end method

.method private rotateLeft(JJ)J
    .locals 4

    const-wide/16 v0, 0x3f

    and-long/2addr p3, v0

    long-to-int p0, p3

    shl-long v0, p1, p0

    const-wide/16 v2, 0x40

    sub-long/2addr v2, p3

    long-to-int p0, v2

    ushr-long p0, p1, p0

    or-long/2addr p0, v0

    return-wide p0
.end method

.method private rotateRight(JJ)J
    .locals 4

    const-wide/16 v0, 0x3f

    and-long/2addr p3, v0

    long-to-int p0, p3

    ushr-long v0, p1, p0

    const-wide/16 v2, 0x40

    sub-long/2addr v2, p3

    long-to-int p0, v2

    shl-long p0, p1, p0

    or-long/2addr p0, v0

    return-wide p0
.end method

.method private setKey([B)V
    .locals 13

    .line 1
    array-length v0, p1

    .line 2
    add-int/lit8 v0, v0, 0x7

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    move v3, v2

    .line 10
    :goto_0
    array-length v4, p1

    .line 11
    if-eq v3, v4, :cond_0

    .line 12
    .line 13
    div-int/lit8 v4, v3, 0x8

    .line 14
    .line 15
    aget-wide v5, v1, v4

    .line 16
    .line 17
    aget-byte v7, p1, v3

    .line 18
    .line 19
    and-int/lit16 v7, v7, 0xff

    .line 20
    .line 21
    int-to-long v7, v7

    .line 22
    rem-int/lit8 v9, v3, 0x8

    .line 23
    .line 24
    mul-int/lit8 v9, v9, 0x8

    .line 25
    .line 26
    shl-long/2addr v7, v9

    .line 27
    add-long/2addr v5, v7

    .line 28
    aput-wide v5, v1, v4

    .line 29
    .line 30
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget p1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    add-int/2addr p1, v3

    .line 37
    mul-int/lit8 p1, p1, 0x2

    .line 38
    .line 39
    new-array p1, p1, [J

    .line 40
    .line 41
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 42
    .line 43
    const-wide v4, -0x481eae9d7512d595L    # -1.590398847350152E-39

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    aput-wide v4, p1, v2

    .line 49
    .line 50
    move p1, v3

    .line 51
    :goto_1
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 52
    .line 53
    array-length v5, v4

    .line 54
    if-ge p1, v5, :cond_1

    .line 55
    .line 56
    add-int/lit8 v5, p1, -0x1

    .line 57
    .line 58
    aget-wide v5, v4, v5

    .line 59
    .line 60
    const-wide v7, -0x61c8864680b583ebL

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    add-long/2addr v5, v7

    .line 66
    aput-wide v5, v4, p1

    .line 67
    .line 68
    add-int/lit8 p1, p1, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    array-length p1, v4

    .line 72
    if-le v0, p1, :cond_2

    .line 73
    .line 74
    mul-int/lit8 p1, v0, 0x3

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    array-length p1, v4

    .line 78
    mul-int/lit8 p1, p1, 0x3

    .line 79
    .line 80
    :goto_2
    const-wide/16 v4, 0x0

    .line 81
    .line 82
    move-wide v6, v4

    .line 83
    move-wide v8, v6

    .line 84
    move v4, v2

    .line 85
    move v5, v4

    .line 86
    :goto_3
    if-ge v2, p1, :cond_3

    .line 87
    .line 88
    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 89
    .line 90
    aget-wide v11, v10, v4

    .line 91
    .line 92
    add-long/2addr v11, v6

    .line 93
    add-long/2addr v11, v8

    .line 94
    const-wide/16 v6, 0x3

    .line 95
    .line 96
    invoke-direct {p0, v11, v12, v6, v7}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    .line 97
    .line 98
    .line 99
    move-result-wide v6

    .line 100
    aput-wide v6, v10, v4

    .line 101
    .line 102
    aget-wide v10, v1, v5

    .line 103
    .line 104
    add-long/2addr v10, v6

    .line 105
    add-long/2addr v10, v8

    .line 106
    add-long/2addr v8, v6

    .line 107
    invoke-direct {p0, v10, v11, v8, v9}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    aput-wide v8, v1, v5

    .line 112
    .line 113
    add-int/2addr v4, v3

    .line 114
    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 115
    .line 116
    array-length v10, v10

    .line 117
    rem-int/2addr v4, v10

    .line 118
    add-int/2addr v5, v3

    .line 119
    rem-int/2addr v5, v0

    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_3
    return-void
.end method

.method private wordToBytes(J[BI)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    const/16 v0, 0x8

    .line 3
    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    add-int v1, p0, p4

    .line 7
    .line 8
    long-to-int v2, p1

    .line 9
    int-to-byte v2, v2

    .line 10
    aput-byte v2, p3, v1

    .line 11
    .line 12
    ushr-long/2addr p1, v0

    .line 13
    add-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "RC5-64"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/RC5Parameters;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/RC5Parameters;

    .line 6
    .line 7
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->forEncryption:Z

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/RC5Parameters;->getRounds()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/RC5Parameters;->getKey()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/RC564Engine;->setKey([B)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "invalid parameter passed to RC564 init - "

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->forEncryption:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->encryptBlock([BI[BI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->decryptBlock([BI[BI)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public reset()V
    .locals 0

    return-void
.end method
