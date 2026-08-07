.class public Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private coeffs:[J

.field private numCoeffs:I


# direct methods
.method private constructor <init>(I)V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-array p1, p1, [J

    iput-object p1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    iput v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    new-array v0, v0, [J

    .line 14
    .line 15
    iput-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 20
    .line 21
    if-ge v0, v2, :cond_3

    .line 22
    .line 23
    iget-object v2, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    .line 24
    .line 25
    add-int/lit8 v3, v0, 0x1

    .line 26
    .line 27
    aget v2, v2, v0

    .line 28
    .line 29
    :goto_1
    if-gez v2, :cond_0

    .line 30
    .line 31
    add-int/lit16 v2, v2, 0x800

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget v4, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 35
    .line 36
    const-wide/16 v5, 0x0

    .line 37
    .line 38
    if-ge v3, v4, :cond_1

    .line 39
    .line 40
    iget-object v4, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x2

    .line 43
    .line 44
    aget v3, v4, v3

    .line 45
    .line 46
    int-to-long v3, v3

    .line 47
    goto :goto_2

    .line 48
    :cond_1
    move v0, v3

    .line 49
    move-wide v3, v5

    .line 50
    :goto_2
    cmp-long v7, v3, v5

    .line 51
    .line 52
    if-gez v7, :cond_2

    .line 53
    .line 54
    const-wide/16 v7, 0x800

    .line 55
    .line 56
    add-long/2addr v3, v7

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    iget-object v5, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 59
    .line 60
    int-to-long v6, v2

    .line 61
    const/16 v2, 0x18

    .line 62
    .line 63
    shl-long v2, v3, v2

    .line 64
    .line 65
    add-long/2addr v6, v2

    .line 66
    aput-wide v6, v5, v1

    .line 67
    .line 68
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    return-void
.end method

.method private constructor <init>([J)V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    return-void
.end method

.method private add(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 5
    .line 6
    array-length v3, v2

    .line 7
    if-le v1, v3, :cond_0

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    invoke-static {v2, v0}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 18
    .line 19
    array-length v2, v1

    .line 20
    if-ge v0, v2, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 23
    .line 24
    aget-wide v3, v2, v0

    .line 25
    .line 26
    aget-wide v5, v1, v0

    .line 27
    .line 28
    add-long/2addr v3, v5

    .line 29
    const-wide v5, 0x7ff0007ffL

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    and-long/2addr v3, v5

    .line 35
    aput-wide v3, v2, v0

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method private multRecursive(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 4
    .line 5
    move-object/from16 v1, p1

    .line 6
    .line 7
    iget-object v1, v1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 8
    .line 9
    array-length v2, v1

    .line 10
    const/16 v3, 0x20

    .line 11
    .line 12
    const-wide v4, 0x7ff0007ffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    if-gt v2, v3, :cond_2

    .line 19
    .line 20
    mul-int/lit8 v3, v2, 0x2

    .line 21
    .line 22
    new-instance v7, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 23
    .line 24
    new-array v8, v3, [J

    .line 25
    .line 26
    invoke-direct {v7, v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 27
    .line 28
    .line 29
    move v8, v6

    .line 30
    :goto_0
    if-ge v8, v3, :cond_1

    .line 31
    .line 32
    sub-int v9, v8, v2

    .line 33
    .line 34
    add-int/lit8 v9, v9, 0x1

    .line 35
    .line 36
    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    :goto_1
    add-int/lit8 v10, v2, -0x1

    .line 41
    .line 42
    invoke-static {v8, v10}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result v10

    .line 46
    if-gt v9, v10, :cond_0

    .line 47
    .line 48
    sub-int v10, v8, v9

    .line 49
    .line 50
    aget-wide v10, v0, v10

    .line 51
    .line 52
    aget-wide v12, v1, v9

    .line 53
    .line 54
    mul-long/2addr v10, v12

    .line 55
    const-wide v12, 0x7ff000000L

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    const-wide/16 v14, 0x7ff

    .line 61
    .line 62
    and-long v16, v10, v14

    .line 63
    .line 64
    add-long v16, v16, v12

    .line 65
    .line 66
    and-long v12, v10, v16

    .line 67
    .line 68
    const/16 v16, 0x30

    .line 69
    .line 70
    ushr-long v10, v10, v16

    .line 71
    .line 72
    and-long/2addr v10, v14

    .line 73
    iget-object v14, v7, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 74
    .line 75
    aget-wide v15, v14, v8

    .line 76
    .line 77
    add-long/2addr v15, v12

    .line 78
    and-long v12, v15, v4

    .line 79
    .line 80
    aput-wide v12, v14, v8

    .line 81
    .line 82
    add-int/lit8 v12, v8, 0x1

    .line 83
    .line 84
    aget-wide v15, v14, v12

    .line 85
    .line 86
    add-long/2addr v15, v10

    .line 87
    and-long v10, v15, v4

    .line 88
    .line 89
    aput-wide v10, v14, v12

    .line 90
    .line 91
    add-int/lit8 v9, v9, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_0
    add-int/lit8 v8, v8, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    return-object v7

    .line 98
    :cond_2
    div-int/lit8 v3, v2, 0x2

    .line 99
    .line 100
    new-instance v7, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 101
    .line 102
    invoke-static {v0, v3}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-direct {v7, v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 107
    .line 108
    .line 109
    new-instance v8, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 110
    .line 111
    invoke-static {v0, v3, v2}, Lorg/spongycastle/util/Arrays;->copyOfRange([JII)[J

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-direct {v8, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 116
    .line 117
    .line 118
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 119
    .line 120
    invoke-static {v1, v3}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    invoke-direct {v0, v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 125
    .line 126
    .line 127
    new-instance v9, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 128
    .line 129
    invoke-static {v1, v3, v2}, Lorg/spongycastle/util/Arrays;->copyOfRange([JII)[J

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-direct {v9, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v7}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->clone()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 141
    .line 142
    invoke-direct {v1, v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->clone()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v10

    .line 149
    check-cast v10, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 150
    .line 151
    invoke-direct {v10, v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V

    .line 152
    .line 153
    .line 154
    invoke-direct {v7, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->multRecursive(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-direct {v8, v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->multRecursive(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    invoke-direct {v1, v10}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->multRecursive(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V

    .line 167
    .line 168
    .line 169
    invoke-direct {v1, v7}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V

    .line 170
    .line 171
    .line 172
    new-instance v8, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 173
    .line 174
    mul-int/lit8 v2, v2, 0x2

    .line 175
    .line 176
    invoke-direct {v8, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>(I)V

    .line 177
    .line 178
    .line 179
    move v2, v6

    .line 180
    :goto_2
    iget-object v9, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 181
    .line 182
    array-length v10, v9

    .line 183
    if-ge v2, v10, :cond_3

    .line 184
    .line 185
    iget-object v10, v8, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 186
    .line 187
    aget-wide v11, v9, v2

    .line 188
    .line 189
    and-long/2addr v11, v4

    .line 190
    aput-wide v11, v10, v2

    .line 191
    .line 192
    add-int/lit8 v2, v2, 0x1

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_3
    move v0, v6

    .line 196
    :goto_3
    iget-object v2, v1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 197
    .line 198
    array-length v9, v2

    .line 199
    if-ge v0, v9, :cond_4

    .line 200
    .line 201
    iget-object v9, v8, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 202
    .line 203
    add-int v10, v3, v0

    .line 204
    .line 205
    aget-wide v11, v9, v10

    .line 206
    .line 207
    aget-wide v13, v2, v0

    .line 208
    .line 209
    add-long/2addr v11, v13

    .line 210
    and-long/2addr v11, v4

    .line 211
    aput-wide v11, v9, v10

    .line 212
    .line 213
    add-int/lit8 v0, v0, 0x1

    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_4
    :goto_4
    iget-object v0, v7, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 217
    .line 218
    array-length v1, v0

    .line 219
    if-ge v6, v1, :cond_5

    .line 220
    .line 221
    iget-object v1, v8, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 222
    .line 223
    mul-int/lit8 v2, v3, 0x2

    .line 224
    .line 225
    add-int/2addr v2, v6

    .line 226
    aget-wide v9, v1, v2

    .line 227
    .line 228
    aget-wide v11, v0, v6

    .line 229
    .line 230
    add-long/2addr v9, v11

    .line 231
    and-long/2addr v9, v4

    .line 232
    aput-wide v9, v1, v2

    .line 233
    .line 234
    add-int/lit8 v6, v6, 0x1

    .line 235
    .line 236
    goto :goto_4

    .line 237
    :cond_5
    return-object v8
.end method

.method private sub(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 5
    .line 6
    array-length v3, v2

    .line 7
    if-le v1, v3, :cond_0

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    invoke-static {v2, v0}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 18
    .line 19
    array-length v2, v1

    .line 20
    if-ge v0, v2, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 23
    .line 24
    const-wide v3, 0x800000800000L

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    aget-wide v5, v2, v0

    .line 30
    .line 31
    add-long/2addr v5, v3

    .line 32
    aget-wide v3, v1, v0

    .line 33
    .line 34
    sub-long/2addr v5, v3

    .line 35
    const-wide v3, 0x7ff0007ffL

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    and-long/2addr v3, v5

    .line 41
    aput-wide v3, v2, v0

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 4
    .line 5
    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, [J

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 12
    .line 13
    .line 14
    iget p0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 15
    .line 16
    iput p0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 17
    .line 18
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 6
    .line 7
    check-cast p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 10
    .line 11
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([J[J)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public mult(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;
    .locals 13

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget-object v1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 5
    .line 6
    array-length v1, v1

    .line 7
    if-ne v1, v0, :cond_4

    .line 8
    .line 9
    iget v1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 10
    .line 11
    iget v2, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 12
    .line 13
    if-ne v1, v2, :cond_4

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->multRecursive(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 20
    .line 21
    array-length v1, v1

    .line 22
    if-le v1, v0, :cond_3

    .line 23
    .line 24
    iget v1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 25
    .line 26
    rem-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    const-wide v2, 0x7ff0007ffL

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    move v1, v0

    .line 36
    :goto_0
    iget-object v4, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 37
    .line 38
    array-length v5, v4

    .line 39
    if-ge v1, v5, :cond_0

    .line 40
    .line 41
    sub-int v5, v1, v0

    .line 42
    .line 43
    aget-wide v6, v4, v5

    .line 44
    .line 45
    aget-wide v8, v4, v1

    .line 46
    .line 47
    add-long/2addr v6, v8

    .line 48
    and-long/2addr v6, v2

    .line 49
    aput-wide v6, v4, v5

    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-static {v4, v0}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    move v1, v0

    .line 62
    :goto_1
    iget-object v4, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 63
    .line 64
    array-length v5, v4

    .line 65
    const-wide/16 v6, 0x7ff

    .line 66
    .line 67
    if-ge v1, v5, :cond_2

    .line 68
    .line 69
    sub-int v5, v1, v0

    .line 70
    .line 71
    aget-wide v8, v4, v5

    .line 72
    .line 73
    add-int/lit8 v10, v1, -0x1

    .line 74
    .line 75
    aget-wide v10, v4, v10

    .line 76
    .line 77
    const/16 v12, 0x18

    .line 78
    .line 79
    shr-long/2addr v10, v12

    .line 80
    add-long/2addr v8, v10

    .line 81
    aput-wide v8, v4, v5

    .line 82
    .line 83
    aget-wide v10, v4, v1

    .line 84
    .line 85
    and-long/2addr v6, v10

    .line 86
    shl-long/2addr v6, v12

    .line 87
    add-long/2addr v8, v6

    .line 88
    aput-wide v8, v4, v5

    .line 89
    .line 90
    and-long v6, v8, v2

    .line 91
    .line 92
    aput-wide v6, v4, v5

    .line 93
    .line 94
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    invoke-static {v4, v0}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 102
    .line 103
    array-length v1, v0

    .line 104
    add-int/lit8 v1, v1, -0x1

    .line 105
    .line 106
    aget-wide v2, v0, v1

    .line 107
    .line 108
    and-long/2addr v2, v6

    .line 109
    aput-wide v2, v0, v1

    .line 110
    .line 111
    :cond_3
    :goto_2
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;

    .line 112
    .line 113
    iget-object p1, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 114
    .line 115
    invoke-direct {v0, p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;-><init>([J)V

    .line 116
    .line 117
    .line 118
    iget p0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 119
    .line 120
    iput p0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 121
    .line 122
    return-object v0

    .line 123
    :cond_4
    const-string p0, "Number of coefficients must be the same"

    .line 124
    .line 125
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const/4 p0, 0x0

    .line 129
    return-object p0
.end method

.method public mult2And(I)V
    .locals 6

    .line 1
    int-to-long v0, p1

    .line 2
    const/16 p1, 0x18

    .line 3
    .line 4
    shl-long v2, v0, p1

    .line 5
    .line 6
    add-long/2addr v2, v0

    .line 7
    const/4 p1, 0x0

    .line 8
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    if-ge p1, v1, :cond_0

    .line 12
    .line 13
    aget-wide v4, v0, p1

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    shl-long/2addr v4, v1

    .line 17
    and-long/2addr v4, v2

    .line 18
    aput-wide v4, v0, p1

    .line 19
    .line 20
    add-int/lit8 p1, p1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public subAnd(Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;I)V
    .locals 8

    .line 1
    int-to-long v0, p2

    .line 2
    const/16 p2, 0x18

    .line 3
    .line 4
    shl-long v2, v0, p2

    .line 5
    .line 6
    add-long/2addr v2, v0

    .line 7
    const/4 p2, 0x0

    .line 8
    :goto_0
    iget-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    if-ge p2, v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 14
    .line 15
    const-wide v4, 0x800000800000L

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    aget-wide v6, v1, p2

    .line 21
    .line 22
    add-long/2addr v6, v4

    .line 23
    aget-wide v4, v0, p2

    .line 24
    .line 25
    sub-long/2addr v6, v4

    .line 26
    and-long v4, v6, v2

    .line 27
    .line 28
    aput-wide v4, v1, p2

    .line 29
    .line 30
    add-int/lit8 p2, p2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .locals 11

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->coeffs:[J

    .line 8
    .line 9
    array-length v4, v3

    .line 10
    if-ge v1, v4, :cond_1

    .line 11
    .line 12
    add-int/lit8 v4, v2, 0x1

    .line 13
    .line 14
    aget-wide v5, v3, v1

    .line 15
    .line 16
    const-wide/16 v7, 0x7ff

    .line 17
    .line 18
    and-long v9, v5, v7

    .line 19
    .line 20
    long-to-int v3, v9

    .line 21
    aput v3, v0, v2

    .line 22
    .line 23
    iget v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial2;->numCoeffs:I

    .line 24
    .line 25
    if-ge v4, v3, :cond_0

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x2

    .line 28
    .line 29
    const/16 v3, 0x18

    .line 30
    .line 31
    shr-long/2addr v5, v3

    .line 32
    and-long/2addr v5, v7

    .line 33
    long-to-int v3, v5

    .line 34
    aput v3, v0, v4

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    move v2, v4

    .line 38
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 42
    .line 43
    invoke-direct {p0, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>([I)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method
