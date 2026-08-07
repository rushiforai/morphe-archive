.class public final Ll/gnr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x1d

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/gnr0;->a:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x69736f6d
        0x69736f32
        0x69736f33
        0x69736f34
        0x69736f35
        0x69736f36
        0x69736f39
        0x61766331
        0x68766331
        0x68657631
        0x61763031
        0x6d703431
        0x6d703432
        0x33673261
        0x33673262
        0x33677236
        0x33677336
        0x33676536
        0x33676736
        0x4d345620    # 1.8909645E8f
        0x4d344120    # 1.8901043E8f
        0x66347620
        0x6b646469
        0x4d345650
        0x71742020
        0x4d534e56    # 2.215704E8f
        0x64627931
        0x69736d6c
        0x70696666
    .end array-data
.end method

.method public static a(Ll/qer0;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, v0, v1}, Ll/gnr0;->c(Ll/qer0;ZZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static b(Ll/qer0;Z)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0, p1}, Ll/gnr0;->c(Ll/qer0;ZZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static c(Ll/qer0;ZZ)Z
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qer0;->zzd()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    const-wide/16 v3, -0x1

    .line 8
    .line 9
    cmp-long v5, v1, v3

    .line 10
    .line 11
    const-wide/16 v6, 0x1000

    .line 12
    .line 13
    if-eqz v5, :cond_1

    .line 14
    .line 15
    cmp-long v8, v1, v6

    .line 16
    .line 17
    if-lez v8, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-wide v6, v1

    .line 21
    :cond_1
    :goto_0
    new-instance v8, Ll/bgw0;

    .line 22
    .line 23
    const/16 v9, 0x40

    .line 24
    .line 25
    invoke-direct {v8, v9}, Ll/bgw0;-><init>(I)V

    .line 26
    .line 27
    .line 28
    long-to-int v6, v6

    .line 29
    const/4 v7, 0x0

    .line 30
    move v9, v7

    .line 31
    move v10, v9

    .line 32
    :goto_1
    const/4 v11, 0x1

    .line 33
    if-ge v9, v6, :cond_17

    .line 34
    .line 35
    const/16 v12, 0x8

    .line 36
    .line 37
    invoke-virtual {v8, v12}, Ll/bgw0;->h(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v8}, Ll/bgw0;->m()[B

    .line 41
    .line 42
    .line 43
    move-result-object v13

    .line 44
    invoke-interface {v0, v13, v7, v12, v11}, Ll/qer0;->c([BIIZ)Z

    .line 45
    .line 46
    .line 47
    move-result v13

    .line 48
    if-nez v13, :cond_2

    .line 49
    .line 50
    goto/16 :goto_a

    .line 51
    .line 52
    :cond_2
    invoke-virtual {v8}, Ll/bgw0;->J()J

    .line 53
    .line 54
    .line 55
    move-result-wide v13

    .line 56
    invoke-virtual {v8}, Ll/bgw0;->v()I

    .line 57
    .line 58
    .line 59
    move-result v15

    .line 60
    const-wide/16 v16, 0x1

    .line 61
    .line 62
    cmp-long v16, v13, v16

    .line 63
    .line 64
    if-nez v16, :cond_3

    .line 65
    .line 66
    invoke-virtual {v8}, Ll/bgw0;->m()[B

    .line 67
    .line 68
    .line 69
    move-result-object v13

    .line 70
    invoke-interface {v0, v13, v12, v12}, Ll/qer0;->i([BII)V

    .line 71
    .line 72
    .line 73
    const/16 v13, 0x10

    .line 74
    .line 75
    invoke-virtual {v8, v13}, Ll/bgw0;->j(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v8}, Ll/bgw0;->I()J

    .line 79
    .line 80
    .line 81
    move-result-wide v16

    .line 82
    move/from16 v18, v7

    .line 83
    .line 84
    move-object v14, v8

    .line 85
    move-wide/from16 v3, v16

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    const-wide/16 v16, 0x0

    .line 89
    .line 90
    cmp-long v16, v13, v16

    .line 91
    .line 92
    if-nez v16, :cond_4

    .line 93
    .line 94
    invoke-interface {v0}, Ll/qer0;->zzd()J

    .line 95
    .line 96
    .line 97
    move-result-wide v16

    .line 98
    cmp-long v18, v16, v3

    .line 99
    .line 100
    if-eqz v18, :cond_4

    .line 101
    .line 102
    invoke-interface {v0}, Ll/qer0;->zze()J

    .line 103
    .line 104
    .line 105
    move-result-wide v13

    .line 106
    sub-long v16, v16, v13

    .line 107
    .line 108
    const-wide/16 v13, 0x8

    .line 109
    .line 110
    add-long v13, v16, v13

    .line 111
    .line 112
    :cond_4
    move/from16 v18, v7

    .line 113
    .line 114
    move-wide v3, v13

    .line 115
    move-object v14, v8

    .line 116
    move v13, v12

    .line 117
    :goto_2
    int-to-long v7, v13

    .line 118
    cmp-long v19, v3, v7

    .line 119
    .line 120
    if-gez v19, :cond_5

    .line 121
    .line 122
    return v18

    .line 123
    :cond_5
    add-int/2addr v9, v13

    .line 124
    const v13, 0x6d6f6f76

    .line 125
    .line 126
    .line 127
    if-ne v15, v13, :cond_7

    .line 128
    .line 129
    long-to-int v3, v3

    .line 130
    add-int/2addr v6, v3

    .line 131
    if-eqz v5, :cond_6

    .line 132
    .line 133
    int-to-long v3, v6

    .line 134
    cmp-long v3, v3, v1

    .line 135
    .line 136
    if-lez v3, :cond_6

    .line 137
    .line 138
    long-to-int v6, v1

    .line 139
    :cond_6
    move-object v8, v14

    .line 140
    move/from16 v7, v18

    .line 141
    .line 142
    const-wide/16 v3, -0x1

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_7
    const v13, 0x6d6f6f66

    .line 146
    .line 147
    .line 148
    if-eq v15, v13, :cond_16

    .line 149
    .line 150
    const v13, 0x6d766578

    .line 151
    .line 152
    .line 153
    if-ne v15, v13, :cond_8

    .line 154
    .line 155
    move v7, v11

    .line 156
    goto/16 :goto_a

    .line 157
    .line 158
    :cond_8
    const v13, 0x6d646174

    .line 159
    .line 160
    .line 161
    if-ne v15, v13, :cond_9

    .line 162
    .line 163
    move/from16 v13, v18

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_9
    move v13, v11

    .line 167
    :goto_3
    xor-int/2addr v13, v11

    .line 168
    or-int/2addr v10, v13

    .line 169
    int-to-long v11, v9

    .line 170
    add-long/2addr v11, v3

    .line 171
    move-object/from16 v20, v14

    .line 172
    .line 173
    int-to-long v13, v6

    .line 174
    sub-long/2addr v11, v7

    .line 175
    cmp-long v11, v11, v13

    .line 176
    .line 177
    if-ltz v11, :cond_a

    .line 178
    .line 179
    move/from16 v7, v18

    .line 180
    .line 181
    goto/16 :goto_a

    .line 182
    .line 183
    :cond_a
    sub-long/2addr v3, v7

    .line 184
    long-to-int v3, v3

    .line 185
    add-int/2addr v9, v3

    .line 186
    const v4, 0x66747970

    .line 187
    .line 188
    .line 189
    if-ne v15, v4, :cond_14

    .line 190
    .line 191
    const/16 v4, 0x8

    .line 192
    .line 193
    if-ge v3, v4, :cond_b

    .line 194
    .line 195
    return v18

    .line 196
    :cond_b
    move-object/from16 v14, v20

    .line 197
    .line 198
    invoke-virtual {v14, v3}, Ll/bgw0;->h(I)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v14}, Ll/bgw0;->m()[B

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    move/from16 v7, v18

    .line 206
    .line 207
    invoke-interface {v0, v4, v7, v3}, Ll/qer0;->i([BII)V

    .line 208
    .line 209
    .line 210
    shr-int/lit8 v3, v3, 0x2

    .line 211
    .line 212
    const/4 v4, 0x0

    .line 213
    :goto_4
    if-ge v4, v3, :cond_12

    .line 214
    .line 215
    const/4 v13, 0x1

    .line 216
    if-ne v4, v13, :cond_c

    .line 217
    .line 218
    const/4 v7, 0x4

    .line 219
    invoke-virtual {v14, v7}, Ll/bgw0;->l(I)V

    .line 220
    .line 221
    .line 222
    goto :goto_7

    .line 223
    :cond_c
    invoke-virtual {v14}, Ll/bgw0;->v()I

    .line 224
    .line 225
    .line 226
    move-result v7

    .line 227
    ushr-int/lit8 v8, v7, 0x8

    .line 228
    .line 229
    const v11, 0x336770

    .line 230
    .line 231
    .line 232
    if-ne v8, v11, :cond_d

    .line 233
    .line 234
    :goto_5
    const/4 v11, 0x1

    .line 235
    goto :goto_8

    .line 236
    :cond_d
    const v8, 0x68656963

    .line 237
    .line 238
    .line 239
    if-ne v7, v8, :cond_f

    .line 240
    .line 241
    if-eqz p2, :cond_e

    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_e
    move v7, v8

    .line 245
    :cond_f
    sget-object v8, Ll/gnr0;->a:[I

    .line 246
    .line 247
    const/4 v11, 0x0

    .line 248
    :goto_6
    const/16 v12, 0x1d

    .line 249
    .line 250
    if-ge v11, v12, :cond_11

    .line 251
    .line 252
    aget v12, v8, v11

    .line 253
    .line 254
    if-ne v12, v7, :cond_10

    .line 255
    .line 256
    goto :goto_5

    .line 257
    :cond_10
    add-int/lit8 v11, v11, 0x1

    .line 258
    .line 259
    goto :goto_6

    .line 260
    :cond_11
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_12
    move v11, v10

    .line 264
    :goto_8
    if-eqz v11, :cond_13

    .line 265
    .line 266
    move v10, v11

    .line 267
    goto :goto_9

    .line 268
    :cond_13
    const/16 v18, 0x0

    .line 269
    .line 270
    return v18

    .line 271
    :cond_14
    move-object/from16 v14, v20

    .line 272
    .line 273
    if-eqz v3, :cond_15

    .line 274
    .line 275
    invoke-interface {v0, v3}, Ll/qer0;->zzg(I)V

    .line 276
    .line 277
    .line 278
    :cond_15
    :goto_9
    move-object v8, v14

    .line 279
    const-wide/16 v3, -0x1

    .line 280
    .line 281
    const/4 v7, 0x0

    .line 282
    goto/16 :goto_1

    .line 283
    .line 284
    :cond_16
    const/4 v7, 0x1

    .line 285
    goto :goto_a

    .line 286
    :cond_17
    const/4 v7, 0x0

    .line 287
    :goto_a
    if-eqz v10, :cond_18

    .line 288
    .line 289
    move/from16 v0, p1

    .line 290
    .line 291
    if-ne v0, v7, :cond_18

    .line 292
    .line 293
    const/4 v13, 0x1

    .line 294
    return v13

    .line 295
    :cond_18
    const/16 v18, 0x0

    .line 296
    .line 297
    return v18
.end method
