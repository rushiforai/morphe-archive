.class public Lorg/spongycastle/crypto/engines/SkipjackEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field static final BLOCK_SIZE:I = 0x8

.field static ftable:[S


# instance fields
.field private encrypting:Z

.field private key0:[I

.field private key1:[I

.field private key2:[I

.field private key3:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v0, v0, [S

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->ftable:[S

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 2
        0xa3s
        0xd7s
        0x9s
        0x83s
        0xf8s
        0x48s
        0xf6s
        0xf4s
        0xb3s
        0x21s
        0x15s
        0x78s
        0x99s
        0xb1s
        0xafs
        0xf9s
        0xe7s
        0x2ds
        0x4ds
        0x8as
        0xces
        0x4cs
        0xcas
        0x2es
        0x52s
        0x95s
        0xd9s
        0x1es
        0x4es
        0x38s
        0x44s
        0x28s
        0xas
        0xdfs
        0x2s
        0xa0s
        0x17s
        0xf1s
        0x60s
        0x68s
        0x12s
        0xb7s
        0x7as
        0xc3s
        0xe9s
        0xfas
        0x3ds
        0x53s
        0x96s
        0x84s
        0x6bs
        0xbas
        0xf2s
        0x63s
        0x9as
        0x19s
        0x7cs
        0xaes
        0xe5s
        0xf5s
        0xf7s
        0x16s
        0x6as
        0xa2s
        0x39s
        0xb6s
        0x7bs
        0xfs
        0xc1s
        0x93s
        0x81s
        0x1bs
        0xees
        0xb4s
        0x1as
        0xeas
        0xd0s
        0x91s
        0x2fs
        0xb8s
        0x55s
        0xb9s
        0xdas
        0x85s
        0x3fs
        0x41s
        0xbfs
        0xe0s
        0x5as
        0x58s
        0x80s
        0x5fs
        0x66s
        0xbs
        0xd8s
        0x90s
        0x35s
        0xd5s
        0xc0s
        0xa7s
        0x33s
        0x6s
        0x65s
        0x69s
        0x45s
        0x0s
        0x94s
        0x56s
        0x6ds
        0x98s
        0x9bs
        0x76s
        0x97s
        0xfcs
        0xb2s
        0xc2s
        0xb0s
        0xfes
        0xdbs
        0x20s
        0xe1s
        0xebs
        0xd6s
        0xe4s
        0xdds
        0x47s
        0x4as
        0x1ds
        0x42s
        0xeds
        0x9es
        0x6es
        0x49s
        0x3cs
        0xcds
        0x43s
        0x27s
        0xd2s
        0x7s
        0xd4s
        0xdes
        0xc7s
        0x67s
        0x18s
        0x89s
        0xcbs
        0x30s
        0x1fs
        0x8ds
        0xc6s
        0x8fs
        0xaas
        0xc8s
        0x74s
        0xdcs
        0xc9s
        0x5ds
        0x5cs
        0x31s
        0xa4s
        0x70s
        0x88s
        0x61s
        0x2cs
        0x9fs
        0xds
        0x2bs
        0x87s
        0x50s
        0x82s
        0x54s
        0x64s
        0x26s
        0x7ds
        0x3s
        0x40s
        0x34s
        0x4bs
        0x1cs
        0x73s
        0xd1s
        0xc4s
        0xfds
        0x3bs
        0xccs
        0xfbs
        0x7fs
        0xabs
        0xe6s
        0x3es
        0x5bs
        0xa5s
        0xads
        0x4s
        0x23s
        0x9cs
        0x14s
        0x51s
        0x22s
        0xf0s
        0x29s
        0x79s
        0x71s
        0x7es
        0xffs
        0x8cs
        0xes
        0xe2s
        0xcs
        0xefs
        0xbcs
        0x72s
        0x75s
        0x6fs
        0x37s
        0xa1s
        0xecs
        0xd3s
        0x8es
        0x62s
        0x8bs
        0x86s
        0x10s
        0xe8s
        0x8s
        0x77s
        0x11s
        0xbes
        0x92s
        0x4fs
        0x24s
        0xc5s
        0x32s
        0x36s
        0x9ds
        0xcfs
        0xf3s
        0xa6s
        0xbbs
        0xacs
        0x5es
        0x6cs
        0xa9s
        0x13s
        0x57s
        0x25s
        0xb5s
        0xe3s
        0xbds
        0xa8s
        0x3as
        0x1s
        0x5s
        0x59s
        0x2as
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(II)I
    .locals 3

    .line 1
    shr-int/lit8 v0, p2, 0x8

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    and-int/lit16 p2, p2, 0xff

    .line 6
    .line 7
    sget-object v1, Lorg/spongycastle/crypto/engines/SkipjackEngine;->ftable:[S

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key0:[I

    .line 10
    .line 11
    aget v2, v2, p1

    .line 12
    .line 13
    xor-int/2addr v2, p2

    .line 14
    aget-short v2, v1, v2

    .line 15
    .line 16
    xor-int/2addr v0, v2

    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key1:[I

    .line 18
    .line 19
    aget v2, v2, p1

    .line 20
    .line 21
    xor-int/2addr v2, v0

    .line 22
    aget-short v2, v1, v2

    .line 23
    .line 24
    xor-int/2addr p2, v2

    .line 25
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key2:[I

    .line 26
    .line 27
    aget v2, v2, p1

    .line 28
    .line 29
    xor-int/2addr v2, p2

    .line 30
    aget-short v2, v1, v2

    .line 31
    .line 32
    xor-int/2addr v0, v2

    .line 33
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key3:[I

    .line 34
    .line 35
    aget p0, p0, p1

    .line 36
    .line 37
    xor-int/2addr p0, v0

    .line 38
    aget-short p0, v1, p0

    .line 39
    .line 40
    xor-int/2addr p0, p2

    .line 41
    shl-int/lit8 p1, v0, 0x8

    .line 42
    .line 43
    add-int/2addr p1, p0

    .line 44
    return p1
.end method

.method private h(II)I
    .locals 3

    .line 1
    and-int/lit16 v0, p2, 0xff

    .line 2
    .line 3
    shr-int/lit8 p2, p2, 0x8

    .line 4
    .line 5
    and-int/lit16 p2, p2, 0xff

    .line 6
    .line 7
    sget-object v1, Lorg/spongycastle/crypto/engines/SkipjackEngine;->ftable:[S

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key3:[I

    .line 10
    .line 11
    aget v2, v2, p1

    .line 12
    .line 13
    xor-int/2addr v2, p2

    .line 14
    aget-short v2, v1, v2

    .line 15
    .line 16
    xor-int/2addr v0, v2

    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key2:[I

    .line 18
    .line 19
    aget v2, v2, p1

    .line 20
    .line 21
    xor-int/2addr v2, v0

    .line 22
    aget-short v2, v1, v2

    .line 23
    .line 24
    xor-int/2addr p2, v2

    .line 25
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key1:[I

    .line 26
    .line 27
    aget v2, v2, p1

    .line 28
    .line 29
    xor-int/2addr v2, p2

    .line 30
    aget-short v2, v1, v2

    .line 31
    .line 32
    xor-int/2addr v0, v2

    .line 33
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key0:[I

    .line 34
    .line 35
    aget p0, p0, p1

    .line 36
    .line 37
    xor-int/2addr p0, v0

    .line 38
    aget-short p0, v1, p0

    .line 39
    .line 40
    xor-int/2addr p0, p2

    .line 41
    shl-int/lit8 p0, p0, 0x8

    .line 42
    .line 43
    add-int/2addr p0, v0

    .line 44
    return p0
.end method


# virtual methods
.method public decryptBlock([BI[BI)I
    .locals 9

    .line 1
    aget-byte v0, p1, p2

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    shl-int/2addr v0, v1

    .line 6
    add-int/lit8 v2, p2, 0x1

    .line 7
    .line 8
    aget-byte v2, p1, v2

    .line 9
    .line 10
    and-int/lit16 v2, v2, 0xff

    .line 11
    .line 12
    add-int/2addr v0, v2

    .line 13
    add-int/lit8 v2, p2, 0x2

    .line 14
    .line 15
    aget-byte v2, p1, v2

    .line 16
    .line 17
    shl-int/2addr v2, v1

    .line 18
    add-int/lit8 v3, p2, 0x3

    .line 19
    .line 20
    aget-byte v3, p1, v3

    .line 21
    .line 22
    and-int/lit16 v3, v3, 0xff

    .line 23
    .line 24
    add-int/2addr v2, v3

    .line 25
    add-int/lit8 v3, p2, 0x4

    .line 26
    .line 27
    aget-byte v3, p1, v3

    .line 28
    .line 29
    shl-int/2addr v3, v1

    .line 30
    add-int/lit8 v4, p2, 0x5

    .line 31
    .line 32
    aget-byte v4, p1, v4

    .line 33
    .line 34
    and-int/lit16 v4, v4, 0xff

    .line 35
    .line 36
    add-int/2addr v3, v4

    .line 37
    add-int/lit8 v4, p2, 0x6

    .line 38
    .line 39
    aget-byte v4, p1, v4

    .line 40
    .line 41
    shl-int/2addr v4, v1

    .line 42
    add-int/lit8 p2, p2, 0x7

    .line 43
    .line 44
    aget-byte p1, p1, p2

    .line 45
    .line 46
    and-int/lit16 p1, p1, 0xff

    .line 47
    .line 48
    add-int/2addr v4, p1

    .line 49
    const/16 p1, 0x1f

    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    move v5, p2

    .line 53
    :goto_0
    const/4 v6, 0x2

    .line 54
    if-ge v5, v6, :cond_2

    .line 55
    .line 56
    move v6, p2

    .line 57
    :goto_1
    if-ge v6, v1, :cond_0

    .line 58
    .line 59
    invoke-direct {p0, p1, v2}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->h(II)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    xor-int/2addr v3, v2

    .line 64
    add-int/lit8 v7, p1, 0x1

    .line 65
    .line 66
    xor-int/2addr v3, v7

    .line 67
    add-int/lit8 p1, p1, -0x1

    .line 68
    .line 69
    add-int/lit8 v6, v6, 0x1

    .line 70
    .line 71
    move v8, v4

    .line 72
    move v4, v0

    .line 73
    move v0, v2

    .line 74
    move v2, v3

    .line 75
    move v3, v8

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    move v6, p2

    .line 78
    :goto_2
    if-ge v6, v1, :cond_1

    .line 79
    .line 80
    xor-int/2addr v0, v2

    .line 81
    add-int/lit8 v7, p1, 0x1

    .line 82
    .line 83
    xor-int/2addr v0, v7

    .line 84
    invoke-direct {p0, p1, v2}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->h(II)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/lit8 p1, p1, -0x1

    .line 89
    .line 90
    add-int/lit8 v6, v6, 0x1

    .line 91
    .line 92
    move v8, v4

    .line 93
    move v4, v0

    .line 94
    move v0, v2

    .line 95
    move v2, v3

    .line 96
    move v3, v8

    .line 97
    goto :goto_2

    .line 98
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    shr-int/lit8 p0, v0, 0x8

    .line 102
    .line 103
    int-to-byte p0, p0

    .line 104
    aput-byte p0, p3, p4

    .line 105
    .line 106
    add-int/lit8 p0, p4, 0x1

    .line 107
    .line 108
    int-to-byte p1, v0

    .line 109
    aput-byte p1, p3, p0

    .line 110
    .line 111
    add-int/lit8 p0, p4, 0x2

    .line 112
    .line 113
    shr-int/lit8 p1, v2, 0x8

    .line 114
    .line 115
    int-to-byte p1, p1

    .line 116
    aput-byte p1, p3, p0

    .line 117
    .line 118
    add-int/lit8 p0, p4, 0x3

    .line 119
    .line 120
    int-to-byte p1, v2

    .line 121
    aput-byte p1, p3, p0

    .line 122
    .line 123
    add-int/lit8 p0, p4, 0x4

    .line 124
    .line 125
    shr-int/lit8 p1, v3, 0x8

    .line 126
    .line 127
    int-to-byte p1, p1

    .line 128
    aput-byte p1, p3, p0

    .line 129
    .line 130
    add-int/lit8 p0, p4, 0x5

    .line 131
    .line 132
    int-to-byte p1, v3

    .line 133
    aput-byte p1, p3, p0

    .line 134
    .line 135
    add-int/lit8 p0, p4, 0x6

    .line 136
    .line 137
    shr-int/lit8 p1, v4, 0x8

    .line 138
    .line 139
    int-to-byte p1, p1

    .line 140
    aput-byte p1, p3, p0

    .line 141
    .line 142
    add-int/lit8 p4, p4, 0x7

    .line 143
    .line 144
    int-to-byte p0, v4

    .line 145
    aput-byte p0, p3, p4

    .line 146
    .line 147
    return v1
.end method

.method public encryptBlock([BI[BI)I
    .locals 9

    .line 1
    aget-byte v0, p1, p2

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    shl-int/2addr v0, v1

    .line 6
    add-int/lit8 v2, p2, 0x1

    .line 7
    .line 8
    aget-byte v2, p1, v2

    .line 9
    .line 10
    and-int/lit16 v2, v2, 0xff

    .line 11
    .line 12
    add-int/2addr v0, v2

    .line 13
    add-int/lit8 v2, p2, 0x2

    .line 14
    .line 15
    aget-byte v2, p1, v2

    .line 16
    .line 17
    shl-int/2addr v2, v1

    .line 18
    add-int/lit8 v3, p2, 0x3

    .line 19
    .line 20
    aget-byte v3, p1, v3

    .line 21
    .line 22
    and-int/lit16 v3, v3, 0xff

    .line 23
    .line 24
    add-int/2addr v2, v3

    .line 25
    add-int/lit8 v3, p2, 0x4

    .line 26
    .line 27
    aget-byte v3, p1, v3

    .line 28
    .line 29
    shl-int/2addr v3, v1

    .line 30
    add-int/lit8 v4, p2, 0x5

    .line 31
    .line 32
    aget-byte v4, p1, v4

    .line 33
    .line 34
    and-int/lit16 v4, v4, 0xff

    .line 35
    .line 36
    add-int/2addr v3, v4

    .line 37
    add-int/lit8 v4, p2, 0x6

    .line 38
    .line 39
    aget-byte v4, p1, v4

    .line 40
    .line 41
    shl-int/2addr v4, v1

    .line 42
    add-int/lit8 p2, p2, 0x7

    .line 43
    .line 44
    aget-byte p1, p1, p2

    .line 45
    .line 46
    and-int/lit16 p1, p1, 0xff

    .line 47
    .line 48
    add-int/2addr v4, p1

    .line 49
    const/4 p1, 0x0

    .line 50
    move p2, p1

    .line 51
    move v5, p2

    .line 52
    :goto_0
    const/4 v6, 0x2

    .line 53
    if-ge p2, v6, :cond_2

    .line 54
    .line 55
    move v6, p1

    .line 56
    :goto_1
    if-ge v6, v1, :cond_0

    .line 57
    .line 58
    invoke-direct {p0, v5, v0}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->g(II)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    xor-int/2addr v4, v0

    .line 63
    add-int/lit8 v5, v5, 0x1

    .line 64
    .line 65
    xor-int/2addr v4, v5

    .line 66
    add-int/lit8 v6, v6, 0x1

    .line 67
    .line 68
    move v8, v2

    .line 69
    move v2, v0

    .line 70
    move v0, v4

    .line 71
    move v4, v3

    .line 72
    move v3, v8

    .line 73
    goto :goto_1

    .line 74
    :cond_0
    move v6, p1

    .line 75
    :goto_2
    if-ge v6, v1, :cond_1

    .line 76
    .line 77
    xor-int/2addr v2, v0

    .line 78
    add-int/lit8 v7, v5, 0x1

    .line 79
    .line 80
    xor-int/2addr v2, v7

    .line 81
    invoke-direct {p0, v5, v0}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->g(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/lit8 v6, v6, 0x1

    .line 86
    .line 87
    move v5, v2

    .line 88
    move v2, v0

    .line 89
    move v0, v4

    .line 90
    move v4, v3

    .line 91
    move v3, v5

    .line 92
    move v5, v7

    .line 93
    goto :goto_2

    .line 94
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    shr-int/lit8 p0, v0, 0x8

    .line 98
    .line 99
    int-to-byte p0, p0

    .line 100
    aput-byte p0, p3, p4

    .line 101
    .line 102
    add-int/lit8 p0, p4, 0x1

    .line 103
    .line 104
    int-to-byte p1, v0

    .line 105
    aput-byte p1, p3, p0

    .line 106
    .line 107
    add-int/lit8 p0, p4, 0x2

    .line 108
    .line 109
    shr-int/lit8 p1, v2, 0x8

    .line 110
    .line 111
    int-to-byte p1, p1

    .line 112
    aput-byte p1, p3, p0

    .line 113
    .line 114
    add-int/lit8 p0, p4, 0x3

    .line 115
    .line 116
    int-to-byte p1, v2

    .line 117
    aput-byte p1, p3, p0

    .line 118
    .line 119
    add-int/lit8 p0, p4, 0x4

    .line 120
    .line 121
    shr-int/lit8 p1, v3, 0x8

    .line 122
    .line 123
    int-to-byte p1, p1

    .line 124
    aput-byte p1, p3, p0

    .line 125
    .line 126
    add-int/lit8 p0, p4, 0x5

    .line 127
    .line 128
    int-to-byte p1, v3

    .line 129
    aput-byte p1, p3, p0

    .line 130
    .line 131
    add-int/lit8 p0, p4, 0x6

    .line 132
    .line 133
    shr-int/lit8 p1, v4, 0x8

    .line 134
    .line 135
    int-to-byte p1, p1

    .line 136
    aput-byte p1, p3, p0

    .line 137
    .line 138
    add-int/lit8 p4, p4, 0x7

    .line 139
    .line 140
    int-to-byte p0, v4

    .line 141
    aput-byte p0, p3, p4

    .line 142
    .line 143
    return v1
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "SKIPJACK"

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
    .locals 4

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
    move-result-object p2

    .line 11
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->encrypting:Z

    .line 12
    .line 13
    const/16 p1, 0x20

    .line 14
    .line 15
    new-array v0, p1, [I

    .line 16
    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key0:[I

    .line 18
    .line 19
    new-array v0, p1, [I

    .line 20
    .line 21
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key1:[I

    .line 22
    .line 23
    new-array v0, p1, [I

    .line 24
    .line 25
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key2:[I

    .line 26
    .line 27
    new-array v0, p1, [I

    .line 28
    .line 29
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key3:[I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    :goto_0
    if-ge v0, p1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key0:[I

    .line 35
    .line 36
    mul-int/lit8 v2, v0, 0x4

    .line 37
    .line 38
    rem-int/lit8 v3, v2, 0xa

    .line 39
    .line 40
    aget-byte v3, p2, v3

    .line 41
    .line 42
    and-int/lit16 v3, v3, 0xff

    .line 43
    .line 44
    aput v3, v1, v0

    .line 45
    .line 46
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key1:[I

    .line 47
    .line 48
    add-int/lit8 v3, v2, 0x1

    .line 49
    .line 50
    rem-int/lit8 v3, v3, 0xa

    .line 51
    .line 52
    aget-byte v3, p2, v3

    .line 53
    .line 54
    and-int/lit16 v3, v3, 0xff

    .line 55
    .line 56
    aput v3, v1, v0

    .line 57
    .line 58
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key2:[I

    .line 59
    .line 60
    add-int/lit8 v3, v2, 0x2

    .line 61
    .line 62
    rem-int/lit8 v3, v3, 0xa

    .line 63
    .line 64
    aget-byte v3, p2, v3

    .line 65
    .line 66
    and-int/lit16 v3, v3, 0xff

    .line 67
    .line 68
    aput v3, v1, v0

    .line 69
    .line 70
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key3:[I

    .line 71
    .line 72
    add-int/lit8 v2, v2, 0x3

    .line 73
    .line 74
    rem-int/lit8 v2, v2, 0xa

    .line 75
    .line 76
    aget-byte v2, p2, v2

    .line 77
    .line 78
    and-int/lit16 v2, v2, 0xff

    .line 79
    .line 80
    aput v2, v1, v0

    .line 81
    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    return-void

    .line 86
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p1, "invalid parameter passed to SKIPJACK init - "

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->key1:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x8

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x8

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/SkipjackEngine;->encrypting:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->encryptBlock([BI[BI)I

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/SkipjackEngine;->decryptBlock([BI[BI)I

    .line 25
    .line 26
    .line 27
    :goto_0
    const/16 p0, 0x8

    .line 28
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
    const-string p0, "SKIPJACK engine not initialised"

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
