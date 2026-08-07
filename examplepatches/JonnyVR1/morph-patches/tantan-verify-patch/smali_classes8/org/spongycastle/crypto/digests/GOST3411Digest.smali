.class public Lorg/spongycastle/crypto/digests/GOST3411Digest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;
.implements Lorg/spongycastle/util/Memoable;


# static fields
.field private static final C2:[B

.field private static final DIGEST_LENGTH:I = 0x20


# instance fields
.field private C:[[B

.field private H:[B

.field private K:[B

.field private L:[B

.field private M:[B

.field S:[B

.field private Sum:[B

.field U:[B

.field V:[B

.field W:[B

.field a:[B

.field private byteCount:J

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private sBox:[B

.field wS:[S

.field w_S:[S

.field private xBuf:[B

.field private xBufOff:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C2:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x0t
        -0x1t
        0x0t
        -0x1t
        0x0t
        -0x1t
        0x0t
        -0x1t
        -0x1t
        0x0t
        -0x1t
        0x0t
        -0x1t
        0x0t
        -0x1t
        0x0t
        0x0t
        -0x1t
        -0x1t
        0x0t
        -0x1t
        0x0t
        0x0t
        -0x1t
        -0x1t
        0x0t
        0x0t
        0x0t
        -0x1t
        -0x1t
        0x0t
        -0x1t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x20

    .line 5
    .line 6
    new-array v1, v0, [B

    .line 7
    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 9
    .line 10
    new-array v1, v0, [B

    .line 11
    .line 12
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    .line 13
    .line 14
    new-array v1, v0, [B

    .line 15
    .line 16
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 17
    .line 18
    new-array v1, v0, [B

    .line 19
    .line 20
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [I

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    aput v0, v1, v2

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v4, 0x4

    .line 30
    aput v4, v1, v3

    .line 31
    .line 32
    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 33
    .line 34
    invoke-static {v3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, [[B

    .line 39
    .line 40
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 41
    .line 42
    new-array v1, v0, [B

    .line 43
    .line 44
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 45
    .line 46
    new-instance v1, Lorg/spongycastle/crypto/engines/GOST28147Engine;

    .line 47
    .line 48
    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/GOST28147Engine;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 52
    .line 53
    new-array v1, v0, [B

    .line 54
    .line 55
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->K:[B

    .line 56
    .line 57
    const/16 v1, 0x8

    .line 58
    .line 59
    new-array v1, v1, [B

    .line 60
    .line 61
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->a:[B

    .line 62
    .line 63
    const/16 v1, 0x10

    .line 64
    .line 65
    new-array v3, v1, [S

    .line 66
    .line 67
    iput-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->wS:[S

    .line 68
    .line 69
    new-array v1, v1, [S

    .line 70
    .line 71
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->w_S:[S

    .line 72
    .line 73
    new-array v1, v0, [B

    .line 74
    .line 75
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 76
    .line 77
    new-array v1, v0, [B

    .line 78
    .line 79
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 80
    .line 81
    new-array v1, v0, [B

    .line 82
    .line 83
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 84
    .line 85
    new-array v0, v0, [B

    .line 86
    .line 87
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->W:[B

    .line 88
    .line 89
    const-string v0, "D-A"

    .line 90
    .line 91
    invoke-static {v0}, Lorg/spongycastle/crypto/engines/GOST28147Engine;->getSBox(Ljava/lang/String;)[B

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sBox:[B

    .line 96
    .line 97
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 98
    .line 99
    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    .line 100
    .line 101
    const/4 v4, 0x0

    .line 102
    invoke-direct {v3, v4, v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v1, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->reset()V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/GOST3411Digest;)V
    .locals 4

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    .line 126
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    const/4 v1, 0x2

    .line 127
    new-array v1, v1, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x4

    aput v3, v1, v2

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 128
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 129
    new-instance v1, Lorg/spongycastle/crypto/engines/GOST28147Engine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/GOST28147Engine;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 130
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->K:[B

    const/16 v1, 0x8

    .line 131
    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->a:[B

    const/16 v1, 0x10

    .line 132
    new-array v2, v1, [S

    iput-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->wS:[S

    new-array v1, v1, [S

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->w_S:[S

    .line 133
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 134
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->W:[B

    .line 135
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->reset(Lorg/spongycastle/util/Memoable;)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 5

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    .line 113
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    const/4 v1, 0x2

    .line 114
    new-array v1, v1, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v3, 0x0

    const/4 v4, 0x4

    aput v4, v1, v3

    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 115
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 116
    new-instance v1, Lorg/spongycastle/crypto/engines/GOST28147Engine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/GOST28147Engine;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 117
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->K:[B

    const/16 v1, 0x8

    .line 118
    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->a:[B

    const/16 v1, 0x10

    .line 119
    new-array v3, v1, [S

    iput-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->wS:[S

    new-array v1, v1, [S

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->w_S:[S

    .line 120
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 121
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->W:[B

    .line 122
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sBox:[B

    .line 123
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p1}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    invoke-interface {v0, v2, v1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 124
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->reset()V

    return-void
.end method

.method private A([B)[B
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x8

    .line 4
    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->a:[B

    .line 8
    .line 9
    aget-byte v3, p1, v1

    .line 10
    .line 11
    add-int/lit8 v4, v1, 0x8

    .line 12
    .line 13
    aget-byte v4, p1, v4

    .line 14
    .line 15
    xor-int/2addr v3, v4

    .line 16
    int-to-byte v3, v3

    .line 17
    aput-byte v3, v2, v1

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/16 v1, 0x18

    .line 23
    .line 24
    invoke-static {p1, v2, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->a:[B

    .line 28
    .line 29
    invoke-static {p0, v0, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method

.method private E([B[BI[BI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-interface {v0, p1, v1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 13
    .line 14
    invoke-interface {p0, p4, p5, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private P([B)[B
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->K:[B

    .line 3
    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    if-ge v0, v2, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v2, v0, 0x4

    .line 9
    .line 10
    aget-byte v3, p1, v0

    .line 11
    .line 12
    aput-byte v3, v1, v2

    .line 13
    .line 14
    add-int/lit8 v3, v2, 0x1

    .line 15
    .line 16
    add-int/lit8 v4, v0, 0x8

    .line 17
    .line 18
    aget-byte v4, p1, v4

    .line 19
    .line 20
    aput-byte v4, v1, v3

    .line 21
    .line 22
    add-int/lit8 v3, v2, 0x2

    .line 23
    .line 24
    add-int/lit8 v4, v0, 0x10

    .line 25
    .line 26
    aget-byte v4, p1, v4

    .line 27
    .line 28
    aput-byte v4, v1, v3

    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x3

    .line 31
    .line 32
    add-int/lit8 v3, v0, 0x18

    .line 33
    .line 34
    aget-byte v3, p1, v3

    .line 35
    .line 36
    aput-byte v3, v1, v2

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v1
.end method

.method private cpyBytesToShort([B[S)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    array-length v0, p1

    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v0, p0, 0x2

    .line 8
    .line 9
    add-int/lit8 v1, v0, 0x1

    .line 10
    .line 11
    aget-byte v1, p1, v1

    .line 12
    .line 13
    shl-int/lit8 v1, v1, 0x8

    .line 14
    .line 15
    const v2, 0xff00

    .line 16
    .line 17
    .line 18
    and-int/2addr v1, v2

    .line 19
    aget-byte v0, p1, v0

    .line 20
    .line 21
    and-int/lit16 v0, v0, 0xff

    .line 22
    .line 23
    or-int/2addr v0, v1

    .line 24
    int-to-short v0, v0

    .line 25
    aput-short v0, p2, p0

    .line 26
    .line 27
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method private cpyShortToBytes([S[B)V
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    array-length v0, p2

    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v0, p0, 0x2

    .line 8
    .line 9
    add-int/lit8 v1, v0, 0x1

    .line 10
    .line 11
    aget-short v2, p1, p0

    .line 12
    .line 13
    shr-int/lit8 v3, v2, 0x8

    .line 14
    .line 15
    int-to-byte v3, v3

    .line 16
    aput-byte v3, p2, v1

    .line 17
    .line 18
    int-to-byte v1, v2

    .line 19
    aput-byte v1, p2, v0

    .line 20
    .line 21
    add-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private finish()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    .line 2
    .line 3
    const-wide/16 v2, 0x8

    .line 4
    .line 5
    mul-long/2addr v0, v2

    .line 6
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-static {v0, v1, v2, v3}, Lorg/spongycastle/util/Pack;->longToLittleEndian(J[BI)V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->update(B)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    .line 21
    .line 22
    invoke-virtual {p0, v0, v3}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->processBlock([BI)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    .line 26
    .line 27
    invoke-virtual {p0, v0, v3}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->processBlock([BI)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private fw([B)V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->wS:[S

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cpyBytesToShort([B[S)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->w_S:[S

    .line 7
    .line 8
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->wS:[S

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget-short v3, v1, v2

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    aget-short v5, v1, v4

    .line 15
    .line 16
    xor-int/2addr v3, v5

    .line 17
    const/4 v5, 0x2

    .line 18
    aget-short v5, v1, v5

    .line 19
    .line 20
    xor-int/2addr v3, v5

    .line 21
    const/4 v5, 0x3

    .line 22
    aget-short v5, v1, v5

    .line 23
    .line 24
    xor-int/2addr v3, v5

    .line 25
    const/16 v5, 0xc

    .line 26
    .line 27
    aget-short v5, v1, v5

    .line 28
    .line 29
    xor-int/2addr v3, v5

    .line 30
    const/16 v5, 0xf

    .line 31
    .line 32
    aget-short v6, v1, v5

    .line 33
    .line 34
    xor-int/2addr v3, v6

    .line 35
    int-to-short v3, v3

    .line 36
    aput-short v3, v0, v5

    .line 37
    .line 38
    invoke-static {v1, v4, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->w_S:[S

    .line 42
    .line 43
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cpyShortToBytes([S[B)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private sumByteArray([B)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-eq v0, v3, :cond_0

    .line 7
    .line 8
    aget-byte v3, v2, v0

    .line 9
    .line 10
    and-int/lit16 v3, v3, 0xff

    .line 11
    .line 12
    aget-byte v4, p1, v0

    .line 13
    .line 14
    and-int/lit16 v4, v4, 0xff

    .line 15
    .line 16
    add-int/2addr v3, v4

    .line 17
    add-int/2addr v3, v1

    .line 18
    int-to-byte v1, v3

    .line 19
    aput-byte v1, v2, v0

    .line 20
    .line 21
    ushr-int/lit8 v1, v3, 0x8

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/GOST3411Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;-><init>(Lorg/spongycastle/crypto/digests/GOST3411Digest;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public doFinal([BI)I
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    array-length v2, v0

    .line 8
    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->reset()V

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x20

    .line 15
    .line 16
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "GOST3411"

    .line 2
    .line 3
    return-object p0
.end method

.method public getByteLength()I
    .locals 0

    const/16 p0, 0x20

    return p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x20

    return p0
.end method

.method public processBlock([BI)V
    .locals 9

    .line 1
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/16 v7, 0x20

    .line 5
    .line 6
    invoke-static {p1, p2, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 10
    .line 11
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 12
    .line 13
    invoke-static {v1, v6, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 17
    .line 18
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 19
    .line 20
    invoke-static {v1, v6, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    move v1, v6

    .line 24
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->W:[B

    .line 25
    .line 26
    if-ge v1, v7, :cond_0

    .line 27
    .line 28
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 29
    .line 30
    aget-byte v3, v3, v1

    .line 31
    .line 32
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 33
    .line 34
    aget-byte v4, v4, v1

    .line 35
    .line 36
    xor-int/2addr v3, v4

    .line 37
    int-to-byte v3, v3

    .line 38
    aput-byte v3, v2, v1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->P([B)[B

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 48
    .line 49
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    const/4 v3, 0x0

    .line 53
    move-object v0, p0

    .line 54
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->E([B[BI[BI)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    move v8, v1

    .line 59
    :goto_1
    const/4 v1, 0x4

    .line 60
    if-ge v8, v1, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 63
    .line 64
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->A([B)[B

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    move v2, v6

    .line 69
    :goto_2
    if-ge v2, v7, :cond_1

    .line 70
    .line 71
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 72
    .line 73
    aget-byte v4, v1, v2

    .line 74
    .line 75
    iget-object v5, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 76
    .line 77
    aget-object v5, v5, v8

    .line 78
    .line 79
    aget-byte v5, v5, v2

    .line 80
    .line 81
    xor-int/2addr v4, v5

    .line 82
    int-to-byte v4, v4

    .line 83
    aput-byte v4, v3, v2

    .line 84
    .line 85
    add-int/lit8 v2, v2, 0x1

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 89
    .line 90
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->A([B)[B

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->A([B)[B

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 99
    .line 100
    move v1, v6

    .line 101
    :goto_3
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->W:[B

    .line 102
    .line 103
    if-ge v1, v7, :cond_2

    .line 104
    .line 105
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->U:[B

    .line 106
    .line 107
    aget-byte v3, v3, v1

    .line 108
    .line 109
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->V:[B

    .line 110
    .line 111
    aget-byte v4, v4, v1

    .line 112
    .line 113
    xor-int/2addr v3, v4

    .line 114
    int-to-byte v3, v3

    .line 115
    aput-byte v3, v2, v1

    .line 116
    .line 117
    add-int/lit8 v1, v1, 0x1

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_2
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->P([B)[B

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 125
    .line 126
    mul-int/lit8 v3, v8, 0x8

    .line 127
    .line 128
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 129
    .line 130
    move v5, v3

    .line 131
    move-object v0, p0

    .line 132
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->E([B[BI[BI)V

    .line 133
    .line 134
    .line 135
    add-int/lit8 v8, v8, 0x1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    move v1, v6

    .line 139
    :goto_4
    const/16 v2, 0xc

    .line 140
    .line 141
    if-ge v1, v2, :cond_4

    .line 142
    .line 143
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 144
    .line 145
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->fw([B)V

    .line 146
    .line 147
    .line 148
    add-int/lit8 v1, v1, 0x1

    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_4
    move v1, v6

    .line 152
    :goto_5
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 153
    .line 154
    if-ge v1, v7, :cond_5

    .line 155
    .line 156
    aget-byte v3, v2, v1

    .line 157
    .line 158
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 159
    .line 160
    aget-byte v4, v4, v1

    .line 161
    .line 162
    xor-int/2addr v3, v4

    .line 163
    int-to-byte v3, v3

    .line 164
    aput-byte v3, v2, v1

    .line 165
    .line 166
    add-int/lit8 v1, v1, 0x1

    .line 167
    .line 168
    goto :goto_5

    .line 169
    :cond_5
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->fw([B)V

    .line 170
    .line 171
    .line 172
    move v1, v6

    .line 173
    :goto_6
    if-ge v1, v7, :cond_6

    .line 174
    .line 175
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 176
    .line 177
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 178
    .line 179
    aget-byte v3, v3, v1

    .line 180
    .line 181
    aget-byte v4, v2, v1

    .line 182
    .line 183
    xor-int/2addr v3, v4

    .line 184
    int-to-byte v3, v3

    .line 185
    aput-byte v3, v2, v1

    .line 186
    .line 187
    add-int/lit8 v1, v1, 0x1

    .line 188
    .line 189
    goto :goto_6

    .line 190
    :cond_6
    move v1, v6

    .line 191
    :goto_7
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->S:[B

    .line 192
    .line 193
    const/16 v3, 0x3d

    .line 194
    .line 195
    if-ge v1, v3, :cond_7

    .line 196
    .line 197
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->fw([B)V

    .line 198
    .line 199
    .line 200
    add-int/lit8 v1, v1, 0x1

    .line 201
    .line 202
    goto :goto_7

    .line 203
    :cond_7
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 204
    .line 205
    array-length v1, v0

    .line 206
    invoke-static {v2, v6, v0, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public reset()V
    .locals 4

    const-wide/16 v0, 0x0

    .line 110
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    const/4 v0, 0x0

    .line 111
    iput v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    move v1, v0

    .line 112
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 113
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    .line 114
    :goto_1
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 115
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move v1, v0

    .line 116
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 117
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    move v1, v0

    .line 118
    :goto_3
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    const/4 v3, 0x1

    aget-object v2, v2, v3

    array-length v3, v2

    if-ge v1, v3, :cond_3

    .line 119
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    move v1, v0

    .line 120
    :goto_4
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    const/4 v3, 0x3

    aget-object v2, v2, v3

    array-length v3, v2

    if-ge v1, v3, :cond_4

    .line 121
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    move v1, v0

    .line 122
    :goto_5
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    array-length v3, v2

    if-ge v1, v3, :cond_5

    .line 123
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_5
    move v1, v0

    .line 124
    :goto_6
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    array-length v3, v2

    if-ge v1, v3, :cond_6

    .line 125
    aput-byte v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 126
    :cond_6
    sget-object v1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C2:[B

    iget-object p0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    const/4 v2, 0x2

    aget-object p0, p0, v2

    array-length v2, v1

    invoke-static {v1, v0, p0, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 5

    .line 1
    check-cast p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;

    .line 2
    .line 3
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sBox:[B

    .line 4
    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sBox:[B

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 8
    .line 9
    new-instance v2, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v2, v3, v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-interface {v1, v0, v2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->reset()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 23
    .line 24
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->H:[B

    .line 25
    .line 26
    array-length v3, v1

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    .line 32
    .line 33
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->L:[B

    .line 34
    .line 35
    array-length v3, v1

    .line 36
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 40
    .line 41
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->M:[B

    .line 42
    .line 43
    array-length v3, v1

    .line 44
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    .line 48
    .line 49
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->Sum:[B

    .line 50
    .line 51
    array-length v3, v1

    .line 52
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 56
    .line 57
    aget-object v1, v1, v0

    .line 58
    .line 59
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 60
    .line 61
    aget-object v0, v2, v0

    .line 62
    .line 63
    array-length v2, v1

    .line 64
    invoke-static {v1, v4, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 68
    .line 69
    const/4 v1, 0x2

    .line 70
    aget-object v0, v0, v1

    .line 71
    .line 72
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 73
    .line 74
    aget-object v1, v2, v1

    .line 75
    .line 76
    array-length v2, v0

    .line 77
    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 81
    .line 82
    const/4 v1, 0x3

    .line 83
    aget-object v0, v0, v1

    .line 84
    .line 85
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->C:[[B

    .line 86
    .line 87
    aget-object v1, v2, v1

    .line 88
    .line 89
    array-length v2, v0

    .line 90
    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 94
    .line 95
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 96
    .line 97
    array-length v2, v0

    .line 98
    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    .line 100
    .line 101
    iget v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    .line 102
    .line 103
    iput v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    .line 104
    .line 105
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    .line 106
    .line 107
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    .line 108
    .line 109
    return-void
.end method

.method public update(B)V
    .locals 4

    .line 64
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    aput-byte p1, v0, v1

    .line 65
    array-length p1, v0

    if-ne v2, p1, :cond_0

    .line 66
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sumByteArray([B)V

    .line 67
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->processBlock([BI)V

    .line 68
    iput v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    .line 69
    :cond_0
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    return-void
.end method

.method public update([BII)V
    .locals 5

    .line 1
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBufOff:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-lez p3, :cond_0

    .line 6
    .line 7
    aget-byte v0, p1, p2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->update(B)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 p2, p2, 0x1

    .line 13
    .line 14
    add-int/lit8 p3, p3, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 18
    .line 19
    array-length v1, v0

    .line 20
    if-le p3, v1, :cond_1

    .line 21
    .line 22
    array-length v1, v0

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->sumByteArray([B)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 33
    .line 34
    invoke-virtual {p0, v0, v2}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->processBlock([BI)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->xBuf:[B

    .line 38
    .line 39
    array-length v1, v0

    .line 40
    add-int/2addr p2, v1

    .line 41
    array-length v1, v0

    .line 42
    sub-int/2addr p3, v1

    .line 43
    iget-wide v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    .line 44
    .line 45
    array-length v0, v0

    .line 46
    int-to-long v3, v0

    .line 47
    add-long/2addr v1, v3

    .line 48
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/GOST3411Digest;->byteCount:J

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_2
    if-lez p3, :cond_2

    .line 52
    .line 53
    aget-byte v0, p1, p2

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/GOST3411Digest;->update(B)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 p2, p2, 0x1

    .line 59
    .line 60
    add-int/lit8 p3, p3, -0x1

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    return-void
.end method
