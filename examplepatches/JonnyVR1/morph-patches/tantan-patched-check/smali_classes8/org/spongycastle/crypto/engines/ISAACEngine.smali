.class public Lorg/spongycastle/crypto/engines/ISAACEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/StreamCipher;


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private engineState:[I

.field private index:I

.field private initialised:Z

.field private keyStream:[B

.field private results:[I

.field private final sizeL:I

.field private final stateArraySize:I

.field private workingKey:[B


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->sizeL:I

    .line 7
    .line 8
    const/16 v0, 0x100

    .line 9
    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->stateArraySize:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 14
    .line 15
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 19
    .line 20
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 21
    .line 22
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->c:I

    .line 23
    .line 24
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 25
    .line 26
    const/16 v2, 0x400

    .line 27
    .line 28
    new-array v2, v2, [B

    .line 29
    .line 30
    iput-object v2, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->keyStream:[B

    .line 31
    .line 32
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->workingKey:[B

    .line 33
    .line 34
    iput-boolean v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->initialised:Z

    .line 35
    .line 36
    return-void
.end method

.method private isaac()V
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->c:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    add-int/2addr v1, v2

    .line 7
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->c:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    const/16 v1, 0x100

    .line 14
    .line 15
    if-ge v0, v1, :cond_4

    .line 16
    .line 17
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 18
    .line 19
    aget v3, v1, v0

    .line 20
    .line 21
    and-int/lit8 v4, v0, 0x3

    .line 22
    .line 23
    if-eqz v4, :cond_3

    .line 24
    .line 25
    if-eq v4, v2, :cond_2

    .line 26
    .line 27
    const/4 v5, 0x2

    .line 28
    if-eq v4, v5, :cond_1

    .line 29
    .line 30
    const/4 v5, 0x3

    .line 31
    if-eq v4, v5, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 35
    .line 36
    ushr-int/lit8 v5, v4, 0x10

    .line 37
    .line 38
    xor-int/2addr v4, v5

    .line 39
    iput v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 43
    .line 44
    shl-int/lit8 v5, v4, 0x2

    .line 45
    .line 46
    xor-int/2addr v4, v5

    .line 47
    iput v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 51
    .line 52
    ushr-int/lit8 v5, v4, 0x6

    .line 53
    .line 54
    xor-int/2addr v4, v5

    .line 55
    iput v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 59
    .line 60
    shl-int/lit8 v5, v4, 0xd

    .line 61
    .line 62
    xor-int/2addr v4, v5

    .line 63
    iput v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 64
    .line 65
    :goto_1
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 66
    .line 67
    add-int/lit16 v5, v0, 0x80

    .line 68
    .line 69
    and-int/lit16 v5, v5, 0xff

    .line 70
    .line 71
    aget v5, v1, v5

    .line 72
    .line 73
    add-int/2addr v4, v5

    .line 74
    iput v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 75
    .line 76
    ushr-int/lit8 v5, v3, 0x2

    .line 77
    .line 78
    and-int/lit16 v5, v5, 0xff

    .line 79
    .line 80
    aget v5, v1, v5

    .line 81
    .line 82
    add-int/2addr v5, v4

    .line 83
    iget v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 84
    .line 85
    add-int/2addr v5, v4

    .line 86
    aput v5, v1, v0

    .line 87
    .line 88
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 89
    .line 90
    ushr-int/lit8 v5, v5, 0xa

    .line 91
    .line 92
    and-int/lit16 v5, v5, 0xff

    .line 93
    .line 94
    aget v1, v1, v5

    .line 95
    .line 96
    add-int/2addr v1, v3

    .line 97
    iput v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 98
    .line 99
    aput v1, v4, v0

    .line 100
    .line 101
    add-int/lit8 v0, v0, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    return-void
.end method

.method private mix([I)V
    .locals 12

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    shl-int/lit8 v3, v2, 0xb

    .line 8
    .line 9
    xor-int/2addr v0, v3

    .line 10
    aput v0, p1, p0

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    aget v4, p1, v3

    .line 14
    .line 15
    add-int/2addr v4, v0

    .line 16
    aput v4, p1, v3

    .line 17
    .line 18
    const/4 v5, 0x2

    .line 19
    aget v6, p1, v5

    .line 20
    .line 21
    add-int/2addr v2, v6

    .line 22
    aput v2, p1, v1

    .line 23
    .line 24
    ushr-int/lit8 v7, v6, 0x2

    .line 25
    .line 26
    xor-int/2addr v2, v7

    .line 27
    aput v2, p1, v1

    .line 28
    .line 29
    const/4 v7, 0x4

    .line 30
    aget v8, p1, v7

    .line 31
    .line 32
    add-int/2addr v8, v2

    .line 33
    aput v8, p1, v7

    .line 34
    .line 35
    add-int/2addr v6, v4

    .line 36
    aput v6, p1, v5

    .line 37
    .line 38
    shl-int/lit8 v9, v4, 0x8

    .line 39
    .line 40
    xor-int/2addr v6, v9

    .line 41
    aput v6, p1, v5

    .line 42
    .line 43
    const/4 v9, 0x5

    .line 44
    aget v10, p1, v9

    .line 45
    .line 46
    add-int/2addr v10, v6

    .line 47
    aput v10, p1, v9

    .line 48
    .line 49
    add-int/2addr v4, v8

    .line 50
    aput v4, p1, v3

    .line 51
    .line 52
    ushr-int/lit8 v11, v8, 0x10

    .line 53
    .line 54
    xor-int/2addr v4, v11

    .line 55
    aput v4, p1, v3

    .line 56
    .line 57
    const/4 v3, 0x6

    .line 58
    aget v11, p1, v3

    .line 59
    .line 60
    add-int/2addr v11, v4

    .line 61
    aput v11, p1, v3

    .line 62
    .line 63
    add-int/2addr v8, v10

    .line 64
    aput v8, p1, v7

    .line 65
    .line 66
    shl-int/lit8 v4, v10, 0xa

    .line 67
    .line 68
    xor-int/2addr v4, v8

    .line 69
    aput v4, p1, v7

    .line 70
    .line 71
    const/4 v7, 0x7

    .line 72
    aget v8, p1, v7

    .line 73
    .line 74
    add-int/2addr v8, v4

    .line 75
    aput v8, p1, v7

    .line 76
    .line 77
    add-int/2addr v10, v11

    .line 78
    aput v10, p1, v9

    .line 79
    .line 80
    ushr-int/lit8 v4, v11, 0x4

    .line 81
    .line 82
    xor-int/2addr v4, v10

    .line 83
    aput v4, p1, v9

    .line 84
    .line 85
    add-int/2addr v0, v4

    .line 86
    aput v0, p1, p0

    .line 87
    .line 88
    add-int/2addr v11, v8

    .line 89
    aput v11, p1, v3

    .line 90
    .line 91
    shl-int/lit8 v4, v8, 0x8

    .line 92
    .line 93
    xor-int/2addr v4, v11

    .line 94
    aput v4, p1, v3

    .line 95
    .line 96
    add-int/2addr v2, v4

    .line 97
    aput v2, p1, v1

    .line 98
    .line 99
    add-int/2addr v8, v0

    .line 100
    aput v8, p1, v7

    .line 101
    .line 102
    ushr-int/lit8 v1, v0, 0x9

    .line 103
    .line 104
    xor-int/2addr v1, v8

    .line 105
    aput v1, p1, v7

    .line 106
    .line 107
    add-int/2addr v6, v1

    .line 108
    aput v6, p1, v5

    .line 109
    .line 110
    add-int/2addr v0, v2

    .line 111
    aput v0, p1, p0

    .line 112
    .line 113
    return-void
.end method

.method private setKey([B)V
    .locals 10

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->workingKey:[B

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 4
    .line 5
    const/16 v1, 0x100

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-array v0, v1, [I

    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-array v0, v1, [I

    .line 18
    .line 19
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 20
    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    move v2, v0

    .line 23
    :goto_0
    if-ge v2, v1, :cond_2

    .line 24
    .line 25
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 26
    .line 27
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 28
    .line 29
    aput v0, v4, v2

    .line 30
    .line 31
    aput v0, v3, v2

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->c:I

    .line 37
    .line 38
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->b:I

    .line 39
    .line 40
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->a:I

    .line 41
    .line 42
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 43
    .line 44
    array-length v2, p1

    .line 45
    array-length v3, p1

    .line 46
    and-int/lit8 v3, v3, 0x3

    .line 47
    .line 48
    add-int/2addr v2, v3

    .line 49
    new-array v3, v2, [B

    .line 50
    .line 51
    array-length v4, p1

    .line 52
    invoke-static {p1, v0, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    move p1, v0

    .line 56
    :goto_1
    if-ge p1, v2, :cond_3

    .line 57
    .line 58
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 59
    .line 60
    ushr-int/lit8 v5, p1, 0x2

    .line 61
    .line 62
    invoke-static {v3, p1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    aput v6, v4, v5

    .line 67
    .line 68
    add-int/lit8 p1, p1, 0x4

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    const/16 p1, 0x8

    .line 72
    .line 73
    new-array v2, p1, [I

    .line 74
    .line 75
    move v3, v0

    .line 76
    :goto_2
    if-ge v3, p1, :cond_4

    .line 77
    .line 78
    const v4, -0x61c88647

    .line 79
    .line 80
    .line 81
    aput v4, v2, v3

    .line 82
    .line 83
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    move v3, v0

    .line 87
    :goto_3
    const/4 v4, 0x4

    .line 88
    if-ge v3, v4, :cond_5

    .line 89
    .line 90
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/engines/ISAACEngine;->mix([I)V

    .line 91
    .line 92
    .line 93
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_5
    move v3, v0

    .line 97
    :goto_4
    const/4 v4, 0x2

    .line 98
    const/4 v5, 0x1

    .line 99
    if-ge v3, v4, :cond_a

    .line 100
    .line 101
    move v4, v0

    .line 102
    :goto_5
    if-ge v4, v1, :cond_9

    .line 103
    .line 104
    move v6, v0

    .line 105
    :goto_6
    if-ge v6, p1, :cond_7

    .line 106
    .line 107
    aget v7, v2, v6

    .line 108
    .line 109
    if-ge v3, v5, :cond_6

    .line 110
    .line 111
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 112
    .line 113
    add-int v9, v4, v6

    .line 114
    .line 115
    aget v8, v8, v9

    .line 116
    .line 117
    goto :goto_7

    .line 118
    :cond_6
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 119
    .line 120
    add-int v9, v4, v6

    .line 121
    .line 122
    aget v8, v8, v9

    .line 123
    .line 124
    :goto_7
    add-int/2addr v7, v8

    .line 125
    aput v7, v2, v6

    .line 126
    .line 127
    add-int/lit8 v6, v6, 0x1

    .line 128
    .line 129
    goto :goto_6

    .line 130
    :cond_7
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/engines/ISAACEngine;->mix([I)V

    .line 131
    .line 132
    .line 133
    move v6, v0

    .line 134
    :goto_8
    if-ge v6, p1, :cond_8

    .line 135
    .line 136
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->engineState:[I

    .line 137
    .line 138
    add-int v8, v4, v6

    .line 139
    .line 140
    aget v9, v2, v6

    .line 141
    .line 142
    aput v9, v7, v8

    .line 143
    .line 144
    add-int/lit8 v6, v6, 0x1

    .line 145
    .line 146
    goto :goto_8

    .line 147
    :cond_8
    add-int/lit8 v4, v4, 0x8

    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_a
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/ISAACEngine;->isaac()V

    .line 154
    .line 155
    .line 156
    iput-boolean v5, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->initialised:Z

    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ISAAC"

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    instance-of p1, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/ISAACEngine;->setKey([B)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "invalid parameter passed to ISAAC init - "

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public processBytes([BII[BI)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->initialised:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    add-int v0, p2, p3

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_3

    .line 10
    .line 11
    add-int v0, p5, p3

    .line 12
    .line 13
    array-length v2, p4

    .line 14
    if-gt v0, v2, :cond_2

    .line 15
    .line 16
    :goto_0
    if-ge v1, p3, :cond_1

    .line 17
    .line 18
    iget v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/ISAACEngine;->isaac()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 26
    .line 27
    invoke-static {v0}, Lorg/spongycastle/util/Pack;->intToBigEndian([I)[B

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->keyStream:[B

    .line 32
    .line 33
    :cond_0
    add-int v0, v1, p5

    .line 34
    .line 35
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->keyStream:[B

    .line 36
    .line 37
    iget v3, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 38
    .line 39
    aget-byte v2, v2, v3

    .line 40
    .line 41
    add-int v4, v1, p2

    .line 42
    .line 43
    aget-byte v4, p1, v4

    .line 44
    .line 45
    xor-int/2addr v2, v4

    .line 46
    int-to-byte v2, v2

    .line 47
    aput-byte v2, p4, v0

    .line 48
    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    and-int/lit16 v0, v3, 0x3ff

    .line 52
    .line 53
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    return p3

    .line 59
    :cond_2
    const-string p0, "output buffer too short"

    .line 60
    .line 61
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return v1

    .line 65
    :cond_3
    const-string p0, "input buffer too short"

    .line 66
    .line 67
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/ISAACEngine;->getAlgorithmName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, " not initialised"

    .line 76
    .line 77
    invoke-static {p0, p1}, Ll/rrc0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    return v1
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->workingKey:[B

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/ISAACEngine;->setKey([B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public returnByte(B)B
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/ISAACEngine;->isaac()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->results:[I

    .line 9
    .line 10
    invoke-static {v0}, Lorg/spongycastle/util/Pack;->intToBigEndian([I)[B

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->keyStream:[B

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->keyStream:[B

    .line 17
    .line 18
    iget v1, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 19
    .line 20
    aget-byte v0, v0, v1

    .line 21
    .line 22
    xor-int/2addr p1, v0

    .line 23
    int-to-byte p1, p1

    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    and-int/lit16 v0, v1, 0x3ff

    .line 27
    .line 28
    iput v0, p0, Lorg/spongycastle/crypto/engines/ISAACEngine;->index:I

    .line 29
    .line 30
    return p1
.end method
