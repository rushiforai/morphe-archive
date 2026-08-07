.class public Lorg/spongycastle/crypto/macs/BlockCipherMac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field private buf:[B

.field private bufOff:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private mac:[B

.field private macSize:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    .line 46
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    div-int/lit8 v0, v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/macs/BlockCipherMac;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    rem-int/lit8 v0, p2, 0x8

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 14
    .line 15
    div-int/lit8 p2, p2, 0x8

    .line 16
    .line 17
    iput p2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->macSize:I

    .line 18
    .line 19
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    new-array p2, p2, [B

    .line 24
    .line 25
    iput-object p2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    .line 26
    .line 27
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    new-array p1, p1, [B

    .line 32
    .line 33
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput p1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "MAC size must be multiple of 8"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    throw p0
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 13
    .line 14
    aput-byte v2, v3, v1

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    iput v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 22
    .line 23
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 24
    .line 25
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    .line 26
    .line 27
    invoke-interface {v0, v1, v2, v3, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    .line 31
    .line 32
    iget v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->macSize:I

    .line 33
    .line 34
    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/BlockCipherMac;->reset()V

    .line 38
    .line 39
    .line 40
    iget p0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->macSize:I

    .line 41
    .line 42
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->macSize:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/BlockCipherMac;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-interface {p0, v0, p1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    aput-byte v0, v2, v1

    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 14
    .line 15
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 16
    .line 17
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public update(B)V
    .locals 4

    .line 65
    iget v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 66
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 67
    iput v3, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 68
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    aput-byte p1, v0, v1

    return-void
.end method

.method public update([BII)V
    .locals 6

    .line 1
    if-ltz p3, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 10
    .line 11
    sub-int v2, v0, v1

    .line 12
    .line 13
    if-le p3, v2, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 16
    .line 17
    invoke-static {p1, p2, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 21
    .line 22
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 23
    .line 24
    iget-object v4, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-interface {v1, v3, v5, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 28
    .line 29
    .line 30
    iput v5, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 31
    .line 32
    sub-int/2addr p3, v2

    .line 33
    add-int/2addr p2, v2

    .line 34
    :goto_0
    if-le p3, v0, :cond_0

    .line 35
    .line 36
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 37
    .line 38
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->mac:[B

    .line 39
    .line 40
    invoke-interface {v1, p1, p2, v2, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 41
    .line 42
    .line 43
    sub-int/2addr p3, v0

    .line 44
    add-int/2addr p2, v0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->buf:[B

    .line 47
    .line 48
    iget v1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 49
    .line 50
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    iget p1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 54
    .line 55
    add-int/2addr p1, p3

    .line 56
    iput p1, p0, Lorg/spongycastle/crypto/macs/BlockCipherMac;->bufOff:I

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const-string p0, "Can\'t have a negative input length!"

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
