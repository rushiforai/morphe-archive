.class public Lorg/spongycastle/crypto/engines/Shacal2Engine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x20

.field private static final K:[I

.field private static final ROUNDS:I = 0x40


# instance fields
.field private forEncryption:Z

.field private workingKey:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->K:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x428a2f98
        0x71374491
        -0x4a3f0431
        -0x164a245b
        0x3956c25b
        0x59f111f1
        -0x6dc07d5c    # -6.043E-28f
        -0x54e3a12b
        -0x27f85568
        0x12835b01
        0x243185be
        0x550c7dc3
        0x72be5d74
        -0x7f214e02
        -0x6423f959
        -0x3e640e8c
        -0x1b64963f
        -0x1041b87a
        0xfc19dc6
        0x240ca1cc
        0x2de92c6f
        0x4a7484aa    # 4006186.5f
        0x5cb0a9dc
        0x76f988da
        -0x67c1aeae
        -0x57ce3993
        -0x4ffcd838
        -0x40a68039
        -0x391ff40d
        -0x2a586eb9
        0x6ca6351
        0x14292967
        0x27b70a85
        0x2e1b2138
        0x4d2c6dfc    # 1.8080557E8f
        0x53380d13
        0x650a7354
        0x766a0abb
        -0x7e3d36d2
        -0x6d8dd37b
        -0x5d40175f
        -0x57e599b5
        -0x3db47490
        -0x3893ae5d
        -0x2e6d17e7
        -0x2966f9dc
        -0xbf1ca7b
        0x106aa070
        0x19a4c116
        0x1e376c08
        0x2748774c
        0x34b0bcb5
        0x391c0cb3
        0x4ed8aa4a    # 1.8175194E9f
        0x5b9cca4f
        0x682e6ff3
        0x748f82ee
        0x78a5636f
        -0x7b3787ec
        -0x7338fdf8
        -0x6f410006
        -0x5baf9315
        -0x41065c09
        -0x398e870e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->forEncryption:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 9
    .line 10
    return-void
.end method

.method private byteBlockToInts([B[III)V
    .locals 3

    .line 1
    :goto_0
    const/16 p0, 0x8

    .line 2
    .line 3
    if-ge p4, p0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, p3, 0x1

    .line 6
    .line 7
    aget-byte v1, p1, p3

    .line 8
    .line 9
    and-int/lit16 v1, v1, 0xff

    .line 10
    .line 11
    shl-int/lit8 v1, v1, 0x18

    .line 12
    .line 13
    add-int/lit8 v2, p3, 0x2

    .line 14
    .line 15
    aget-byte v0, p1, v0

    .line 16
    .line 17
    and-int/lit16 v0, v0, 0xff

    .line 18
    .line 19
    shl-int/lit8 v0, v0, 0x10

    .line 20
    .line 21
    or-int/2addr v0, v1

    .line 22
    add-int/lit8 v1, p3, 0x3

    .line 23
    .line 24
    aget-byte v2, p1, v2

    .line 25
    .line 26
    and-int/lit16 v2, v2, 0xff

    .line 27
    .line 28
    shl-int/lit8 p0, v2, 0x8

    .line 29
    .line 30
    or-int/2addr p0, v0

    .line 31
    add-int/lit8 p3, p3, 0x4

    .line 32
    .line 33
    aget-byte v0, p1, v1

    .line 34
    .line 35
    and-int/lit16 v0, v0, 0xff

    .line 36
    .line 37
    or-int/2addr p0, v0

    .line 38
    aput p0, p2, p4

    .line 39
    .line 40
    add-int/lit8 p4, p4, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method private bytes2ints([B[III)V
    .locals 2

    .line 1
    :goto_0
    array-length p0, p1

    .line 2
    div-int/lit8 p0, p0, 0x4

    .line 3
    .line 4
    if-ge p4, p0, :cond_0

    .line 5
    .line 6
    add-int/lit8 p0, p3, 0x1

    .line 7
    .line 8
    aget-byte v0, p1, p3

    .line 9
    .line 10
    and-int/lit16 v0, v0, 0xff

    .line 11
    .line 12
    shl-int/lit8 v0, v0, 0x18

    .line 13
    .line 14
    add-int/lit8 v1, p3, 0x2

    .line 15
    .line 16
    aget-byte p0, p1, p0

    .line 17
    .line 18
    and-int/lit16 p0, p0, 0xff

    .line 19
    .line 20
    shl-int/lit8 p0, p0, 0x10

    .line 21
    .line 22
    or-int/2addr p0, v0

    .line 23
    add-int/lit8 v0, p3, 0x3

    .line 24
    .line 25
    aget-byte v1, p1, v1

    .line 26
    .line 27
    and-int/lit16 v1, v1, 0xff

    .line 28
    .line 29
    shl-int/lit8 v1, v1, 0x8

    .line 30
    .line 31
    or-int/2addr p0, v1

    .line 32
    add-int/lit8 p3, p3, 0x4

    .line 33
    .line 34
    aget-byte v0, p1, v0

    .line 35
    .line 36
    and-int/lit16 v0, v0, 0xff

    .line 37
    .line 38
    or-int/2addr p0, v0

    .line 39
    aput p0, p2, p4

    .line 40
    .line 41
    add-int/lit8 p4, p4, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method private decryptBlock([BI[BI)V
    .locals 10

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, p1, v0, p2, v1}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->byteBlockToInts([B[III)V

    .line 7
    .line 8
    .line 9
    const/16 p1, 0x3f

    .line 10
    .line 11
    :goto_0
    const/4 p2, -0x1

    .line 12
    if-le p1, p2, :cond_0

    .line 13
    .line 14
    aget p2, v0, v1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    aget v3, v0, v2

    .line 18
    .line 19
    ushr-int/lit8 v4, v3, 0x2

    .line 20
    .line 21
    shl-int/lit8 v5, v3, -0x2

    .line 22
    .line 23
    or-int/2addr v4, v5

    .line 24
    ushr-int/lit8 v5, v3, 0xd

    .line 25
    .line 26
    shl-int/lit8 v6, v3, -0xd

    .line 27
    .line 28
    or-int/2addr v5, v6

    .line 29
    xor-int/2addr v4, v5

    .line 30
    ushr-int/lit8 v5, v3, 0x16

    .line 31
    .line 32
    shl-int/lit8 v6, v3, -0x16

    .line 33
    .line 34
    or-int/2addr v5, v6

    .line 35
    xor-int/2addr v4, v5

    .line 36
    sub-int/2addr p2, v4

    .line 37
    const/4 v4, 0x2

    .line 38
    aget v5, v0, v4

    .line 39
    .line 40
    and-int v6, v3, v5

    .line 41
    .line 42
    const/4 v7, 0x3

    .line 43
    aget v8, v0, v7

    .line 44
    .line 45
    and-int v9, v3, v8

    .line 46
    .line 47
    xor-int/2addr v6, v9

    .line 48
    and-int v9, v5, v8

    .line 49
    .line 50
    xor-int/2addr v6, v9

    .line 51
    sub-int/2addr p2, v6

    .line 52
    aput v3, v0, v1

    .line 53
    .line 54
    aput v5, v0, v2

    .line 55
    .line 56
    aput v8, v0, v4

    .line 57
    .line 58
    const/4 v2, 0x4

    .line 59
    aget v3, v0, v2

    .line 60
    .line 61
    sub-int/2addr v3, p2

    .line 62
    aput v3, v0, v7

    .line 63
    .line 64
    const/4 v3, 0x5

    .line 65
    aget v4, v0, v3

    .line 66
    .line 67
    aput v4, v0, v2

    .line 68
    .line 69
    const/4 v2, 0x6

    .line 70
    aget v5, v0, v2

    .line 71
    .line 72
    aput v5, v0, v3

    .line 73
    .line 74
    const/4 v3, 0x7

    .line 75
    aget v6, v0, v3

    .line 76
    .line 77
    aput v6, v0, v2

    .line 78
    .line 79
    sget-object v2, Lorg/spongycastle/crypto/engines/Shacal2Engine;->K:[I

    .line 80
    .line 81
    aget v2, v2, p1

    .line 82
    .line 83
    sub-int/2addr p2, v2

    .line 84
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 85
    .line 86
    aget v2, v2, p1

    .line 87
    .line 88
    sub-int/2addr p2, v2

    .line 89
    ushr-int/lit8 v2, v4, 0x6

    .line 90
    .line 91
    shl-int/lit8 v7, v4, -0x6

    .line 92
    .line 93
    or-int/2addr v2, v7

    .line 94
    ushr-int/lit8 v7, v4, 0xb

    .line 95
    .line 96
    shl-int/lit8 v8, v4, -0xb

    .line 97
    .line 98
    or-int/2addr v7, v8

    .line 99
    xor-int/2addr v2, v7

    .line 100
    ushr-int/lit8 v7, v4, 0x19

    .line 101
    .line 102
    shl-int/lit8 v8, v4, -0x19

    .line 103
    .line 104
    or-int/2addr v7, v8

    .line 105
    xor-int/2addr v2, v7

    .line 106
    sub-int/2addr p2, v2

    .line 107
    and-int v2, v4, v5

    .line 108
    .line 109
    not-int v4, v4

    .line 110
    and-int/2addr v4, v6

    .line 111
    xor-int/2addr v2, v4

    .line 112
    sub-int/2addr p2, v2

    .line 113
    aput p2, v0, v3

    .line 114
    .line 115
    add-int/lit8 p1, p1, -0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_0
    invoke-direct {p0, v0, p3, p4}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->ints2bytes([I[BI)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method private encryptBlock([BI[BI)V
    .locals 10

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, p1, v0, p2, v1}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->byteBlockToInts([B[III)V

    .line 7
    .line 8
    .line 9
    move p1, v1

    .line 10
    :goto_0
    const/16 p2, 0x40

    .line 11
    .line 12
    if-ge p1, p2, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x4

    .line 15
    aget v2, v0, p2

    .line 16
    .line 17
    ushr-int/lit8 v3, v2, 0x6

    .line 18
    .line 19
    shl-int/lit8 v4, v2, -0x6

    .line 20
    .line 21
    or-int/2addr v3, v4

    .line 22
    ushr-int/lit8 v4, v2, 0xb

    .line 23
    .line 24
    shl-int/lit8 v5, v2, -0xb

    .line 25
    .line 26
    or-int/2addr v4, v5

    .line 27
    xor-int/2addr v3, v4

    .line 28
    ushr-int/lit8 v4, v2, 0x19

    .line 29
    .line 30
    shl-int/lit8 v5, v2, -0x19

    .line 31
    .line 32
    or-int/2addr v4, v5

    .line 33
    xor-int/2addr v3, v4

    .line 34
    const/4 v4, 0x5

    .line 35
    aget v5, v0, v4

    .line 36
    .line 37
    and-int v6, v2, v5

    .line 38
    .line 39
    not-int v7, v2

    .line 40
    const/4 v8, 0x6

    .line 41
    aget v9, v0, v8

    .line 42
    .line 43
    and-int/2addr v7, v9

    .line 44
    xor-int/2addr v6, v7

    .line 45
    add-int/2addr v3, v6

    .line 46
    const/4 v6, 0x7

    .line 47
    aget v7, v0, v6

    .line 48
    .line 49
    add-int/2addr v3, v7

    .line 50
    sget-object v7, Lorg/spongycastle/crypto/engines/Shacal2Engine;->K:[I

    .line 51
    .line 52
    aget v7, v7, p1

    .line 53
    .line 54
    add-int/2addr v3, v7

    .line 55
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 56
    .line 57
    aget v7, v7, p1

    .line 58
    .line 59
    add-int/2addr v3, v7

    .line 60
    aput v9, v0, v6

    .line 61
    .line 62
    aput v5, v0, v8

    .line 63
    .line 64
    aput v2, v0, v4

    .line 65
    .line 66
    const/4 v2, 0x3

    .line 67
    aget v4, v0, v2

    .line 68
    .line 69
    add-int/2addr v4, v3

    .line 70
    aput v4, v0, p2

    .line 71
    .line 72
    const/4 p2, 0x2

    .line 73
    aget v4, v0, p2

    .line 74
    .line 75
    aput v4, v0, v2

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    aget v5, v0, v2

    .line 79
    .line 80
    aput v5, v0, p2

    .line 81
    .line 82
    aget p2, v0, v1

    .line 83
    .line 84
    aput p2, v0, v2

    .line 85
    .line 86
    ushr-int/lit8 v2, p2, 0x2

    .line 87
    .line 88
    shl-int/lit8 v6, p2, -0x2

    .line 89
    .line 90
    or-int/2addr v2, v6

    .line 91
    ushr-int/lit8 v6, p2, 0xd

    .line 92
    .line 93
    shl-int/lit8 v7, p2, -0xd

    .line 94
    .line 95
    or-int/2addr v6, v7

    .line 96
    xor-int/2addr v2, v6

    .line 97
    ushr-int/lit8 v6, p2, 0x16

    .line 98
    .line 99
    shl-int/lit8 v7, p2, -0x16

    .line 100
    .line 101
    or-int/2addr v6, v7

    .line 102
    xor-int/2addr v2, v6

    .line 103
    add-int/2addr v3, v2

    .line 104
    and-int v2, p2, v5

    .line 105
    .line 106
    and-int/2addr p2, v4

    .line 107
    xor-int/2addr p2, v2

    .line 108
    and-int v2, v5, v4

    .line 109
    .line 110
    xor-int/2addr p2, v2

    .line 111
    add-int/2addr v3, p2

    .line 112
    aput v3, v0, v1

    .line 113
    .line 114
    add-int/lit8 p1, p1, 0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    invoke-direct {p0, v0, p3, p4}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->ints2bytes([I[BI)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private ints2bytes([I[BI)V
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    array-length v0, p1

    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, p3, 0x1

    .line 6
    .line 7
    aget v1, p1, p0

    .line 8
    .line 9
    ushr-int/lit8 v2, v1, 0x18

    .line 10
    .line 11
    int-to-byte v2, v2

    .line 12
    aput-byte v2, p2, p3

    .line 13
    .line 14
    add-int/lit8 v2, p3, 0x2

    .line 15
    .line 16
    ushr-int/lit8 v3, v1, 0x10

    .line 17
    .line 18
    int-to-byte v3, v3

    .line 19
    aput-byte v3, p2, v0

    .line 20
    .line 21
    add-int/lit8 v0, p3, 0x3

    .line 22
    .line 23
    ushr-int/lit8 v3, v1, 0x8

    .line 24
    .line 25
    int-to-byte v3, v3

    .line 26
    aput-byte v3, p2, v2

    .line 27
    .line 28
    add-int/lit8 p3, p3, 0x4

    .line 29
    .line 30
    int-to-byte v1, v1

    .line 31
    aput-byte v1, p2, v0

    .line 32
    .line 33
    add-int/lit8 p0, p0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Shacal2"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x20

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->forEncryption:Z

    .line 6
    .line 7
    const/16 p1, 0x40

    .line 8
    .line 9
    new-array p1, p1, [I

    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 12
    .line 13
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->setKey([B)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "only simple KeyParameter expected."

    .line 24
    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x20

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x20

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->forEncryption:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->encryptBlock([BI[BI)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->decryptBlock([BI[BI)V

    .line 25
    .line 26
    .line 27
    :goto_0
    const/16 p0, 0x20

    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    const-string p0, "output buffer too short"

    .line 31
    .line 32
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    const-string p0, "input buffer too short"

    .line 37
    .line 38
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_3
    const-string p0, "Shacal2 not initialised"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public setKey([B)V
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    if-eqz v0, :cond_1

    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/16 v1, 0x40

    .line 6
    .line 7
    if-gt v0, v1, :cond_1

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    const/16 v2, 0x10

    .line 11
    .line 12
    if-lt v0, v2, :cond_1

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    rem-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {p0, p1, v0, v3, v3}, Lorg/spongycastle/crypto/engines/Shacal2Engine;->bytes2ints([B[III)V

    .line 23
    .line 24
    .line 25
    :goto_0
    if-ge v2, v1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Shacal2Engine;->workingKey:[I

    .line 28
    .line 29
    add-int/lit8 v0, v2, -0x2

    .line 30
    .line 31
    aget v0, p1, v0

    .line 32
    .line 33
    ushr-int/lit8 v3, v0, 0x11

    .line 34
    .line 35
    shl-int/lit8 v4, v0, -0x11

    .line 36
    .line 37
    or-int/2addr v3, v4

    .line 38
    ushr-int/lit8 v4, v0, 0x13

    .line 39
    .line 40
    shl-int/lit8 v5, v0, -0x13

    .line 41
    .line 42
    or-int/2addr v4, v5

    .line 43
    xor-int/2addr v3, v4

    .line 44
    ushr-int/lit8 v0, v0, 0xa

    .line 45
    .line 46
    xor-int/2addr v0, v3

    .line 47
    add-int/lit8 v3, v2, -0x7

    .line 48
    .line 49
    aget v3, p1, v3

    .line 50
    .line 51
    add-int/2addr v0, v3

    .line 52
    add-int/lit8 v3, v2, -0xf

    .line 53
    .line 54
    aget v3, p1, v3

    .line 55
    .line 56
    ushr-int/lit8 v4, v3, 0x7

    .line 57
    .line 58
    shl-int/lit8 v5, v3, -0x7

    .line 59
    .line 60
    or-int/2addr v4, v5

    .line 61
    ushr-int/lit8 v5, v3, 0x12

    .line 62
    .line 63
    shl-int/lit8 v6, v3, -0x12

    .line 64
    .line 65
    or-int/2addr v5, v6

    .line 66
    xor-int/2addr v4, v5

    .line 67
    ushr-int/lit8 v3, v3, 0x3

    .line 68
    .line 69
    xor-int/2addr v3, v4

    .line 70
    add-int/2addr v0, v3

    .line 71
    add-int/lit8 v3, v2, -0x10

    .line 72
    .line 73
    aget v3, p1, v3

    .line 74
    .line 75
    add-int/2addr v0, v3

    .line 76
    aput v0, p1, v2

    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    return-void

    .line 82
    :cond_1
    const-string p0, "Shacal2-key must be 16 - 64 bytes and multiple of 8"

    .line 83
    .line 84
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
