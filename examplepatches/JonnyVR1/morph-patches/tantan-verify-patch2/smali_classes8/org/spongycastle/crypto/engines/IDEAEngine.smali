.class public Lorg/spongycastle/crypto/engines/IDEAEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final BASE:I = 0x10001

.field protected static final BLOCK_SIZE:I = 0x8

.field private static final MASK:I = 0xffff


# instance fields
.field private workingKey:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IDEAEngine;->workingKey:[I

    .line 6
    .line 7
    return-void
.end method

.method private bytesToWord([BI)I
    .locals 1

    .line 1
    aget-byte p0, p1, p2

    .line 2
    .line 3
    shl-int/lit8 p0, p0, 0x8

    .line 4
    .line 5
    const v0, 0xff00

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, v0

    .line 9
    add-int/lit8 p2, p2, 0x1

    .line 10
    .line 11
    aget-byte p1, p1, p2

    .line 12
    .line 13
    and-int/lit16 p1, p1, 0xff

    .line 14
    .line 15
    add-int/2addr p0, p1

    .line 16
    return p0
.end method

.method private expandKey([B)[I
    .locals 6

    .line 1
    const/16 v0, 0x34

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    array-length v2, p1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/16 v4, 0x10

    .line 8
    .line 9
    if-ge v2, v4, :cond_0

    .line 10
    .line 11
    new-array v2, v4, [B

    .line 12
    .line 13
    array-length v5, p1

    .line 14
    sub-int/2addr v4, v5

    .line 15
    array-length v5, p1

    .line 16
    invoke-static {p1, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    move-object p1, v2

    .line 20
    :cond_0
    :goto_0
    const/16 v2, 0x8

    .line 21
    .line 22
    if-ge v3, v2, :cond_1

    .line 23
    .line 24
    mul-int/lit8 v2, v3, 0x2

    .line 25
    .line 26
    invoke-direct {p0, p1, v2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->bytesToWord([BI)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    aput v2, v1, v3

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    if-ge v2, v0, :cond_4

    .line 36
    .line 37
    and-int/lit8 p0, v2, 0x7

    .line 38
    .line 39
    const p1, 0xffff

    .line 40
    .line 41
    .line 42
    const/4 v3, 0x6

    .line 43
    if-ge p0, v3, :cond_2

    .line 44
    .line 45
    add-int/lit8 p0, v2, -0x7

    .line 46
    .line 47
    aget p0, v1, p0

    .line 48
    .line 49
    and-int/lit8 p0, p0, 0x7f

    .line 50
    .line 51
    shl-int/lit8 p0, p0, 0x9

    .line 52
    .line 53
    add-int/lit8 v3, v2, -0x6

    .line 54
    .line 55
    aget v3, v1, v3

    .line 56
    .line 57
    shr-int/lit8 v3, v3, 0x7

    .line 58
    .line 59
    or-int/2addr p0, v3

    .line 60
    and-int/2addr p0, p1

    .line 61
    aput p0, v1, v2

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    if-ne p0, v3, :cond_3

    .line 65
    .line 66
    add-int/lit8 p0, v2, -0x7

    .line 67
    .line 68
    aget p0, v1, p0

    .line 69
    .line 70
    and-int/lit8 p0, p0, 0x7f

    .line 71
    .line 72
    shl-int/lit8 p0, p0, 0x9

    .line 73
    .line 74
    add-int/lit8 v3, v2, -0xe

    .line 75
    .line 76
    aget v3, v1, v3

    .line 77
    .line 78
    shr-int/lit8 v3, v3, 0x7

    .line 79
    .line 80
    or-int/2addr p0, v3

    .line 81
    and-int/2addr p0, p1

    .line 82
    aput p0, v1, v2

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    add-int/lit8 p0, v2, -0xf

    .line 86
    .line 87
    aget p0, v1, p0

    .line 88
    .line 89
    and-int/lit8 p0, p0, 0x7f

    .line 90
    .line 91
    shl-int/lit8 p0, p0, 0x9

    .line 92
    .line 93
    add-int/lit8 v3, v2, -0xe

    .line 94
    .line 95
    aget v3, v1, v3

    .line 96
    .line 97
    shr-int/lit8 v3, v3, 0x7

    .line 98
    .line 99
    or-int/2addr p0, v3

    .line 100
    and-int/2addr p0, p1

    .line 101
    aput p0, v1, v2

    .line 102
    .line 103
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    return-object v1
.end method

.method private generateWorkingKey(Z[B)[I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->expandKey([B)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->expandKey([B)[I

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/IDEAEngine;->invertKey([I)[I

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private ideaFunc([I[BI[BI)V
    .locals 10

    .line 1
    invoke-direct {p0, p2, p3}, Lorg/spongycastle/crypto/engines/IDEAEngine;->bytesToWord([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, p3, 0x2

    .line 6
    .line 7
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/crypto/engines/IDEAEngine;->bytesToWord([BI)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v2, p3, 0x4

    .line 12
    .line 13
    invoke-direct {p0, p2, v2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->bytesToWord([BI)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    add-int/lit8 p3, p3, 0x6

    .line 18
    .line 19
    invoke-direct {p0, p2, p3}, Lorg/spongycastle/crypto/engines/IDEAEngine;->bytesToWord([BI)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const/4 p3, 0x0

    .line 24
    move v3, v2

    .line 25
    move v2, v1

    .line 26
    move v1, v0

    .line 27
    move v0, p3

    .line 28
    :goto_0
    const/16 v4, 0x8

    .line 29
    .line 30
    if-ge p3, v4, :cond_0

    .line 31
    .line 32
    add-int/lit8 v4, v0, 0x1

    .line 33
    .line 34
    aget v5, p1, v0

    .line 35
    .line 36
    invoke-direct {p0, v1, v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int/lit8 v5, v0, 0x2

    .line 41
    .line 42
    aget v4, p1, v4

    .line 43
    .line 44
    add-int/2addr v2, v4

    .line 45
    const v4, 0xffff

    .line 46
    .line 47
    .line 48
    and-int/2addr v2, v4

    .line 49
    add-int/lit8 v6, v0, 0x3

    .line 50
    .line 51
    aget v5, p1, v5

    .line 52
    .line 53
    add-int/2addr v3, v5

    .line 54
    and-int/2addr v3, v4

    .line 55
    add-int/lit8 v5, v0, 0x4

    .line 56
    .line 57
    aget v6, p1, v6

    .line 58
    .line 59
    invoke-direct {p0, p2, v6}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    xor-int v6, v3, v1

    .line 64
    .line 65
    xor-int v7, v2, p2

    .line 66
    .line 67
    add-int/lit8 v8, v0, 0x5

    .line 68
    .line 69
    aget v5, p1, v5

    .line 70
    .line 71
    invoke-direct {p0, v6, v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    add-int/2addr v7, v5

    .line 76
    and-int v6, v7, v4

    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x6

    .line 79
    .line 80
    aget v7, p1, v8

    .line 81
    .line 82
    invoke-direct {p0, v6, v7}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    add-int/2addr v5, v6

    .line 87
    and-int/2addr v4, v5

    .line 88
    xor-int/2addr v1, v6

    .line 89
    xor-int/2addr p2, v4

    .line 90
    xor-int/2addr v3, v6

    .line 91
    xor-int/2addr v2, v4

    .line 92
    add-int/lit8 p3, p3, 0x1

    .line 93
    .line 94
    move v9, v3

    .line 95
    move v3, v2

    .line 96
    move v2, v9

    .line 97
    goto :goto_0

    .line 98
    :cond_0
    add-int/lit8 p3, v0, 0x1

    .line 99
    .line 100
    aget v4, p1, v0

    .line 101
    .line 102
    invoke-direct {p0, v1, v4}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-direct {p0, v1, p4, p5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->wordToBytes(I[BI)V

    .line 107
    .line 108
    .line 109
    add-int/lit8 v1, v0, 0x2

    .line 110
    .line 111
    aget p3, p1, p3

    .line 112
    .line 113
    add-int/2addr v3, p3

    .line 114
    add-int/lit8 p3, p5, 0x2

    .line 115
    .line 116
    invoke-direct {p0, v3, p4, p3}, Lorg/spongycastle/crypto/engines/IDEAEngine;->wordToBytes(I[BI)V

    .line 117
    .line 118
    .line 119
    add-int/lit8 v0, v0, 0x3

    .line 120
    .line 121
    aget p3, p1, v1

    .line 122
    .line 123
    add-int/2addr v2, p3

    .line 124
    add-int/lit8 p3, p5, 0x4

    .line 125
    .line 126
    invoke-direct {p0, v2, p4, p3}, Lorg/spongycastle/crypto/engines/IDEAEngine;->wordToBytes(I[BI)V

    .line 127
    .line 128
    .line 129
    aget p1, p1, v0

    .line 130
    .line 131
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mul(II)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    add-int/lit8 p5, p5, 0x6

    .line 136
    .line 137
    invoke-direct {p0, p1, p4, p5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->wordToBytes(I[BI)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private invertKey([I)[I
    .locals 9

    .line 1
    const/16 v0, 0x34

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aget v1, p1, v1

    .line 7
    .line 8
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    aget v3, p1, v2

    .line 14
    .line 15
    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x2

    .line 20
    aget v4, p1, v4

    .line 21
    .line 22
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x3

    .line 27
    aget v5, p1, v5

    .line 28
    .line 29
    invoke-direct {p0, v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/16 v6, 0x33

    .line 34
    .line 35
    aput v5, v0, v6

    .line 36
    .line 37
    const/16 v5, 0x32

    .line 38
    .line 39
    aput v4, v0, v5

    .line 40
    .line 41
    const/16 v4, 0x31

    .line 42
    .line 43
    aput v3, v0, v4

    .line 44
    .line 45
    const/16 v3, 0x30

    .line 46
    .line 47
    aput v1, v0, v3

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    :goto_0
    const/16 v4, 0x8

    .line 51
    .line 52
    if-ge v2, v4, :cond_0

    .line 53
    .line 54
    add-int/lit8 v4, v1, 0x1

    .line 55
    .line 56
    aget v5, p1, v1

    .line 57
    .line 58
    add-int/lit8 v6, v1, 0x2

    .line 59
    .line 60
    aget v4, p1, v4

    .line 61
    .line 62
    add-int/lit8 v7, v3, -0x1

    .line 63
    .line 64
    aput v4, v0, v7

    .line 65
    .line 66
    add-int/lit8 v4, v3, -0x2

    .line 67
    .line 68
    aput v5, v0, v4

    .line 69
    .line 70
    add-int/lit8 v4, v1, 0x3

    .line 71
    .line 72
    aget v5, p1, v6

    .line 73
    .line 74
    invoke-direct {p0, v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    add-int/lit8 v6, v1, 0x4

    .line 79
    .line 80
    aget v4, p1, v4

    .line 81
    .line 82
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    add-int/lit8 v7, v1, 0x5

    .line 87
    .line 88
    aget v6, p1, v6

    .line 89
    .line 90
    invoke-virtual {p0, v6}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    add-int/lit8 v1, v1, 0x6

    .line 95
    .line 96
    aget v7, p1, v7

    .line 97
    .line 98
    invoke-direct {p0, v7}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    add-int/lit8 v8, v3, -0x3

    .line 103
    .line 104
    aput v7, v0, v8

    .line 105
    .line 106
    add-int/lit8 v7, v3, -0x4

    .line 107
    .line 108
    aput v4, v0, v7

    .line 109
    .line 110
    add-int/lit8 v4, v3, -0x5

    .line 111
    .line 112
    aput v6, v0, v4

    .line 113
    .line 114
    add-int/lit8 v3, v3, -0x6

    .line 115
    .line 116
    aput v5, v0, v3

    .line 117
    .line 118
    add-int/lit8 v2, v2, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    add-int/lit8 v2, v1, 0x1

    .line 122
    .line 123
    aget v4, p1, v1

    .line 124
    .line 125
    add-int/lit8 v5, v1, 0x2

    .line 126
    .line 127
    aget v2, p1, v2

    .line 128
    .line 129
    add-int/lit8 v6, v3, -0x1

    .line 130
    .line 131
    aput v2, v0, v6

    .line 132
    .line 133
    add-int/lit8 v2, v3, -0x2

    .line 134
    .line 135
    aput v4, v0, v2

    .line 136
    .line 137
    add-int/lit8 v2, v1, 0x3

    .line 138
    .line 139
    aget v4, p1, v5

    .line 140
    .line 141
    invoke-direct {p0, v4}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    add-int/lit8 v5, v1, 0x4

    .line 146
    .line 147
    aget v2, p1, v2

    .line 148
    .line 149
    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    add-int/lit8 v1, v1, 0x5

    .line 154
    .line 155
    aget v5, p1, v5

    .line 156
    .line 157
    invoke-virtual {p0, v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->addInv(I)I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    aget p1, p1, v1

    .line 162
    .line 163
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/IDEAEngine;->mulInv(I)I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    add-int/lit8 p1, v3, -0x3

    .line 168
    .line 169
    aput p0, v0, p1

    .line 170
    .line 171
    add-int/lit8 p0, v3, -0x4

    .line 172
    .line 173
    aput v5, v0, p0

    .line 174
    .line 175
    add-int/lit8 p0, v3, -0x5

    .line 176
    .line 177
    aput v2, v0, p0

    .line 178
    .line 179
    add-int/lit8 v3, v3, -0x6

    .line 180
    .line 181
    aput v4, v0, v3

    .line 182
    .line 183
    return-object v0
.end method

.method private mul(II)I
    .locals 1

    const p0, 0xffff

    const v0, 0x10001

    if-nez p1, :cond_0

    sub-int/2addr v0, p2

    goto :goto_1

    :cond_0
    if-nez p2, :cond_1

    sub-int/2addr v0, p1

    goto :goto_1

    :cond_1
    mul-int/2addr p1, p2

    and-int p2, p1, p0

    ushr-int/lit8 p1, p1, 0x10

    sub-int v0, p2, p1

    if-ge p2, p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    add-int/2addr v0, p1

    :goto_1
    and-int/2addr p0, v0

    return p0
.end method

.method private mulInv(I)I
    .locals 5

    .line 1
    const/4 p0, 0x2

    .line 2
    if-ge p1, p0, :cond_0

    .line 3
    .line 4
    return p1

    .line 5
    :cond_0
    const p0, 0x10001

    .line 6
    .line 7
    .line 8
    div-int v0, p0, p1

    .line 9
    .line 10
    rem-int/2addr p0, p1

    .line 11
    const/4 v1, 0x1

    .line 12
    move v2, v1

    .line 13
    :goto_0
    const v3, 0xffff

    .line 14
    .line 15
    .line 16
    if-eq p0, v1, :cond_2

    .line 17
    .line 18
    div-int v4, p1, p0

    .line 19
    .line 20
    rem-int/2addr p1, p0

    .line 21
    mul-int/2addr v4, v0

    .line 22
    add-int/2addr v2, v4

    .line 23
    and-int/2addr v2, v3

    .line 24
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    div-int v4, p0, p1

    .line 28
    .line 29
    rem-int/2addr p0, p1

    .line 30
    mul-int/2addr v4, v2

    .line 31
    add-int/2addr v0, v4

    .line 32
    and-int/2addr v0, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    sub-int/2addr v1, v0

    .line 35
    and-int p0, v1, v3

    .line 36
    .line 37
    return p0
.end method

.method private wordToBytes(I[BI)V
    .locals 0

    .line 1
    ushr-int/lit8 p0, p1, 0x8

    .line 2
    .line 3
    int-to-byte p0, p0

    .line 4
    aput-byte p0, p2, p3

    .line 5
    .line 6
    add-int/lit8 p3, p3, 0x1

    .line 7
    .line 8
    int-to-byte p0, p1

    .line 9
    aput-byte p0, p2, p3

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addInv(I)I
    .locals 0

    rsub-int/lit8 p0, p1, 0x0

    const p1, 0xffff

    and-int/2addr p0, p1

    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "IDEA"

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
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/IDEAEngine;->generateWorkingKey(Z[B)[I

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IDEAEngine;->workingKey:[I

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "invalid parameter passed to IDEA init - "

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 7

    .line 1
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/IDEAEngine;->workingKey:[I

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
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/IDEAEngine;->ideaFunc([I[BI[BI)V

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
    const-string p0, "IDEA engine not initialised"

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
