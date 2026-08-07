.class public Lorg/spongycastle/crypto/engines/XTEAEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final block_size:I = 0x8

.field private static final delta:I = -0x61c88647

.field private static final rounds:I = 0x20


# instance fields
.field private _S:[I

.field private _forEncryption:Z

.field private _initialised:Z

.field private _sum0:[I

.field private _sum1:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_S:[I

    .line 8
    .line 9
    const/16 v0, 0x20

    .line 10
    .line 11
    new-array v1, v0, [I

    .line 12
    .line 13
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum0:[I

    .line 14
    .line 15
    new-array v0, v0, [I

    .line 16
    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum1:[I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_initialised:Z

    .line 21
    .line 22
    return-void
.end method

.method private bytesToInt([BI)I
    .locals 2

    .line 1
    add-int/lit8 p0, p2, 0x1

    .line 2
    .line 3
    aget-byte v0, p1, p2

    .line 4
    .line 5
    shl-int/lit8 v0, v0, 0x18

    .line 6
    .line 7
    add-int/lit8 v1, p2, 0x2

    .line 8
    .line 9
    aget-byte p0, p1, p0

    .line 10
    .line 11
    and-int/lit16 p0, p0, 0xff

    .line 12
    .line 13
    shl-int/lit8 p0, p0, 0x10

    .line 14
    .line 15
    or-int/2addr p0, v0

    .line 16
    add-int/lit8 p2, p2, 0x3

    .line 17
    .line 18
    aget-byte v0, p1, v1

    .line 19
    .line 20
    and-int/lit16 v0, v0, 0xff

    .line 21
    .line 22
    shl-int/lit8 v0, v0, 0x8

    .line 23
    .line 24
    or-int/2addr p0, v0

    .line 25
    aget-byte p1, p1, p2

    .line 26
    .line 27
    and-int/lit16 p1, p1, 0xff

    .line 28
    .line 29
    or-int/2addr p0, p1

    .line 30
    return p0
.end method

.method private decryptBlock([BI[BI)I
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/XTEAEngine;->bytesToInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, 0x4

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/XTEAEngine;->bytesToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/16 p2, 0x1f

    .line 12
    .line 13
    :goto_0
    if-ltz p2, :cond_0

    .line 14
    .line 15
    shl-int/lit8 v1, v0, 0x4

    .line 16
    .line 17
    ushr-int/lit8 v2, v0, 0x5

    .line 18
    .line 19
    xor-int/2addr v1, v2

    .line 20
    add-int/2addr v1, v0

    .line 21
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum1:[I

    .line 22
    .line 23
    aget v2, v2, p2

    .line 24
    .line 25
    xor-int/2addr v1, v2

    .line 26
    sub-int/2addr p1, v1

    .line 27
    shl-int/lit8 v1, p1, 0x4

    .line 28
    .line 29
    ushr-int/lit8 v2, p1, 0x5

    .line 30
    .line 31
    xor-int/2addr v1, v2

    .line 32
    add-int/2addr v1, p1

    .line 33
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum0:[I

    .line 34
    .line 35
    aget v2, v2, p2

    .line 36
    .line 37
    xor-int/2addr v1, v2

    .line 38
    sub-int/2addr v0, v1

    .line 39
    add-int/lit8 p2, p2, -0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-direct {p0, v0, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->unpackInt(I[BI)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 p4, p4, 0x4

    .line 46
    .line 47
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->unpackInt(I[BI)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x8

    .line 51
    .line 52
    return p0
.end method

.method private encryptBlock([BI[BI)I
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/XTEAEngine;->bytesToInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, 0x4

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/XTEAEngine;->bytesToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 p2, 0x0

    .line 12
    :goto_0
    const/16 v1, 0x20

    .line 13
    .line 14
    if-ge p2, v1, :cond_0

    .line 15
    .line 16
    shl-int/lit8 v1, p1, 0x4

    .line 17
    .line 18
    ushr-int/lit8 v2, p1, 0x5

    .line 19
    .line 20
    xor-int/2addr v1, v2

    .line 21
    add-int/2addr v1, p1

    .line 22
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum0:[I

    .line 23
    .line 24
    aget v2, v2, p2

    .line 25
    .line 26
    xor-int/2addr v1, v2

    .line 27
    add-int/2addr v0, v1

    .line 28
    shl-int/lit8 v1, v0, 0x4

    .line 29
    .line 30
    ushr-int/lit8 v2, v0, 0x5

    .line 31
    .line 32
    xor-int/2addr v1, v2

    .line 33
    add-int/2addr v1, v0

    .line 34
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum1:[I

    .line 35
    .line 36
    aget v2, v2, p2

    .line 37
    .line 38
    xor-int/2addr v1, v2

    .line 39
    add-int/2addr p1, v1

    .line 40
    add-int/lit8 p2, p2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-direct {p0, v0, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->unpackInt(I[BI)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 p4, p4, 0x4

    .line 47
    .line 48
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->unpackInt(I[BI)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    return p0
.end method

.method private setKey([B)V
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    if-ne v0, v1, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, 0x4

    .line 10
    if-ge v1, v3, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_S:[I

    .line 13
    .line 14
    invoke-direct {p0, p1, v2}, Lorg/spongycastle/crypto/engines/XTEAEngine;->bytesToInt([BI)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    aput v5, v4, v1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    add-int/2addr v2, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move p1, v0

    .line 25
    :goto_1
    const/16 v1, 0x20

    .line 26
    .line 27
    if-ge v0, v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum0:[I

    .line 30
    .line 31
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_S:[I

    .line 32
    .line 33
    and-int/lit8 v3, p1, 0x3

    .line 34
    .line 35
    aget v3, v2, v3

    .line 36
    .line 37
    add-int/2addr v3, p1

    .line 38
    aput v3, v1, v0

    .line 39
    .line 40
    const v1, 0x61c88647

    .line 41
    .line 42
    .line 43
    sub-int/2addr p1, v1

    .line 44
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_sum1:[I

    .line 45
    .line 46
    ushr-int/lit8 v3, p1, 0xb

    .line 47
    .line 48
    and-int/lit8 v3, v3, 0x3

    .line 49
    .line 50
    aget v2, v2, v3

    .line 51
    .line 52
    add-int/2addr v2, p1

    .line 53
    aput v2, v1, v0

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    return-void

    .line 59
    :cond_2
    const-string p0, "Key size must be 128 bits."

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private unpackInt(I[BI)V
    .locals 2

    .line 1
    add-int/lit8 p0, p3, 0x1

    .line 2
    .line 3
    ushr-int/lit8 v0, p1, 0x18

    .line 4
    .line 5
    int-to-byte v0, v0

    .line 6
    aput-byte v0, p2, p3

    .line 7
    .line 8
    add-int/lit8 v0, p3, 0x2

    .line 9
    .line 10
    ushr-int/lit8 v1, p1, 0x10

    .line 11
    .line 12
    int-to-byte v1, v1

    .line 13
    aput-byte v1, p2, p0

    .line 14
    .line 15
    add-int/lit8 p3, p3, 0x3

    .line 16
    .line 17
    ushr-int/lit8 p0, p1, 0x8

    .line 18
    .line 19
    int-to-byte p0, p0

    .line 20
    aput-byte p0, p2, v0

    .line 21
    .line 22
    int-to-byte p0, p1

    .line 23
    aput-byte p0, p2, p3

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "XTEA"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_forEncryption:Z

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_initialised:Z

    .line 9
    .line 10
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 11
    .line 12
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/XTEAEngine;->setKey([B)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "invalid parameter passed to TEA init - "

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_initialised:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x8

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x8

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/XTEAEngine;->_forEncryption:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->encryptBlock([BI[BI)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/XTEAEngine;->decryptBlock([BI[BI)I

    .line 26
    .line 27
    .line 28
    move-result p0

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
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/XTEAEngine;->getAlgorithmName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, " not initialised"

    .line 47
    .line 48
    invoke-static {p0, p1}, Ll/rrc0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method
