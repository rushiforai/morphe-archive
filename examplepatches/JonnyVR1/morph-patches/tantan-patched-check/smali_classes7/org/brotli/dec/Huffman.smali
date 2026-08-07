.class final Lorg/brotli/dec/Huffman;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final HUFFMAN_MAX_TABLE_SIZE:I = 0x438

.field private static final MAX_LENGTH:I = 0xf


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static buildHuffmanTable([III[II)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    new-array v3, v2, [I

    .line 8
    .line 9
    const/16 v4, 0x10

    .line 10
    .line 11
    new-array v5, v4, [I

    .line 12
    .line 13
    new-array v6, v4, [I

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    move v8, v7

    .line 17
    :goto_0
    const/4 v9, 0x1

    .line 18
    if-ge v8, v2, :cond_0

    .line 19
    .line 20
    aget v10, p3, v8

    .line 21
    .line 22
    aget v11, v5, v10

    .line 23
    .line 24
    add-int/2addr v11, v9

    .line 25
    aput v11, v5, v10

    .line 26
    .line 27
    add-int/lit8 v8, v8, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    aput v7, v6, v9

    .line 31
    .line 32
    move v8, v9

    .line 33
    :goto_1
    const/16 v10, 0xf

    .line 34
    .line 35
    if-ge v8, v10, :cond_1

    .line 36
    .line 37
    add-int/lit8 v10, v8, 0x1

    .line 38
    .line 39
    aget v11, v6, v8

    .line 40
    .line 41
    aget v8, v5, v8

    .line 42
    .line 43
    add-int/2addr v11, v8

    .line 44
    aput v11, v6, v10

    .line 45
    .line 46
    move v8, v10

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move v8, v7

    .line 49
    :goto_2
    if-ge v8, v2, :cond_3

    .line 50
    .line 51
    aget v11, p3, v8

    .line 52
    .line 53
    if-eqz v11, :cond_2

    .line 54
    .line 55
    aget v12, v6, v11

    .line 56
    .line 57
    add-int/lit8 v13, v12, 0x1

    .line 58
    .line 59
    aput v13, v6, v11

    .line 60
    .line 61
    aput v8, v3, v12

    .line 62
    .line 63
    :cond_2
    add-int/lit8 v8, v8, 0x1

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    shl-int v2, v9, v1

    .line 67
    .line 68
    aget v6, v6, v10

    .line 69
    .line 70
    if-ne v6, v9, :cond_4

    .line 71
    .line 72
    move v1, v7

    .line 73
    :goto_3
    if-ge v1, v2, :cond_9

    .line 74
    .line 75
    add-int v4, p1, v1

    .line 76
    .line 77
    aget v5, v3, v7

    .line 78
    .line 79
    aput v5, v0, v4

    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    const/4 v6, 0x2

    .line 85
    move v12, v6

    .line 86
    move v8, v7

    .line 87
    move v11, v9

    .line 88
    :goto_4
    if-gt v11, v1, :cond_6

    .line 89
    .line 90
    :goto_5
    aget v13, v5, v11

    .line 91
    .line 92
    if-lez v13, :cond_5

    .line 93
    .line 94
    add-int v13, p1, v8

    .line 95
    .line 96
    shl-int/lit8 v14, v11, 0x10

    .line 97
    .line 98
    add-int/lit8 v15, v7, 0x1

    .line 99
    .line 100
    aget v7, v3, v7

    .line 101
    .line 102
    or-int/2addr v7, v14

    .line 103
    invoke-static {v0, v13, v12, v2, v7}, Lorg/brotli/dec/Huffman;->replicateValue([IIIII)V

    .line 104
    .line 105
    .line 106
    invoke-static {v8, v11}, Lorg/brotli/dec/Huffman;->getNextKey(II)I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    aget v7, v5, v11

    .line 111
    .line 112
    sub-int/2addr v7, v9

    .line 113
    aput v7, v5, v11

    .line 114
    .line 115
    move v7, v15

    .line 116
    goto :goto_5

    .line 117
    :cond_5
    add-int/lit8 v11, v11, 0x1

    .line 118
    .line 119
    shl-int/lit8 v12, v12, 0x1

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_6
    add-int/lit8 v11, v2, -0x1

    .line 123
    .line 124
    add-int/lit8 v12, v1, 0x1

    .line 125
    .line 126
    const/4 v13, -0x1

    .line 127
    move/from16 v14, p1

    .line 128
    .line 129
    :goto_6
    if-gt v12, v10, :cond_9

    .line 130
    .line 131
    :goto_7
    aget v15, v5, v12

    .line 132
    .line 133
    if-lez v15, :cond_8

    .line 134
    .line 135
    and-int v15, v8, v11

    .line 136
    .line 137
    if-eq v15, v13, :cond_7

    .line 138
    .line 139
    add-int/2addr v14, v2

    .line 140
    invoke-static {v5, v12, v1}, Lorg/brotli/dec/Huffman;->nextTableBitSize([III)I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    shl-int v13, v9, v2

    .line 145
    .line 146
    add-int v16, p1, v15

    .line 147
    .line 148
    add-int/2addr v2, v1

    .line 149
    shl-int/2addr v2, v4

    .line 150
    sub-int v17, v14, p1

    .line 151
    .line 152
    sub-int v17, v17, v15

    .line 153
    .line 154
    or-int v2, v2, v17

    .line 155
    .line 156
    aput v2, v0, v16

    .line 157
    .line 158
    move v2, v13

    .line 159
    move v13, v15

    .line 160
    :cond_7
    shr-int v15, v8, v1

    .line 161
    .line 162
    add-int/2addr v15, v14

    .line 163
    sub-int v16, v12, v1

    .line 164
    .line 165
    shl-int/lit8 v16, v16, 0x10

    .line 166
    .line 167
    add-int/lit8 v17, v7, 0x1

    .line 168
    .line 169
    aget v7, v3, v7

    .line 170
    .line 171
    or-int v7, v16, v7

    .line 172
    .line 173
    invoke-static {v0, v15, v6, v2, v7}, Lorg/brotli/dec/Huffman;->replicateValue([IIIII)V

    .line 174
    .line 175
    .line 176
    invoke-static {v8, v12}, Lorg/brotli/dec/Huffman;->getNextKey(II)I

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    aget v7, v5, v12

    .line 181
    .line 182
    sub-int/2addr v7, v9

    .line 183
    aput v7, v5, v12

    .line 184
    .line 185
    move/from16 v7, v17

    .line 186
    .line 187
    goto :goto_7

    .line 188
    :cond_8
    add-int/lit8 v12, v12, 0x1

    .line 189
    .line 190
    shl-int/lit8 v6, v6, 0x1

    .line 191
    .line 192
    goto :goto_6

    .line 193
    :cond_9
    return-void
.end method

.method private static getNextKey(II)I
    .locals 1

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    shl-int p1, v0, p1

    :goto_0
    and-int v0, p0, p1

    if-eqz v0, :cond_0

    shr-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p1, -0x1

    and-int/2addr p0, v0

    add-int/2addr p0, p1

    return p0
.end method

.method private static nextTableBitSize([III)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    sub-int v1, p1, p2

    .line 3
    .line 4
    shl-int/2addr v0, v1

    .line 5
    :goto_0
    const/16 v1, 0xf

    .line 6
    .line 7
    if-ge p1, v1, :cond_1

    .line 8
    .line 9
    aget v1, p0, p1

    .line 10
    .line 11
    sub-int/2addr v0, v1

    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    shl-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    :goto_1
    sub-int/2addr p1, p2

    .line 21
    return p1
.end method

.method private static replicateValue([IIIII)V
    .locals 1

    .line 1
    :cond_0
    sub-int/2addr p3, p2

    .line 2
    add-int v0, p1, p3

    .line 3
    .line 4
    aput p4, p0, v0

    .line 5
    .line 6
    if-gtz p3, :cond_0

    .line 7
    .line 8
    return-void
.end method
