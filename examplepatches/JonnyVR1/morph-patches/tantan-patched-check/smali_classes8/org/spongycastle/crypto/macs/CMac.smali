.class public Lorg/spongycastle/crypto/macs/CMac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field private Lu:[B

.field private Lu2:[B

.field private ZEROES:[B

.field private buf:[B

.field private bufOff:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private mac:[B

.field private macSize:I

.field private poly:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    .line 84
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/macs/CMac;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    rem-int/lit8 v0, p2, 0x8

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x8

    .line 14
    .line 15
    if-gt p2, v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 23
    .line 24
    div-int/lit8 p2, p2, 0x8

    .line 25
    .line 26
    iput p2, p0, Lorg/spongycastle/crypto/macs/CMac;->macSize:I

    .line 27
    .line 28
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-static {p2}, Lorg/spongycastle/crypto/macs/CMac;->lookupPoly(I)[B

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p0, Lorg/spongycastle/crypto/macs/CMac;->poly:[B

    .line 37
    .line 38
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    new-array p2, p2, [B

    .line 43
    .line 44
    iput-object p2, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

    .line 45
    .line 46
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    new-array p2, p2, [B

    .line 51
    .line 52
    iput-object p2, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 53
    .line 54
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    new-array p1, p1, [B

    .line 59
    .line 60
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/CMac;->ZEROES:[B

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    iput p1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    mul-int/lit8 p0, p0, 0x8

    .line 71
    .line 72
    const-string p1, "MAC size must be less or equal to "

    .line 73
    .line 74
    invoke-static {p1, p0}, Ll/pvb;->a(Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    throw v1

    .line 78
    :cond_1
    const-string p0, "MAC size must be multiple of 8"

    .line 79
    .line 80
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    throw v1
.end method

.method private doubleLu([B)[B
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/macs/CMac;->shiftLeft([B[B)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    neg-int v1, v1

    .line 9
    and-int/lit16 v1, v1, 0xff

    .line 10
    .line 11
    array-length v2, p1

    .line 12
    const/4 v3, 0x3

    .line 13
    sub-int/2addr v2, v3

    .line 14
    aget-byte v4, v0, v2

    .line 15
    .line 16
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/CMac;->poly:[B

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    aget-byte v6, p0, v5

    .line 20
    .line 21
    and-int/2addr v6, v1

    .line 22
    xor-int/2addr v4, v6

    .line 23
    int-to-byte v4, v4

    .line 24
    aput-byte v4, v0, v2

    .line 25
    .line 26
    array-length v2, p1

    .line 27
    const/4 v4, 0x2

    .line 28
    sub-int/2addr v2, v4

    .line 29
    aget-byte v6, v0, v2

    .line 30
    .line 31
    aget-byte v4, p0, v4

    .line 32
    .line 33
    and-int/2addr v4, v1

    .line 34
    xor-int/2addr v4, v6

    .line 35
    int-to-byte v4, v4

    .line 36
    aput-byte v4, v0, v2

    .line 37
    .line 38
    array-length p1, p1

    .line 39
    sub-int/2addr p1, v5

    .line 40
    aget-byte v2, v0, p1

    .line 41
    .line 42
    aget-byte p0, p0, v3

    .line 43
    .line 44
    and-int/2addr p0, v1

    .line 45
    xor-int/2addr p0, v2

    .line 46
    int-to-byte p0, p0

    .line 47
    aput-byte p0, v0, p1

    .line 48
    .line 49
    return-object v0
.end method

.method private static lookupPoly(I)[B
    .locals 2

    .line 1
    mul-int/lit8 p0, p0, 0x8

    .line 2
    .line 3
    const/16 v0, 0x87

    .line 4
    .line 5
    const/16 v1, 0x1b

    .line 6
    .line 7
    sparse-switch p0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    const-string v0, "Unknown block size for CMAC: "

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :sswitch_0
    const v0, 0x86001

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_1
    const v0, 0x80043

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :sswitch_2
    const v0, 0xa0011

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :sswitch_3
    const/16 v0, 0x125

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :sswitch_4
    const/16 v0, 0x851

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :sswitch_5
    const/16 v0, 0x100d

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :sswitch_6
    move v0, v1

    .line 39
    goto :goto_0

    .line 40
    :sswitch_7
    const/16 v0, 0x425

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :sswitch_8
    const/16 v0, 0x309

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :sswitch_9
    const/16 v0, 0x2d

    .line 47
    .line 48
    :goto_0
    :sswitch_a
    invoke-static {v0}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :sswitch_data_0
    .sparse-switch
        0x40 -> :sswitch_6
        0x80 -> :sswitch_a
        0xa0 -> :sswitch_9
        0xc0 -> :sswitch_a
        0xe0 -> :sswitch_8
        0x100 -> :sswitch_7
        0x140 -> :sswitch_6
        0x180 -> :sswitch_5
        0x1c0 -> :sswitch_4
        0x200 -> :sswitch_3
        0x300 -> :sswitch_2
        0x400 -> :sswitch_1
        0x800 -> :sswitch_0
    .end sparse-switch
.end method

.method private static shiftLeft([B[B)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    aget-byte v2, p0, v0

    .line 8
    .line 9
    and-int/lit16 v2, v2, 0xff

    .line 10
    .line 11
    shl-int/lit8 v3, v2, 0x1

    .line 12
    .line 13
    or-int/2addr v1, v3

    .line 14
    int-to-byte v1, v1

    .line 15
    aput-byte v1, p1, v0

    .line 16
    .line 17
    ushr-int/lit8 v1, v2, 0x7

    .line 18
    .line 19
    and-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return v1
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 8
    .line 9
    if-ne v1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->Lu:[B

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;

    .line 15
    .line 16
    invoke-direct {v0}, Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 20
    .line 21
    iget v2, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;->addPadding([BI)I

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->Lu2:[B

    .line 27
    .line 28
    :goto_0
    const/4 v1, 0x0

    .line 29
    move v2, v1

    .line 30
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

    .line 31
    .line 32
    array-length v4, v3

    .line 33
    if-ge v2, v4, :cond_1

    .line 34
    .line 35
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 36
    .line 37
    aget-byte v4, v3, v2

    .line 38
    .line 39
    aget-byte v5, v0, v2

    .line 40
    .line 41
    xor-int/2addr v4, v5

    .line 42
    int-to-byte v4, v4

    .line 43
    aput-byte v4, v3, v2

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 49
    .line 50
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 51
    .line 52
    invoke-interface {v0, v2, v1, v3, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

    .line 56
    .line 57
    iget v2, p0, Lorg/spongycastle/crypto/macs/CMac;->macSize:I

    .line 58
    .line 59
    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/CMac;->reset()V

    .line 63
    .line 64
    .line 65
    iget p0, p0, Lorg/spongycastle/crypto/macs/CMac;->macSize:I

    .line 66
    .line 67
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

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
    iget p0, p0, Lorg/spongycastle/crypto/macs/CMac;->macSize:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/macs/CMac;->validate(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-interface {v0, v1, p1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lorg/spongycastle/crypto/macs/CMac;->ZEROES:[B

    .line 11
    .line 12
    array-length v0, p1

    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-interface {v1, p1, v2, v0, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/macs/CMac;->doubleLu([B)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/CMac;->Lu:[B

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/macs/CMac;->doubleLu([B)[B

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/CMac;->Lu2:[B

    .line 32
    .line 33
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/CMac;->reset()V

    .line 34
    .line 35
    .line 36
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
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

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
    iput v0, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 14
    .line 15
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

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
    iget v0, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 66
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 67
    iput v3, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 68
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    aput-byte p1, v0, v1

    return-void
.end method

.method public update([BII)V
    .locals 6

    .line 1
    if-ltz p3, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 10
    .line 11
    sub-int v2, v0, v1

    .line 12
    .line 13
    if-le p3, v2, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 16
    .line 17
    invoke-static {p1, p2, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 21
    .line 22
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 23
    .line 24
    iget-object v4, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-interface {v1, v3, v5, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 28
    .line 29
    .line 30
    iput v5, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

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
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/CMac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 37
    .line 38
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/CMac;->mac:[B

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
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/CMac;->buf:[B

    .line 47
    .line 48
    iget v1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 49
    .line 50
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    iget p1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

    .line 54
    .line 55
    add-int/2addr p1, p3

    .line 56
    iput p1, p0, Lorg/spongycastle/crypto/macs/CMac;->bufOff:I

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

.method public validate(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of p0, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "CMac mode only permits key to be set."

    .line 9
    .line 10
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    return-void
.end method
