.class public final Ll/bc5;
.super Ll/sp50;
.source "SourceFile"


# static fields
.field public static final d:[C

.field public static final e:[I

.field public static final f:[C


# instance fields
.field public final a:Ljava/lang/StringBuilder;

.field public b:[I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "0123456789-$:/.+ABCD"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/bc5;->d:[C

    .line 8
    .line 9
    const/16 v0, 0x14

    .line 10
    .line 11
    new-array v0, v0, [I

    .line 12
    .line 13
    fill-array-data v0, :array_0

    .line 14
    .line 15
    .line 16
    sput-object v0, Ll/bc5;->e:[I

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    new-array v0, v0, [C

    .line 20
    .line 21
    fill-array-data v0, :array_1

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/bc5;->f:[C

    .line 25
    .line 26
    return-void

    .line 27
    :array_0
    .array-data 4
        0x3
        0x6
        0x9
        0x60
        0x12
        0x42
        0x21
        0x24
        0x30
        0x48
        0xc
        0x18
        0x45
        0x51
        0x54
        0x15
        0x1a
        0x29
        0xb
        0xe
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    :array_1
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/sp50;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const/16 v0, 0x50

    .line 14
    .line 15
    new-array v0, v0, [I

    .line 16
    .line 17
    iput-object v0, p0, Ll/bc5;->b:[I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput v0, p0, Ll/bc5;->c:I

    .line 21
    .line 22
    return-void
.end method

.method public static g([CC)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    move v2, v0

    .line 6
    :goto_0
    if-ge v2, v1, :cond_1

    .line 7
    .line 8
    aget-char v3, p0, v2

    .line 9
    .line 10
    if-ne v3, p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v0
.end method


# virtual methods
.method public b(ILl/b13;Ljava/util/Map;)Ll/r5d0;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/b13;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bc5;->b:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/bc5;->j(Ll/b13;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bc5;->i()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iget-object v0, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 17
    .line 18
    .line 19
    move v0, p2

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Ll/bc5;->k(I)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, -0x1

    .line 25
    if-eq v2, v3, :cond_e

    .line 26
    .line 27
    iget-object v4, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 28
    .line 29
    int-to-char v5, v2

    .line 30
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v4, v0, 0x8

    .line 34
    .line 35
    iget-object v5, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/4 v6, 0x1

    .line 42
    if-le v5, v6, :cond_0

    .line 43
    .line 44
    sget-object v5, Ll/bc5;->f:[C

    .line 45
    .line 46
    sget-object v7, Ll/bc5;->d:[C

    .line 47
    .line 48
    aget-char v2, v7, v2

    .line 49
    .line 50
    invoke-static {v5, v2}, Ll/bc5;->g([CC)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    :cond_0
    iget v2, p0, Ll/bc5;->c:I

    .line 57
    .line 58
    if-lt v4, v2, :cond_d

    .line 59
    .line 60
    :cond_1
    iget-object v2, p0, Ll/bc5;->b:[I

    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x7

    .line 63
    .line 64
    aget v2, v2, v0

    .line 65
    .line 66
    const/4 v5, -0x8

    .line 67
    move v7, v1

    .line 68
    :goto_1
    if-ge v5, v3, :cond_2

    .line 69
    .line 70
    iget-object v8, p0, Ll/bc5;->b:[I

    .line 71
    .line 72
    add-int v9, v4, v5

    .line 73
    .line 74
    aget v8, v8, v9

    .line 75
    .line 76
    add-int/2addr v7, v8

    .line 77
    add-int/lit8 v5, v5, 0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget v3, p0, Ll/bc5;->c:I

    .line 81
    .line 82
    if-ge v4, v3, :cond_4

    .line 83
    .line 84
    div-int/lit8 v7, v7, 0x2

    .line 85
    .line 86
    if-lt v2, v7, :cond_3

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    throw p0

    .line 94
    :cond_4
    :goto_2
    invoke-virtual {p0, p2}, Ll/bc5;->l(I)V

    .line 95
    .line 96
    .line 97
    move v2, v1

    .line 98
    :goto_3
    iget-object v3, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iget-object v4, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 105
    .line 106
    if-ge v2, v3, :cond_5

    .line 107
    .line 108
    sget-object v3, Ll/bc5;->d:[C

    .line 109
    .line 110
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    aget-char v3, v3, v5

    .line 115
    .line 116
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 117
    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_5
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    sget-object v3, Ll/bc5;->f:[C

    .line 127
    .line 128
    invoke-static {v3, v2}, Ll/bc5;->g([CC)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_c

    .line 133
    .line 134
    iget-object v2, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    sub-int/2addr v4, v6

    .line 141
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    invoke-static {v3, v2}, Ll/bc5;->g([CC)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_b

    .line 150
    .line 151
    iget-object v2, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    const/4 v3, 0x3

    .line 158
    if-le v2, v3, :cond_a

    .line 159
    .line 160
    if-eqz p3, :cond_6

    .line 161
    .line 162
    sget-object v2, Lcom/google/zxing/DecodeHintType;->RETURN_CODABAR_START_END:Lcom/google/zxing/DecodeHintType;

    .line 163
    .line 164
    invoke-interface {p3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p3

    .line 168
    if-nez p3, :cond_7

    .line 169
    .line 170
    :cond_6
    iget-object p3, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    sub-int/2addr v2, v6

    .line 177
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object p3, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    :cond_7
    move p3, v1

    .line 186
    :goto_4
    if-ge v1, p2, :cond_8

    .line 187
    .line 188
    iget-object v2, p0, Ll/bc5;->b:[I

    .line 189
    .line 190
    aget v2, v2, v1

    .line 191
    .line 192
    add-int/2addr p3, v2

    .line 193
    add-int/lit8 v1, v1, 0x1

    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_8
    int-to-float v1, p3

    .line 197
    :goto_5
    if-ge p2, v0, :cond_9

    .line 198
    .line 199
    iget-object v2, p0, Ll/bc5;->b:[I

    .line 200
    .line 201
    aget v2, v2, p2

    .line 202
    .line 203
    add-int/2addr p3, v2

    .line 204
    add-int/lit8 p2, p2, 0x1

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_9
    int-to-float p2, p3

    .line 208
    new-instance p3, Ll/r5d0;

    .line 209
    .line 210
    iget-object p0, p0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    new-instance v0, Ll/s5d0;

    .line 217
    .line 218
    int-to-float p1, p1

    .line 219
    invoke-direct {v0, v1, p1}, Ll/s5d0;-><init>(FF)V

    .line 220
    .line 221
    .line 222
    new-instance v1, Ll/s5d0;

    .line 223
    .line 224
    invoke-direct {v1, p2, p1}, Ll/s5d0;-><init>(FF)V

    .line 225
    .line 226
    .line 227
    filled-new-array {v0, v1}, [Ll/s5d0;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    sget-object p2, Lcom/google/zxing/BarcodeFormat;->CODABAR:Lcom/google/zxing/BarcodeFormat;

    .line 232
    .line 233
    const/4 v0, 0x0

    .line 234
    invoke-direct {p3, p0, v0, p1, p2}, Ll/r5d0;-><init>(Ljava/lang/String;[B[Ll/s5d0;Lcom/google/zxing/BarcodeFormat;)V

    .line 235
    .line 236
    .line 237
    return-object p3

    .line 238
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    throw p0

    .line 243
    :cond_b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    throw p0

    .line 248
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    throw p0

    .line 253
    :cond_d
    move v0, v4

    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :cond_e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    throw p0
.end method

.method public final h(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bc5;->b:[I

    .line 2
    .line 3
    iget v1, p0, Ll/bc5;->c:I

    .line 4
    .line 5
    aput p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Ll/bc5;->c:I

    .line 10
    .line 11
    array-length p1, v0

    .line 12
    if-lt v1, p1, :cond_0

    .line 13
    .line 14
    shl-int/lit8 p1, v1, 0x1

    .line 15
    .line 16
    new-array p1, p1, [I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/bc5;->b:[I

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final i()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Ll/bc5;->c:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/bc5;->k(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, -0x1

    .line 12
    if-eq v2, v3, :cond_2

    .line 13
    .line 14
    sget-object v3, Ll/bc5;->f:[C

    .line 15
    .line 16
    sget-object v4, Ll/bc5;->d:[C

    .line 17
    .line 18
    aget-char v2, v4, v2

    .line 19
    .line 20
    invoke-static {v3, v2}, Ll/bc5;->g([CC)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    move v3, v1

    .line 28
    :goto_1
    add-int/lit8 v4, v1, 0x7

    .line 29
    .line 30
    if-ge v3, v4, :cond_0

    .line 31
    .line 32
    iget-object v4, p0, Ll/bc5;->b:[I

    .line 33
    .line 34
    aget v4, v4, v3

    .line 35
    .line 36
    add-int/2addr v2, v4

    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    if-eq v1, v0, :cond_1

    .line 41
    .line 42
    iget-object v3, p0, Ll/bc5;->b:[I

    .line 43
    .line 44
    add-int/lit8 v4, v1, -0x1

    .line 45
    .line 46
    aget v3, v3, v4

    .line 47
    .line 48
    div-int/lit8 v2, v2, 0x2

    .line 49
    .line 50
    if-lt v3, v2, :cond_2

    .line 51
    .line 52
    :cond_1
    return v1

    .line 53
    :cond_2
    add-int/lit8 v1, v1, 0x2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    throw p0
.end method

.method public final j(Ll/b13;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/bc5;->c:I

    .line 3
    .line 4
    invoke-virtual {p1, v0}, Ll/b13;->l(I)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p1}, Ll/b13;->m()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_2

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    move v4, v3

    .line 16
    :goto_0
    if-ge v1, v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ll/b13;->f(I)Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-eq v5, v4, :cond_0

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {p0, v0}, Ll/bc5;->h(I)V

    .line 28
    .line 29
    .line 30
    xor-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    move v0, v3

    .line 33
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, v0}, Ll/bc5;->h(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    throw p0
.end method

.method public final k(I)I
    .locals 9

    .line 1
    add-int/lit8 v0, p1, 0x7

    .line 2
    .line 3
    iget v1, p0, Ll/bc5;->c:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    iget-object p0, p0, Ll/bc5;->b:[I

    .line 10
    .line 11
    const v1, 0x7fffffff

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, p1

    .line 16
    move v5, v1

    .line 17
    move v6, v3

    .line 18
    :goto_0
    if-ge v4, v0, :cond_3

    .line 19
    .line 20
    aget v7, p0, v4

    .line 21
    .line 22
    if-ge v7, v5, :cond_1

    .line 23
    .line 24
    move v5, v7

    .line 25
    :cond_1
    if-le v7, v6, :cond_2

    .line 26
    .line 27
    move v6, v7

    .line 28
    :cond_2
    add-int/lit8 v4, v4, 0x2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_3
    add-int/2addr v5, v6

    .line 32
    div-int/lit8 v5, v5, 0x2

    .line 33
    .line 34
    add-int/lit8 v4, p1, 0x1

    .line 35
    .line 36
    move v6, v3

    .line 37
    :goto_1
    if-ge v4, v0, :cond_6

    .line 38
    .line 39
    aget v7, p0, v4

    .line 40
    .line 41
    if-ge v7, v1, :cond_4

    .line 42
    .line 43
    move v1, v7

    .line 44
    :cond_4
    if-le v7, v6, :cond_5

    .line 45
    .line 46
    move v6, v7

    .line 47
    :cond_5
    add-int/lit8 v4, v4, 0x2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_6
    add-int/2addr v1, v6

    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    const/16 v0, 0x80

    .line 54
    .line 55
    move v4, v3

    .line 56
    move v6, v4

    .line 57
    :goto_2
    const/4 v7, 0x7

    .line 58
    if-ge v4, v7, :cond_9

    .line 59
    .line 60
    and-int/lit8 v7, v4, 0x1

    .line 61
    .line 62
    if-nez v7, :cond_7

    .line 63
    .line 64
    move v7, v5

    .line 65
    goto :goto_3

    .line 66
    :cond_7
    move v7, v1

    .line 67
    :goto_3
    shr-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    add-int v8, p1, v4

    .line 70
    .line 71
    aget v8, p0, v8

    .line 72
    .line 73
    if-le v8, v7, :cond_8

    .line 74
    .line 75
    or-int/2addr v6, v0

    .line 76
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_9
    :goto_4
    sget-object p0, Ll/bc5;->e:[I

    .line 80
    .line 81
    array-length p1, p0

    .line 82
    if-ge v3, p1, :cond_b

    .line 83
    .line 84
    aget p0, p0, v3

    .line 85
    .line 86
    if-ne p0, v6, :cond_a

    .line 87
    .line 88
    return v3

    .line 89
    :cond_a
    add-int/lit8 v3, v3, 0x1

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_b
    return v2
.end method

.method public final l(I)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput v3, v2, v3

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    aput v3, v2, v4

    .line 11
    .line 12
    const/4 v5, 0x2

    .line 13
    aput v3, v2, v5

    .line 14
    .line 15
    const/4 v6, 0x3

    .line 16
    aput v3, v2, v6

    .line 17
    .line 18
    new-array v7, v1, [I

    .line 19
    .line 20
    aput v3, v7, v3

    .line 21
    .line 22
    aput v3, v7, v4

    .line 23
    .line 24
    aput v3, v7, v5

    .line 25
    .line 26
    aput v3, v7, v6

    .line 27
    .line 28
    iget-object v6, v0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    sub-int/2addr v6, v4

    .line 35
    move/from16 v9, p1

    .line 36
    .line 37
    move v8, v3

    .line 38
    :goto_0
    sget-object v10, Ll/bc5;->e:[I

    .line 39
    .line 40
    iget-object v11, v0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v11

    .line 46
    aget v10, v10, v11

    .line 47
    .line 48
    const/4 v11, 0x6

    .line 49
    move v12, v11

    .line 50
    :goto_1
    if-ltz v12, :cond_0

    .line 51
    .line 52
    and-int/lit8 v13, v12, 0x1

    .line 53
    .line 54
    and-int/lit8 v14, v10, 0x1

    .line 55
    .line 56
    shl-int/2addr v14, v4

    .line 57
    add-int/2addr v13, v14

    .line 58
    aget v14, v2, v13

    .line 59
    .line 60
    iget-object v15, v0, Ll/bc5;->b:[I

    .line 61
    .line 62
    add-int v16, v9, v12

    .line 63
    .line 64
    aget v15, v15, v16

    .line 65
    .line 66
    add-int/2addr v14, v15

    .line 67
    aput v14, v2, v13

    .line 68
    .line 69
    aget v14, v7, v13

    .line 70
    .line 71
    add-int/2addr v14, v4

    .line 72
    aput v14, v7, v13

    .line 73
    .line 74
    shr-int/2addr v10, v4

    .line 75
    add-int/lit8 v12, v12, -0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_0
    if-ge v8, v6, :cond_1

    .line 79
    .line 80
    add-int/lit8 v9, v9, 0x8

    .line 81
    .line 82
    add-int/lit8 v8, v8, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    new-array v8, v1, [F

    .line 86
    .line 87
    new-array v1, v1, [F

    .line 88
    .line 89
    move v9, v3

    .line 90
    :goto_2
    if-ge v9, v5, :cond_2

    .line 91
    .line 92
    const/4 v10, 0x0

    .line 93
    aput v10, v1, v9

    .line 94
    .line 95
    add-int/lit8 v10, v9, 0x2

    .line 96
    .line 97
    aget v12, v2, v9

    .line 98
    .line 99
    int-to-float v12, v12

    .line 100
    aget v13, v7, v9

    .line 101
    .line 102
    int-to-float v13, v13

    .line 103
    div-float/2addr v12, v13

    .line 104
    aget v13, v2, v10

    .line 105
    .line 106
    int-to-float v14, v13

    .line 107
    aget v15, v7, v10

    .line 108
    .line 109
    int-to-float v3, v15

    .line 110
    div-float/2addr v14, v3

    .line 111
    add-float/2addr v12, v14

    .line 112
    const/high16 v3, 0x40000000    # 2.0f

    .line 113
    .line 114
    div-float/2addr v12, v3

    .line 115
    aput v12, v1, v10

    .line 116
    .line 117
    aput v12, v8, v9

    .line 118
    .line 119
    int-to-float v12, v13

    .line 120
    mul-float/2addr v12, v3

    .line 121
    const/high16 v3, 0x3fc00000    # 1.5f

    .line 122
    .line 123
    add-float/2addr v12, v3

    .line 124
    int-to-float v3, v15

    .line 125
    div-float/2addr v12, v3

    .line 126
    aput v12, v8, v10

    .line 127
    .line 128
    add-int/lit8 v9, v9, 0x1

    .line 129
    .line 130
    const/4 v3, 0x0

    .line 131
    goto :goto_2

    .line 132
    :cond_2
    move/from16 v2, p1

    .line 133
    .line 134
    const/4 v3, 0x0

    .line 135
    :goto_3
    sget-object v5, Ll/bc5;->e:[I

    .line 136
    .line 137
    iget-object v7, v0, Ll/bc5;->a:Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    aget v5, v5, v7

    .line 144
    .line 145
    move v7, v11

    .line 146
    :goto_4
    if-ltz v7, :cond_4

    .line 147
    .line 148
    and-int/lit8 v9, v7, 0x1

    .line 149
    .line 150
    and-int/lit8 v10, v5, 0x1

    .line 151
    .line 152
    shl-int/2addr v10, v4

    .line 153
    add-int/2addr v9, v10

    .line 154
    iget-object v10, v0, Ll/bc5;->b:[I

    .line 155
    .line 156
    add-int v12, v2, v7

    .line 157
    .line 158
    aget v10, v10, v12

    .line 159
    .line 160
    int-to-float v10, v10

    .line 161
    aget v12, v1, v9

    .line 162
    .line 163
    cmpg-float v12, v10, v12

    .line 164
    .line 165
    if-ltz v12, :cond_3

    .line 166
    .line 167
    aget v9, v8, v9

    .line 168
    .line 169
    cmpl-float v9, v10, v9

    .line 170
    .line 171
    if-gtz v9, :cond_3

    .line 172
    .line 173
    shr-int/lit8 v5, v5, 0x1

    .line 174
    .line 175
    add-int/lit8 v7, v7, -0x1

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    throw v0

    .line 183
    :cond_4
    if-ge v3, v6, :cond_5

    .line 184
    .line 185
    add-int/lit8 v2, v2, 0x8

    .line 186
    .line 187
    add-int/lit8 v3, v3, 0x1

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_5
    return-void
.end method
