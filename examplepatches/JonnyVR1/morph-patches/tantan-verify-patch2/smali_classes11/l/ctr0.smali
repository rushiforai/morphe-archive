.class public final Ll/ctr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aer0;


# instance fields
.field public final a:Ll/nnw0;

.field public final b:Ll/bgw0;


# direct methods
.method public synthetic constructor <init>(Ll/nnw0;Ll/btr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ctr0;->a:Ll/nnw0;

    .line 5
    .line 6
    new-instance p1, Ll/bgw0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ctr0;->b:Ll/bgw0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;J)Ll/zdr0;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Ll/qer0;->zzf()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-interface/range {p1 .. p1}, Ll/qer0;->zzd()J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    sub-long/2addr v3, v1

    .line 12
    const-wide/16 v5, 0x4e20

    .line 13
    .line 14
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    long-to-int v3, v3

    .line 19
    iget-object v4, v0, Ll/ctr0;->b:Ll/bgw0;

    .line 20
    .line 21
    invoke-virtual {v4, v3}, Ll/bgw0;->h(I)V

    .line 22
    .line 23
    .line 24
    iget-object v4, v0, Ll/ctr0;->b:Ll/bgw0;

    .line 25
    .line 26
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    move-object/from16 v5, p1

    .line 31
    .line 32
    check-cast v5, Ll/fer0;

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    invoke-virtual {v5, v4, v6, v3, v6}, Ll/fer0;->c([BIIZ)Z

    .line 36
    .line 37
    .line 38
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    const/4 v5, -0x1

    .line 44
    move-wide v7, v3

    .line 45
    move v6, v5

    .line 46
    :goto_0
    iget-object v9, v0, Ll/ctr0;->b:Ll/bgw0;

    .line 47
    .line 48
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    const/4 v11, 0x4

    .line 53
    if-lt v10, v11, :cond_c

    .line 54
    .line 55
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 60
    .line 61
    .line 62
    move-result v12

    .line 63
    invoke-static {v10, v12}, Ll/dtr0;->h([BI)I

    .line 64
    .line 65
    .line 66
    move-result v10

    .line 67
    const/4 v12, 0x1

    .line 68
    const/16 v13, 0x1ba

    .line 69
    .line 70
    if-eq v10, v13, :cond_0

    .line 71
    .line 72
    invoke-virtual {v9, v12}, Ll/bgw0;->l(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {v9, v11}, Ll/bgw0;->l(I)V

    .line 77
    .line 78
    .line 79
    invoke-static {v9}, Ll/etr0;->c(Ll/bgw0;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v14

    .line 83
    cmp-long v5, v14, v3

    .line 84
    .line 85
    if-eqz v5, :cond_4

    .line 86
    .line 87
    iget-object v5, v0, Ll/ctr0;->a:Ll/nnw0;

    .line 88
    .line 89
    invoke-virtual {v5, v14, v15}, Ll/nnw0;->b(J)J

    .line 90
    .line 91
    .line 92
    move-result-wide v14

    .line 93
    cmp-long v5, v14, p2

    .line 94
    .line 95
    if-lez v5, :cond_2

    .line 96
    .line 97
    cmp-long v0, v7, v3

    .line 98
    .line 99
    if-nez v0, :cond_1

    .line 100
    .line 101
    invoke-static {v14, v15, v1, v2}, Ll/zdr0;->d(JJ)Ll/zdr0;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    return-object v0

    .line 106
    :cond_1
    int-to-long v3, v6

    .line 107
    add-long/2addr v1, v3

    .line 108
    invoke-static {v1, v2}, Ll/zdr0;->e(J)Ll/zdr0;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    return-object v0

    .line 113
    :cond_2
    const-wide/32 v5, 0x186a0

    .line 114
    .line 115
    .line 116
    add-long/2addr v5, v14

    .line 117
    cmp-long v5, v5, p2

    .line 118
    .line 119
    if-lez v5, :cond_3

    .line 120
    .line 121
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    int-to-long v3, v0

    .line 126
    add-long/2addr v1, v3

    .line 127
    invoke-static {v1, v2}, Ll/zdr0;->e(J)Ll/zdr0;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    return-object v0

    .line 132
    :cond_3
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    move v6, v5

    .line 137
    move-wide v7, v14

    .line 138
    :cond_4
    invoke-virtual {v9}, Ll/bgw0;->t()I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 143
    .line 144
    .line 145
    move-result v10

    .line 146
    const/16 v14, 0xa

    .line 147
    .line 148
    if-ge v10, v14, :cond_5

    .line 149
    .line 150
    invoke-virtual {v9, v5}, Ll/bgw0;->k(I)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_2

    .line 154
    .line 155
    :cond_5
    const/16 v10, 0x9

    .line 156
    .line 157
    invoke-virtual {v9, v10}, Ll/bgw0;->l(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v9}, Ll/bgw0;->B()I

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    and-int/lit8 v10, v10, 0x7

    .line 165
    .line 166
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 167
    .line 168
    .line 169
    move-result v14

    .line 170
    if-ge v14, v10, :cond_6

    .line 171
    .line 172
    invoke-virtual {v9, v5}, Ll/bgw0;->k(I)V

    .line 173
    .line 174
    .line 175
    goto/16 :goto_2

    .line 176
    .line 177
    :cond_6
    invoke-virtual {v9, v10}, Ll/bgw0;->l(I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 181
    .line 182
    .line 183
    move-result v10

    .line 184
    if-ge v10, v11, :cond_7

    .line 185
    .line 186
    invoke-virtual {v9, v5}, Ll/bgw0;->k(I)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_7
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 191
    .line 192
    .line 193
    move-result-object v10

    .line 194
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 195
    .line 196
    .line 197
    move-result v14

    .line 198
    invoke-static {v10, v14}, Ll/dtr0;->h([BI)I

    .line 199
    .line 200
    .line 201
    move-result v10

    .line 202
    const/16 v14, 0x1bb

    .line 203
    .line 204
    if-eq v10, v14, :cond_8

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_8
    invoke-virtual {v9, v11}, Ll/bgw0;->l(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v9}, Ll/bgw0;->F()I

    .line 211
    .line 212
    .line 213
    move-result v10

    .line 214
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 215
    .line 216
    .line 217
    move-result v14

    .line 218
    if-ge v14, v10, :cond_9

    .line 219
    .line 220
    invoke-virtual {v9, v5}, Ll/bgw0;->k(I)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_9
    invoke-virtual {v9, v10}, Ll/bgw0;->l(I)V

    .line 225
    .line 226
    .line 227
    :goto_1
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 228
    .line 229
    .line 230
    move-result v10

    .line 231
    if-lt v10, v11, :cond_b

    .line 232
    .line 233
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 234
    .line 235
    .line 236
    move-result-object v10

    .line 237
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 238
    .line 239
    .line 240
    move-result v14

    .line 241
    invoke-static {v10, v14}, Ll/dtr0;->h([BI)I

    .line 242
    .line 243
    .line 244
    move-result v10

    .line 245
    if-eq v10, v13, :cond_b

    .line 246
    .line 247
    const/16 v14, 0x1b9

    .line 248
    .line 249
    if-eq v10, v14, :cond_b

    .line 250
    .line 251
    ushr-int/lit8 v10, v10, 0x8

    .line 252
    .line 253
    if-ne v10, v12, :cond_b

    .line 254
    .line 255
    invoke-virtual {v9, v11}, Ll/bgw0;->l(I)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 259
    .line 260
    .line 261
    move-result v10

    .line 262
    const/4 v14, 0x2

    .line 263
    if-ge v10, v14, :cond_a

    .line 264
    .line 265
    invoke-virtual {v9, v5}, Ll/bgw0;->k(I)V

    .line 266
    .line 267
    .line 268
    goto :goto_2

    .line 269
    :cond_a
    invoke-virtual {v9}, Ll/bgw0;->F()I

    .line 270
    .line 271
    .line 272
    move-result v10

    .line 273
    invoke-virtual {v9}, Ll/bgw0;->t()I

    .line 274
    .line 275
    .line 276
    move-result v14

    .line 277
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 278
    .line 279
    .line 280
    move-result v15

    .line 281
    add-int/2addr v15, v10

    .line 282
    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    .line 283
    .line 284
    .line 285
    move-result v10

    .line 286
    invoke-virtual {v9, v10}, Ll/bgw0;->k(I)V

    .line 287
    .line 288
    .line 289
    goto :goto_1

    .line 290
    :cond_b
    :goto_2
    invoke-virtual {v9}, Ll/bgw0;->s()I

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :cond_c
    cmp-long v0, v7, v3

    .line 297
    .line 298
    if-eqz v0, :cond_d

    .line 299
    .line 300
    int-to-long v3, v5

    .line 301
    add-long/2addr v1, v3

    .line 302
    invoke-static {v7, v8, v1, v2}, Ll/zdr0;->f(JJ)Ll/zdr0;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    return-object v0

    .line 307
    :cond_d
    sget-object v0, Ll/zdr0;->d:Ll/zdr0;

    .line 308
    .line 309
    return-object v0
.end method

.method public final zzb()V
    .locals 2

    .line 1
    sget-object v0, Ll/mpw0;->f:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object p0, p0, Ll/ctr0;->b:Ll/bgw0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/bgw0;->i([BI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
