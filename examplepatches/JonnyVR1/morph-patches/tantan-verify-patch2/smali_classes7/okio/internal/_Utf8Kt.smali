.class public final Lokio/internal/_Utf8Kt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0012\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0003\u001a\u00020\u0002*\u00020\u0001\u00a8\u0006\u0004"
    }
    d2 = {
        "commonAsUtf8ToByteArray",
        "",
        "",
        "commonToUtf8String",
        "jvm"
    }
    k = 0x2
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# direct methods
.method public static final commonAsUtf8ToByteArray(Ljava/lang/String;)[B
    .locals 11
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_0
    if-ge v2, v1, :cond_9

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/16 v4, 0x80

    .line 24
    .line 25
    if-lt v3, v4, :cond_8

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    move v3, v2

    .line 32
    :goto_1
    if-ge v2, v1, :cond_7

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    if-ge v5, v4, :cond_1

    .line 39
    .line 40
    int-to-byte v5, v5

    .line 41
    add-int/lit8 v6, v3, 0x1

    .line 42
    .line 43
    aput-byte v5, v0, v3

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    :goto_2
    if-ge v2, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v3, v4, :cond_0

    .line 54
    .line 55
    add-int/lit8 v3, v2, 0x1

    .line 56
    .line 57
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    int-to-byte v2, v2

    .line 62
    add-int/lit8 v5, v6, 0x1

    .line 63
    .line 64
    aput-byte v2, v0, v6

    .line 65
    .line 66
    move v2, v3

    .line 67
    move v6, v5

    .line 68
    goto :goto_2

    .line 69
    :cond_0
    move v3, v6

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const/16 v6, 0x800

    .line 72
    .line 73
    if-ge v5, v6, :cond_2

    .line 74
    .line 75
    shr-int/lit8 v6, v5, 0x6

    .line 76
    .line 77
    or-int/lit16 v6, v6, 0xc0

    .line 78
    .line 79
    int-to-byte v6, v6

    .line 80
    add-int/lit8 v7, v3, 0x1

    .line 81
    .line 82
    aput-byte v6, v0, v3

    .line 83
    .line 84
    and-int/lit8 v5, v5, 0x3f

    .line 85
    .line 86
    or-int/2addr v5, v4

    .line 87
    int-to-byte v5, v5

    .line 88
    add-int/lit8 v3, v3, 0x2

    .line 89
    .line 90
    aput-byte v5, v0, v7

    .line 91
    .line 92
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    const v6, 0xd800

    .line 96
    .line 97
    .line 98
    const/16 v7, 0x3f

    .line 99
    .line 100
    if-gt v6, v5, :cond_6

    .line 101
    .line 102
    const v6, 0xdfff

    .line 103
    .line 104
    .line 105
    if-ge v6, v5, :cond_3

    .line 106
    .line 107
    goto :goto_5

    .line 108
    :cond_3
    const v8, 0xdbff

    .line 109
    .line 110
    .line 111
    if-gt v5, v8, :cond_5

    .line 112
    .line 113
    add-int/lit8 v8, v2, 0x1

    .line 114
    .line 115
    if-le v1, v8, :cond_5

    .line 116
    .line 117
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    .line 118
    .line 119
    .line 120
    move-result v9

    .line 121
    const v10, 0xdc00

    .line 122
    .line 123
    .line 124
    if-gt v10, v9, :cond_5

    .line 125
    .line 126
    if-ge v6, v9, :cond_4

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_4
    shl-int/lit8 v5, v5, 0xa

    .line 130
    .line 131
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    add-int/2addr v5, v6

    .line 136
    const v6, -0x35fdc00

    .line 137
    .line 138
    .line 139
    add-int/2addr v5, v6

    .line 140
    shr-int/lit8 v6, v5, 0x12

    .line 141
    .line 142
    or-int/lit16 v6, v6, 0xf0

    .line 143
    .line 144
    int-to-byte v6, v6

    .line 145
    add-int/lit8 v8, v3, 0x1

    .line 146
    .line 147
    aput-byte v6, v0, v3

    .line 148
    .line 149
    shr-int/lit8 v6, v5, 0xc

    .line 150
    .line 151
    and-int/2addr v6, v7

    .line 152
    or-int/2addr v6, v4

    .line 153
    int-to-byte v6, v6

    .line 154
    add-int/lit8 v9, v3, 0x2

    .line 155
    .line 156
    aput-byte v6, v0, v8

    .line 157
    .line 158
    shr-int/lit8 v6, v5, 0x6

    .line 159
    .line 160
    and-int/2addr v6, v7

    .line 161
    or-int/2addr v6, v4

    .line 162
    int-to-byte v6, v6

    .line 163
    add-int/lit8 v8, v3, 0x3

    .line 164
    .line 165
    aput-byte v6, v0, v9

    .line 166
    .line 167
    and-int/2addr v5, v7

    .line 168
    or-int/2addr v5, v4

    .line 169
    int-to-byte v5, v5

    .line 170
    add-int/lit8 v3, v3, 0x4

    .line 171
    .line 172
    aput-byte v5, v0, v8

    .line 173
    .line 174
    add-int/lit8 v2, v2, 0x2

    .line 175
    .line 176
    goto/16 :goto_1

    .line 177
    .line 178
    :cond_5
    :goto_4
    add-int/lit8 v5, v3, 0x1

    .line 179
    .line 180
    aput-byte v7, v0, v3

    .line 181
    .line 182
    add-int/lit8 v2, v2, 0x1

    .line 183
    .line 184
    move v3, v5

    .line 185
    goto/16 :goto_1

    .line 186
    .line 187
    :cond_6
    :goto_5
    shr-int/lit8 v6, v5, 0xc

    .line 188
    .line 189
    or-int/lit16 v6, v6, 0xe0

    .line 190
    .line 191
    int-to-byte v6, v6

    .line 192
    add-int/lit8 v8, v3, 0x1

    .line 193
    .line 194
    aput-byte v6, v0, v3

    .line 195
    .line 196
    shr-int/lit8 v6, v5, 0x6

    .line 197
    .line 198
    and-int/2addr v6, v7

    .line 199
    or-int/2addr v6, v4

    .line 200
    int-to-byte v6, v6

    .line 201
    add-int/lit8 v7, v3, 0x2

    .line 202
    .line 203
    aput-byte v6, v0, v8

    .line 204
    .line 205
    and-int/lit8 v5, v5, 0x3f

    .line 206
    .line 207
    or-int/2addr v5, v4

    .line 208
    int-to-byte v5, v5

    .line 209
    add-int/lit8 v3, v3, 0x3

    .line 210
    .line 211
    aput-byte v5, v0, v7

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_7
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    return-object p0

    .line 219
    :cond_8
    int-to-byte v3, v3

    .line 220
    aput-byte v3, v0, v2

    .line 221
    .line 222
    add-int/lit8 v2, v2, 0x1

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    return-object p0
.end method

.method public static final commonToUtf8String([B)Ljava/lang/String;
    .locals 16
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    array-length v1, v0

    .line 7
    new-array v1, v1, [C

    .line 8
    .line 9
    array-length v2, v0

    .line 10
    const/4 v3, 0x0

    .line 11
    move v4, v3

    .line 12
    move v5, v4

    .line 13
    :goto_0
    if-ge v4, v2, :cond_19

    .line 14
    .line 15
    aget-byte v6, v0, v4

    .line 16
    .line 17
    if-ltz v6, :cond_1

    .line 18
    .line 19
    int-to-char v6, v6

    .line 20
    add-int/lit8 v7, v5, 0x1

    .line 21
    .line 22
    aput-char v6, v1, v5

    .line 23
    .line 24
    add-int/lit8 v4, v4, 0x1

    .line 25
    .line 26
    :goto_1
    if-ge v4, v2, :cond_0

    .line 27
    .line 28
    aget-byte v5, v0, v4

    .line 29
    .line 30
    if-ltz v5, :cond_0

    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    int-to-char v5, v5

    .line 35
    add-int/lit8 v6, v7, 0x1

    .line 36
    .line 37
    aput-char v5, v1, v7

    .line 38
    .line 39
    move v7, v6

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    move v5, v7

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    shr-int/lit8 v7, v6, 0x5

    .line 44
    .line 45
    const/4 v8, -0x2

    .line 46
    const/16 v10, 0x80

    .line 47
    .line 48
    const v11, 0xfffd

    .line 49
    .line 50
    .line 51
    const/4 v12, 0x1

    .line 52
    if-ne v7, v8, :cond_7

    .line 53
    .line 54
    add-int/lit8 v7, v4, 0x1

    .line 55
    .line 56
    if-gt v2, v7, :cond_3

    .line 57
    .line 58
    add-int/lit8 v6, v5, 0x1

    .line 59
    .line 60
    aput-char v11, v1, v5

    .line 61
    .line 62
    :cond_2
    :goto_2
    move v9, v12

    .line 63
    goto :goto_4

    .line 64
    :cond_3
    aget-byte v7, v0, v7

    .line 65
    .line 66
    and-int/lit16 v8, v7, 0xc0

    .line 67
    .line 68
    if-ne v8, v10, :cond_6

    .line 69
    .line 70
    xor-int/lit16 v7, v7, 0xf80

    .line 71
    .line 72
    shl-int/lit8 v6, v6, 0x6

    .line 73
    .line 74
    xor-int/2addr v6, v7

    .line 75
    if-ge v6, v10, :cond_4

    .line 76
    .line 77
    add-int/lit8 v6, v5, 0x1

    .line 78
    .line 79
    aput-char v11, v1, v5

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    int-to-char v6, v6

    .line 83
    add-int/lit8 v7, v5, 0x1

    .line 84
    .line 85
    aput-char v6, v1, v5

    .line 86
    .line 87
    move v6, v7

    .line 88
    :cond_5
    :goto_3
    const/4 v9, 0x2

    .line 89
    goto :goto_4

    .line 90
    :cond_6
    add-int/lit8 v6, v5, 0x1

    .line 91
    .line 92
    aput-char v11, v1, v5

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :goto_4
    add-int/2addr v4, v9

    .line 96
    :goto_5
    move v5, v6

    .line 97
    goto :goto_0

    .line 98
    :cond_7
    shr-int/lit8 v7, v6, 0x4

    .line 99
    .line 100
    const v13, 0xd800

    .line 101
    .line 102
    .line 103
    const v14, 0xdfff

    .line 104
    .line 105
    .line 106
    const/4 v15, 0x3

    .line 107
    if-ne v7, v8, :cond_e

    .line 108
    .line 109
    add-int/lit8 v7, v4, 0x2

    .line 110
    .line 111
    if-gt v2, v7, :cond_8

    .line 112
    .line 113
    add-int/lit8 v6, v5, 0x1

    .line 114
    .line 115
    aput-char v11, v1, v5

    .line 116
    .line 117
    add-int/lit8 v5, v4, 0x1

    .line 118
    .line 119
    if-le v2, v5, :cond_2

    .line 120
    .line 121
    aget-byte v5, v0, v5

    .line 122
    .line 123
    and-int/lit16 v5, v5, 0xc0

    .line 124
    .line 125
    if-ne v5, v10, :cond_2

    .line 126
    .line 127
    :goto_6
    goto :goto_3

    .line 128
    :cond_8
    add-int/lit8 v8, v4, 0x1

    .line 129
    .line 130
    aget-byte v8, v0, v8

    .line 131
    .line 132
    and-int/lit16 v9, v8, 0xc0

    .line 133
    .line 134
    if-ne v9, v10, :cond_d

    .line 135
    .line 136
    aget-byte v7, v0, v7

    .line 137
    .line 138
    and-int/lit16 v9, v7, 0xc0

    .line 139
    .line 140
    if-ne v9, v10, :cond_c

    .line 141
    .line 142
    const v9, -0x1e080

    .line 143
    .line 144
    .line 145
    xor-int/2addr v7, v9

    .line 146
    shl-int/lit8 v8, v8, 0x6

    .line 147
    .line 148
    xor-int/2addr v7, v8

    .line 149
    shl-int/lit8 v6, v6, 0xc

    .line 150
    .line 151
    xor-int/2addr v6, v7

    .line 152
    const/16 v7, 0x800

    .line 153
    .line 154
    if-ge v6, v7, :cond_9

    .line 155
    .line 156
    add-int/lit8 v6, v5, 0x1

    .line 157
    .line 158
    aput-char v11, v1, v5

    .line 159
    .line 160
    goto :goto_8

    .line 161
    :cond_9
    if-le v13, v6, :cond_a

    .line 162
    .line 163
    goto :goto_7

    .line 164
    :cond_a
    if-lt v14, v6, :cond_b

    .line 165
    .line 166
    add-int/lit8 v6, v5, 0x1

    .line 167
    .line 168
    aput-char v11, v1, v5

    .line 169
    .line 170
    goto :goto_8

    .line 171
    :cond_b
    :goto_7
    int-to-char v6, v6

    .line 172
    add-int/lit8 v7, v5, 0x1

    .line 173
    .line 174
    aput-char v6, v1, v5

    .line 175
    .line 176
    move v6, v7

    .line 177
    :goto_8
    move v9, v15

    .line 178
    goto :goto_4

    .line 179
    :cond_c
    add-int/lit8 v6, v5, 0x1

    .line 180
    .line 181
    aput-char v11, v1, v5

    .line 182
    .line 183
    goto :goto_6

    .line 184
    :cond_d
    add-int/lit8 v6, v5, 0x1

    .line 185
    .line 186
    aput-char v11, v1, v5

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_e
    shr-int/lit8 v7, v6, 0x3

    .line 190
    .line 191
    if-ne v7, v8, :cond_18

    .line 192
    .line 193
    add-int/lit8 v7, v4, 0x3

    .line 194
    .line 195
    if-gt v2, v7, :cond_f

    .line 196
    .line 197
    add-int/lit8 v6, v5, 0x1

    .line 198
    .line 199
    aput-char v11, v1, v5

    .line 200
    .line 201
    add-int/lit8 v5, v4, 0x1

    .line 202
    .line 203
    if-le v2, v5, :cond_2

    .line 204
    .line 205
    aget-byte v5, v0, v5

    .line 206
    .line 207
    and-int/lit16 v5, v5, 0xc0

    .line 208
    .line 209
    if-ne v5, v10, :cond_2

    .line 210
    .line 211
    add-int/lit8 v5, v4, 0x2

    .line 212
    .line 213
    if-le v2, v5, :cond_5

    .line 214
    .line 215
    aget-byte v5, v0, v5

    .line 216
    .line 217
    and-int/lit16 v5, v5, 0xc0

    .line 218
    .line 219
    if-ne v5, v10, :cond_5

    .line 220
    .line 221
    :goto_9
    goto :goto_8

    .line 222
    :cond_f
    add-int/lit8 v8, v4, 0x1

    .line 223
    .line 224
    aget-byte v8, v0, v8

    .line 225
    .line 226
    and-int/lit16 v9, v8, 0xc0

    .line 227
    .line 228
    if-ne v9, v10, :cond_17

    .line 229
    .line 230
    add-int/lit8 v9, v4, 0x2

    .line 231
    .line 232
    aget-byte v9, v0, v9

    .line 233
    .line 234
    and-int/lit16 v12, v9, 0xc0

    .line 235
    .line 236
    if-ne v12, v10, :cond_16

    .line 237
    .line 238
    aget-byte v7, v0, v7

    .line 239
    .line 240
    and-int/lit16 v12, v7, 0xc0

    .line 241
    .line 242
    if-ne v12, v10, :cond_15

    .line 243
    .line 244
    const v10, 0x381f80

    .line 245
    .line 246
    .line 247
    xor-int/2addr v7, v10

    .line 248
    shl-int/lit8 v9, v9, 0x6

    .line 249
    .line 250
    xor-int/2addr v7, v9

    .line 251
    shl-int/lit8 v8, v8, 0xc

    .line 252
    .line 253
    xor-int/2addr v7, v8

    .line 254
    shl-int/lit8 v6, v6, 0x12

    .line 255
    .line 256
    xor-int/2addr v6, v7

    .line 257
    const v7, 0x10ffff

    .line 258
    .line 259
    .line 260
    if-le v6, v7, :cond_10

    .line 261
    .line 262
    add-int/lit8 v6, v5, 0x1

    .line 263
    .line 264
    aput-char v11, v1, v5

    .line 265
    .line 266
    goto :goto_c

    .line 267
    :cond_10
    if-le v13, v6, :cond_11

    .line 268
    .line 269
    goto :goto_a

    .line 270
    :cond_11
    if-lt v14, v6, :cond_12

    .line 271
    .line 272
    add-int/lit8 v6, v5, 0x1

    .line 273
    .line 274
    aput-char v11, v1, v5

    .line 275
    .line 276
    goto :goto_c

    .line 277
    :cond_12
    :goto_a
    const/high16 v7, 0x10000

    .line 278
    .line 279
    if-ge v6, v7, :cond_13

    .line 280
    .line 281
    add-int/lit8 v6, v5, 0x1

    .line 282
    .line 283
    aput-char v11, v1, v5

    .line 284
    .line 285
    goto :goto_c

    .line 286
    :cond_13
    if-eq v6, v11, :cond_14

    .line 287
    .line 288
    ushr-int/lit8 v7, v6, 0xa

    .line 289
    .line 290
    const v8, 0xd7c0

    .line 291
    .line 292
    .line 293
    add-int/2addr v7, v8

    .line 294
    int-to-char v7, v7

    .line 295
    add-int/lit8 v8, v5, 0x1

    .line 296
    .line 297
    aput-char v7, v1, v5

    .line 298
    .line 299
    and-int/lit16 v6, v6, 0x3ff

    .line 300
    .line 301
    const v7, 0xdc00

    .line 302
    .line 303
    .line 304
    add-int/2addr v6, v7

    .line 305
    int-to-char v6, v6

    .line 306
    add-int/lit8 v5, v5, 0x2

    .line 307
    .line 308
    aput-char v6, v1, v8

    .line 309
    .line 310
    goto :goto_b

    .line 311
    :cond_14
    add-int/lit8 v6, v5, 0x1

    .line 312
    .line 313
    aput-char v11, v1, v5

    .line 314
    .line 315
    move v5, v6

    .line 316
    :goto_b
    move v6, v5

    .line 317
    :goto_c
    const/4 v9, 0x4

    .line 318
    goto/16 :goto_4

    .line 319
    .line 320
    :cond_15
    add-int/lit8 v6, v5, 0x1

    .line 321
    .line 322
    aput-char v11, v1, v5

    .line 323
    .line 324
    goto :goto_9

    .line 325
    :cond_16
    add-int/lit8 v6, v5, 0x1

    .line 326
    .line 327
    aput-char v11, v1, v5

    .line 328
    .line 329
    goto/16 :goto_3

    .line 330
    .line 331
    :cond_17
    add-int/lit8 v6, v5, 0x1

    .line 332
    .line 333
    aput-char v11, v1, v5

    .line 334
    .line 335
    goto/16 :goto_2

    .line 336
    .line 337
    :cond_18
    add-int/lit8 v6, v5, 0x1

    .line 338
    .line 339
    aput-char v11, v1, v5

    .line 340
    .line 341
    add-int/lit8 v4, v4, 0x1

    .line 342
    .line 343
    goto/16 :goto_5

    .line 344
    .line 345
    :cond_19
    new-instance v0, Ljava/lang/String;

    .line 346
    .line 347
    invoke-direct {v0, v1, v3, v5}, Ljava/lang/String;-><init>([CII)V

    .line 348
    .line 349
    .line 350
    return-object v0
.end method
