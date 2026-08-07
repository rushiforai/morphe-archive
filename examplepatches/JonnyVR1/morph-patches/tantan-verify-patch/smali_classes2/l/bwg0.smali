.class public final Ll/bwg0;
.super Ll/mng0;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:I

.field public final c:Ll/uqg0;

.field public final d:Ll/uqg0;

.field public e:I

.field public f:[B

.field public g:I

.field public final synthetic h:Ll/kgg0;


# direct methods
.method public constructor <init>(Ll/kgg0;I[I[I)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/bwg0;->h:Ll/kgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/mng0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/bwg0;->a:Z

    .line 8
    .line 9
    iput p1, p0, Ll/bwg0;->e:I

    .line 10
    .line 11
    new-array v0, p1, [B

    .line 12
    .line 13
    iput-object v0, p0, Ll/bwg0;->f:[B

    .line 14
    .line 15
    iput p1, p0, Ll/bwg0;->g:I

    .line 16
    .line 17
    iput p2, p0, Ll/bwg0;->b:I

    .line 18
    .line 19
    invoke-static {p3}, Ll/kgg0;->e([I)Ll/uqg0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/bwg0;->c:Ll/uqg0;

    .line 24
    .line 25
    invoke-static {p4}, Ll/kgg0;->e([I)Ll/uqg0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/bwg0;->d:Ll/uqg0;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/bwg0;->g:I

    .line 2
    .line 3
    iget p0, p0, Ll/bwg0;->e:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final b([BII)I
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    return v4

    .line 13
    :cond_0
    iget-boolean v5, v0, Ll/bwg0;->a:Z

    .line 14
    .line 15
    if-eqz v5, :cond_1

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    return v0

    .line 19
    :cond_1
    iget v5, v0, Ll/bwg0;->g:I

    .line 20
    .line 21
    iget v6, v0, Ll/bwg0;->e:I

    .line 22
    .line 23
    sub-int/2addr v5, v6

    .line 24
    if-lez v5, :cond_2

    .line 25
    .line 26
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    iget-object v6, v0, Ll/bwg0;->f:[B

    .line 31
    .line 32
    iget v7, v0, Ll/bwg0;->e:I

    .line 33
    .line 34
    invoke-static {v6, v7, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    iget v6, v0, Ll/bwg0;->e:I

    .line 38
    .line 39
    add-int/2addr v6, v5

    .line 40
    iput v6, v0, Ll/bwg0;->e:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move v5, v4

    .line 44
    :goto_0
    if-ge v5, v3, :cond_e

    .line 45
    .line 46
    iget-object v6, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 47
    .line 48
    iget-object v6, v6, Ll/kgg0;->c:Ll/drg0;

    .line 49
    .line 50
    iget-object v7, v0, Ll/bwg0;->c:Ll/uqg0;

    .line 51
    .line 52
    invoke-static {v6, v7}, Ll/kgg0;->b(Ll/drg0;Ll/uqg0;)I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    const/16 v7, 0x100

    .line 57
    .line 58
    const v8, 0xffff

    .line 59
    .line 60
    .line 61
    const/4 v9, 0x1

    .line 62
    if-ge v6, v7, :cond_4

    .line 63
    .line 64
    add-int/lit8 v7, v5, 0x1

    .line 65
    .line 66
    add-int/2addr v5, v2

    .line 67
    iget-object v10, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 68
    .line 69
    iget-object v10, v10, Ll/kgg0;->e:Ll/ptg0;

    .line 70
    .line 71
    int-to-byte v6, v6

    .line 72
    iget-object v11, v10, Ll/ptg0;->a:[B

    .line 73
    .line 74
    iget v12, v10, Ll/ptg0;->b:I

    .line 75
    .line 76
    aput-byte v6, v11, v12

    .line 77
    .line 78
    add-int/lit8 v11, v12, 0x1

    .line 79
    .line 80
    and-int/2addr v8, v11

    .line 81
    iget-boolean v11, v10, Ll/ptg0;->c:Z

    .line 82
    .line 83
    if-nez v11, :cond_3

    .line 84
    .line 85
    if-ge v8, v12, :cond_3

    .line 86
    .line 87
    iput-boolean v9, v10, Ll/ptg0;->c:Z

    .line 88
    .line 89
    :cond_3
    iput v8, v10, Ll/ptg0;->b:I

    .line 90
    .line 91
    aput-byte v6, v1, v5

    .line 92
    .line 93
    move v5, v7

    .line 94
    goto :goto_0

    .line 95
    :cond_4
    if-le v6, v7, :cond_d

    .line 96
    .line 97
    sget-object v7, Ll/kgg0;->f:[S

    .line 98
    .line 99
    add-int/lit16 v6, v6, -0x101

    .line 100
    .line 101
    aget-short v6, v7, v6

    .line 102
    .line 103
    ushr-int/lit8 v7, v6, 0x5

    .line 104
    .line 105
    and-int/lit8 v6, v6, 0x1f

    .line 106
    .line 107
    int-to-long v10, v7

    .line 108
    iget-object v7, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 109
    .line 110
    iget-object v7, v7, Ll/kgg0;->c:Ll/drg0;

    .line 111
    .line 112
    invoke-static {v7, v6}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 113
    .line 114
    .line 115
    move-result-wide v6

    .line 116
    add-long/2addr v6, v10

    .line 117
    long-to-int v6, v6

    .line 118
    iget-object v7, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 119
    .line 120
    iget-object v7, v7, Ll/kgg0;->c:Ll/drg0;

    .line 121
    .line 122
    iget-object v10, v0, Ll/bwg0;->d:Ll/uqg0;

    .line 123
    .line 124
    invoke-static {v7, v10}, Ll/kgg0;->b(Ll/drg0;Ll/uqg0;)I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    sget-object v10, Ll/kgg0;->g:[I

    .line 129
    .line 130
    aget v7, v10, v7

    .line 131
    .line 132
    ushr-int/lit8 v10, v7, 0x4

    .line 133
    .line 134
    and-int/lit8 v7, v7, 0xf

    .line 135
    .line 136
    int-to-long v10, v10

    .line 137
    iget-object v12, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 138
    .line 139
    iget-object v12, v12, Ll/kgg0;->c:Ll/drg0;

    .line 140
    .line 141
    invoke-static {v12, v7}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 142
    .line 143
    .line 144
    move-result-wide v12

    .line 145
    add-long/2addr v12, v10

    .line 146
    long-to-int v7, v12

    .line 147
    iget-object v10, v0, Ll/bwg0;->f:[B

    .line 148
    .line 149
    array-length v10, v10

    .line 150
    if-ge v10, v6, :cond_5

    .line 151
    .line 152
    new-array v10, v6, [B

    .line 153
    .line 154
    iput-object v10, v0, Ll/bwg0;->f:[B

    .line 155
    .line 156
    :cond_5
    iput v6, v0, Ll/bwg0;->g:I

    .line 157
    .line 158
    iput v4, v0, Ll/bwg0;->e:I

    .line 159
    .line 160
    iget-object v10, v0, Ll/bwg0;->h:Ll/kgg0;

    .line 161
    .line 162
    iget-object v10, v10, Ll/kgg0;->e:Ll/ptg0;

    .line 163
    .line 164
    iget-object v11, v0, Ll/bwg0;->f:[B

    .line 165
    .line 166
    iget-object v12, v10, Ll/ptg0;->a:[B

    .line 167
    .line 168
    array-length v12, v12

    .line 169
    if-gt v7, v12, :cond_c

    .line 170
    .line 171
    iget v12, v10, Ll/ptg0;->b:I

    .line 172
    .line 173
    sub-int v13, v12, v7

    .line 174
    .line 175
    and-int/2addr v13, v8

    .line 176
    iget-boolean v14, v10, Ll/ptg0;->c:Z

    .line 177
    .line 178
    if-nez v14, :cond_7

    .line 179
    .line 180
    if-ge v13, v12, :cond_6

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_6
    const-string v0, "Attempt to read beyond memory: dist="

    .line 184
    .line 185
    invoke-static {v7, v0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return v4

    .line 193
    :cond_7
    :goto_1
    move v7, v4

    .line 194
    :goto_2
    if-ge v7, v6, :cond_a

    .line 195
    .line 196
    iget-object v12, v10, Ll/ptg0;->a:[B

    .line 197
    .line 198
    aget-byte v14, v12, v13

    .line 199
    .line 200
    iget v15, v10, Ll/ptg0;->b:I

    .line 201
    .line 202
    aput-byte v14, v12, v15

    .line 203
    .line 204
    add-int/lit8 v12, v15, 0x1

    .line 205
    .line 206
    and-int/2addr v12, v8

    .line 207
    move/from16 v16, v4

    .line 208
    .line 209
    iget-boolean v4, v10, Ll/ptg0;->c:Z

    .line 210
    .line 211
    if-nez v4, :cond_8

    .line 212
    .line 213
    if-ge v12, v15, :cond_8

    .line 214
    .line 215
    iput-boolean v9, v10, Ll/ptg0;->c:Z

    .line 216
    .line 217
    :cond_8
    iput v12, v10, Ll/ptg0;->b:I

    .line 218
    .line 219
    aput-byte v14, v11, v7

    .line 220
    .line 221
    add-int/lit8 v7, v7, 0x1

    .line 222
    .line 223
    add-int/lit8 v4, v13, 0x1

    .line 224
    .line 225
    and-int/2addr v4, v8

    .line 226
    iget-boolean v12, v10, Ll/ptg0;->c:Z

    .line 227
    .line 228
    if-nez v12, :cond_9

    .line 229
    .line 230
    if-ge v4, v13, :cond_9

    .line 231
    .line 232
    iput-boolean v9, v10, Ll/ptg0;->c:Z

    .line 233
    .line 234
    :cond_9
    move v13, v4

    .line 235
    move/from16 v4, v16

    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_a
    move/from16 v16, v4

    .line 239
    .line 240
    add-int v4, v2, v5

    .line 241
    .line 242
    sub-int v6, v3, v5

    .line 243
    .line 244
    iget v7, v0, Ll/bwg0;->g:I

    .line 245
    .line 246
    iget v8, v0, Ll/bwg0;->e:I

    .line 247
    .line 248
    sub-int/2addr v7, v8

    .line 249
    if-lez v7, :cond_b

    .line 250
    .line 251
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    iget-object v7, v0, Ll/bwg0;->f:[B

    .line 256
    .line 257
    iget v8, v0, Ll/bwg0;->e:I

    .line 258
    .line 259
    invoke-static {v7, v8, v1, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    .line 261
    .line 262
    iget v4, v0, Ll/bwg0;->e:I

    .line 263
    .line 264
    add-int/2addr v4, v6

    .line 265
    iput v4, v0, Ll/bwg0;->e:I

    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_b
    move/from16 v6, v16

    .line 269
    .line 270
    :goto_3
    add-int/2addr v5, v6

    .line 271
    move/from16 v4, v16

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :cond_c
    move/from16 v16, v4

    .line 276
    .line 277
    const-string v0, "Illegal distance parameter: "

    .line 278
    .line 279
    invoke-static {v7, v0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    return v16

    .line 287
    :cond_d
    iput-boolean v9, v0, Ll/bwg0;->a:Z

    .line 288
    .line 289
    :cond_e
    return v5
.end method

.method public final c()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bwg0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Ll/bwg0;->b:I

    .line 8
    .line 9
    return p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwg0;->a:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method
