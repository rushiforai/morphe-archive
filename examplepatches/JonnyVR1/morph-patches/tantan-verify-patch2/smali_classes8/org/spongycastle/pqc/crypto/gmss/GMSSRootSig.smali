.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private big8:J

.field private checksum:I

.field private counter:I

.field private gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

.field private hash:[B

.field private height:I

.field private ii:I

.field private k:I

.field private keysize:I

.field private mdsize:I

.field private messDigestOTS:Lorg/spongycastle/crypto/Digest;

.field private messagesize:I

.field private privateKeyOTS:[B

.field private r:I

.field private seed:[B

.field private sign:[B

.field private steps:I

.field private test:I

.field private test8:J

.field private w:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;II)V
    .locals 2

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 245
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 246
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    invoke-direct {v0, p1}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;-><init>(Lorg/spongycastle/crypto/Digest;)V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 247
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 248
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 249
    iput p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->height:I

    const/4 p3, 0x1

    shl-int v0, p3, p2

    sub-int/2addr v0, p3

    .line 250
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    shl-int/lit8 p1, p1, 0x3

    int-to-double v0, p1

    int-to-double p1, p2

    div-double/2addr v0, p1

    .line 251
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p1

    double-to-int p1, p1

    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;[[B[I)V
    .locals 12

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 5
    .line 6
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    aget v0, p3, p1

    .line 15
    .line 16
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    aget v1, p3, v0

    .line 20
    .line 21
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    aget v2, p3, v1

    .line 25
    .line 26
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    aget v3, p3, v2

    .line 30
    .line 31
    iput v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 32
    .line 33
    const/4 v3, 0x4

    .line 34
    aget v4, p3, v3

    .line 35
    .line 36
    iput v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->steps:I

    .line 37
    .line 38
    const/4 v4, 0x5

    .line 39
    aget v5, p3, v4

    .line 40
    .line 41
    iput v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 42
    .line 43
    const/4 v5, 0x6

    .line 44
    aget v6, p3, v5

    .line 45
    .line 46
    iput v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->height:I

    .line 47
    .line 48
    const/4 v6, 0x7

    .line 49
    aget v7, p3, v6

    .line 50
    .line 51
    iput v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 52
    .line 53
    const/16 v7, 0x8

    .line 54
    .line 55
    aget v8, p3, v7

    .line 56
    .line 57
    iput v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 58
    .line 59
    iget-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 60
    .line 61
    invoke-interface {v8}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    iput v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 66
    .line 67
    iget v9, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 68
    .line 69
    shl-int v10, v0, v9

    .line 70
    .line 71
    sub-int/2addr v10, v0

    .line 72
    iput v10, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 73
    .line 74
    shl-int/2addr v8, v2

    .line 75
    int-to-double v10, v8

    .line 76
    int-to-double v8, v9

    .line 77
    div-double/2addr v10, v8

    .line 78
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    .line 79
    .line 80
    .line 81
    move-result-wide v8

    .line 82
    double-to-int v8, v8

    .line 83
    iput v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 84
    .line 85
    aget-object v8, p2, p1

    .line 86
    .line 87
    iput-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 88
    .line 89
    aget-object v8, p2, v0

    .line 90
    .line 91
    iput-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 92
    .line 93
    aget-object v8, p2, v1

    .line 94
    .line 95
    iput-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 96
    .line 97
    aget-object v8, p2, v2

    .line 98
    .line 99
    iput-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 100
    .line 101
    aget-object p2, p2, v3

    .line 102
    .line 103
    aget-byte p1, p2, p1

    .line 104
    .line 105
    and-int/lit16 p1, p1, 0xff

    .line 106
    .line 107
    int-to-long v8, p1

    .line 108
    aget-byte p1, p2, v0

    .line 109
    .line 110
    and-int/lit16 p1, p1, 0xff

    .line 111
    .line 112
    int-to-long v10, p1

    .line 113
    shl-long/2addr v10, v7

    .line 114
    or-long/2addr v8, v10

    .line 115
    aget-byte p1, p2, v1

    .line 116
    .line 117
    and-int/lit16 p1, p1, 0xff

    .line 118
    .line 119
    int-to-long v0, p1

    .line 120
    const/16 p1, 0x10

    .line 121
    .line 122
    shl-long/2addr v0, p1

    .line 123
    or-long/2addr v0, v8

    .line 124
    aget-byte v2, p2, v2

    .line 125
    .line 126
    and-int/lit16 v2, v2, 0xff

    .line 127
    .line 128
    int-to-long v8, v2

    .line 129
    const/16 v2, 0x18

    .line 130
    .line 131
    shl-long/2addr v8, v2

    .line 132
    or-long/2addr v0, v8

    .line 133
    aget-byte v3, p2, v3

    .line 134
    .line 135
    and-int/lit16 v3, v3, 0xff

    .line 136
    .line 137
    int-to-long v8, v3

    .line 138
    const/16 v3, 0x20

    .line 139
    .line 140
    shl-long/2addr v8, v3

    .line 141
    or-long/2addr v0, v8

    .line 142
    aget-byte v4, p2, v4

    .line 143
    .line 144
    and-int/lit16 v4, v4, 0xff

    .line 145
    .line 146
    int-to-long v8, v4

    .line 147
    const/16 v4, 0x28

    .line 148
    .line 149
    shl-long/2addr v8, v4

    .line 150
    or-long/2addr v0, v8

    .line 151
    aget-byte v5, p2, v5

    .line 152
    .line 153
    and-int/lit16 v5, v5, 0xff

    .line 154
    .line 155
    int-to-long v8, v5

    .line 156
    const/16 v5, 0x30

    .line 157
    .line 158
    shl-long/2addr v8, v5

    .line 159
    or-long/2addr v0, v8

    .line 160
    aget-byte v6, p2, v6

    .line 161
    .line 162
    and-int/lit16 v6, v6, 0xff

    .line 163
    .line 164
    int-to-long v8, v6

    .line 165
    const/16 v6, 0x38

    .line 166
    .line 167
    shl-long/2addr v8, v6

    .line 168
    or-long/2addr v0, v8

    .line 169
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 170
    .line 171
    aget-byte v0, p2, v7

    .line 172
    .line 173
    and-int/lit16 v0, v0, 0xff

    .line 174
    .line 175
    int-to-long v0, v0

    .line 176
    const/16 v8, 0x9

    .line 177
    .line 178
    aget-byte v8, p2, v8

    .line 179
    .line 180
    and-int/lit16 v8, v8, 0xff

    .line 181
    .line 182
    int-to-long v8, v8

    .line 183
    shl-long v7, v8, v7

    .line 184
    .line 185
    or-long/2addr v0, v7

    .line 186
    const/16 v7, 0xa

    .line 187
    .line 188
    aget-byte v7, p2, v7

    .line 189
    .line 190
    and-int/lit16 v7, v7, 0xff

    .line 191
    .line 192
    int-to-long v7, v7

    .line 193
    shl-long/2addr v7, p1

    .line 194
    or-long/2addr v0, v7

    .line 195
    const/16 p1, 0xb

    .line 196
    .line 197
    aget-byte p1, p2, p1

    .line 198
    .line 199
    and-int/lit16 p1, p1, 0xff

    .line 200
    .line 201
    int-to-long v7, p1

    .line 202
    shl-long/2addr v7, v2

    .line 203
    or-long/2addr v0, v7

    .line 204
    const/16 p1, 0xc

    .line 205
    .line 206
    aget-byte p1, p2, p1

    .line 207
    .line 208
    and-int/lit16 p1, p1, 0xff

    .line 209
    .line 210
    int-to-long v7, p1

    .line 211
    shl-long v2, v7, v3

    .line 212
    .line 213
    or-long/2addr v0, v2

    .line 214
    const/16 p1, 0xd

    .line 215
    .line 216
    aget-byte p1, p2, p1

    .line 217
    .line 218
    and-int/lit16 p1, p1, 0xff

    .line 219
    .line 220
    int-to-long v2, p1

    .line 221
    shl-long/2addr v2, v4

    .line 222
    or-long/2addr v0, v2

    .line 223
    const/16 p1, 0xe

    .line 224
    .line 225
    aget-byte p1, p2, p1

    .line 226
    .line 227
    and-int/lit16 p1, p1, 0xff

    .line 228
    .line 229
    int-to-long v2, p1

    .line 230
    shl-long/2addr v2, v5

    .line 231
    or-long/2addr v0, v2

    .line 232
    const/16 p1, 0xf

    .line 233
    .line 234
    aget-byte p1, p2, p1

    .line 235
    .line 236
    and-int/lit16 p1, p1, 0xff

    .line 237
    .line 238
    int-to-long p1, p1

    .line 239
    shl-long/2addr p1, v6

    .line 240
    or-long/2addr p1, v0

    .line 241
    iput-wide p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 242
    .line 243
    return-void
.end method

.method private oneStep()V
    .locals 12

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    rem-int v2, v1, v0

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_3

    .line 9
    .line 10
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 15
    .line 16
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 23
    .line 24
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 25
    .line 26
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 27
    .line 28
    if-ge v0, v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 31
    .line 32
    aget-byte v4, v2, v0

    .line 33
    .line 34
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 35
    .line 36
    and-int/2addr v5, v4

    .line 37
    iput v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 38
    .line 39
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 40
    .line 41
    ushr-int/2addr v4, v5

    .line 42
    int-to-byte v4, v4

    .line 43
    aput-byte v4, v2, v0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 47
    .line 48
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 49
    .line 50
    and-int/2addr v2, v0

    .line 51
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 52
    .line 53
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 54
    .line 55
    ushr-int/2addr v0, v2

    .line 56
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    if-lez v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 62
    .line 63
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 64
    .line 65
    array-length v4, v2

    .line 66
    invoke-interface {v0, v2, v3, v4}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 70
    .line 71
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    new-array v0, v0, [B

    .line 76
    .line 77
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 78
    .line 79
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 80
    .line 81
    invoke-interface {v2, v0, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 82
    .line 83
    .line 84
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 85
    .line 86
    add-int/lit8 v0, v0, -0x1

    .line 87
    .line 88
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 89
    .line 90
    :cond_2
    :goto_0
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 91
    .line 92
    if-nez v0, :cond_f

    .line 93
    .line 94
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 95
    .line 96
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 97
    .line 98
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 99
    .line 100
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 101
    .line 102
    mul-int/2addr v4, v5

    .line 103
    invoke-static {v0, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    .line 105
    .line 106
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 107
    .line 108
    add-int/lit8 v0, v0, 0x1

    .line 109
    .line 110
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 111
    .line 112
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 113
    .line 114
    div-int/2addr v1, v2

    .line 115
    rem-int/2addr v0, v1

    .line 116
    if-nez v0, :cond_f

    .line 117
    .line 118
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 119
    .line 120
    add-int/lit8 v0, v0, 0x1

    .line 121
    .line 122
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 123
    .line 124
    return-void

    .line 125
    :cond_3
    const-wide/16 v4, 0x0

    .line 126
    .line 127
    if-ge v0, v1, :cond_9

    .line 128
    .line 129
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 130
    .line 131
    if-nez v1, :cond_7

    .line 132
    .line 133
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 134
    .line 135
    rem-int/lit8 v2, v1, 0x8

    .line 136
    .line 137
    if-nez v2, :cond_5

    .line 138
    .line 139
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 140
    .line 141
    iget v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 142
    .line 143
    if-ge v2, v6, :cond_5

    .line 144
    .line 145
    iput-wide v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 146
    .line 147
    div-int/2addr v6, v0

    .line 148
    shl-int/lit8 v0, v6, 0x3

    .line 149
    .line 150
    if-ge v1, v0, :cond_4

    .line 151
    .line 152
    move v0, v3

    .line 153
    :goto_1
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 154
    .line 155
    if-ge v0, v1, :cond_5

    .line 156
    .line 157
    iget-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 158
    .line 159
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 160
    .line 161
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 162
    .line 163
    aget-byte v4, v4, v5

    .line 164
    .line 165
    and-int/lit16 v4, v4, 0xff

    .line 166
    .line 167
    shl-int/lit8 v6, v0, 0x3

    .line 168
    .line 169
    shl-int/2addr v4, v6

    .line 170
    int-to-long v6, v4

    .line 171
    xor-long/2addr v1, v6

    .line 172
    iput-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 173
    .line 174
    add-int/lit8 v5, v5, 0x1

    .line 175
    .line 176
    iput v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 177
    .line 178
    add-int/lit8 v0, v0, 0x1

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_4
    move v0, v3

    .line 182
    :goto_2
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 183
    .line 184
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 185
    .line 186
    rem-int/2addr v1, v2

    .line 187
    if-ge v0, v1, :cond_5

    .line 188
    .line 189
    iget-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 190
    .line 191
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 192
    .line 193
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 194
    .line 195
    aget-byte v4, v4, v5

    .line 196
    .line 197
    and-int/lit16 v4, v4, 0xff

    .line 198
    .line 199
    shl-int/lit8 v6, v0, 0x3

    .line 200
    .line 201
    shl-int/2addr v4, v6

    .line 202
    int-to-long v6, v4

    .line 203
    xor-long/2addr v1, v6

    .line 204
    iput-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 205
    .line 206
    add-int/lit8 v5, v5, 0x1

    .line 207
    .line 208
    iput v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 209
    .line 210
    add-int/lit8 v0, v0, 0x1

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_5
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 214
    .line 215
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 216
    .line 217
    if-ne v0, v1, :cond_6

    .line 218
    .line 219
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 220
    .line 221
    int-to-long v0, v0

    .line 222
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 223
    .line 224
    :cond_6
    iget-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 225
    .line 226
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 227
    .line 228
    int-to-long v4, v2

    .line 229
    and-long/2addr v0, v4

    .line 230
    long-to-int v0, v0

    .line 231
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 232
    .line 233
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 234
    .line 235
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_7
    if-lez v1, :cond_8

    .line 245
    .line 246
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 247
    .line 248
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 249
    .line 250
    array-length v2, v1

    .line 251
    invoke-interface {v0, v1, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 255
    .line 256
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    new-array v0, v0, [B

    .line 261
    .line 262
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 263
    .line 264
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 265
    .line 266
    invoke-interface {v1, v0, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 267
    .line 268
    .line 269
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 270
    .line 271
    add-int/lit8 v0, v0, -0x1

    .line 272
    .line 273
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 274
    .line 275
    :cond_8
    :goto_3
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 276
    .line 277
    if-nez v0, :cond_f

    .line 278
    .line 279
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 280
    .line 281
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 282
    .line 283
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 284
    .line 285
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 286
    .line 287
    mul-int/2addr v2, v4

    .line 288
    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 289
    .line 290
    .line 291
    iget-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 292
    .line 293
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 294
    .line 295
    ushr-long/2addr v0, v2

    .line 296
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 297
    .line 298
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 299
    .line 300
    add-int/lit8 v0, v0, 0x1

    .line 301
    .line 302
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 303
    .line 304
    return-void

    .line 305
    :cond_9
    const/16 v1, 0x39

    .line 306
    .line 307
    if-ge v0, v1, :cond_f

    .line 308
    .line 309
    iget-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 310
    .line 311
    cmp-long v6, v1, v4

    .line 312
    .line 313
    if-nez v6, :cond_d

    .line 314
    .line 315
    iput-wide v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 316
    .line 317
    iput v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 318
    .line 319
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 320
    .line 321
    rem-int/lit8 v2, v1, 0x8

    .line 322
    .line 323
    ushr-int/lit8 v6, v1, 0x3

    .line 324
    .line 325
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 326
    .line 327
    if-ge v6, v7, :cond_c

    .line 328
    .line 329
    shl-int/lit8 v8, v7, 0x3

    .line 330
    .line 331
    sub-int/2addr v8, v0

    .line 332
    if-gt v1, v8, :cond_a

    .line 333
    .line 334
    add-int/2addr v1, v0

    .line 335
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 336
    .line 337
    add-int/lit8 v1, v1, 0x7

    .line 338
    .line 339
    ushr-int/lit8 v7, v1, 0x3

    .line 340
    .line 341
    goto :goto_4

    .line 342
    :cond_a
    add-int/2addr v1, v0

    .line 343
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 344
    .line 345
    :goto_4
    iget-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 346
    .line 347
    if-ge v6, v7, :cond_b

    .line 348
    .line 349
    iget-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 350
    .line 351
    aget-byte v8, v8, v6

    .line 352
    .line 353
    and-int/lit16 v8, v8, 0xff

    .line 354
    .line 355
    iget v9, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 356
    .line 357
    shl-int/lit8 v10, v9, 0x3

    .line 358
    .line 359
    shl-int/2addr v8, v10

    .line 360
    int-to-long v10, v8

    .line 361
    xor-long/2addr v0, v10

    .line 362
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 363
    .line 364
    add-int/lit8 v9, v9, 0x1

    .line 365
    .line 366
    iput v9, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 367
    .line 368
    add-int/lit8 v6, v6, 0x1

    .line 369
    .line 370
    goto :goto_4

    .line 371
    :cond_b
    ushr-long/2addr v0, v2

    .line 372
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 373
    .line 374
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 375
    .line 376
    int-to-long v6, v2

    .line 377
    and-long/2addr v0, v6

    .line 378
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 379
    .line 380
    goto :goto_5

    .line 381
    :cond_c
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 382
    .line 383
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 384
    .line 385
    and-int/2addr v2, v1

    .line 386
    int-to-long v6, v2

    .line 387
    iput-wide v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 388
    .line 389
    ushr-int v0, v1, v0

    .line 390
    .line 391
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 392
    .line 393
    :goto_5
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 394
    .line 395
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 396
    .line 397
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 402
    .line 403
    goto :goto_6

    .line 404
    :cond_d
    cmp-long v0, v1, v4

    .line 405
    .line 406
    if-lez v0, :cond_e

    .line 407
    .line 408
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 409
    .line 410
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 411
    .line 412
    array-length v2, v1

    .line 413
    invoke-interface {v0, v1, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 414
    .line 415
    .line 416
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 417
    .line 418
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 419
    .line 420
    .line 421
    move-result v0

    .line 422
    new-array v0, v0, [B

    .line 423
    .line 424
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 425
    .line 426
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 427
    .line 428
    invoke-interface {v1, v0, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 429
    .line 430
    .line 431
    iget-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 432
    .line 433
    const-wide/16 v6, 0x1

    .line 434
    .line 435
    sub-long/2addr v0, v6

    .line 436
    iput-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 437
    .line 438
    :cond_e
    :goto_6
    iget-wide v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 439
    .line 440
    cmp-long v0, v0, v4

    .line 441
    .line 442
    if-nez v0, :cond_f

    .line 443
    .line 444
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 445
    .line 446
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 447
    .line 448
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 449
    .line 450
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 451
    .line 452
    mul-int/2addr v2, v4

    .line 453
    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 454
    .line 455
    .line 456
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 457
    .line 458
    add-int/lit8 v0, v0, 0x1

    .line 459
    .line 460
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 461
    .line 462
    :cond_f
    return-void
.end method


# virtual methods
.method public getLog(I)I
    .locals 1

    const/4 p0, 0x1

    const/4 v0, 0x2

    :goto_0
    if-ge v0, p1, :cond_0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return p0
.end method

.method public getSig()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatByte()[[B
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    aput v0, v2, v3

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v4, 0x5

    .line 11
    aput v4, v2, v0

    .line 12
    .line 13
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 14
    .line 15
    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, [[B

    .line 20
    .line 21
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 22
    .line 23
    aput-object v4, v2, v0

    .line 24
    .line 25
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 26
    .line 27
    aput-object v0, v2, v3

    .line 28
    .line 29
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 30
    .line 31
    aput-object v0, v2, v1

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 35
    .line 36
    aput-object v1, v2, v0

    .line 37
    .line 38
    const/4 v0, 0x4

    .line 39
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->getStatLong()[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    aput-object p0, v2, v0

    .line 44
    .line 45
    return-object v2
.end method

.method public getStatInt()[I
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 8
    .line 9
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->steps:I

    .line 10
    .line 11
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 12
    .line 13
    iget v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->height:I

    .line 14
    .line 15
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 16
    .line 17
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [I

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public getStatLong()[B
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 4
    .line 5
    const-wide/16 v3, 0xff

    .line 6
    .line 7
    and-long v5, v1, v3

    .line 8
    .line 9
    long-to-int v5, v5

    .line 10
    int-to-byte v5, v5

    .line 11
    const/16 v6, 0x8

    .line 12
    .line 13
    shr-long v7, v1, v6

    .line 14
    .line 15
    and-long/2addr v7, v3

    .line 16
    long-to-int v7, v7

    .line 17
    int-to-byte v7, v7

    .line 18
    const/16 v8, 0x10

    .line 19
    .line 20
    shr-long v9, v1, v8

    .line 21
    .line 22
    and-long/2addr v9, v3

    .line 23
    long-to-int v9, v9

    .line 24
    int-to-byte v9, v9

    .line 25
    const/16 v10, 0x18

    .line 26
    .line 27
    shr-long v11, v1, v10

    .line 28
    .line 29
    and-long/2addr v11, v3

    .line 30
    long-to-int v11, v11

    .line 31
    int-to-byte v11, v11

    .line 32
    const/16 v12, 0x20

    .line 33
    .line 34
    shr-long v13, v1, v12

    .line 35
    .line 36
    and-long/2addr v13, v3

    .line 37
    long-to-int v13, v13

    .line 38
    int-to-byte v13, v13

    .line 39
    const/16 v14, 0x28

    .line 40
    .line 41
    shr-long v15, v1, v14

    .line 42
    .line 43
    move-wide/from16 v17, v3

    .line 44
    .line 45
    and-long v3, v15, v17

    .line 46
    .line 47
    long-to-int v3, v3

    .line 48
    int-to-byte v3, v3

    .line 49
    const/16 v4, 0x30

    .line 50
    .line 51
    shr-long v15, v1, v4

    .line 52
    .line 53
    move/from16 v20, v4

    .line 54
    .line 55
    move/from16 v19, v5

    .line 56
    .line 57
    and-long v4, v15, v17

    .line 58
    .line 59
    long-to-int v4, v4

    .line 60
    int-to-byte v4, v4

    .line 61
    const/16 v5, 0x38

    .line 62
    .line 63
    shr-long/2addr v1, v5

    .line 64
    and-long v1, v1, v17

    .line 65
    .line 66
    long-to-int v1, v1

    .line 67
    int-to-byte v1, v1

    .line 68
    move v15, v5

    .line 69
    move v2, v6

    .line 70
    iget-wide v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 71
    .line 72
    move/from16 v16, v2

    .line 73
    .line 74
    move v0, v3

    .line 75
    and-long v2, v5, v17

    .line 76
    .line 77
    long-to-int v2, v2

    .line 78
    int-to-byte v2, v2

    .line 79
    shr-long v21, v5, v16

    .line 80
    .line 81
    move v3, v10

    .line 82
    move/from16 v23, v11

    .line 83
    .line 84
    and-long v10, v21, v17

    .line 85
    .line 86
    long-to-int v10, v10

    .line 87
    int-to-byte v10, v10

    .line 88
    shr-long v21, v5, v8

    .line 89
    .line 90
    move/from16 p0, v3

    .line 91
    .line 92
    move v11, v4

    .line 93
    and-long v3, v21, v17

    .line 94
    .line 95
    long-to-int v3, v3

    .line 96
    int-to-byte v3, v3

    .line 97
    shr-long v21, v5, p0

    .line 98
    .line 99
    move v4, v12

    .line 100
    move/from16 v24, v13

    .line 101
    .line 102
    and-long v12, v21, v17

    .line 103
    .line 104
    long-to-int v12, v12

    .line 105
    int-to-byte v12, v12

    .line 106
    shr-long v21, v5, v4

    .line 107
    .line 108
    move v4, v14

    .line 109
    move v13, v15

    .line 110
    and-long v14, v21, v17

    .line 111
    .line 112
    long-to-int v14, v14

    .line 113
    int-to-byte v14, v14

    .line 114
    shr-long v21, v5, v4

    .line 115
    .line 116
    move v15, v13

    .line 117
    move v4, v14

    .line 118
    and-long v13, v21, v17

    .line 119
    .line 120
    long-to-int v13, v13

    .line 121
    int-to-byte v13, v13

    .line 122
    shr-long v20, v5, v20

    .line 123
    .line 124
    move/from16 v22, v9

    .line 125
    .line 126
    and-long v8, v20, v17

    .line 127
    .line 128
    long-to-int v8, v8

    .line 129
    int-to-byte v8, v8

    .line 130
    shr-long/2addr v5, v15

    .line 131
    and-long v5, v5, v17

    .line 132
    .line 133
    long-to-int v5, v5

    .line 134
    int-to-byte v5, v5

    .line 135
    const/16 v14, 0x10

    .line 136
    .line 137
    new-array v6, v14, [B

    .line 138
    .line 139
    const/4 v9, 0x0

    .line 140
    aput-byte v19, v6, v9

    .line 141
    .line 142
    const/4 v9, 0x1

    .line 143
    aput-byte v7, v6, v9

    .line 144
    .line 145
    const/4 v7, 0x2

    .line 146
    aput-byte v22, v6, v7

    .line 147
    .line 148
    const/4 v7, 0x3

    .line 149
    aput-byte v23, v6, v7

    .line 150
    .line 151
    const/4 v7, 0x4

    .line 152
    aput-byte v24, v6, v7

    .line 153
    .line 154
    const/4 v7, 0x5

    .line 155
    aput-byte v0, v6, v7

    .line 156
    .line 157
    const/4 v0, 0x6

    .line 158
    aput-byte v11, v6, v0

    .line 159
    .line 160
    const/4 v0, 0x7

    .line 161
    aput-byte v1, v6, v0

    .line 162
    .line 163
    aput-byte v2, v6, v16

    .line 164
    .line 165
    const/16 v0, 0x9

    .line 166
    .line 167
    aput-byte v10, v6, v0

    .line 168
    .line 169
    const/16 v0, 0xa

    .line 170
    .line 171
    aput-byte v3, v6, v0

    .line 172
    .line 173
    const/16 v0, 0xb

    .line 174
    .line 175
    aput-byte v12, v6, v0

    .line 176
    .line 177
    const/16 v0, 0xc

    .line 178
    .line 179
    aput-byte v4, v6, v0

    .line 180
    .line 181
    const/16 v0, 0xd

    .line 182
    .line 183
    aput-byte v13, v6, v0

    .line 184
    .line 185
    const/16 v0, 0xe

    .line 186
    .line 187
    aput-byte v8, v6, v0

    .line 188
    .line 189
    const/16 v0, 0xf

    .line 190
    .line 191
    aput-byte v5, v6, v0

    .line 192
    .line 193
    return-object v6
.end method

.method public initSign([B[B)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 6
    .line 7
    new-array v2, v2, [B

    .line 8
    .line 9
    iput-object v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 10
    .line 11
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 12
    .line 13
    array-length v3, v1

    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-interface {v2, v1, v4, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 16
    .line 17
    .line 18
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 19
    .line 20
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    new-array v1, v1, [B

    .line 25
    .line 26
    iput-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 27
    .line 28
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 29
    .line 30
    invoke-interface {v2, v1, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 31
    .line 32
    .line 33
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 34
    .line 35
    new-array v2, v1, [B

    .line 36
    .line 37
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->hash:[B

    .line 38
    .line 39
    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 43
    .line 44
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 45
    .line 46
    shl-int/2addr v1, v3

    .line 47
    const/4 v3, 0x1

    .line 48
    add-int/2addr v1, v3

    .line 49
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->getLog(I)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 54
    .line 55
    const/16 v6, 0x8

    .line 56
    .line 57
    rem-int v7, v6, v5

    .line 58
    .line 59
    if-nez v7, :cond_2

    .line 60
    .line 61
    div-int/2addr v6, v5

    .line 62
    move v5, v4

    .line 63
    move v7, v5

    .line 64
    :goto_0
    iget v10, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 65
    .line 66
    if-ge v5, v10, :cond_1

    .line 67
    .line 68
    move v10, v4

    .line 69
    :goto_1
    if-ge v10, v6, :cond_0

    .line 70
    .line 71
    aget-byte v11, v2, v5

    .line 72
    .line 73
    iget v12, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 74
    .line 75
    and-int/2addr v12, v11

    .line 76
    add-int/2addr v7, v12

    .line 77
    iget v12, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 78
    .line 79
    ushr-int/2addr v11, v12

    .line 80
    int-to-byte v11, v11

    .line 81
    aput-byte v11, v2, v5

    .line 82
    .line 83
    add-int/lit8 v10, v10, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 90
    .line 91
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 92
    .line 93
    shl-int/2addr v2, v5

    .line 94
    sub-int/2addr v2, v7

    .line 95
    iput v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 96
    .line 97
    move v5, v4

    .line 98
    :goto_2
    if-ge v5, v1, :cond_e

    .line 99
    .line 100
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 101
    .line 102
    and-int/2addr v6, v2

    .line 103
    add-int/2addr v7, v6

    .line 104
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 105
    .line 106
    ushr-int/2addr v2, v6

    .line 107
    add-int/2addr v5, v6

    .line 108
    goto :goto_2

    .line 109
    :cond_2
    if-ge v5, v6, :cond_8

    .line 110
    .line 111
    iget v7, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 112
    .line 113
    div-int/2addr v7, v5

    .line 114
    move v5, v4

    .line 115
    move v10, v5

    .line 116
    move v11, v10

    .line 117
    :goto_3
    if-ge v5, v7, :cond_5

    .line 118
    .line 119
    move v12, v4

    .line 120
    const-wide/16 v13, 0x0

    .line 121
    .line 122
    :goto_4
    iget v15, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 123
    .line 124
    if-ge v12, v15, :cond_3

    .line 125
    .line 126
    aget-byte v15, v2, v10

    .line 127
    .line 128
    and-int/lit16 v15, v15, 0xff

    .line 129
    .line 130
    shl-int/lit8 v16, v12, 0x3

    .line 131
    .line 132
    shl-int v15, v15, v16

    .line 133
    .line 134
    int-to-long v8, v15

    .line 135
    xor-long/2addr v13, v8

    .line 136
    add-int/lit8 v10, v10, 0x1

    .line 137
    .line 138
    add-int/lit8 v12, v12, 0x1

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_3
    move v8, v4

    .line 142
    :goto_5
    if-ge v8, v6, :cond_4

    .line 143
    .line 144
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 145
    .line 146
    move/from16 p2, v6

    .line 147
    .line 148
    move v12, v7

    .line 149
    int-to-long v6, v9

    .line 150
    and-long/2addr v6, v13

    .line 151
    long-to-int v6, v6

    .line 152
    add-int/2addr v11, v6

    .line 153
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 154
    .line 155
    ushr-long/2addr v13, v6

    .line 156
    add-int/lit8 v8, v8, 0x1

    .line 157
    .line 158
    move/from16 v6, p2

    .line 159
    .line 160
    move v7, v12

    .line 161
    goto :goto_5

    .line 162
    :cond_4
    move/from16 p2, v6

    .line 163
    .line 164
    move v12, v7

    .line 165
    add-int/lit8 v5, v5, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_5
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 169
    .line 170
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 171
    .line 172
    rem-int/2addr v5, v6

    .line 173
    move v6, v4

    .line 174
    const-wide/16 v7, 0x0

    .line 175
    .line 176
    :goto_6
    if-ge v6, v5, :cond_6

    .line 177
    .line 178
    aget-byte v9, v2, v10

    .line 179
    .line 180
    and-int/lit16 v9, v9, 0xff

    .line 181
    .line 182
    shl-int/lit8 v12, v6, 0x3

    .line 183
    .line 184
    shl-int/2addr v9, v12

    .line 185
    int-to-long v12, v9

    .line 186
    xor-long/2addr v7, v12

    .line 187
    add-int/2addr v10, v3

    .line 188
    add-int/lit8 v6, v6, 0x1

    .line 189
    .line 190
    goto :goto_6

    .line 191
    :cond_6
    shl-int/lit8 v2, v5, 0x3

    .line 192
    .line 193
    move v5, v4

    .line 194
    :goto_7
    if-ge v5, v2, :cond_7

    .line 195
    .line 196
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 197
    .line 198
    int-to-long v9, v6

    .line 199
    and-long/2addr v9, v7

    .line 200
    long-to-int v6, v9

    .line 201
    add-int/2addr v11, v6

    .line 202
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 203
    .line 204
    ushr-long/2addr v7, v6

    .line 205
    add-int/2addr v5, v6

    .line 206
    goto :goto_7

    .line 207
    :cond_7
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 208
    .line 209
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 210
    .line 211
    shl-int/2addr v2, v5

    .line 212
    sub-int/2addr v2, v11

    .line 213
    iput v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 214
    .line 215
    move v5, v4

    .line 216
    move v7, v11

    .line 217
    :goto_8
    if-ge v5, v1, :cond_e

    .line 218
    .line 219
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 220
    .line 221
    and-int/2addr v6, v2

    .line 222
    add-int/2addr v7, v6

    .line 223
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 224
    .line 225
    ushr-int/2addr v2, v6

    .line 226
    add-int/2addr v5, v6

    .line 227
    goto :goto_8

    .line 228
    :cond_8
    move/from16 p2, v6

    .line 229
    .line 230
    const/16 v6, 0x39

    .line 231
    .line 232
    if-ge v5, v6, :cond_d

    .line 233
    .line 234
    move v5, v4

    .line 235
    move v6, v5

    .line 236
    :goto_9
    iget v7, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 237
    .line 238
    shl-int/lit8 v8, v7, 0x3

    .line 239
    .line 240
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 241
    .line 242
    sub-int/2addr v8, v9

    .line 243
    if-gt v5, v8, :cond_a

    .line 244
    .line 245
    ushr-int/lit8 v7, v5, 0x3

    .line 246
    .line 247
    rem-int/lit8 v8, v5, 0x8

    .line 248
    .line 249
    add-int/2addr v5, v9

    .line 250
    add-int/lit8 v9, v5, 0x7

    .line 251
    .line 252
    ushr-int/lit8 v9, v9, 0x3

    .line 253
    .line 254
    move v12, v4

    .line 255
    const-wide/16 v10, 0x0

    .line 256
    .line 257
    :goto_a
    if-ge v7, v9, :cond_9

    .line 258
    .line 259
    aget-byte v13, v2, v7

    .line 260
    .line 261
    and-int/lit16 v13, v13, 0xff

    .line 262
    .line 263
    shl-int/lit8 v14, v12, 0x3

    .line 264
    .line 265
    shl-int/2addr v13, v14

    .line 266
    int-to-long v13, v13

    .line 267
    xor-long/2addr v10, v13

    .line 268
    add-int/2addr v12, v3

    .line 269
    add-int/lit8 v7, v7, 0x1

    .line 270
    .line 271
    goto :goto_a

    .line 272
    :cond_9
    ushr-long v7, v10, v8

    .line 273
    .line 274
    int-to-long v9, v6

    .line 275
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 276
    .line 277
    int-to-long v11, v6

    .line 278
    and-long v6, v7, v11

    .line 279
    .line 280
    add-long/2addr v9, v6

    .line 281
    long-to-int v6, v9

    .line 282
    goto :goto_9

    .line 283
    :cond_a
    ushr-int/lit8 v8, v5, 0x3

    .line 284
    .line 285
    if-ge v8, v7, :cond_c

    .line 286
    .line 287
    rem-int/lit8 v5, v5, 0x8

    .line 288
    .line 289
    move v7, v4

    .line 290
    const-wide/16 v9, 0x0

    .line 291
    .line 292
    :goto_b
    iget v11, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 293
    .line 294
    if-ge v8, v11, :cond_b

    .line 295
    .line 296
    aget-byte v11, v2, v8

    .line 297
    .line 298
    and-int/lit16 v11, v11, 0xff

    .line 299
    .line 300
    shl-int/lit8 v12, v7, 0x3

    .line 301
    .line 302
    shl-int/2addr v11, v12

    .line 303
    int-to-long v11, v11

    .line 304
    xor-long/2addr v9, v11

    .line 305
    add-int/2addr v7, v3

    .line 306
    add-int/lit8 v8, v8, 0x1

    .line 307
    .line 308
    goto :goto_b

    .line 309
    :cond_b
    ushr-long v7, v9, v5

    .line 310
    .line 311
    int-to-long v5, v6

    .line 312
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 313
    .line 314
    int-to-long v9, v2

    .line 315
    and-long/2addr v7, v9

    .line 316
    add-long/2addr v5, v7

    .line 317
    long-to-int v6, v5

    .line 318
    :cond_c
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 319
    .line 320
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 321
    .line 322
    shl-int/2addr v2, v5

    .line 323
    sub-int/2addr v2, v6

    .line 324
    iput v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->checksum:I

    .line 325
    .line 326
    move v5, v4

    .line 327
    move v7, v6

    .line 328
    :goto_c
    if-ge v5, v1, :cond_e

    .line 329
    .line 330
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->k:I

    .line 331
    .line 332
    and-int/2addr v6, v2

    .line 333
    add-int/2addr v7, v6

    .line 334
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 335
    .line 336
    ushr-int/2addr v2, v6

    .line 337
    add-int/2addr v5, v6

    .line 338
    goto :goto_c

    .line 339
    :cond_d
    move v7, v4

    .line 340
    :cond_e
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->messagesize:I

    .line 341
    .line 342
    int-to-double v5, v1

    .line 343
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->w:I

    .line 344
    .line 345
    int-to-double v8, v1

    .line 346
    div-double/2addr v5, v8

    .line 347
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 348
    .line 349
    .line 350
    move-result-wide v5

    .line 351
    double-to-int v1, v5

    .line 352
    add-int/2addr v2, v1

    .line 353
    iput v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 354
    .line 355
    add-int/2addr v2, v7

    .line 356
    int-to-double v1, v2

    .line 357
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->height:I

    .line 358
    .line 359
    shl-int/2addr v3, v5

    .line 360
    int-to-double v5, v3

    .line 361
    div-double/2addr v1, v5

    .line 362
    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    .line 363
    .line 364
    .line 365
    move-result-wide v1

    .line 366
    double-to-int v1, v1

    .line 367
    iput v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->steps:I

    .line 368
    .line 369
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 370
    .line 371
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 372
    .line 373
    mul-int/2addr v1, v2

    .line 374
    new-array v1, v1, [B

    .line 375
    .line 376
    iput-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->sign:[B

    .line 377
    .line 378
    iput v4, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 379
    .line 380
    iput v4, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test:I

    .line 381
    .line 382
    iput v4, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->ii:I

    .line 383
    .line 384
    const-wide/16 v5, 0x0

    .line 385
    .line 386
    iput-wide v5, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->test8:J

    .line 387
    .line 388
    iput v4, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->r:I

    .line 389
    .line 390
    new-array v1, v2, [B

    .line 391
    .line 392
    iput-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->privateKeyOTS:[B

    .line 393
    .line 394
    new-array v1, v2, [B

    .line 395
    .line 396
    iput-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->seed:[B

    .line 397
    .line 398
    move-object/from16 v0, p1

    .line 399
    .line 400
    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 401
    .line 402
    .line 403
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->big8:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "  "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->getStatInt()[I

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->mdsize:I

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    new-array v3, v3, [I

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    aput v2, v3, v4

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    const/4 v4, 0x5

    .line 36
    aput v4, v3, v2

    .line 37
    .line 38
    sget-object v5, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 39
    .line 40
    invoke-static {v5, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, [[B

    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->getStatByte()[[B

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    move v3, v2

    .line 51
    :goto_0
    const/16 v5, 0x9

    .line 52
    .line 53
    const-string v6, " "

    .line 54
    .line 55
    if-ge v3, v5, :cond_0

    .line 56
    .line 57
    new-instance v5, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    aget v0, v1, v3

    .line 66
    .line 67
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    :goto_1
    if-ge v2, v4, :cond_1

    .line 81
    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    new-instance v0, Ljava/lang/String;

    .line 91
    .line 92
    aget-object v3, p0, v2

    .line 93
    .line 94
    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    add-int/lit8 v2, v2, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    return-object v0
.end method

.method public updateSign()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->steps:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_2

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 8
    .line 9
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 10
    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->oneStep()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->counter:I

    .line 17
    .line 18
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;->keysize:I

    .line 19
    .line 20
    if-ne v2, v3, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    return v0
.end method
