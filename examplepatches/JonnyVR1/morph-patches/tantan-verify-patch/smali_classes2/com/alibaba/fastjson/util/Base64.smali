.class public Lcom/alibaba/fastjson/util/Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CA:[C

.field public static final IA:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/alibaba/fastjson/util/Base64;->CA:[C

    .line 8
    .line 9
    const/16 v1, 0x100

    .line 10
    .line 11
    new-array v1, v1, [I

    .line 12
    .line 13
    sput-object v1, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 17
    .line 18
    .line 19
    array-length v0, v0

    .line 20
    const/4 v1, 0x0

    .line 21
    move v2, v1

    .line 22
    :goto_0
    if-ge v2, v0, :cond_0

    .line 23
    .line 24
    sget-object v3, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 25
    .line 26
    sget-object v4, Lcom/alibaba/fastjson/util/Base64;->CA:[C

    .line 27
    .line 28
    aget-char v4, v4, v2

    .line 29
    .line 30
    aput v2, v3, v4

    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v0, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 36
    .line 37
    const/16 v2, 0x3d

    .line 38
    .line 39
    aput v1, v0, v2

    .line 40
    .line 41
    return-void
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

.method public static decodeFast(Ljava/lang/String;)[B
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-array v0, v2, [B

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    add-int/lit8 v3, v1, -0x1

    .line 14
    .line 15
    move v4, v2

    .line 16
    :goto_0
    if-ge v4, v3, :cond_1

    .line 17
    .line 18
    sget-object v5, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    and-int/lit16 v6, v6, 0xff

    .line 25
    .line 26
    aget v5, v5, v6

    .line 27
    .line 28
    if-gez v5, :cond_1

    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    if-lez v3, :cond_2

    .line 34
    .line 35
    sget-object v5, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    and-int/lit16 v6, v6, 0xff

    .line 42
    .line 43
    aget v5, v5, v6

    .line 44
    .line 45
    if-gez v5, :cond_2

    .line 46
    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    const/16 v6, 0x3d

    .line 55
    .line 56
    const/4 v7, 0x1

    .line 57
    if-ne v5, v6, :cond_4

    .line 58
    .line 59
    add-int/lit8 v5, v3, -0x1

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-ne v5, v6, :cond_3

    .line 66
    .line 67
    const/4 v5, 0x2

    .line 68
    goto :goto_2

    .line 69
    :cond_3
    move v5, v7

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move v5, v2

    .line 72
    :goto_2
    sub-int v6, v3, v4

    .line 73
    .line 74
    add-int/2addr v6, v7

    .line 75
    const/16 v8, 0x4c

    .line 76
    .line 77
    if-le v1, v8, :cond_6

    .line 78
    .line 79
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/16 v8, 0xd

    .line 84
    .line 85
    if-ne v1, v8, :cond_5

    .line 86
    .line 87
    div-int/lit8 v1, v6, 0x4e

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_5
    move v1, v2

    .line 91
    :goto_3
    shl-int/2addr v1, v7

    .line 92
    goto :goto_4

    .line 93
    :cond_6
    move v1, v2

    .line 94
    :goto_4
    sub-int/2addr v6, v1

    .line 95
    mul-int/lit8 v6, v6, 0x6

    .line 96
    .line 97
    shr-int/lit8 v6, v6, 0x3

    .line 98
    .line 99
    sub-int/2addr v6, v5

    .line 100
    new-array v8, v6, [B

    .line 101
    .line 102
    div-int/lit8 v9, v6, 0x3

    .line 103
    .line 104
    mul-int/lit8 v9, v9, 0x3

    .line 105
    .line 106
    move v10, v2

    .line 107
    move v11, v10

    .line 108
    :goto_5
    if-ge v10, v9, :cond_8

    .line 109
    .line 110
    sget-object v12, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 111
    .line 112
    add-int/lit8 v13, v4, 0x1

    .line 113
    .line 114
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 115
    .line 116
    .line 117
    move-result v14

    .line 118
    aget v14, v12, v14

    .line 119
    .line 120
    shl-int/lit8 v14, v14, 0x12

    .line 121
    .line 122
    add-int/lit8 v15, v4, 0x2

    .line 123
    .line 124
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    aget v13, v12, v13

    .line 129
    .line 130
    shl-int/lit8 v13, v13, 0xc

    .line 131
    .line 132
    or-int/2addr v13, v14

    .line 133
    add-int/lit8 v14, v4, 0x3

    .line 134
    .line 135
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v15

    .line 139
    aget v15, v12, v15

    .line 140
    .line 141
    shl-int/lit8 v15, v15, 0x6

    .line 142
    .line 143
    or-int/2addr v13, v15

    .line 144
    add-int/lit8 v15, v4, 0x4

    .line 145
    .line 146
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    .line 147
    .line 148
    .line 149
    move-result v14

    .line 150
    aget v12, v12, v14

    .line 151
    .line 152
    or-int/2addr v12, v13

    .line 153
    add-int/lit8 v13, v10, 0x1

    .line 154
    .line 155
    shr-int/lit8 v14, v12, 0x10

    .line 156
    .line 157
    int-to-byte v14, v14

    .line 158
    aput-byte v14, v8, v10

    .line 159
    .line 160
    add-int/lit8 v14, v10, 0x2

    .line 161
    .line 162
    shr-int/lit8 v2, v12, 0x8

    .line 163
    .line 164
    int-to-byte v2, v2

    .line 165
    aput-byte v2, v8, v13

    .line 166
    .line 167
    add-int/lit8 v10, v10, 0x3

    .line 168
    .line 169
    int-to-byte v2, v12

    .line 170
    aput-byte v2, v8, v14

    .line 171
    .line 172
    if-lez v1, :cond_7

    .line 173
    .line 174
    add-int/lit8 v11, v11, 0x1

    .line 175
    .line 176
    const/16 v2, 0x13

    .line 177
    .line 178
    if-ne v11, v2, :cond_7

    .line 179
    .line 180
    add-int/lit8 v4, v4, 0x6

    .line 181
    .line 182
    const/4 v11, 0x0

    .line 183
    goto :goto_6

    .line 184
    :cond_7
    move v4, v15

    .line 185
    :goto_6
    const/4 v2, 0x0

    .line 186
    goto :goto_5

    .line 187
    :cond_8
    if-ge v10, v6, :cond_a

    .line 188
    .line 189
    const/4 v2, 0x0

    .line 190
    const/16 v16, 0x0

    .line 191
    .line 192
    :goto_7
    sub-int v1, v3, v5

    .line 193
    .line 194
    if-gt v4, v1, :cond_9

    .line 195
    .line 196
    sget-object v1, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    .line 197
    .line 198
    add-int/lit8 v9, v4, 0x1

    .line 199
    .line 200
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 201
    .line 202
    .line 203
    move-result v4

    .line 204
    aget v1, v1, v4

    .line 205
    .line 206
    mul-int/lit8 v4, v16, 0x6

    .line 207
    .line 208
    rsub-int/lit8 v4, v4, 0x12

    .line 209
    .line 210
    shl-int/2addr v1, v4

    .line 211
    or-int/2addr v2, v1

    .line 212
    add-int/lit8 v16, v16, 0x1

    .line 213
    .line 214
    move v4, v9

    .line 215
    goto :goto_7

    .line 216
    :cond_9
    const/16 v0, 0x10

    .line 217
    .line 218
    :goto_8
    if-ge v10, v6, :cond_a

    .line 219
    .line 220
    add-int/lit8 v1, v10, 0x1

    .line 221
    .line 222
    shr-int v3, v2, v0

    .line 223
    .line 224
    int-to-byte v3, v3

    .line 225
    aput-byte v3, v8, v10

    .line 226
    .line 227
    add-int/lit8 v0, v0, -0x8

    .line 228
    .line 229
    move v10, v1

    .line 230
    goto :goto_8

    .line 231
    :cond_a
    return-object v8
.end method

.method public static decodeFast(Ljava/lang/String;II)[B
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p2

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 232
    new-array v0, v2, [B

    return-object v0

    :cond_0
    add-int v3, p1, v1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    move/from16 v5, p1

    :goto_0
    if-ge v5, v3, :cond_1

    .line 233
    sget-object v6, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget v6, v6, v7

    if-gez v6, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lez v3, :cond_2

    .line 234
    sget-object v6, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget v6, v6, v7

    if-gez v6, :cond_2

    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 235
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3d

    if-ne v6, v7, :cond_4

    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v7, :cond_3

    const/4 v6, 0x2

    goto :goto_2

    :cond_3
    move v6, v4

    goto :goto_2

    :cond_4
    move v6, v2

    :goto_2
    sub-int v7, v3, v5

    add-int/2addr v7, v4

    const/16 v8, 0x4c

    if-le v1, v8, :cond_6

    .line 236
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v8, 0xd

    if-ne v1, v8, :cond_5

    div-int/lit8 v1, v7, 0x4e

    goto :goto_3

    :cond_5
    move v1, v2

    :goto_3
    shl-int/2addr v1, v4

    goto :goto_4

    :cond_6
    move v1, v2

    :goto_4
    sub-int/2addr v7, v1

    mul-int/lit8 v7, v7, 0x6

    shr-int/lit8 v7, v7, 0x3

    sub-int/2addr v7, v6

    .line 237
    new-array v8, v7, [B

    .line 238
    div-int/lit8 v9, v7, 0x3

    mul-int/lit8 v9, v9, 0x3

    move v10, v2

    move v11, v10

    :goto_5
    if-ge v10, v9, :cond_8

    .line 239
    sget-object v12, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    add-int/lit8 v13, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v14

    aget v14, v12, v14

    shl-int/lit8 v14, v14, 0x12

    add-int/lit8 v15, v5, 0x2

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    aget v13, v12, v13

    shl-int/lit8 v13, v13, 0xc

    or-int/2addr v13, v14

    add-int/lit8 v14, v5, 0x3

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    aget v15, v12, v15

    shl-int/lit8 v15, v15, 0x6

    or-int/2addr v13, v15

    add-int/lit8 v15, v5, 0x4

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    aget v12, v12, v14

    or-int/2addr v12, v13

    add-int/lit8 v13, v10, 0x1

    shr-int/lit8 v14, v12, 0x10

    int-to-byte v14, v14

    .line 240
    aput-byte v14, v8, v10

    add-int/lit8 v14, v10, 0x2

    shr-int/lit8 v2, v12, 0x8

    int-to-byte v2, v2

    .line 241
    aput-byte v2, v8, v13

    add-int/lit8 v10, v10, 0x3

    int-to-byte v2, v12

    .line 242
    aput-byte v2, v8, v14

    if-lez v1, :cond_7

    add-int/lit8 v11, v11, 0x1

    const/16 v2, 0x13

    if-ne v11, v2, :cond_7

    add-int/lit8 v5, v5, 0x6

    const/4 v11, 0x0

    goto :goto_6

    :cond_7
    move v5, v15

    :goto_6
    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    if-ge v10, v7, :cond_a

    const/4 v2, 0x0

    const/16 v16, 0x0

    :goto_7
    sub-int v1, v3, v6

    if-gt v5, v1, :cond_9

    .line 243
    sget-object v1, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aget v1, v1, v5

    mul-int/lit8 v5, v16, 0x6

    rsub-int/lit8 v5, v5, 0x12

    shl-int/2addr v1, v5

    or-int/2addr v2, v1

    add-int/lit8 v16, v16, 0x1

    move v5, v9

    goto :goto_7

    :cond_9
    const/16 v0, 0x10

    :goto_8
    if-ge v10, v7, :cond_a

    add-int/lit8 v1, v10, 0x1

    shr-int v3, v2, v0

    int-to-byte v3, v3

    .line 244
    aput-byte v3, v8, v10

    add-int/lit8 v0, v0, -0x8

    move v10, v1

    goto :goto_8

    :cond_a
    return-object v8
.end method

.method public static decodeFast([CII)[B
    .locals 16

    move/from16 v0, p2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 245
    new-array v0, v1, [B

    return-object v0

    :cond_0
    add-int v2, p1, v0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    move/from16 v4, p1

    :goto_0
    if-ge v4, v2, :cond_1

    .line 246
    sget-object v5, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    aget-char v6, p0, v4

    aget v5, v5, v6

    if-gez v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lez v2, :cond_2

    .line 247
    sget-object v5, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    aget-char v6, p0, v2

    aget v5, v5, v6

    if-gez v5, :cond_2

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 248
    :cond_2
    aget-char v5, p0, v2

    const/16 v6, 0x3d

    if-ne v5, v6, :cond_4

    add-int/lit8 v5, v2, -0x1

    aget-char v5, p0, v5

    if-ne v5, v6, :cond_3

    const/4 v5, 0x2

    goto :goto_2

    :cond_3
    move v5, v3

    goto :goto_2

    :cond_4
    move v5, v1

    :goto_2
    sub-int v6, v2, v4

    add-int/2addr v6, v3

    const/16 v7, 0x4c

    if-le v0, v7, :cond_6

    .line 249
    aget-char v0, p0, v7

    const/16 v7, 0xd

    if-ne v0, v7, :cond_5

    div-int/lit8 v0, v6, 0x4e

    goto :goto_3

    :cond_5
    move v0, v1

    :goto_3
    shl-int/2addr v0, v3

    goto :goto_4

    :cond_6
    move v0, v1

    :goto_4
    sub-int/2addr v6, v0

    mul-int/lit8 v6, v6, 0x6

    shr-int/lit8 v6, v6, 0x3

    sub-int/2addr v6, v5

    .line 250
    new-array v7, v6, [B

    .line 251
    div-int/lit8 v8, v6, 0x3

    mul-int/lit8 v8, v8, 0x3

    move v9, v1

    move v10, v9

    :goto_5
    if-ge v9, v8, :cond_8

    .line 252
    sget-object v11, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    add-int/lit8 v12, v4, 0x1

    aget-char v13, p0, v4

    aget v13, v11, v13

    shl-int/lit8 v13, v13, 0x12

    add-int/lit8 v14, v4, 0x2

    aget-char v12, p0, v12

    aget v12, v11, v12

    shl-int/lit8 v12, v12, 0xc

    or-int/2addr v12, v13

    add-int/lit8 v13, v4, 0x3

    aget-char v14, p0, v14

    aget v14, v11, v14

    shl-int/lit8 v14, v14, 0x6

    or-int/2addr v12, v14

    add-int/lit8 v14, v4, 0x4

    aget-char v13, p0, v13

    aget v11, v11, v13

    or-int/2addr v11, v12

    add-int/lit8 v12, v9, 0x1

    shr-int/lit8 v13, v11, 0x10

    int-to-byte v13, v13

    .line 253
    aput-byte v13, v7, v9

    add-int/lit8 v13, v9, 0x2

    shr-int/lit8 v15, v11, 0x8

    int-to-byte v15, v15

    .line 254
    aput-byte v15, v7, v12

    add-int/lit8 v9, v9, 0x3

    int-to-byte v11, v11

    .line 255
    aput-byte v11, v7, v13

    if-lez v0, :cond_7

    add-int/lit8 v10, v10, 0x1

    const/16 v11, 0x13

    if-ne v10, v11, :cond_7

    add-int/lit8 v4, v4, 0x6

    move v10, v1

    goto :goto_5

    :cond_7
    move v4, v14

    goto :goto_5

    :cond_8
    if-ge v9, v6, :cond_a

    move v0, v1

    :goto_6
    sub-int v8, v2, v5

    if-gt v4, v8, :cond_9

    .line 256
    sget-object v8, Lcom/alibaba/fastjson/util/Base64;->IA:[I

    add-int/lit8 v10, v4, 0x1

    aget-char v4, p0, v4

    aget v4, v8, v4

    mul-int/lit8 v8, v0, 0x6

    rsub-int/lit8 v8, v8, 0x12

    shl-int/2addr v4, v8

    or-int/2addr v1, v4

    add-int/2addr v0, v3

    move v4, v10

    goto :goto_6

    :cond_9
    const/16 v0, 0x10

    :goto_7
    if-ge v9, v6, :cond_a

    add-int/lit8 v2, v9, 0x1

    shr-int v3, v1, v0

    int-to-byte v3, v3

    .line 257
    aput-byte v3, v7, v9

    add-int/lit8 v0, v0, -0x8

    move v9, v2

    goto :goto_7

    :cond_a
    return-object v7
.end method
