.class public Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# instance fields
.field private FR:[B

.field private FRE:[B

.field private IV:[B

.field private blockSize:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private count:I

.field private forEncryption:Z


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 11
    .line 12
    new-array v0, p1, [B

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->IV:[B

    .line 15
    .line 16
    new-array v0, p1, [B

    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 19
    .line 20
    new-array p1, p1, [B

    .line 21
    .line 22
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 23
    .line 24
    return-void
.end method

.method private decryptBlock([BI[BI)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 2
    .line 3
    add-int v1, p2, v0

    .line 4
    .line 5
    array-length v2, p1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-gt v1, v2, :cond_6

    .line 8
    .line 9
    add-int v1, p4, v0

    .line 10
    .line 11
    array-length v2, p3

    .line 12
    if-gt v1, v2, :cond_5

    .line 13
    .line 14
    iget v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    const/4 v4, 0x1

    .line 18
    if-le v1, v0, :cond_0

    .line 19
    .line 20
    aget-byte v1, p1, p2

    .line 21
    .line 22
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 23
    .line 24
    add-int/lit8 v6, v0, -0x2

    .line 25
    .line 26
    aput-byte v1, v5, v6

    .line 27
    .line 28
    sub-int/2addr v0, v2

    .line 29
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    aput-byte v0, p3, p4

    .line 34
    .line 35
    add-int/lit8 v0, p2, 0x1

    .line 36
    .line 37
    aget-byte v0, p1, v0

    .line 38
    .line 39
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 40
    .line 41
    iget v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 42
    .line 43
    add-int/lit8 v6, v5, -0x1

    .line 44
    .line 45
    aput-byte v0, v1, v6

    .line 46
    .line 47
    add-int/lit8 v1, p4, 0x1

    .line 48
    .line 49
    sub-int/2addr v5, v4

    .line 50
    invoke-direct {p0, v0, v5}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    aput-byte v0, p3, v1

    .line 55
    .line 56
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 57
    .line 58
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 59
    .line 60
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 61
    .line 62
    invoke-interface {v0, v1, v3, v4, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 63
    .line 64
    .line 65
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 66
    .line 67
    if-ge v2, v0, :cond_4

    .line 68
    .line 69
    add-int v0, p2, v2

    .line 70
    .line 71
    aget-byte v0, p1, v0

    .line 72
    .line 73
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 74
    .line 75
    add-int/lit8 v3, v2, -0x2

    .line 76
    .line 77
    aput-byte v0, v1, v3

    .line 78
    .line 79
    add-int v1, p4, v2

    .line 80
    .line 81
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    aput-byte v0, p3, v1

    .line 86
    .line 87
    add-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    if-nez v1, :cond_2

    .line 91
    .line 92
    iget-object p4, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 93
    .line 94
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 95
    .line 96
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 97
    .line 98
    invoke-interface {p4, v0, v3, v1, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 99
    .line 100
    .line 101
    :goto_1
    iget p4, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 102
    .line 103
    if-ge v3, p4, :cond_1

    .line 104
    .line 105
    iget-object p4, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 106
    .line 107
    add-int v0, p2, v3

    .line 108
    .line 109
    aget-byte v1, p1, v0

    .line 110
    .line 111
    aput-byte v1, p4, v3

    .line 112
    .line 113
    aget-byte p4, p1, v0

    .line 114
    .line 115
    invoke-direct {p0, p4, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 116
    .line 117
    .line 118
    move-result p4

    .line 119
    aput-byte p4, p3, v3

    .line 120
    .line 121
    add-int/lit8 v3, v3, 0x1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    iget p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 125
    .line 126
    add-int/2addr p1, p4

    .line 127
    iput p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_2
    if-ne v1, v0, :cond_4

    .line 131
    .line 132
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 133
    .line 134
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 135
    .line 136
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 137
    .line 138
    invoke-interface {v0, v1, v3, v5, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 139
    .line 140
    .line 141
    aget-byte v0, p1, p2

    .line 142
    .line 143
    add-int/lit8 v1, p2, 0x1

    .line 144
    .line 145
    aget-byte v1, p1, v1

    .line 146
    .line 147
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    aput-byte v5, p3, p4

    .line 152
    .line 153
    add-int/lit8 v5, p4, 0x1

    .line 154
    .line 155
    invoke-direct {p0, v1, v4}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    aput-byte v6, p3, v5

    .line 160
    .line 161
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 162
    .line 163
    iget v6, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 164
    .line 165
    sub-int/2addr v6, v2

    .line 166
    invoke-static {v5, v2, v5, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    .line 168
    .line 169
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 170
    .line 171
    iget v6, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 172
    .line 173
    add-int/lit8 v7, v6, -0x2

    .line 174
    .line 175
    aput-byte v0, v5, v7

    .line 176
    .line 177
    sub-int/2addr v6, v4

    .line 178
    aput-byte v1, v5, v6

    .line 179
    .line 180
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 181
    .line 182
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 183
    .line 184
    invoke-interface {v0, v5, v3, v1, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 185
    .line 186
    .line 187
    :goto_2
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 188
    .line 189
    if-ge v2, v0, :cond_3

    .line 190
    .line 191
    add-int v0, p2, v2

    .line 192
    .line 193
    aget-byte v0, p1, v0

    .line 194
    .line 195
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 196
    .line 197
    add-int/lit8 v3, v2, -0x2

    .line 198
    .line 199
    aput-byte v0, v1, v3

    .line 200
    .line 201
    add-int v1, p4, v2

    .line 202
    .line 203
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    aput-byte v0, p3, v1

    .line 208
    .line 209
    add-int/lit8 v2, v2, 0x1

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_3
    iget p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 213
    .line 214
    add-int/2addr p1, v0

    .line 215
    iput p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 216
    .line 217
    :cond_4
    :goto_3
    iget p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 218
    .line 219
    return p0

    .line 220
    :cond_5
    const-string p0, "output buffer too short"

    .line 221
    .line 222
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    return v3

    .line 226
    :cond_6
    const-string p0, "input buffer too short"

    .line 227
    .line 228
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    return v3
.end method

.method private encryptBlock([BI[BI)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 2
    .line 3
    add-int v1, p2, v0

    .line 4
    .line 5
    array-length v2, p1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-gt v1, v2, :cond_6

    .line 8
    .line 9
    add-int v1, p4, v0

    .line 10
    .line 11
    array-length v2, p3

    .line 12
    if-gt v1, v2, :cond_5

    .line 13
    .line 14
    iget v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v4, 0x2

    .line 18
    if-le v1, v0, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 21
    .line 22
    add-int/lit8 v5, v0, -0x2

    .line 23
    .line 24
    aget-byte v6, p1, p2

    .line 25
    .line 26
    sub-int/2addr v0, v4

    .line 27
    invoke-direct {p0, v6, v0}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    aput-byte v0, p3, p4

    .line 32
    .line 33
    aput-byte v0, v1, v5

    .line 34
    .line 35
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 36
    .line 37
    iget v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 38
    .line 39
    add-int/lit8 v5, v1, -0x1

    .line 40
    .line 41
    add-int/lit8 v6, p4, 0x1

    .line 42
    .line 43
    add-int/lit8 v7, p2, 0x1

    .line 44
    .line 45
    aget-byte v7, p1, v7

    .line 46
    .line 47
    sub-int/2addr v1, v2

    .line 48
    invoke-direct {p0, v7, v1}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    aput-byte v1, p3, v6

    .line 53
    .line 54
    aput-byte v1, v0, v5

    .line 55
    .line 56
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 57
    .line 58
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 59
    .line 60
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 61
    .line 62
    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 63
    .line 64
    .line 65
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 66
    .line 67
    if-ge v4, v0, :cond_4

    .line 68
    .line 69
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 70
    .line 71
    add-int/lit8 v1, v4, -0x2

    .line 72
    .line 73
    add-int v2, p4, v4

    .line 74
    .line 75
    add-int v3, p2, v4

    .line 76
    .line 77
    aget-byte v3, p1, v3

    .line 78
    .line 79
    invoke-direct {p0, v3, v1}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    aput-byte v3, p3, v2

    .line 84
    .line 85
    aput-byte v3, v0, v1

    .line 86
    .line 87
    add-int/lit8 v4, v4, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    if-nez v1, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 93
    .line 94
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 95
    .line 96
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 97
    .line 98
    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 99
    .line 100
    .line 101
    :goto_1
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 102
    .line 103
    if-ge v3, v0, :cond_1

    .line 104
    .line 105
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 106
    .line 107
    add-int v1, p4, v3

    .line 108
    .line 109
    add-int v2, p2, v3

    .line 110
    .line 111
    aget-byte v2, p1, v2

    .line 112
    .line 113
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    aput-byte v2, p3, v1

    .line 118
    .line 119
    aput-byte v2, v0, v3

    .line 120
    .line 121
    add-int/lit8 v3, v3, 0x1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    iget p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 125
    .line 126
    add-int/2addr p1, v0

    .line 127
    iput p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_2
    if-ne v1, v0, :cond_4

    .line 131
    .line 132
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 133
    .line 134
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 135
    .line 136
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 137
    .line 138
    invoke-interface {v0, v1, v3, v5, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 139
    .line 140
    .line 141
    aget-byte v0, p1, p2

    .line 142
    .line 143
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    aput-byte v0, p3, p4

    .line 148
    .line 149
    add-int/lit8 v0, p4, 0x1

    .line 150
    .line 151
    add-int/lit8 v1, p2, 0x1

    .line 152
    .line 153
    aget-byte v1, p1, v1

    .line 154
    .line 155
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    aput-byte v1, p3, v0

    .line 160
    .line 161
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 162
    .line 163
    iget v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 164
    .line 165
    sub-int/2addr v1, v4

    .line 166
    invoke-static {v0, v4, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 170
    .line 171
    iget v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 172
    .line 173
    sub-int/2addr v1, v4

    .line 174
    invoke-static {p3, p4, v0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 178
    .line 179
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 180
    .line 181
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 182
    .line 183
    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 184
    .line 185
    .line 186
    :goto_2
    iget v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 187
    .line 188
    if-ge v4, v0, :cond_3

    .line 189
    .line 190
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 191
    .line 192
    add-int/lit8 v1, v4, -0x2

    .line 193
    .line 194
    add-int v2, p4, v4

    .line 195
    .line 196
    add-int v3, p2, v4

    .line 197
    .line 198
    aget-byte v3, p1, v3

    .line 199
    .line 200
    invoke-direct {p0, v3, v1}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptByte(BI)B

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    aput-byte v3, p3, v2

    .line 205
    .line 206
    aput-byte v3, v0, v1

    .line 207
    .line 208
    add-int/lit8 v4, v4, 0x1

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_3
    iget p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 212
    .line 213
    add-int/2addr p1, v0

    .line 214
    iput p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 215
    .line 216
    :cond_4
    :goto_3
    iget p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->blockSize:I

    .line 217
    .line 218
    return p0

    .line 219
    :cond_5
    const-string p0, "output buffer too short"

    .line 220
    .line 221
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    return v3

    .line 225
    :cond_6
    const-string p0, "input buffer too short"

    .line 226
    .line 227
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    return v3
.end method

.method private encryptByte(BI)B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FRE:[B

    .line 2
    .line 3
    aget-byte p0, p0, p2

    .line 4
    .line 5
    xor-int/2addr p0, p1

    .line 6
    int-to-byte p0, p0

    .line 7
    return p0
.end method


# virtual methods
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
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

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
    const-string p0, "/OpenPGPCFB"

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

.method public getBlockSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-interface {p0, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->forEncryption:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->encryptBlock([BI[BI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->decryptBlock([BI[BI)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->count:I

    .line 3
    .line 4
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->IV:[B

    .line 5
    .line 6
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->FR:[B

    .line 7
    .line 8
    array-length v3, v2

    .line 9
    invoke-static {v1, v0, v2, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 13
    .line 14
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
