.class public Lorg/spongycastle/crypto/engines/CamelliaLightEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10

.field private static final MASK8:I = 0xff

.field private static final SBOX1:[B

.field private static final SIGMA:[I


# instance fields
.field private _keyis128:Z

.field private initialized:Z

.field private ke:[I

.field private kw:[I

.field private state:[I

.field private subkey:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SIGMA:[I

    .line 9
    .line 10
    const/16 v0, 0x100

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SBOX1:[B

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        -0x5f619981
        0x3bcc908b
        -0x498517a8
        0x4caa73b2    # 8.93659E7f
        -0x3910c8d1
        -0x16b07d42
        0x54ff53a5
        -0xe2c90e4
        0x10e527fa
        -0x2197d2e3
        -0x4fa9773e
        -0x4c193e03
    .end array-data

    .line 22
    :array_1
    .array-data 1
        0x70t
        -0x7et
        0x2ct
        -0x14t
        -0x4dt
        0x27t
        -0x40t
        -0x1bt
        -0x1ct
        -0x7bt
        0x57t
        0x35t
        -0x16t
        0xct
        -0x52t
        0x41t
        0x23t
        -0x11t
        0x6bt
        -0x6dt
        0x45t
        0x19t
        -0x5bt
        0x21t
        -0x13t
        0xet
        0x4ft
        0x4et
        0x1dt
        0x65t
        -0x6et
        -0x43t
        -0x7at
        -0x48t
        -0x51t
        -0x71t
        0x7ct
        -0x15t
        0x1ft
        -0x32t
        0x3et
        0x30t
        -0x24t
        0x5ft
        0x5et
        -0x3bt
        0xbt
        0x1at
        -0x5at
        -0x1ft
        0x39t
        -0x36t
        -0x2bt
        0x47t
        0x5dt
        0x3dt
        -0x27t
        0x1t
        0x5at
        -0x2at
        0x51t
        0x56t
        0x6ct
        0x4dt
        -0x75t
        0xdt
        -0x66t
        0x66t
        -0x5t
        -0x34t
        -0x50t
        0x2dt
        0x74t
        0x12t
        0x2bt
        0x20t
        -0x10t
        -0x4ft
        -0x7ct
        -0x67t
        -0x21t
        0x4ct
        -0x35t
        -0x3et
        0x34t
        0x7et
        0x76t
        0x5t
        0x6dt
        -0x49t
        -0x57t
        0x31t
        -0x2ft
        0x17t
        0x4t
        -0x29t
        0x14t
        0x58t
        0x3at
        0x61t
        -0x22t
        0x1bt
        0x11t
        0x1ct
        0x32t
        0xft
        -0x64t
        0x16t
        0x53t
        0x18t
        -0xet
        0x22t
        -0x2t
        0x44t
        -0x31t
        -0x4et
        -0x3dt
        -0x4bt
        0x7at
        -0x6ft
        0x24t
        0x8t
        -0x18t
        -0x58t
        0x60t
        -0x4t
        0x69t
        0x50t
        -0x56t
        -0x30t
        -0x60t
        0x7dt
        -0x5ft
        -0x77t
        0x62t
        -0x69t
        0x54t
        0x5bt
        0x1et
        -0x6bt
        -0x20t
        -0x1t
        0x64t
        -0x2et
        0x10t
        -0x3ct
        0x0t
        0x48t
        -0x5dt
        -0x9t
        0x75t
        -0x25t
        -0x76t
        0x3t
        -0x1at
        -0x26t
        0x9t
        0x3ft
        -0x23t
        -0x6ct
        -0x79t
        0x5ct
        -0x7dt
        0x2t
        -0x33t
        0x4at
        -0x70t
        0x33t
        0x73t
        0x67t
        -0xat
        -0xdt
        -0x63t
        0x7ft
        -0x41t
        -0x1et
        0x52t
        -0x65t
        -0x28t
        0x26t
        -0x38t
        0x37t
        -0x3at
        0x3bt
        -0x7ft
        -0x6at
        0x6ft
        0x4bt
        0x13t
        -0x42t
        0x63t
        0x2et
        -0x17t
        0x79t
        -0x59t
        -0x74t
        -0x61t
        0x6et
        -0x44t
        -0x72t
        0x29t
        -0xbt
        -0x7t
        -0x4at
        0x2ft
        -0x3t
        -0x4ct
        0x59t
        0x78t
        -0x68t
        0x6t
        0x6at
        -0x19t
        0x46t
        0x71t
        -0x46t
        -0x2ct
        0x25t
        -0x55t
        0x42t
        -0x78t
        -0x5et
        -0x73t
        -0x6t
        0x72t
        0x7t
        -0x47t
        0x55t
        -0x8t
        -0x12t
        -0x54t
        0xat
        0x36t
        0x49t
        0x2at
        0x68t
        0x3ct
        0x38t
        -0xft
        -0x5ct
        0x40t
        0x28t
        -0x2dt
        0x7bt
        -0x45t
        -0x37t
        0x43t
        -0x3ft
        0x15t
        -0x1dt
        -0x53t
        -0xct
        0x77t
        -0x39t
        -0x80t
        -0x62t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x60

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 9
    .line 10
    const/16 v0, 0x8

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 15
    .line 16
    const/16 v0, 0xc

    .line 17
    .line 18
    new-array v0, v0, [I

    .line 19
    .line 20
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    new-array v0, v0, [I

    .line 24
    .line 25
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 26
    .line 27
    return-void
.end method

.method private bytes2int([BI)I
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    const/4 v1, 0x4

    .line 4
    if-ge p0, v1, :cond_0

    .line 5
    .line 6
    shl-int/lit8 v0, v0, 0x8

    .line 7
    .line 8
    add-int v1, p0, p2

    .line 9
    .line 10
    aget-byte v1, p1, v1

    .line 11
    .line 12
    and-int/lit16 v1, v1, 0xff

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return v0
.end method

.method private camelliaF2([I[II)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    aget v2, p2, p3

    .line 5
    .line 6
    xor-int/2addr v1, v2

    .line 7
    and-int/lit16 v2, v1, 0xff

    .line 8
    .line 9
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox4(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    ushr-int/lit8 v3, v1, 0x8

    .line 14
    .line 15
    and-int/lit16 v3, v3, 0xff

    .line 16
    .line 17
    invoke-direct {p0, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox3(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/16 v4, 0x8

    .line 22
    .line 23
    shl-int/2addr v3, v4

    .line 24
    or-int/2addr v2, v3

    .line 25
    ushr-int/lit8 v3, v1, 0x10

    .line 26
    .line 27
    and-int/lit16 v3, v3, 0xff

    .line 28
    .line 29
    invoke-direct {p0, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox2(I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/16 v5, 0x10

    .line 34
    .line 35
    shl-int/2addr v3, v5

    .line 36
    or-int/2addr v2, v3

    .line 37
    sget-object v3, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SBOX1:[B

    .line 38
    .line 39
    ushr-int/lit8 v1, v1, 0x18

    .line 40
    .line 41
    and-int/lit16 v1, v1, 0xff

    .line 42
    .line 43
    aget-byte v1, v3, v1

    .line 44
    .line 45
    and-int/lit16 v1, v1, 0xff

    .line 46
    .line 47
    shl-int/lit8 v1, v1, 0x18

    .line 48
    .line 49
    or-int/2addr v1, v2

    .line 50
    const/4 v2, 0x1

    .line 51
    aget v6, p1, v2

    .line 52
    .line 53
    add-int/lit8 v7, p3, 0x1

    .line 54
    .line 55
    aget v7, p2, v7

    .line 56
    .line 57
    xor-int/2addr v6, v7

    .line 58
    and-int/lit16 v7, v6, 0xff

    .line 59
    .line 60
    aget-byte v7, v3, v7

    .line 61
    .line 62
    and-int/lit16 v7, v7, 0xff

    .line 63
    .line 64
    ushr-int/lit8 v8, v6, 0x8

    .line 65
    .line 66
    and-int/lit16 v8, v8, 0xff

    .line 67
    .line 68
    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox4(I)I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    shl-int/2addr v8, v4

    .line 73
    or-int/2addr v7, v8

    .line 74
    ushr-int/lit8 v8, v6, 0x10

    .line 75
    .line 76
    and-int/lit16 v8, v8, 0xff

    .line 77
    .line 78
    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox3(I)I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    shl-int/2addr v8, v5

    .line 83
    or-int/2addr v7, v8

    .line 84
    ushr-int/lit8 v6, v6, 0x18

    .line 85
    .line 86
    and-int/lit16 v6, v6, 0xff

    .line 87
    .line 88
    invoke-direct {p0, v6}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox2(I)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    shl-int/lit8 v6, v6, 0x18

    .line 93
    .line 94
    or-int/2addr v6, v7

    .line 95
    invoke-static {v6, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    xor-int/2addr v1, v6

    .line 100
    invoke-static {v6, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    xor-int/2addr v6, v1

    .line 105
    invoke-static {v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->rightRotate(II)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    xor-int/2addr v1, v6

    .line 110
    const/4 v7, 0x2

    .line 111
    aget v8, p1, v7

    .line 112
    .line 113
    invoke-static {v6, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    xor-int/2addr v6, v1

    .line 118
    xor-int/2addr v6, v8

    .line 119
    aput v6, p1, v7

    .line 120
    .line 121
    const/4 v6, 0x3

    .line 122
    aget v8, p1, v6

    .line 123
    .line 124
    invoke-static {v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    xor-int/2addr v1, v8

    .line 129
    aput v1, p1, v6

    .line 130
    .line 131
    aget v1, p1, v7

    .line 132
    .line 133
    add-int/lit8 v7, p3, 0x2

    .line 134
    .line 135
    aget v7, p2, v7

    .line 136
    .line 137
    xor-int/2addr v1, v7

    .line 138
    and-int/lit16 v7, v1, 0xff

    .line 139
    .line 140
    invoke-direct {p0, v7}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox4(I)I

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    ushr-int/lit8 v8, v1, 0x8

    .line 145
    .line 146
    and-int/lit16 v8, v8, 0xff

    .line 147
    .line 148
    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox3(I)I

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    shl-int/2addr v8, v4

    .line 153
    or-int/2addr v7, v8

    .line 154
    ushr-int/lit8 v8, v1, 0x10

    .line 155
    .line 156
    and-int/lit16 v8, v8, 0xff

    .line 157
    .line 158
    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox2(I)I

    .line 159
    .line 160
    .line 161
    move-result v8

    .line 162
    shl-int/2addr v8, v5

    .line 163
    or-int/2addr v7, v8

    .line 164
    ushr-int/lit8 v1, v1, 0x18

    .line 165
    .line 166
    and-int/lit16 v1, v1, 0xff

    .line 167
    .line 168
    aget-byte v1, v3, v1

    .line 169
    .line 170
    and-int/lit16 v1, v1, 0xff

    .line 171
    .line 172
    shl-int/lit8 v1, v1, 0x18

    .line 173
    .line 174
    or-int/2addr v1, v7

    .line 175
    aget v7, p1, v6

    .line 176
    .line 177
    add-int/2addr p3, v6

    .line 178
    aget p2, p2, p3

    .line 179
    .line 180
    xor-int/2addr p2, v7

    .line 181
    and-int/lit16 p3, p2, 0xff

    .line 182
    .line 183
    aget-byte p3, v3, p3

    .line 184
    .line 185
    and-int/lit16 p3, p3, 0xff

    .line 186
    .line 187
    ushr-int/lit8 v3, p2, 0x8

    .line 188
    .line 189
    and-int/lit16 v3, v3, 0xff

    .line 190
    .line 191
    invoke-direct {p0, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox4(I)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    shl-int/2addr v3, v4

    .line 196
    or-int/2addr p3, v3

    .line 197
    ushr-int/lit8 v3, p2, 0x10

    .line 198
    .line 199
    and-int/lit16 v3, v3, 0xff

    .line 200
    .line 201
    invoke-direct {p0, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox3(I)I

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    shl-int/2addr v3, v5

    .line 206
    or-int/2addr p3, v3

    .line 207
    ushr-int/lit8 p2, p2, 0x18

    .line 208
    .line 209
    and-int/lit16 p2, p2, 0xff

    .line 210
    .line 211
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->sbox2(I)I

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    shl-int/lit8 p0, p0, 0x18

    .line 216
    .line 217
    or-int/2addr p0, p3

    .line 218
    invoke-static {p0, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    xor-int p2, v1, p0

    .line 223
    .line 224
    invoke-static {p0, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    xor-int/2addr p0, p2

    .line 229
    invoke-static {p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->rightRotate(II)I

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    xor-int/2addr p2, p0

    .line 234
    aget p3, p1, v0

    .line 235
    .line 236
    invoke-static {p0, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    xor-int/2addr p0, p2

    .line 241
    xor-int/2addr p0, p3

    .line 242
    aput p0, p1, v0

    .line 243
    .line 244
    aget p0, p1, v2

    .line 245
    .line 246
    invoke-static {p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    xor-int/2addr p0, p2

    .line 251
    aput p0, p1, v2

    .line 252
    .line 253
    return-void
.end method

.method private camelliaFLs([I[II)V
    .locals 5

    .line 1
    const/4 p0, 0x1

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    aget v3, p2, p3

    .line 8
    .line 9
    and-int/2addr v2, v3

    .line 10
    invoke-static {v2, p0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    xor-int/2addr v0, v2

    .line 15
    aput v0, p1, p0

    .line 16
    .line 17
    aget v2, p1, v1

    .line 18
    .line 19
    add-int/lit8 v3, p3, 0x1

    .line 20
    .line 21
    aget v3, p2, v3

    .line 22
    .line 23
    or-int/2addr v0, v3

    .line 24
    xor-int/2addr v0, v2

    .line 25
    aput v0, p1, v1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    aget v1, p1, v0

    .line 29
    .line 30
    add-int/lit8 v2, p3, 0x3

    .line 31
    .line 32
    aget v2, p2, v2

    .line 33
    .line 34
    const/4 v3, 0x3

    .line 35
    aget v4, p1, v3

    .line 36
    .line 37
    or-int/2addr v2, v4

    .line 38
    xor-int/2addr v1, v2

    .line 39
    aput v1, p1, v0

    .line 40
    .line 41
    add-int/2addr p3, v0

    .line 42
    aget p2, p2, p3

    .line 43
    .line 44
    and-int/2addr p2, v1

    .line 45
    invoke-static {p2, p0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->leftRotate(II)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    xor-int/2addr p0, v4

    .line 50
    aput p0, p1, v3

    .line 51
    .line 52
    return-void
.end method

.method private static decroldq(I[II[II)V
    .locals 8

    .line 1
    add-int/lit8 v0, p4, 0x2

    .line 2
    .line 3
    aget v1, p1, p2

    .line 4
    .line 5
    shl-int/2addr v1, p0

    .line 6
    add-int/lit8 v2, p2, 0x1

    .line 7
    .line 8
    aget v3, p1, v2

    .line 9
    .line 10
    rsub-int/lit8 v4, p0, 0x20

    .line 11
    .line 12
    ushr-int/2addr v3, v4

    .line 13
    or-int/2addr v1, v3

    .line 14
    aput v1, p3, v0

    .line 15
    .line 16
    add-int/lit8 v1, p4, 0x3

    .line 17
    .line 18
    aget v3, p1, v2

    .line 19
    .line 20
    shl-int/2addr v3, p0

    .line 21
    add-int/lit8 v5, p2, 0x2

    .line 22
    .line 23
    aget v6, p1, v5

    .line 24
    .line 25
    ushr-int/2addr v6, v4

    .line 26
    or-int/2addr v3, v6

    .line 27
    aput v3, p3, v1

    .line 28
    .line 29
    aget v3, p1, v5

    .line 30
    .line 31
    shl-int/2addr v3, p0

    .line 32
    add-int/lit8 v6, p2, 0x3

    .line 33
    .line 34
    aget v7, p1, v6

    .line 35
    .line 36
    ushr-int/2addr v7, v4

    .line 37
    or-int/2addr v3, v7

    .line 38
    aput v3, p3, p4

    .line 39
    .line 40
    add-int/lit8 v3, p4, 0x1

    .line 41
    .line 42
    aget v7, p1, v6

    .line 43
    .line 44
    shl-int p0, v7, p0

    .line 45
    .line 46
    aget v7, p1, p2

    .line 47
    .line 48
    ushr-int v4, v7, v4

    .line 49
    .line 50
    or-int/2addr p0, v4

    .line 51
    aput p0, p3, v3

    .line 52
    .line 53
    aget p0, p3, v0

    .line 54
    .line 55
    aput p0, p1, p2

    .line 56
    .line 57
    aget p0, p3, v1

    .line 58
    .line 59
    aput p0, p1, v2

    .line 60
    .line 61
    aget p0, p3, p4

    .line 62
    .line 63
    aput p0, p1, v5

    .line 64
    .line 65
    aget p0, p3, v3

    .line 66
    .line 67
    aput p0, p1, v6

    .line 68
    .line 69
    return-void
.end method

.method private static decroldqo32(I[II[II)V
    .locals 8

    .line 1
    add-int/lit8 v0, p4, 0x2

    .line 2
    .line 3
    add-int/lit8 v1, p2, 0x1

    .line 4
    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    add-int/lit8 v3, p0, -0x20

    .line 8
    .line 9
    shl-int/2addr v2, v3

    .line 10
    add-int/lit8 v4, p2, 0x2

    .line 11
    .line 12
    aget v5, p1, v4

    .line 13
    .line 14
    rsub-int/lit8 p0, p0, 0x40

    .line 15
    .line 16
    ushr-int/2addr v5, p0

    .line 17
    or-int/2addr v2, v5

    .line 18
    aput v2, p3, v0

    .line 19
    .line 20
    add-int/lit8 v2, p4, 0x3

    .line 21
    .line 22
    aget v5, p1, v4

    .line 23
    .line 24
    shl-int/2addr v5, v3

    .line 25
    add-int/lit8 v6, p2, 0x3

    .line 26
    .line 27
    aget v7, p1, v6

    .line 28
    .line 29
    ushr-int/2addr v7, p0

    .line 30
    or-int/2addr v5, v7

    .line 31
    aput v5, p3, v2

    .line 32
    .line 33
    aget v5, p1, v6

    .line 34
    .line 35
    shl-int/2addr v5, v3

    .line 36
    aget v7, p1, p2

    .line 37
    .line 38
    ushr-int/2addr v7, p0

    .line 39
    or-int/2addr v5, v7

    .line 40
    aput v5, p3, p4

    .line 41
    .line 42
    add-int/lit8 v5, p4, 0x1

    .line 43
    .line 44
    aget v7, p1, p2

    .line 45
    .line 46
    shl-int v3, v7, v3

    .line 47
    .line 48
    aget v7, p1, v1

    .line 49
    .line 50
    ushr-int p0, v7, p0

    .line 51
    .line 52
    or-int/2addr p0, v3

    .line 53
    aput p0, p3, v5

    .line 54
    .line 55
    aget p0, p3, v0

    .line 56
    .line 57
    aput p0, p1, p2

    .line 58
    .line 59
    aget p0, p3, v2

    .line 60
    .line 61
    aput p0, p1, v1

    .line 62
    .line 63
    aget p0, p3, p4

    .line 64
    .line 65
    aput p0, p1, v4

    .line 66
    .line 67
    aget p0, p3, v5

    .line 68
    .line 69
    aput p0, p1, v6

    .line 70
    .line 71
    return-void
.end method

.method private int2bytes(I[BI)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    const/4 v0, 0x4

    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    rsub-int/lit8 v0, p0, 0x3

    .line 6
    .line 7
    add-int/2addr v0, p3

    .line 8
    int-to-byte v1, p1

    .line 9
    aput-byte v1, p2, v0

    .line 10
    .line 11
    ushr-int/lit8 p1, p1, 0x8

    .line 12
    .line 13
    add-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method private lRot8(BI)B
    .locals 0

    shl-int p0, p1, p2

    and-int/lit16 p1, p1, 0xff

    rsub-int/lit8 p2, p2, 0x8

    ushr-int/2addr p1, p2

    or-int/2addr p0, p1

    int-to-byte p0, p0

    return p0
.end method

.method private static leftRotate(II)I
    .locals 1

    shl-int v0, p0, p1

    rsub-int/lit8 p1, p1, 0x20

    ushr-int/2addr p0, p1

    add-int/2addr v0, p0

    return v0
.end method

.method private processBlock128([BI[BI)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 4
    .line 5
    const/4 v3, 0x4

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v3, v1, 0x4

    .line 9
    .line 10
    add-int/2addr v3, p2

    .line 11
    invoke-direct {p0, p1, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    aput v3, v2, v1

    .line 16
    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 18
    .line 19
    aget v3, v2, v1

    .line 20
    .line 21
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 22
    .line 23
    aget v4, v4, v1

    .line 24
    .line 25
    xor-int/2addr v3, v4

    .line 26
    aput v3, v2, v1

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 32
    .line 33
    invoke-direct {p0, v2, p1, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 37
    .line 38
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 39
    .line 40
    invoke-direct {p0, p1, p2, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 44
    .line 45
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 46
    .line 47
    const/16 v1, 0x8

    .line 48
    .line 49
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 53
    .line 54
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 55
    .line 56
    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaFLs([I[II)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 60
    .line 61
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 62
    .line 63
    const/16 v1, 0xc

    .line 64
    .line 65
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 69
    .line 70
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 71
    .line 72
    const/16 v2, 0x10

    .line 73
    .line 74
    invoke-direct {p0, p1, p2, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 78
    .line 79
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 80
    .line 81
    const/16 v4, 0x14

    .line 82
    .line 83
    invoke-direct {p0, p1, p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 87
    .line 88
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 89
    .line 90
    invoke-direct {p0, p1, p2, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaFLs([I[II)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 94
    .line 95
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 96
    .line 97
    const/16 v4, 0x18

    .line 98
    .line 99
    invoke-direct {p0, p1, p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 103
    .line 104
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 105
    .line 106
    const/16 v4, 0x1c

    .line 107
    .line 108
    invoke-direct {p0, p1, p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 112
    .line 113
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 114
    .line 115
    const/16 v4, 0x20

    .line 116
    .line 117
    invoke-direct {p0, p1, p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 121
    .line 122
    const/4 p2, 0x2

    .line 123
    aget v4, p1, p2

    .line 124
    .line 125
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 126
    .line 127
    aget v3, v5, v3

    .line 128
    .line 129
    xor-int/2addr v3, v4

    .line 130
    aput v3, p1, p2

    .line 131
    .line 132
    const/4 p2, 0x3

    .line 133
    aget v4, p1, p2

    .line 134
    .line 135
    const/4 v6, 0x5

    .line 136
    aget v6, v5, v6

    .line 137
    .line 138
    xor-int/2addr v4, v6

    .line 139
    aput v4, p1, p2

    .line 140
    .line 141
    aget v4, p1, v0

    .line 142
    .line 143
    const/4 v6, 0x6

    .line 144
    aget v6, v5, v6

    .line 145
    .line 146
    xor-int/2addr v4, v6

    .line 147
    aput v4, p1, v0

    .line 148
    .line 149
    const/4 v4, 0x1

    .line 150
    aget v6, p1, v4

    .line 151
    .line 152
    const/4 v7, 0x7

    .line 153
    aget v5, v5, v7

    .line 154
    .line 155
    xor-int/2addr v5, v6

    .line 156
    aput v5, p1, v4

    .line 157
    .line 158
    invoke-direct {p0, v3, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 162
    .line 163
    aget p1, p1, p2

    .line 164
    .line 165
    add-int/lit8 p2, p4, 0x4

    .line 166
    .line 167
    invoke-direct {p0, p1, p3, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 171
    .line 172
    aget p1, p1, v0

    .line 173
    .line 174
    add-int/lit8 p2, p4, 0x8

    .line 175
    .line 176
    invoke-direct {p0, p1, p3, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 180
    .line 181
    aget p1, p1, v4

    .line 182
    .line 183
    add-int/2addr p4, v1

    .line 184
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 185
    .line 186
    .line 187
    return v2
.end method

.method private processBlock192or256([BI[BI)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 4
    .line 5
    const/4 v3, 0x4

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v3, v1, 0x4

    .line 9
    .line 10
    add-int/2addr v3, p2

    .line 11
    invoke-direct {p0, p1, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    aput v3, v2, v1

    .line 16
    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 18
    .line 19
    aget v3, v2, v1

    .line 20
    .line 21
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 22
    .line 23
    aget v4, v4, v1

    .line 24
    .line 25
    xor-int/2addr v3, v4

    .line 26
    aput v3, v2, v1

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 32
    .line 33
    invoke-direct {p0, v2, p1, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 37
    .line 38
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 39
    .line 40
    invoke-direct {p0, p1, p2, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 44
    .line 45
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 46
    .line 47
    const/16 v1, 0x8

    .line 48
    .line 49
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 53
    .line 54
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 55
    .line 56
    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaFLs([I[II)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 60
    .line 61
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 62
    .line 63
    const/16 v2, 0xc

    .line 64
    .line 65
    invoke-direct {p0, p1, p2, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 69
    .line 70
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 71
    .line 72
    const/16 v4, 0x10

    .line 73
    .line 74
    invoke-direct {p0, p1, p2, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 78
    .line 79
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 80
    .line 81
    const/16 v5, 0x14

    .line 82
    .line 83
    invoke-direct {p0, p1, p2, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 87
    .line 88
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 89
    .line 90
    invoke-direct {p0, p1, p2, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaFLs([I[II)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 94
    .line 95
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 96
    .line 97
    const/16 v5, 0x18

    .line 98
    .line 99
    invoke-direct {p0, p1, p2, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 103
    .line 104
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 105
    .line 106
    const/16 v5, 0x1c

    .line 107
    .line 108
    invoke-direct {p0, p1, p2, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 112
    .line 113
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 114
    .line 115
    const/16 v5, 0x20

    .line 116
    .line 117
    invoke-direct {p0, p1, p2, v5}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 121
    .line 122
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 123
    .line 124
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaFLs([I[II)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 128
    .line 129
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 130
    .line 131
    const/16 v1, 0x24

    .line 132
    .line 133
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 137
    .line 138
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 139
    .line 140
    const/16 v1, 0x28

    .line 141
    .line 142
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 146
    .line 147
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 148
    .line 149
    const/16 v1, 0x2c

    .line 150
    .line 151
    invoke-direct {p0, p1, p2, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 155
    .line 156
    const/4 p2, 0x2

    .line 157
    aget v1, p1, p2

    .line 158
    .line 159
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 160
    .line 161
    aget v3, v5, v3

    .line 162
    .line 163
    xor-int/2addr v1, v3

    .line 164
    aput v1, p1, p2

    .line 165
    .line 166
    const/4 p2, 0x3

    .line 167
    aget v3, p1, p2

    .line 168
    .line 169
    const/4 v6, 0x5

    .line 170
    aget v6, v5, v6

    .line 171
    .line 172
    xor-int/2addr v3, v6

    .line 173
    aput v3, p1, p2

    .line 174
    .line 175
    aget v3, p1, v0

    .line 176
    .line 177
    const/4 v6, 0x6

    .line 178
    aget v6, v5, v6

    .line 179
    .line 180
    xor-int/2addr v3, v6

    .line 181
    aput v3, p1, v0

    .line 182
    .line 183
    const/4 v3, 0x1

    .line 184
    aget v6, p1, v3

    .line 185
    .line 186
    const/4 v7, 0x7

    .line 187
    aget v5, v5, v7

    .line 188
    .line 189
    xor-int/2addr v5, v6

    .line 190
    aput v5, p1, v3

    .line 191
    .line 192
    invoke-direct {p0, v1, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 196
    .line 197
    aget p1, p1, p2

    .line 198
    .line 199
    add-int/lit8 p2, p4, 0x4

    .line 200
    .line 201
    invoke-direct {p0, p1, p3, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 205
    .line 206
    aget p1, p1, v0

    .line 207
    .line 208
    add-int/lit8 p2, p4, 0x8

    .line 209
    .line 210
    invoke-direct {p0, p1, p3, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->state:[I

    .line 214
    .line 215
    aget p1, p1, v3

    .line 216
    .line 217
    add-int/2addr p4, v2

    .line 218
    invoke-direct {p0, p1, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->int2bytes(I[BI)V

    .line 219
    .line 220
    .line 221
    return v4
.end method

.method private static rightRotate(II)I
    .locals 1

    ushr-int v0, p0, p1

    rsub-int/lit8 p1, p1, 0x20

    shl-int/2addr p0, p1

    add-int/2addr v0, p0

    return v0
.end method

.method private static roldq(I[II[II)V
    .locals 8

    .line 1
    aget v0, p1, p2

    .line 2
    .line 3
    shl-int/2addr v0, p0

    .line 4
    add-int/lit8 v1, p2, 0x1

    .line 5
    .line 6
    aget v2, p1, v1

    .line 7
    .line 8
    rsub-int/lit8 v3, p0, 0x20

    .line 9
    .line 10
    ushr-int/2addr v2, v3

    .line 11
    or-int/2addr v0, v2

    .line 12
    aput v0, p3, p4

    .line 13
    .line 14
    add-int/lit8 v0, p4, 0x1

    .line 15
    .line 16
    aget v2, p1, v1

    .line 17
    .line 18
    shl-int/2addr v2, p0

    .line 19
    add-int/lit8 v4, p2, 0x2

    .line 20
    .line 21
    aget v5, p1, v4

    .line 22
    .line 23
    ushr-int/2addr v5, v3

    .line 24
    or-int/2addr v2, v5

    .line 25
    aput v2, p3, v0

    .line 26
    .line 27
    add-int/lit8 v2, p4, 0x2

    .line 28
    .line 29
    aget v5, p1, v4

    .line 30
    .line 31
    shl-int/2addr v5, p0

    .line 32
    add-int/lit8 v6, p2, 0x3

    .line 33
    .line 34
    aget v7, p1, v6

    .line 35
    .line 36
    ushr-int/2addr v7, v3

    .line 37
    or-int/2addr v5, v7

    .line 38
    aput v5, p3, v2

    .line 39
    .line 40
    add-int/lit8 v5, p4, 0x3

    .line 41
    .line 42
    aget v7, p1, v6

    .line 43
    .line 44
    shl-int p0, v7, p0

    .line 45
    .line 46
    aget v7, p1, p2

    .line 47
    .line 48
    ushr-int v3, v7, v3

    .line 49
    .line 50
    or-int/2addr p0, v3

    .line 51
    aput p0, p3, v5

    .line 52
    .line 53
    aget p0, p3, p4

    .line 54
    .line 55
    aput p0, p1, p2

    .line 56
    .line 57
    aget p0, p3, v0

    .line 58
    .line 59
    aput p0, p1, v1

    .line 60
    .line 61
    aget p0, p3, v2

    .line 62
    .line 63
    aput p0, p1, v4

    .line 64
    .line 65
    aget p0, p3, v5

    .line 66
    .line 67
    aput p0, p1, v6

    .line 68
    .line 69
    return-void
.end method

.method private static roldqo32(I[II[II)V
    .locals 8

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    aget v1, p1, v0

    .line 4
    .line 5
    add-int/lit8 v2, p0, -0x20

    .line 6
    .line 7
    shl-int/2addr v1, v2

    .line 8
    add-int/lit8 v3, p2, 0x2

    .line 9
    .line 10
    aget v4, p1, v3

    .line 11
    .line 12
    rsub-int/lit8 p0, p0, 0x40

    .line 13
    .line 14
    ushr-int/2addr v4, p0

    .line 15
    or-int/2addr v1, v4

    .line 16
    aput v1, p3, p4

    .line 17
    .line 18
    add-int/lit8 v1, p4, 0x1

    .line 19
    .line 20
    aget v4, p1, v3

    .line 21
    .line 22
    shl-int/2addr v4, v2

    .line 23
    add-int/lit8 v5, p2, 0x3

    .line 24
    .line 25
    aget v6, p1, v5

    .line 26
    .line 27
    ushr-int/2addr v6, p0

    .line 28
    or-int/2addr v4, v6

    .line 29
    aput v4, p3, v1

    .line 30
    .line 31
    add-int/lit8 v4, p4, 0x2

    .line 32
    .line 33
    aget v6, p1, v5

    .line 34
    .line 35
    shl-int/2addr v6, v2

    .line 36
    aget v7, p1, p2

    .line 37
    .line 38
    ushr-int/2addr v7, p0

    .line 39
    or-int/2addr v6, v7

    .line 40
    aput v6, p3, v4

    .line 41
    .line 42
    add-int/lit8 v6, p4, 0x3

    .line 43
    .line 44
    aget v7, p1, p2

    .line 45
    .line 46
    shl-int v2, v7, v2

    .line 47
    .line 48
    aget v7, p1, v0

    .line 49
    .line 50
    ushr-int p0, v7, p0

    .line 51
    .line 52
    or-int/2addr p0, v2

    .line 53
    aput p0, p3, v6

    .line 54
    .line 55
    aget p0, p3, p4

    .line 56
    .line 57
    aput p0, p1, p2

    .line 58
    .line 59
    aget p0, p3, v1

    .line 60
    .line 61
    aput p0, p1, v0

    .line 62
    .line 63
    aget p0, p3, v4

    .line 64
    .line 65
    aput p0, p1, v3

    .line 66
    .line 67
    aget p0, p3, v6

    .line 68
    .line 69
    aput p0, p1, v5

    .line 70
    .line 71
    return-void
.end method

.method private sbox2(I)I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SBOX1:[B

    .line 2
    .line 3
    aget-byte p1, v0, p1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->lRot8(BI)B

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    and-int/lit16 p0, p0, 0xff

    .line 11
    .line 12
    return p0
.end method

.method private sbox3(I)I
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SBOX1:[B

    .line 2
    .line 3
    aget-byte p1, v0, p1

    .line 4
    .line 5
    const/4 v0, 0x7

    .line 6
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->lRot8(BI)B

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    and-int/lit16 p0, p0, 0xff

    .line 11
    .line 12
    return p0
.end method

.method private sbox4(I)I
    .locals 2

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SBOX1:[B

    .line 2
    .line 3
    int-to-byte p1, p1

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->lRot8(BI)B

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    and-int/lit16 p0, p0, 0xff

    .line 10
    .line 11
    aget-byte p0, v0, p0

    .line 12
    .line 13
    and-int/lit16 p0, p0, 0xff

    .line 14
    .line 15
    return p0
.end method

.method private setKey(Z[B)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    new-array v3, v2, [I

    .line 8
    .line 9
    const/4 v4, 0x4

    .line 10
    new-array v5, v4, [I

    .line 11
    .line 12
    new-array v6, v4, [I

    .line 13
    .line 14
    new-array v7, v4, [I

    .line 15
    .line 16
    array-length v8, v1

    .line 17
    const/16 v9, 0x1c

    .line 18
    .line 19
    const/16 v13, 0x20

    .line 20
    .line 21
    const/16 v14, 0x14

    .line 22
    .line 23
    const/16 v15, 0x18

    .line 24
    .line 25
    const/16 v16, 0x7

    .line 26
    .line 27
    const/16 v10, 0xc

    .line 28
    .line 29
    const/16 v17, 0x3

    .line 30
    .line 31
    const/16 v18, 0x2

    .line 32
    .line 33
    const/16 v19, 0x6

    .line 34
    .line 35
    const/16 v20, 0x5

    .line 36
    .line 37
    const/4 v12, 0x0

    .line 38
    const/16 v21, 0x1

    .line 39
    .line 40
    const/16 v11, 0x10

    .line 41
    .line 42
    if-eq v8, v11, :cond_2

    .line 43
    .line 44
    if-eq v8, v15, :cond_1

    .line 45
    .line 46
    if-ne v8, v13, :cond_0

    .line 47
    .line 48
    invoke-direct {v0, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    aput v8, v3, v12

    .line 53
    .line 54
    invoke-direct {v0, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    aput v8, v3, v21

    .line 59
    .line 60
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    aput v8, v3, v18

    .line 65
    .line 66
    invoke-direct {v0, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    aput v8, v3, v17

    .line 71
    .line 72
    invoke-direct {v0, v1, v11}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    aput v8, v3, v4

    .line 77
    .line 78
    invoke-direct {v0, v1, v14}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    aput v8, v3, v20

    .line 83
    .line 84
    invoke-direct {v0, v1, v15}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    aput v8, v3, v19

    .line 89
    .line 90
    invoke-direct {v0, v1, v9}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    aput v1, v3, v16

    .line 95
    .line 96
    iput-boolean v12, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->_keyis128:Z

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const-string v0, "key sizes are only 16/24/32 bytes."

    .line 100
    .line 101
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    invoke-direct {v0, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    aput v8, v3, v12

    .line 110
    .line 111
    invoke-direct {v0, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    aput v8, v3, v21

    .line 116
    .line 117
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 118
    .line 119
    .line 120
    move-result v8

    .line 121
    aput v8, v3, v18

    .line 122
    .line 123
    invoke-direct {v0, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    aput v8, v3, v17

    .line 128
    .line 129
    invoke-direct {v0, v1, v11}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    aput v8, v3, v4

    .line 134
    .line 135
    invoke-direct {v0, v1, v14}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    aput v1, v3, v20

    .line 140
    .line 141
    aget v8, v3, v4

    .line 142
    .line 143
    not-int v8, v8

    .line 144
    aput v8, v3, v19

    .line 145
    .line 146
    not-int v1, v1

    .line 147
    aput v1, v3, v16

    .line 148
    .line 149
    iput-boolean v12, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->_keyis128:Z

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_2
    move/from16 v8, v21

    .line 153
    .line 154
    iput-boolean v8, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->_keyis128:Z

    .line 155
    .line 156
    invoke-direct {v0, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 157
    .line 158
    .line 159
    move-result v21

    .line 160
    aput v21, v3, v12

    .line 161
    .line 162
    invoke-direct {v0, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 163
    .line 164
    .line 165
    move-result v21

    .line 166
    aput v21, v3, v8

    .line 167
    .line 168
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 169
    .line 170
    .line 171
    move-result v8

    .line 172
    aput v8, v3, v18

    .line 173
    .line 174
    invoke-direct {v0, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->bytes2int([BI)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    aput v1, v3, v17

    .line 179
    .line 180
    aput v12, v3, v16

    .line 181
    .line 182
    aput v12, v3, v19

    .line 183
    .line 184
    aput v12, v3, v20

    .line 185
    .line 186
    aput v12, v3, v4

    .line 187
    .line 188
    :goto_0
    move v1, v12

    .line 189
    :goto_1
    if-ge v1, v4, :cond_3

    .line 190
    .line 191
    aget v8, v3, v1

    .line 192
    .line 193
    add-int/lit8 v22, v1, 0x4

    .line 194
    .line 195
    aget v22, v3, v22

    .line 196
    .line 197
    xor-int v8, v8, v22

    .line 198
    .line 199
    aput v8, v5, v1

    .line 200
    .line 201
    add-int/lit8 v1, v1, 0x1

    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_3
    sget-object v1, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SIGMA:[I

    .line 205
    .line 206
    invoke-direct {v0, v5, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 207
    .line 208
    .line 209
    move v1, v12

    .line 210
    :goto_2
    if-ge v1, v4, :cond_4

    .line 211
    .line 212
    aget v8, v5, v1

    .line 213
    .line 214
    aget v22, v3, v1

    .line 215
    .line 216
    xor-int v8, v8, v22

    .line 217
    .line 218
    aput v8, v5, v1

    .line 219
    .line 220
    add-int/lit8 v1, v1, 0x1

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_4
    sget-object v1, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SIGMA:[I

    .line 224
    .line 225
    invoke-direct {v0, v5, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 226
    .line 227
    .line 228
    iget-boolean v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->_keyis128:Z

    .line 229
    .line 230
    move/from16 v22, v11

    .line 231
    .line 232
    const/16 v11, 0x1e

    .line 233
    .line 234
    const/16 v8, 0x11

    .line 235
    .line 236
    const/16 v9, 0xf

    .line 237
    .line 238
    if-eqz v1, :cond_6

    .line 239
    .line 240
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 241
    .line 242
    const/16 v6, 0x13

    .line 243
    .line 244
    const/16 v23, 0x12

    .line 245
    .line 246
    if-eqz p1, :cond_5

    .line 247
    .line 248
    aget v16, v3, v12

    .line 249
    .line 250
    aput v16, v1, v12

    .line 251
    .line 252
    const/16 v21, 0x1

    .line 253
    .line 254
    aget v16, v3, v21

    .line 255
    .line 256
    aput v16, v1, v21

    .line 257
    .line 258
    aget v16, v3, v18

    .line 259
    .line 260
    aput v16, v1, v18

    .line 261
    .line 262
    aget v16, v3, v17

    .line 263
    .line 264
    aput v16, v1, v17

    .line 265
    .line 266
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 267
    .line 268
    invoke-static {v9, v3, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 269
    .line 270
    .line 271
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 272
    .line 273
    invoke-static {v11, v3, v12, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 274
    .line 275
    .line 276
    invoke-static {v9, v3, v12, v7, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 277
    .line 278
    .line 279
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 280
    .line 281
    aget v10, v7, v18

    .line 282
    .line 283
    aput v10, v1, v23

    .line 284
    .line 285
    aget v10, v7, v17

    .line 286
    .line 287
    aput v10, v1, v6

    .line 288
    .line 289
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 290
    .line 291
    invoke-static {v8, v3, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 292
    .line 293
    .line 294
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 295
    .line 296
    invoke-static {v8, v3, v12, v1, v15}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 297
    .line 298
    .line 299
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 300
    .line 301
    invoke-static {v8, v3, v12, v1, v13}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 302
    .line 303
    .line 304
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 305
    .line 306
    aget v3, v5, v12

    .line 307
    .line 308
    aput v3, v1, v12

    .line 309
    .line 310
    const/16 v21, 0x1

    .line 311
    .line 312
    aget v3, v5, v21

    .line 313
    .line 314
    aput v3, v1, v21

    .line 315
    .line 316
    aget v3, v5, v18

    .line 317
    .line 318
    aput v3, v1, v18

    .line 319
    .line 320
    aget v3, v5, v17

    .line 321
    .line 322
    aput v3, v1, v17

    .line 323
    .line 324
    invoke-static {v9, v5, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 325
    .line 326
    .line 327
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 328
    .line 329
    invoke-static {v9, v5, v12, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 330
    .line 331
    .line 332
    invoke-static {v9, v5, v12, v7, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 333
    .line 334
    .line 335
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 336
    .line 337
    aget v2, v7, v12

    .line 338
    .line 339
    aput v2, v1, v22

    .line 340
    .line 341
    const/16 v21, 0x1

    .line 342
    .line 343
    aget v2, v7, v21

    .line 344
    .line 345
    aput v2, v1, v8

    .line 346
    .line 347
    invoke-static {v9, v5, v12, v1, v14}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 348
    .line 349
    .line 350
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 351
    .line 352
    const/16 v2, 0x1c

    .line 353
    .line 354
    const/16 v3, 0x22

    .line 355
    .line 356
    invoke-static {v3, v5, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 357
    .line 358
    .line 359
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 360
    .line 361
    invoke-static {v8, v5, v12, v0, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 362
    .line 363
    .line 364
    return-void

    .line 365
    :cond_5
    const/16 v21, 0x1

    .line 366
    .line 367
    aget v24, v3, v12

    .line 368
    .line 369
    aput v24, v1, v4

    .line 370
    .line 371
    aget v24, v3, v21

    .line 372
    .line 373
    aput v24, v1, v20

    .line 374
    .line 375
    aget v20, v3, v18

    .line 376
    .line 377
    aput v20, v1, v19

    .line 378
    .line 379
    aget v19, v3, v17

    .line 380
    .line 381
    aput v19, v1, v16

    .line 382
    .line 383
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 384
    .line 385
    move/from16 v24, v6

    .line 386
    .line 387
    const/16 v6, 0x1c

    .line 388
    .line 389
    invoke-static {v9, v3, v12, v1, v6}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 390
    .line 391
    .line 392
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 393
    .line 394
    invoke-static {v11, v3, v12, v1, v14}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 395
    .line 396
    .line 397
    invoke-static {v9, v3, v12, v7, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 398
    .line 399
    .line 400
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 401
    .line 402
    aget v6, v7, v12

    .line 403
    .line 404
    aput v6, v1, v22

    .line 405
    .line 406
    const/16 v21, 0x1

    .line 407
    .line 408
    aget v6, v7, v21

    .line 409
    .line 410
    aput v6, v1, v8

    .line 411
    .line 412
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 413
    .line 414
    invoke-static {v8, v3, v12, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 415
    .line 416
    .line 417
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 418
    .line 419
    invoke-static {v8, v3, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 420
    .line 421
    .line 422
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 423
    .line 424
    invoke-static {v8, v3, v12, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 425
    .line 426
    .line 427
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 428
    .line 429
    aget v2, v5, v12

    .line 430
    .line 431
    const/16 v3, 0x22

    .line 432
    .line 433
    aput v2, v1, v3

    .line 434
    .line 435
    const/16 v2, 0x23

    .line 436
    .line 437
    const/16 v21, 0x1

    .line 438
    .line 439
    aget v3, v5, v21

    .line 440
    .line 441
    aput v3, v1, v2

    .line 442
    .line 443
    aget v2, v5, v18

    .line 444
    .line 445
    aput v2, v1, v13

    .line 446
    .line 447
    const/16 v2, 0x21

    .line 448
    .line 449
    aget v3, v5, v17

    .line 450
    .line 451
    aput v3, v1, v2

    .line 452
    .line 453
    invoke-static {v9, v5, v12, v1, v15}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 454
    .line 455
    .line 456
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 457
    .line 458
    invoke-static {v9, v5, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 459
    .line 460
    .line 461
    invoke-static {v9, v5, v12, v7, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 462
    .line 463
    .line 464
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 465
    .line 466
    aget v2, v7, v18

    .line 467
    .line 468
    aput v2, v1, v23

    .line 469
    .line 470
    aget v2, v7, v17

    .line 471
    .line 472
    aput v2, v1, v24

    .line 473
    .line 474
    invoke-static {v9, v5, v12, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 475
    .line 476
    .line 477
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 478
    .line 479
    const/16 v3, 0x22

    .line 480
    .line 481
    invoke-static {v3, v5, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldqo32(I[II[II)V

    .line 482
    .line 483
    .line 484
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 485
    .line 486
    invoke-static {v8, v5, v12, v0, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 487
    .line 488
    .line 489
    return-void

    .line 490
    :cond_6
    move v1, v12

    .line 491
    :goto_3
    if-ge v1, v4, :cond_7

    .line 492
    .line 493
    aget v7, v5, v1

    .line 494
    .line 495
    add-int/lit8 v23, v1, 0x4

    .line 496
    .line 497
    aget v23, v3, v23

    .line 498
    .line 499
    xor-int v7, v7, v23

    .line 500
    .line 501
    aput v7, v6, v1

    .line 502
    .line 503
    add-int/lit8 v1, v1, 0x1

    .line 504
    .line 505
    goto :goto_3

    .line 506
    :cond_7
    sget-object v1, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->SIGMA:[I

    .line 507
    .line 508
    invoke-direct {v0, v6, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->camelliaF2([I[II)V

    .line 509
    .line 510
    .line 511
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 512
    .line 513
    const/16 v7, 0x24

    .line 514
    .line 515
    const/16 v10, 0x2c

    .line 516
    .line 517
    const/16 v14, 0x2d

    .line 518
    .line 519
    if-eqz p1, :cond_8

    .line 520
    .line 521
    aget v16, v3, v12

    .line 522
    .line 523
    aput v16, v1, v12

    .line 524
    .line 525
    const/16 v21, 0x1

    .line 526
    .line 527
    aget v16, v3, v21

    .line 528
    .line 529
    aput v16, v1, v21

    .line 530
    .line 531
    aget v16, v3, v18

    .line 532
    .line 533
    aput v16, v1, v18

    .line 534
    .line 535
    aget v16, v3, v17

    .line 536
    .line 537
    aput v16, v1, v17

    .line 538
    .line 539
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 540
    .line 541
    move/from16 v2, v22

    .line 542
    .line 543
    invoke-static {v14, v3, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 544
    .line 545
    .line 546
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 547
    .line 548
    invoke-static {v9, v3, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 549
    .line 550
    .line 551
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 552
    .line 553
    invoke-static {v8, v3, v12, v1, v13}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 554
    .line 555
    .line 556
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 557
    .line 558
    const/16 v2, 0x22

    .line 559
    .line 560
    invoke-static {v2, v3, v12, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 561
    .line 562
    .line 563
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 564
    .line 565
    invoke-static {v9, v3, v4, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 566
    .line 567
    .line 568
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 569
    .line 570
    invoke-static {v9, v3, v4, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 571
    .line 572
    .line 573
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 574
    .line 575
    invoke-static {v11, v3, v4, v1, v15}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 576
    .line 577
    .line 578
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 579
    .line 580
    invoke-static {v2, v3, v4, v1, v7}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 581
    .line 582
    .line 583
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 584
    .line 585
    const/16 v2, 0x8

    .line 586
    .line 587
    invoke-static {v9, v5, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 588
    .line 589
    .line 590
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 591
    .line 592
    const/16 v3, 0x14

    .line 593
    .line 594
    invoke-static {v11, v5, v12, v1, v3}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 595
    .line 596
    .line 597
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 598
    .line 599
    const/16 v21, 0x1

    .line 600
    .line 601
    aget v3, v5, v21

    .line 602
    .line 603
    aput v3, v1, v2

    .line 604
    .line 605
    const/16 v2, 0x9

    .line 606
    .line 607
    aget v3, v5, v18

    .line 608
    .line 609
    aput v3, v1, v2

    .line 610
    .line 611
    const/16 v2, 0xa

    .line 612
    .line 613
    aget v3, v5, v17

    .line 614
    .line 615
    aput v3, v1, v2

    .line 616
    .line 617
    const/16 v2, 0xb

    .line 618
    .line 619
    aget v3, v5, v12

    .line 620
    .line 621
    aput v3, v1, v2

    .line 622
    .line 623
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 624
    .line 625
    const/16 v2, 0x28

    .line 626
    .line 627
    const/16 v3, 0x31

    .line 628
    .line 629
    invoke-static {v3, v5, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 630
    .line 631
    .line 632
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 633
    .line 634
    aget v2, v6, v12

    .line 635
    .line 636
    aput v2, v1, v12

    .line 637
    .line 638
    const/16 v21, 0x1

    .line 639
    .line 640
    aget v2, v6, v21

    .line 641
    .line 642
    aput v2, v1, v21

    .line 643
    .line 644
    aget v2, v6, v18

    .line 645
    .line 646
    aput v2, v1, v18

    .line 647
    .line 648
    aget v2, v6, v17

    .line 649
    .line 650
    aput v2, v1, v17

    .line 651
    .line 652
    const/16 v2, 0xc

    .line 653
    .line 654
    invoke-static {v11, v6, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 655
    .line 656
    .line 657
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 658
    .line 659
    const/16 v2, 0x1c

    .line 660
    .line 661
    invoke-static {v11, v6, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldq(I[II[II)V

    .line 662
    .line 663
    .line 664
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 665
    .line 666
    const/16 v1, 0x33

    .line 667
    .line 668
    invoke-static {v1, v6, v12, v0, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 669
    .line 670
    .line 671
    return-void

    .line 672
    :cond_8
    aget v2, v3, v12

    .line 673
    .line 674
    aput v2, v1, v4

    .line 675
    .line 676
    const/16 v21, 0x1

    .line 677
    .line 678
    aget v2, v3, v21

    .line 679
    .line 680
    aput v2, v1, v20

    .line 681
    .line 682
    aget v2, v3, v18

    .line 683
    .line 684
    aput v2, v1, v19

    .line 685
    .line 686
    aget v2, v3, v17

    .line 687
    .line 688
    aput v2, v1, v16

    .line 689
    .line 690
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 691
    .line 692
    const/16 v2, 0x1c

    .line 693
    .line 694
    invoke-static {v14, v3, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldqo32(I[II[II)V

    .line 695
    .line 696
    .line 697
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 698
    .line 699
    invoke-static {v9, v3, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 700
    .line 701
    .line 702
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 703
    .line 704
    const/16 v2, 0xc

    .line 705
    .line 706
    invoke-static {v8, v3, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 707
    .line 708
    .line 709
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 710
    .line 711
    const/16 v2, 0x22

    .line 712
    .line 713
    invoke-static {v2, v3, v12, v1, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldqo32(I[II[II)V

    .line 714
    .line 715
    .line 716
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 717
    .line 718
    const/16 v8, 0x28

    .line 719
    .line 720
    invoke-static {v9, v3, v4, v1, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 721
    .line 722
    .line 723
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 724
    .line 725
    const/16 v8, 0x8

    .line 726
    .line 727
    invoke-static {v9, v3, v4, v1, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 728
    .line 729
    .line 730
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 731
    .line 732
    move/from16 p2, v10

    .line 733
    .line 734
    const/16 v10, 0x14

    .line 735
    .line 736
    invoke-static {v11, v3, v4, v1, v10}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 737
    .line 738
    .line 739
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 740
    .line 741
    invoke-static {v2, v3, v4, v1, v8}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldqo32(I[II[II)V

    .line 742
    .line 743
    .line 744
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 745
    .line 746
    invoke-static {v9, v5, v12, v1, v7}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 747
    .line 748
    .line 749
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 750
    .line 751
    invoke-static {v11, v5, v12, v1, v15}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 752
    .line 753
    .line 754
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->ke:[I

    .line 755
    .line 756
    const/16 v21, 0x1

    .line 757
    .line 758
    aget v2, v5, v21

    .line 759
    .line 760
    aput v2, v1, v18

    .line 761
    .line 762
    aget v2, v5, v18

    .line 763
    .line 764
    aput v2, v1, v17

    .line 765
    .line 766
    aget v2, v5, v17

    .line 767
    .line 768
    aput v2, v1, v12

    .line 769
    .line 770
    aget v2, v5, v12

    .line 771
    .line 772
    aput v2, v1, v21

    .line 773
    .line 774
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 775
    .line 776
    const/16 v3, 0x31

    .line 777
    .line 778
    invoke-static {v3, v5, v12, v1, v4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldqo32(I[II[II)V

    .line 779
    .line 780
    .line 781
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 782
    .line 783
    const/16 v2, 0x2e

    .line 784
    .line 785
    aget v3, v6, v12

    .line 786
    .line 787
    aput v3, v1, v2

    .line 788
    .line 789
    const/16 v2, 0x2f

    .line 790
    .line 791
    aget v3, v6, v21

    .line 792
    .line 793
    aput v3, v1, v2

    .line 794
    .line 795
    aget v2, v6, v18

    .line 796
    .line 797
    aput v2, v1, p2

    .line 798
    .line 799
    aget v2, v6, v17

    .line 800
    .line 801
    aput v2, v1, v14

    .line 802
    .line 803
    invoke-static {v11, v6, v12, v1, v13}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 804
    .line 805
    .line 806
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->subkey:[I

    .line 807
    .line 808
    const/16 v2, 0x10

    .line 809
    .line 810
    invoke-static {v11, v6, v12, v1, v2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->decroldq(I[II[II)V

    .line 811
    .line 812
    .line 813
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->kw:[I

    .line 814
    .line 815
    const/16 v1, 0x33

    .line 816
    .line 817
    invoke-static {v1, v6, v12, v0, v12}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->roldqo32(I[II[II)V

    .line 818
    .line 819
    .line 820
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Camellia"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x10

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
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->setKey(Z[B)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->initialized:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "only simple KeyParameter expected."

    .line 19
    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->initialized:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x10

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x10

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->_keyis128:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->processBlock128([BI[BI)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/CamelliaLightEngine;->processBlock192or256([BI[BI)I

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
    const-string p0, "Camellia is not initialized"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method
