.class public Lorg/spongycastle/crypto/engines/TEAEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final block_size:I = 0x8

.field private static final d_sum:I = -0x3910c8e0

.field private static final delta:I = -0x61c88647

.field private static final rounds:I = 0x20


# instance fields
.field private _a:I

.field private _b:I

.field private _c:I

.field private _d:I

.field private _forEncryption:Z

.field private _initialised:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_initialised:Z

    .line 6
    .line 7
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
    .locals 5

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, 0x4

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const p2, -0x3910c8e0

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    const/16 v2, 0x20

    .line 16
    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    shl-int/lit8 v2, v0, 0x4

    .line 20
    .line 21
    iget v3, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_c:I

    .line 22
    .line 23
    add-int/2addr v2, v3

    .line 24
    add-int v3, v0, p2

    .line 25
    .line 26
    xor-int/2addr v2, v3

    .line 27
    ushr-int/lit8 v3, v0, 0x5

    .line 28
    .line 29
    iget v4, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_d:I

    .line 30
    .line 31
    add-int/2addr v3, v4

    .line 32
    xor-int/2addr v2, v3

    .line 33
    sub-int/2addr p1, v2

    .line 34
    shl-int/lit8 v2, p1, 0x4

    .line 35
    .line 36
    iget v3, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_a:I

    .line 37
    .line 38
    add-int/2addr v2, v3

    .line 39
    add-int v3, p1, p2

    .line 40
    .line 41
    xor-int/2addr v2, v3

    .line 42
    ushr-int/lit8 v3, p1, 0x5

    .line 43
    .line 44
    iget v4, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_b:I

    .line 45
    .line 46
    add-int/2addr v3, v4

    .line 47
    xor-int/2addr v2, v3

    .line 48
    sub-int/2addr v0, v2

    .line 49
    const v2, 0x61c88647

    .line 50
    .line 51
    .line 52
    add-int/2addr p2, v2

    .line 53
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-direct {p0, v0, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->unpackInt(I[BI)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 p4, p4, 0x4

    .line 60
    .line 61
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->unpackInt(I[BI)V

    .line 62
    .line 63
    .line 64
    const/16 p0, 0x8

    .line 65
    .line 66
    return p0
.end method

.method private encryptBlock([BI[BI)I
    .locals 5

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, 0x4

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 p2, 0x0

    .line 12
    move v1, v0

    .line 13
    move v0, p2

    .line 14
    :goto_0
    const/16 v2, 0x20

    .line 15
    .line 16
    if-eq p2, v2, :cond_0

    .line 17
    .line 18
    const v2, 0x61c88647

    .line 19
    .line 20
    .line 21
    sub-int/2addr v0, v2

    .line 22
    shl-int/lit8 v2, p1, 0x4

    .line 23
    .line 24
    iget v3, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_a:I

    .line 25
    .line 26
    add-int/2addr v2, v3

    .line 27
    add-int v3, p1, v0

    .line 28
    .line 29
    xor-int/2addr v2, v3

    .line 30
    ushr-int/lit8 v3, p1, 0x5

    .line 31
    .line 32
    iget v4, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_b:I

    .line 33
    .line 34
    add-int/2addr v3, v4

    .line 35
    xor-int/2addr v2, v3

    .line 36
    add-int/2addr v1, v2

    .line 37
    shl-int/lit8 v2, v1, 0x4

    .line 38
    .line 39
    iget v3, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_c:I

    .line 40
    .line 41
    add-int/2addr v2, v3

    .line 42
    add-int v3, v1, v0

    .line 43
    .line 44
    xor-int/2addr v2, v3

    .line 45
    ushr-int/lit8 v3, v1, 0x5

    .line 46
    .line 47
    iget v4, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_d:I

    .line 48
    .line 49
    add-int/2addr v3, v4

    .line 50
    xor-int/2addr v2, v3

    .line 51
    add-int/2addr p1, v2

    .line 52
    add-int/lit8 p2, p2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-direct {p0, v1, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->unpackInt(I[BI)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 p4, p4, 0x4

    .line 59
    .line 60
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->unpackInt(I[BI)V

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x8

    .line 64
    .line 65
    return p0
.end method

.method private setKey([B)V
    .locals 2

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_a:I

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_b:I

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_c:I

    .line 27
    .line 28
    const/16 v0, 0xc

    .line 29
    .line 30
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/TEAEngine;->bytesToInt([BI)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_d:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const-string p0, "Key size must be 128 bits."

    .line 38
    .line 39
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
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
    const-string p0, "TEA"

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
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_forEncryption:Z

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_initialised:Z

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
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/TEAEngine;->setKey([B)V

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
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_initialised:Z

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
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/TEAEngine;->_forEncryption:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->encryptBlock([BI[BI)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/TEAEngine;->decryptBlock([BI[BI)I

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
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/TEAEngine;->getAlgorithmName()Ljava/lang/String;

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
