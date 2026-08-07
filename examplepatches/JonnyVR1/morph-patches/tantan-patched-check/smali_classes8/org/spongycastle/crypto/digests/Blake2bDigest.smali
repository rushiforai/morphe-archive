.class public Lorg/spongycastle/crypto/digests/Blake2bDigest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;


# static fields
.field private static final BLOCK_LENGTH_BYTES:I = 0x80

.field private static final blake2b_IV:[J

.field private static final blake2b_sigma:[[B

.field private static rOUNDS:I


# instance fields
.field private buffer:[B

.field private bufferPos:I

.field private chainValue:[J

.field private digestLength:I

.field private f0:J

.field private internalState:[J

.field private key:[B

.field private keyLength:I

.field private personalization:[B

.field private salt:[B

.field private t0:J

.field private t1:J


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [J

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v1, v0, [B

    .line 13
    .line 14
    fill-array-data v1, :array_1

    .line 15
    .line 16
    .line 17
    new-array v2, v0, [B

    .line 18
    .line 19
    fill-array-data v2, :array_2

    .line 20
    .line 21
    .line 22
    new-array v3, v0, [B

    .line 23
    .line 24
    fill-array-data v3, :array_3

    .line 25
    .line 26
    .line 27
    new-array v4, v0, [B

    .line 28
    .line 29
    fill-array-data v4, :array_4

    .line 30
    .line 31
    .line 32
    new-array v5, v0, [B

    .line 33
    .line 34
    fill-array-data v5, :array_5

    .line 35
    .line 36
    .line 37
    new-array v6, v0, [B

    .line 38
    .line 39
    fill-array-data v6, :array_6

    .line 40
    .line 41
    .line 42
    new-array v7, v0, [B

    .line 43
    .line 44
    fill-array-data v7, :array_7

    .line 45
    .line 46
    .line 47
    new-array v8, v0, [B

    .line 48
    .line 49
    fill-array-data v8, :array_8

    .line 50
    .line 51
    .line 52
    new-array v9, v0, [B

    .line 53
    .line 54
    fill-array-data v9, :array_9

    .line 55
    .line 56
    .line 57
    new-array v10, v0, [B

    .line 58
    .line 59
    fill-array-data v10, :array_a

    .line 60
    .line 61
    .line 62
    new-array v11, v0, [B

    .line 63
    .line 64
    fill-array-data v11, :array_b

    .line 65
    .line 66
    .line 67
    new-array v12, v0, [B

    .line 68
    .line 69
    fill-array-data v12, :array_c

    .line 70
    .line 71
    .line 72
    filled-new-array/range {v1 .. v12}, [[B

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sput-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    .line 77
    .line 78
    const/16 v0, 0xc

    .line 79
    .line 80
    sput v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rOUNDS:I

    .line 81
    .line 82
    return-void

    .line 83
    :array_0
    .array-data 8
        0x6a09e667f3bcc908L    # 6.344059688352415E202
        -0x4498517a7b3558c5L    # -1.5671250923562117E-22
        0x3c6ef372fe94f82bL    # 1.342284505169847E-17
        -0x5ab00ac5a0e2c90fL
        0x510e527fade682d1L    # 2.876275032471325E82
        -0x64fa9773d4c193e1L
        0x1f83d9abfb41bd6bL    # 7.229011495228878E-157
        0x5be0cd19137e2179L    # 3.816167663240759E134
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :array_1
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_2
    .array-data 1
        0xet
        0xat
        0x4t
        0x8t
        0x9t
        0xft
        0xdt
        0x6t
        0x1t
        0xct
        0x0t
        0x2t
        0xbt
        0x7t
        0x5t
        0x3t
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :array_3
    .array-data 1
        0xbt
        0x8t
        0xct
        0x0t
        0x5t
        0x2t
        0xft
        0xdt
        0xat
        0xet
        0x3t
        0x6t
        0x7t
        0x1t
        0x9t
        0x4t
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_4
    .array-data 1
        0x7t
        0x9t
        0x3t
        0x1t
        0xdt
        0xct
        0xbt
        0xet
        0x2t
        0x6t
        0x5t
        0xat
        0x4t
        0x0t
        0xft
        0x8t
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :array_5
    .array-data 1
        0x9t
        0x0t
        0x5t
        0x7t
        0x2t
        0x4t
        0xat
        0xft
        0xet
        0x1t
        0xbt
        0xct
        0x6t
        0x8t
        0x3t
        0xdt
    .end array-data

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :array_6
    .array-data 1
        0x2t
        0xct
        0x6t
        0xat
        0x0t
        0xbt
        0x8t
        0x3t
        0x4t
        0xdt
        0x7t
        0x5t
        0xft
        0xet
        0x1t
        0x9t
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :array_7
    .array-data 1
        0xct
        0x5t
        0x1t
        0xft
        0xet
        0xdt
        0x4t
        0xat
        0x0t
        0x7t
        0x6t
        0x3t
        0x9t
        0x2t
        0x8t
        0xbt
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_8
    .array-data 1
        0xdt
        0xbt
        0x7t
        0xet
        0xct
        0x1t
        0x3t
        0x9t
        0x5t
        0x0t
        0xft
        0x4t
        0x8t
        0x6t
        0x2t
        0xat
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    :array_9
    .array-data 1
        0x6t
        0xft
        0xet
        0x9t
        0xbt
        0x3t
        0x0t
        0x8t
        0xct
        0x2t
        0xdt
        0x7t
        0x1t
        0x4t
        0xat
        0x5t
    .end array-data

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    :array_a
    .array-data 1
        0xat
        0x2t
        0x8t
        0x4t
        0x7t
        0x6t
        0x1t
        0x5t
        0xft
        0xbt
        0x9t
        0xet
        0x3t
        0xct
        0xdt
        0x0t
    .end array-data

    :array_b
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
    .end array-data

    :array_c
    .array-data 1
        0xet
        0xat
        0x4t
        0x8t
        0x9t
        0xft
        0xdt
        0x6t
        0x1t
        0xct
        0x0t
        0x2t
        0xbt
        0x7t
        0x5t
        0x3t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x200

    .line 191
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    .line 152
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    const/4 v0, 0x0

    .line 153
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    const/4 v1, 0x0

    .line 154
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 155
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 156
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 157
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 158
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    const/16 v2, 0x10

    .line 159
    new-array v2, v2, [J

    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 160
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const-wide/16 v1, 0x0

    .line 161
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 162
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 163
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    const/16 v1, 0xa0

    if-eq p1, v1, :cond_1

    const/16 v1, 0x100

    if-eq p1, v1, :cond_1

    const/16 v1, 0x180

    if-eq p1, v1, :cond_1

    const/16 v1, 0x200

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    const-string p0, "Blake2b digest restricted to one of [160, 256, 384, 512]"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_1
    :goto_0
    const/16 v1, 0x80

    .line 165
    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 166
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 167
    div-int/lit8 p1, p1, 0x8

    iput p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 168
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/Blake2bDigest;)V
    .locals 2

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    .line 132
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    const/4 v0, 0x0

    .line 133
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    const/4 v1, 0x0

    .line 134
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 135
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 136
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 137
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 138
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    const/16 v0, 0x10

    .line 139
    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 140
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const-wide/16 v0, 0x0

    .line 141
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 142
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 143
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 144
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 145
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 146
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 147
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 148
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 149
    iget-object p1, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([J)[J

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 150
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 6

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    .line 170
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    const/4 v1, 0x0

    .line 171
    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    const/4 v2, 0x0

    .line 172
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 173
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 174
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 175
    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    const/16 v3, 0x10

    .line 176
    new-array v3, v3, [J

    iput-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 177
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const-wide/16 v3, 0x0

    .line 178
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 179
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 180
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    const/16 v3, 0x80

    .line 181
    new-array v4, v3, [B

    iput-object v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    if-eqz p1, :cond_1

    .line 182
    array-length v4, p1

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 183
    array-length v5, p1

    invoke-static {p1, v1, v4, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    array-length v4, p1

    if-gt v4, v0, :cond_0

    .line 185
    array-length v2, p1

    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 186
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    array-length v4, p1

    invoke-static {p1, v1, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    goto :goto_0

    .line 188
    :cond_0
    const-string p0, "Keys > 64 are not supported"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v2

    .line 189
    :cond_1
    :goto_0
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 190
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    return-void
.end method

.method public constructor <init>([BI[B[B)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x40

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 13
    .line 14
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 15
    .line 16
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 17
    .line 18
    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 19
    .line 20
    const/16 v3, 0x10

    .line 21
    .line 22
    new-array v4, v3, [J

    .line 23
    .line 24
    iput-object v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 25
    .line 26
    iput-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 27
    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 31
    .line 32
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 33
    .line 34
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 35
    .line 36
    const/16 v4, 0x80

    .line 37
    .line 38
    new-array v5, v4, [B

    .line 39
    .line 40
    iput-object v5, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 41
    .line 42
    const/4 v5, 0x1

    .line 43
    if-lt p2, v5, :cond_6

    .line 44
    .line 45
    if-gt p2, v0, :cond_6

    .line 46
    .line 47
    iput p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 48
    .line 49
    if-eqz p3, :cond_1

    .line 50
    .line 51
    array-length p2, p3

    .line 52
    if-ne p2, v3, :cond_0

    .line 53
    .line 54
    new-array p2, v3, [B

    .line 55
    .line 56
    iput-object p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 57
    .line 58
    array-length v5, p3

    .line 59
    invoke-static {p3, v1, p2, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const-string p0, "salt length must be exactly 16 bytes"

    .line 64
    .line 65
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw v2

    .line 69
    :cond_1
    :goto_0
    if-eqz p4, :cond_3

    .line 70
    .line 71
    array-length p2, p4

    .line 72
    if-ne p2, v3, :cond_2

    .line 73
    .line 74
    new-array p2, v3, [B

    .line 75
    .line 76
    iput-object p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 77
    .line 78
    array-length p3, p4

    .line 79
    invoke-static {p4, v1, p2, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    const-string p0, "personalization length must be exactly 16 bytes"

    .line 84
    .line 85
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw v2

    .line 89
    :cond_3
    :goto_1
    if-eqz p1, :cond_5

    .line 90
    .line 91
    array-length p2, p1

    .line 92
    new-array p2, p2, [B

    .line 93
    .line 94
    iput-object p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 95
    .line 96
    array-length p3, p1

    .line 97
    invoke-static {p1, v1, p2, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    .line 99
    .line 100
    array-length p2, p1

    .line 101
    if-gt p2, v0, :cond_4

    .line 102
    .line 103
    array-length p2, p1

    .line 104
    iput p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 105
    .line 106
    iget-object p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 107
    .line 108
    array-length p3, p1

    .line 109
    invoke-static {p1, v1, p2, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    .line 111
    .line 112
    iput v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    const-string p0, "Keys > 64 are not supported"

    .line 116
    .line 117
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw v2

    .line 121
    :cond_5
    :goto_2
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    const-string p0, "Invalid digest length (required: 1 - 64)"

    .line 126
    .line 127
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    throw v2
.end method

.method private G(JJIIII)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 2
    .line 3
    aget-wide v1, v0, p5

    .line 4
    .line 5
    aget-wide v3, v0, p6

    .line 6
    .line 7
    add-long/2addr v1, v3

    .line 8
    add-long/2addr v1, p1

    .line 9
    aput-wide v1, v0, p5

    .line 10
    .line 11
    aget-wide p1, v0, p8

    .line 12
    .line 13
    xor-long/2addr p1, v1

    .line 14
    const/16 v1, 0x20

    .line 15
    .line 16
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    aput-wide p1, v0, p8

    .line 21
    .line 22
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 23
    .line 24
    aget-wide v0, p1, p7

    .line 25
    .line 26
    aget-wide v2, p1, p8

    .line 27
    .line 28
    add-long/2addr v0, v2

    .line 29
    aput-wide v0, p1, p7

    .line 30
    .line 31
    aget-wide v2, p1, p6

    .line 32
    .line 33
    xor-long/2addr v0, v2

    .line 34
    const/16 p2, 0x18

    .line 35
    .line 36
    invoke-direct {p0, v0, v1, p2}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    aput-wide v0, p1, p6

    .line 41
    .line 42
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 43
    .line 44
    aget-wide v0, p1, p5

    .line 45
    .line 46
    aget-wide v2, p1, p6

    .line 47
    .line 48
    add-long/2addr v0, v2

    .line 49
    add-long/2addr v0, p3

    .line 50
    aput-wide v0, p1, p5

    .line 51
    .line 52
    aget-wide p2, p1, p8

    .line 53
    .line 54
    xor-long/2addr p2, v0

    .line 55
    const/16 p4, 0x10

    .line 56
    .line 57
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    .line 58
    .line 59
    .line 60
    move-result-wide p2

    .line 61
    aput-wide p2, p1, p8

    .line 62
    .line 63
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 64
    .line 65
    aget-wide p2, p1, p7

    .line 66
    .line 67
    aget-wide p4, p1, p8

    .line 68
    .line 69
    add-long/2addr p2, p4

    .line 70
    aput-wide p2, p1, p7

    .line 71
    .line 72
    aget-wide p4, p1, p6

    .line 73
    .line 74
    xor-long/2addr p2, p4

    .line 75
    const/16 p4, 0x3f

    .line 76
    .line 77
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    .line 78
    .line 79
    .line 80
    move-result-wide p2

    .line 81
    aput-wide p2, p1, p6

    .line 82
    .line 83
    return-void
.end method

.method private final bytes2long([BI)J
    .locals 6

    .line 1
    aget-byte p0, p1, p2

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    const-wide/16 v2, 0xff

    .line 5
    .line 6
    and-long/2addr v0, v2

    .line 7
    add-int/lit8 p0, p2, 0x1

    .line 8
    .line 9
    aget-byte p0, p1, p0

    .line 10
    .line 11
    int-to-long v4, p0

    .line 12
    and-long/2addr v4, v2

    .line 13
    const/16 p0, 0x8

    .line 14
    .line 15
    shl-long/2addr v4, p0

    .line 16
    or-long/2addr v0, v4

    .line 17
    add-int/lit8 p0, p2, 0x2

    .line 18
    .line 19
    aget-byte p0, p1, p0

    .line 20
    .line 21
    int-to-long v4, p0

    .line 22
    and-long/2addr v4, v2

    .line 23
    const/16 p0, 0x10

    .line 24
    .line 25
    shl-long/2addr v4, p0

    .line 26
    or-long/2addr v0, v4

    .line 27
    add-int/lit8 p0, p2, 0x3

    .line 28
    .line 29
    aget-byte p0, p1, p0

    .line 30
    .line 31
    int-to-long v4, p0

    .line 32
    and-long/2addr v4, v2

    .line 33
    const/16 p0, 0x18

    .line 34
    .line 35
    shl-long/2addr v4, p0

    .line 36
    or-long/2addr v0, v4

    .line 37
    add-int/lit8 p0, p2, 0x4

    .line 38
    .line 39
    aget-byte p0, p1, p0

    .line 40
    .line 41
    int-to-long v4, p0

    .line 42
    and-long/2addr v4, v2

    .line 43
    const/16 p0, 0x20

    .line 44
    .line 45
    shl-long/2addr v4, p0

    .line 46
    or-long/2addr v0, v4

    .line 47
    add-int/lit8 p0, p2, 0x5

    .line 48
    .line 49
    aget-byte p0, p1, p0

    .line 50
    .line 51
    int-to-long v4, p0

    .line 52
    and-long/2addr v4, v2

    .line 53
    const/16 p0, 0x28

    .line 54
    .line 55
    shl-long/2addr v4, p0

    .line 56
    or-long/2addr v0, v4

    .line 57
    add-int/lit8 p0, p2, 0x6

    .line 58
    .line 59
    aget-byte p0, p1, p0

    .line 60
    .line 61
    int-to-long v4, p0

    .line 62
    and-long/2addr v4, v2

    .line 63
    const/16 p0, 0x30

    .line 64
    .line 65
    shl-long/2addr v4, p0

    .line 66
    or-long/2addr v0, v4

    .line 67
    add-int/lit8 p2, p2, 0x7

    .line 68
    .line 69
    aget-byte p0, p1, p2

    .line 70
    .line 71
    int-to-long p0, p0

    .line 72
    and-long/2addr p0, v2

    .line 73
    const/16 p2, 0x38

    .line 74
    .line 75
    shl-long/2addr p0, p2

    .line 76
    or-long/2addr p0, v0

    .line 77
    return-wide p0
.end method

.method private compress([BI)V
    .locals 13

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->initializeInternalState()V

    .line 2
    .line 3
    .line 4
    const/16 v1, 0x10

    .line 5
    .line 6
    new-array v9, v1, [J

    .line 7
    .line 8
    const/4 v10, 0x0

    .line 9
    move v2, v10

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    mul-int/lit8 v3, v2, 0x8

    .line 13
    .line 14
    add-int/2addr v3, p2

    .line 15
    invoke-direct {p0, p1, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    aput-wide v5, v9, v2

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v11, v10

    .line 25
    :goto_1
    sget v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rOUNDS:I

    .line 26
    .line 27
    if-ge v11, v1, :cond_1

    .line 28
    .line 29
    sget-object v12, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    .line 30
    .line 31
    aget-object v1, v12, v11

    .line 32
    .line 33
    aget-byte v2, v1, v10

    .line 34
    .line 35
    aget-wide v2, v9, v2

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    aget-byte v1, v1, v4

    .line 39
    .line 40
    aget-wide v4, v9, v1

    .line 41
    .line 42
    const/16 v7, 0x8

    .line 43
    .line 44
    const/16 v8, 0xc

    .line 45
    .line 46
    move-wide v1, v2

    .line 47
    move-wide v3, v4

    .line 48
    const/4 v5, 0x0

    .line 49
    const/4 v6, 0x4

    .line 50
    move-object v0, p0

    .line 51
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 52
    .line 53
    .line 54
    aget-object v0, v12, v11

    .line 55
    .line 56
    const/4 v1, 0x2

    .line 57
    aget-byte v1, v0, v1

    .line 58
    .line 59
    aget-wide v1, v9, v1

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    aget-byte v0, v0, v3

    .line 63
    .line 64
    aget-wide v3, v9, v0

    .line 65
    .line 66
    const/16 v7, 0x9

    .line 67
    .line 68
    const/16 v8, 0xd

    .line 69
    .line 70
    const/4 v5, 0x1

    .line 71
    const/4 v6, 0x5

    .line 72
    move-object v0, p0

    .line 73
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 74
    .line 75
    .line 76
    aget-object v0, v12, v11

    .line 77
    .line 78
    const/4 v1, 0x4

    .line 79
    aget-byte v1, v0, v1

    .line 80
    .line 81
    aget-wide v1, v9, v1

    .line 82
    .line 83
    const/4 v3, 0x5

    .line 84
    aget-byte v0, v0, v3

    .line 85
    .line 86
    aget-wide v3, v9, v0

    .line 87
    .line 88
    const/16 v7, 0xa

    .line 89
    .line 90
    const/16 v8, 0xe

    .line 91
    .line 92
    const/4 v5, 0x2

    .line 93
    const/4 v6, 0x6

    .line 94
    move-object v0, p0

    .line 95
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 96
    .line 97
    .line 98
    aget-object v0, v12, v11

    .line 99
    .line 100
    const/4 v1, 0x6

    .line 101
    aget-byte v1, v0, v1

    .line 102
    .line 103
    aget-wide v1, v9, v1

    .line 104
    .line 105
    const/4 v3, 0x7

    .line 106
    aget-byte v0, v0, v3

    .line 107
    .line 108
    aget-wide v3, v9, v0

    .line 109
    .line 110
    const/16 v7, 0xb

    .line 111
    .line 112
    const/16 v8, 0xf

    .line 113
    .line 114
    const/4 v5, 0x3

    .line 115
    const/4 v6, 0x7

    .line 116
    move-object v0, p0

    .line 117
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 118
    .line 119
    .line 120
    aget-object v0, v12, v11

    .line 121
    .line 122
    const/16 v1, 0x8

    .line 123
    .line 124
    aget-byte v1, v0, v1

    .line 125
    .line 126
    aget-wide v1, v9, v1

    .line 127
    .line 128
    const/16 v3, 0x9

    .line 129
    .line 130
    aget-byte v0, v0, v3

    .line 131
    .line 132
    aget-wide v3, v9, v0

    .line 133
    .line 134
    const/16 v7, 0xa

    .line 135
    .line 136
    const/4 v5, 0x0

    .line 137
    const/4 v6, 0x5

    .line 138
    move-object v0, p0

    .line 139
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 140
    .line 141
    .line 142
    aget-object v0, v12, v11

    .line 143
    .line 144
    const/16 v1, 0xa

    .line 145
    .line 146
    aget-byte v1, v0, v1

    .line 147
    .line 148
    aget-wide v1, v9, v1

    .line 149
    .line 150
    const/16 v3, 0xb

    .line 151
    .line 152
    aget-byte v0, v0, v3

    .line 153
    .line 154
    aget-wide v3, v9, v0

    .line 155
    .line 156
    const/16 v7, 0xb

    .line 157
    .line 158
    const/16 v8, 0xc

    .line 159
    .line 160
    const/4 v5, 0x1

    .line 161
    const/4 v6, 0x6

    .line 162
    move-object v0, p0

    .line 163
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 164
    .line 165
    .line 166
    aget-object v0, v12, v11

    .line 167
    .line 168
    const/16 v1, 0xc

    .line 169
    .line 170
    aget-byte v1, v0, v1

    .line 171
    .line 172
    aget-wide v1, v9, v1

    .line 173
    .line 174
    const/16 v3, 0xd

    .line 175
    .line 176
    aget-byte v0, v0, v3

    .line 177
    .line 178
    aget-wide v3, v9, v0

    .line 179
    .line 180
    const/16 v7, 0x8

    .line 181
    .line 182
    const/16 v8, 0xd

    .line 183
    .line 184
    const/4 v5, 0x2

    .line 185
    const/4 v6, 0x7

    .line 186
    move-object v0, p0

    .line 187
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 188
    .line 189
    .line 190
    aget-object v0, v12, v11

    .line 191
    .line 192
    const/16 v1, 0xe

    .line 193
    .line 194
    aget-byte v1, v0, v1

    .line 195
    .line 196
    aget-wide v1, v9, v1

    .line 197
    .line 198
    const/16 v3, 0xf

    .line 199
    .line 200
    aget-byte v0, v0, v3

    .line 201
    .line 202
    aget-wide v3, v9, v0

    .line 203
    .line 204
    const/16 v7, 0x9

    .line 205
    .line 206
    const/16 v8, 0xe

    .line 207
    .line 208
    const/4 v5, 0x3

    .line 209
    const/4 v6, 0x4

    .line 210
    move-object v0, p0

    .line 211
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 212
    .line 213
    .line 214
    add-int/lit8 v11, v11, 0x1

    .line 215
    .line 216
    goto/16 :goto_1

    .line 217
    .line 218
    :cond_1
    :goto_2
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 219
    .line 220
    array-length v2, v1

    .line 221
    if-ge v10, v2, :cond_2

    .line 222
    .line 223
    aget-wide v2, v1, v10

    .line 224
    .line 225
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 226
    .line 227
    aget-wide v5, v4, v10

    .line 228
    .line 229
    xor-long/2addr v2, v5

    .line 230
    add-int/lit8 v5, v10, 0x8

    .line 231
    .line 232
    aget-wide v5, v4, v5

    .line 233
    .line 234
    xor-long/2addr v2, v5

    .line 235
    aput-wide v2, v1, v10

    .line 236
    .line 237
    add-int/lit8 v10, v10, 0x1

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_2
    return-void
.end method

.method private init()V
    .locals 10

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    new-array v1, v0, [J

    .line 8
    .line 9
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 10
    .line 11
    sget-object v2, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aget-wide v4, v2, v3

    .line 15
    .line 16
    iget v6, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 17
    .line 18
    iget v7, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 19
    .line 20
    shl-int/2addr v7, v0

    .line 21
    or-int/2addr v6, v7

    .line 22
    const/high16 v7, 0x1010000

    .line 23
    .line 24
    or-int/2addr v6, v7

    .line 25
    int-to-long v6, v6

    .line 26
    xor-long/2addr v4, v6

    .line 27
    aput-wide v4, v1, v3

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    aget-wide v5, v2, v4

    .line 31
    .line 32
    aput-wide v5, v1, v4

    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    aget-wide v5, v2, v4

    .line 36
    .line 37
    aput-wide v5, v1, v4

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    aget-wide v5, v2, v4

    .line 41
    .line 42
    aput-wide v5, v1, v4

    .line 43
    .line 44
    const/4 v4, 0x4

    .line 45
    aget-wide v5, v2, v4

    .line 46
    .line 47
    aput-wide v5, v1, v4

    .line 48
    .line 49
    const/4 v7, 0x5

    .line 50
    aget-wide v8, v2, v7

    .line 51
    .line 52
    aput-wide v8, v1, v7

    .line 53
    .line 54
    iget-object v8, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 55
    .line 56
    if-eqz v8, :cond_0

    .line 57
    .line 58
    invoke-direct {p0, v8, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    .line 59
    .line 60
    .line 61
    move-result-wide v8

    .line 62
    xor-long/2addr v5, v8

    .line 63
    aput-wide v5, v1, v4

    .line 64
    .line 65
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 66
    .line 67
    aget-wide v4, v1, v7

    .line 68
    .line 69
    iget-object v6, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 70
    .line 71
    invoke-direct {p0, v6, v0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    .line 72
    .line 73
    .line 74
    move-result-wide v8

    .line 75
    xor-long/2addr v4, v8

    .line 76
    aput-wide v4, v1, v7

    .line 77
    .line 78
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 79
    .line 80
    const/4 v4, 0x6

    .line 81
    aget-wide v5, v2, v4

    .line 82
    .line 83
    aput-wide v5, v1, v4

    .line 84
    .line 85
    const/4 v7, 0x7

    .line 86
    aget-wide v8, v2, v7

    .line 87
    .line 88
    aput-wide v8, v1, v7

    .line 89
    .line 90
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 91
    .line 92
    if-eqz v2, :cond_1

    .line 93
    .line 94
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    .line 95
    .line 96
    .line 97
    move-result-wide v2

    .line 98
    xor-long/2addr v2, v5

    .line 99
    aput-wide v2, v1, v4

    .line 100
    .line 101
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 102
    .line 103
    aget-wide v2, v1, v7

    .line 104
    .line 105
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 106
    .line 107
    invoke-direct {p0, v4, v0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    .line 108
    .line 109
    .line 110
    move-result-wide v4

    .line 111
    xor-long/2addr v2, v4

    .line 112
    aput-wide v2, v1, v7

    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method private initializeInternalState()V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 13
    .line 14
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 15
    .line 16
    array-length v2, v2

    .line 17
    const/4 v4, 0x4

    .line 18
    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 22
    .line 23
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 24
    .line 25
    aget-wide v4, v0, v4

    .line 26
    .line 27
    xor-long/2addr v2, v4

    .line 28
    const/16 v4, 0xc

    .line 29
    .line 30
    aput-wide v2, v1, v4

    .line 31
    .line 32
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 33
    .line 34
    const/4 v4, 0x5

    .line 35
    aget-wide v4, v0, v4

    .line 36
    .line 37
    xor-long/2addr v2, v4

    .line 38
    const/16 v4, 0xd

    .line 39
    .line 40
    aput-wide v2, v1, v4

    .line 41
    .line 42
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 43
    .line 44
    const/4 p0, 0x6

    .line 45
    aget-wide v4, v0, p0

    .line 46
    .line 47
    xor-long/2addr v2, v4

    .line 48
    const/16 p0, 0xe

    .line 49
    .line 50
    aput-wide v2, v1, p0

    .line 51
    .line 52
    const/4 p0, 0x7

    .line 53
    aget-wide v2, v0, p0

    .line 54
    .line 55
    const/16 p0, 0xf

    .line 56
    .line 57
    aput-wide v2, v1, p0

    .line 58
    .line 59
    return-void
.end method

.method private final long2bytes(J)[B
    .locals 8

    .line 1
    long-to-int p0, p1

    .line 2
    int-to-byte p0, p0

    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    shr-long v1, p1, v0

    .line 6
    .line 7
    long-to-int v1, v1

    .line 8
    int-to-byte v1, v1

    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    shr-long v2, p1, v2

    .line 12
    .line 13
    long-to-int v2, v2

    .line 14
    int-to-byte v2, v2

    .line 15
    const/16 v3, 0x18

    .line 16
    .line 17
    shr-long v3, p1, v3

    .line 18
    .line 19
    long-to-int v3, v3

    .line 20
    int-to-byte v3, v3

    .line 21
    const/16 v4, 0x20

    .line 22
    .line 23
    shr-long v4, p1, v4

    .line 24
    .line 25
    long-to-int v4, v4

    .line 26
    int-to-byte v4, v4

    .line 27
    const/16 v5, 0x28

    .line 28
    .line 29
    shr-long v5, p1, v5

    .line 30
    .line 31
    long-to-int v5, v5

    .line 32
    int-to-byte v5, v5

    .line 33
    const/16 v6, 0x30

    .line 34
    .line 35
    shr-long v6, p1, v6

    .line 36
    .line 37
    long-to-int v6, v6

    .line 38
    int-to-byte v6, v6

    .line 39
    const/16 v7, 0x38

    .line 40
    .line 41
    shr-long/2addr p1, v7

    .line 42
    long-to-int p1, p1

    .line 43
    int-to-byte p1, p1

    .line 44
    new-array p2, v0, [B

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    aput-byte p0, p2, v0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    aput-byte v1, p2, p0

    .line 51
    .line 52
    const/4 p0, 0x2

    .line 53
    aput-byte v2, p2, p0

    .line 54
    .line 55
    const/4 p0, 0x3

    .line 56
    aput-byte v3, p2, p0

    .line 57
    .line 58
    const/4 p0, 0x4

    .line 59
    aput-byte v4, p2, p0

    .line 60
    .line 61
    const/4 p0, 0x5

    .line 62
    aput-byte v5, p2, p0

    .line 63
    .line 64
    const/4 p0, 0x6

    .line 65
    aput-byte v6, p2, p0

    .line 66
    .line 67
    const/4 p0, 0x7

    .line 68
    aput-byte p1, p2, p0

    .line 69
    .line 70
    return-object p2
.end method

.method private rotr64(JI)J
    .locals 2

    ushr-long v0, p1, p3

    rsub-int/lit8 p0, p3, 0x40

    shl-long p0, p1, p0

    or-long/2addr p0, v0

    return-wide p0
.end method


# virtual methods
.method public clearKey()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 10
    .line 11
    invoke-static {p0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public clearSalt()V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public doFinal([BI)I
    .locals 8

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 4
    .line 5
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 8
    .line 9
    int-to-long v3, v2

    .line 10
    add-long/2addr v0, v3

    .line 11
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 12
    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    cmp-long v5, v0, v3

    .line 16
    .line 17
    if-gez v5, :cond_0

    .line 18
    .line 19
    int-to-long v5, v2

    .line 20
    neg-long v0, v0

    .line 21
    cmp-long v0, v5, v0

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 26
    .line 27
    const-wide/16 v5, 0x1

    .line 28
    .line 29
    add-long/2addr v0, v5

    .line 30
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 39
    .line 40
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 44
    .line 45
    invoke-static {v0, v3, v4}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 46
    .line 47
    .line 48
    move v0, v1

    .line 49
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 50
    .line 51
    array-length v5, v2

    .line 52
    if-ge v0, v5, :cond_2

    .line 53
    .line 54
    mul-int/lit8 v5, v0, 0x8

    .line 55
    .line 56
    iget v6, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 57
    .line 58
    if-ge v5, v6, :cond_2

    .line 59
    .line 60
    aget-wide v6, v2, v0

    .line 61
    .line 62
    invoke-direct {p0, v6, v7}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->long2bytes(J)[B

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget v6, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 67
    .line 68
    add-int/lit8 v7, v6, -0x8

    .line 69
    .line 70
    if-ge v5, v7, :cond_1

    .line 71
    .line 72
    add-int/2addr v5, p2

    .line 73
    const/16 v6, 0x8

    .line 74
    .line 75
    invoke-static {v2, v1, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    add-int v7, p2, v5

    .line 80
    .line 81
    sub-int/2addr v6, v5

    .line 82
    invoke-static {v2, v1, p1, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    .line 84
    .line 85
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-static {v2, v3, v4}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->reset()V

    .line 92
    .line 93
    .line 94
    iget p0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 95
    .line 96
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Blake2b"

    .line 2
    .line 3
    return-object p0
.end method

.method public getByteLength()I
    .locals 0

    const/16 p0, 0x80

    return p0
.end method

.method public getDigestSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 2
    .line 3
    return p0
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 3
    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 7
    .line 8
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 9
    .line 10
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 14
    .line 15
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 20
    .line 21
    array-length v3, v1

    .line 22
    invoke-static {v1, v0, v2, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    const/16 v0, 0x80

    .line 26
    .line 27
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 28
    .line 29
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public update(B)V
    .locals 5

    .line 101
    iget v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    rsub-int v1, v0, 0x80

    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 102
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    const-wide/16 v3, 0x80

    add-long/2addr v0, v3

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    .line 103
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 104
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 105
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 106
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    aput-byte p1, v0, v1

    .line 107
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    return-void

    .line 108
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    aput-byte p1, v1, v0

    add-int/2addr v0, v2

    .line 109
    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    return-void
.end method

.method public update([BII)V
    .locals 11

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 7
    .line 8
    const-wide/16 v1, 0x1

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    const-wide/16 v5, 0x80

    .line 13
    .line 14
    const/4 v7, 0x0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    rsub-int v8, v0, 0x80

    .line 18
    .line 19
    iget-object v9, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 20
    .line 21
    if-ge v8, p3, :cond_2

    .line 22
    .line 23
    invoke-static {p1, p2, v9, v0, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-wide v9, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 27
    .line 28
    add-long/2addr v9, v5

    .line 29
    iput-wide v9, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 30
    .line 31
    cmp-long v0, v9, v3

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-wide v9, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 36
    .line 37
    add-long/2addr v9, v1

    .line 38
    iput-wide v9, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 41
    .line 42
    invoke-direct {p0, v0, v7}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 43
    .line 44
    .line 45
    iput v7, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 46
    .line 47
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 48
    .line 49
    invoke-static {v0, v7}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-static {p1, p2, v9, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    iget p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 57
    .line 58
    add-int/2addr p1, p3

    .line 59
    iput p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    move v8, v7

    .line 63
    :goto_0
    add-int/2addr p3, p2

    .line 64
    add-int/lit8 v0, p3, -0x80

    .line 65
    .line 66
    add-int/2addr p2, v8

    .line 67
    :goto_1
    if-ge p2, v0, :cond_5

    .line 68
    .line 69
    iget-wide v8, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 70
    .line 71
    add-long/2addr v8, v5

    .line 72
    iput-wide v8, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 73
    .line 74
    cmp-long v8, v8, v3

    .line 75
    .line 76
    if-nez v8, :cond_4

    .line 77
    .line 78
    iget-wide v8, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 79
    .line 80
    add-long/2addr v8, v1

    .line 81
    iput-wide v8, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 82
    .line 83
    :cond_4
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 84
    .line 85
    .line 86
    add-int/lit16 p2, p2, 0x80

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_5
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 90
    .line 91
    sub-int/2addr p3, p2

    .line 92
    invoke-static {p1, p2, v0, v7, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    .line 94
    .line 95
    iget p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 96
    .line 97
    add-int/2addr p1, p3

    .line 98
    iput p1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 99
    .line 100
    :cond_6
    :goto_2
    return-void
.end method
