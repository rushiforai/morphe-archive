.class public Ll/iiw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static c:[B

.field private static final d:[C


# instance fields
.field a:Ll/jiw;

.field b:Ll/jiw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/iiw;->c:[B

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v0, v0, [C

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/iiw;->d:[C

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 1
        -0x80t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_1
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/iiw;->i()Ll/iiw;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static a([B)[B
    .locals 8

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const v1, 0x67452301

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    aput v1, v0, v2

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const v3, -0x10325477

    .line 12
    .line 13
    .line 14
    aput v3, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    const v3, -0x67452302

    .line 18
    .line 19
    .line 20
    aput v3, v0, v1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    const v3, 0x10325476

    .line 24
    .line 25
    .line 26
    aput v3, v0, v1

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    const v3, -0x3c2d1e10

    .line 30
    .line 31
    .line 32
    aput v3, v0, v1

    .line 33
    .line 34
    invoke-static {p0}, Ll/iiw;->j([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/16 v1, 0x40

    .line 39
    .line 40
    new-array v3, v1, [B

    .line 41
    .line 42
    new-array v4, v2, [B

    .line 43
    .line 44
    array-length v5, p0

    .line 45
    rem-int/2addr v5, v1

    .line 46
    if-eqz v5, :cond_0

    .line 47
    .line 48
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    array-length v5, p0

    .line 52
    div-int/2addr v5, v1

    .line 53
    move v6, v2

    .line 54
    :goto_0
    if-ge v6, v5, :cond_1

    .line 55
    .line 56
    mul-int/lit8 v7, v6, 0x40

    .line 57
    .line 58
    invoke-static {p0, v7, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v3}, Ll/iiw;->h([I[B)[I

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    add-int/lit8 v6, v6, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    array-length p0, v0

    .line 69
    :goto_1
    if-ge v2, p0, :cond_2

    .line 70
    .line 71
    aget v1, v0, v2

    .line 72
    .line 73
    invoke-static {v1}, Ll/iiw;->p(I)[B

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v4, v1}, Ll/iiw;->c([B[B)[B

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    return-object v4
.end method

.method public static b([B)[B
    .locals 8

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const v1, 0x67452301

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    aput v1, v0, v2

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const v3, -0x10325477

    .line 12
    .line 13
    .line 14
    aput v3, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    const v3, -0x67452302

    .line 18
    .line 19
    .line 20
    aput v3, v0, v1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    const v3, 0x10325476

    .line 24
    .line 25
    .line 26
    aput v3, v0, v1

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    const v3, -0x3c2d1e10

    .line 30
    .line 31
    .line 32
    aput v3, v0, v1

    .line 33
    .line 34
    invoke-static {p0}, Ll/iiw;->k([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/16 v1, 0x40

    .line 39
    .line 40
    new-array v3, v1, [B

    .line 41
    .line 42
    new-array v4, v2, [B

    .line 43
    .line 44
    array-length v5, p0

    .line 45
    rem-int/2addr v5, v1

    .line 46
    if-eqz v5, :cond_0

    .line 47
    .line 48
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    array-length v5, p0

    .line 52
    div-int/2addr v5, v1

    .line 53
    move v6, v2

    .line 54
    :goto_0
    if-ge v6, v5, :cond_1

    .line 55
    .line 56
    mul-int/lit8 v7, v6, 0x40

    .line 57
    .line 58
    invoke-static {p0, v7, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v3}, Ll/iiw;->h([I[B)[I

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    add-int/lit8 v6, v6, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    array-length p0, v0

    .line 69
    :goto_1
    if-ge v2, p0, :cond_2

    .line 70
    .line 71
    aget v1, v0, v2

    .line 72
    .line 73
    invoke-static {v1}, Ll/iiw;->p(I)[B

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v4, v1}, Ll/iiw;->c([B[B)[B

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    return-object v4
.end method

.method public static c([B[B)[B
    .locals 3

    .line 1
    array-length v0, p0

    .line 2
    array-length v1, p1

    .line 3
    add-int/2addr v0, v1

    .line 4
    new-array v0, v0, [B

    .line 5
    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    array-length p0, p0

    .line 12
    array-length v1, p1

    .line 13
    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method private d([BI[I)V
    .locals 2

    .line 1
    aget-byte p0, p1, p2

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0xff

    .line 4
    .line 5
    add-int/lit8 v0, p2, 0x1

    .line 6
    .line 7
    aget-byte v0, p1, v0

    .line 8
    .line 9
    and-int/lit16 v0, v0, 0xff

    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    shl-int/2addr v0, v1

    .line 14
    or-int/2addr p0, v0

    .line 15
    add-int/lit8 v0, p2, 0x2

    .line 16
    .line 17
    aget-byte v0, p1, v0

    .line 18
    .line 19
    and-int/lit16 v0, v0, 0xff

    .line 20
    .line 21
    shl-int/lit8 v0, v0, 0x10

    .line 22
    .line 23
    or-int/2addr p0, v0

    .line 24
    add-int/lit8 v0, p2, 0x3

    .line 25
    .line 26
    aget-byte v0, p1, v0

    .line 27
    .line 28
    shl-int/lit8 v0, v0, 0x18

    .line 29
    .line 30
    or-int/2addr p0, v0

    .line 31
    const/4 v0, 0x0

    .line 32
    aput p0, p3, v0

    .line 33
    .line 34
    add-int/lit8 p0, p2, 0x4

    .line 35
    .line 36
    aget-byte p0, p1, p0

    .line 37
    .line 38
    and-int/lit16 p0, p0, 0xff

    .line 39
    .line 40
    add-int/lit8 v0, p2, 0x5

    .line 41
    .line 42
    aget-byte v0, p1, v0

    .line 43
    .line 44
    and-int/lit16 v0, v0, 0xff

    .line 45
    .line 46
    shl-int/2addr v0, v1

    .line 47
    or-int/2addr p0, v0

    .line 48
    add-int/lit8 v0, p2, 0x6

    .line 49
    .line 50
    aget-byte v0, p1, v0

    .line 51
    .line 52
    and-int/lit16 v0, v0, 0xff

    .line 53
    .line 54
    shl-int/lit8 v0, v0, 0x10

    .line 55
    .line 56
    or-int/2addr p0, v0

    .line 57
    add-int/lit8 v0, p2, 0x7

    .line 58
    .line 59
    aget-byte v0, p1, v0

    .line 60
    .line 61
    shl-int/lit8 v0, v0, 0x18

    .line 62
    .line 63
    or-int/2addr p0, v0

    .line 64
    const/4 v0, 0x1

    .line 65
    aput p0, p3, v0

    .line 66
    .line 67
    add-int/lit8 p0, p2, 0x8

    .line 68
    .line 69
    aget-byte p0, p1, p0

    .line 70
    .line 71
    and-int/lit16 p0, p0, 0xff

    .line 72
    .line 73
    add-int/lit8 v0, p2, 0x9

    .line 74
    .line 75
    aget-byte v0, p1, v0

    .line 76
    .line 77
    and-int/lit16 v0, v0, 0xff

    .line 78
    .line 79
    shl-int/2addr v0, v1

    .line 80
    or-int/2addr p0, v0

    .line 81
    add-int/lit8 v0, p2, 0xa

    .line 82
    .line 83
    aget-byte v0, p1, v0

    .line 84
    .line 85
    and-int/lit16 v0, v0, 0xff

    .line 86
    .line 87
    shl-int/lit8 v0, v0, 0x10

    .line 88
    .line 89
    or-int/2addr p0, v0

    .line 90
    add-int/lit8 v0, p2, 0xb

    .line 91
    .line 92
    aget-byte v0, p1, v0

    .line 93
    .line 94
    shl-int/lit8 v0, v0, 0x18

    .line 95
    .line 96
    or-int/2addr p0, v0

    .line 97
    const/4 v0, 0x2

    .line 98
    aput p0, p3, v0

    .line 99
    .line 100
    add-int/lit8 p0, p2, 0xc

    .line 101
    .line 102
    aget-byte p0, p1, p0

    .line 103
    .line 104
    and-int/lit16 p0, p0, 0xff

    .line 105
    .line 106
    add-int/lit8 v0, p2, 0xd

    .line 107
    .line 108
    aget-byte v0, p1, v0

    .line 109
    .line 110
    and-int/lit16 v0, v0, 0xff

    .line 111
    .line 112
    shl-int/2addr v0, v1

    .line 113
    or-int/2addr p0, v0

    .line 114
    add-int/lit8 v0, p2, 0xe

    .line 115
    .line 116
    aget-byte v0, p1, v0

    .line 117
    .line 118
    and-int/lit16 v0, v0, 0xff

    .line 119
    .line 120
    shl-int/lit8 v0, v0, 0x10

    .line 121
    .line 122
    or-int/2addr p0, v0

    .line 123
    add-int/lit8 v0, p2, 0xf

    .line 124
    .line 125
    aget-byte v0, p1, v0

    .line 126
    .line 127
    shl-int/lit8 v0, v0, 0x18

    .line 128
    .line 129
    or-int/2addr p0, v0

    .line 130
    const/4 v0, 0x3

    .line 131
    aput p0, p3, v0

    .line 132
    .line 133
    add-int/lit8 p0, p2, 0x10

    .line 134
    .line 135
    aget-byte p0, p1, p0

    .line 136
    .line 137
    and-int/lit16 p0, p0, 0xff

    .line 138
    .line 139
    add-int/lit8 v0, p2, 0x11

    .line 140
    .line 141
    aget-byte v0, p1, v0

    .line 142
    .line 143
    and-int/lit16 v0, v0, 0xff

    .line 144
    .line 145
    shl-int/2addr v0, v1

    .line 146
    or-int/2addr p0, v0

    .line 147
    add-int/lit8 v0, p2, 0x12

    .line 148
    .line 149
    aget-byte v0, p1, v0

    .line 150
    .line 151
    and-int/lit16 v0, v0, 0xff

    .line 152
    .line 153
    shl-int/lit8 v0, v0, 0x10

    .line 154
    .line 155
    or-int/2addr p0, v0

    .line 156
    add-int/lit8 v0, p2, 0x13

    .line 157
    .line 158
    aget-byte v0, p1, v0

    .line 159
    .line 160
    shl-int/lit8 v0, v0, 0x18

    .line 161
    .line 162
    or-int/2addr p0, v0

    .line 163
    const/4 v0, 0x4

    .line 164
    aput p0, p3, v0

    .line 165
    .line 166
    add-int/lit8 p0, p2, 0x14

    .line 167
    .line 168
    aget-byte p0, p1, p0

    .line 169
    .line 170
    and-int/lit16 p0, p0, 0xff

    .line 171
    .line 172
    add-int/lit8 v0, p2, 0x15

    .line 173
    .line 174
    aget-byte v0, p1, v0

    .line 175
    .line 176
    and-int/lit16 v0, v0, 0xff

    .line 177
    .line 178
    shl-int/2addr v0, v1

    .line 179
    or-int/2addr p0, v0

    .line 180
    add-int/lit8 v0, p2, 0x16

    .line 181
    .line 182
    aget-byte v0, p1, v0

    .line 183
    .line 184
    and-int/lit16 v0, v0, 0xff

    .line 185
    .line 186
    shl-int/lit8 v0, v0, 0x10

    .line 187
    .line 188
    or-int/2addr p0, v0

    .line 189
    add-int/lit8 v0, p2, 0x17

    .line 190
    .line 191
    aget-byte v0, p1, v0

    .line 192
    .line 193
    shl-int/lit8 v0, v0, 0x18

    .line 194
    .line 195
    or-int/2addr p0, v0

    .line 196
    const/4 v0, 0x5

    .line 197
    aput p0, p3, v0

    .line 198
    .line 199
    add-int/lit8 p0, p2, 0x18

    .line 200
    .line 201
    aget-byte p0, p1, p0

    .line 202
    .line 203
    and-int/lit16 p0, p0, 0xff

    .line 204
    .line 205
    add-int/lit8 v0, p2, 0x19

    .line 206
    .line 207
    aget-byte v0, p1, v0

    .line 208
    .line 209
    and-int/lit16 v0, v0, 0xff

    .line 210
    .line 211
    shl-int/2addr v0, v1

    .line 212
    or-int/2addr p0, v0

    .line 213
    add-int/lit8 v0, p2, 0x1a

    .line 214
    .line 215
    aget-byte v0, p1, v0

    .line 216
    .line 217
    and-int/lit16 v0, v0, 0xff

    .line 218
    .line 219
    shl-int/lit8 v0, v0, 0x10

    .line 220
    .line 221
    or-int/2addr p0, v0

    .line 222
    add-int/lit8 v0, p2, 0x1b

    .line 223
    .line 224
    aget-byte v0, p1, v0

    .line 225
    .line 226
    shl-int/lit8 v0, v0, 0x18

    .line 227
    .line 228
    or-int/2addr p0, v0

    .line 229
    const/4 v0, 0x6

    .line 230
    aput p0, p3, v0

    .line 231
    .line 232
    add-int/lit8 p0, p2, 0x1c

    .line 233
    .line 234
    aget-byte p0, p1, p0

    .line 235
    .line 236
    and-int/lit16 p0, p0, 0xff

    .line 237
    .line 238
    add-int/lit8 v0, p2, 0x1d

    .line 239
    .line 240
    aget-byte v0, p1, v0

    .line 241
    .line 242
    and-int/lit16 v0, v0, 0xff

    .line 243
    .line 244
    shl-int/2addr v0, v1

    .line 245
    or-int/2addr p0, v0

    .line 246
    add-int/lit8 v0, p2, 0x1e

    .line 247
    .line 248
    aget-byte v0, p1, v0

    .line 249
    .line 250
    and-int/lit16 v0, v0, 0xff

    .line 251
    .line 252
    shl-int/lit8 v0, v0, 0x10

    .line 253
    .line 254
    or-int/2addr p0, v0

    .line 255
    add-int/lit8 v0, p2, 0x1f

    .line 256
    .line 257
    aget-byte v0, p1, v0

    .line 258
    .line 259
    shl-int/lit8 v0, v0, 0x18

    .line 260
    .line 261
    or-int/2addr p0, v0

    .line 262
    const/4 v0, 0x7

    .line 263
    aput p0, p3, v0

    .line 264
    .line 265
    add-int/lit8 p0, p2, 0x20

    .line 266
    .line 267
    aget-byte p0, p1, p0

    .line 268
    .line 269
    and-int/lit16 p0, p0, 0xff

    .line 270
    .line 271
    add-int/lit8 v0, p2, 0x21

    .line 272
    .line 273
    aget-byte v0, p1, v0

    .line 274
    .line 275
    and-int/lit16 v0, v0, 0xff

    .line 276
    .line 277
    shl-int/2addr v0, v1

    .line 278
    or-int/2addr p0, v0

    .line 279
    add-int/lit8 v0, p2, 0x22

    .line 280
    .line 281
    aget-byte v0, p1, v0

    .line 282
    .line 283
    and-int/lit16 v0, v0, 0xff

    .line 284
    .line 285
    shl-int/lit8 v0, v0, 0x10

    .line 286
    .line 287
    or-int/2addr p0, v0

    .line 288
    add-int/lit8 v0, p2, 0x23

    .line 289
    .line 290
    aget-byte v0, p1, v0

    .line 291
    .line 292
    shl-int/lit8 v0, v0, 0x18

    .line 293
    .line 294
    or-int/2addr p0, v0

    .line 295
    aput p0, p3, v1

    .line 296
    .line 297
    add-int/lit8 p0, p2, 0x24

    .line 298
    .line 299
    aget-byte p0, p1, p0

    .line 300
    .line 301
    and-int/lit16 p0, p0, 0xff

    .line 302
    .line 303
    add-int/lit8 v0, p2, 0x25

    .line 304
    .line 305
    aget-byte v0, p1, v0

    .line 306
    .line 307
    and-int/lit16 v0, v0, 0xff

    .line 308
    .line 309
    shl-int/2addr v0, v1

    .line 310
    or-int/2addr p0, v0

    .line 311
    add-int/lit8 v0, p2, 0x26

    .line 312
    .line 313
    aget-byte v0, p1, v0

    .line 314
    .line 315
    and-int/lit16 v0, v0, 0xff

    .line 316
    .line 317
    shl-int/lit8 v0, v0, 0x10

    .line 318
    .line 319
    or-int/2addr p0, v0

    .line 320
    add-int/lit8 v0, p2, 0x27

    .line 321
    .line 322
    aget-byte v0, p1, v0

    .line 323
    .line 324
    shl-int/lit8 v0, v0, 0x18

    .line 325
    .line 326
    or-int/2addr p0, v0

    .line 327
    const/16 v0, 0x9

    .line 328
    .line 329
    aput p0, p3, v0

    .line 330
    .line 331
    add-int/lit8 p0, p2, 0x28

    .line 332
    .line 333
    aget-byte p0, p1, p0

    .line 334
    .line 335
    and-int/lit16 p0, p0, 0xff

    .line 336
    .line 337
    add-int/lit8 v0, p2, 0x29

    .line 338
    .line 339
    aget-byte v0, p1, v0

    .line 340
    .line 341
    and-int/lit16 v0, v0, 0xff

    .line 342
    .line 343
    shl-int/2addr v0, v1

    .line 344
    or-int/2addr p0, v0

    .line 345
    add-int/lit8 v0, p2, 0x2a

    .line 346
    .line 347
    aget-byte v0, p1, v0

    .line 348
    .line 349
    and-int/lit16 v0, v0, 0xff

    .line 350
    .line 351
    shl-int/lit8 v0, v0, 0x10

    .line 352
    .line 353
    or-int/2addr p0, v0

    .line 354
    add-int/lit8 v0, p2, 0x2b

    .line 355
    .line 356
    aget-byte v0, p1, v0

    .line 357
    .line 358
    shl-int/lit8 v0, v0, 0x18

    .line 359
    .line 360
    or-int/2addr p0, v0

    .line 361
    const/16 v0, 0xa

    .line 362
    .line 363
    aput p0, p3, v0

    .line 364
    .line 365
    add-int/lit8 p0, p2, 0x2c

    .line 366
    .line 367
    aget-byte p0, p1, p0

    .line 368
    .line 369
    and-int/lit16 p0, p0, 0xff

    .line 370
    .line 371
    add-int/lit8 v0, p2, 0x2d

    .line 372
    .line 373
    aget-byte v0, p1, v0

    .line 374
    .line 375
    and-int/lit16 v0, v0, 0xff

    .line 376
    .line 377
    shl-int/2addr v0, v1

    .line 378
    or-int/2addr p0, v0

    .line 379
    add-int/lit8 v0, p2, 0x2e

    .line 380
    .line 381
    aget-byte v0, p1, v0

    .line 382
    .line 383
    and-int/lit16 v0, v0, 0xff

    .line 384
    .line 385
    shl-int/lit8 v0, v0, 0x10

    .line 386
    .line 387
    or-int/2addr p0, v0

    .line 388
    add-int/lit8 v0, p2, 0x2f

    .line 389
    .line 390
    aget-byte v0, p1, v0

    .line 391
    .line 392
    shl-int/lit8 v0, v0, 0x18

    .line 393
    .line 394
    or-int/2addr p0, v0

    .line 395
    const/16 v0, 0xb

    .line 396
    .line 397
    aput p0, p3, v0

    .line 398
    .line 399
    add-int/lit8 p0, p2, 0x30

    .line 400
    .line 401
    aget-byte p0, p1, p0

    .line 402
    .line 403
    and-int/lit16 p0, p0, 0xff

    .line 404
    .line 405
    add-int/lit8 v0, p2, 0x31

    .line 406
    .line 407
    aget-byte v0, p1, v0

    .line 408
    .line 409
    and-int/lit16 v0, v0, 0xff

    .line 410
    .line 411
    shl-int/2addr v0, v1

    .line 412
    or-int/2addr p0, v0

    .line 413
    add-int/lit8 v0, p2, 0x32

    .line 414
    .line 415
    aget-byte v0, p1, v0

    .line 416
    .line 417
    and-int/lit16 v0, v0, 0xff

    .line 418
    .line 419
    shl-int/lit8 v0, v0, 0x10

    .line 420
    .line 421
    or-int/2addr p0, v0

    .line 422
    add-int/lit8 v0, p2, 0x33

    .line 423
    .line 424
    aget-byte v0, p1, v0

    .line 425
    .line 426
    shl-int/lit8 v0, v0, 0x18

    .line 427
    .line 428
    or-int/2addr p0, v0

    .line 429
    const/16 v0, 0xc

    .line 430
    .line 431
    aput p0, p3, v0

    .line 432
    .line 433
    add-int/lit8 p0, p2, 0x34

    .line 434
    .line 435
    aget-byte p0, p1, p0

    .line 436
    .line 437
    and-int/lit16 p0, p0, 0xff

    .line 438
    .line 439
    add-int/lit8 v0, p2, 0x35

    .line 440
    .line 441
    aget-byte v0, p1, v0

    .line 442
    .line 443
    and-int/lit16 v0, v0, 0xff

    .line 444
    .line 445
    shl-int/2addr v0, v1

    .line 446
    or-int/2addr p0, v0

    .line 447
    add-int/lit8 v0, p2, 0x36

    .line 448
    .line 449
    aget-byte v0, p1, v0

    .line 450
    .line 451
    and-int/lit16 v0, v0, 0xff

    .line 452
    .line 453
    shl-int/lit8 v0, v0, 0x10

    .line 454
    .line 455
    or-int/2addr p0, v0

    .line 456
    add-int/lit8 v0, p2, 0x37

    .line 457
    .line 458
    aget-byte v0, p1, v0

    .line 459
    .line 460
    shl-int/lit8 v0, v0, 0x18

    .line 461
    .line 462
    or-int/2addr p0, v0

    .line 463
    const/16 v0, 0xd

    .line 464
    .line 465
    aput p0, p3, v0

    .line 466
    .line 467
    add-int/lit8 p0, p2, 0x38

    .line 468
    .line 469
    aget-byte p0, p1, p0

    .line 470
    .line 471
    and-int/lit16 p0, p0, 0xff

    .line 472
    .line 473
    add-int/lit8 v0, p2, 0x39

    .line 474
    .line 475
    aget-byte v0, p1, v0

    .line 476
    .line 477
    and-int/lit16 v0, v0, 0xff

    .line 478
    .line 479
    shl-int/2addr v0, v1

    .line 480
    or-int/2addr p0, v0

    .line 481
    add-int/lit8 v0, p2, 0x3a

    .line 482
    .line 483
    aget-byte v0, p1, v0

    .line 484
    .line 485
    and-int/lit16 v0, v0, 0xff

    .line 486
    .line 487
    shl-int/lit8 v0, v0, 0x10

    .line 488
    .line 489
    or-int/2addr p0, v0

    .line 490
    add-int/lit8 v0, p2, 0x3b

    .line 491
    .line 492
    aget-byte v0, p1, v0

    .line 493
    .line 494
    shl-int/lit8 v0, v0, 0x18

    .line 495
    .line 496
    or-int/2addr p0, v0

    .line 497
    const/16 v0, 0xe

    .line 498
    .line 499
    aput p0, p3, v0

    .line 500
    .line 501
    add-int/lit8 p0, p2, 0x3c

    .line 502
    .line 503
    aget-byte p0, p1, p0

    .line 504
    .line 505
    and-int/lit16 p0, p0, 0xff

    .line 506
    .line 507
    add-int/lit8 v0, p2, 0x3d

    .line 508
    .line 509
    aget-byte v0, p1, v0

    .line 510
    .line 511
    and-int/lit16 v0, v0, 0xff

    .line 512
    .line 513
    shl-int/2addr v0, v1

    .line 514
    or-int/2addr p0, v0

    .line 515
    add-int/lit8 v0, p2, 0x3e

    .line 516
    .line 517
    aget-byte v0, p1, v0

    .line 518
    .line 519
    and-int/lit16 v0, v0, 0xff

    .line 520
    .line 521
    shl-int/lit8 v0, v0, 0x10

    .line 522
    .line 523
    or-int/2addr p0, v0

    .line 524
    add-int/lit8 p2, p2, 0x3f

    .line 525
    .line 526
    aget-byte p1, p1, p2

    .line 527
    .line 528
    shl-int/lit8 p1, p1, 0x18

    .line 529
    .line 530
    or-int/2addr p0, p1

    .line 531
    const/16 p1, 0xf

    .line 532
    .line 533
    aput p0, p3, p1

    .line 534
    .line 535
    return-void
.end method

.method private e([II)[B
    .locals 4

    .line 1
    new-array p0, p2, [B

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    move v0, p2

    .line 5
    :goto_0
    array-length v1, p1

    .line 6
    if-ge p2, v1, :cond_0

    .line 7
    .line 8
    aget v1, p1, p2

    .line 9
    .line 10
    and-int/lit16 v2, v1, 0xff

    .line 11
    .line 12
    int-to-byte v2, v2

    .line 13
    aput-byte v2, p0, v0

    .line 14
    .line 15
    add-int/lit8 v2, v0, 0x1

    .line 16
    .line 17
    ushr-int/lit8 v3, v1, 0x8

    .line 18
    .line 19
    and-int/lit16 v3, v3, 0xff

    .line 20
    .line 21
    int-to-byte v3, v3

    .line 22
    aput-byte v3, p0, v2

    .line 23
    .line 24
    add-int/lit8 v2, v0, 0x2

    .line 25
    .line 26
    ushr-int/lit8 v3, v1, 0x10

    .line 27
    .line 28
    and-int/lit16 v3, v3, 0xff

    .line 29
    .line 30
    int-to-byte v3, v3

    .line 31
    aput-byte v3, p0, v2

    .line 32
    .line 33
    add-int/lit8 v2, v0, 0x3

    .line 34
    .line 35
    ushr-int/lit8 v1, v1, 0x18

    .line 36
    .line 37
    and-int/lit16 v1, v1, 0xff

    .line 38
    .line 39
    int-to-byte v1, v1

    .line 40
    aput-byte v1, p0, v2

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x4

    .line 43
    .line 44
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object p0
.end method

.method private f([II)[B
    .locals 4

    .line 1
    new-array p0, p2, [B

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    move v0, p2

    .line 5
    :goto_0
    array-length v1, p1

    .line 6
    if-ge p2, v1, :cond_0

    .line 7
    .line 8
    aget v1, p1, p2

    .line 9
    .line 10
    and-int/lit16 v2, v1, 0xff

    .line 11
    .line 12
    int-to-byte v2, v2

    .line 13
    aput-byte v2, p0, v0

    .line 14
    .line 15
    add-int/lit8 v2, v0, 0x1

    .line 16
    .line 17
    ushr-int/lit8 v3, v1, 0x8

    .line 18
    .line 19
    and-int/lit16 v3, v3, 0xff

    .line 20
    .line 21
    int-to-byte v3, v3

    .line 22
    aput-byte v3, p0, v2

    .line 23
    .line 24
    add-int/lit8 v2, v0, 0x2

    .line 25
    .line 26
    ushr-int/lit8 v3, v1, 0x10

    .line 27
    .line 28
    and-int/lit16 v3, v3, 0xff

    .line 29
    .line 30
    int-to-byte v3, v3

    .line 31
    aput-byte v3, p0, v2

    .line 32
    .line 33
    add-int/lit8 v2, v0, 0x3

    .line 34
    .line 35
    ushr-int/lit8 v1, v1, 0x18

    .line 36
    .line 37
    and-int/lit16 v1, v1, 0xff

    .line 38
    .line 39
    int-to-byte v1, v1

    .line 40
    aput-byte v1, p0, v2

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x4

    .line 43
    .line 44
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {p0}, Ll/iiw;->a([B)[B

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method private static h([I[B)[I
    .locals 16

    .line 1
    const v0, -0x70e44324

    .line 2
    .line 3
    .line 4
    const v1, -0x359d3e2a    # -3715189.5f

    .line 5
    .line 6
    .line 7
    const v2, 0x5a827999

    .line 8
    .line 9
    .line 10
    const v3, 0x6ed9eba1

    .line 11
    .line 12
    .line 13
    filled-new-array {v2, v3, v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/16 v1, 0x50

    .line 18
    .line 19
    new-array v2, v1, [I

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    move v4, v3

    .line 23
    :goto_0
    const/16 v5, 0x10

    .line 24
    .line 25
    const/4 v6, 0x4

    .line 26
    if-ge v4, v5, :cond_1

    .line 27
    .line 28
    move v5, v3

    .line 29
    :goto_1
    if-ge v5, v6, :cond_0

    .line 30
    .line 31
    mul-int/lit8 v7, v4, 0x4

    .line 32
    .line 33
    add-int/2addr v7, v5

    .line 34
    aget-byte v7, p1, v7

    .line 35
    .line 36
    and-int/lit16 v7, v7, 0xff

    .line 37
    .line 38
    mul-int/lit8 v8, v5, 0x8

    .line 39
    .line 40
    rsub-int/lit8 v8, v8, 0x18

    .line 41
    .line 42
    shl-int/2addr v7, v8

    .line 43
    aget v8, v2, v4

    .line 44
    .line 45
    or-int/2addr v7, v8

    .line 46
    aput v7, v2, v4

    .line 47
    .line 48
    add-int/lit8 v5, v5, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    :goto_2
    const/4 v4, 0x1

    .line 55
    if-ge v5, v1, :cond_2

    .line 56
    .line 57
    add-int/lit8 v7, v5, -0x3

    .line 58
    .line 59
    aget v7, v2, v7

    .line 60
    .line 61
    add-int/lit8 v8, v5, -0x8

    .line 62
    .line 63
    aget v8, v2, v8

    .line 64
    .line 65
    xor-int/2addr v7, v8

    .line 66
    add-int/lit8 v8, v5, -0xe

    .line 67
    .line 68
    aget v8, v2, v8

    .line 69
    .line 70
    xor-int/2addr v7, v8

    .line 71
    add-int/lit8 v8, v5, -0x10

    .line 72
    .line 73
    aget v8, v2, v8

    .line 74
    .line 75
    xor-int/2addr v7, v8

    .line 76
    invoke-static {v7, v4}, Ll/iiw;->q(II)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    aput v4, v2, v5

    .line 81
    .line 82
    add-int/lit8 v5, v5, 0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    aget v5, p0, v3

    .line 86
    .line 87
    aget v7, p0, v4

    .line 88
    .line 89
    const/4 v8, 0x2

    .line 90
    aget v9, p0, v8

    .line 91
    .line 92
    const/4 v10, 0x3

    .line 93
    aget v11, p0, v10

    .line 94
    .line 95
    aget v12, p0, v6

    .line 96
    .line 97
    move v13, v3

    .line 98
    :goto_3
    if-ge v13, v1, :cond_6

    .line 99
    .line 100
    const/16 v14, 0x14

    .line 101
    .line 102
    const/4 v15, 0x5

    .line 103
    if-ge v13, v14, :cond_3

    .line 104
    .line 105
    and-int v14, v7, v9

    .line 106
    .line 107
    not-int v1, v7

    .line 108
    and-int/2addr v1, v11

    .line 109
    or-int/2addr v1, v14

    .line 110
    invoke-static {v5, v15}, Ll/iiw;->q(II)I

    .line 111
    .line 112
    .line 113
    move-result v14

    .line 114
    add-int/2addr v14, v1

    .line 115
    add-int/2addr v14, v12

    .line 116
    aget v1, v0, v3

    .line 117
    .line 118
    add-int/2addr v14, v1

    .line 119
    aget v1, v2, v13

    .line 120
    .line 121
    :goto_4
    add-int/2addr v14, v1

    .line 122
    goto :goto_5

    .line 123
    :cond_3
    const/16 v1, 0x28

    .line 124
    .line 125
    if-ge v13, v1, :cond_4

    .line 126
    .line 127
    xor-int v1, v7, v9

    .line 128
    .line 129
    xor-int/2addr v1, v11

    .line 130
    invoke-static {v5, v15}, Ll/iiw;->q(II)I

    .line 131
    .line 132
    .line 133
    move-result v14

    .line 134
    add-int/2addr v14, v1

    .line 135
    add-int/2addr v14, v12

    .line 136
    aget v1, v0, v4

    .line 137
    .line 138
    add-int/2addr v14, v1

    .line 139
    aget v1, v2, v13

    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_4
    const/16 v1, 0x3c

    .line 143
    .line 144
    if-ge v13, v1, :cond_5

    .line 145
    .line 146
    or-int v1, v9, v11

    .line 147
    .line 148
    and-int/2addr v1, v7

    .line 149
    and-int v14, v9, v11

    .line 150
    .line 151
    or-int/2addr v1, v14

    .line 152
    invoke-static {v5, v15}, Ll/iiw;->q(II)I

    .line 153
    .line 154
    .line 155
    move-result v14

    .line 156
    add-int/2addr v14, v1

    .line 157
    add-int/2addr v14, v12

    .line 158
    aget v1, v0, v8

    .line 159
    .line 160
    add-int/2addr v14, v1

    .line 161
    aget v1, v2, v13

    .line 162
    .line 163
    goto :goto_4

    .line 164
    :cond_5
    xor-int v1, v7, v9

    .line 165
    .line 166
    xor-int/2addr v1, v11

    .line 167
    invoke-static {v5, v15}, Ll/iiw;->q(II)I

    .line 168
    .line 169
    .line 170
    move-result v14

    .line 171
    add-int/2addr v14, v1

    .line 172
    add-int/2addr v14, v12

    .line 173
    aget v1, v0, v10

    .line 174
    .line 175
    add-int/2addr v14, v1

    .line 176
    aget v1, v2, v13

    .line 177
    .line 178
    goto :goto_4

    .line 179
    :goto_5
    const/16 v1, 0x1e

    .line 180
    .line 181
    invoke-static {v7, v1}, Ll/iiw;->q(II)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    add-int/lit8 v13, v13, 0x1

    .line 186
    .line 187
    move v7, v5

    .line 188
    move v12, v11

    .line 189
    move v5, v14

    .line 190
    move v11, v9

    .line 191
    move v9, v1

    .line 192
    const/16 v1, 0x50

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_6
    aget v0, p0, v3

    .line 196
    .line 197
    add-int/2addr v0, v5

    .line 198
    aput v0, p0, v3

    .line 199
    .line 200
    aget v0, p0, v4

    .line 201
    .line 202
    add-int/2addr v0, v7

    .line 203
    aput v0, p0, v4

    .line 204
    .line 205
    aget v0, p0, v8

    .line 206
    .line 207
    add-int/2addr v0, v9

    .line 208
    aput v0, p0, v8

    .line 209
    .line 210
    aget v0, p0, v10

    .line 211
    .line 212
    add-int/2addr v0, v11

    .line 213
    aput v0, p0, v10

    .line 214
    .line 215
    aget v0, p0, v6

    .line 216
    .line 217
    add-int/2addr v0, v12

    .line 218
    aput v0, p0, v6

    .line 219
    .line 220
    return-object p0
.end method

.method private static j([B)[B
    .locals 12

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x32

    .line 3
    .line 4
    rem-int/lit8 v1, v0, 0x40

    .line 5
    .line 6
    rsub-int/lit8 v2, v1, 0x40

    .line 7
    .line 8
    const/16 v3, 0x9

    .line 9
    .line 10
    if-lt v2, v3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    rsub-int v2, v1, 0x80

    .line 14
    .line 15
    :goto_0
    new-array v1, v2, [B

    .line 16
    .line 17
    const/16 v3, -0x80

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    aput-byte v3, v1, v4

    .line 21
    .line 22
    mul-int/lit8 v3, v0, 0x8

    .line 23
    .line 24
    int-to-long v5, v3

    .line 25
    move v3, v4

    .line 26
    :goto_1
    const/16 v7, 0x8

    .line 27
    .line 28
    if-ge v3, v7, :cond_1

    .line 29
    .line 30
    add-int/lit8 v7, v2, -0x1

    .line 31
    .line 32
    sub-int/2addr v7, v3

    .line 33
    mul-int/lit8 v8, v3, 0x8

    .line 34
    .line 35
    shr-long v8, v5, v8

    .line 36
    .line 37
    const-wide/16 v10, 0xff

    .line 38
    .line 39
    and-long/2addr v8, v10

    .line 40
    long-to-int v8, v8

    .line 41
    int-to-byte v8, v8

    .line 42
    aput-byte v8, v1, v7

    .line 43
    .line 44
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    add-int v3, v0, v2

    .line 48
    .line 49
    new-array v3, v3, [B

    .line 50
    .line 51
    :try_start_0
    const-string v5, "hjYCH7mA4HYSHNe0rgnhWM30uFkylEdFnwFy6W4Zg5N1X9Om9P"

    .line 52
    .line 53
    const-string v6, "UTF-8"

    .line 54
    .line 55
    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-static {v5, p0}, Ll/iiw;->c([B[B)[B

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :catch_0
    move-exception p0

    .line 68
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 72
    .line 73
    .line 74
    :goto_2
    invoke-static {v1, v4, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    return-object v3
.end method

.method private static k([B)[B
    .locals 12

    .line 1
    array-length v0, p0

    .line 2
    rem-int/lit8 v1, v0, 0x40

    .line 3
    .line 4
    rsub-int/lit8 v2, v1, 0x40

    .line 5
    .line 6
    const/16 v3, 0x9

    .line 7
    .line 8
    if-lt v2, v3, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    rsub-int v2, v1, 0x80

    .line 12
    .line 13
    :goto_0
    new-array v1, v2, [B

    .line 14
    .line 15
    const/16 v3, -0x80

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    aput-byte v3, v1, v4

    .line 19
    .line 20
    mul-int/lit8 v3, v0, 0x8

    .line 21
    .line 22
    int-to-long v5, v3

    .line 23
    move v3, v4

    .line 24
    :goto_1
    const/16 v7, 0x8

    .line 25
    .line 26
    if-ge v3, v7, :cond_1

    .line 27
    .line 28
    add-int/lit8 v7, v2, -0x1

    .line 29
    .line 30
    sub-int/2addr v7, v3

    .line 31
    mul-int/lit8 v8, v3, 0x8

    .line 32
    .line 33
    shr-long v8, v5, v8

    .line 34
    .line 35
    const-wide/16 v10, 0xff

    .line 36
    .line 37
    and-long/2addr v8, v10

    .line 38
    long-to-int v8, v8

    .line 39
    int-to-byte v8, v8

    .line 40
    aput-byte v8, v1, v7

    .line 41
    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    add-int v3, v0, v2

    .line 46
    .line 47
    new-array v3, v3, [B

    .line 48
    .line 49
    invoke-static {p0, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v4, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    return-object v3
.end method

.method private l(Ll/jiw;[BI[I)V
    .locals 31

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p4

    .line 4
    .line 5
    iget-object v2, v0, Ll/jiw;->a:[I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    aget v4, v2, v3

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    aget v6, v2, v5

    .line 12
    .line 13
    const/4 v7, 0x2

    .line 14
    aget v8, v2, v7

    .line 15
    .line 16
    const/4 v9, 0x3

    .line 17
    aget v2, v2, v9

    .line 18
    .line 19
    move-object/from16 v10, p0

    .line 20
    .line 21
    move-object/from16 v11, p2

    .line 22
    .line 23
    move/from16 v12, p3

    .line 24
    .line 25
    invoke-direct {v10, v11, v12, v1}, Ll/iiw;->d([BI[I)V

    .line 26
    .line 27
    .line 28
    and-int v10, v6, v8

    .line 29
    .line 30
    not-int v11, v6

    .line 31
    and-int/2addr v11, v2

    .line 32
    or-int/2addr v10, v11

    .line 33
    aget v11, v1, v3

    .line 34
    .line 35
    add-int/2addr v10, v11

    .line 36
    const v12, -0x28955b88

    .line 37
    .line 38
    .line 39
    add-int/2addr v10, v12

    .line 40
    add-int/2addr v4, v10

    .line 41
    shl-int/lit8 v10, v4, 0x7

    .line 42
    .line 43
    ushr-int/lit8 v4, v4, 0x19

    .line 44
    .line 45
    or-int/2addr v4, v10

    .line 46
    add-int/2addr v4, v6

    .line 47
    and-int v10, v4, v6

    .line 48
    .line 49
    not-int v12, v4

    .line 50
    and-int/2addr v12, v8

    .line 51
    or-int/2addr v10, v12

    .line 52
    aget v12, v1, v5

    .line 53
    .line 54
    add-int/2addr v10, v12

    .line 55
    const v13, -0x173848aa

    .line 56
    .line 57
    .line 58
    add-int/2addr v10, v13

    .line 59
    add-int/2addr v2, v10

    .line 60
    shl-int/lit8 v10, v2, 0xc

    .line 61
    .line 62
    ushr-int/lit8 v2, v2, 0x14

    .line 63
    .line 64
    or-int/2addr v2, v10

    .line 65
    add-int/2addr v2, v4

    .line 66
    and-int v10, v2, v4

    .line 67
    .line 68
    not-int v13, v2

    .line 69
    and-int/2addr v13, v6

    .line 70
    or-int/2addr v10, v13

    .line 71
    aget v13, v1, v7

    .line 72
    .line 73
    add-int/2addr v10, v13

    .line 74
    const v14, 0x242070db

    .line 75
    .line 76
    .line 77
    add-int/2addr v10, v14

    .line 78
    add-int/2addr v8, v10

    .line 79
    shl-int/lit8 v10, v8, 0x11

    .line 80
    .line 81
    const/16 v14, 0xf

    .line 82
    .line 83
    ushr-int/2addr v8, v14

    .line 84
    or-int/2addr v8, v10

    .line 85
    add-int/2addr v8, v2

    .line 86
    and-int v10, v8, v2

    .line 87
    .line 88
    not-int v15, v8

    .line 89
    and-int/2addr v15, v4

    .line 90
    or-int/2addr v10, v15

    .line 91
    aget v15, v1, v9

    .line 92
    .line 93
    add-int/2addr v10, v15

    .line 94
    const v16, -0x3e423112

    .line 95
    .line 96
    .line 97
    add-int v10, v10, v16

    .line 98
    .line 99
    add-int/2addr v6, v10

    .line 100
    shl-int/lit8 v10, v6, 0x16

    .line 101
    .line 102
    const/16 v16, 0xa

    .line 103
    .line 104
    ushr-int/lit8 v6, v6, 0xa

    .line 105
    .line 106
    or-int/2addr v6, v10

    .line 107
    add-int/2addr v6, v8

    .line 108
    and-int v10, v6, v8

    .line 109
    .line 110
    move/from16 v17, v3

    .line 111
    .line 112
    not-int v3, v6

    .line 113
    and-int/2addr v3, v2

    .line 114
    or-int/2addr v3, v10

    .line 115
    const/4 v10, 0x4

    .line 116
    aget v10, v1, v10

    .line 117
    .line 118
    add-int/2addr v3, v10

    .line 119
    const v18, -0xa83f051

    .line 120
    .line 121
    .line 122
    add-int v3, v3, v18

    .line 123
    .line 124
    add-int/2addr v4, v3

    .line 125
    shl-int/lit8 v3, v4, 0x7

    .line 126
    .line 127
    ushr-int/lit8 v4, v4, 0x19

    .line 128
    .line 129
    or-int/2addr v3, v4

    .line 130
    add-int/2addr v3, v6

    .line 131
    and-int v4, v3, v6

    .line 132
    .line 133
    move/from16 v18, v5

    .line 134
    .line 135
    not-int v5, v3

    .line 136
    and-int/2addr v5, v8

    .line 137
    or-int/2addr v4, v5

    .line 138
    const/4 v5, 0x5

    .line 139
    aget v5, v1, v5

    .line 140
    .line 141
    add-int/2addr v4, v5

    .line 142
    const v19, 0x4787c62a

    .line 143
    .line 144
    .line 145
    add-int v4, v4, v19

    .line 146
    .line 147
    add-int/2addr v2, v4

    .line 148
    shl-int/lit8 v4, v2, 0xc

    .line 149
    .line 150
    ushr-int/lit8 v2, v2, 0x14

    .line 151
    .line 152
    or-int/2addr v2, v4

    .line 153
    add-int/2addr v2, v3

    .line 154
    and-int v4, v2, v3

    .line 155
    .line 156
    move/from16 v19, v7

    .line 157
    .line 158
    not-int v7, v2

    .line 159
    and-int/2addr v7, v6

    .line 160
    or-int/2addr v4, v7

    .line 161
    const/4 v7, 0x6

    .line 162
    aget v7, v1, v7

    .line 163
    .line 164
    add-int/2addr v4, v7

    .line 165
    const v20, -0x57cfb9ed

    .line 166
    .line 167
    .line 168
    add-int v4, v4, v20

    .line 169
    .line 170
    add-int/2addr v8, v4

    .line 171
    shl-int/lit8 v4, v8, 0x11

    .line 172
    .line 173
    ushr-int/2addr v8, v14

    .line 174
    or-int/2addr v4, v8

    .line 175
    add-int/2addr v4, v2

    .line 176
    and-int v8, v4, v2

    .line 177
    .line 178
    move/from16 v20, v9

    .line 179
    .line 180
    not-int v9, v4

    .line 181
    and-int/2addr v9, v3

    .line 182
    or-int/2addr v8, v9

    .line 183
    const/4 v9, 0x7

    .line 184
    aget v9, v1, v9

    .line 185
    .line 186
    add-int/2addr v8, v9

    .line 187
    const v21, -0x2b96aff

    .line 188
    .line 189
    .line 190
    add-int v8, v8, v21

    .line 191
    .line 192
    add-int/2addr v6, v8

    .line 193
    shl-int/lit8 v8, v6, 0x16

    .line 194
    .line 195
    ushr-int/lit8 v6, v6, 0xa

    .line 196
    .line 197
    or-int/2addr v6, v8

    .line 198
    add-int/2addr v6, v4

    .line 199
    and-int v8, v6, v4

    .line 200
    .line 201
    move/from16 p0, v14

    .line 202
    .line 203
    not-int v14, v6

    .line 204
    and-int/2addr v14, v2

    .line 205
    or-int/2addr v8, v14

    .line 206
    const/16 v14, 0x8

    .line 207
    .line 208
    aget v14, v1, v14

    .line 209
    .line 210
    add-int/2addr v8, v14

    .line 211
    const v21, 0x698098d8

    .line 212
    .line 213
    .line 214
    add-int v8, v8, v21

    .line 215
    .line 216
    add-int/2addr v3, v8

    .line 217
    shl-int/lit8 v8, v3, 0x7

    .line 218
    .line 219
    ushr-int/lit8 v3, v3, 0x19

    .line 220
    .line 221
    or-int/2addr v3, v8

    .line 222
    add-int/2addr v3, v6

    .line 223
    and-int v8, v3, v6

    .line 224
    .line 225
    not-int v1, v3

    .line 226
    and-int/2addr v1, v4

    .line 227
    or-int/2addr v1, v8

    .line 228
    const/16 v8, 0x9

    .line 229
    .line 230
    aget v21, p4, v8

    .line 231
    .line 232
    add-int v1, v1, v21

    .line 233
    .line 234
    const v22, -0x74bb0851

    .line 235
    .line 236
    .line 237
    add-int v1, v1, v22

    .line 238
    .line 239
    add-int/2addr v2, v1

    .line 240
    shl-int/lit8 v1, v2, 0xc

    .line 241
    .line 242
    ushr-int/lit8 v2, v2, 0x14

    .line 243
    .line 244
    or-int/2addr v1, v2

    .line 245
    add-int/2addr v1, v3

    .line 246
    and-int v2, v1, v3

    .line 247
    .line 248
    move/from16 p2, v8

    .line 249
    .line 250
    not-int v8, v1

    .line 251
    and-int/2addr v8, v6

    .line 252
    or-int/2addr v2, v8

    .line 253
    aget v8, p4, v16

    .line 254
    .line 255
    add-int/2addr v2, v8

    .line 256
    const v22, -0xa44f

    .line 257
    .line 258
    .line 259
    add-int v2, v2, v22

    .line 260
    .line 261
    add-int/2addr v4, v2

    .line 262
    shl-int/lit8 v2, v4, 0x11

    .line 263
    .line 264
    ushr-int/lit8 v4, v4, 0xf

    .line 265
    .line 266
    or-int/2addr v2, v4

    .line 267
    add-int/2addr v2, v1

    .line 268
    and-int v4, v2, v1

    .line 269
    .line 270
    move/from16 p3, v1

    .line 271
    .line 272
    not-int v1, v2

    .line 273
    and-int/2addr v1, v3

    .line 274
    or-int/2addr v1, v4

    .line 275
    const/16 v4, 0xb

    .line 276
    .line 277
    aget v22, p4, v4

    .line 278
    .line 279
    add-int v1, v1, v22

    .line 280
    .line 281
    const v23, -0x76a32842

    .line 282
    .line 283
    .line 284
    add-int v1, v1, v23

    .line 285
    .line 286
    add-int/2addr v6, v1

    .line 287
    shl-int/lit8 v1, v6, 0x16

    .line 288
    .line 289
    ushr-int/lit8 v6, v6, 0xa

    .line 290
    .line 291
    or-int/2addr v1, v6

    .line 292
    add-int/2addr v1, v2

    .line 293
    and-int v6, v1, v2

    .line 294
    .line 295
    move/from16 v23, v4

    .line 296
    .line 297
    not-int v4, v1

    .line 298
    and-int v4, v4, p3

    .line 299
    .line 300
    or-int/2addr v4, v6

    .line 301
    const/16 v6, 0xc

    .line 302
    .line 303
    aget v24, p4, v6

    .line 304
    .line 305
    add-int v4, v4, v24

    .line 306
    .line 307
    const v25, 0x6b901122

    .line 308
    .line 309
    .line 310
    add-int v4, v4, v25

    .line 311
    .line 312
    add-int/2addr v3, v4

    .line 313
    shl-int/lit8 v4, v3, 0x7

    .line 314
    .line 315
    ushr-int/lit8 v3, v3, 0x19

    .line 316
    .line 317
    or-int/2addr v3, v4

    .line 318
    add-int/2addr v3, v1

    .line 319
    and-int v4, v3, v1

    .line 320
    .line 321
    move/from16 v25, v6

    .line 322
    .line 323
    not-int v6, v3

    .line 324
    and-int/2addr v6, v2

    .line 325
    or-int/2addr v4, v6

    .line 326
    const/16 v6, 0xd

    .line 327
    .line 328
    aget v6, p4, v6

    .line 329
    .line 330
    add-int/2addr v4, v6

    .line 331
    const v26, -0x2678e6d

    .line 332
    .line 333
    .line 334
    add-int v4, v4, v26

    .line 335
    .line 336
    add-int v4, p3, v4

    .line 337
    .line 338
    shl-int/lit8 v26, v4, 0xc

    .line 339
    .line 340
    ushr-int/lit8 v4, v4, 0x14

    .line 341
    .line 342
    or-int v4, v26, v4

    .line 343
    .line 344
    add-int/2addr v4, v3

    .line 345
    and-int v26, v4, v3

    .line 346
    .line 347
    move/from16 p3, v1

    .line 348
    .line 349
    not-int v1, v4

    .line 350
    and-int v27, v1, p3

    .line 351
    .line 352
    or-int v26, v26, v27

    .line 353
    .line 354
    const/16 v27, 0xe

    .line 355
    .line 356
    aget v27, p4, v27

    .line 357
    .line 358
    add-int v26, v26, v27

    .line 359
    .line 360
    const v28, -0x5986bc72

    .line 361
    .line 362
    .line 363
    add-int v26, v26, v28

    .line 364
    .line 365
    add-int v2, v2, v26

    .line 366
    .line 367
    shl-int/lit8 v26, v2, 0x11

    .line 368
    .line 369
    ushr-int/lit8 v2, v2, 0xf

    .line 370
    .line 371
    or-int v2, v26, v2

    .line 372
    .line 373
    add-int/2addr v2, v4

    .line 374
    and-int v26, v2, v4

    .line 375
    .line 376
    move/from16 v28, v1

    .line 377
    .line 378
    not-int v1, v2

    .line 379
    and-int v29, v1, v3

    .line 380
    .line 381
    or-int v26, v26, v29

    .line 382
    .line 383
    aget v29, p4, p0

    .line 384
    .line 385
    add-int v26, v26, v29

    .line 386
    .line 387
    const v30, 0x49b40821

    .line 388
    .line 389
    .line 390
    add-int v26, v26, v30

    .line 391
    .line 392
    add-int v26, p3, v26

    .line 393
    .line 394
    shl-int/lit8 v30, v26, 0x16

    .line 395
    .line 396
    ushr-int/lit8 v16, v26, 0xa

    .line 397
    .line 398
    or-int v16, v30, v16

    .line 399
    .line 400
    move/from16 v26, v1

    .line 401
    .line 402
    add-int v1, v16, v2

    .line 403
    .line 404
    and-int v16, v1, v4

    .line 405
    .line 406
    and-int v28, v2, v28

    .line 407
    .line 408
    or-int v16, v16, v28

    .line 409
    .line 410
    add-int v16, v16, v12

    .line 411
    .line 412
    const v28, -0x9e1da9e

    .line 413
    .line 414
    .line 415
    add-int v16, v16, v28

    .line 416
    .line 417
    add-int v3, v3, v16

    .line 418
    .line 419
    shl-int/lit8 v16, v3, 0x5

    .line 420
    .line 421
    ushr-int/lit8 v3, v3, 0x1b

    .line 422
    .line 423
    or-int v3, v16, v3

    .line 424
    .line 425
    add-int/2addr v3, v1

    .line 426
    and-int v16, v3, v2

    .line 427
    .line 428
    and-int v26, v1, v26

    .line 429
    .line 430
    or-int v16, v16, v26

    .line 431
    .line 432
    add-int v16, v16, v7

    .line 433
    .line 434
    const v26, -0x3fbf4cc0

    .line 435
    .line 436
    .line 437
    add-int v16, v16, v26

    .line 438
    .line 439
    add-int v4, v4, v16

    .line 440
    .line 441
    shl-int/lit8 v16, v4, 0x9

    .line 442
    .line 443
    ushr-int/lit8 v4, v4, 0x17

    .line 444
    .line 445
    or-int v4, v16, v4

    .line 446
    .line 447
    add-int/2addr v4, v3

    .line 448
    and-int v16, v4, v1

    .line 449
    .line 450
    move/from16 p0, v2

    .line 451
    .line 452
    not-int v2, v1

    .line 453
    and-int/2addr v2, v3

    .line 454
    or-int v2, v16, v2

    .line 455
    .line 456
    add-int v2, v2, v22

    .line 457
    .line 458
    const v16, 0x265e5a51

    .line 459
    .line 460
    .line 461
    add-int v2, v2, v16

    .line 462
    .line 463
    add-int v2, p0, v2

    .line 464
    .line 465
    shl-int/lit8 v16, v2, 0xe

    .line 466
    .line 467
    ushr-int/lit8 v2, v2, 0x12

    .line 468
    .line 469
    or-int v2, v16, v2

    .line 470
    .line 471
    add-int/2addr v2, v4

    .line 472
    and-int v16, v2, v3

    .line 473
    .line 474
    move/from16 p0, v1

    .line 475
    .line 476
    not-int v1, v3

    .line 477
    and-int/2addr v1, v4

    .line 478
    or-int v1, v16, v1

    .line 479
    .line 480
    add-int/2addr v1, v11

    .line 481
    const v16, -0x16493856

    .line 482
    .line 483
    .line 484
    add-int v1, v1, v16

    .line 485
    .line 486
    add-int v1, p0, v1

    .line 487
    .line 488
    shl-int/lit8 v16, v1, 0x14

    .line 489
    .line 490
    ushr-int/lit8 v1, v1, 0xc

    .line 491
    .line 492
    or-int v1, v16, v1

    .line 493
    .line 494
    add-int/2addr v1, v2

    .line 495
    and-int v16, v1, v4

    .line 496
    .line 497
    move/from16 p0, v3

    .line 498
    .line 499
    not-int v3, v4

    .line 500
    and-int/2addr v3, v2

    .line 501
    or-int v3, v16, v3

    .line 502
    .line 503
    add-int/2addr v3, v5

    .line 504
    const v16, -0x29d0efa3

    .line 505
    .line 506
    .line 507
    add-int v3, v3, v16

    .line 508
    .line 509
    add-int v3, p0, v3

    .line 510
    .line 511
    shl-int/lit8 v16, v3, 0x5

    .line 512
    .line 513
    ushr-int/lit8 v3, v3, 0x1b

    .line 514
    .line 515
    or-int v3, v16, v3

    .line 516
    .line 517
    add-int/2addr v3, v1

    .line 518
    and-int v16, v3, v2

    .line 519
    .line 520
    move/from16 p0, v4

    .line 521
    .line 522
    not-int v4, v2

    .line 523
    and-int/2addr v4, v1

    .line 524
    or-int v4, v16, v4

    .line 525
    .line 526
    add-int/2addr v4, v8

    .line 527
    const v16, 0x2441453

    .line 528
    .line 529
    .line 530
    add-int v4, v4, v16

    .line 531
    .line 532
    add-int v4, p0, v4

    .line 533
    .line 534
    shl-int/lit8 v16, v4, 0x9

    .line 535
    .line 536
    ushr-int/lit8 v4, v4, 0x17

    .line 537
    .line 538
    or-int v4, v16, v4

    .line 539
    .line 540
    add-int/2addr v4, v3

    .line 541
    and-int v16, v4, v1

    .line 542
    .line 543
    move/from16 p0, v2

    .line 544
    .line 545
    not-int v2, v1

    .line 546
    and-int/2addr v2, v3

    .line 547
    or-int v2, v16, v2

    .line 548
    .line 549
    add-int v2, v2, v29

    .line 550
    .line 551
    const v16, -0x275e197f

    .line 552
    .line 553
    .line 554
    add-int v2, v2, v16

    .line 555
    .line 556
    add-int v2, p0, v2

    .line 557
    .line 558
    shl-int/lit8 v16, v2, 0xe

    .line 559
    .line 560
    ushr-int/lit8 v2, v2, 0x12

    .line 561
    .line 562
    or-int v2, v16, v2

    .line 563
    .line 564
    add-int/2addr v2, v4

    .line 565
    and-int v16, v2, v3

    .line 566
    .line 567
    move/from16 p0, v1

    .line 568
    .line 569
    not-int v1, v3

    .line 570
    and-int/2addr v1, v4

    .line 571
    or-int v1, v16, v1

    .line 572
    .line 573
    add-int/2addr v1, v10

    .line 574
    const v16, -0x182c0438

    .line 575
    .line 576
    .line 577
    add-int v1, v1, v16

    .line 578
    .line 579
    add-int v1, p0, v1

    .line 580
    .line 581
    shl-int/lit8 v16, v1, 0x14

    .line 582
    .line 583
    ushr-int/lit8 v1, v1, 0xc

    .line 584
    .line 585
    or-int v1, v16, v1

    .line 586
    .line 587
    add-int/2addr v1, v2

    .line 588
    and-int v16, v1, v4

    .line 589
    .line 590
    move/from16 p0, v3

    .line 591
    .line 592
    not-int v3, v4

    .line 593
    and-int/2addr v3, v2

    .line 594
    or-int v3, v16, v3

    .line 595
    .line 596
    add-int v3, v3, v21

    .line 597
    .line 598
    const v16, 0x21e1cde6

    .line 599
    .line 600
    .line 601
    add-int v3, v3, v16

    .line 602
    .line 603
    add-int v3, p0, v3

    .line 604
    .line 605
    shl-int/lit8 v16, v3, 0x5

    .line 606
    .line 607
    ushr-int/lit8 v3, v3, 0x1b

    .line 608
    .line 609
    or-int v3, v16, v3

    .line 610
    .line 611
    add-int/2addr v3, v1

    .line 612
    and-int v16, v3, v2

    .line 613
    .line 614
    move/from16 p0, v4

    .line 615
    .line 616
    not-int v4, v2

    .line 617
    and-int/2addr v4, v1

    .line 618
    or-int v4, v16, v4

    .line 619
    .line 620
    add-int v4, v4, v27

    .line 621
    .line 622
    const v16, -0x3cc8f82a

    .line 623
    .line 624
    .line 625
    add-int v4, v4, v16

    .line 626
    .line 627
    add-int v4, p0, v4

    .line 628
    .line 629
    shl-int/lit8 v16, v4, 0x9

    .line 630
    .line 631
    ushr-int/lit8 v4, v4, 0x17

    .line 632
    .line 633
    or-int v4, v16, v4

    .line 634
    .line 635
    add-int/2addr v4, v3

    .line 636
    and-int v16, v4, v1

    .line 637
    .line 638
    move/from16 p0, v2

    .line 639
    .line 640
    not-int v2, v1

    .line 641
    and-int/2addr v2, v3

    .line 642
    or-int v2, v16, v2

    .line 643
    .line 644
    add-int/2addr v2, v15

    .line 645
    const v16, -0xb2af279

    .line 646
    .line 647
    .line 648
    add-int v2, v2, v16

    .line 649
    .line 650
    add-int v2, p0, v2

    .line 651
    .line 652
    shl-int/lit8 v16, v2, 0xe

    .line 653
    .line 654
    ushr-int/lit8 v2, v2, 0x12

    .line 655
    .line 656
    or-int v2, v16, v2

    .line 657
    .line 658
    add-int/2addr v2, v4

    .line 659
    and-int v16, v2, v3

    .line 660
    .line 661
    move/from16 p0, v1

    .line 662
    .line 663
    not-int v1, v3

    .line 664
    and-int/2addr v1, v4

    .line 665
    or-int v1, v16, v1

    .line 666
    .line 667
    add-int/2addr v1, v14

    .line 668
    const v16, 0x455a14ed

    .line 669
    .line 670
    .line 671
    add-int v1, v1, v16

    .line 672
    .line 673
    add-int v1, p0, v1

    .line 674
    .line 675
    shl-int/lit8 v16, v1, 0x14

    .line 676
    .line 677
    ushr-int/lit8 v1, v1, 0xc

    .line 678
    .line 679
    or-int v1, v16, v1

    .line 680
    .line 681
    add-int/2addr v1, v2

    .line 682
    and-int v16, v1, v4

    .line 683
    .line 684
    move/from16 p0, v3

    .line 685
    .line 686
    not-int v3, v4

    .line 687
    and-int/2addr v3, v2

    .line 688
    or-int v3, v16, v3

    .line 689
    .line 690
    add-int/2addr v3, v6

    .line 691
    const v16, -0x561c16fb

    .line 692
    .line 693
    .line 694
    add-int v3, v3, v16

    .line 695
    .line 696
    add-int v3, p0, v3

    .line 697
    .line 698
    shl-int/lit8 v16, v3, 0x5

    .line 699
    .line 700
    ushr-int/lit8 v3, v3, 0x1b

    .line 701
    .line 702
    or-int v3, v16, v3

    .line 703
    .line 704
    add-int/2addr v3, v1

    .line 705
    and-int v16, v3, v2

    .line 706
    .line 707
    move/from16 p0, v4

    .line 708
    .line 709
    not-int v4, v2

    .line 710
    and-int/2addr v4, v1

    .line 711
    or-int v4, v16, v4

    .line 712
    .line 713
    add-int/2addr v4, v13

    .line 714
    const v16, -0x3105c08

    .line 715
    .line 716
    .line 717
    add-int v4, v4, v16

    .line 718
    .line 719
    add-int v4, p0, v4

    .line 720
    .line 721
    shl-int/lit8 v16, v4, 0x9

    .line 722
    .line 723
    ushr-int/lit8 v4, v4, 0x17

    .line 724
    .line 725
    or-int v4, v16, v4

    .line 726
    .line 727
    add-int/2addr v4, v3

    .line 728
    and-int v16, v4, v1

    .line 729
    .line 730
    move/from16 p0, v2

    .line 731
    .line 732
    not-int v2, v1

    .line 733
    and-int/2addr v2, v3

    .line 734
    or-int v2, v16, v2

    .line 735
    .line 736
    add-int/2addr v2, v9

    .line 737
    const v16, 0x676f02d9

    .line 738
    .line 739
    .line 740
    add-int v2, v2, v16

    .line 741
    .line 742
    add-int v2, p0, v2

    .line 743
    .line 744
    shl-int/lit8 v16, v2, 0xe

    .line 745
    .line 746
    ushr-int/lit8 v2, v2, 0x12

    .line 747
    .line 748
    or-int v2, v16, v2

    .line 749
    .line 750
    add-int/2addr v2, v4

    .line 751
    and-int v16, v2, v3

    .line 752
    .line 753
    move/from16 p0, v1

    .line 754
    .line 755
    not-int v1, v3

    .line 756
    and-int/2addr v1, v4

    .line 757
    or-int v1, v16, v1

    .line 758
    .line 759
    add-int v1, v1, v24

    .line 760
    .line 761
    const v16, -0x72d5b376

    .line 762
    .line 763
    .line 764
    add-int v1, v1, v16

    .line 765
    .line 766
    add-int v1, p0, v1

    .line 767
    .line 768
    shl-int/lit8 v16, v1, 0x14

    .line 769
    .line 770
    ushr-int/lit8 v1, v1, 0xc

    .line 771
    .line 772
    or-int v1, v16, v1

    .line 773
    .line 774
    add-int/2addr v1, v2

    .line 775
    xor-int v16, v1, v2

    .line 776
    .line 777
    xor-int v16, v16, v4

    .line 778
    .line 779
    add-int v16, v16, v5

    .line 780
    .line 781
    const v25, -0x5c6be

    .line 782
    .line 783
    .line 784
    add-int v16, v16, v25

    .line 785
    .line 786
    add-int v3, v3, v16

    .line 787
    .line 788
    shl-int/lit8 v16, v3, 0x4

    .line 789
    .line 790
    ushr-int/lit8 v3, v3, 0x1c

    .line 791
    .line 792
    or-int v3, v16, v3

    .line 793
    .line 794
    add-int/2addr v3, v1

    .line 795
    xor-int v16, v3, v1

    .line 796
    .line 797
    xor-int v16, v16, v2

    .line 798
    .line 799
    add-int v16, v16, v14

    .line 800
    .line 801
    const v25, -0x788e097f

    .line 802
    .line 803
    .line 804
    add-int v16, v16, v25

    .line 805
    .line 806
    add-int v4, v4, v16

    .line 807
    .line 808
    shl-int/lit8 v16, v4, 0xb

    .line 809
    .line 810
    ushr-int/lit8 v4, v4, 0x15

    .line 811
    .line 812
    or-int v4, v16, v4

    .line 813
    .line 814
    add-int/2addr v4, v3

    .line 815
    xor-int v16, v4, v3

    .line 816
    .line 817
    xor-int v16, v16, v1

    .line 818
    .line 819
    add-int v16, v16, v22

    .line 820
    .line 821
    const v25, 0x6d9d6122

    .line 822
    .line 823
    .line 824
    add-int v16, v16, v25

    .line 825
    .line 826
    add-int v2, v2, v16

    .line 827
    .line 828
    shl-int/lit8 v16, v2, 0x10

    .line 829
    .line 830
    ushr-int/lit8 v2, v2, 0x10

    .line 831
    .line 832
    or-int v2, v16, v2

    .line 833
    .line 834
    add-int/2addr v2, v4

    .line 835
    xor-int v16, v2, v4

    .line 836
    .line 837
    xor-int v16, v16, v3

    .line 838
    .line 839
    add-int v16, v16, v27

    .line 840
    .line 841
    const v25, -0x21ac7f4

    .line 842
    .line 843
    .line 844
    add-int v16, v16, v25

    .line 845
    .line 846
    add-int v1, v1, v16

    .line 847
    .line 848
    shl-int/lit8 v16, v1, 0x17

    .line 849
    .line 850
    ushr-int/lit8 v1, v1, 0x9

    .line 851
    .line 852
    or-int v1, v16, v1

    .line 853
    .line 854
    add-int/2addr v1, v2

    .line 855
    xor-int v16, v1, v2

    .line 856
    .line 857
    xor-int v16, v16, v4

    .line 858
    .line 859
    add-int v16, v16, v12

    .line 860
    .line 861
    const v25, -0x5b4115bc

    .line 862
    .line 863
    .line 864
    add-int v16, v16, v25

    .line 865
    .line 866
    add-int v3, v3, v16

    .line 867
    .line 868
    shl-int/lit8 v16, v3, 0x4

    .line 869
    .line 870
    ushr-int/lit8 v3, v3, 0x1c

    .line 871
    .line 872
    or-int v3, v16, v3

    .line 873
    .line 874
    add-int/2addr v3, v1

    .line 875
    xor-int v16, v3, v1

    .line 876
    .line 877
    xor-int v16, v16, v2

    .line 878
    .line 879
    add-int v16, v16, v10

    .line 880
    .line 881
    const v25, 0x4bdecfa9    # 2.9204306E7f

    .line 882
    .line 883
    .line 884
    add-int v16, v16, v25

    .line 885
    .line 886
    add-int v4, v4, v16

    .line 887
    .line 888
    shl-int/lit8 v16, v4, 0xb

    .line 889
    .line 890
    ushr-int/lit8 v4, v4, 0x15

    .line 891
    .line 892
    or-int v4, v16, v4

    .line 893
    .line 894
    add-int/2addr v4, v3

    .line 895
    xor-int v16, v4, v3

    .line 896
    .line 897
    xor-int v16, v16, v1

    .line 898
    .line 899
    add-int v16, v16, v9

    .line 900
    .line 901
    const v25, -0x944b4a0

    .line 902
    .line 903
    .line 904
    add-int v16, v16, v25

    .line 905
    .line 906
    add-int v2, v2, v16

    .line 907
    .line 908
    shl-int/lit8 v16, v2, 0x10

    .line 909
    .line 910
    ushr-int/lit8 v2, v2, 0x10

    .line 911
    .line 912
    or-int v2, v16, v2

    .line 913
    .line 914
    add-int/2addr v2, v4

    .line 915
    xor-int v16, v2, v4

    .line 916
    .line 917
    xor-int v16, v16, v3

    .line 918
    .line 919
    add-int v16, v16, v8

    .line 920
    .line 921
    const v25, -0x41404390

    .line 922
    .line 923
    .line 924
    add-int v16, v16, v25

    .line 925
    .line 926
    add-int v1, v1, v16

    .line 927
    .line 928
    shl-int/lit8 v16, v1, 0x17

    .line 929
    .line 930
    ushr-int/lit8 v1, v1, 0x9

    .line 931
    .line 932
    or-int v1, v16, v1

    .line 933
    .line 934
    add-int/2addr v1, v2

    .line 935
    xor-int v16, v1, v2

    .line 936
    .line 937
    xor-int v16, v16, v4

    .line 938
    .line 939
    add-int v16, v16, v6

    .line 940
    .line 941
    const v25, 0x289b7ec6

    .line 942
    .line 943
    .line 944
    add-int v16, v16, v25

    .line 945
    .line 946
    add-int v3, v3, v16

    .line 947
    .line 948
    shl-int/lit8 v16, v3, 0x4

    .line 949
    .line 950
    ushr-int/lit8 v3, v3, 0x1c

    .line 951
    .line 952
    or-int v3, v16, v3

    .line 953
    .line 954
    add-int/2addr v3, v1

    .line 955
    xor-int v16, v3, v1

    .line 956
    .line 957
    xor-int v16, v16, v2

    .line 958
    .line 959
    add-int v16, v16, v11

    .line 960
    .line 961
    const v25, -0x155ed806

    .line 962
    .line 963
    .line 964
    add-int v16, v16, v25

    .line 965
    .line 966
    add-int v4, v4, v16

    .line 967
    .line 968
    shl-int/lit8 v16, v4, 0xb

    .line 969
    .line 970
    ushr-int/lit8 v4, v4, 0x15

    .line 971
    .line 972
    or-int v4, v16, v4

    .line 973
    .line 974
    add-int/2addr v4, v3

    .line 975
    xor-int v16, v4, v3

    .line 976
    .line 977
    xor-int v16, v16, v1

    .line 978
    .line 979
    add-int v16, v16, v15

    .line 980
    .line 981
    const v25, -0x2b10cf7b

    .line 982
    .line 983
    .line 984
    add-int v16, v16, v25

    .line 985
    .line 986
    add-int v2, v2, v16

    .line 987
    .line 988
    shl-int/lit8 v16, v2, 0x10

    .line 989
    .line 990
    ushr-int/lit8 v2, v2, 0x10

    .line 991
    .line 992
    or-int v2, v16, v2

    .line 993
    .line 994
    add-int/2addr v2, v4

    .line 995
    xor-int v16, v2, v4

    .line 996
    .line 997
    xor-int v16, v16, v3

    .line 998
    .line 999
    add-int v16, v16, v7

    .line 1000
    .line 1001
    const v25, 0x4881d05    # 3.2000097E-36f

    .line 1002
    .line 1003
    .line 1004
    add-int v16, v16, v25

    .line 1005
    .line 1006
    add-int v1, v1, v16

    .line 1007
    .line 1008
    shl-int/lit8 v16, v1, 0x17

    .line 1009
    .line 1010
    ushr-int/lit8 v1, v1, 0x9

    .line 1011
    .line 1012
    or-int v1, v16, v1

    .line 1013
    .line 1014
    add-int/2addr v1, v2

    .line 1015
    xor-int v16, v1, v2

    .line 1016
    .line 1017
    xor-int v16, v16, v4

    .line 1018
    .line 1019
    add-int v16, v16, v21

    .line 1020
    .line 1021
    const v25, -0x262b2fc7

    .line 1022
    .line 1023
    .line 1024
    add-int v16, v16, v25

    .line 1025
    .line 1026
    add-int v3, v3, v16

    .line 1027
    .line 1028
    shl-int/lit8 v16, v3, 0x4

    .line 1029
    .line 1030
    ushr-int/lit8 v3, v3, 0x1c

    .line 1031
    .line 1032
    or-int v3, v16, v3

    .line 1033
    .line 1034
    add-int/2addr v3, v1

    .line 1035
    xor-int v16, v3, v1

    .line 1036
    .line 1037
    xor-int v16, v16, v2

    .line 1038
    .line 1039
    add-int v16, v16, v24

    .line 1040
    .line 1041
    const v25, -0x1924661b

    .line 1042
    .line 1043
    .line 1044
    add-int v16, v16, v25

    .line 1045
    .line 1046
    add-int v4, v4, v16

    .line 1047
    .line 1048
    shl-int/lit8 v16, v4, 0xb

    .line 1049
    .line 1050
    ushr-int/lit8 v4, v4, 0x15

    .line 1051
    .line 1052
    or-int v4, v16, v4

    .line 1053
    .line 1054
    add-int/2addr v4, v3

    .line 1055
    xor-int v16, v4, v3

    .line 1056
    .line 1057
    xor-int v16, v16, v1

    .line 1058
    .line 1059
    add-int v16, v16, v29

    .line 1060
    .line 1061
    const v25, 0x1fa27cf8

    .line 1062
    .line 1063
    .line 1064
    add-int v16, v16, v25

    .line 1065
    .line 1066
    add-int v2, v2, v16

    .line 1067
    .line 1068
    shl-int/lit8 v16, v2, 0x10

    .line 1069
    .line 1070
    ushr-int/lit8 v2, v2, 0x10

    .line 1071
    .line 1072
    or-int v2, v16, v2

    .line 1073
    .line 1074
    add-int/2addr v2, v4

    .line 1075
    xor-int v16, v2, v4

    .line 1076
    .line 1077
    xor-int v16, v16, v3

    .line 1078
    .line 1079
    add-int v16, v16, v13

    .line 1080
    .line 1081
    const v25, -0x3b53a99b

    .line 1082
    .line 1083
    .line 1084
    add-int v16, v16, v25

    .line 1085
    .line 1086
    add-int v1, v1, v16

    .line 1087
    .line 1088
    shl-int/lit8 v16, v1, 0x17

    .line 1089
    .line 1090
    ushr-int/lit8 v1, v1, 0x9

    .line 1091
    .line 1092
    or-int v1, v16, v1

    .line 1093
    .line 1094
    add-int/2addr v1, v2

    .line 1095
    move/from16 p0, v3

    .line 1096
    .line 1097
    not-int v3, v4

    .line 1098
    or-int/2addr v3, v1

    .line 1099
    xor-int/2addr v3, v2

    .line 1100
    add-int/2addr v3, v11

    .line 1101
    const v11, -0xbd6ddbc

    .line 1102
    .line 1103
    .line 1104
    add-int/2addr v3, v11

    .line 1105
    add-int v3, p0, v3

    .line 1106
    .line 1107
    shl-int/lit8 v11, v3, 0x6

    .line 1108
    .line 1109
    ushr-int/lit8 v3, v3, 0x1a

    .line 1110
    .line 1111
    or-int/2addr v3, v11

    .line 1112
    add-int/2addr v3, v1

    .line 1113
    not-int v11, v2

    .line 1114
    or-int/2addr v11, v3

    .line 1115
    xor-int/2addr v11, v1

    .line 1116
    add-int/2addr v11, v9

    .line 1117
    const v9, 0x432aff97

    .line 1118
    .line 1119
    .line 1120
    add-int/2addr v11, v9

    .line 1121
    add-int/2addr v4, v11

    .line 1122
    shl-int/lit8 v9, v4, 0xa

    .line 1123
    .line 1124
    ushr-int/lit8 v4, v4, 0x16

    .line 1125
    .line 1126
    or-int/2addr v4, v9

    .line 1127
    add-int/2addr v4, v3

    .line 1128
    not-int v9, v1

    .line 1129
    or-int/2addr v9, v4

    .line 1130
    xor-int/2addr v9, v3

    .line 1131
    add-int v9, v9, v27

    .line 1132
    .line 1133
    const v11, -0x546bdc59

    .line 1134
    .line 1135
    .line 1136
    add-int/2addr v9, v11

    .line 1137
    add-int/2addr v2, v9

    .line 1138
    shl-int/lit8 v9, v2, 0xf

    .line 1139
    .line 1140
    ushr-int/lit8 v2, v2, 0x11

    .line 1141
    .line 1142
    or-int/2addr v2, v9

    .line 1143
    add-int/2addr v2, v4

    .line 1144
    not-int v9, v3

    .line 1145
    or-int/2addr v9, v2

    .line 1146
    xor-int/2addr v9, v4

    .line 1147
    add-int/2addr v9, v5

    .line 1148
    const v5, -0x36c5fc7

    .line 1149
    .line 1150
    .line 1151
    add-int/2addr v9, v5

    .line 1152
    add-int/2addr v1, v9

    .line 1153
    shl-int/lit8 v5, v1, 0x15

    .line 1154
    .line 1155
    ushr-int/lit8 v1, v1, 0xb

    .line 1156
    .line 1157
    or-int/2addr v1, v5

    .line 1158
    add-int/2addr v1, v2

    .line 1159
    not-int v5, v4

    .line 1160
    or-int/2addr v5, v1

    .line 1161
    xor-int/2addr v5, v2

    .line 1162
    add-int v5, v5, v24

    .line 1163
    .line 1164
    const v9, 0x655b59c3

    .line 1165
    .line 1166
    .line 1167
    add-int/2addr v5, v9

    .line 1168
    add-int/2addr v3, v5

    .line 1169
    shl-int/lit8 v5, v3, 0x6

    .line 1170
    .line 1171
    ushr-int/lit8 v3, v3, 0x1a

    .line 1172
    .line 1173
    or-int/2addr v3, v5

    .line 1174
    add-int/2addr v3, v1

    .line 1175
    not-int v5, v2

    .line 1176
    or-int/2addr v5, v3

    .line 1177
    xor-int/2addr v5, v1

    .line 1178
    add-int/2addr v5, v15

    .line 1179
    const v9, -0x70f3336e

    .line 1180
    .line 1181
    .line 1182
    add-int/2addr v5, v9

    .line 1183
    add-int/2addr v4, v5

    .line 1184
    shl-int/lit8 v5, v4, 0xa

    .line 1185
    .line 1186
    ushr-int/lit8 v4, v4, 0x16

    .line 1187
    .line 1188
    or-int/2addr v4, v5

    .line 1189
    add-int/2addr v4, v3

    .line 1190
    not-int v5, v1

    .line 1191
    or-int/2addr v5, v4

    .line 1192
    xor-int/2addr v5, v3

    .line 1193
    add-int/2addr v5, v8

    .line 1194
    const v8, -0x100b83

    .line 1195
    .line 1196
    .line 1197
    add-int/2addr v5, v8

    .line 1198
    add-int/2addr v2, v5

    .line 1199
    shl-int/lit8 v5, v2, 0xf

    .line 1200
    .line 1201
    ushr-int/lit8 v2, v2, 0x11

    .line 1202
    .line 1203
    or-int/2addr v2, v5

    .line 1204
    add-int/2addr v2, v4

    .line 1205
    not-int v5, v3

    .line 1206
    or-int/2addr v5, v2

    .line 1207
    xor-int/2addr v5, v4

    .line 1208
    add-int/2addr v5, v12

    .line 1209
    const v8, -0x7a7ba22f

    .line 1210
    .line 1211
    .line 1212
    add-int/2addr v5, v8

    .line 1213
    add-int/2addr v1, v5

    .line 1214
    shl-int/lit8 v5, v1, 0x15

    .line 1215
    .line 1216
    ushr-int/lit8 v1, v1, 0xb

    .line 1217
    .line 1218
    or-int/2addr v1, v5

    .line 1219
    add-int/2addr v1, v2

    .line 1220
    not-int v5, v4

    .line 1221
    or-int/2addr v5, v1

    .line 1222
    xor-int/2addr v5, v2

    .line 1223
    add-int/2addr v5, v14

    .line 1224
    const v8, 0x6fa87e4f

    .line 1225
    .line 1226
    .line 1227
    add-int/2addr v5, v8

    .line 1228
    add-int/2addr v3, v5

    .line 1229
    shl-int/lit8 v5, v3, 0x6

    .line 1230
    .line 1231
    ushr-int/lit8 v3, v3, 0x1a

    .line 1232
    .line 1233
    or-int/2addr v3, v5

    .line 1234
    add-int/2addr v3, v1

    .line 1235
    not-int v5, v2

    .line 1236
    or-int/2addr v5, v3

    .line 1237
    xor-int/2addr v5, v1

    .line 1238
    add-int v5, v5, v29

    .line 1239
    .line 1240
    const v8, -0x1d31920

    .line 1241
    .line 1242
    .line 1243
    add-int/2addr v5, v8

    .line 1244
    add-int/2addr v4, v5

    .line 1245
    shl-int/lit8 v5, v4, 0xa

    .line 1246
    .line 1247
    ushr-int/lit8 v4, v4, 0x16

    .line 1248
    .line 1249
    or-int/2addr v4, v5

    .line 1250
    add-int/2addr v4, v3

    .line 1251
    not-int v5, v1

    .line 1252
    or-int/2addr v5, v4

    .line 1253
    xor-int/2addr v5, v3

    .line 1254
    add-int/2addr v5, v7

    .line 1255
    const v7, -0x5cfebcec

    .line 1256
    .line 1257
    .line 1258
    add-int/2addr v5, v7

    .line 1259
    add-int/2addr v2, v5

    .line 1260
    shl-int/lit8 v5, v2, 0xf

    .line 1261
    .line 1262
    ushr-int/lit8 v2, v2, 0x11

    .line 1263
    .line 1264
    or-int/2addr v2, v5

    .line 1265
    add-int/2addr v2, v4

    .line 1266
    not-int v5, v3

    .line 1267
    or-int/2addr v5, v2

    .line 1268
    xor-int/2addr v5, v4

    .line 1269
    add-int/2addr v5, v6

    .line 1270
    const v6, 0x4e0811a1    # 5.707142E8f

    .line 1271
    .line 1272
    .line 1273
    add-int/2addr v5, v6

    .line 1274
    add-int/2addr v1, v5

    .line 1275
    shl-int/lit8 v5, v1, 0x15

    .line 1276
    .line 1277
    ushr-int/lit8 v1, v1, 0xb

    .line 1278
    .line 1279
    or-int/2addr v1, v5

    .line 1280
    add-int/2addr v1, v2

    .line 1281
    not-int v5, v4

    .line 1282
    or-int/2addr v5, v1

    .line 1283
    xor-int/2addr v5, v2

    .line 1284
    add-int/2addr v5, v10

    .line 1285
    const v6, -0x8ac817e

    .line 1286
    .line 1287
    .line 1288
    add-int/2addr v5, v6

    .line 1289
    add-int/2addr v3, v5

    .line 1290
    shl-int/lit8 v5, v3, 0x6

    .line 1291
    .line 1292
    ushr-int/lit8 v3, v3, 0x1a

    .line 1293
    .line 1294
    or-int/2addr v3, v5

    .line 1295
    add-int/2addr v3, v1

    .line 1296
    not-int v5, v2

    .line 1297
    or-int/2addr v5, v3

    .line 1298
    xor-int/2addr v5, v1

    .line 1299
    add-int v5, v5, v22

    .line 1300
    .line 1301
    const v6, -0x42c50dcb

    .line 1302
    .line 1303
    .line 1304
    add-int/2addr v5, v6

    .line 1305
    add-int/2addr v4, v5

    .line 1306
    shl-int/lit8 v5, v4, 0xa

    .line 1307
    .line 1308
    ushr-int/lit8 v4, v4, 0x16

    .line 1309
    .line 1310
    or-int/2addr v4, v5

    .line 1311
    add-int/2addr v4, v3

    .line 1312
    not-int v5, v1

    .line 1313
    or-int/2addr v5, v4

    .line 1314
    xor-int/2addr v5, v3

    .line 1315
    add-int/2addr v5, v13

    .line 1316
    const v6, 0x2ad7d2bb

    .line 1317
    .line 1318
    .line 1319
    add-int/2addr v5, v6

    .line 1320
    add-int/2addr v2, v5

    .line 1321
    shl-int/lit8 v5, v2, 0xf

    .line 1322
    .line 1323
    ushr-int/lit8 v2, v2, 0x11

    .line 1324
    .line 1325
    or-int/2addr v2, v5

    .line 1326
    add-int/2addr v2, v4

    .line 1327
    not-int v5, v3

    .line 1328
    or-int/2addr v5, v2

    .line 1329
    xor-int/2addr v5, v4

    .line 1330
    add-int v5, v5, v21

    .line 1331
    .line 1332
    const v6, -0x14792c6f

    .line 1333
    .line 1334
    .line 1335
    add-int/2addr v5, v6

    .line 1336
    add-int/2addr v1, v5

    .line 1337
    shl-int/lit8 v5, v1, 0x15

    .line 1338
    .line 1339
    ushr-int/lit8 v1, v1, 0xb

    .line 1340
    .line 1341
    or-int/2addr v1, v5

    .line 1342
    add-int/2addr v1, v2

    .line 1343
    iget-object v0, v0, Ll/jiw;->a:[I

    .line 1344
    .line 1345
    aget v5, v0, v17

    .line 1346
    .line 1347
    add-int/2addr v5, v3

    .line 1348
    aput v5, v0, v17

    .line 1349
    .line 1350
    aget v3, v0, v18

    .line 1351
    .line 1352
    add-int/2addr v3, v1

    .line 1353
    aput v3, v0, v18

    .line 1354
    .line 1355
    aget v1, v0, v19

    .line 1356
    .line 1357
    add-int/2addr v1, v2

    .line 1358
    aput v1, v0, v19

    .line 1359
    .line 1360
    aget v1, v0, v20

    .line 1361
    .line 1362
    add-int/2addr v1, v4

    .line 1363
    aput v1, v0, v20

    .line 1364
    .line 1365
    return-void
.end method

.method public static final p(I)[B
    .locals 5

    .line 1
    ushr-int/lit8 v0, p0, 0x18

    .line 2
    .line 3
    int-to-byte v0, v0

    .line 4
    ushr-int/lit8 v1, p0, 0x10

    .line 5
    .line 6
    int-to-byte v1, v1

    .line 7
    ushr-int/lit8 v2, p0, 0x8

    .line 8
    .line 9
    int-to-byte v2, v2

    .line 10
    int-to-byte p0, p0

    .line 11
    const/4 v3, 0x4

    .line 12
    new-array v3, v3, [B

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    aput-byte v0, v3, v4

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    aput-byte v1, v3, v0

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    aput-byte v2, v3, v0

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    aput-byte p0, v3, v0

    .line 25
    .line 26
    return-object v3
.end method

.method public static final q(II)I
    .locals 1

    .line 1
    shl-int v0, p0, p1

    .line 2
    .line 3
    rsub-int/lit8 p1, p1, 0x20

    .line 4
    .line 5
    ushr-int/2addr p0, p1

    .line 6
    or-int/2addr p0, v0

    .line 7
    return p0
.end method


# virtual methods
.method public declared-synchronized g()[B
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/iiw;->b:Ll/jiw;

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Ll/jiw;

    .line 7
    .line 8
    iget-object v1, p0, Ll/iiw;->a:Ll/jiw;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/jiw;-><init>(Ll/jiw;)V

    .line 11
    .line 12
    .line 13
    iget-wide v1, v0, Ll/jiw;->b:J

    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    shl-long v3, v1, v3

    .line 17
    .line 18
    long-to-int v3, v3

    .line 19
    const/16 v4, 0x1d

    .line 20
    .line 21
    shr-long/2addr v1, v4

    .line 22
    long-to-int v1, v1

    .line 23
    filled-new-array {v3, v1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x8

    .line 28
    .line 29
    invoke-direct {p0, v1, v2}, Ll/iiw;->e([II)[B

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-wide v3, v0, Ll/jiw;->b:J

    .line 34
    .line 35
    const-wide/16 v5, 0x3f

    .line 36
    .line 37
    and-long/2addr v3, v5

    .line 38
    long-to-int v3, v3

    .line 39
    const/16 v4, 0x38

    .line 40
    .line 41
    if-ge v3, v4, :cond_0

    .line 42
    .line 43
    sub-int/2addr v4, v3

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    rsub-int/lit8 v4, v3, 0x78

    .line 46
    .line 47
    :goto_0
    sget-object v3, Ll/iiw;->c:[B

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-virtual {p0, v0, v3, v5, v4}, Ll/iiw;->m(Ll/jiw;[BII)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0, v1, v5, v2}, Ll/iiw;->m(Ll/jiw;[BII)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/iiw;->b:Ll/jiw;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_2

    .line 61
    :cond_1
    :goto_1
    iget-object v0, p0, Ll/iiw;->b:Ll/jiw;

    .line 62
    .line 63
    iget-object v0, v0, Ll/jiw;->a:[I

    .line 64
    .line 65
    const/16 v1, 0x10

    .line 66
    .line 67
    invoke-direct {p0, v0, v1}, Ll/iiw;->f([II)[B

    .line 68
    .line 69
    .line 70
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    monitor-exit p0

    .line 72
    return-object v0

    .line 73
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    throw v0
.end method

.method public declared-synchronized i()Ll/iiw;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/jiw;

    .line 3
    .line 4
    invoke-direct {v0}, Ll/jiw;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/iiw;->a:Ll/jiw;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/iiw;->b:Ll/jiw;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-object v0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public m(Ll/jiw;[BII)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/iiw;->b:Ll/jiw;

    .line 3
    .line 4
    sub-int v0, p4, p3

    .line 5
    .line 6
    array-length v1, p2

    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    array-length p4, p2

    .line 10
    sub-int/2addr p4, p3

    .line 11
    :cond_0
    iget-wide v0, p1, Ll/jiw;->b:J

    .line 12
    .line 13
    const-wide/16 v2, 0x3f

    .line 14
    .line 15
    and-long/2addr v2, v0

    .line 16
    long-to-int v2, v2

    .line 17
    int-to-long v3, p4

    .line 18
    add-long/2addr v0, v3

    .line 19
    iput-wide v0, p1, Ll/jiw;->b:J

    .line 20
    .line 21
    rsub-int/lit8 v0, v2, 0x40

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-lt p4, v0, :cond_4

    .line 25
    .line 26
    const/16 v3, 0x10

    .line 27
    .line 28
    new-array v3, v3, [I

    .line 29
    .line 30
    const/16 v4, 0x40

    .line 31
    .line 32
    if-ne v0, v4, :cond_1

    .line 33
    .line 34
    move v0, v1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v4, v1

    .line 37
    :goto_0
    iget-object v5, p1, Ll/jiw;->c:[B

    .line 38
    .line 39
    if-ge v4, v0, :cond_2

    .line 40
    .line 41
    add-int v6, v4, v2

    .line 42
    .line 43
    add-int v7, v4, p3

    .line 44
    .line 45
    aget-byte v7, p2, v7

    .line 46
    .line 47
    aput-byte v7, v5, v6

    .line 48
    .line 49
    add-int/lit8 v4, v4, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-direct {p0, p1, v5, v1, v3}, Ll/iiw;->l(Ll/jiw;[BI[I)V

    .line 53
    .line 54
    .line 55
    :goto_1
    add-int/lit8 v2, v0, 0x3f

    .line 56
    .line 57
    if-ge v2, p4, :cond_3

    .line 58
    .line 59
    add-int v2, v0, p3

    .line 60
    .line 61
    invoke-direct {p0, p1, p2, v2, v3}, Ll/iiw;->l(Ll/jiw;[BI[I)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 v0, v0, 0x40

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    move v2, v1

    .line 68
    move v1, v0

    .line 69
    :cond_4
    if-ge v1, p4, :cond_5

    .line 70
    .line 71
    move p0, v1

    .line 72
    :goto_2
    if-ge p0, p4, :cond_5

    .line 73
    .line 74
    iget-object v0, p1, Ll/jiw;->c:[B

    .line 75
    .line 76
    add-int v3, v2, p0

    .line 77
    .line 78
    sub-int/2addr v3, v1

    .line 79
    add-int v4, p0, p3

    .line 80
    .line 81
    aget-byte v4, p2, v4

    .line 82
    .line 83
    aput-byte v4, v0, v3

    .line 84
    .line 85
    add-int/lit8 p0, p0, 0x1

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_5
    return-void
.end method

.method public n([B)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Ll/iiw;->o([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o([BII)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iiw;->a:Ll/jiw;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/iiw;->m(Ll/jiw;[BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
