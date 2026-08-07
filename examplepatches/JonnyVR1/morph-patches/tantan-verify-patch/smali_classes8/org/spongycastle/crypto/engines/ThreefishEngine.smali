.class public Lorg/spongycastle/crypto/engines/ThreefishEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;,
        Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;,
        Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish256Cipher;,
        Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;
    }
.end annotation


# static fields
.field public static final BLOCKSIZE_1024:I = 0x400

.field public static final BLOCKSIZE_256:I = 0x100

.field public static final BLOCKSIZE_512:I = 0x200

.field private static final C_240:J = 0x1bd11bdaa9fc1a22L

.field private static final MAX_ROUNDS:I = 0x50

.field private static MOD17:[I = null

.field private static MOD3:[I = null

.field private static MOD5:[I = null

.field private static MOD9:[I = null

.field private static final ROUNDS_1024:I = 0x50

.field private static final ROUNDS_256:I = 0x48

.field private static final ROUNDS_512:I = 0x48

.field private static final TWEAK_SIZE_BYTES:I = 0x10

.field private static final TWEAK_SIZE_WORDS:I = 0x2


# instance fields
.field private blocksizeBytes:I

.field private blocksizeWords:I

.field private cipher:Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;

.field private currentBlock:[J

.field private forEncryption:Z

.field private kw:[J

.field private t:[J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x50

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    sput-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD9:[I

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    new-array v1, v1, [I

    .line 9
    .line 10
    sput-object v1, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD17:[I

    .line 11
    .line 12
    array-length v1, v0

    .line 13
    new-array v1, v1, [I

    .line 14
    .line 15
    sput-object v1, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD5:[I

    .line 16
    .line 17
    array-length v0, v0

    .line 18
    new-array v0, v0, [I

    .line 19
    .line 20
    sput-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    sget-object v1, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD9:[I

    .line 24
    .line 25
    array-length v2, v1

    .line 26
    if-ge v0, v2, :cond_0

    .line 27
    .line 28
    sget-object v2, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD17:[I

    .line 29
    .line 30
    rem-int/lit8 v3, v0, 0x11

    .line 31
    .line 32
    aput v3, v2, v0

    .line 33
    .line 34
    rem-int/lit8 v2, v0, 0x9

    .line 35
    .line 36
    aput v2, v1, v0

    .line 37
    .line 38
    sget-object v1, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD5:[I

    .line 39
    .line 40
    rem-int/lit8 v2, v0, 0x5

    .line 41
    .line 42
    aput v2, v1, v0

    .line 43
    .line 44
    sget-object v1, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I

    .line 45
    .line 46
    rem-int/lit8 v2, v0, 0x3

    .line 47
    .line 48
    aput v2, v1, v0

    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    new-array v0, v0, [J

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->t:[J

    .line 8
    .line 9
    div-int/lit8 v1, p1, 0x8

    .line 10
    .line 11
    iput v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 12
    .line 13
    div-int/lit8 v1, v1, 0x8

    .line 14
    .line 15
    iput v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    .line 16
    .line 17
    new-array v2, v1, [J

    .line 18
    .line 19
    iput-object v2, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->currentBlock:[J

    .line 20
    .line 21
    mul-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    new-array v1, v1, [J

    .line 26
    .line 27
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->kw:[J

    .line 28
    .line 29
    const/16 v2, 0x100

    .line 30
    .line 31
    if-eq p1, v2, :cond_2

    .line 32
    .line 33
    const/16 v2, 0x200

    .line 34
    .line 35
    if-eq p1, v2, :cond_1

    .line 36
    .line 37
    const/16 v2, 0x400

    .line 38
    .line 39
    if-ne p1, v2, :cond_0

    .line 40
    .line 41
    new-instance p1, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;

    .line 42
    .line 43
    invoke-direct {p1, v1, v0}, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;-><init>([J[J)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->cipher:Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const-string p0, "Invalid blocksize - Threefish is defined with block size of 256, 512, or 1024 bits"

    .line 50
    .line 51
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    throw p0

    .line 56
    :cond_1
    new-instance p1, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;

    .line 57
    .line 58
    invoke-direct {p1, v1, v0}, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;-><init>([J[J)V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->cipher:Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;

    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    new-instance p1, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish256Cipher;

    .line 65
    .line 66
    invoke-direct {p1, v1, v0}, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish256Cipher;-><init>([J[J)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->cipher:Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;

    .line 70
    .line 71
    return-void
.end method

.method public static synthetic access$000()[I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD5:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100()[I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()[I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD9:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300()[I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD17:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static bytesToWord([BI)J
    .locals 8

    .line 1
    add-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    if-gt v0, v1, :cond_0

    .line 5
    .line 6
    add-int/lit8 v0, p1, 0x1

    .line 7
    .line 8
    aget-byte v1, p0, p1

    .line 9
    .line 10
    int-to-long v1, v1

    .line 11
    const-wide/16 v3, 0xff

    .line 12
    .line 13
    and-long/2addr v1, v3

    .line 14
    add-int/lit8 v5, p1, 0x2

    .line 15
    .line 16
    aget-byte v0, p0, v0

    .line 17
    .line 18
    int-to-long v6, v0

    .line 19
    and-long/2addr v6, v3

    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    shl-long/2addr v6, v0

    .line 23
    or-long v0, v1, v6

    .line 24
    .line 25
    add-int/lit8 v2, p1, 0x3

    .line 26
    .line 27
    aget-byte v5, p0, v5

    .line 28
    .line 29
    int-to-long v5, v5

    .line 30
    and-long/2addr v5, v3

    .line 31
    const/16 v7, 0x10

    .line 32
    .line 33
    shl-long/2addr v5, v7

    .line 34
    or-long/2addr v0, v5

    .line 35
    add-int/lit8 v5, p1, 0x4

    .line 36
    .line 37
    aget-byte v2, p0, v2

    .line 38
    .line 39
    int-to-long v6, v2

    .line 40
    and-long/2addr v6, v3

    .line 41
    const/16 v2, 0x18

    .line 42
    .line 43
    shl-long/2addr v6, v2

    .line 44
    or-long/2addr v0, v6

    .line 45
    add-int/lit8 v2, p1, 0x5

    .line 46
    .line 47
    aget-byte v5, p0, v5

    .line 48
    .line 49
    int-to-long v5, v5

    .line 50
    and-long/2addr v5, v3

    .line 51
    const/16 v7, 0x20

    .line 52
    .line 53
    shl-long/2addr v5, v7

    .line 54
    or-long/2addr v0, v5

    .line 55
    add-int/lit8 v5, p1, 0x6

    .line 56
    .line 57
    aget-byte v2, p0, v2

    .line 58
    .line 59
    int-to-long v6, v2

    .line 60
    and-long/2addr v6, v3

    .line 61
    const/16 v2, 0x28

    .line 62
    .line 63
    shl-long/2addr v6, v2

    .line 64
    or-long/2addr v0, v6

    .line 65
    add-int/lit8 p1, p1, 0x7

    .line 66
    .line 67
    aget-byte v2, p0, v5

    .line 68
    .line 69
    int-to-long v5, v2

    .line 70
    and-long/2addr v5, v3

    .line 71
    const/16 v2, 0x30

    .line 72
    .line 73
    shl-long/2addr v5, v2

    .line 74
    or-long/2addr v0, v5

    .line 75
    aget-byte p0, p0, p1

    .line 76
    .line 77
    int-to-long p0, p0

    .line 78
    and-long/2addr p0, v3

    .line 79
    const/16 v2, 0x38

    .line 80
    .line 81
    shl-long/2addr p0, v2

    .line 82
    or-long/2addr p0, v0

    .line 83
    return-wide p0

    .line 84
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 85
    .line 86
    .line 87
    const-wide/16 p0, 0x0

    .line 88
    .line 89
    return-wide p0
.end method

.method public static rotlXor(JIJ)J
    .locals 2

    shl-long v0, p0, p2

    neg-int p2, p2

    ushr-long/2addr p0, p2

    or-long/2addr p0, v0

    xor-long/2addr p0, p3

    return-wide p0
.end method

.method private setKey([J)V
    .locals 8

    .line 1
    array-length v0, p1

    .line 2
    iget v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    .line 3
    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const-wide v1, 0x1bd11bdaa9fc1a22L    # 1.080841987832705E-174

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    move v3, v0

    .line 13
    :goto_0
    iget v4, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    .line 14
    .line 15
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->kw:[J

    .line 16
    .line 17
    if-ge v3, v4, :cond_0

    .line 18
    .line 19
    aget-wide v6, p1, v3

    .line 20
    .line 21
    aput-wide v6, v5, v3

    .line 22
    .line 23
    xor-long/2addr v1, v6

    .line 24
    add-int/lit8 v3, v3, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    aput-wide v1, v5, v4

    .line 28
    .line 29
    add-int/lit8 p0, v4, 0x1

    .line 30
    .line 31
    invoke-static {v5, v0, v5, p0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    .line 36
    .line 37
    const-string p1, " words)"

    .line 38
    .line 39
    const-string v0, "Threefish key must be same size as block ("

    .line 40
    .line 41
    invoke-static {v0, p0, p1}, Ll/vic0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private setTweak([J)V
    .locals 8

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x2

    .line 3
    if-ne v0, v1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->t:[J

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget-wide v2, p1, v0

    .line 9
    .line 10
    aput-wide v2, p0, v0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    aget-wide v4, p1, v0

    .line 14
    .line 15
    aput-wide v4, p0, v0

    .line 16
    .line 17
    xor-long v6, v2, v4

    .line 18
    .line 19
    aput-wide v6, p0, v1

    .line 20
    .line 21
    const/4 p1, 0x3

    .line 22
    aput-wide v2, p0, p1

    .line 23
    .line 24
    const/4 p1, 0x4

    .line 25
    aput-wide v4, p0, p1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "Tweak must be 2 words."

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static wordToBytes(J[BI)V
    .locals 4

    .line 1
    add-int/lit8 v0, p3, 0x8

    .line 2
    .line 3
    array-length v1, p2

    .line 4
    if-gt v0, v1, :cond_0

    .line 5
    .line 6
    add-int/lit8 v0, p3, 0x1

    .line 7
    .line 8
    long-to-int v1, p0

    .line 9
    int-to-byte v1, v1

    .line 10
    aput-byte v1, p2, p3

    .line 11
    .line 12
    add-int/lit8 v1, p3, 0x2

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    shr-long v2, p0, v2

    .line 17
    .line 18
    long-to-int v2, v2

    .line 19
    int-to-byte v2, v2

    .line 20
    aput-byte v2, p2, v0

    .line 21
    .line 22
    add-int/lit8 v0, p3, 0x3

    .line 23
    .line 24
    const/16 v2, 0x10

    .line 25
    .line 26
    shr-long v2, p0, v2

    .line 27
    .line 28
    long-to-int v2, v2

    .line 29
    int-to-byte v2, v2

    .line 30
    aput-byte v2, p2, v1

    .line 31
    .line 32
    add-int/lit8 v1, p3, 0x4

    .line 33
    .line 34
    const/16 v2, 0x18

    .line 35
    .line 36
    shr-long v2, p0, v2

    .line 37
    .line 38
    long-to-int v2, v2

    .line 39
    int-to-byte v2, v2

    .line 40
    aput-byte v2, p2, v0

    .line 41
    .line 42
    add-int/lit8 v0, p3, 0x5

    .line 43
    .line 44
    const/16 v2, 0x20

    .line 45
    .line 46
    shr-long v2, p0, v2

    .line 47
    .line 48
    long-to-int v2, v2

    .line 49
    int-to-byte v2, v2

    .line 50
    aput-byte v2, p2, v1

    .line 51
    .line 52
    add-int/lit8 v1, p3, 0x6

    .line 53
    .line 54
    const/16 v2, 0x28

    .line 55
    .line 56
    shr-long v2, p0, v2

    .line 57
    .line 58
    long-to-int v2, v2

    .line 59
    int-to-byte v2, v2

    .line 60
    aput-byte v2, p2, v0

    .line 61
    .line 62
    add-int/lit8 p3, p3, 0x7

    .line 63
    .line 64
    const/16 v0, 0x30

    .line 65
    .line 66
    shr-long v2, p0, v0

    .line 67
    .line 68
    long-to-int v0, v2

    .line 69
    int-to-byte v0, v0

    .line 70
    aput-byte v0, p2, v1

    .line 71
    .line 72
    const/16 v0, 0x38

    .line 73
    .line 74
    shr-long/2addr p0, v0

    .line 75
    long-to-int p0, p0

    .line 76
    int-to-byte p0, p0

    .line 77
    aput-byte p0, p2, p3

    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static xorRotr(JIJ)J
    .locals 0

    xor-long/2addr p0, p3

    ushr-long p3, p0, p2

    neg-int p2, p2

    shl-long/2addr p0, p2

    or-long/2addr p0, p3

    return-wide p0
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Threefish-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 9
    .line 10
    mul-int/lit8 p0, p0, 0x8

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 2
    .line 3
    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/TweakableBlockCipherParameters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p2, Lorg/spongycastle/crypto/params/TweakableBlockCipherParameters;

    .line 7
    .line 8
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/TweakableBlockCipherParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/TweakableBlockCipherParameters;->getTweak()[B

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 22
    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 26
    .line 27
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object p2, v1

    .line 32
    :goto_0
    const/4 v2, 0x0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    array-length v3, v0

    .line 36
    iget v4, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 37
    .line 38
    if-ne v3, v4, :cond_1

    .line 39
    .line 40
    iget v3, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    .line 41
    .line 42
    new-array v4, v3, [J

    .line 43
    .line 44
    move v5, v2

    .line 45
    :goto_1
    if-ge v5, v3, :cond_3

    .line 46
    .line 47
    mul-int/lit8 v6, v5, 0x8

    .line 48
    .line 49
    invoke-static {v0, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->bytesToWord([BI)J

    .line 50
    .line 51
    .line 52
    move-result-wide v6

    .line 53
    aput-wide v6, v4, v5

    .line 54
    .line 55
    add-int/lit8 v5, v5, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iget p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 59
    .line 60
    const-string p1, " bytes)"

    .line 61
    .line 62
    const-string p2, "Threefish key must be same size as block ("

    .line 63
    .line 64
    invoke-static {p2, p0, p1}, Ll/vic0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    move-object v4, v1

    .line 69
    :cond_3
    if-eqz p2, :cond_5

    .line 70
    .line 71
    array-length v0, p2

    .line 72
    const/16 v1, 0x10

    .line 73
    .line 74
    if-ne v0, v1, :cond_4

    .line 75
    .line 76
    const/4 v0, 0x2

    .line 77
    new-array v1, v0, [J

    .line 78
    .line 79
    invoke-static {p2, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->bytesToWord([BI)J

    .line 80
    .line 81
    .line 82
    move-result-wide v5

    .line 83
    aput-wide v5, v1, v2

    .line 84
    .line 85
    const/16 v0, 0x8

    .line 86
    .line 87
    invoke-static {p2, v0}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->bytesToWord([BI)J

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    const/4 p2, 0x1

    .line 92
    aput-wide v2, v1, p2

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    const-string p0, "Threefish tweak must be 16 bytes"

    .line 96
    .line 97
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_5
    :goto_2
    invoke-virtual {p0, p1, v4, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->init(Z[J[J)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string p1, "Invalid parameter passed to Threefish init - "

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public init(Z[J[J)V
    .locals 0

    .line 123
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->forEncryption:Z

    if-eqz p2, :cond_0

    .line 124
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->setKey([J)V

    :cond_0
    if-eqz p3, :cond_1

    .line 125
    invoke-direct {p0, p3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->setTweak([J)V

    :cond_1
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 2
    .line 3
    add-int v1, p4, v0

    .line 4
    .line 5
    array-length v2, p3

    .line 6
    const/4 v3, 0x0

    .line 7
    if-gt v1, v2, :cond_3

    .line 8
    .line 9
    add-int/2addr v0, p2

    .line 10
    array-length v1, p1

    .line 11
    if-gt v0, v1, :cond_2

    .line 12
    .line 13
    move v0, v3

    .line 14
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 15
    .line 16
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->currentBlock:[J

    .line 17
    .line 18
    if-ge v0, v1, :cond_0

    .line 19
    .line 20
    shr-int/lit8 v1, v0, 0x3

    .line 21
    .line 22
    add-int v4, p2, v0

    .line 23
    .line 24
    invoke-static {p1, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->bytesToWord([BI)J

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    aput-wide v4, v2, v1

    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x8

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0, v2, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->processBlock([J[J)I

    .line 34
    .line 35
    .line 36
    :goto_1
    iget p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeBytes:I

    .line 37
    .line 38
    if-ge v3, p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->currentBlock:[J

    .line 41
    .line 42
    shr-int/lit8 p2, v3, 0x3

    .line 43
    .line 44
    aget-wide v0, p1, p2

    .line 45
    .line 46
    add-int p1, p4, v3

    .line 47
    .line 48
    invoke-static {v0, v1, p3, p1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->wordToBytes(J[BI)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v3, v3, 0x8

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    return p1

    .line 55
    :cond_2
    const-string p0, "Input buffer too short"

    .line 56
    .line 57
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v3

    .line 61
    :cond_3
    const-string p0, "Output buffer too short"

    .line 62
    .line 63
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return v3
.end method

.method public processBlock([J[J)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->kw:[J

    iget v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    aget-wide v2, v0, v1

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 68
    array-length v0, p1

    if-ne v0, v1, :cond_2

    .line 69
    array-length v0, p2

    if-ne v0, v1, :cond_1

    .line 70
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->forEncryption:Z

    .line 71
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->cipher:Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->encryptBlock([J[J)V

    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->decryptBlock([J[J)V

    .line 74
    :goto_0
    iget p0, p0, Lorg/spongycastle/crypto/engines/ThreefishEngine;->blocksizeWords:I

    return p0

    .line 75
    :cond_1
    const-string p0, "Output buffer too short"

    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    return v2

    .line 76
    :cond_2
    const-string p0, "Input buffer too short"

    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    return v2

    .line 77
    :cond_3
    const-string p0, "Threefish engine not initialised"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return v2
.end method

.method public reset()V
    .locals 0

    return-void
.end method
