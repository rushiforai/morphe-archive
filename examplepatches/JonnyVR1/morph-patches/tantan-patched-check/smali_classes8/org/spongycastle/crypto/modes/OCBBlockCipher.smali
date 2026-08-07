.class public Lorg/spongycastle/crypto/modes/OCBBlockCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private Checksum:[B

.field private KtopInput:[B

.field private L:Ljava/util/Vector;

.field private L_Asterisk:[B

.field private L_Dollar:[B

.field private OffsetHASH:[B

.field private OffsetMAIN:[B

.field private OffsetMAIN_0:[B

.field private Stretch:[B

.field private Sum:[B

.field private forEncryption:Z

.field private hashBlock:[B

.field private hashBlockCount:J

.field private hashBlockPos:I

.field private hashCipher:Lorg/spongycastle/crypto/BlockCipher;

.field private initialAssociatedText:[B

.field private macBlock:[B

.field private macSize:I

.field private mainBlock:[B

.field private mainBlockCount:J

.field private mainBlockPos:I

.field private mainCipher:Lorg/spongycastle/crypto/BlockCipher;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 6
    .line 7
    const/16 v1, 0x18

    .line 8
    .line 9
    new-array v1, v1, [B

    .line 10
    .line 11
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    new-array v2, v1, [B

    .line 16
    .line 17
    iput-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 18
    .line 19
    new-array v2, v1, [B

    .line 20
    .line 21
    iput-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 22
    .line 23
    if-eqz p1, :cond_4

    .line 24
    .line 25
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ne v2, v1, :cond_3

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-ne v2, v1, :cond_1

    .line 38
    .line 39
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 54
    .line 55
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    const-string p0, "\'hashCipher\' and \'mainCipher\' must be the same algorithm"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :cond_1
    const-string p0, "\'mainCipher\' must have a block size of 16"

    .line 65
    .line 66
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw v0

    .line 70
    :cond_2
    const-string p0, "\'mainCipher\' cannot be null"

    .line 71
    .line 72
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw v0

    .line 76
    :cond_3
    const-string p0, "\'hashCipher\' must have a block size of 16"

    .line 77
    .line 78
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw v0

    .line 82
    :cond_4
    const-string p0, "\'hashCipher\' cannot be null"

    .line 83
    .line 84
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw v0
.end method

.method public static OCB_double([B)[B
    .locals 4

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->shiftLeft([B[B)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v1, 0xf

    .line 10
    .line 11
    aget-byte v2, v0, v1

    .line 12
    .line 13
    rsub-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    shl-int/lit8 p0, p0, 0x3

    .line 16
    .line 17
    const/16 v3, 0x87

    .line 18
    .line 19
    ushr-int p0, v3, p0

    .line 20
    .line 21
    xor-int/2addr p0, v2

    .line 22
    int-to-byte p0, p0

    .line 23
    aput-byte p0, v0, v1

    .line 24
    .line 25
    return-object v0
.end method

.method public static OCB_extend([BI)V
    .locals 1

    .line 1
    const/16 v0, -0x80

    .line 2
    .line 3
    aput-byte v0, p0, p1

    .line 4
    .line 5
    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    aput-byte v0, p0, p1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public static OCB_ntz(J)I
    .locals 5

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/16 p0, 0x40

    return p0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-wide/16 v3, 0x1

    and-long/2addr v3, p0

    cmp-long v3, v3, v0

    if-nez v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    const/4 v3, 0x1

    ushr-long/2addr p0, v3

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static shiftLeft([B[B)I
    .locals 4

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    aget-byte v2, p0, v0

    .line 9
    .line 10
    and-int/lit16 v2, v2, 0xff

    .line 11
    .line 12
    shl-int/lit8 v3, v2, 0x1

    .line 13
    .line 14
    or-int/2addr v1, v3

    .line 15
    int-to-byte v1, v1

    .line 16
    aput-byte v1, p1, v0

    .line 17
    .line 18
    ushr-int/lit8 v1, v2, 0x7

    .line 19
    .line 20
    and-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v1
.end method

.method public static xor([B[B)V
    .locals 3

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    :goto_0
    if-ltz v0, :cond_0

    .line 4
    .line 5
    aget-byte v1, p0, v0

    .line 6
    .line 7
    aget-byte v2, p1, v0

    .line 8
    .line 9
    xor-int/2addr v1, v2

    .line 10
    int-to-byte v1, v1

    .line 11
    aput-byte v1, p0, v0

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public clear([B)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {p1, p0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public doFinal([BI)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 7
    .line 8
    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 9
    .line 10
    if-lt v0, v2, :cond_0

    .line 11
    .line 12
    sub-int/2addr v0, v2

    .line 13
    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 14
    .line 15
    new-array v3, v2, [B

    .line 16
    .line 17
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 18
    .line 19
    invoke-static {v4, v0, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "data too short"

    .line 24
    .line 25
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    const/4 v3, 0x0

    .line 30
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 31
    .line 32
    if-lez v0, :cond_2

    .line 33
    .line 34
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 35
    .line 36
    invoke-static {v2, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->updateHASH([B)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 45
    .line 46
    const-string v2, "Output buffer too short"

    .line 47
    .line 48
    if-lez v0, :cond_5

    .line 49
    .line 50
    iget-boolean v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 51
    .line 52
    if-eqz v4, :cond_3

    .line 53
    .line 54
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 55
    .line 56
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 60
    .line 61
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 62
    .line 63
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 67
    .line 68
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    .line 69
    .line 70
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 71
    .line 72
    .line 73
    const/16 v0, 0x10

    .line 74
    .line 75
    new-array v0, v0, [B

    .line 76
    .line 77
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 78
    .line 79
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 80
    .line 81
    invoke-interface {v4, v5, v1, v0, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 85
    .line 86
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 87
    .line 88
    .line 89
    array-length v0, p1

    .line 90
    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 91
    .line 92
    add-int v5, p2, v4

    .line 93
    .line 94
    if-lt v0, v5, :cond_4

    .line 95
    .line 96
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 97
    .line 98
    invoke-static {v0, v1, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    .line 100
    .line 101
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 102
    .line 103
    if-nez v0, :cond_5

    .line 104
    .line 105
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 106
    .line 107
    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 108
    .line 109
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 113
    .line 114
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 115
    .line 116
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    invoke-static {v2}, Ll/g;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return v1

    .line 124
    :cond_5
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 125
    .line 126
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 127
    .line 128
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 132
    .line 133
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    .line 134
    .line 135
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 139
    .line 140
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 141
    .line 142
    invoke-interface {v0, v4, v1, v4, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 146
    .line 147
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    .line 148
    .line 149
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 150
    .line 151
    .line 152
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 153
    .line 154
    new-array v4, v0, [B

    .line 155
    .line 156
    iput-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 157
    .line 158
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 159
    .line 160
    invoke-static {v5, v1, v4, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    .line 162
    .line 163
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 164
    .line 165
    iget-boolean v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 166
    .line 167
    if-eqz v4, :cond_7

    .line 168
    .line 169
    array-length v3, p1

    .line 170
    add-int/2addr p2, v0

    .line 171
    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 172
    .line 173
    add-int v5, p2, v4

    .line 174
    .line 175
    if-lt v3, v5, :cond_6

    .line 176
    .line 177
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 178
    .line 179
    invoke-static {v2, v1, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    .line 181
    .line 182
    iget p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 183
    .line 184
    add-int/2addr v0, p1

    .line 185
    goto :goto_2

    .line 186
    :cond_6
    invoke-static {v2}, Ll/g;->a(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return v1

    .line 190
    :cond_7
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 191
    .line 192
    invoke-static {p1, v3}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_8

    .line 197
    .line 198
    :goto_2
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->reset(Z)V

    .line 199
    .line 200
    .line 201
    return v0

    .line 202
    :cond_8
    const-string p0, "mac check in OCB failed"

    .line 203
    .line 204
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    return v1
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
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

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
    const-string p0, "/OCB"

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

.method public getLSub(I)[B
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    .line 8
    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [B

    .line 16
    .line 17
    invoke-static {v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v1, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, [B

    .line 30
    .line 31
    return-object p0
.end method

.method public getMac()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOutputSize(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 2
    .line 3
    add-int/2addr p1, v0

    .line 4
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 5
    .line 6
    iget p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    add-int/2addr p1, p0

    .line 11
    return p1

    .line 12
    :cond_0
    if-ge p1, p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    sub-int/2addr p1, p0

    .line 17
    return p1
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUpdateOutputSize(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 2
    .line 3
    add-int/2addr p1, v0

    .line 4
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 9
    .line 10
    if-ge p1, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    sub-int/2addr p1, p0

    .line 15
    :cond_1
    rem-int/lit8 p0, p1, 0x10

    .line 16
    .line 17
    sub-int/2addr p1, p0

    .line 18
    return p1
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 7
    .line 8
    instance-of v2, p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 9
    .line 10
    const/16 v3, 0x10

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    check-cast p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 15
    .line 16
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getAssociatedText()[B

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iput-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 25
    .line 26
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    const/16 v5, 0x40

    .line 31
    .line 32
    if-lt v4, v5, :cond_0

    .line 33
    .line 34
    const/16 v5, 0x80

    .line 35
    .line 36
    if-gt v4, v5, :cond_0

    .line 37
    .line 38
    rem-int/lit8 v5, v4, 0x8

    .line 39
    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    div-int/lit8 v4, v4, 0x8

    .line 43
    .line 44
    iput v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 45
    .line 46
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/AEADParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-string p0, "Invalid value for MAC size: "

    .line 52
    .line 53
    invoke-static {p0, v4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    instance-of v2, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 58
    .line 59
    if-eqz v2, :cond_a

    .line 60
    .line 61
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 62
    .line 63
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 68
    .line 69
    iput v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 70
    .line 71
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 76
    .line 77
    :goto_0
    new-array v4, v3, [B

    .line 78
    .line 79
    iput-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    move v4, v3

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 86
    .line 87
    add-int/2addr v4, v3

    .line 88
    :goto_1
    new-array v4, v4, [B

    .line 89
    .line 90
    iput-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    if-nez v2, :cond_3

    .line 94
    .line 95
    new-array v2, v4, [B

    .line 96
    .line 97
    :cond_3
    array-length v5, v2

    .line 98
    const/16 v6, 0xf

    .line 99
    .line 100
    if-gt v5, v6, :cond_9

    .line 101
    .line 102
    const/4 v5, 0x1

    .line 103
    if-eqz p2, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 106
    .line 107
    invoke-interface {v0, v5, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 111
    .line 112
    invoke-interface {v0, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 113
    .line 114
    .line 115
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    if-ne v0, p1, :cond_8

    .line 119
    .line 120
    :goto_2
    new-array p1, v3, [B

    .line 121
    .line 122
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    .line 123
    .line 124
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 125
    .line 126
    invoke-interface {p2, p1, v4, p1, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    .line 130
    .line 131
    invoke-static {p1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    .line 136
    .line 137
    new-instance p1, Ljava/util/Vector;

    .line 138
    .line 139
    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    .line 143
    .line 144
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    .line 145
    .line 146
    invoke-static {p2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p1, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processNonce([B)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    rem-int/lit8 p2, p1, 0x8

    .line 158
    .line 159
    div-int/lit8 p1, p1, 0x8

    .line 160
    .line 161
    if-nez p2, :cond_5

    .line 162
    .line 163
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 164
    .line 165
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 166
    .line 167
    invoke-static {p2, p1, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_5
    move v0, v4

    .line 172
    :goto_3
    if-ge v0, v3, :cond_6

    .line 173
    .line 174
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 175
    .line 176
    aget-byte v2, v1, p1

    .line 177
    .line 178
    and-int/lit16 v2, v2, 0xff

    .line 179
    .line 180
    add-int/2addr p1, v5

    .line 181
    aget-byte v1, v1, p1

    .line 182
    .line 183
    and-int/lit16 v1, v1, 0xff

    .line 184
    .line 185
    iget-object v6, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 186
    .line 187
    shl-int/2addr v2, p2

    .line 188
    rsub-int/lit8 v7, p2, 0x8

    .line 189
    .line 190
    ushr-int/2addr v1, v7

    .line 191
    or-int/2addr v1, v2

    .line 192
    int-to-byte v1, v1

    .line 193
    aput-byte v1, v6, v0

    .line 194
    .line 195
    add-int/lit8 v0, v0, 0x1

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_6
    :goto_4
    iput v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 199
    .line 200
    iput v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 201
    .line 202
    const-wide/16 p1, 0x0

    .line 203
    .line 204
    iput-wide p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 205
    .line 206
    iput-wide p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 207
    .line 208
    new-array p1, v3, [B

    .line 209
    .line 210
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    .line 211
    .line 212
    new-array p1, v3, [B

    .line 213
    .line 214
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    .line 215
    .line 216
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 217
    .line 218
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 219
    .line 220
    invoke-static {p1, v4, p2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 221
    .line 222
    .line 223
    new-array p1, v3, [B

    .line 224
    .line 225
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 226
    .line 227
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 228
    .line 229
    if-eqz p1, :cond_7

    .line 230
    .line 231
    array-length p2, p1

    .line 232
    invoke-virtual {p0, p1, v4, p2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processAADBytes([BII)V

    .line 233
    .line 234
    .line 235
    :cond_7
    return-void

    .line 236
    :cond_8
    const-string p0, "cannot change encrypting state without providing key."

    .line 237
    .line 238
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_9
    const-string p0, "IV must be no more than 15 bytes"

    .line 243
    .line 244
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_a
    const-string p0, "invalid parameters passed to OCB"

    .line 249
    .line 250
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    return-void
.end method

.method public processAADByte(B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 4
    .line 5
    aput-byte p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 10
    .line 11
    array-length p1, v0

    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processHashBlock()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public processAADBytes([BII)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p3, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 5
    .line 6
    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 7
    .line 8
    add-int v3, p2, v0

    .line 9
    .line 10
    aget-byte v3, p1, v3

    .line 11
    .line 12
    aput-byte v3, v1, v2

    .line 13
    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    iput v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 17
    .line 18
    array-length v1, v1

    .line 19
    if-ne v2, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processHashBlock()V

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method public processByte(B[BI)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 4
    .line 5
    aput-byte p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 10
    .line 11
    array-length p1, v0

    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processMainBlock([BI)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x10

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public processBytes([BII[BI)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    add-int v1, p2, p3

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-lt v0, v1, :cond_2

    .line 6
    .line 7
    move v0, v2

    .line 8
    :goto_0
    if-ge v2, p3, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 11
    .line 12
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 13
    .line 14
    add-int v4, p2, v2

    .line 15
    .line 16
    aget-byte v4, p1, v4

    .line 17
    .line 18
    aput-byte v4, v1, v3

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    iput v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 23
    .line 24
    array-length v1, v1

    .line 25
    if-ne v3, v1, :cond_0

    .line 26
    .line 27
    add-int v1, p5, v0

    .line 28
    .line 29
    invoke-virtual {p0, p4, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processMainBlock([BI)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x10

    .line 33
    .line 34
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return v0

    .line 38
    :cond_2
    const-string p0, "Input buffer too short"

    .line 39
    .line 40
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v2
.end method

.method public processHashBlock()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 7
    .line 8
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_ntz(J)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->getLSub(I)[B

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->updateHASH([B)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 21
    .line 22
    return-void
.end method

.method public processMainBlock([BI)V
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    add-int/lit8 v1, p2, 0x10

    .line 3
    .line 4
    if-lt v0, v1, :cond_2

    .line 5
    .line 6
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 12
    .line 13
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 14
    .line 15
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 16
    .line 17
    .line 18
    iput v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 21
    .line 22
    iget-wide v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 23
    .line 24
    const-wide/16 v4, 0x1

    .line 25
    .line 26
    add-long/2addr v2, v4

    .line 27
    iput-wide v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 28
    .line 29
    invoke-static {v2, v3}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_ntz(J)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->getLSub(I)[B

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 41
    .line 42
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 43
    .line 44
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 48
    .line 49
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 50
    .line 51
    invoke-interface {v0, v2, v1, v2, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 55
    .line 56
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 57
    .line 58
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 62
    .line 63
    const/16 v2, 0x10

    .line 64
    .line 65
    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 66
    .line 67
    .line 68
    iget-boolean p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 73
    .line 74
    iget-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 75
    .line 76
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 80
    .line 81
    iget p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 82
    .line 83
    invoke-static {p1, v2, p1, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    iget p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 87
    .line 88
    iput p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 89
    .line 90
    :cond_1
    return-void

    .line 91
    :cond_2
    const-string p0, "Output buffer too short"

    .line 92
    .line 93
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public processNonce([B)I
    .locals 6

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    array-length v2, p1

    .line 6
    rsub-int/lit8 v2, v2, 0x10

    .line 7
    .line 8
    array-length v3, p1

    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-static {p1, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 11
    .line 12
    .line 13
    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 14
    .line 15
    shl-int/lit8 v2, v2, 0x4

    .line 16
    .line 17
    int-to-byte v2, v2

    .line 18
    aput-byte v2, v1, v4

    .line 19
    .line 20
    array-length p1, p1

    .line 21
    const/16 v2, 0xf

    .line 22
    .line 23
    rsub-int/lit8 p1, p1, 0xf

    .line 24
    .line 25
    aget-byte v3, v1, p1

    .line 26
    .line 27
    or-int/lit8 v3, v3, 0x1

    .line 28
    .line 29
    int-to-byte v3, v3

    .line 30
    aput-byte v3, v1, p1

    .line 31
    .line 32
    aget-byte p1, v1, v2

    .line 33
    .line 34
    and-int/lit8 v3, p1, 0x3f

    .line 35
    .line 36
    and-int/lit16 p1, p1, 0xc0

    .line 37
    .line 38
    int-to-byte p1, p1

    .line 39
    aput-byte p1, v1, v2

    .line 40
    .line 41
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-static {v1, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    :cond_0
    new-array p1, v0, [B

    .line 52
    .line 53
    iput-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 54
    .line 55
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 56
    .line 57
    invoke-interface {v2, v1, v4, p1, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 61
    .line 62
    invoke-static {p1, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    :goto_0
    const/16 v0, 0x8

    .line 66
    .line 67
    if-ge v4, v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 70
    .line 71
    add-int/lit8 v1, v4, 0x10

    .line 72
    .line 73
    aget-byte v2, p1, v4

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x1

    .line 76
    .line 77
    aget-byte v5, p1, v4

    .line 78
    .line 79
    xor-int/2addr v2, v5

    .line 80
    int-to-byte v2, v2

    .line 81
    aput-byte v2, v0, v1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return v3
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x1

    .line 70
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->reset(Z)V

    return-void
.end method

.method public reset(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 7
    .line 8
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 23
    .line 24
    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 29
    .line 30
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 31
    .line 32
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 43
    .line 44
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 45
    .line 46
    const/16 v3, 0x10

    .line 47
    .line 48
    invoke-static {v1, v0, v2, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 54
    .line 55
    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 60
    .line 61
    :cond_0
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 62
    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    array-length v1, p1

    .line 66
    invoke-virtual {p0, p1, v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processAADBytes([BII)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public updateHASH([B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    .line 2
    .line 3
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    .line 9
    .line 10
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 14
    .line 15
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p1, v0, v1, v0, v1}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    .line 22
    .line 23
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 24
    .line 25
    invoke-static {p1, p0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
