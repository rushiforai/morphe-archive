.class public Lorg/spongycastle/crypto/macs/OldHMac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# static fields
.field private static final BLOCK_LENGTH:I = 0x40

.field private static final IPAD:B = 0x36t

.field private static final OPAD:B = 0x5ct


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private digestSize:I

.field private inputPad:[B

.field private outputPad:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x40

    .line 5
    .line 6
    new-array v1, v0, [B

    .line 7
    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 15
    .line 16
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 12
    .line 13
    iget-object v4, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 14
    .line 15
    array-length v5, v4

    .line 16
    invoke-interface {v2, v4, v3, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 20
    .line 21
    invoke-interface {v2, v1, v3, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 25
    .line 26
    invoke-interface {v0, p1, p2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/OldHMac;->reset()V

    .line 31
    .line 32
    .line 33
    return p1
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "/HMAC"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlyingDigest()Lorg/spongycastle/crypto/Digest;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    array-length v0, p1

    .line 13
    const/16 v1, 0x40

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-le v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 19
    .line 20
    array-length v1, p1

    .line 21
    invoke-interface {v0, p1, v2, v1}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 25
    .line 26
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 27
    .line 28
    invoke-interface {p1, v0, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 29
    .line 30
    .line 31
    iget p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 34
    .line 35
    array-length v1, v0

    .line 36
    if-ge p1, v1, :cond_1

    .line 37
    .line 38
    aput-byte v2, v0, p1

    .line 39
    .line 40
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 44
    .line 45
    array-length v1, p1

    .line 46
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    array-length p1, p1

    .line 50
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 51
    .line 52
    array-length v1, v0

    .line 53
    if-ge p1, v1, :cond_1

    .line 54
    .line 55
    aput-byte v2, v0, p1

    .line 56
    .line 57
    add-int/lit8 p1, p1, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 61
    .line 62
    array-length v0, p1

    .line 63
    new-array v0, v0, [B

    .line 64
    .line 65
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 66
    .line 67
    array-length v1, p1

    .line 68
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 69
    .line 70
    .line 71
    move p1, v2

    .line 72
    :goto_2
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 73
    .line 74
    array-length v1, v0

    .line 75
    if-ge p1, v1, :cond_2

    .line 76
    .line 77
    aget-byte v1, v0, p1

    .line 78
    .line 79
    xor-int/lit8 v1, v1, 0x36

    .line 80
    .line 81
    int-to-byte v1, v1

    .line 82
    aput-byte v1, v0, p1

    .line 83
    .line 84
    add-int/lit8 p1, p1, 0x1

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_2
    move p1, v2

    .line 88
    :goto_3
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 89
    .line 90
    array-length v1, v0

    .line 91
    if-ge p1, v1, :cond_3

    .line 92
    .line 93
    aget-byte v1, v0, p1

    .line 94
    .line 95
    xor-int/lit8 v1, v1, 0x5c

    .line 96
    .line 97
    int-to-byte v1, v1

    .line 98
    aput-byte v1, v0, p1

    .line 99
    .line 100
    add-int/lit8 p1, p1, 0x1

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_3
    iget-object p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 104
    .line 105
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 106
    .line 107
    array-length v0, p0

    .line 108
    invoke-interface {p1, p0, v2, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-interface {v0, p0, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public update(B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public update([BII)V
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    return-void
.end method
