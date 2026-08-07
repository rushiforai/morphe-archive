.class public final Lcom/google/zxing/aztec/decoder/Decoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/aztec/decoder/Decoder$Table;
    }
.end annotation


# static fields
.field public static final b:[Ljava/lang/String;

.field public static final c:[Ljava/lang/String;

.field public static final d:[Ljava/lang/String;

.field public static final e:[Ljava/lang/String;

.field public static final f:[Ljava/lang/String;


# instance fields
.field public a:Ll/yp1;


# direct methods
.method static constructor <clinit>()V
    .locals 33

    .line 1
    const-string v31, "CTRL_DL"

    .line 2
    .line 3
    const-string v32, "CTRL_BS"

    .line 4
    .line 5
    const-string v1, "CTRL_PS"

    .line 6
    .line 7
    const-string v2, " "

    .line 8
    .line 9
    const-string v3, "A"

    .line 10
    .line 11
    const-string v4, "B"

    .line 12
    .line 13
    const-string v5, "C"

    .line 14
    .line 15
    const-string v6, "D"

    .line 16
    .line 17
    const-string v7, "E"

    .line 18
    .line 19
    const-string v8, "F"

    .line 20
    .line 21
    const-string v9, "G"

    .line 22
    .line 23
    const-string v10, "H"

    .line 24
    .line 25
    const-string v11, "I"

    .line 26
    .line 27
    const-string v12, "J"

    .line 28
    .line 29
    const-string v13, "K"

    .line 30
    .line 31
    const-string v14, "L"

    .line 32
    .line 33
    const-string v15, "M"

    .line 34
    .line 35
    const-string v16, "N"

    .line 36
    .line 37
    const-string v17, "O"

    .line 38
    .line 39
    const-string v18, "P"

    .line 40
    .line 41
    const-string v19, "Q"

    .line 42
    .line 43
    const-string v20, "R"

    .line 44
    .line 45
    const-string v21, "S"

    .line 46
    .line 47
    const-string v22, "T"

    .line 48
    .line 49
    const-string v23, "U"

    .line 50
    .line 51
    const-string v24, "V"

    .line 52
    .line 53
    const-string v25, "W"

    .line 54
    .line 55
    const-string v26, "X"

    .line 56
    .line 57
    const-string v27, "Y"

    .line 58
    .line 59
    const-string v28, "Z"

    .line 60
    .line 61
    const-string v29, "CTRL_LL"

    .line 62
    .line 63
    const-string v30, "CTRL_ML"

    .line 64
    .line 65
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->b:[Ljava/lang/String;

    .line 70
    .line 71
    const-string v31, "CTRL_DL"

    .line 72
    .line 73
    const-string v32, "CTRL_BS"

    .line 74
    .line 75
    const-string v1, "CTRL_PS"

    .line 76
    .line 77
    const-string v2, " "

    .line 78
    .line 79
    const-string v3, "a"

    .line 80
    .line 81
    const-string v4, "b"

    .line 82
    .line 83
    const-string v5, "c"

    .line 84
    .line 85
    const-string v6, "d"

    .line 86
    .line 87
    const-string v7, "e"

    .line 88
    .line 89
    const-string v8, "f"

    .line 90
    .line 91
    const-string v9, "g"

    .line 92
    .line 93
    const-string v10, "h"

    .line 94
    .line 95
    const-string v11, "i"

    .line 96
    .line 97
    const-string v12, "j"

    .line 98
    .line 99
    const-string v13, "k"

    .line 100
    .line 101
    const-string v14, "l"

    .line 102
    .line 103
    const-string v15, "m"

    .line 104
    .line 105
    const-string v16, "n"

    .line 106
    .line 107
    const-string v17, "o"

    .line 108
    .line 109
    const-string v18, "p"

    .line 110
    .line 111
    const-string v19, "q"

    .line 112
    .line 113
    const-string v20, "r"

    .line 114
    .line 115
    const-string v21, "s"

    .line 116
    .line 117
    const-string v22, "t"

    .line 118
    .line 119
    const-string v23, "u"

    .line 120
    .line 121
    const-string v24, "v"

    .line 122
    .line 123
    const-string v25, "w"

    .line 124
    .line 125
    const-string v26, "x"

    .line 126
    .line 127
    const-string v27, "y"

    .line 128
    .line 129
    const-string v28, "z"

    .line 130
    .line 131
    const-string v29, "CTRL_US"

    .line 132
    .line 133
    const-string v30, "CTRL_ML"

    .line 134
    .line 135
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->c:[Ljava/lang/String;

    .line 140
    .line 141
    const-string v31, "CTRL_PL"

    .line 142
    .line 143
    const-string v32, "CTRL_BS"

    .line 144
    .line 145
    const-string v1, "CTRL_PS"

    .line 146
    .line 147
    const-string v2, " "

    .line 148
    .line 149
    const-string v3, "\u0001"

    .line 150
    .line 151
    const-string v4, "\u0002"

    .line 152
    .line 153
    const-string v5, "\u0003"

    .line 154
    .line 155
    const-string v6, "\u0004"

    .line 156
    .line 157
    const-string v7, "\u0005"

    .line 158
    .line 159
    const-string v8, "\u0006"

    .line 160
    .line 161
    const-string v9, "\u0007"

    .line 162
    .line 163
    const-string v10, "\u0008"

    .line 164
    .line 165
    const-string v11, "\t"

    .line 166
    .line 167
    const-string v12, "\n"

    .line 168
    .line 169
    const-string v13, "\u000b"

    .line 170
    .line 171
    const-string v14, "\u000c"

    .line 172
    .line 173
    const-string v15, "\r"

    .line 174
    .line 175
    const-string v16, "\u001b"

    .line 176
    .line 177
    const-string v17, "\u001c"

    .line 178
    .line 179
    const-string v18, "\u001d"

    .line 180
    .line 181
    const-string v19, "\u001e"

    .line 182
    .line 183
    const-string v20, "\u001f"

    .line 184
    .line 185
    const-string v21, "@"

    .line 186
    .line 187
    const-string v22, "\\"

    .line 188
    .line 189
    const-string v23, "^"

    .line 190
    .line 191
    const-string v24, "_"

    .line 192
    .line 193
    const-string v25, "`"

    .line 194
    .line 195
    const-string v26, "|"

    .line 196
    .line 197
    const-string v27, "~"

    .line 198
    .line 199
    const-string v28, "\u007f"

    .line 200
    .line 201
    const-string v29, "CTRL_LL"

    .line 202
    .line 203
    const-string v30, "CTRL_UL"

    .line 204
    .line 205
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->d:[Ljava/lang/String;

    .line 210
    .line 211
    const-string v31, "}"

    .line 212
    .line 213
    const-string v32, "CTRL_UL"

    .line 214
    .line 215
    const-string v1, ""

    .line 216
    .line 217
    const-string v2, "\r"

    .line 218
    .line 219
    const-string v3, "\r\n"

    .line 220
    .line 221
    const-string v4, ". "

    .line 222
    .line 223
    const-string v5, ", "

    .line 224
    .line 225
    const-string v6, ": "

    .line 226
    .line 227
    const-string v7, "!"

    .line 228
    .line 229
    const-string v8, "\""

    .line 230
    .line 231
    const-string v9, "#"

    .line 232
    .line 233
    const-string v10, "$"

    .line 234
    .line 235
    const-string v11, "%"

    .line 236
    .line 237
    const-string v12, "&"

    .line 238
    .line 239
    const-string v13, "\'"

    .line 240
    .line 241
    const-string v14, "("

    .line 242
    .line 243
    const-string v15, ")"

    .line 244
    .line 245
    const-string v16, "*"

    .line 246
    .line 247
    const-string v17, "+"

    .line 248
    .line 249
    const-string v18, ","

    .line 250
    .line 251
    const-string v19, "-"

    .line 252
    .line 253
    const-string v20, "."

    .line 254
    .line 255
    const-string v21, "/"

    .line 256
    .line 257
    const-string v22, ":"

    .line 258
    .line 259
    const-string v23, ";"

    .line 260
    .line 261
    const-string v24, "<"

    .line 262
    .line 263
    const-string v25, "="

    .line 264
    .line 265
    const-string v26, ">"

    .line 266
    .line 267
    const-string v27, "?"

    .line 268
    .line 269
    const-string v28, "["

    .line 270
    .line 271
    const-string v29, "]"

    .line 272
    .line 273
    const-string v30, "{"

    .line 274
    .line 275
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->e:[Ljava/lang/String;

    .line 280
    .line 281
    const-string v15, "CTRL_UL"

    .line 282
    .line 283
    const-string v16, "CTRL_US"

    .line 284
    .line 285
    const-string v1, "CTRL_PS"

    .line 286
    .line 287
    const-string v2, " "

    .line 288
    .line 289
    const-string v3, "0"

    .line 290
    .line 291
    const-string v4, "1"

    .line 292
    .line 293
    const-string v5, "2"

    .line 294
    .line 295
    const-string v6, "3"

    .line 296
    .line 297
    const-string v7, "4"

    .line 298
    .line 299
    const-string v8, "5"

    .line 300
    .line 301
    const-string v9, "6"

    .line 302
    .line 303
    const-string v10, "7"

    .line 304
    .line 305
    const-string v11, "8"

    .line 306
    .line 307
    const-string v12, "9"

    .line 308
    .line 309
    const-string v13, ","

    .line 310
    .line 311
    const-string v14, "."

    .line 312
    .line 313
    filled-new-array/range {v1 .. v16}, [Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->f:[Ljava/lang/String;

    .line 318
    .line 319
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

.method public static a([Z)[B
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x7

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v0, :cond_0

    .line 10
    .line 11
    shl-int/lit8 v3, v2, 0x3

    .line 12
    .line 13
    invoke-static {p0, v3}, Lcom/google/zxing/aztec/decoder/Decoder;->h([ZI)B

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    aput-byte v3, v1, v2

    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-object v1
.end method

.method public static e(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder;->f:[Ljava/lang/String;

    .line 25
    .line 26
    aget-object p0, p0, p1

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const-string p0, "Bad table"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_1
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder;->e:[Ljava/lang/String;

    .line 37
    .line 38
    aget-object p0, p0, p1

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder;->d:[Ljava/lang/String;

    .line 42
    .line 43
    aget-object p0, p0, p1

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder;->c:[Ljava/lang/String;

    .line 47
    .line 48
    aget-object p0, p0, p1

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_4
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder;->b:[Ljava/lang/String;

    .line 52
    .line 53
    aget-object p0, p0, p1

    .line 54
    .line 55
    return-object p0
.end method

.method public static f([Z)Ljava/lang/String;
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 3
    .line 4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const/16 v3, 0x14

    .line 7
    .line 8
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    move-object v4, v1

    .line 13
    move v5, v3

    .line 14
    :goto_0
    if-ge v5, v0, :cond_7

    .line 15
    .line 16
    sget-object v6, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 17
    .line 18
    const/4 v7, 0x5

    .line 19
    if-ne v1, v6, :cond_3

    .line 20
    .line 21
    sub-int v1, v0, v5

    .line 22
    .line 23
    if-lt v1, v7, :cond_7

    .line 24
    .line 25
    invoke-static {p0, v5, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/lit8 v6, v5, 0x5

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    sub-int v1, v0, v6

    .line 34
    .line 35
    const/16 v7, 0xb

    .line 36
    .line 37
    if-lt v1, v7, :cond_7

    .line 38
    .line 39
    invoke-static {p0, v6, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/lit8 v1, v1, 0x1f

    .line 44
    .line 45
    add-int/lit8 v6, v5, 0x10

    .line 46
    .line 47
    :cond_0
    move v5, v3

    .line 48
    :goto_1
    if-ge v5, v1, :cond_2

    .line 49
    .line 50
    sub-int v7, v0, v6

    .line 51
    .line 52
    const/16 v8, 0x8

    .line 53
    .line 54
    if-ge v7, v8, :cond_1

    .line 55
    .line 56
    move v5, v0

    .line 57
    goto :goto_2

    .line 58
    :cond_1
    invoke-static {p0, v6, v8}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    int-to-char v7, v7

    .line 63
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    add-int/lit8 v6, v6, 0x8

    .line 67
    .line 68
    add-int/lit8 v5, v5, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    move v5, v6

    .line 72
    :goto_2
    move-object v1, v4

    .line 73
    goto :goto_0

    .line 74
    :cond_3
    sget-object v6, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 75
    .line 76
    if-ne v1, v6, :cond_4

    .line 77
    .line 78
    const/4 v6, 0x4

    .line 79
    goto :goto_3

    .line 80
    :cond_4
    move v6, v7

    .line 81
    :goto_3
    sub-int v8, v0, v5

    .line 82
    .line 83
    if-lt v8, v6, :cond_7

    .line 84
    .line 85
    invoke-static {p0, v5, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    add-int/2addr v5, v6

    .line 90
    invoke-static {v1, v8}, Lcom/google/zxing/aztec/decoder/Decoder;->e(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    const-string v8, "CTRL_"

    .line 95
    .line 96
    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-eqz v8, :cond_6

    .line 101
    .line 102
    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    invoke-static {v4}, Lcom/google/zxing/aztec/decoder/Decoder;->g(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    const/4 v7, 0x6

    .line 111
    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    const/16 v7, 0x4c

    .line 116
    .line 117
    if-ne v6, v7, :cond_5

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_5
    move-object v9, v4

    .line 121
    move-object v4, v1

    .line 122
    move-object v1, v9

    .line 123
    goto :goto_0

    .line 124
    :cond_6
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_7
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method

.method public static g(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;
    .locals 1

    .line 1
    const/16 v0, 0x42

    .line 2
    .line 3
    if-eq p0, v0, :cond_4

    .line 4
    .line 5
    const/16 v0, 0x44

    .line 6
    .line 7
    if-eq p0, v0, :cond_3

    .line 8
    .line 9
    const/16 v0, 0x50

    .line 10
    .line 11
    if-eq p0, v0, :cond_2

    .line 12
    .line 13
    const/16 v0, 0x4c

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x4d

    .line 18
    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->MIXED:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->LOWER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->PUNCT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    sget-object p0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 37
    .line 38
    return-object p0
.end method

.method public static h([ZI)B
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    sub-int/2addr v0, p1

    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, v1}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    :goto_0
    int-to-byte p0, p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {p0, p1, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    sub-int/2addr v1, v0

    .line 18
    shl-int/2addr p0, v1

    .line 19
    goto :goto_0
.end method

.method public static i([ZII)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, p1

    .line 3
    :goto_0
    add-int v2, p1, p2

    .line 4
    .line 5
    if-ge v1, v2, :cond_1

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    aget-boolean v2, p0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    or-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v0
.end method

.method public static j(IZ)I
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    const/16 p1, 0x58

    goto :goto_0

    :cond_0
    const/16 p1, 0x70

    :goto_0
    shl-int/lit8 v0, p0, 0x4

    add-int/2addr p1, v0

    mul-int/2addr p1, p0

    return p1
.end method


# virtual methods
.method public final b([Z)[Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yp1;->d()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-gt v0, v1, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/zlj;->j:Ll/zlj;

    .line 11
    .line 12
    const/4 v2, 0x6

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/yp1;->d()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v2, 0x8

    .line 21
    .line 22
    if-gt v0, v2, :cond_1

    .line 23
    .line 24
    sget-object v0, Ll/zlj;->n:Ll/zlj;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/yp1;->d()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/16 v2, 0x16

    .line 34
    .line 35
    if-gt v0, v2, :cond_2

    .line 36
    .line 37
    sget-object v0, Ll/zlj;->i:Ll/zlj;

    .line 38
    .line 39
    const/16 v2, 0xa

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sget-object v0, Ll/zlj;->h:Ll/zlj;

    .line 43
    .line 44
    const/16 v2, 0xc

    .line 45
    .line 46
    :goto_0
    iget-object p0, p0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/yp1;->c()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    array-length v3, p1

    .line 53
    div-int/2addr v3, v2

    .line 54
    if-lt v3, p0, :cond_e

    .line 55
    .line 56
    array-length v4, p1

    .line 57
    rem-int/2addr v4, v2

    .line 58
    new-array v5, v3, [I

    .line 59
    .line 60
    const/4 v6, 0x0

    .line 61
    move v7, v6

    .line 62
    :goto_1
    if-ge v7, v3, :cond_3

    .line 63
    .line 64
    invoke-static {p1, v4, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->i([ZII)I

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    aput v8, v5, v7

    .line 69
    .line 70
    add-int/lit8 v7, v7, 0x1

    .line 71
    .line 72
    add-int/2addr v4, v2

    .line 73
    goto :goto_1

    .line 74
    :cond_3
    :try_start_0
    new-instance p1, Ll/fuc0;

    .line 75
    .line 76
    invoke-direct {p1, v0}, Ll/fuc0;-><init>(Ll/zlj;)V

    .line 77
    .line 78
    .line 79
    sub-int/2addr v3, p0

    .line 80
    invoke-virtual {p1, v5, v3}, Ll/fuc0;->a([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    const/4 p1, 0x1

    .line 84
    shl-int v0, p1, v2

    .line 85
    .line 86
    add-int/lit8 v3, v0, -0x1

    .line 87
    .line 88
    move v4, v6

    .line 89
    move v7, v4

    .line 90
    :goto_2
    if-ge v4, p0, :cond_7

    .line 91
    .line 92
    aget v8, v5, v4

    .line 93
    .line 94
    if-eqz v8, :cond_6

    .line 95
    .line 96
    if-eq v8, v3, :cond_6

    .line 97
    .line 98
    if-eq v8, p1, :cond_4

    .line 99
    .line 100
    add-int/lit8 v9, v0, -0x2

    .line 101
    .line 102
    if-ne v8, v9, :cond_5

    .line 103
    .line 104
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 105
    .line 106
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    throw p0

    .line 114
    :cond_7
    mul-int v3, p0, v2

    .line 115
    .line 116
    sub-int/2addr v3, v7

    .line 117
    new-array v3, v3, [Z

    .line 118
    .line 119
    move v4, v6

    .line 120
    move v7, v4

    .line 121
    :goto_3
    if-ge v4, p0, :cond_d

    .line 122
    .line 123
    aget v8, v5, v4

    .line 124
    .line 125
    if-eq v8, p1, :cond_a

    .line 126
    .line 127
    add-int/lit8 v9, v0, -0x2

    .line 128
    .line 129
    if-ne v8, v9, :cond_8

    .line 130
    .line 131
    goto :goto_6

    .line 132
    :cond_8
    add-int/lit8 v9, v2, -0x1

    .line 133
    .line 134
    :goto_4
    if-ltz v9, :cond_c

    .line 135
    .line 136
    add-int/lit8 v10, v7, 0x1

    .line 137
    .line 138
    shl-int v11, p1, v9

    .line 139
    .line 140
    and-int/2addr v11, v8

    .line 141
    if-eqz v11, :cond_9

    .line 142
    .line 143
    move v11, p1

    .line 144
    goto :goto_5

    .line 145
    :cond_9
    move v11, v6

    .line 146
    :goto_5
    aput-boolean v11, v3, v7

    .line 147
    .line 148
    add-int/lit8 v9, v9, -0x1

    .line 149
    .line 150
    move v7, v10

    .line 151
    goto :goto_4

    .line 152
    :cond_a
    :goto_6
    add-int v9, v7, v2

    .line 153
    .line 154
    sub-int/2addr v9, p1

    .line 155
    if-le v8, p1, :cond_b

    .line 156
    .line 157
    move v8, p1

    .line 158
    goto :goto_7

    .line 159
    :cond_b
    move v8, v6

    .line 160
    :goto_7
    invoke-static {v3, v7, v9, v8}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 161
    .line 162
    .line 163
    add-int/lit8 v8, v2, -0x1

    .line 164
    .line 165
    add-int/2addr v7, v8

    .line 166
    :cond_c
    add-int/lit8 v4, v4, 0x1

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_d
    return-object v3

    .line 170
    :catch_0
    move-exception p0

    .line 171
    invoke-static {p0}, Lcom/google/zxing/FormatException;->getFormatInstance(Ljava/lang/Throwable;)Lcom/google/zxing/FormatException;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    throw p0

    .line 176
    :cond_e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    throw p0
.end method

.method public c(Ll/yp1;)Ll/mid;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/dzd;->a()Ll/d13;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/decoder/Decoder;->d(Ll/d13;)[Z

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/decoder/Decoder;->b([Z)[Z

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/google/zxing/aztec/decoder/Decoder;->a([Z)[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0}, Lcom/google/zxing/aztec/decoder/Decoder;->f([Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/mid;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {v1, p1, v0, v2, v2}, Ll/mid;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    array-length p0, p0

    .line 30
    invoke-virtual {v1, p0}, Ll/mid;->l(I)V

    .line 31
    .line 32
    .line 33
    return-object v1
.end method

.method public final d(Ll/d13;)[Z
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/yp1;->e()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->a:Ll/yp1;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/yp1;->d()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const/16 v3, 0xb

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/16 v3, 0xe

    .line 23
    .line 24
    :goto_0
    shl-int/lit8 v4, v0, 0x2

    .line 25
    .line 26
    add-int/2addr v3, v4

    .line 27
    new-array v4, v3, [I

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->j(IZ)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    new-array v5, v5, [Z

    .line 34
    .line 35
    const/4 v7, 0x2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    :goto_1
    if-ge v8, v3, :cond_2

    .line 40
    .line 41
    aput v8, v4, v8

    .line 42
    .line 43
    add-int/lit8 v8, v8, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    add-int/lit8 v8, v3, 0x1

    .line 47
    .line 48
    div-int/lit8 v9, v3, 0x2

    .line 49
    .line 50
    add-int/lit8 v10, v9, -0x1

    .line 51
    .line 52
    div-int/lit8 v10, v10, 0xf

    .line 53
    .line 54
    mul-int/2addr v10, v7

    .line 55
    add-int/2addr v8, v10

    .line 56
    div-int/2addr v8, v7

    .line 57
    const/4 v10, 0x0

    .line 58
    :goto_2
    if-ge v10, v9, :cond_2

    .line 59
    .line 60
    div-int/lit8 v11, v10, 0xf

    .line 61
    .line 62
    add-int/2addr v11, v10

    .line 63
    sub-int v12, v9, v10

    .line 64
    .line 65
    add-int/lit8 v12, v12, -0x1

    .line 66
    .line 67
    sub-int v13, v8, v11

    .line 68
    .line 69
    add-int/lit8 v13, v13, -0x1

    .line 70
    .line 71
    aput v13, v4, v12

    .line 72
    .line 73
    add-int v12, v9, v10

    .line 74
    .line 75
    add-int/2addr v11, v8

    .line 76
    add-int/lit8 v11, v11, 0x1

    .line 77
    .line 78
    aput v11, v4, v12

    .line 79
    .line 80
    add-int/lit8 v10, v10, 0x1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    const/4 v8, 0x0

    .line 84
    const/4 v9, 0x0

    .line 85
    :goto_3
    if-ge v8, v0, :cond_6

    .line 86
    .line 87
    sub-int v10, v0, v8

    .line 88
    .line 89
    shl-int/2addr v10, v7

    .line 90
    if-eqz v2, :cond_3

    .line 91
    .line 92
    const/16 v11, 0x9

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_3
    const/16 v11, 0xc

    .line 96
    .line 97
    :goto_4
    add-int/2addr v10, v11

    .line 98
    shl-int/lit8 v11, v8, 0x1

    .line 99
    .line 100
    add-int/lit8 v12, v3, -0x1

    .line 101
    .line 102
    sub-int/2addr v12, v11

    .line 103
    const/4 v13, 0x0

    .line 104
    :goto_5
    if-ge v13, v10, :cond_5

    .line 105
    .line 106
    shl-int/lit8 v14, v13, 0x1

    .line 107
    .line 108
    const/4 v15, 0x0

    .line 109
    :goto_6
    if-ge v15, v7, :cond_4

    .line 110
    .line 111
    add-int v16, v9, v14

    .line 112
    .line 113
    add-int v16, v16, v15

    .line 114
    .line 115
    add-int v17, v11, v15

    .line 116
    .line 117
    aget v6, v4, v17

    .line 118
    .line 119
    add-int v18, v11, v13

    .line 120
    .line 121
    aget v7, v4, v18

    .line 122
    .line 123
    invoke-virtual {v1, v6, v7}, Ll/d13;->d(II)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    aput-boolean v6, v5, v16

    .line 128
    .line 129
    mul-int/lit8 v6, v10, 0x2

    .line 130
    .line 131
    add-int/2addr v6, v9

    .line 132
    add-int/2addr v6, v14

    .line 133
    add-int/2addr v6, v15

    .line 134
    aget v7, v4, v18

    .line 135
    .line 136
    sub-int v16, v12, v15

    .line 137
    .line 138
    move/from16 v18, v0

    .line 139
    .line 140
    aget v0, v4, v16

    .line 141
    .line 142
    invoke-virtual {v1, v7, v0}, Ll/d13;->d(II)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    aput-boolean v0, v5, v6

    .line 147
    .line 148
    mul-int/lit8 v0, v10, 0x4

    .line 149
    .line 150
    add-int/2addr v0, v9

    .line 151
    add-int/2addr v0, v14

    .line 152
    add-int/2addr v0, v15

    .line 153
    aget v6, v4, v16

    .line 154
    .line 155
    sub-int v7, v12, v13

    .line 156
    .line 157
    move/from16 v16, v0

    .line 158
    .line 159
    aget v0, v4, v7

    .line 160
    .line 161
    invoke-virtual {v1, v6, v0}, Ll/d13;->d(II)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    aput-boolean v0, v5, v16

    .line 166
    .line 167
    mul-int/lit8 v0, v10, 0x6

    .line 168
    .line 169
    add-int/2addr v0, v9

    .line 170
    add-int/2addr v0, v14

    .line 171
    add-int/2addr v0, v15

    .line 172
    aget v6, v4, v7

    .line 173
    .line 174
    aget v7, v4, v17

    .line 175
    .line 176
    invoke-virtual {v1, v6, v7}, Ll/d13;->d(II)Z

    .line 177
    .line 178
    .line 179
    move-result v6

    .line 180
    aput-boolean v6, v5, v0

    .line 181
    .line 182
    add-int/lit8 v15, v15, 0x1

    .line 183
    .line 184
    move/from16 v0, v18

    .line 185
    .line 186
    const/4 v7, 0x2

    .line 187
    goto :goto_6

    .line 188
    :cond_4
    move/from16 v18, v0

    .line 189
    .line 190
    add-int/lit8 v13, v13, 0x1

    .line 191
    .line 192
    const/4 v7, 0x2

    .line 193
    goto :goto_5

    .line 194
    :cond_5
    move/from16 v18, v0

    .line 195
    .line 196
    shl-int/lit8 v0, v10, 0x3

    .line 197
    .line 198
    add-int/2addr v9, v0

    .line 199
    add-int/lit8 v8, v8, 0x1

    .line 200
    .line 201
    move/from16 v0, v18

    .line 202
    .line 203
    const/4 v7, 0x2

    .line 204
    goto :goto_3

    .line 205
    :cond_6
    return-object v5
.end method
