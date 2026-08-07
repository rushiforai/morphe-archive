.class public Lorg/spongycastle/crypto/modes/CCMBlockCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;
    }
.end annotation


# instance fields
.field private associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

.field private blockSize:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

.field private forEncryption:Z

.field private initialAssociatedText:[B

.field private keyParam:Lorg/spongycastle/crypto/CipherParameters;

.field private macBlock:[B

.field private macSize:I

.field private nonce:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;-><init>(Lorg/spongycastle/crypto/modes/CCMBlockCipher;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 10
    .line 11
    new-instance v0, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;-><init>(Lorg/spongycastle/crypto/modes/CCMBlockCipher;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 17
    .line 18
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 19
    .line 20
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 25
    .line 26
    new-array v0, p1, [B

    .line 27
    .line 28
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 29
    .line 30
    const/16 p0, 0x10

    .line 31
    .line 32
    if-ne p1, p0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "cipher required with a block size of 16."

    .line 36
    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    throw p0
.end method

.method private calculateMac([BII[B)I
    .locals 10

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/macs/CBCBlockCipherMac;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 6
    .line 7
    mul-int/lit8 v2, v2, 0x8

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/macs/CBCBlockCipherMac;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->keyParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 15
    .line 16
    .line 17
    const/16 v1, 0x10

    .line 18
    .line 19
    new-array v2, v1, [B

    .line 20
    .line 21
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->hasAssociatedText()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    aget-byte v3, v2, v4

    .line 29
    .line 30
    or-int/lit8 v3, v3, 0x40

    .line 31
    .line 32
    int-to-byte v3, v3

    .line 33
    aput-byte v3, v2, v4

    .line 34
    .line 35
    :cond_0
    aget-byte v3, v2, v4

    .line 36
    .line 37
    invoke-interface {v0}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/4 v6, 0x2

    .line 42
    sub-int/2addr v5, v6

    .line 43
    div-int/2addr v5, v6

    .line 44
    and-int/lit8 v5, v5, 0x7

    .line 45
    .line 46
    shl-int/lit8 v5, v5, 0x3

    .line 47
    .line 48
    or-int/2addr v3, v5

    .line 49
    int-to-byte v3, v3

    .line 50
    aput-byte v3, v2, v4

    .line 51
    .line 52
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->nonce:[B

    .line 53
    .line 54
    array-length v7, v5

    .line 55
    rsub-int/lit8 v7, v7, 0xe

    .line 56
    .line 57
    and-int/lit8 v7, v7, 0x7

    .line 58
    .line 59
    or-int/2addr v3, v7

    .line 60
    int-to-byte v3, v3

    .line 61
    aput-byte v3, v2, v4

    .line 62
    .line 63
    array-length v3, v5

    .line 64
    const/4 v7, 0x1

    .line 65
    invoke-static {v5, v4, v2, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 66
    .line 67
    .line 68
    move v3, p3

    .line 69
    move v5, v7

    .line 70
    :goto_0
    if-lez v3, :cond_1

    .line 71
    .line 72
    rsub-int/lit8 v8, v5, 0x10

    .line 73
    .line 74
    and-int/lit16 v9, v3, 0xff

    .line 75
    .line 76
    int-to-byte v9, v9

    .line 77
    aput-byte v9, v2, v8

    .line 78
    .line 79
    ushr-int/lit8 v3, v3, 0x8

    .line 80
    .line 81
    add-int/2addr v5, v7

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-interface {v0, v2, v4, v1}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->hasAssociatedText()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_5

    .line 91
    .line 92
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->getAssociatedTextLength()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    const v3, 0xff00

    .line 97
    .line 98
    .line 99
    if-ge v2, v3, :cond_2

    .line 100
    .line 101
    shr-int/lit8 v3, v2, 0x8

    .line 102
    .line 103
    int-to-byte v3, v3

    .line 104
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 105
    .line 106
    .line 107
    int-to-byte v3, v2

    .line 108
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    const/4 v3, -0x1

    .line 113
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 114
    .line 115
    .line 116
    const/4 v3, -0x2

    .line 117
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 118
    .line 119
    .line 120
    shr-int/lit8 v3, v2, 0x18

    .line 121
    .line 122
    int-to-byte v3, v3

    .line 123
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 124
    .line 125
    .line 126
    shr-int/lit8 v3, v2, 0x10

    .line 127
    .line 128
    int-to-byte v3, v3

    .line 129
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 130
    .line 131
    .line 132
    shr-int/lit8 v3, v2, 0x8

    .line 133
    .line 134
    int-to-byte v3, v3

    .line 135
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 136
    .line 137
    .line 138
    int-to-byte v3, v2

    .line 139
    invoke-interface {v0, v3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 140
    .line 141
    .line 142
    const/4 v6, 0x6

    .line 143
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->initialAssociatedText:[B

    .line 144
    .line 145
    if-eqz v3, :cond_3

    .line 146
    .line 147
    array-length v5, v3

    .line 148
    invoke-interface {v0, v3, v4, v5}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 149
    .line 150
    .line 151
    :cond_3
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-lez v3, :cond_4

    .line 158
    .line 159
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 160
    .line 161
    invoke-virtual {v3}, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;->getBuffer()[B

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    invoke-interface {v0, v3, v4, p0}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 172
    .line 173
    .line 174
    :cond_4
    add-int/2addr v6, v2

    .line 175
    rem-int/2addr v6, v1

    .line 176
    if-eqz v6, :cond_5

    .line 177
    .line 178
    :goto_2
    if-eq v6, v1, :cond_5

    .line 179
    .line 180
    invoke-interface {v0, v4}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 181
    .line 182
    .line 183
    add-int/lit8 v6, v6, 0x1

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_5
    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 187
    .line 188
    .line 189
    invoke-interface {v0, p4, v4}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    return p0
.end method

.method private getAssociatedTextLength()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->initialAssociatedText:[B

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    array-length p0, p0

    .line 14
    :goto_0
    add-int/2addr v0, p0

    .line 15
    return v0
.end method

.method private hasAssociatedText()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->getAssociatedTextLength()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;->getBuffer()[B

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    const/4 v3, 0x0

    .line 14
    move-object v1, p0

    .line 15
    move-object v5, p1

    .line 16
    move v6, p2

    .line 17
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->processPacket([BII[BI)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-virtual {v1}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->reset()V

    .line 22
    .line 23
    .line 24
    return p0
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
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 7
    .line 8
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "/CCM"

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

.method public getMac()[B
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public getOutputSize(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/2addr p1, v0

    .line 8
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->forEncryption:Z

    .line 9
    .line 10
    iget p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    add-int/2addr p1, p0

    .line 15
    return p1

    .line 16
    :cond_0
    if-ge p1, p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    sub-int/2addr p1, p0

    .line 21
    return p1
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUpdateOutputSize(I)I
    .locals 0

    const/4 p0, 0x0

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
    iput-boolean p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    instance-of p1, p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->nonce:[B

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getAssociatedText()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->initialAssociatedText:[B

    .line 20
    .line 21
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    div-int/lit8 p1, p1, 0x8

    .line 26
    .line 27
    iput p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 28
    .line 29
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 39
    .line 40
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->nonce:[B

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->initialAssociatedText:[B

    .line 48
    .line 49
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 50
    .line 51
    array-length p1, p1

    .line 52
    div-int/lit8 p1, p1, 0x2

    .line 53
    .line 54
    iput p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 55
    .line 56
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :goto_0
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->keyParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->nonce:[B

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    array-length p2, p1

    .line 69
    const/4 v0, 0x7

    .line 70
    if-lt p2, v0, :cond_2

    .line 71
    .line 72
    array-length p1, p1

    .line 73
    const/16 p2, 0xd

    .line 74
    .line 75
    if-gt p1, p2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->reset()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    const-string p0, "nonce must have length from 7 to 13 octets"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string p1, "invalid parameters passed to CCM: "

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public processAADByte(B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public processAADBytes([BII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public processByte(B[BI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public processBytes([BII[BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    array-length p4, p1

    .line 2
    add-int p5, p2, p3

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-lt p4, p5, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 10
    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const-string p0, "Input buffer too short"

    .line 14
    .line 15
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return v0
.end method

.method public processPacket([BII[BI)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;,
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->keyParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->nonce:[B

    .line 7
    .line 8
    array-length v2, v0

    .line 9
    rsub-int/lit8 v3, v2, 0xf

    .line 10
    .line 11
    const/4 v4, 0x4

    .line 12
    const/4 v5, 0x1

    .line 13
    if-ge v3, v4, :cond_1

    .line 14
    .line 15
    mul-int/lit8 v3, v3, 0x8

    .line 16
    .line 17
    shl-int v3, v5, v3

    .line 18
    .line 19
    if-ge p3, v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "CCM packet too large for choice of q."

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    :goto_0
    iget v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 29
    .line 30
    new-array v3, v3, [B

    .line 31
    .line 32
    rsub-int/lit8 v2, v2, 0xe

    .line 33
    .line 34
    and-int/lit8 v2, v2, 0x7

    .line 35
    .line 36
    int-to-byte v2, v2

    .line 37
    aput-byte v2, v3, v1

    .line 38
    .line 39
    array-length v2, v0

    .line 40
    invoke-static {v0, v1, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Lorg/spongycastle/crypto/modes/SICBlockCipher;

    .line 44
    .line 45
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 46
    .line 47
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/modes/SICBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 48
    .line 49
    .line 50
    iget-boolean v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->forEncryption:Z

    .line 51
    .line 52
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 53
    .line 54
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->keyParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 55
    .line 56
    invoke-direct {v4, v5, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v0, v2, v4}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 60
    .line 61
    .line 62
    iget-boolean v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->forEncryption:Z

    .line 63
    .line 64
    iget v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 65
    .line 66
    const-string v4, "Output buffer too short."

    .line 67
    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    add-int/2addr v3, p3

    .line 71
    array-length v2, p4

    .line 72
    add-int v5, v3, p5

    .line 73
    .line 74
    if-lt v2, v5, :cond_3

    .line 75
    .line 76
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 77
    .line 78
    invoke-direct {p0, p1, p2, p3, v2}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->calculateMac([BII[B)I

    .line 79
    .line 80
    .line 81
    iget v2, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 82
    .line 83
    new-array v2, v2, [B

    .line 84
    .line 85
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 86
    .line 87
    invoke-interface {v0, v4, v1, v2, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 88
    .line 89
    .line 90
    move v4, p2

    .line 91
    move v5, p5

    .line 92
    :goto_1
    add-int v6, p2, p3

    .line 93
    .line 94
    iget v7, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 95
    .line 96
    sub-int v8, v6, v7

    .line 97
    .line 98
    if-ge v4, v8, :cond_2

    .line 99
    .line 100
    invoke-interface {v0, p1, v4, p4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 101
    .line 102
    .line 103
    iget v6, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 104
    .line 105
    add-int/2addr v5, v6

    .line 106
    add-int/2addr v4, v6

    .line 107
    goto :goto_1

    .line 108
    :cond_2
    new-array p2, v7, [B

    .line 109
    .line 110
    sub-int/2addr v6, v4

    .line 111
    invoke-static {p1, v4, p2, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v0, p2, v1, p2, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 115
    .line 116
    .line 117
    invoke-static {p2, v1, p4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 118
    .line 119
    .line 120
    add-int/2addr p5, p3

    .line 121
    iget p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 122
    .line 123
    invoke-static {v2, v1, p4, p5, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 124
    .line 125
    .line 126
    return v3

    .line 127
    :cond_3
    invoke-static {v4}, Ll/g;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return v1

    .line 131
    :cond_4
    if-lt p3, v3, :cond_9

    .line 132
    .line 133
    sub-int/2addr p3, v3

    .line 134
    array-length v2, p4

    .line 135
    add-int v5, p3, p5

    .line 136
    .line 137
    if-lt v2, v5, :cond_8

    .line 138
    .line 139
    add-int v2, p2, p3

    .line 140
    .line 141
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 142
    .line 143
    invoke-static {p1, v2, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    .line 145
    .line 146
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 147
    .line 148
    invoke-interface {v0, v3, v1, v3, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 149
    .line 150
    .line 151
    iget v3, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    .line 152
    .line 153
    :goto_2
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 154
    .line 155
    array-length v5, v4

    .line 156
    if-eq v3, v5, :cond_5

    .line 157
    .line 158
    aput-byte v1, v4, v3

    .line 159
    .line 160
    add-int/lit8 v3, v3, 0x1

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_5
    move v3, p2

    .line 164
    move v4, p5

    .line 165
    :goto_3
    iget v5, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 166
    .line 167
    sub-int v6, v2, v5

    .line 168
    .line 169
    if-ge v3, v6, :cond_6

    .line 170
    .line 171
    invoke-interface {v0, p1, v3, p4, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 172
    .line 173
    .line 174
    iget v5, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 175
    .line 176
    add-int/2addr v4, v5

    .line 177
    add-int/2addr v3, v5

    .line 178
    goto :goto_3

    .line 179
    :cond_6
    new-array v2, v5, [B

    .line 180
    .line 181
    sub-int p2, v3, p2

    .line 182
    .line 183
    sub-int p2, p3, p2

    .line 184
    .line 185
    invoke-static {p1, v3, v2, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    .line 187
    .line 188
    invoke-interface {v0, v2, v1, v2, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 189
    .line 190
    .line 191
    invoke-static {v2, v1, p4, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 192
    .line 193
    .line 194
    iget p1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->blockSize:I

    .line 195
    .line 196
    new-array p1, p1, [B

    .line 197
    .line 198
    invoke-direct {p0, p4, p5, p3, p1}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->calculateMac([BII[B)I

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macBlock:[B

    .line 202
    .line 203
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    if-eqz p0, :cond_7

    .line 208
    .line 209
    return p3

    .line 210
    :cond_7
    const-string p0, "mac check in CCM failed"

    .line 211
    .line 212
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return v1

    .line 216
    :cond_8
    invoke-static {v4}, Ll/g;->a(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    return v1

    .line 220
    :cond_9
    const-string p0, "data too short"

    .line 221
    .line 222
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    return v1

    .line 226
    :cond_a
    const-string p0, "CCM cipher unitialized."

    .line 227
    .line 228
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    return v1
.end method

.method public processPacket([BII)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 232
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->forEncryption:Z

    .line 233
    iget v1, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->macSize:I

    if-eqz v0, :cond_0

    add-int/2addr v1, p3

    .line 234
    new-array v0, v1, [B

    :goto_0
    move-object v5, v0

    goto :goto_1

    :cond_0
    if-lt p3, v1, :cond_1

    sub-int v0, p3, v1

    .line 235
    new-array v0, v0, [B

    goto :goto_0

    :goto_1
    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    .line 236
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->processPacket([BII[BI)I

    return-object v5

    .line 237
    :cond_1
    const-string p0, "data too short"

    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->associatedText:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;->data:Lorg/spongycastle/crypto/modes/CCMBlockCipher$ExposedByteArrayOutputStream;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
