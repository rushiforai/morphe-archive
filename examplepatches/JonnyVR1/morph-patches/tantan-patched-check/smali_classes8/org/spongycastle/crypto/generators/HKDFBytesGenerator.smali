.class public Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationFunction;


# instance fields
.field private currentT:[B

.field private generatedBytes:I

.field private hMacHash:Lorg/spongycastle/crypto/macs/HMac;

.field private hashLen:I

.field private info:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/macs/HMac;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 10
    .line 11
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 16
    .line 17
    return-void
.end method

.method private expandNext()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 4
    .line 5
    div-int v2, v0, v1

    .line 6
    .line 7
    add-int/lit8 v2, v2, 0x1

    .line 8
    .line 9
    const/16 v3, 0x100

    .line 10
    .line 11
    if-ge v2, v3, :cond_1

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 17
    .line 18
    iget-object v4, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->currentT:[B

    .line 19
    .line 20
    invoke-virtual {v0, v4, v3, v1}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 24
    .line 25
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->info:[B

    .line 26
    .line 27
    array-length v4, v1

    .line 28
    invoke-virtual {v0, v1, v3, v4}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 32
    .line 33
    int-to-byte v1, v2

    .line 34
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/macs/HMac;->update(B)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 38
    .line 39
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->currentT:[B

    .line 40
    .line 41
    invoke-virtual {v0, p0, v3}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string p0, "HKDF cannot generate more than 255 blocks of HashLen size"

    .line 46
    .line 47
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private extract([B[B)Lorg/spongycastle/crypto/params/KeyParameter;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    new-instance p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 16
    .line 17
    iget v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 18
    .line 19
    new-array v1, v1, [B

    .line 20
    .line 21
    invoke-direct {p1, v1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 37
    .line 38
    array-length v0, p2

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p1, p2, v1, v0}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 44
    .line 45
    new-array p1, p1, [B

    .line 46
    .line 47
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 48
    .line 49
    invoke-virtual {p0, p1, v1}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 50
    .line 51
    .line 52
    new-instance p0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 53
    .line 54
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method


# virtual methods
.method public generateBytes([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 2
    .line 3
    add-int v1, v0, p3

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 6
    .line 7
    mul-int/lit16 v3, v2, 0xff

    .line 8
    .line 9
    if-gt v1, v3, :cond_2

    .line 10
    .line 11
    rem-int/2addr v0, v2

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->expandNext()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 20
    .line 21
    rem-int v2, v0, v1

    .line 22
    .line 23
    rem-int/2addr v0, v1

    .line 24
    sub-int/2addr v1, v0

    .line 25
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->currentT:[B

    .line 30
    .line 31
    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 35
    .line 36
    add-int/2addr v1, v0

    .line 37
    iput v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 38
    .line 39
    sub-int v1, p3, v0

    .line 40
    .line 41
    :goto_0
    add-int/2addr p2, v0

    .line 42
    if-lez v1, :cond_1

    .line 43
    .line 44
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->expandNext()V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->currentT:[B

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 57
    .line 58
    .line 59
    iget v2, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 60
    .line 61
    add-int/2addr v2, v0

    .line 62
    iput v2, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 63
    .line 64
    sub-int/2addr v1, v0

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return p3

    .line 67
    :cond_2
    const-string p0, "HKDF may only be used for 255 * HashLen bytes of output"

    .line 68
    .line 69
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return p0
.end method

.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/HMac;->getUnderlyingDigest()Lorg/spongycastle/crypto/Digest;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/spongycastle/crypto/params/HKDFParameters;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lorg/spongycastle/crypto/params/HKDFParameters;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/HKDFParameters;->skipExtract()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hMacHash:Lorg/spongycastle/crypto/macs/HMac;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 16
    .line 17
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/HKDFParameters;->getIKM()[B

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/HKDFParameters;->getSalt()[B

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/HKDFParameters;->getIKM()[B

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {p0, v0, v2}, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->extract([B[B)Lorg/spongycastle/crypto/params/KeyParameter;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/HKDFParameters;->getInfo()[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->info:[B

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->generatedBytes:I

    .line 51
    .line 52
    iget p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->hashLen:I

    .line 53
    .line 54
    new-array p1, p1, [B

    .line 55
    .line 56
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/HKDFBytesGenerator;->currentT:[B

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const-string p0, "HKDF parameters required for HKDFBytesGenerator"

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
