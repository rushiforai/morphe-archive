.class public Landroidx/constraintlayout/solver/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Landroidx/constraintlayout/solver/b;

.field public final c:Ll/wx3;

.field public d:I

.field public e:Landroidx/constraintlayout/solver/SolverVariable;

.field public f:[I

.field public g:[I

.field public h:[F

.field public i:I

.field public j:I

.field public k:Z


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/b;Ll/wx3;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    iput v1, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->e:Landroidx/constraintlayout/solver/SolverVariable;

    .line 13
    .line 14
    new-array v2, v1, [I

    .line 15
    .line 16
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 17
    .line 18
    new-array v2, v1, [I

    .line 19
    .line 20
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    iput-object v1, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    iput v1, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 28
    .line 29
    iput v1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 30
    .line 31
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 32
    .line 33
    iput-object p1, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 34
    .line 35
    iput-object p2, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final a(Landroidx/constraintlayout/solver/SolverVariable;FZ)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p2, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto/16 :goto_6

    .line 7
    .line 8
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, -0x1

    .line 12
    const/4 v4, 0x1

    .line 13
    if-ne v1, v3, :cond_1

    .line 14
    .line 15
    iput v2, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 16
    .line 17
    iget-object p3, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 18
    .line 19
    aput p2, p3, v2

    .line 20
    .line 21
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 22
    .line 23
    iget p3, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 24
    .line 25
    aput p3, p2, v2

    .line 26
    .line 27
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 28
    .line 29
    aput v3, p2, v2

    .line 30
    .line 31
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 32
    .line 33
    add-int/2addr p2, v4

    .line 34
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 35
    .line 36
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->a(Landroidx/constraintlayout/solver/b;)V

    .line 39
    .line 40
    .line 41
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 42
    .line 43
    add-int/2addr p1, v4

    .line 44
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 45
    .line 46
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 47
    .line 48
    if-nez p1, :cond_f

    .line 49
    .line 50
    iget p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 51
    .line 52
    add-int/2addr p1, v4

    .line 53
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 54
    .line 55
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 56
    .line 57
    array-length p3, p2

    .line 58
    if-lt p1, p3, :cond_f

    .line 59
    .line 60
    iput-boolean v4, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 61
    .line 62
    array-length p1, p2

    .line 63
    sub-int/2addr p1, v4

    .line 64
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    move v5, v2

    .line 68
    move v6, v3

    .line 69
    :goto_0
    if-eq v1, v3, :cond_7

    .line 70
    .line 71
    iget v7, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 72
    .line 73
    if-ge v5, v7, :cond_7

    .line 74
    .line 75
    iget-object v7, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 76
    .line 77
    aget v7, v7, v1

    .line 78
    .line 79
    iget v8, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 80
    .line 81
    if-ne v7, v8, :cond_5

    .line 82
    .line 83
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 84
    .line 85
    aget v3, v2, v1

    .line 86
    .line 87
    add-float/2addr v3, p2

    .line 88
    aput v3, v2, v1

    .line 89
    .line 90
    cmpl-float p2, v3, v0

    .line 91
    .line 92
    if-nez p2, :cond_f

    .line 93
    .line 94
    iget p2, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 95
    .line 96
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 97
    .line 98
    if-ne v1, p2, :cond_2

    .line 99
    .line 100
    aget p2, v0, v1

    .line 101
    .line 102
    iput p2, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    aget p2, v0, v1

    .line 106
    .line 107
    aput p2, v0, v6

    .line 108
    .line 109
    :goto_1
    if-eqz p3, :cond_3

    .line 110
    .line 111
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    iget-boolean p2, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 117
    .line 118
    if-eqz p2, :cond_4

    .line 119
    .line 120
    iput v1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 121
    .line 122
    :cond_4
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 123
    .line 124
    sub-int/2addr p2, v4

    .line 125
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 126
    .line 127
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 128
    .line 129
    sub-int/2addr p1, v4

    .line 130
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 131
    .line 132
    return-void

    .line 133
    :cond_5
    if-ge v7, v8, :cond_6

    .line 134
    .line 135
    move v6, v1

    .line 136
    :cond_6
    iget-object v7, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 137
    .line 138
    aget v1, v7, v1

    .line 139
    .line 140
    add-int/lit8 v5, v5, 0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_7
    iget p3, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 144
    .line 145
    add-int/lit8 v0, p3, 0x1

    .line 146
    .line 147
    iget-boolean v1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 148
    .line 149
    if-eqz v1, :cond_9

    .line 150
    .line 151
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 152
    .line 153
    aget v1, v0, p3

    .line 154
    .line 155
    if-ne v1, v3, :cond_8

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_8
    array-length p3, v0

    .line 159
    goto :goto_2

    .line 160
    :cond_9
    move p3, v0

    .line 161
    :goto_2
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 162
    .line 163
    array-length v1, v0

    .line 164
    if-lt p3, v1, :cond_b

    .line 165
    .line 166
    iget v1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 167
    .line 168
    array-length v0, v0

    .line 169
    if-ge v1, v0, :cond_b

    .line 170
    .line 171
    move v0, v2

    .line 172
    :goto_3
    iget-object v1, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 173
    .line 174
    array-length v5, v1

    .line 175
    if-ge v0, v5, :cond_b

    .line 176
    .line 177
    aget v1, v1, v0

    .line 178
    .line 179
    if-ne v1, v3, :cond_a

    .line 180
    .line 181
    move p3, v0

    .line 182
    goto :goto_4

    .line 183
    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_b
    :goto_4
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 187
    .line 188
    array-length v1, v0

    .line 189
    if-lt p3, v1, :cond_c

    .line 190
    .line 191
    array-length p3, v0

    .line 192
    iget v0, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 193
    .line 194
    mul-int/lit8 v0, v0, 0x2

    .line 195
    .line 196
    iput v0, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 197
    .line 198
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 199
    .line 200
    add-int/lit8 v1, p3, -0x1

    .line 201
    .line 202
    iput v1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 203
    .line 204
    iget-object v1, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 205
    .line 206
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 211
    .line 212
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 213
    .line 214
    iget v1, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 215
    .line 216
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 221
    .line 222
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 223
    .line 224
    iget v1, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 225
    .line 226
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 231
    .line 232
    :cond_c
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 233
    .line 234
    iget v1, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 235
    .line 236
    aput v1, v0, p3

    .line 237
    .line 238
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 239
    .line 240
    aput p2, v0, p3

    .line 241
    .line 242
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 243
    .line 244
    if-eq v6, v3, :cond_d

    .line 245
    .line 246
    aget v0, p2, v6

    .line 247
    .line 248
    aput v0, p2, p3

    .line 249
    .line 250
    aput p3, p2, v6

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_d
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 254
    .line 255
    aput v0, p2, p3

    .line 256
    .line 257
    iput p3, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 258
    .line 259
    :goto_5
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 260
    .line 261
    add-int/2addr p2, v4

    .line 262
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 263
    .line 264
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 265
    .line 266
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->a(Landroidx/constraintlayout/solver/b;)V

    .line 267
    .line 268
    .line 269
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 270
    .line 271
    add-int/2addr p1, v4

    .line 272
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 273
    .line 274
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 275
    .line 276
    if-nez p1, :cond_e

    .line 277
    .line 278
    iget p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 279
    .line 280
    add-int/2addr p1, v4

    .line 281
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 282
    .line 283
    :cond_e
    iget p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 284
    .line 285
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 286
    .line 287
    array-length p3, p2

    .line 288
    if-lt p1, p3, :cond_f

    .line 289
    .line 290
    iput-boolean v4, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 291
    .line 292
    array-length p1, p2

    .line 293
    sub-int/2addr p1, v4

    .line 294
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 295
    .line 296
    :cond_f
    :goto_6
    return-void
.end method

.method public b(Landroidx/constraintlayout/solver/c;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 14

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move v7, v2

    .line 7
    move v8, v7

    .line 8
    move v4, v3

    .line 9
    move v5, v4

    .line 10
    move v6, v5

    .line 11
    move-object v3, v1

    .line 12
    :goto_0
    const/4 v9, -0x1

    .line 13
    if-eq v0, v9, :cond_8

    .line 14
    .line 15
    iget v9, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 16
    .line 17
    if-ge v4, v9, :cond_8

    .line 18
    .line 19
    iget-object v9, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 20
    .line 21
    aget v10, v9, v0

    .line 22
    .line 23
    iget-object v11, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 24
    .line 25
    iget-object v11, v11, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 26
    .line 27
    iget-object v12, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 28
    .line 29
    aget v12, v12, v0

    .line 30
    .line 31
    aget-object v11, v11, v12

    .line 32
    .line 33
    cmpg-float v12, v10, v2

    .line 34
    .line 35
    if-gez v12, :cond_0

    .line 36
    .line 37
    const v12, -0x457ced91    # -0.001f

    .line 38
    .line 39
    .line 40
    cmpl-float v12, v10, v12

    .line 41
    .line 42
    if-lez v12, :cond_1

    .line 43
    .line 44
    aput v2, v9, v0

    .line 45
    .line 46
    iget-object v9, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 47
    .line 48
    invoke-virtual {v11, v9}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 49
    .line 50
    .line 51
    :goto_1
    move v10, v2

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    const v12, 0x3a83126f    # 0.001f

    .line 54
    .line 55
    .line 56
    cmpg-float v12, v10, v12

    .line 57
    .line 58
    if-gez v12, :cond_1

    .line 59
    .line 60
    aput v2, v9, v0

    .line 61
    .line 62
    iget-object v9, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 63
    .line 64
    invoke-virtual {v11, v9}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    :goto_2
    cmpl-float v9, v10, v2

    .line 69
    .line 70
    if-eqz v9, :cond_7

    .line 71
    .line 72
    iget-object v9, v11, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 73
    .line 74
    sget-object v12, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 75
    .line 76
    const/4 v13, 0x1

    .line 77
    if-ne v9, v12, :cond_4

    .line 78
    .line 79
    if-nez v3, :cond_2

    .line 80
    .line 81
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    :goto_3
    move v5, v3

    .line 86
    move v7, v10

    .line 87
    move-object v3, v11

    .line 88
    goto :goto_5

    .line 89
    :cond_2
    cmpl-float v9, v7, v10

    .line 90
    .line 91
    if-lez v9, :cond_3

    .line 92
    .line 93
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    goto :goto_3

    .line 98
    :cond_3
    if-nez v5, :cond_7

    .line 99
    .line 100
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    if-eqz v9, :cond_7

    .line 105
    .line 106
    move v7, v10

    .line 107
    move-object v3, v11

    .line 108
    move v5, v13

    .line 109
    goto :goto_5

    .line 110
    :cond_4
    if-nez v3, :cond_7

    .line 111
    .line 112
    cmpg-float v9, v10, v2

    .line 113
    .line 114
    if-gez v9, :cond_7

    .line 115
    .line 116
    if-nez v1, :cond_5

    .line 117
    .line 118
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    :goto_4
    move v6, v1

    .line 123
    move v8, v10

    .line 124
    move-object v1, v11

    .line 125
    goto :goto_5

    .line 126
    :cond_5
    cmpl-float v9, v8, v10

    .line 127
    .line 128
    if-lez v9, :cond_6

    .line 129
    .line 130
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_4

    .line 135
    :cond_6
    if-nez v6, :cond_7

    .line 136
    .line 137
    invoke-virtual {p0, v11, p1}, Landroidx/constraintlayout/solver/a;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z

    .line 138
    .line 139
    .line 140
    move-result v9

    .line 141
    if-eqz v9, :cond_7

    .line 142
    .line 143
    move v8, v10

    .line 144
    move-object v1, v11

    .line 145
    move v6, v13

    .line 146
    :cond_7
    :goto_5
    iget-object v9, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 147
    .line 148
    aget v0, v9, v0

    .line 149
    .line 150
    add-int/lit8 v4, v4, 0x1

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_8
    if-eqz v3, :cond_9

    .line 155
    .line 156
    return-object v3

    .line 157
    :cond_9
    return-object v1
.end method

.method public final c()V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_1

    .line 7
    .line 8
    iget v4, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 9
    .line 10
    if-ge v2, v4, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 13
    .line 14
    iget-object v3, v3, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 15
    .line 16
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 17
    .line 18
    aget v4, v4, v0

    .line 19
    .line 20
    aget-object v3, v3, v4

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 30
    .line 31
    aget v0, v3, v0

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iput v3, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 37
    .line 38
    iput v3, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 39
    .line 40
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 41
    .line 42
    iput v1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 43
    .line 44
    return-void
.end method

.method public final d(Landroidx/constraintlayout/solver/SolverVariable;)Z
    .locals 6

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    move v3, v1

    .line 9
    :goto_0
    if-eq v0, v2, :cond_2

    .line 10
    .line 11
    iget v4, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 12
    .line 13
    if-ge v3, v4, :cond_2

    .line 14
    .line 15
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 16
    .line 17
    aget v4, v4, v0

    .line 18
    .line 19
    iget v5, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 20
    .line 21
    if-ne v4, v5, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 26
    .line 27
    aget v0, v4, v0

    .line 28
    .line 29
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    return v1
.end method

.method public e(F)V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 12
    .line 13
    aget v3, v2, v0

    .line 14
    .line 15
    div-float/2addr v3, p1

    .line 16
    aput v3, v2, v0

    .line 17
    .line 18
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 19
    .line 20
    aget v0, v2, v0

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public final f(Landroidx/constraintlayout/solver/SolverVariable;)F
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 12
    .line 13
    aget v2, v2, v0

    .line 14
    .line 15
    iget v3, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 16
    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 20
    .line 21
    aget p0, p0, v0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 25
    .line 26
    aget v0, v2, v0

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public g([ZLandroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 9

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move v4, v3

    .line 7
    :goto_0
    const/4 v5, -0x1

    .line 8
    if-eq v0, v5, :cond_3

    .line 9
    .line 10
    iget v5, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 11
    .line 12
    if-ge v1, v5, :cond_3

    .line 13
    .line 14
    iget-object v5, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 15
    .line 16
    aget v5, v5, v0

    .line 17
    .line 18
    cmpg-float v6, v5, v3

    .line 19
    .line 20
    if-gez v6, :cond_2

    .line 21
    .line 22
    iget-object v6, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 23
    .line 24
    iget-object v6, v6, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 25
    .line 26
    iget-object v7, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 27
    .line 28
    aget v7, v7, v0

    .line 29
    .line 30
    aget-object v6, v6, v7

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget v7, v6, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 35
    .line 36
    aget-boolean v7, p1, v7

    .line 37
    .line 38
    if-nez v7, :cond_2

    .line 39
    .line 40
    :cond_0
    if-eq v6, p2, :cond_2

    .line 41
    .line 42
    iget-object v7, v6, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 43
    .line 44
    sget-object v8, Landroidx/constraintlayout/solver/SolverVariable$Type;->SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 45
    .line 46
    if-eq v7, v8, :cond_1

    .line 47
    .line 48
    sget-object v8, Landroidx/constraintlayout/solver/SolverVariable$Type;->ERROR:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 49
    .line 50
    if-ne v7, v8, :cond_2

    .line 51
    .line 52
    :cond_1
    cmpg-float v7, v5, v4

    .line 53
    .line 54
    if-gez v7, :cond_2

    .line 55
    .line 56
    move v4, v5

    .line 57
    move-object v2, v6

    .line 58
    :cond_2
    iget-object v5, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 59
    .line 60
    aget v0, v5, v0

    .line 61
    .line 62
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    return-object v2
.end method

.method public final h(I)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    if-ne v1, p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 14
    .line 15
    iget-object p1, p1, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 16
    .line 17
    iget-object p0, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 18
    .line 19
    aget p0, p0, v0

    .line 20
    .line 21
    aget-object p0, p1, p0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 25
    .line 26
    aget v0, v2, v0

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final i(I)F
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    if-ne v1, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 14
    .line 15
    aget p0, p0, v0

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 19
    .line 20
    aget v0, v2, v0

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public j()V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 12
    .line 13
    aget v3, v2, v0

    .line 14
    .line 15
    const/high16 v4, -0x40800000    # -1.0f

    .line 16
    .line 17
    mul-float/2addr v3, v4

    .line 18
    aput v3, v2, v0

    .line 19
    .line 20
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 21
    .line 22
    aget v0, v2, v0

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/c;)Z
    .locals 0

    .line 1
    iget p0, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-gt p0, p1, :cond_0

    .line 5
    .line 6
    return p1

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final l(Landroidx/constraintlayout/solver/SolverVariable;F)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p2, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1}, Landroidx/constraintlayout/solver/a;->m(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, -0x1

    .line 15
    if-ne v0, v3, :cond_1

    .line 16
    .line 17
    iput v2, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 18
    .line 19
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 20
    .line 21
    aput p2, v0, v2

    .line 22
    .line 23
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 24
    .line 25
    iget v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 26
    .line 27
    aput v0, p2, v2

    .line 28
    .line 29
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 30
    .line 31
    aput v3, p2, v2

    .line 32
    .line 33
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 34
    .line 35
    add-int/2addr p2, v1

    .line 36
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 37
    .line 38
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->a(Landroidx/constraintlayout/solver/b;)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 44
    .line 45
    add-int/2addr p1, v1

    .line 46
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 47
    .line 48
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 49
    .line 50
    if-nez p1, :cond_d

    .line 51
    .line 52
    iget p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 53
    .line 54
    add-int/2addr p1, v1

    .line 55
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 56
    .line 57
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 58
    .line 59
    array-length v0, p2

    .line 60
    if-lt p1, v0, :cond_d

    .line 61
    .line 62
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 63
    .line 64
    array-length p1, p2

    .line 65
    sub-int/2addr p1, v1

    .line 66
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    move v4, v2

    .line 70
    move v5, v3

    .line 71
    :goto_0
    if-eq v0, v3, :cond_4

    .line 72
    .line 73
    iget v6, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 74
    .line 75
    if-ge v4, v6, :cond_4

    .line 76
    .line 77
    iget-object v6, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 78
    .line 79
    aget v6, v6, v0

    .line 80
    .line 81
    iget v7, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 82
    .line 83
    if-ne v6, v7, :cond_2

    .line 84
    .line 85
    iget-object p0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 86
    .line 87
    aput p2, p0, v0

    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    if-ge v6, v7, :cond_3

    .line 91
    .line 92
    move v5, v0

    .line 93
    :cond_3
    iget-object v6, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 94
    .line 95
    aget v0, v6, v0

    .line 96
    .line 97
    add-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    iget v0, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 101
    .line 102
    add-int/lit8 v4, v0, 0x1

    .line 103
    .line 104
    iget-boolean v6, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 105
    .line 106
    if-eqz v6, :cond_6

    .line 107
    .line 108
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 109
    .line 110
    aget v6, v4, v0

    .line 111
    .line 112
    if-ne v6, v3, :cond_5

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_5
    array-length v0, v4

    .line 116
    goto :goto_1

    .line 117
    :cond_6
    move v0, v4

    .line 118
    :goto_1
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 119
    .line 120
    array-length v6, v4

    .line 121
    if-lt v0, v6, :cond_8

    .line 122
    .line 123
    iget v6, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 124
    .line 125
    array-length v4, v4

    .line 126
    if-ge v6, v4, :cond_8

    .line 127
    .line 128
    move v4, v2

    .line 129
    :goto_2
    iget-object v6, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 130
    .line 131
    array-length v7, v6

    .line 132
    if-ge v4, v7, :cond_8

    .line 133
    .line 134
    aget v6, v6, v4

    .line 135
    .line 136
    if-ne v6, v3, :cond_7

    .line 137
    .line 138
    move v0, v4

    .line 139
    goto :goto_3

    .line 140
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_8
    :goto_3
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 144
    .line 145
    array-length v6, v4

    .line 146
    if-lt v0, v6, :cond_9

    .line 147
    .line 148
    array-length v0, v4

    .line 149
    iget v4, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 150
    .line 151
    mul-int/lit8 v4, v4, 0x2

    .line 152
    .line 153
    iput v4, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 154
    .line 155
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 156
    .line 157
    add-int/lit8 v2, v0, -0x1

    .line 158
    .line 159
    iput v2, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 160
    .line 161
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 162
    .line 163
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 168
    .line 169
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 170
    .line 171
    iget v4, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 172
    .line 173
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 178
    .line 179
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 180
    .line 181
    iget v4, p0, Landroidx/constraintlayout/solver/a;->d:I

    .line 182
    .line 183
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    iput-object v2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 188
    .line 189
    :cond_9
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 190
    .line 191
    iget v4, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 192
    .line 193
    aput v4, v2, v0

    .line 194
    .line 195
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 196
    .line 197
    aput p2, v2, v0

    .line 198
    .line 199
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 200
    .line 201
    if-eq v5, v3, :cond_a

    .line 202
    .line 203
    aget v2, p2, v5

    .line 204
    .line 205
    aput v2, p2, v0

    .line 206
    .line 207
    aput v0, p2, v5

    .line 208
    .line 209
    goto :goto_4

    .line 210
    :cond_a
    iget v2, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 211
    .line 212
    aput v2, p2, v0

    .line 213
    .line 214
    iput v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 215
    .line 216
    :goto_4
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 217
    .line 218
    add-int/2addr p2, v1

    .line 219
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 220
    .line 221
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 222
    .line 223
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->a(Landroidx/constraintlayout/solver/b;)V

    .line 224
    .line 225
    .line 226
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 227
    .line 228
    add-int/2addr p1, v1

    .line 229
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 230
    .line 231
    iget-boolean p2, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 232
    .line 233
    if-nez p2, :cond_b

    .line 234
    .line 235
    iget p2, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 236
    .line 237
    add-int/2addr p2, v1

    .line 238
    iput p2, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 239
    .line 240
    :cond_b
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 241
    .line 242
    array-length v0, p2

    .line 243
    if-lt p1, v0, :cond_c

    .line 244
    .line 245
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 246
    .line 247
    :cond_c
    iget p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 248
    .line 249
    array-length v0, p2

    .line 250
    if-lt p1, v0, :cond_d

    .line 251
    .line 252
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 253
    .line 254
    array-length p1, p2

    .line 255
    sub-int/2addr p1, v1

    .line 256
    iput p1, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 257
    .line 258
    :cond_d
    return-void
.end method

.method public final m(Landroidx/constraintlayout/solver/SolverVariable;Z)F
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/a;->e:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Landroidx/constraintlayout/solver/a;->e:Landroidx/constraintlayout/solver/SolverVariable;

    .line 7
    .line 8
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, -0x1

    .line 12
    if-ne v0, v2, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    const/4 v3, 0x0

    .line 16
    move v4, v2

    .line 17
    :goto_0
    if-eq v0, v2, :cond_6

    .line 18
    .line 19
    iget v5, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 20
    .line 21
    if-ge v3, v5, :cond_6

    .line 22
    .line 23
    iget-object v5, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 24
    .line 25
    aget v5, v5, v0

    .line 26
    .line 27
    iget v6, p1, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 28
    .line 29
    if-ne v5, v6, :cond_5

    .line 30
    .line 31
    iget v1, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 32
    .line 33
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 34
    .line 35
    if-ne v0, v1, :cond_2

    .line 36
    .line 37
    aget v1, v3, v0

    .line 38
    .line 39
    iput v1, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    aget v1, v3, v0

    .line 43
    .line 44
    aput v1, v3, v4

    .line 45
    .line 46
    :goto_1
    if-eqz p2, :cond_3

    .line 47
    .line 48
    iget-object p2, p0, Landroidx/constraintlayout/solver/a;->b:Landroidx/constraintlayout/solver/b;

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 54
    .line 55
    add-int/lit8 p2, p2, -0x1

    .line 56
    .line 57
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 58
    .line 59
    iget p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 60
    .line 61
    add-int/lit8 p1, p1, -0x1

    .line 62
    .line 63
    iput p1, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 64
    .line 65
    iget-object p1, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 66
    .line 67
    aput v2, p1, v0

    .line 68
    .line 69
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/a;->k:Z

    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    iput v0, p0, Landroidx/constraintlayout/solver/a;->j:I

    .line 74
    .line 75
    :cond_4
    iget-object p0, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 76
    .line 77
    aget p0, p0, v0

    .line 78
    .line 79
    return p0

    .line 80
    :cond_5
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 81
    .line 82
    aget v4, v4, v0

    .line 83
    .line 84
    add-int/lit8 v3, v3, 0x1

    .line 85
    .line 86
    move v7, v4

    .line 87
    move v4, v0

    .line 88
    move v0, v7

    .line 89
    goto :goto_0

    .line 90
    :cond_6
    return v1
.end method

.method public final n(Landroidx/constraintlayout/solver/b;Landroidx/constraintlayout/solver/b;Z)V
    .locals 8

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    move v2, v1

    .line 5
    :goto_1
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_3

    .line 7
    .line 8
    iget v4, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 9
    .line 10
    if-ge v2, v4, :cond_3

    .line 11
    .line 12
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 13
    .line 14
    aget v4, v4, v0

    .line 15
    .line 16
    iget-object v5, p2, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 17
    .line 18
    iget v6, v5, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 19
    .line 20
    if-ne v4, v6, :cond_2

    .line 21
    .line 22
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 23
    .line 24
    aget v0, v2, v0

    .line 25
    .line 26
    invoke-virtual {p0, v5, p3}, Landroidx/constraintlayout/solver/a;->m(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    .line 27
    .line 28
    .line 29
    iget-object v2, p2, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 30
    .line 31
    iget v4, v2, Landroidx/constraintlayout/solver/a;->i:I

    .line 32
    .line 33
    move v5, v1

    .line 34
    :goto_2
    if-eq v4, v3, :cond_0

    .line 35
    .line 36
    iget v6, v2, Landroidx/constraintlayout/solver/a;->a:I

    .line 37
    .line 38
    if-ge v5, v6, :cond_0

    .line 39
    .line 40
    iget-object v6, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 41
    .line 42
    iget-object v6, v6, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 43
    .line 44
    iget-object v7, v2, Landroidx/constraintlayout/solver/a;->f:[I

    .line 45
    .line 46
    aget v7, v7, v4

    .line 47
    .line 48
    aget-object v6, v6, v7

    .line 49
    .line 50
    iget-object v7, v2, Landroidx/constraintlayout/solver/a;->h:[F

    .line 51
    .line 52
    aget v7, v7, v4

    .line 53
    .line 54
    mul-float/2addr v7, v0

    .line 55
    invoke-virtual {p0, v6, v7, p3}, Landroidx/constraintlayout/solver/a;->a(Landroidx/constraintlayout/solver/SolverVariable;FZ)V

    .line 56
    .line 57
    .line 58
    iget-object v6, v2, Landroidx/constraintlayout/solver/a;->g:[I

    .line 59
    .line 60
    aget v4, v6, v4

    .line 61
    .line 62
    add-int/lit8 v5, v5, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_0
    iget v2, p1, Landroidx/constraintlayout/solver/b;->b:F

    .line 66
    .line 67
    iget v3, p2, Landroidx/constraintlayout/solver/b;->b:F

    .line 68
    .line 69
    mul-float/2addr v3, v0

    .line 70
    add-float/2addr v2, v3

    .line 71
    iput v2, p1, Landroidx/constraintlayout/solver/b;->b:F

    .line 72
    .line 73
    if-eqz p3, :cond_1

    .line 74
    .line 75
    iget-object v0, p2, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 84
    .line 85
    aget v0, v3, v0

    .line 86
    .line 87
    add-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    return-void
.end method

.method public o(Landroidx/constraintlayout/solver/b;[Landroidx/constraintlayout/solver/b;)V
    .locals 10

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    move v2, v1

    .line 5
    :goto_1
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_2

    .line 7
    .line 8
    iget v4, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 9
    .line 10
    if-ge v2, v4, :cond_2

    .line 11
    .line 12
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 13
    .line 14
    iget-object v4, v4, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 15
    .line 16
    iget-object v5, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 17
    .line 18
    aget v5, v5, v0

    .line 19
    .line 20
    aget-object v4, v4, v5

    .line 21
    .line 22
    iget v5, v4, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 23
    .line 24
    if-eq v5, v3, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 27
    .line 28
    aget v0, v2, v0

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {p0, v4, v2}, Landroidx/constraintlayout/solver/a;->m(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    .line 32
    .line 33
    .line 34
    iget v4, v4, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 35
    .line 36
    aget-object v4, p2, v4

    .line 37
    .line 38
    iget-boolean v5, v4, Landroidx/constraintlayout/solver/b;->e:Z

    .line 39
    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    iget-object v5, v4, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 43
    .line 44
    iget v6, v5, Landroidx/constraintlayout/solver/a;->i:I

    .line 45
    .line 46
    move v7, v1

    .line 47
    :goto_2
    if-eq v6, v3, :cond_0

    .line 48
    .line 49
    iget v8, v5, Landroidx/constraintlayout/solver/a;->a:I

    .line 50
    .line 51
    if-ge v7, v8, :cond_0

    .line 52
    .line 53
    iget-object v8, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 54
    .line 55
    iget-object v8, v8, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 56
    .line 57
    iget-object v9, v5, Landroidx/constraintlayout/solver/a;->f:[I

    .line 58
    .line 59
    aget v9, v9, v6

    .line 60
    .line 61
    aget-object v8, v8, v9

    .line 62
    .line 63
    iget-object v9, v5, Landroidx/constraintlayout/solver/a;->h:[F

    .line 64
    .line 65
    aget v9, v9, v6

    .line 66
    .line 67
    mul-float/2addr v9, v0

    .line 68
    invoke-virtual {p0, v8, v9, v2}, Landroidx/constraintlayout/solver/a;->a(Landroidx/constraintlayout/solver/SolverVariable;FZ)V

    .line 69
    .line 70
    .line 71
    iget-object v8, v5, Landroidx/constraintlayout/solver/a;->g:[I

    .line 72
    .line 73
    aget v6, v8, v6

    .line 74
    .line 75
    add-int/lit8 v7, v7, 0x1

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_0
    iget v2, p1, Landroidx/constraintlayout/solver/b;->b:F

    .line 79
    .line 80
    iget v3, v4, Landroidx/constraintlayout/solver/b;->b:F

    .line 81
    .line 82
    mul-float/2addr v3, v0

    .line 83
    add-float/2addr v2, v3

    .line 84
    iput v2, p1, Landroidx/constraintlayout/solver/b;->b:F

    .line 85
    .line 86
    iget-object v0, v4, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 87
    .line 88
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/SolverVariable;->c(Landroidx/constraintlayout/solver/b;)V

    .line 89
    .line 90
    .line 91
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 95
    .line 96
    aget v0, v3, v0

    .line 97
    .line 98
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/a;->i:I

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    const/4 v3, -0x1

    .line 7
    if-eq v0, v3, :cond_0

    .line 8
    .line 9
    iget v3, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 10
    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    const-string v3, " -> "

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Landroidx/constraintlayout/solver/a;->h:[F

    .line 28
    .line 29
    aget v1, v1, v0

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, " : "

    .line 35
    .line 36
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Landroidx/constraintlayout/solver/a;->c:Ll/wx3;

    .line 52
    .line 53
    iget-object v1, v1, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 54
    .line 55
    iget-object v4, p0, Landroidx/constraintlayout/solver/a;->f:[I

    .line 56
    .line 57
    aget v4, v4, v0

    .line 58
    .line 59
    aget-object v1, v1, v4

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v3, p0, Landroidx/constraintlayout/solver/a;->g:[I

    .line 69
    .line 70
    aget v0, v3, v0

    .line 71
    .line 72
    add-int/lit8 v2, v2, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    return-object v1
.end method
