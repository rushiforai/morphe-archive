.class public Lorg/spongycastle/crypto/engines/DESEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field protected static final BLOCK_SIZE:I = 0x8

.field private static final SP1:[I

.field private static final SP2:[I

.field private static final SP3:[I

.field private static final SP4:[I

.field private static final SP5:[I

.field private static final SP6:[I

.field private static final SP7:[I

.field private static final SP8:[I

.field private static final bigbyte:[I

.field private static final bytebit:[S

.field private static final pc1:[B

.field private static final pc2:[B

.field private static final totrot:[B


# instance fields
.field private workingKey:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [S

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->bytebit:[S

    .line 9
    .line 10
    const/16 v0, 0x18

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->bigbyte:[I

    .line 18
    .line 19
    const/16 v0, 0x38

    .line 20
    .line 21
    new-array v0, v0, [B

    .line 22
    .line 23
    fill-array-data v0, :array_2

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->pc1:[B

    .line 27
    .line 28
    const/16 v0, 0x10

    .line 29
    .line 30
    new-array v0, v0, [B

    .line 31
    .line 32
    fill-array-data v0, :array_3

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->totrot:[B

    .line 36
    .line 37
    const/16 v0, 0x30

    .line 38
    .line 39
    new-array v0, v0, [B

    .line 40
    .line 41
    fill-array-data v0, :array_4

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->pc2:[B

    .line 45
    .line 46
    const/16 v0, 0x40

    .line 47
    .line 48
    new-array v1, v0, [I

    .line 49
    .line 50
    fill-array-data v1, :array_5

    .line 51
    .line 52
    .line 53
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP1:[I

    .line 54
    .line 55
    new-array v1, v0, [I

    .line 56
    .line 57
    fill-array-data v1, :array_6

    .line 58
    .line 59
    .line 60
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP2:[I

    .line 61
    .line 62
    new-array v1, v0, [I

    .line 63
    .line 64
    fill-array-data v1, :array_7

    .line 65
    .line 66
    .line 67
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP3:[I

    .line 68
    .line 69
    new-array v1, v0, [I

    .line 70
    .line 71
    fill-array-data v1, :array_8

    .line 72
    .line 73
    .line 74
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP4:[I

    .line 75
    .line 76
    new-array v1, v0, [I

    .line 77
    .line 78
    fill-array-data v1, :array_9

    .line 79
    .line 80
    .line 81
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP5:[I

    .line 82
    .line 83
    new-array v1, v0, [I

    .line 84
    .line 85
    fill-array-data v1, :array_a

    .line 86
    .line 87
    .line 88
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP6:[I

    .line 89
    .line 90
    new-array v1, v0, [I

    .line 91
    .line 92
    fill-array-data v1, :array_b

    .line 93
    .line 94
    .line 95
    sput-object v1, Lorg/spongycastle/crypto/engines/DESEngine;->SP7:[I

    .line 96
    .line 97
    new-array v0, v0, [I

    .line 98
    .line 99
    fill-array-data v0, :array_c

    .line 100
    .line 101
    .line 102
    sput-object v0, Lorg/spongycastle/crypto/engines/DESEngine;->SP8:[I

    .line 103
    .line 104
    return-void

    .line 105
    :array_0
    .array-data 2
        0x80s
        0x40s
        0x20s
        0x10s
        0x8s
        0x4s
        0x2s
        0x1s
    .end array-data

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
    :array_1
    .array-data 4
        0x800000
        0x400000
        0x200000
        0x100000
        0x80000
        0x40000
        0x20000
        0x10000
        0x8000
        0x4000
        0x2000
        0x1000
        0x800
        0x400
        0x200
        0x100
        0x80
        0x40
        0x20
        0x10
        0x8
        0x4
        0x2
        0x1
    .end array-data

    .line 118
    .line 119
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
    .line 168
    .line 169
    :array_2
    .array-data 1
        0x38t
        0x30t
        0x28t
        0x20t
        0x18t
        0x10t
        0x8t
        0x0t
        0x39t
        0x31t
        0x29t
        0x21t
        0x19t
        0x11t
        0x9t
        0x1t
        0x3at
        0x32t
        0x2at
        0x22t
        0x1at
        0x12t
        0xat
        0x2t
        0x3bt
        0x33t
        0x2bt
        0x23t
        0x3et
        0x36t
        0x2et
        0x26t
        0x1et
        0x16t
        0xet
        0x6t
        0x3dt
        0x35t
        0x2dt
        0x25t
        0x1dt
        0x15t
        0xdt
        0x5t
        0x3ct
        0x34t
        0x2ct
        0x24t
        0x1ct
        0x14t
        0xct
        0x4t
        0x1bt
        0x13t
        0xbt
        0x3t
    .end array-data

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
    :array_3
    .array-data 1
        0x1t
        0x2t
        0x4t
        0x6t
        0x8t
        0xat
        0xct
        0xet
        0xft
        0x11t
        0x13t
        0x15t
        0x17t
        0x19t
        0x1bt
        0x1ct
    .end array-data

    .line 202
    .line 203
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
    :array_4
    .array-data 1
        0xdt
        0x10t
        0xat
        0x17t
        0x0t
        0x4t
        0x2t
        0x1bt
        0xet
        0x5t
        0x14t
        0x9t
        0x16t
        0x12t
        0xbt
        0x3t
        0x19t
        0x7t
        0xft
        0x6t
        0x1at
        0x13t
        0xct
        0x1t
        0x28t
        0x33t
        0x1et
        0x24t
        0x2et
        0x36t
        0x1dt
        0x27t
        0x32t
        0x2ct
        0x20t
        0x2ft
        0x2bt
        0x30t
        0x26t
        0x37t
        0x21t
        0x34t
        0x2dt
        0x29t
        0x31t
        0x23t
        0x1ct
        0x1ft
    .end array-data

    .line 214
    .line 215
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
    :array_5
    .array-data 4
        0x1010400
        0x0
        0x10000
        0x1010404
        0x1010004
        0x10404
        0x4
        0x10000
        0x400
        0x1010400
        0x1010404
        0x400
        0x1000404
        0x1010004
        0x1000000
        0x4
        0x404
        0x1000400
        0x1000400
        0x10400
        0x10400
        0x1010000
        0x1010000
        0x1000404
        0x10004
        0x1000004
        0x1000004
        0x10004
        0x0
        0x404
        0x10404
        0x1000000
        0x10000
        0x1010404
        0x4
        0x1010000
        0x1010400
        0x1000000
        0x1000000
        0x400
        0x1010004
        0x10000
        0x10400
        0x1000004
        0x400
        0x4
        0x1000404
        0x10404
        0x1010404
        0x10004
        0x1010000
        0x1000404
        0x1000004
        0x404
        0x10404
        0x1010400
        0x404
        0x1000400
        0x1000400
        0x0
        0x10004
        0x10400
        0x0
        0x1010004
    .end array-data

    :array_6
    .array-data 4
        -0x7fef7fe0
        -0x7fff8000
        0x8000
        0x108020
        0x100000
        0x20
        -0x7fefffe0
        -0x7fff7fe0
        -0x7fffffe0
        -0x7fef7fe0
        -0x7fef8000
        -0x80000000
        -0x7fff8000
        0x100000
        0x20
        -0x7fefffe0
        0x108000
        0x100020
        -0x7fff7fe0
        0x0
        -0x80000000
        0x8000
        0x108020
        -0x7ff00000
        0x100020
        -0x7fffffe0
        0x0
        0x108000
        0x8020
        -0x7fef8000
        -0x7ff00000
        0x8020
        0x0
        0x108020
        -0x7fefffe0
        0x100000
        -0x7fff7fe0
        -0x7ff00000
        -0x7fef8000
        0x8000
        -0x7ff00000
        -0x7fff8000
        0x20
        -0x7fef7fe0
        0x108020
        0x20
        0x8000
        -0x80000000
        0x8020
        -0x7fef8000
        0x100000
        -0x7fffffe0
        0x100020
        -0x7fff7fe0
        -0x7fffffe0
        0x100020
        0x108000
        0x0
        -0x7fff8000
        0x8020
        -0x80000000
        -0x7fefffe0
        -0x7fef7fe0
        0x108000
    .end array-data

    :array_7
    .array-data 4
        0x208
        0x8020200
        0x0
        0x8020008
        0x8000200
        0x0
        0x20208
        0x8000200
        0x20008
        0x8000008
        0x8000008
        0x20000
        0x8020208
        0x20008
        0x8020000
        0x208
        0x8000000
        0x8
        0x8020200
        0x200
        0x20200
        0x8020000
        0x8020008
        0x20208
        0x8000208
        0x20200
        0x20000
        0x8000208
        0x8
        0x8020208
        0x200
        0x8000000
        0x8020200
        0x8000000
        0x20008
        0x208
        0x20000
        0x8020200
        0x8000200
        0x0
        0x200
        0x20008
        0x8020208
        0x8000200
        0x8000008
        0x200
        0x0
        0x8020008
        0x8000208
        0x20000
        0x8000000
        0x8020208
        0x8
        0x20208
        0x20200
        0x8000008
        0x8020000
        0x8000208
        0x208
        0x8020000
        0x20208
        0x8
        0x8020008
        0x20200
    .end array-data

    :array_8
    .array-data 4
        0x802001
        0x2081
        0x2081
        0x80
        0x802080
        0x800081
        0x800001
        0x2001
        0x0
        0x802000
        0x802000
        0x802081
        0x81
        0x0
        0x800080
        0x800001
        0x1
        0x2000
        0x800000
        0x802001
        0x80
        0x800000
        0x2001
        0x2080
        0x800081
        0x1
        0x2080
        0x800080
        0x2000
        0x802080
        0x802081
        0x81
        0x800080
        0x800001
        0x802000
        0x802081
        0x81
        0x0
        0x0
        0x802000
        0x2080
        0x800080
        0x800081
        0x1
        0x802001
        0x2081
        0x2081
        0x80
        0x802081
        0x81
        0x1
        0x2000
        0x800001
        0x2001
        0x802080
        0x800081
        0x2001
        0x2080
        0x800000
        0x802001
        0x80
        0x800000
        0x2000
        0x802080
    .end array-data

    :array_9
    .array-data 4
        0x100
        0x2080100
        0x2080000
        0x42000100    # 32.000977f
        0x80000
        0x100
        0x40000000    # 2.0f
        0x2080000
        0x40080100
        0x80000
        0x2000100
        0x40080100
        0x42000100    # 32.000977f
        0x42080000    # 34.0f
        0x80100
        0x40000000    # 2.0f
        0x2000000
        0x40080000    # 2.125f
        0x40080000    # 2.125f
        0x0
        0x40000100    # 2.000061f
        0x42080100    # 34.000977f
        0x42080100    # 34.000977f
        0x2000100
        0x42080000    # 34.0f
        0x40000100    # 2.000061f
        0x0
        0x42000000    # 32.0f
        0x2080100
        0x2000000
        0x42000000    # 32.0f
        0x80100
        0x80000
        0x42000100    # 32.000977f
        0x100
        0x2000000
        0x40000000    # 2.0f
        0x2080000
        0x42000100    # 32.000977f
        0x40080100
        0x2000100
        0x40000000    # 2.0f
        0x42080000    # 34.0f
        0x2080100
        0x40080100
        0x100
        0x2000000
        0x42080000    # 34.0f
        0x42080100    # 34.000977f
        0x80100
        0x42000000    # 32.0f
        0x42080100    # 34.000977f
        0x2080000
        0x0
        0x40080000    # 2.125f
        0x42000000    # 32.0f
        0x80100
        0x2000100
        0x40000100    # 2.000061f
        0x80000
        0x0
        0x40080000    # 2.125f
        0x2080100
        0x40000100    # 2.000061f
    .end array-data

    :array_a
    .array-data 4
        0x20000010
        0x20400000
        0x4000
        0x20404010
        0x20400000
        0x10
        0x20404010
        0x400000
        0x20004000
        0x404010
        0x400000
        0x20000010
        0x400010
        0x20004000
        0x20000000
        0x4010
        0x0
        0x400010
        0x20004010
        0x4000
        0x404000
        0x20004010
        0x10
        0x20400010
        0x20400010
        0x0
        0x404010
        0x20404000
        0x4010
        0x404000
        0x20404000
        0x20000000
        0x20004000
        0x10
        0x20400010
        0x404000
        0x20404010
        0x400000
        0x4010
        0x20000010
        0x400000
        0x20004000
        0x20000000
        0x4010
        0x20000010
        0x20404010
        0x404000
        0x20400000
        0x404010
        0x20404000
        0x0
        0x20400010
        0x10
        0x4000
        0x20400000
        0x404010
        0x4000
        0x400010
        0x20004010
        0x0
        0x20404000
        0x20000000
        0x400010
        0x20004010
    .end array-data

    :array_b
    .array-data 4
        0x200000
        0x4200002
        0x4000802    # 1.5050005E-36f
        0x0
        0x800
        0x4000802    # 1.5050005E-36f
        0x200802
        0x4200800
        0x4200802
        0x200000
        0x0
        0x4000002
        0x2
        0x4000000
        0x4200002
        0x802
        0x4000800    # 1.5050001E-36f
        0x200802
        0x200002
        0x4000800    # 1.5050001E-36f
        0x4000002
        0x4200000
        0x4200800
        0x200002
        0x4200000
        0x800
        0x802
        0x4200802
        0x200800
        0x2
        0x4000000
        0x200800
        0x4000000
        0x200800
        0x200000
        0x4000802    # 1.5050005E-36f
        0x4000802    # 1.5050005E-36f
        0x4200002
        0x4200002
        0x2
        0x200002
        0x4000000
        0x4000800    # 1.5050001E-36f
        0x200000
        0x4200800
        0x802
        0x200802
        0x4200800
        0x802
        0x4000002
        0x4200802
        0x4200000
        0x200800
        0x0
        0x2
        0x4200802
        0x0
        0x200802
        0x4200000
        0x800
        0x4000002
        0x4000800    # 1.5050001E-36f
        0x800
        0x200002
    .end array-data

    :array_c
    .array-data 4
        0x10001040
        0x1000
        0x40000
        0x10041040
        0x10000000
        0x10001040
        0x40
        0x10000000
        0x40040
        0x10040000
        0x10041040
        0x41000
        0x10041000
        0x41040
        0x1000
        0x40
        0x10040000
        0x10000040
        0x10001000
        0x1040
        0x41000
        0x40040
        0x10040040
        0x10041000
        0x1040
        0x0
        0x0
        0x10040040
        0x10000040
        0x10001000
        0x41040
        0x40000
        0x41040
        0x40000
        0x10041000
        0x1000
        0x40
        0x10040040
        0x1000
        0x41040
        0x10001000
        0x40
        0x10000040
        0x10040000
        0x10040040
        0x10000000
        0x40000
        0x10001040
        0x0
        0x10041040
        0x40040
        0x10000040
        0x10040000
        0x10001000
        0x10001040
        0x0
        0x10041040
        0x41000
        0x41000
        0x1040
        0x1040
        0x40040
        0x10000000
        0x10041000
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESEngine;->workingKey:[I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public desFunc([I[BI[BI)V
    .locals 20

    .line 1
    aget-byte v0, p2, p3

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    shl-int/lit8 v0, v0, 0x18

    .line 6
    .line 7
    add-int/lit8 v1, p3, 0x1

    .line 8
    .line 9
    aget-byte v1, p2, v1

    .line 10
    .line 11
    and-int/lit16 v1, v1, 0xff

    .line 12
    .line 13
    shl-int/lit8 v1, v1, 0x10

    .line 14
    .line 15
    or-int/2addr v0, v1

    .line 16
    add-int/lit8 v1, p3, 0x2

    .line 17
    .line 18
    aget-byte v1, p2, v1

    .line 19
    .line 20
    and-int/lit16 v1, v1, 0xff

    .line 21
    .line 22
    const/16 v2, 0x8

    .line 23
    .line 24
    shl-int/2addr v1, v2

    .line 25
    or-int/2addr v0, v1

    .line 26
    add-int/lit8 v1, p3, 0x3

    .line 27
    .line 28
    aget-byte v1, p2, v1

    .line 29
    .line 30
    and-int/lit16 v1, v1, 0xff

    .line 31
    .line 32
    or-int/2addr v0, v1

    .line 33
    add-int/lit8 v1, p3, 0x4

    .line 34
    .line 35
    aget-byte v1, p2, v1

    .line 36
    .line 37
    and-int/lit16 v1, v1, 0xff

    .line 38
    .line 39
    shl-int/lit8 v1, v1, 0x18

    .line 40
    .line 41
    add-int/lit8 v3, p3, 0x5

    .line 42
    .line 43
    aget-byte v3, p2, v3

    .line 44
    .line 45
    and-int/lit16 v3, v3, 0xff

    .line 46
    .line 47
    shl-int/lit8 v3, v3, 0x10

    .line 48
    .line 49
    or-int/2addr v1, v3

    .line 50
    add-int/lit8 v3, p3, 0x6

    .line 51
    .line 52
    aget-byte v3, p2, v3

    .line 53
    .line 54
    and-int/lit16 v3, v3, 0xff

    .line 55
    .line 56
    shl-int/2addr v3, v2

    .line 57
    or-int/2addr v1, v3

    .line 58
    add-int/lit8 v3, p3, 0x7

    .line 59
    .line 60
    aget-byte v3, p2, v3

    .line 61
    .line 62
    and-int/lit16 v3, v3, 0xff

    .line 63
    .line 64
    or-int/2addr v1, v3

    .line 65
    ushr-int/lit8 v3, v0, 0x4

    .line 66
    .line 67
    xor-int/2addr v3, v1

    .line 68
    const v4, 0xf0f0f0f

    .line 69
    .line 70
    .line 71
    and-int/2addr v3, v4

    .line 72
    xor-int/2addr v1, v3

    .line 73
    shl-int/lit8 v3, v3, 0x4

    .line 74
    .line 75
    xor-int/2addr v0, v3

    .line 76
    ushr-int/lit8 v3, v0, 0x10

    .line 77
    .line 78
    xor-int/2addr v3, v1

    .line 79
    const v5, 0xffff

    .line 80
    .line 81
    .line 82
    and-int/2addr v3, v5

    .line 83
    xor-int/2addr v1, v3

    .line 84
    shl-int/lit8 v3, v3, 0x10

    .line 85
    .line 86
    xor-int/2addr v0, v3

    .line 87
    ushr-int/lit8 v3, v1, 0x2

    .line 88
    .line 89
    xor-int/2addr v3, v0

    .line 90
    const v6, 0x33333333

    .line 91
    .line 92
    .line 93
    and-int/2addr v3, v6

    .line 94
    xor-int/2addr v0, v3

    .line 95
    shl-int/lit8 v3, v3, 0x2

    .line 96
    .line 97
    xor-int/2addr v1, v3

    .line 98
    ushr-int/lit8 v3, v1, 0x8

    .line 99
    .line 100
    xor-int/2addr v3, v0

    .line 101
    const v7, 0xff00ff

    .line 102
    .line 103
    .line 104
    and-int/2addr v3, v7

    .line 105
    xor-int/2addr v0, v3

    .line 106
    shl-int/2addr v3, v2

    .line 107
    xor-int/2addr v1, v3

    .line 108
    shl-int/lit8 v3, v1, 0x1

    .line 109
    .line 110
    ushr-int/lit8 v1, v1, 0x1f

    .line 111
    .line 112
    and-int/lit8 v1, v1, 0x1

    .line 113
    .line 114
    or-int/2addr v1, v3

    .line 115
    xor-int v3, v0, v1

    .line 116
    .line 117
    const v8, -0x55555556

    .line 118
    .line 119
    .line 120
    and-int/2addr v3, v8

    .line 121
    xor-int/2addr v0, v3

    .line 122
    xor-int/2addr v1, v3

    .line 123
    shl-int/lit8 v3, v0, 0x1

    .line 124
    .line 125
    ushr-int/lit8 v0, v0, 0x1f

    .line 126
    .line 127
    and-int/lit8 v0, v0, 0x1

    .line 128
    .line 129
    or-int/2addr v0, v3

    .line 130
    const/4 v3, 0x0

    .line 131
    :goto_0
    if-ge v3, v2, :cond_0

    .line 132
    .line 133
    shl-int/lit8 v9, v1, 0x1c

    .line 134
    .line 135
    ushr-int/lit8 v10, v1, 0x4

    .line 136
    .line 137
    or-int/2addr v9, v10

    .line 138
    mul-int/lit8 v10, v3, 0x4

    .line 139
    .line 140
    aget v11, p1, v10

    .line 141
    .line 142
    xor-int/2addr v9, v11

    .line 143
    sget-object v11, Lorg/spongycastle/crypto/engines/DESEngine;->SP7:[I

    .line 144
    .line 145
    and-int/lit8 v12, v9, 0x3f

    .line 146
    .line 147
    aget v12, v11, v12

    .line 148
    .line 149
    sget-object v13, Lorg/spongycastle/crypto/engines/DESEngine;->SP5:[I

    .line 150
    .line 151
    ushr-int/lit8 v14, v9, 0x8

    .line 152
    .line 153
    and-int/lit8 v14, v14, 0x3f

    .line 154
    .line 155
    aget v14, v13, v14

    .line 156
    .line 157
    or-int/2addr v12, v14

    .line 158
    sget-object v14, Lorg/spongycastle/crypto/engines/DESEngine;->SP3:[I

    .line 159
    .line 160
    ushr-int/lit8 v15, v9, 0x10

    .line 161
    .line 162
    and-int/lit8 v15, v15, 0x3f

    .line 163
    .line 164
    aget v15, v14, v15

    .line 165
    .line 166
    or-int/2addr v12, v15

    .line 167
    sget-object v15, Lorg/spongycastle/crypto/engines/DESEngine;->SP1:[I

    .line 168
    .line 169
    ushr-int/lit8 v9, v9, 0x18

    .line 170
    .line 171
    and-int/lit8 v9, v9, 0x3f

    .line 172
    .line 173
    aget v9, v15, v9

    .line 174
    .line 175
    or-int/2addr v9, v12

    .line 176
    add-int/lit8 v12, v10, 0x1

    .line 177
    .line 178
    aget v12, p1, v12

    .line 179
    .line 180
    xor-int/2addr v12, v1

    .line 181
    sget-object v16, Lorg/spongycastle/crypto/engines/DESEngine;->SP8:[I

    .line 182
    .line 183
    and-int/lit8 v17, v12, 0x3f

    .line 184
    .line 185
    aget v17, v16, v17

    .line 186
    .line 187
    or-int v9, v9, v17

    .line 188
    .line 189
    sget-object v17, Lorg/spongycastle/crypto/engines/DESEngine;->SP6:[I

    .line 190
    .line 191
    ushr-int/lit8 v18, v12, 0x8

    .line 192
    .line 193
    and-int/lit8 v18, v18, 0x3f

    .line 194
    .line 195
    aget v18, v17, v18

    .line 196
    .line 197
    or-int v9, v9, v18

    .line 198
    .line 199
    sget-object v18, Lorg/spongycastle/crypto/engines/DESEngine;->SP4:[I

    .line 200
    .line 201
    ushr-int/lit8 v19, v12, 0x10

    .line 202
    .line 203
    and-int/lit8 v19, v19, 0x3f

    .line 204
    .line 205
    aget v19, v18, v19

    .line 206
    .line 207
    or-int v9, v9, v19

    .line 208
    .line 209
    sget-object v19, Lorg/spongycastle/crypto/engines/DESEngine;->SP2:[I

    .line 210
    .line 211
    ushr-int/lit8 v12, v12, 0x18

    .line 212
    .line 213
    and-int/lit8 v12, v12, 0x3f

    .line 214
    .line 215
    aget v12, v19, v12

    .line 216
    .line 217
    or-int/2addr v9, v12

    .line 218
    xor-int/2addr v0, v9

    .line 219
    shl-int/lit8 v9, v0, 0x1c

    .line 220
    .line 221
    ushr-int/lit8 v12, v0, 0x4

    .line 222
    .line 223
    or-int/2addr v9, v12

    .line 224
    add-int/lit8 v12, v10, 0x2

    .line 225
    .line 226
    aget v12, p1, v12

    .line 227
    .line 228
    xor-int/2addr v9, v12

    .line 229
    and-int/lit8 v12, v9, 0x3f

    .line 230
    .line 231
    aget v11, v11, v12

    .line 232
    .line 233
    ushr-int/lit8 v12, v9, 0x8

    .line 234
    .line 235
    and-int/lit8 v12, v12, 0x3f

    .line 236
    .line 237
    aget v12, v13, v12

    .line 238
    .line 239
    or-int/2addr v11, v12

    .line 240
    ushr-int/lit8 v12, v9, 0x10

    .line 241
    .line 242
    and-int/lit8 v12, v12, 0x3f

    .line 243
    .line 244
    aget v12, v14, v12

    .line 245
    .line 246
    or-int/2addr v11, v12

    .line 247
    ushr-int/lit8 v9, v9, 0x18

    .line 248
    .line 249
    and-int/lit8 v9, v9, 0x3f

    .line 250
    .line 251
    aget v9, v15, v9

    .line 252
    .line 253
    or-int/2addr v9, v11

    .line 254
    add-int/lit8 v10, v10, 0x3

    .line 255
    .line 256
    aget v10, p1, v10

    .line 257
    .line 258
    xor-int/2addr v10, v0

    .line 259
    and-int/lit8 v11, v10, 0x3f

    .line 260
    .line 261
    aget v11, v16, v11

    .line 262
    .line 263
    or-int/2addr v9, v11

    .line 264
    ushr-int/lit8 v11, v10, 0x8

    .line 265
    .line 266
    and-int/lit8 v11, v11, 0x3f

    .line 267
    .line 268
    aget v11, v17, v11

    .line 269
    .line 270
    or-int/2addr v9, v11

    .line 271
    ushr-int/lit8 v11, v10, 0x10

    .line 272
    .line 273
    and-int/lit8 v11, v11, 0x3f

    .line 274
    .line 275
    aget v11, v18, v11

    .line 276
    .line 277
    or-int/2addr v9, v11

    .line 278
    ushr-int/lit8 v10, v10, 0x18

    .line 279
    .line 280
    and-int/lit8 v10, v10, 0x3f

    .line 281
    .line 282
    aget v10, v19, v10

    .line 283
    .line 284
    or-int/2addr v9, v10

    .line 285
    xor-int/2addr v1, v9

    .line 286
    add-int/lit8 v3, v3, 0x1

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :cond_0
    shl-int/lit8 v3, v1, 0x1f

    .line 291
    .line 292
    ushr-int/lit8 v1, v1, 0x1

    .line 293
    .line 294
    or-int/2addr v1, v3

    .line 295
    xor-int v3, v0, v1

    .line 296
    .line 297
    and-int/2addr v3, v8

    .line 298
    xor-int/2addr v0, v3

    .line 299
    xor-int/2addr v1, v3

    .line 300
    shl-int/lit8 v3, v0, 0x1f

    .line 301
    .line 302
    ushr-int/lit8 v0, v0, 0x1

    .line 303
    .line 304
    or-int/2addr v0, v3

    .line 305
    ushr-int/lit8 v3, v0, 0x8

    .line 306
    .line 307
    xor-int/2addr v3, v1

    .line 308
    and-int/2addr v3, v7

    .line 309
    xor-int/2addr v1, v3

    .line 310
    shl-int/lit8 v2, v3, 0x8

    .line 311
    .line 312
    xor-int/2addr v0, v2

    .line 313
    ushr-int/lit8 v2, v0, 0x2

    .line 314
    .line 315
    xor-int/2addr v2, v1

    .line 316
    and-int/2addr v2, v6

    .line 317
    xor-int/2addr v1, v2

    .line 318
    shl-int/lit8 v2, v2, 0x2

    .line 319
    .line 320
    xor-int/2addr v0, v2

    .line 321
    ushr-int/lit8 v2, v1, 0x10

    .line 322
    .line 323
    xor-int/2addr v2, v0

    .line 324
    and-int/2addr v2, v5

    .line 325
    xor-int/2addr v0, v2

    .line 326
    shl-int/lit8 v2, v2, 0x10

    .line 327
    .line 328
    xor-int/2addr v1, v2

    .line 329
    ushr-int/lit8 v2, v1, 0x4

    .line 330
    .line 331
    xor-int/2addr v2, v0

    .line 332
    and-int/2addr v2, v4

    .line 333
    xor-int/2addr v0, v2

    .line 334
    shl-int/lit8 v2, v2, 0x4

    .line 335
    .line 336
    xor-int/2addr v1, v2

    .line 337
    ushr-int/lit8 v2, v1, 0x18

    .line 338
    .line 339
    and-int/lit16 v2, v2, 0xff

    .line 340
    .line 341
    int-to-byte v2, v2

    .line 342
    aput-byte v2, p4, p5

    .line 343
    .line 344
    add-int/lit8 v2, p5, 0x1

    .line 345
    .line 346
    ushr-int/lit8 v3, v1, 0x10

    .line 347
    .line 348
    and-int/lit16 v3, v3, 0xff

    .line 349
    .line 350
    int-to-byte v3, v3

    .line 351
    aput-byte v3, p4, v2

    .line 352
    .line 353
    add-int/lit8 v2, p5, 0x2

    .line 354
    .line 355
    ushr-int/lit8 v3, v1, 0x8

    .line 356
    .line 357
    and-int/lit16 v3, v3, 0xff

    .line 358
    .line 359
    int-to-byte v3, v3

    .line 360
    aput-byte v3, p4, v2

    .line 361
    .line 362
    add-int/lit8 v2, p5, 0x3

    .line 363
    .line 364
    and-int/lit16 v1, v1, 0xff

    .line 365
    .line 366
    int-to-byte v1, v1

    .line 367
    aput-byte v1, p4, v2

    .line 368
    .line 369
    add-int/lit8 v1, p5, 0x4

    .line 370
    .line 371
    ushr-int/lit8 v2, v0, 0x18

    .line 372
    .line 373
    and-int/lit16 v2, v2, 0xff

    .line 374
    .line 375
    int-to-byte v2, v2

    .line 376
    aput-byte v2, p4, v1

    .line 377
    .line 378
    add-int/lit8 v1, p5, 0x5

    .line 379
    .line 380
    ushr-int/lit8 v2, v0, 0x10

    .line 381
    .line 382
    and-int/lit16 v2, v2, 0xff

    .line 383
    .line 384
    int-to-byte v2, v2

    .line 385
    aput-byte v2, p4, v1

    .line 386
    .line 387
    add-int/lit8 v1, p5, 0x6

    .line 388
    .line 389
    ushr-int/lit8 v2, v0, 0x8

    .line 390
    .line 391
    and-int/lit16 v2, v2, 0xff

    .line 392
    .line 393
    int-to-byte v2, v2

    .line 394
    aput-byte v2, p4, v1

    .line 395
    .line 396
    add-int/lit8 v1, p5, 0x7

    .line 397
    .line 398
    and-int/lit16 v0, v0, 0xff

    .line 399
    .line 400
    int-to-byte v0, v0

    .line 401
    aput-byte v0, p4, v1

    .line 402
    .line 403
    return-void
.end method

.method public generateWorkingKey(Z[B)[I
    .locals 12

    .line 1
    const/16 p0, 0x20

    .line 2
    .line 3
    new-array v0, p0, [I

    .line 4
    .line 5
    const/16 v1, 0x38

    .line 6
    .line 7
    new-array v2, v1, [Z

    .line 8
    .line 9
    new-array v3, v1, [Z

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    move v5, v4

    .line 13
    :goto_0
    const/4 v6, 0x1

    .line 14
    if-ge v5, v1, :cond_1

    .line 15
    .line 16
    sget-object v7, Lorg/spongycastle/crypto/engines/DESEngine;->pc1:[B

    .line 17
    .line 18
    aget-byte v7, v7, v5

    .line 19
    .line 20
    ushr-int/lit8 v8, v7, 0x3

    .line 21
    .line 22
    aget-byte v8, p2, v8

    .line 23
    .line 24
    sget-object v9, Lorg/spongycastle/crypto/engines/DESEngine;->bytebit:[S

    .line 25
    .line 26
    and-int/lit8 v7, v7, 0x7

    .line 27
    .line 28
    aget-short v7, v9, v7

    .line 29
    .line 30
    and-int/2addr v7, v8

    .line 31
    if-eqz v7, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    move v6, v4

    .line 35
    :goto_1
    aput-boolean v6, v2, v5

    .line 36
    .line 37
    add-int/lit8 v5, v5, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move p2, v4

    .line 41
    :goto_2
    const/16 v5, 0x10

    .line 42
    .line 43
    if-ge p2, v5, :cond_a

    .line 44
    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    shl-int/lit8 v5, p2, 0x1

    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_2
    rsub-int/lit8 v5, p2, 0xf

    .line 51
    .line 52
    shl-int/2addr v5, v6

    .line 53
    :goto_3
    add-int/lit8 v7, v5, 0x1

    .line 54
    .line 55
    aput v4, v0, v7

    .line 56
    .line 57
    aput v4, v0, v5

    .line 58
    .line 59
    move v8, v4

    .line 60
    :goto_4
    const/16 v9, 0x1c

    .line 61
    .line 62
    if-ge v8, v9, :cond_4

    .line 63
    .line 64
    sget-object v10, Lorg/spongycastle/crypto/engines/DESEngine;->totrot:[B

    .line 65
    .line 66
    aget-byte v10, v10, p2

    .line 67
    .line 68
    add-int/2addr v10, v8

    .line 69
    if-ge v10, v9, :cond_3

    .line 70
    .line 71
    aget-boolean v9, v2, v10

    .line 72
    .line 73
    aput-boolean v9, v3, v8

    .line 74
    .line 75
    goto :goto_5

    .line 76
    :cond_3
    add-int/lit8 v10, v10, -0x1c

    .line 77
    .line 78
    aget-boolean v9, v2, v10

    .line 79
    .line 80
    aput-boolean v9, v3, v8

    .line 81
    .line 82
    :goto_5
    add-int/lit8 v8, v8, 0x1

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_4
    :goto_6
    if-ge v9, v1, :cond_6

    .line 86
    .line 87
    sget-object v8, Lorg/spongycastle/crypto/engines/DESEngine;->totrot:[B

    .line 88
    .line 89
    aget-byte v8, v8, p2

    .line 90
    .line 91
    add-int/2addr v8, v9

    .line 92
    if-ge v8, v1, :cond_5

    .line 93
    .line 94
    aget-boolean v8, v2, v8

    .line 95
    .line 96
    aput-boolean v8, v3, v9

    .line 97
    .line 98
    goto :goto_7

    .line 99
    :cond_5
    add-int/lit8 v8, v8, -0x1c

    .line 100
    .line 101
    aget-boolean v8, v2, v8

    .line 102
    .line 103
    aput-boolean v8, v3, v9

    .line 104
    .line 105
    :goto_7
    add-int/lit8 v9, v9, 0x1

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :cond_6
    move v8, v4

    .line 109
    :goto_8
    const/16 v9, 0x18

    .line 110
    .line 111
    if-ge v8, v9, :cond_9

    .line 112
    .line 113
    sget-object v9, Lorg/spongycastle/crypto/engines/DESEngine;->pc2:[B

    .line 114
    .line 115
    aget-byte v10, v9, v8

    .line 116
    .line 117
    aget-boolean v10, v3, v10

    .line 118
    .line 119
    if-eqz v10, :cond_7

    .line 120
    .line 121
    aget v10, v0, v5

    .line 122
    .line 123
    sget-object v11, Lorg/spongycastle/crypto/engines/DESEngine;->bigbyte:[I

    .line 124
    .line 125
    aget v11, v11, v8

    .line 126
    .line 127
    or-int/2addr v10, v11

    .line 128
    aput v10, v0, v5

    .line 129
    .line 130
    :cond_7
    add-int/lit8 v10, v8, 0x18

    .line 131
    .line 132
    aget-byte v9, v9, v10

    .line 133
    .line 134
    aget-boolean v9, v3, v9

    .line 135
    .line 136
    if-eqz v9, :cond_8

    .line 137
    .line 138
    aget v9, v0, v7

    .line 139
    .line 140
    sget-object v10, Lorg/spongycastle/crypto/engines/DESEngine;->bigbyte:[I

    .line 141
    .line 142
    aget v10, v10, v8

    .line 143
    .line 144
    or-int/2addr v9, v10

    .line 145
    aput v9, v0, v7

    .line 146
    .line 147
    :cond_8
    add-int/lit8 v8, v8, 0x1

    .line 148
    .line 149
    goto :goto_8

    .line 150
    :cond_9
    add-int/lit8 p2, p2, 0x1

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_a
    :goto_9
    if-eq v4, p0, :cond_b

    .line 154
    .line 155
    aget p1, v0, v4

    .line 156
    .line 157
    add-int/lit8 p2, v4, 0x1

    .line 158
    .line 159
    aget v1, v0, p2

    .line 160
    .line 161
    const/high16 v2, 0xfc0000

    .line 162
    .line 163
    and-int v3, p1, v2

    .line 164
    .line 165
    shl-int/lit8 v3, v3, 0x6

    .line 166
    .line 167
    and-int/lit16 v6, p1, 0xfc0

    .line 168
    .line 169
    shl-int/lit8 v6, v6, 0xa

    .line 170
    .line 171
    or-int/2addr v3, v6

    .line 172
    and-int/2addr v2, v1

    .line 173
    ushr-int/lit8 v2, v2, 0xa

    .line 174
    .line 175
    or-int/2addr v2, v3

    .line 176
    and-int/lit16 v3, v1, 0xfc0

    .line 177
    .line 178
    ushr-int/lit8 v3, v3, 0x6

    .line 179
    .line 180
    or-int/2addr v2, v3

    .line 181
    aput v2, v0, v4

    .line 182
    .line 183
    const v2, 0x3f000

    .line 184
    .line 185
    .line 186
    and-int v3, p1, v2

    .line 187
    .line 188
    shl-int/lit8 v3, v3, 0xc

    .line 189
    .line 190
    and-int/lit8 p1, p1, 0x3f

    .line 191
    .line 192
    shl-int/2addr p1, v5

    .line 193
    or-int/2addr p1, v3

    .line 194
    and-int/2addr v2, v1

    .line 195
    ushr-int/lit8 v2, v2, 0x4

    .line 196
    .line 197
    or-int/2addr p1, v2

    .line 198
    and-int/lit8 v1, v1, 0x3f

    .line 199
    .line 200
    or-int/2addr p1, v1

    .line 201
    aput p1, v0, p2

    .line 202
    .line 203
    add-int/lit8 v4, v4, 0x2

    .line 204
    .line 205
    goto :goto_9

    .line 206
    :cond_b
    return-object v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DES"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 2

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v0, v0

    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-gt v0, v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/DESEngine;->generateWorkingKey(Z[B)[I

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESEngine;->workingKey:[I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "DES key too long - should be 8 bytes"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "invalid parameter passed to DES init - "

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 7

    .line 1
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESEngine;->workingKey:[I

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    if-eqz v1, :cond_2

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x8

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_1

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x8

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_0

    .line 15
    .line 16
    move-object v0, p0

    .line 17
    move-object v2, p1

    .line 18
    move v3, p2

    .line 19
    move-object v4, p3

    .line 20
    move v5, p4

    .line 21
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x8

    .line 25
    .line 26
    return p0

    .line 27
    :cond_0
    const-string p0, "output buffer too short"

    .line 28
    .line 29
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return v6

    .line 33
    :cond_1
    const-string p0, "input buffer too short"

    .line 34
    .line 35
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return v6

    .line 39
    :cond_2
    const-string p0, "DES engine not initialised"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v6
.end method

.method public reset()V
    .locals 0

    return-void
.end method
