.class public Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;


# static fields
.field private static final MAX_BITS_REQUEST:I = 0x40000

.field private static final ONE:[B

.field private static final RESEED_MAX:J = 0x800000000000L

.field private static final seedlens:Ljava/util/Hashtable;


# instance fields
.field private _C:[B

.field private _V:[B

.field private _digest:Lorg/spongycastle/crypto/Digest;

.field private _entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

.field private _reseedCounter:J

.field private _securityStrength:I

.field private _seedLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    aput-byte v0, v1, v2

    .line 6
    .line 7
    sput-object v1, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->ONE:[B

    .line 8
    .line 9
    new-instance v0, Ljava/util/Hashtable;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->seedlens:Ljava/util/Hashtable;

    .line 15
    .line 16
    const/16 v1, 0x1b8

    .line 17
    .line 18
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "SHA-1"

    .line 23
    .line 24
    invoke-virtual {v0, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string v2, "SHA-224"

    .line 28
    .line 29
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const-string v2, "SHA-256"

    .line 37
    .line 38
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v2, "SHA-512/256"

    .line 46
    .line 47
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    const-string v2, "SHA-512/224"

    .line 55
    .line 56
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const/16 v1, 0x378

    .line 64
    .line 65
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const-string v3, "SHA-384"

    .line 70
    .line 71
    invoke-virtual {v0, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    const-string v2, "SHA-512"

    .line 75
    .line 76
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;ILorg/spongycastle/crypto/prng/EntropySource;[B[B)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/crypto/prng/drbg/Utils;->getMaxSecurityStrength(Lorg/spongycastle/crypto/Digest;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-gt p2, v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p3}, Lorg/spongycastle/crypto/prng/EntropySource;->entropySize()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lt v0, p2, :cond_0

    .line 16
    .line 17
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 18
    .line 19
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 20
    .line 21
    iput p2, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_securityStrength:I

    .line 22
    .line 23
    sget-object p2, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->seedlens:Ljava/util/Hashtable;

    .line 24
    .line 25
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_seedLength:I

    .line 40
    .line 41
    invoke-direct {p0}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->getEntropy()[B

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1, p5, p4}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B)[B

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p2, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 50
    .line 51
    iget p3, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_seedLength:I

    .line 52
    .line 53
    invoke-static {p2, p1, p3}, Lorg/spongycastle/crypto/prng/drbg/Utils;->hash_df(Lorg/spongycastle/crypto/Digest;[BI)[B

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 58
    .line 59
    array-length p2, p1

    .line 60
    const/4 p3, 0x1

    .line 61
    add-int/2addr p2, p3

    .line 62
    new-array p2, p2, [B

    .line 63
    .line 64
    const/4 p4, 0x0

    .line 65
    array-length p5, p1

    .line 66
    invoke-static {p1, p4, p2, p3, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 70
    .line 71
    iget p3, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_seedLength:I

    .line 72
    .line 73
    invoke-static {p1, p2, p3}, Lorg/spongycastle/crypto/prng/drbg/Utils;->hash_df(Lorg/spongycastle/crypto/Digest;[BI)[B

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_C:[B

    .line 78
    .line 79
    const-wide/16 p1, 0x1

    .line 80
    .line 81
    iput-wide p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    const-string p0, "Not enough entropy for security strength required"

    .line 85
    .line 86
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw v1

    .line 90
    :cond_1
    const-string p0, "Requested security strength is not supported by the derivation function"

    .line 91
    .line 92
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw v1
.end method

.method private addTo([B[B)V
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    move v2, p0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    array-length v3, p2

    .line 6
    const/16 v4, 0xff

    .line 7
    .line 8
    if-gt v1, v3, :cond_1

    .line 9
    .line 10
    array-length v3, p1

    .line 11
    sub-int/2addr v3, v1

    .line 12
    aget-byte v3, p1, v3

    .line 13
    .line 14
    and-int/2addr v3, v4

    .line 15
    array-length v5, p2

    .line 16
    sub-int/2addr v5, v1

    .line 17
    aget-byte v5, p2, v5

    .line 18
    .line 19
    and-int/2addr v5, v4

    .line 20
    add-int/2addr v3, v5

    .line 21
    add-int/2addr v3, v2

    .line 22
    if-le v3, v4, :cond_0

    .line 23
    .line 24
    move v2, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    move v2, p0

    .line 27
    :goto_1
    array-length v4, p1

    .line 28
    sub-int/2addr v4, v1

    .line 29
    int-to-byte v3, v3

    .line 30
    aput-byte v3, p1, v4

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    array-length p2, p2

    .line 36
    add-int/2addr p2, v0

    .line 37
    :goto_2
    array-length v1, p1

    .line 38
    if-gt p2, v1, :cond_3

    .line 39
    .line 40
    array-length v1, p1

    .line 41
    sub-int/2addr v1, p2

    .line 42
    aget-byte v1, p1, v1

    .line 43
    .line 44
    and-int/2addr v1, v4

    .line 45
    add-int/2addr v1, v2

    .line 46
    if-le v1, v4, :cond_2

    .line 47
    .line 48
    move v2, v0

    .line 49
    goto :goto_3

    .line 50
    :cond_2
    move v2, p0

    .line 51
    :goto_3
    array-length v3, p1

    .line 52
    sub-int/2addr v3, p2

    .line 53
    int-to-byte v1, v1

    .line 54
    aput-byte v1, p1, v3

    .line 55
    .line 56
    add-int/lit8 p2, p2, 0x1

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    return-void
.end method

.method private doHash([B[B)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-interface {v0, p1, v2, v1}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 9
    .line 10
    invoke-interface {p0, p2, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private getEntropy()[B
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/prng/EntropySource;->getEntropy()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_securityStrength:I

    .line 9
    .line 10
    add-int/lit8 p0, p0, 0x7

    .line 11
    .line 12
    div-int/lit8 p0, p0, 0x8

    .line 13
    .line 14
    if-lt v1, p0, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const-string p0, "Insufficient entropy provided by entropy source"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method private hash([B)[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->doHash([B[B)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private hashgen([BI)[B
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    div-int/lit8 p2, p2, 0x8

    .line 8
    .line 9
    div-int v0, p2, v0

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    array-length v2, p1

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {p1, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    new-array p1, p2, [B

    .line 20
    .line 21
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 22
    .line 23
    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    new-array v4, v2, [B

    .line 28
    .line 29
    move v5, v3

    .line 30
    :goto_0
    if-gt v5, v0, :cond_1

    .line 31
    .line 32
    invoke-direct {p0, v1, v4}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->doHash([B[B)V

    .line 33
    .line 34
    .line 35
    mul-int v6, v5, v2

    .line 36
    .line 37
    sub-int v7, p2, v6

    .line 38
    .line 39
    if-le v7, v2, :cond_0

    .line 40
    .line 41
    move v7, v2

    .line 42
    :cond_0
    invoke-static {v4, v3, p1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    sget-object v6, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->ONE:[B

    .line 46
    .line 47
    invoke-direct {p0, v1, v6}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->addTo([B[B)V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v5, v5, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-object p1
.end method


# virtual methods
.method public generate([B[BZ)I
    .locals 11

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x8

    .line 3
    .line 4
    mul-int/2addr v0, v1

    .line 5
    const/high16 v2, 0x40000

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-gt v0, v2, :cond_3

    .line 9
    .line 10
    iget-wide v4, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 11
    .line 12
    const-wide v6, 0x800000000000L

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmp-long v2, v4, v6

    .line 18
    .line 19
    if-lez v2, :cond_0

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_0
    if-eqz p3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->reseed([B)V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    :cond_1
    const/4 p3, 0x2

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 34
    .line 35
    array-length v5, v4

    .line 36
    add-int/2addr v5, v2

    .line 37
    array-length v6, p2

    .line 38
    add-int/2addr v5, v6

    .line 39
    new-array v5, v5, [B

    .line 40
    .line 41
    aput-byte p3, v5, v3

    .line 42
    .line 43
    array-length v6, v4

    .line 44
    invoke-static {v4, v3, v5, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 48
    .line 49
    array-length v4, v4

    .line 50
    add-int/2addr v4, v2

    .line 51
    array-length v6, p2

    .line 52
    invoke-static {p2, v3, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0, v5}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->hash([B)[B

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 60
    .line 61
    invoke-direct {p0, v4, p2}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->addTo([B[B)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p2, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 65
    .line 66
    invoke-direct {p0, p2, v0}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->hashgen([BI)[B

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 71
    .line 72
    array-length v5, v4

    .line 73
    add-int/2addr v5, v2

    .line 74
    new-array v5, v5, [B

    .line 75
    .line 76
    array-length v6, v4

    .line 77
    invoke-static {v4, v3, v5, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    .line 79
    .line 80
    const/4 v4, 0x3

    .line 81
    aput-byte v4, v5, v3

    .line 82
    .line 83
    invoke-direct {p0, v5}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->hash([B)[B

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    iget-object v6, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 88
    .line 89
    invoke-direct {p0, v6, v5}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->addTo([B[B)V

    .line 90
    .line 91
    .line 92
    iget-object v5, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 93
    .line 94
    iget-object v6, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_C:[B

    .line 95
    .line 96
    invoke-direct {p0, v5, v6}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->addTo([B[B)V

    .line 97
    .line 98
    .line 99
    iget-wide v5, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 100
    .line 101
    const/16 v7, 0x18

    .line 102
    .line 103
    shr-long v7, v5, v7

    .line 104
    .line 105
    long-to-int v7, v7

    .line 106
    int-to-byte v7, v7

    .line 107
    const/16 v8, 0x10

    .line 108
    .line 109
    shr-long v8, v5, v8

    .line 110
    .line 111
    long-to-int v8, v8

    .line 112
    int-to-byte v8, v8

    .line 113
    shr-long v9, v5, v1

    .line 114
    .line 115
    long-to-int v1, v9

    .line 116
    int-to-byte v1, v1

    .line 117
    long-to-int v5, v5

    .line 118
    int-to-byte v5, v5

    .line 119
    const/4 v6, 0x4

    .line 120
    new-array v6, v6, [B

    .line 121
    .line 122
    aput-byte v7, v6, v3

    .line 123
    .line 124
    aput-byte v8, v6, v2

    .line 125
    .line 126
    aput-byte v1, v6, p3

    .line 127
    .line 128
    aput-byte v5, v6, v4

    .line 129
    .line 130
    iget-object p3, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 131
    .line 132
    invoke-direct {p0, p3, v6}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->addTo([B[B)V

    .line 133
    .line 134
    .line 135
    iget-wide v1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 136
    .line 137
    const-wide/16 v4, 0x1

    .line 138
    .line 139
    add-long/2addr v1, v4

    .line 140
    iput-wide v1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 141
    .line 142
    array-length p0, p1

    .line 143
    invoke-static {p2, v3, p1, v3, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    .line 145
    .line 146
    return v0

    .line 147
    :cond_3
    const-string p0, "Number of bits per request limited to 262144"

    .line 148
    .line 149
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return v3
.end method

.method public getBlockSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/lit8 p0, p0, 0x8

    .line 8
    .line 9
    return p0
.end method

.method public reseed([B)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->getEntropy()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->ONE:[B

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 8
    .line 9
    invoke-static {v1, v2, v0, p1}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B[B)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    iget v1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_seedLength:I

    .line 16
    .line 17
    invoke-static {v0, p1, v1}, Lorg/spongycastle/crypto/prng/drbg/Utils;->hash_df(Lorg/spongycastle/crypto/Digest;[BI)[B

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_V:[B

    .line 22
    .line 23
    array-length v0, p1

    .line 24
    const/4 v1, 0x1

    .line 25
    add-int/2addr v0, v1

    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aput-byte v2, v0, v2

    .line 30
    .line 31
    array-length v3, p1

    .line 32
    invoke-static {p1, v2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_digest:Lorg/spongycastle/crypto/Digest;

    .line 36
    .line 37
    iget v1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_seedLength:I

    .line 38
    .line 39
    invoke-static {p1, v0, v1}, Lorg/spongycastle/crypto/prng/drbg/Utils;->hash_df(Lorg/spongycastle/crypto/Digest;[BI)[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_C:[B

    .line 44
    .line 45
    const-wide/16 v0, 0x1

    .line 46
    .line 47
    iput-wide v0, p0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;->_reseedCounter:J

    .line 48
    .line 49
    return-void
.end method
