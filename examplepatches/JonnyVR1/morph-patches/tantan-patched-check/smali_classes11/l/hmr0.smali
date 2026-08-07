.class public final Ll/hmr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const-string v0, "OpusHead"

    .line 4
    .line 5
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/hmr0;->a:[B

    .line 12
    .line 13
    return-void
.end method

.method public static a(Ll/xlr0;)Lcom/google/android/gms/internal/ads/zzby;
    .locals 12
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const v0, 0x68646c72    # 4.3148E24f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x6b657973

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x696c7374

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v2}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_7

    .line 24
    .line 25
    if-eqz v1, :cond_7

    .line 26
    .line 27
    if-eqz p0, :cond_7

    .line 28
    .line 29
    iget-object v0, v0, Ll/ylr0;->b:Ll/bgw0;

    .line 30
    .line 31
    invoke-static {v0}, Ll/hmr0;->g(Ll/bgw0;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const v3, 0x6d647461

    .line 36
    .line 37
    .line 38
    if-eq v0, v3, :cond_0

    .line 39
    .line 40
    goto/16 :goto_5

    .line 41
    .line 42
    :cond_0
    iget-object v0, v1, Ll/ylr0;->b:Ll/bgw0;

    .line 43
    .line 44
    const/16 v1, 0xc

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    new-array v3, v1, [Ljava/lang/String;

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    move v5, v4

    .line 57
    :goto_0
    if-ge v5, v1, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    const/4 v7, 0x4

    .line 64
    invoke-virtual {v0, v7}, Ll/bgw0;->l(I)V

    .line 65
    .line 66
    .line 67
    add-int/lit8 v6, v6, -0x8

    .line 68
    .line 69
    sget-object v7, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 70
    .line 71
    invoke-virtual {v0, v6, v7}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    aput-object v6, v3, v5

    .line 76
    .line 77
    add-int/lit8 v5, v5, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    iget-object p0, p0, Ll/ylr0;->b:Ll/bgw0;

    .line 81
    .line 82
    const/16 v0, 0x8

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 85
    .line 86
    .line 87
    new-instance v5, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-le v6, v0, :cond_6

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    add-int/2addr v6, v7

    .line 107
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    add-int/lit8 v7, v7, -0x1

    .line 112
    .line 113
    if-ltz v7, :cond_4

    .line 114
    .line 115
    if-ge v7, v1, :cond_4

    .line 116
    .line 117
    aget-object v7, v3, v7

    .line 118
    .line 119
    sget-object v8, Ll/ymr0;->a:[Ljava/lang/String;

    .line 120
    .line 121
    :goto_2
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    if-ge v8, v6, :cond_3

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 128
    .line 129
    .line 130
    move-result v9

    .line 131
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 132
    .line 133
    .line 134
    move-result v10

    .line 135
    const v11, 0x64617461

    .line 136
    .line 137
    .line 138
    if-ne v10, v11, :cond_2

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    add-int/lit8 v9, v9, -0x10

    .line 149
    .line 150
    new-array v11, v9, [B

    .line 151
    .line 152
    invoke-virtual {p0, v11, v4, v9}, Ll/bgw0;->g([BII)V

    .line 153
    .line 154
    .line 155
    new-instance v9, Lcom/google/android/gms/internal/ads/zzgc;

    .line 156
    .line 157
    invoke-direct {v9, v7, v11, v10, v8}, Lcom/google/android/gms/internal/ads/zzgc;-><init>(Ljava/lang/String;[BII)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_2
    add-int/2addr v8, v9

    .line 162
    invoke-virtual {p0, v8}, Ll/bgw0;->k(I)V

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_3
    move-object v9, v2

    .line 167
    :goto_3
    if-eqz v9, :cond_5

    .line 168
    .line 169
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v9, "Skipped metadata with unknown key index: "

    .line 176
    .line 177
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    const-string v8, "AtomParsers"

    .line 188
    .line 189
    invoke-static {v8, v7}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    :goto_4
    invoke-virtual {p0, v6}, Ll/bgw0;->k(I)V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-nez p0, :cond_7

    .line 201
    .line 202
    new-instance p0, Lcom/google/android/gms/internal/ads/zzby;

    .line 203
    .line 204
    invoke-direct {p0, v5}, Lcom/google/android/gms/internal/ads/zzby;-><init>(Ljava/util/List;)V

    .line 205
    .line 206
    .line 207
    return-object p0

    .line 208
    :cond_7
    :goto_5
    return-object v2
.end method

.method public static b(Ll/ylr0;)Lcom/google/android/gms/internal/ads/zzby;
    .locals 14

    .line 1
    iget-object p0, p0, Ll/ylr0;->b:Ll/bgw0;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/google/android/gms/internal/ads/zzby;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    new-array v3, v2, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 12
    .line 13
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    invoke-direct {v1, v4, v5, v3}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-lt v3, v0, :cond_15

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    add-int/2addr v6, v3

    .line 36
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    const v8, 0x6d657461

    .line 41
    .line 42
    .line 43
    const/4 v9, 0x0

    .line 44
    if-ne v7, v8, :cond_5

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Ll/bgw0;->k(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/hmr0;->e(Ll/bgw0;)V

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-ge v3, v6, :cond_4

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    add-int/2addr v7, v3

    .line 70
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    const v10, 0x696c7374

    .line 75
    .line 76
    .line 77
    if-ne v8, v10, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0, v3}, Ll/bgw0;->k(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 83
    .line 84
    .line 85
    new-instance v3, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    :cond_0
    :goto_2
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    if-ge v8, v7, :cond_1

    .line 95
    .line 96
    invoke-static {p0}, Ll/ymr0;->a(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzbx;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    if-eqz v8, :cond_0

    .line 101
    .line 102
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    if-eqz v7, :cond_2

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_2
    new-instance v9, Lcom/google/android/gms/internal/ads/zzby;

    .line 114
    .line 115
    invoke-direct {v9, v3}, Lcom/google/android/gms/internal/ads/zzby;-><init>(Ljava/util/List;)V

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_3
    invoke-virtual {p0, v7}, Ll/bgw0;->k(I)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_4
    :goto_3
    invoke-virtual {v1, v9}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    goto/16 :goto_a

    .line 128
    .line 129
    :cond_5
    const v8, 0x736d7461

    .line 130
    .line 131
    .line 132
    if-ne v7, v8, :cond_13

    .line 133
    .line 134
    invoke-virtual {p0, v3}, Ll/bgw0;->k(I)V

    .line 135
    .line 136
    .line 137
    const/16 v3, 0xc

    .line 138
    .line 139
    invoke-virtual {p0, v3}, Ll/bgw0;->l(I)V

    .line 140
    .line 141
    .line 142
    :goto_4
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    if-ge v7, v6, :cond_12

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 153
    .line 154
    .line 155
    move-result v8

    .line 156
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 157
    .line 158
    .line 159
    move-result v10

    .line 160
    const v11, 0x73617574

    .line 161
    .line 162
    .line 163
    if-ne v10, v11, :cond_11

    .line 164
    .line 165
    const/16 v7, 0x10

    .line 166
    .line 167
    if-ge v8, v7, :cond_6

    .line 168
    .line 169
    goto/16 :goto_9

    .line 170
    .line 171
    :cond_6
    const/4 v7, 0x4

    .line 172
    invoke-virtual {p0, v7}, Ll/bgw0;->l(I)V

    .line 173
    .line 174
    .line 175
    const/4 v7, -0x1

    .line 176
    move v8, v2

    .line 177
    move v10, v8

    .line 178
    :goto_5
    const/4 v11, 0x2

    .line 179
    const/4 v12, 0x1

    .line 180
    if-ge v8, v11, :cond_9

    .line 181
    .line 182
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 183
    .line 184
    .line 185
    move-result v11

    .line 186
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 187
    .line 188
    .line 189
    move-result v13

    .line 190
    if-nez v11, :cond_7

    .line 191
    .line 192
    move v7, v13

    .line 193
    goto :goto_6

    .line 194
    :cond_7
    if-ne v11, v12, :cond_8

    .line 195
    .line 196
    move v10, v13

    .line 197
    :cond_8
    :goto_6
    add-int/lit8 v8, v8, 0x1

    .line 198
    .line 199
    goto :goto_5

    .line 200
    :cond_9
    const v8, -0x7fffffff

    .line 201
    .line 202
    .line 203
    if-ne v7, v3, :cond_a

    .line 204
    .line 205
    const/16 v3, 0xf0

    .line 206
    .line 207
    goto :goto_8

    .line 208
    :cond_a
    const/16 v11, 0xd

    .line 209
    .line 210
    if-ne v7, v11, :cond_b

    .line 211
    .line 212
    const/16 v3, 0x78

    .line 213
    .line 214
    goto :goto_8

    .line 215
    :cond_b
    const/16 v11, 0x15

    .line 216
    .line 217
    if-eq v7, v11, :cond_d

    .line 218
    .line 219
    :cond_c
    :goto_7
    move v3, v8

    .line 220
    goto :goto_8

    .line 221
    :cond_d
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 222
    .line 223
    .line 224
    move-result v7

    .line 225
    if-lt v7, v0, :cond_c

    .line 226
    .line 227
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 228
    .line 229
    .line 230
    move-result v7

    .line 231
    add-int/2addr v7, v0

    .line 232
    if-le v7, v6, :cond_e

    .line 233
    .line 234
    goto :goto_7

    .line 235
    :cond_e
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 236
    .line 237
    .line 238
    move-result v7

    .line 239
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 240
    .line 241
    .line 242
    move-result v11

    .line 243
    if-lt v7, v3, :cond_c

    .line 244
    .line 245
    const v3, 0x73726672

    .line 246
    .line 247
    .line 248
    if-eq v11, v3, :cond_f

    .line 249
    .line 250
    goto :goto_7

    .line 251
    :cond_f
    invoke-virtual {p0}, Ll/bgw0;->C()I

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    :goto_8
    if-ne v3, v8, :cond_10

    .line 256
    .line 257
    goto :goto_9

    .line 258
    :cond_10
    new-instance v9, Lcom/google/android/gms/internal/ads/zzby;

    .line 259
    .line 260
    new-instance v7, Lcom/google/android/gms/internal/ads/zzahm;

    .line 261
    .line 262
    int-to-float v3, v3

    .line 263
    invoke-direct {v7, v3, v10}, Lcom/google/android/gms/internal/ads/zzahm;-><init>(FI)V

    .line 264
    .line 265
    .line 266
    new-array v3, v12, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 267
    .line 268
    aput-object v7, v3, v2

    .line 269
    .line 270
    invoke-direct {v9, v4, v5, v3}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 271
    .line 272
    .line 273
    goto :goto_9

    .line 274
    :cond_11
    add-int/2addr v7, v8

    .line 275
    invoke-virtual {p0, v7}, Ll/bgw0;->k(I)V

    .line 276
    .line 277
    .line 278
    goto/16 :goto_4

    .line 279
    .line 280
    :cond_12
    :goto_9
    invoke-virtual {v1, v9}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    goto :goto_a

    .line 285
    :cond_13
    const v3, -0x56878686

    .line 286
    .line 287
    .line 288
    if-ne v7, v3, :cond_14

    .line 289
    .line 290
    invoke-static {p0}, Ll/hmr0;->i(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzby;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    :cond_14
    :goto_a
    invoke-virtual {p0, v6}, Ll/bgw0;->k(I)V

    .line 299
    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :cond_15
    return-object v1
.end method

.method public static c(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzgi;
    .locals 11

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ll/zlr0;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    :goto_0
    move-wide v5, v0

    .line 25
    move-wide v7, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/bgw0;->I()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-virtual {p0}, Ll/bgw0;->I()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    goto :goto_0

    .line 36
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 37
    .line 38
    .line 39
    move-result-wide v9

    .line 40
    new-instance v4, Lcom/google/android/gms/internal/ads/zzgi;

    .line 41
    .line 42
    invoke-direct/range {v4 .. v10}, Lcom/google/android/gms/internal/ads/zzgi;-><init>(JJJ)V

    .line 43
    .line 44
    .line 45
    return-object v4
.end method

.method public static d(Ll/xlr0;Ll/rfr0;JLcom/google/android/gms/internal/ads/zzae;ZZLl/eow0;)Ljava/util/List;
    .locals 70
    .param p4    # Lcom/google/android/gms/internal/ads/zzae;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const/4 v13, 0x0

    .line 2
    :goto_0
    iget-object v1, v0, Ll/xlr0;->d:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v13, v1, :cond_80

    .line 3
    iget-object v1, v0, Ll/xlr0;->d:Ljava/util/List;

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Ll/xlr0;

    .line 4
    iget v1, v14, Ll/zlr0;->a:I

    const v2, 0x7472616b

    if-eq v1, v2, :cond_0

    move-object/from16 v3, p1

    move-object/from16 v0, p7

    move-object v2, v11

    move/from16 v31, v13

    const/16 v35, 0x0

    goto/16 :goto_52

    :cond_0
    const v1, 0x6d766864

    .line 5
    invoke-virtual {v0, v1}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v1

    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v15, 0x6d646961

    .line 7
    invoke-virtual {v14, v15}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v3, 0x68646c72    # 4.3148E24f

    .line 9
    invoke-virtual {v2, v3}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v3

    .line 10
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iget-object v3, v3, Ll/ylr0;->b:Ll/bgw0;

    invoke-static {v3}, Ll/hmr0;->g(Ll/bgw0;)I

    move-result v3

    const v4, 0x736f756e

    const/4 v7, -0x1

    if-ne v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const v4, 0x76696465

    if-ne v3, v4, :cond_2

    const/4 v3, 0x2

    goto :goto_1

    :cond_2
    const v4, 0x74657874

    if-eq v3, v4, :cond_3

    const v4, 0x7362746c

    if-eq v3, v4, :cond_3

    const v4, 0x73756274

    if-eq v3, v4, :cond_3

    const v4, 0x636c6370

    if-ne v3, v4, :cond_4

    :cond_3
    const/4 v3, 0x3

    goto :goto_1

    :cond_4
    const v4, 0x6d657461

    if-ne v3, v4, :cond_5

    const/4 v3, 0x5

    goto :goto_1

    :cond_5
    move v3, v7

    :goto_1
    const v10, 0x6d696e66

    if-ne v3, v7, :cond_6

    move-object/from16 v0, p7

    move-object/from16 v40, v11

    move/from16 v31, v13

    move-object v1, v14

    const/4 v15, 0x0

    const/16 v35, 0x0

    goto/16 :goto_51

    :cond_6
    const v5, 0x746b6864

    .line 12
    invoke-virtual {v14, v5}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v5

    .line 13
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    iget-object v5, v5, Ll/ylr0;->b:Ll/bgw0;

    const/16 v15, 0x8

    .line 15
    invoke-virtual {v5, v15}, Ll/bgw0;->k(I)V

    .line 16
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ll/zlr0;->a(I)I

    move-result v18

    const/16 v9, 0x10

    if-nez v18, :cond_7

    move v6, v15

    goto :goto_2

    :cond_7
    move v6, v9

    .line 17
    :goto_2
    invoke-virtual {v5, v6}, Ll/bgw0;->l(I)V

    .line 18
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v6

    const/4 v12, 0x4

    .line 19
    invoke-virtual {v5, v12}, Ll/bgw0;->l(I)V

    invoke-virtual {v5}, Ll/bgw0;->s()I

    move-result v21

    const/4 v8, 0x0

    :goto_3
    if-nez v18, :cond_8

    move v15, v12

    :cond_8
    const-wide/16 v24, 0x0

    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    if-ge v8, v15, :cond_c

    invoke-virtual {v5}, Ll/bgw0;->m()[B

    move-result-object v15

    add-int v28, v21, v8

    .line 20
    aget-byte v15, v15, v28

    if-eq v15, v7, :cond_b

    if-nez v18, :cond_9

    .line 21
    invoke-virtual {v5}, Ll/bgw0;->J()J

    move-result-wide v28

    goto :goto_4

    :cond_9
    invoke-virtual {v5}, Ll/bgw0;->K()J

    move-result-wide v28

    :goto_4
    cmp-long v8, v28, v24

    if-nez v8, :cond_a

    :goto_5
    move-wide/from16 v7, v26

    goto :goto_6

    :cond_a
    move-wide/from16 v7, v28

    goto :goto_6

    :cond_b
    add-int/lit8 v8, v8, 0x1

    const/16 v15, 0x8

    goto :goto_3

    .line 22
    :cond_c
    invoke-virtual {v5, v15}, Ll/bgw0;->l(I)V

    goto :goto_5

    .line 23
    :goto_6
    invoke-virtual {v5, v9}, Ll/bgw0;->l(I)V

    .line 24
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v18

    .line 25
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v9

    .line 26
    invoke-virtual {v5, v12}, Ll/bgw0;->l(I)V

    .line 27
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v15

    .line 28
    invoke-virtual {v5}, Ll/bgw0;->v()I

    move-result v5

    const/high16 v12, 0x10000

    const/high16 v4, -0x10000

    if-nez v18, :cond_10

    if-ne v9, v12, :cond_f

    if-ne v15, v4, :cond_e

    if-nez v5, :cond_d

    const/16 v4, 0x5a

    goto :goto_9

    :cond_d
    move v15, v4

    :cond_e
    move v9, v12

    :cond_f
    const/16 v18, 0x0

    :cond_10
    if-nez v18, :cond_14

    if-ne v9, v4, :cond_13

    if-ne v15, v12, :cond_12

    if-nez v5, :cond_11

    const/16 v4, 0x10e

    goto :goto_9

    :cond_11
    move v9, v4

    :goto_7
    const/4 v15, 0x0

    goto :goto_8

    :cond_12
    move v9, v4

    :cond_13
    move v12, v15

    goto :goto_7

    :cond_14
    move v12, v15

    move/from16 v15, v18

    :goto_8
    if-ne v15, v4, :cond_15

    if-nez v9, :cond_15

    if-nez v12, :cond_15

    if-ne v5, v4, :cond_15

    const/16 v4, 0xb4

    goto :goto_9

    :cond_15
    const/4 v4, 0x0

    :goto_9
    new-instance v12, Ll/gmr0;

    invoke-direct {v12, v6, v7, v8, v4}, Ll/gmr0;-><init>(IJI)V

    cmp-long v4, p2, v26

    if-nez v4, :cond_16

    invoke-static {v12}, Ll/gmr0;->c(Ll/gmr0;)J

    move-result-wide v4

    move-wide/from16 v32, v4

    goto :goto_a

    :cond_16
    move-wide/from16 v32, p2

    :goto_a
    iget-object v1, v1, Ll/ylr0;->b:Ll/bgw0;

    .line 29
    invoke-static {v1}, Ll/hmr0;->c(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzgi;

    move-result-object v1

    iget-wide v4, v1, Lcom/google/android/gms/internal/ads/zzgi;->zzc:J

    cmp-long v1, v32, v26

    if-nez v1, :cond_17

    move-wide/from16 v36, v4

    goto :goto_b

    :cond_17
    const-wide/32 v34, 0xf4240

    .line 30
    sget-object v38, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    move-wide/from16 v36, v4

    .line 31
    invoke-static/range {v32 .. v38}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    move-result-wide v26

    .line 32
    :goto_b
    invoke-virtual {v2, v10}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v4, 0x7374626c

    .line 34
    invoke-virtual {v1, v4}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v5, 0x6d646864

    .line 36
    invoke-virtual {v2, v5}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    iget-object v2, v2, Ll/ylr0;->b:Ll/bgw0;

    const/16 v5, 0x8

    .line 39
    invoke-virtual {v2, v5}, Ll/bgw0;->k(I)V

    .line 40
    invoke-virtual {v2}, Ll/bgw0;->v()I

    move-result v5

    invoke-static {v5}, Ll/zlr0;->a(I)I

    move-result v5

    if-nez v5, :cond_18

    const/16 v6, 0x8

    goto :goto_c

    :cond_18
    const/16 v6, 0x10

    .line 41
    :goto_c
    invoke-virtual {v2, v6}, Ll/bgw0;->l(I)V

    if-nez v5, :cond_19

    const/4 v5, 0x4

    goto :goto_d

    :cond_19
    const/16 v5, 0x8

    .line 42
    :goto_d
    invoke-virtual {v2}, Ll/bgw0;->J()J

    move-result-wide v6

    .line 43
    invoke-virtual {v2, v5}, Ll/bgw0;->l(I)V

    .line 44
    invoke-virtual {v2}, Ll/bgw0;->F()I

    move-result v2

    shr-int/lit8 v5, v2, 0xa

    shr-int/lit8 v8, v2, 0x5

    and-int/lit8 v2, v2, 0x1f

    new-instance v9, Ljava/lang/StringBuilder;

    .line 45
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    and-int/lit8 v5, v5, 0x1f

    add-int/lit8 v5, v5, 0x60

    int-to-char v5, v5

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 v5, v8, 0x1f

    add-int/lit8 v5, v5, 0x60

    int-to-char v5, v5

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x60

    int-to-char v2, v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 46
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v5, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v15

    const v2, 0x73747364

    .line 47
    invoke-virtual {v1, v2}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v1

    if-eqz v1, :cond_7f

    .line 48
    invoke-static {v12}, Ll/gmr0;->a(Ll/gmr0;)I

    move-result v5

    invoke-static {v12}, Ll/gmr0;->b(Ll/gmr0;)I

    move-result v2

    .line 49
    iget-object v6, v15, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v1, v1, Ll/ylr0;->b:Ll/bgw0;

    const/16 v7, 0xc

    .line 50
    invoke-virtual {v1, v7}, Ll/bgw0;->k(I)V

    .line 51
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v8

    new-instance v9, Ll/dmr0;

    .line 52
    invoke-direct {v9, v8}, Ll/dmr0;-><init>(I)V

    move/from16 v18, v10

    const/4 v10, 0x0

    :goto_e
    if-ge v10, v8, :cond_75

    move/from16 v30, v3

    invoke-virtual {v1}, Ll/bgw0;->s()I

    move-result v3

    move/from16 v32, v4

    .line 53
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v4

    if-lez v4, :cond_1a

    const/4 v7, 0x1

    goto :goto_f

    :cond_1a
    const/4 v7, 0x0

    .line 54
    :goto_f
    const-string v0, "childAtomSize must be positive"

    invoke-static {v7, v0}, Ll/ter0;->b(ZLjava/lang/String;)V

    move v7, v2

    .line 55
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v2

    move/from16 v34, v3

    const v3, 0x61766331

    if-eq v2, v3, :cond_1b

    const v3, 0x61766333

    if-eq v2, v3, :cond_1b

    const v3, 0x656e6376

    if-eq v2, v3, :cond_1b

    const v3, 0x6d317620

    if-eq v2, v3, :cond_1b

    const v3, 0x6d703476

    if-eq v2, v3, :cond_1b

    const v3, 0x68766331

    if-eq v2, v3, :cond_1b

    const v3, 0x68657631

    if-eq v2, v3, :cond_1b

    const v3, 0x73323633

    if-eq v2, v3, :cond_1b

    const v3, 0x48323633

    if-eq v2, v3, :cond_1b

    const v3, 0x76703038

    if-eq v2, v3, :cond_1b

    const v3, 0x76703039

    if-eq v2, v3, :cond_1b

    const v3, 0x61763031

    if-eq v2, v3, :cond_1b

    const v3, 0x64766176

    if-eq v2, v3, :cond_1b

    const v3, 0x64766131

    if-eq v2, v3, :cond_1b

    const v3, 0x64766865

    if-eq v2, v3, :cond_1b

    const v3, 0x64766831

    if-ne v2, v3, :cond_1c

    :cond_1b
    move/from16 v18, v8

    move-object/from16 v16, v12

    move/from16 v31, v13

    move/from16 v3, v34

    const/16 v13, 0x10

    const/16 v35, 0x0

    move-object/from16 v8, p4

    move v12, v7

    const/4 v7, 0x2

    goto/16 :goto_17

    :cond_1c
    const v0, 0x6d703461

    if-eq v2, v0, :cond_1d

    const v0, 0x656e6361

    if-eq v2, v0, :cond_1d

    const v0, 0x61632d33

    if-eq v2, v0, :cond_1d

    const v0, 0x65632d33

    if-eq v2, v0, :cond_1d

    const v0, 0x61632d34

    if-eq v2, v0, :cond_1d

    const v0, 0x6d6c7061

    if-eq v2, v0, :cond_1d

    const v0, 0x64747363

    if-eq v2, v0, :cond_1d

    const v0, 0x64747365

    if-eq v2, v0, :cond_1d

    const v0, 0x64747368

    if-eq v2, v0, :cond_1d

    const v0, 0x6474736c

    if-eq v2, v0, :cond_1d

    const v0, 0x64747378

    if-eq v2, v0, :cond_1d

    const v0, 0x73616d72

    if-eq v2, v0, :cond_1d

    const v0, 0x73617762

    if-eq v2, v0, :cond_1d

    const v0, 0x6c70636d

    if-eq v2, v0, :cond_1d

    const v0, 0x736f7774

    if-eq v2, v0, :cond_1d

    const v0, 0x74776f73

    if-eq v2, v0, :cond_1d

    const v0, 0x2e6d7032

    if-eq v2, v0, :cond_1d

    const v0, 0x2e6d7033

    if-eq v2, v0, :cond_1d

    const v0, 0x6d686131

    if-eq v2, v0, :cond_1d

    const v0, 0x6d686d31

    if-eq v2, v0, :cond_1d

    const v0, 0x616c6163

    if-eq v2, v0, :cond_1d

    const v0, 0x616c6177

    if-eq v2, v0, :cond_1d

    const v0, 0x756c6177

    if-eq v2, v0, :cond_1d

    const v0, 0x4f707573

    if-eq v2, v0, :cond_1d

    const v0, 0x664c6143

    if-ne v2, v0, :cond_1e

    :cond_1d
    move/from16 v18, v8

    move-object/from16 v16, v12

    move/from16 v31, v13

    move/from16 v3, v34

    const/4 v0, 0x1

    const/16 v13, 0x10

    const/16 v20, 0x3

    const/16 v22, 0x2

    const/16 v28, -0x1

    const/16 v33, 0xc

    const/16 v35, 0x0

    move-object/from16 v8, p4

    move v12, v7

    move/from16 v7, p6

    goto/16 :goto_16

    :cond_1e
    const v0, 0x74783367

    const v3, 0x54544d4c

    if-eq v2, v3, :cond_22

    if-eq v2, v0, :cond_22

    const v0, 0x77767474

    if-eq v2, v0, :cond_22

    const v0, 0x73747070

    if-eq v2, v0, :cond_22

    const v0, 0x63363038

    if-ne v2, v0, :cond_1f

    goto :goto_11

    :cond_1f
    const v0, 0x6d657474

    if-ne v2, v0, :cond_21

    add-int/lit8 v3, v34, 0x10

    .line 56
    invoke-virtual {v1, v3}, Ll/bgw0;->k(I)V

    const/4 v0, 0x0

    .line 57
    invoke-virtual {v1, v0}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 58
    invoke-virtual {v1, v0}, Ll/bgw0;->M(C)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_20

    new-instance v0, Ll/znr0;

    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 59
    invoke-virtual {v0, v5}, Ll/znr0;->j(I)Ll/znr0;

    invoke-virtual {v0, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    move-result-object v0

    iput-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    :cond_20
    :goto_10
    move/from16 v56, v4

    move-object/from16 v28, v6

    move/from16 v18, v8

    move/from16 v42, v10

    move-object/from16 v40, v11

    move-object/from16 v16, v12

    move/from16 v31, v13

    move-object/from16 v45, v14

    move-object/from16 v44, v15

    move/from16 v41, v34

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v19, 0x5

    const/16 v35, 0x0

    move v12, v7

    goto/16 :goto_4a

    :cond_21
    const v0, 0x63616d6d

    if-ne v2, v0, :cond_20

    new-instance v0, Ll/znr0;

    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 60
    invoke-virtual {v0, v5}, Ll/znr0;->j(I)Ll/znr0;

    const-string v2, "application/x-camera-motion"

    .line 61
    invoke-virtual {v0, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 62
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    move-result-object v0

    iput-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    goto :goto_10

    :cond_22
    :goto_11
    add-int/lit8 v0, v34, 0x10

    .line 63
    invoke-virtual {v1, v0}, Ll/bgw0;->k(I)V

    const-string v0, "application/ttml+xml"

    const-wide v40, 0x7fffffffffffffffL

    if-ne v2, v3, :cond_23

    :goto_12
    move-object v2, v0

    :goto_13
    move-object/from16 v19, v1

    move/from16 v42, v4

    move-wide/from16 v0, v40

    :goto_14
    const/4 v3, 0x0

    goto :goto_15

    :cond_23
    const v3, 0x74783367

    if-ne v2, v3, :cond_24

    add-int/lit8 v0, v4, -0x10

    .line 64
    new-array v2, v0, [B

    const/4 v3, 0x0

    .line 65
    invoke-virtual {v1, v2, v3, v0}, Ll/bgw0;->g([BII)V

    .line 66
    invoke-static {v2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v0

    const-string v2, "application/x-quicktime-tx3g"

    move-object v3, v0

    move-object/from16 v19, v1

    move/from16 v42, v4

    move-wide/from16 v0, v40

    goto :goto_15

    :cond_24
    const v3, 0x77767474

    if-ne v2, v3, :cond_25

    const-string v0, "application/x-mp4-vtt"

    goto :goto_12

    :cond_25
    const v3, 0x73747070

    if-ne v2, v3, :cond_26

    move-object v2, v0

    move-object/from16 v19, v1

    move/from16 v42, v4

    move-wide/from16 v0, v24

    goto :goto_14

    :cond_26
    const/4 v0, 0x1

    iput v0, v9, Ll/dmr0;->d:I

    const-string v2, "application/x-mp4-cea-608"

    goto :goto_13

    .line 67
    :goto_15
    new-instance v4, Ll/znr0;

    invoke-direct {v4}, Ll/znr0;-><init>()V

    .line 68
    invoke-virtual {v4, v5}, Ll/znr0;->j(I)Ll/znr0;

    .line 69
    invoke-virtual {v4, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 70
    invoke-virtual {v4, v6}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 71
    invoke-virtual {v4, v0, v1}, Ll/znr0;->B(J)Ll/znr0;

    .line 72
    invoke-virtual {v4, v3}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 73
    invoke-virtual {v4}, Ll/znr0;->D()Ll/sqr0;

    move-result-object v0

    iput-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    move-object/from16 v28, v6

    move/from16 v18, v8

    move-object/from16 v40, v11

    move-object/from16 v16, v12

    move/from16 v31, v13

    move-object/from16 v45, v14

    move-object/from16 v44, v15

    move-object/from16 v1, v19

    move/from16 v41, v34

    move/from16 v56, v42

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v19, 0x5

    const/16 v35, 0x0

    move v12, v7

    move/from16 v42, v10

    goto/16 :goto_4a

    .line 74
    :goto_16
    invoke-static/range {v1 .. v10}, Ll/hmr0;->m(Ll/bgw0;IIIILjava/lang/String;ZLcom/google/android/gms/internal/ads/zzae;Ll/dmr0;I)V

    move/from16 v41, v3

    move/from16 v56, v4

    move/from16 v42, v10

    move-object/from16 v40, v11

    move-object/from16 v45, v14

    move-object/from16 v44, v15

    move/from16 v8, v20

    move/from16 v15, v28

    const/16 v19, 0x5

    move-object/from16 v28, v6

    goto/16 :goto_4a

    :goto_17
    add-int/lit8 v7, v3, 0x10

    .line 75
    invoke-virtual {v1, v7}, Ll/bgw0;->k(I)V

    .line 76
    invoke-virtual {v1, v13}, Ll/bgw0;->l(I)V

    .line 77
    invoke-virtual {v1}, Ll/bgw0;->F()I

    move-result v7

    .line 78
    invoke-virtual {v1}, Ll/bgw0;->F()I

    move-result v13

    move-object/from16 v28, v6

    const/16 v6, 0x32

    .line 79
    invoke-virtual {v1, v6}, Ll/bgw0;->l(I)V

    invoke-virtual {v1}, Ll/bgw0;->s()I

    move-result v6

    move/from16 v42, v10

    const v10, 0x656e6376

    if-ne v2, v10, :cond_29

    .line 80
    invoke-static {v1, v3, v4}, Ll/hmr0;->h(Ll/bgw0;II)Landroid/util/Pair;

    move-result-object v2

    if-eqz v2, :cond_28

    .line 81
    iget-object v10, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-nez v8, :cond_27

    move/from16 v41, v3

    const/16 v44, 0x0

    goto :goto_18

    :cond_27
    move/from16 v41, v3

    .line 82
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ll/inr0;

    iget-object v3, v3, Ll/inr0;->b:Ljava/lang/String;

    invoke-virtual {v8, v3}, Lcom/google/android/gms/internal/ads/zzae;->b(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzae;

    move-result-object v3

    move-object/from16 v44, v3

    .line 83
    :goto_18
    iget-object v3, v9, Ll/dmr0;->a:[Ll/inr0;

    .line 84
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ll/inr0;

    aput-object v2, v3, v42

    :goto_19
    move v2, v10

    goto :goto_1a

    :cond_28
    move/from16 v41, v3

    move-object/from16 v44, v8

    goto :goto_19

    .line 85
    :goto_1a
    invoke-virtual {v1, v6}, Ll/bgw0;->k(I)V

    move v3, v2

    move-object/from16 v2, v44

    goto :goto_1b

    :cond_29
    move/from16 v41, v3

    move v3, v2

    move-object v2, v8

    :goto_1b
    const-string v10, "video/3gpp"

    move/from16 v44, v6

    const v6, 0x6d317620

    if-ne v3, v6, :cond_2a

    const-string v6, "video/mpeg"

    goto :goto_1c

    :cond_2a
    const v6, 0x48323633

    if-ne v3, v6, :cond_2b

    move v3, v6

    move-object v6, v10

    goto :goto_1c

    :cond_2b
    const/4 v6, 0x0

    :goto_1c
    const/high16 v39, 0x3f800000    # 1.0f

    move/from16 v40, v39

    move-object/from16 v39, v10

    move/from16 v10, v44

    move-object/from16 v44, v15

    move/from16 v15, v40

    move-object/from16 v50, v2

    move-object/from16 v40, v11

    move-object/from16 v45, v14

    move/from16 v48, v35

    const/4 v2, 0x0

    const/4 v14, -0x1

    const/16 v46, 0x8

    const/16 v47, 0x8

    const/16 v49, -0x1

    const/16 v51, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v54, -0x1

    const/16 v55, 0x0

    move-object v11, v6

    const/4 v6, -0x1

    :goto_1d
    sub-int v8, v10, v41

    if-ge v8, v4, :cond_2c

    .line 86
    invoke-virtual {v1, v10}, Ll/bgw0;->k(I)V

    invoke-virtual {v1}, Ll/bgw0;->s()I

    move-result v8

    .line 87
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v56

    if-nez v56, :cond_2e

    invoke-virtual {v1}, Ll/bgw0;->s()I

    move-result v56

    move/from16 v57, v10

    sub-int v10, v56, v41

    if-ne v10, v4, :cond_2d

    :cond_2c
    move-object/from16 v69, v2

    move/from16 v56, v4

    move v0, v6

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v19, 0x5

    goto/16 :goto_48

    :cond_2d
    move/from16 v10, v35

    goto :goto_1e

    :cond_2e
    move/from16 v57, v10

    move/from16 v10, v56

    :goto_1e
    if-lez v10, :cond_2f

    move/from16 v56, v4

    const/4 v4, 0x1

    goto :goto_1f

    :cond_2f
    move/from16 v56, v4

    move/from16 v4, v35

    .line 88
    :goto_1f
    invoke-static {v4, v0}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 89
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v4

    move-object/from16 v58, v0

    const v0, 0x61766343

    if-ne v4, v0, :cond_32

    add-int/lit8 v8, v8, 0x8

    if-nez v11, :cond_30

    const/4 v0, 0x1

    :goto_20
    const/4 v2, 0x0

    goto :goto_21

    :cond_30
    move/from16 v0, v35

    goto :goto_20

    .line 90
    :goto_21
    invoke-static {v0, v2}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 91
    invoke-virtual {v1, v8}, Ll/bgw0;->k(I)V

    .line 92
    invoke-static {v1}, Ll/jdr0;->a(Ll/bgw0;)Ll/jdr0;

    move-result-object v0

    iget-object v2, v0, Ll/jdr0;->a:Ljava/util/List;

    iget v4, v0, Ll/jdr0;->b:I

    iput v4, v9, Ll/dmr0;->c:I

    if-nez v48, :cond_31

    iget v15, v0, Ll/jdr0;->j:F

    move/from16 v4, v35

    goto :goto_22

    :cond_31
    const/4 v4, 0x1

    :goto_22
    iget-object v6, v0, Ll/jdr0;->k:Ljava/lang/String;

    iget v8, v0, Ll/jdr0;->g:I

    iget v11, v0, Ll/jdr0;->h:I

    iget v14, v0, Ll/jdr0;->i:I

    move-object/from16 v46, v2

    iget v2, v0, Ll/jdr0;->e:I

    iget v0, v0, Ll/jdr0;->f:I

    const-string v47, "video/avc"

    :goto_23
    move/from16 v59, v3

    move/from16 v48, v4

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v49, v11

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    move-object/from16 v51, v46

    move-object/from16 v11, v47

    const/4 v15, -0x1

    const/16 v19, 0x5

    const v38, 0x76703038

    move/from16 v46, v0

    move/from16 v47, v2

    move-object v2, v6

    move v6, v14

    :goto_24
    move v14, v8

    const/4 v8, 0x3

    goto/16 :goto_47

    :cond_32
    const v0, 0x68766343

    if-ne v4, v0, :cond_35

    add-int/lit8 v8, v8, 0x8

    if-nez v11, :cond_33

    const/4 v0, 0x1

    :goto_25
    const/4 v2, 0x0

    goto :goto_26

    :cond_33
    move/from16 v0, v35

    goto :goto_25

    .line 93
    :goto_26
    invoke-static {v0, v2}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 94
    invoke-virtual {v1, v8}, Ll/bgw0;->k(I)V

    .line 95
    invoke-static {v1}, Ll/sfr0;->a(Ll/bgw0;)Ll/sfr0;

    move-result-object v0

    iget-object v2, v0, Ll/sfr0;->a:Ljava/util/List;

    iget v4, v0, Ll/sfr0;->b:I

    iput v4, v9, Ll/dmr0;->c:I

    if-nez v48, :cond_34

    iget v15, v0, Ll/sfr0;->h:F

    move/from16 v4, v35

    goto :goto_27

    :cond_34
    const/4 v4, 0x1

    :goto_27
    iget-object v6, v0, Ll/sfr0;->i:Ljava/lang/String;

    iget v8, v0, Ll/sfr0;->e:I

    iget v11, v0, Ll/sfr0;->f:I

    iget v14, v0, Ll/sfr0;->g:I

    move-object/from16 v46, v2

    iget v2, v0, Ll/sfr0;->c:I

    iget v0, v0, Ll/sfr0;->d:I

    const-string v47, "video/hevc"

    goto :goto_23

    :cond_35
    const v0, 0x64766343

    if-eq v4, v0, :cond_36

    const v0, 0x64767643

    if-ne v4, v0, :cond_37

    :cond_36
    move-object/from16 v69, v2

    move/from16 v59, v3

    move v0, v6

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v19, 0x5

    const v38, 0x76703038

    goto/16 :goto_45

    :cond_37
    const v0, 0x76706343

    if-ne v4, v0, :cond_3b

    if-nez v11, :cond_38

    const/4 v0, 0x1

    :goto_28
    const/4 v4, 0x0

    goto :goto_29

    :cond_38
    move/from16 v0, v35

    goto :goto_28

    .line 96
    :goto_29
    invoke-static {v0, v4}, Ll/ter0;->b(ZLjava/lang/String;)V

    add-int/lit8 v8, v8, 0xc

    .line 97
    invoke-virtual {v1, v8}, Ll/bgw0;->k(I)V

    const/4 v0, 0x2

    .line 98
    invoke-virtual {v1, v0}, Ll/bgw0;->l(I)V

    .line 99
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v0

    shr-int/lit8 v4, v0, 0x4

    const/4 v6, 0x1

    and-int/2addr v0, v6

    .line 100
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v8

    .line 101
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v11

    .line 102
    invoke-static {v8}, Ll/wwy0;->a(I)I

    move-result v8

    if-eq v6, v0, :cond_39

    const/4 v0, 0x2

    goto :goto_2a

    :cond_39
    move v0, v6

    :goto_2a
    invoke-static {v11}, Ll/wwy0;->b(I)I

    move-result v11

    const v14, 0x76703038

    if-ne v3, v14, :cond_3a

    const-string v38, "video/x-vnd.on2.vp8"

    goto :goto_2b

    :cond_3a
    const-string v38, "video/x-vnd.on2.vp9"

    :goto_2b
    move/from16 v49, v0

    move/from16 v59, v3

    move/from16 v46, v4

    move/from16 v47, v46

    move/from16 v64, v7

    move-object/from16 v60, v9

    move v6, v11

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    move-object/from16 v11, v38

    const/4 v15, -0x1

    const/16 v19, 0x5

    move/from16 v38, v14

    goto/16 :goto_24

    :cond_3b
    const v38, 0x76703038

    const v0, 0x61763143

    move/from16 v59, v3

    const-string v3, "AtomParsers"

    if-ne v4, v0, :cond_57

    add-int/lit8 v8, v8, 0x8

    .line 103
    invoke-virtual {v1, v8}, Ll/bgw0;->k(I)V

    new-instance v0, Ll/dty0;

    invoke-direct {v0}, Ll/dty0;-><init>()V

    new-instance v4, Ll/dfw0;

    invoke-virtual {v1}, Ll/bgw0;->m()[B

    move-result-object v6

    .line 104
    array-length v8, v6

    invoke-direct {v4, v6, v8}, Ll/dfw0;-><init>([BI)V

    invoke-virtual {v1}, Ll/bgw0;->s()I

    move-result v6

    const/16 v23, 0x8

    mul-int/lit8 v6, v6, 0x8

    .line 105
    invoke-virtual {v4, v6}, Ll/dfw0;->k(I)V

    const/4 v6, 0x1

    .line 106
    invoke-virtual {v4, v6}, Ll/dfw0;->n(I)V

    const/4 v8, 0x3

    .line 107
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v11

    const/4 v8, 0x6

    .line 108
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 109
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    .line 110
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v14

    const/16 v43, 0xa

    const/4 v6, 0x2

    if-ne v11, v6, :cond_3e

    if-eqz v8, :cond_3d

    const/4 v8, 0x1

    if-eq v8, v14, :cond_3c

    move/from16 v11, v43

    goto :goto_2c

    :cond_3c
    const/16 v11, 0xc

    .line 111
    :goto_2c
    invoke-virtual {v0, v11}, Ll/dty0;->f(I)Ll/dty0;

    .line 112
    invoke-virtual {v0, v11}, Ll/dty0;->a(I)Ll/dty0;

    move v14, v8

    goto :goto_2e

    :cond_3d
    move v11, v6

    move/from16 v8, v35

    :cond_3e
    const/4 v14, 0x1

    if-gt v11, v6, :cond_40

    if-eq v14, v8, :cond_3f

    const/16 v6, 0x8

    goto :goto_2d

    :cond_3f
    move/from16 v6, v43

    .line 113
    :goto_2d
    invoke-virtual {v0, v6}, Ll/dty0;->f(I)Ll/dty0;

    .line 114
    invoke-virtual {v0, v6}, Ll/dty0;->a(I)Ll/dty0;

    :cond_40
    :goto_2e
    const/16 v6, 0xd

    .line 115
    invoke-virtual {v4, v6}, Ll/dfw0;->m(I)V

    .line 116
    invoke-virtual {v4}, Ll/dfw0;->l()V

    const/4 v8, 0x4

    .line 117
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v11

    if-eq v11, v14, :cond_41

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Unsupported obu_type: "

    .line 118
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    :goto_2f
    const/4 v6, 0x4

    goto/16 :goto_38

    .line 120
    :cond_41
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_42

    const-string v4, "Unsupported obu_extension_flag"

    .line 121
    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    goto :goto_2f

    .line 123
    :cond_42
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    .line 124
    invoke-virtual {v4}, Ll/dfw0;->l()V

    if-eqz v8, :cond_43

    const/16 v8, 0x8

    .line 125
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v11

    const/16 v8, 0x7f

    if-le v11, v8, :cond_43

    const-string v4, "Excessive obu_size"

    .line 126
    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    goto :goto_2f

    :cond_43
    const/4 v8, 0x3

    .line 128
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v11

    .line 129
    invoke-virtual {v4}, Ll/dfw0;->l()V

    .line 130
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_44

    const-string v4, "Unsupported reduced_still_picture_header"

    .line 131
    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    goto :goto_2f

    .line 133
    :cond_44
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_45

    const-string v4, "Unsupported timing_info_present_flag"

    .line 134
    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    goto :goto_2f

    .line 136
    :cond_45
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_46

    const-string v4, "Unsupported initial_display_delay_present_flag"

    .line 137
    invoke-static {v3, v4}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    goto :goto_2f

    :cond_46
    const/4 v3, 0x5

    .line 139
    invoke-virtual {v4, v3}, Ll/dfw0;->d(I)I

    move-result v8

    move/from16 v14, v35

    :goto_30
    if-gt v14, v8, :cond_48

    const/16 v6, 0xc

    .line 140
    invoke-virtual {v4, v6}, Ll/dfw0;->m(I)V

    .line 141
    invoke-virtual {v4, v3}, Ll/dfw0;->d(I)I

    move-result v6

    const/4 v3, 0x7

    if-le v6, v3, :cond_47

    .line 142
    invoke-virtual {v4}, Ll/dfw0;->l()V

    :cond_47
    add-int/lit8 v14, v14, 0x1

    const/4 v3, 0x5

    goto :goto_30

    :cond_48
    const/4 v6, 0x4

    .line 143
    invoke-virtual {v4, v6}, Ll/dfw0;->d(I)I

    move-result v3

    .line 144
    invoke-virtual {v4, v6}, Ll/dfw0;->d(I)I

    move-result v8

    const/16 v43, 0x1

    add-int/lit8 v3, v3, 0x1

    .line 145
    invoke-virtual {v4, v3}, Ll/dfw0;->m(I)V

    add-int/lit8 v8, v8, 0x1

    .line 146
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 147
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v3

    if-eqz v3, :cond_49

    const/4 v3, 0x7

    .line 148
    invoke-virtual {v4, v3}, Ll/dfw0;->m(I)V

    goto :goto_31

    :cond_49
    const/4 v3, 0x7

    .line 149
    :goto_31
    invoke-virtual {v4, v3}, Ll/dfw0;->m(I)V

    .line 150
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v3

    if-eqz v3, :cond_4a

    const/4 v8, 0x2

    .line 151
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 152
    :cond_4a
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_4b

    const/4 v8, 0x1

    goto :goto_32

    :cond_4b
    const/4 v8, 0x1

    .line 153
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v14

    if-lez v14, :cond_4c

    .line 154
    :goto_32
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v14

    if-nez v14, :cond_4c

    .line 155
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    :cond_4c
    const/4 v8, 0x3

    if-eqz v3, :cond_4d

    .line 156
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 157
    :cond_4d
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 158
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v3

    const/4 v8, 0x2

    if-ne v11, v8, :cond_4e

    if-eqz v3, :cond_50

    .line 159
    invoke-virtual {v4}, Ll/dfw0;->l()V

    goto :goto_33

    :cond_4e
    const/4 v8, 0x1

    if-ne v11, v8, :cond_50

    :cond_4f
    move/from16 v3, v35

    goto :goto_34

    .line 160
    :cond_50
    :goto_33
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v3

    if-eqz v3, :cond_4f

    const/4 v3, 0x1

    .line 161
    :goto_34
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    move-result v8

    if-eqz v8, :cond_56

    const/16 v8, 0x8

    .line 162
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v11

    .line 163
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v14

    .line 164
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v29

    if-nez v3, :cond_53

    const/4 v8, 0x1

    if-ne v11, v8, :cond_54

    const/16 v3, 0xd

    if-ne v14, v3, :cond_52

    if-nez v29, :cond_51

    move v14, v3

    move v3, v8

    move v11, v3

    goto :goto_36

    :cond_51
    move v14, v3

    :cond_52
    move v11, v8

    goto :goto_35

    :cond_53
    const/4 v8, 0x1

    .line 165
    :cond_54
    :goto_35
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    move-result v3

    .line 166
    :goto_36
    invoke-static {v11}, Ll/wwy0;->a(I)I

    move-result v4

    invoke-virtual {v0, v4}, Ll/dty0;->c(I)Ll/dty0;

    if-ne v3, v8, :cond_55

    const/4 v8, 0x1

    goto :goto_37

    :cond_55
    const/4 v8, 0x2

    .line 167
    :goto_37
    invoke-virtual {v0, v8}, Ll/dty0;->b(I)Ll/dty0;

    invoke-static {v14}, Ll/wwy0;->b(I)I

    move-result v3

    .line 168
    invoke-virtual {v0, v3}, Ll/dty0;->d(I)Ll/dty0;

    .line 169
    :cond_56
    invoke-virtual {v0}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    .line 170
    :goto_38
    iget v3, v0, Ll/wwy0;->c:I

    iget v4, v0, Ll/wwy0;->b:I

    iget v8, v0, Ll/wwy0;->a:I

    iget v11, v0, Ll/wwy0;->f:I

    iget v0, v0, Ll/wwy0;->e:I

    const-string v14, "video/av01"

    move/from16 v47, v0

    move v6, v3

    move/from16 v49, v4

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v46, v11

    move/from16 v61, v12

    move/from16 v63, v13

    move-object v11, v14

    move/from16 v62, v15

    const/4 v15, -0x1

    const/16 v19, 0x5

    goto/16 :goto_24

    :cond_57
    move v0, v6

    const/16 v19, 0x5

    const v6, 0x636c6c69

    if-ne v4, v6, :cond_59

    if-nez v52, :cond_58

    .line 171
    invoke-static {}, Ll/hmr0;->l()Ljava/nio/ByteBuffer;

    move-result-object v52

    :cond_58
    move-object/from16 v3, v52

    const/16 v4, 0x15

    .line 172
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 174
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    move v6, v0

    move-object/from16 v52, v3

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    :goto_39
    const/4 v8, 0x3

    :goto_3a
    const/4 v15, -0x1

    goto/16 :goto_47

    :cond_59
    const v6, 0x6d646376

    if-ne v4, v6, :cond_5b

    if-nez v52, :cond_5a

    .line 175
    invoke-static {}, Ll/hmr0;->l()Ljava/nio/ByteBuffer;

    move-result-object v52

    :cond_5a
    move-object/from16 v3, v52

    .line 176
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v4

    .line 177
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v6

    .line 178
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v8

    move-object/from16 v60, v9

    .line 179
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v9

    move/from16 v61, v12

    .line 180
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v12

    move/from16 v62, v15

    .line 181
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v15

    move/from16 v63, v13

    .line 182
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v13

    move/from16 v64, v7

    .line 183
    invoke-virtual {v1}, Ll/bgw0;->d()S

    move-result v7

    .line 184
    invoke-virtual {v1}, Ll/bgw0;->J()J

    move-result-wide v65

    .line 185
    invoke-virtual {v1}, Ll/bgw0;->J()J

    move-result-wide v67

    move-object/from16 v69, v2

    const/4 v2, 0x1

    .line 186
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 187
    invoke-virtual {v3, v12}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 188
    invoke-virtual {v3, v15}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 189
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 190
    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 191
    invoke-virtual {v3, v8}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 192
    invoke-virtual {v3, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 193
    invoke-virtual {v3, v13}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 194
    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const-wide/16 v6, 0x2710

    div-long v8, v65, v6

    long-to-int v2, v8

    int-to-short v2, v2

    .line 195
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    div-long v6, v67, v6

    long-to-int v2, v6

    int-to-short v2, v2

    .line 196
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    move v6, v0

    move-object/from16 v52, v3

    :goto_3b
    move-object/from16 v2, v69

    goto :goto_39

    :cond_5b
    move-object/from16 v69, v2

    move/from16 v64, v7

    move-object/from16 v60, v9

    move/from16 v61, v12

    move/from16 v63, v13

    move/from16 v62, v15

    const v2, 0x64323633

    if-ne v4, v2, :cond_5d

    if-nez v11, :cond_5c

    const/4 v9, 0x1

    :goto_3c
    const/4 v2, 0x0

    goto :goto_3d

    :cond_5c
    move/from16 v9, v35

    goto :goto_3c

    .line 197
    :goto_3d
    invoke-static {v9, v2}, Ll/ter0;->b(ZLjava/lang/String;)V

    move v6, v0

    move-object/from16 v11, v39

    goto :goto_3b

    :cond_5d
    const/4 v2, 0x0

    const v6, 0x65736473

    if-ne v4, v6, :cond_60

    if-nez v11, :cond_5e

    const/4 v9, 0x1

    goto :goto_3e

    :cond_5e
    move/from16 v9, v35

    .line 198
    :goto_3e
    invoke-static {v9, v2}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 199
    invoke-static {v1, v8}, Ll/hmr0;->j(Ll/bgw0;I)Ll/bmr0;

    move-result-object v2

    invoke-static {v2}, Ll/bmr0;->c(Ll/bmr0;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Ll/bmr0;->d(Ll/bmr0;)[B

    move-result-object v4

    if-eqz v4, :cond_5f

    .line 200
    invoke-static {v4}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v4

    move v6, v0

    move-object/from16 v53, v2

    move-object v11, v3

    move-object/from16 v51, v4

    goto :goto_3b

    :cond_5f
    move v6, v0

    move-object/from16 v53, v2

    move-object v11, v3

    goto :goto_3b

    :cond_60
    const v2, 0x70617370

    if-ne v4, v2, :cond_61

    add-int/lit8 v8, v8, 0x8

    .line 201
    invoke-virtual {v1, v8}, Ll/bgw0;->k(I)V

    .line 202
    invoke-virtual {v1}, Ll/bgw0;->E()I

    move-result v2

    .line 203
    invoke-virtual {v1}, Ll/bgw0;->E()I

    move-result v3

    int-to-float v2, v2

    int-to-float v3, v3

    div-float/2addr v2, v3

    move v6, v0

    move/from16 v62, v2

    move-object/from16 v2, v69

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v48, 0x1

    goto/16 :goto_47

    :cond_61
    const v2, 0x73763364

    if-ne v4, v2, :cond_64

    add-int/lit8 v2, v8, 0x8

    :goto_3f
    sub-int v3, v2, v8

    if-ge v3, v10, :cond_63

    .line 204
    invoke-virtual {v1, v2}, Ll/bgw0;->k(I)V

    .line 205
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v3

    add-int/2addr v3, v2

    .line 206
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v4

    const v6, 0x70726f6a

    if-ne v4, v6, :cond_62

    invoke-virtual {v1}, Ll/bgw0;->m()[B

    move-result-object v4

    .line 207
    invoke-static {v4, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v2

    move v6, v0

    move-object/from16 v55, v2

    goto/16 :goto_3b

    :cond_62
    move v2, v3

    goto :goto_3f

    :cond_63
    move v6, v0

    move-object/from16 v2, v69

    const/4 v8, 0x3

    const/4 v15, -0x1

    const/16 v55, 0x0

    goto/16 :goto_47

    :cond_64
    const v2, 0x73743364

    if-ne v4, v2, :cond_6a

    .line 208
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v2

    const/4 v8, 0x3

    .line 209
    invoke-virtual {v1, v8}, Ll/bgw0;->l(I)V

    if-nez v2, :cond_65

    .line 210
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v2

    if-eqz v2, :cond_69

    const/4 v6, 0x1

    if-eq v2, v6, :cond_68

    const/4 v6, 0x2

    if-eq v2, v6, :cond_67

    if-eq v2, v8, :cond_66

    :cond_65
    const/4 v15, -0x1

    goto/16 :goto_46

    :cond_66
    move v6, v0

    move/from16 v54, v8

    :goto_40
    move-object/from16 v2, v69

    goto/16 :goto_3a

    :cond_67
    move v6, v0

    move-object/from16 v2, v69

    const/4 v15, -0x1

    const/16 v54, 0x2

    goto/16 :goto_47

    :cond_68
    move v6, v0

    move-object/from16 v2, v69

    const/4 v15, -0x1

    const/16 v54, 0x1

    goto/16 :goto_47

    :cond_69
    move v6, v0

    move/from16 v54, v35

    goto :goto_40

    :cond_6a
    const/4 v8, 0x3

    const v2, 0x636f6c72

    if-ne v4, v2, :cond_65

    const/4 v15, -0x1

    if-ne v14, v15, :cond_71

    if-ne v0, v15, :cond_70

    .line 211
    invoke-virtual {v1}, Ll/bgw0;->v()I

    move-result v0

    const v2, 0x6e636c78

    if-eq v0, v2, :cond_6c

    const v2, 0x6e636c63

    if-ne v0, v2, :cond_6b

    goto :goto_42

    .line 212
    :cond_6b
    const-string v2, "Unsupported color type: "

    .line 213
    invoke-static {v0}, Ll/zlr0;->b(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    move v6, v15

    move v14, v6

    :goto_41
    move-object/from16 v2, v69

    goto :goto_47

    .line 214
    :cond_6c
    :goto_42
    invoke-virtual {v1}, Ll/bgw0;->F()I

    move-result v0

    .line 215
    invoke-virtual {v1}, Ll/bgw0;->F()I

    move-result v2

    const/4 v6, 0x2

    .line 216
    invoke-virtual {v1, v6}, Ll/bgw0;->l(I)V

    const/16 v3, 0x13

    if-ne v10, v3, :cond_6e

    .line 217
    invoke-virtual {v1}, Ll/bgw0;->B()I

    move-result v4

    and-int/lit16 v4, v4, 0x80

    if-eqz v4, :cond_6d

    move v10, v3

    const/4 v9, 0x1

    goto :goto_43

    :cond_6d
    move v10, v3

    :cond_6e
    move/from16 v9, v35

    .line 218
    :goto_43
    invoke-static {v0}, Ll/wwy0;->a(I)I

    move-result v0

    const/4 v6, 0x1

    if-eq v6, v9, :cond_6f

    const/4 v3, 0x2

    goto :goto_44

    :cond_6f
    const/4 v3, 0x1

    :goto_44
    invoke-static {v2}, Ll/wwy0;->b(I)I

    move-result v2

    move v14, v0

    move v6, v2

    move/from16 v49, v3

    goto :goto_41

    :cond_70
    move v6, v0

    move v14, v15

    goto :goto_41

    .line 219
    :goto_45
    invoke-static {v1}, Ll/ler0;->a(Ll/bgw0;)Ll/ler0;

    move-result-object v2

    if-eqz v2, :cond_71

    iget-object v2, v2, Ll/ler0;->a:Ljava/lang/String;

    const-string v3, "video/dolby-vision"

    move v6, v0

    move-object v11, v3

    goto :goto_47

    :cond_71
    :goto_46
    move v6, v0

    goto :goto_41

    :goto_47
    add-int v10, v57, v10

    move/from16 v4, v56

    move-object/from16 v0, v58

    move/from16 v3, v59

    move-object/from16 v9, v60

    move/from16 v12, v61

    move/from16 v15, v62

    move/from16 v13, v63

    move/from16 v7, v64

    goto/16 :goto_1d

    :goto_48
    if-nez v11, :cond_72

    move-object/from16 v9, v60

    move/from16 v12, v61

    goto/16 :goto_4a

    .line 220
    :cond_72
    new-instance v2, Ll/znr0;

    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 221
    invoke-virtual {v2, v5}, Ll/znr0;->j(I)Ll/znr0;

    .line 222
    invoke-virtual {v2, v11}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    move-object/from16 v3, v69

    .line 223
    invoke-virtual {v2, v3}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    move/from16 v3, v64

    .line 224
    invoke-virtual {v2, v3}, Ll/znr0;->C(I)Ll/znr0;

    move/from16 v3, v63

    .line 225
    invoke-virtual {v2, v3}, Ll/znr0;->i(I)Ll/znr0;

    move/from16 v3, v62

    .line 226
    invoke-virtual {v2, v3}, Ll/znr0;->s(F)Ll/znr0;

    move/from16 v12, v61

    .line 227
    invoke-virtual {v2, v12}, Ll/znr0;->v(I)Ll/znr0;

    move-object/from16 v3, v55

    .line 228
    invoke-virtual {v2, v3}, Ll/znr0;->t([B)Ll/znr0;

    move/from16 v3, v54

    .line 229
    invoke-virtual {v2, v3}, Ll/znr0;->z(I)Ll/znr0;

    move-object/from16 v3, v51

    .line 230
    invoke-virtual {v2, v3}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    move-object/from16 v3, v50

    .line 231
    invoke-virtual {v2, v3}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    new-instance v3, Ll/dty0;

    invoke-direct {v3}, Ll/dty0;-><init>()V

    .line 232
    invoke-virtual {v3, v14}, Ll/dty0;->c(I)Ll/dty0;

    move/from16 v4, v49

    .line 233
    invoke-virtual {v3, v4}, Ll/dty0;->b(I)Ll/dty0;

    .line 234
    invoke-virtual {v3, v0}, Ll/dty0;->d(I)Ll/dty0;

    if-eqz v52, :cond_73

    .line 235
    invoke-virtual/range {v52 .. v52}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    goto :goto_49

    :cond_73
    const/4 v0, 0x0

    :goto_49
    invoke-virtual {v3, v0}, Ll/dty0;->e([B)Ll/dty0;

    move/from16 v0, v47

    .line 236
    invoke-virtual {v3, v0}, Ll/dty0;->f(I)Ll/dty0;

    move/from16 v0, v46

    .line 237
    invoke-virtual {v3, v0}, Ll/dty0;->a(I)Ll/dty0;

    .line 238
    invoke-virtual {v3}, Ll/dty0;->g()Ll/wwy0;

    move-result-object v0

    .line 239
    invoke-virtual {v2, v0}, Ll/znr0;->a(Ll/wwy0;)Ll/znr0;

    if-eqz v53, :cond_74

    invoke-static/range {v53 .. v53}, Ll/bmr0;->a(Ll/bmr0;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ll/utw0;->c(J)I

    move-result v0

    .line 240
    invoke-virtual {v2, v0}, Ll/znr0;->j0(I)Ll/znr0;

    invoke-static/range {v53 .. v53}, Ll/bmr0;->b(Ll/bmr0;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ll/utw0;->c(J)I

    move-result v0

    .line 241
    invoke-virtual {v2, v0}, Ll/znr0;->r(I)Ll/znr0;

    .line 242
    :cond_74
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    move-result-object v0

    move-object/from16 v9, v60

    iput-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    :goto_4a
    add-int v3, v41, v56

    .line 243
    invoke-virtual {v1, v3}, Ll/bgw0;->k(I)V

    add-int/lit8 v10, v42, 0x1

    move-object/from16 v0, p0

    move v2, v12

    move-object/from16 v12, v16

    move/from16 v8, v18

    move-object/from16 v6, v28

    move/from16 v3, v30

    move/from16 v13, v31

    move-object/from16 v11, v40

    move-object/from16 v15, v44

    move-object/from16 v14, v45

    const v4, 0x7374626c

    const/16 v7, 0xc

    const v18, 0x6d696e66

    goto/16 :goto_e

    :cond_75
    move/from16 v30, v3

    move-object/from16 v40, v11

    move-object/from16 v16, v12

    move/from16 v31, v13

    move-object/from16 v45, v14

    move-object/from16 v44, v15

    const/16 v35, 0x0

    if-nez p5, :cond_7c

    const v0, 0x65647473

    move-object/from16 v1, v45

    .line 244
    invoke-virtual {v1, v0}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v0

    if-eqz v0, :cond_7b

    const v2, 0x656c7374

    .line 245
    invoke-virtual {v0, v2}, Ll/xlr0;->d(I)Ll/ylr0;

    move-result-object v0

    if-nez v0, :cond_76

    const/4 v2, 0x0

    goto :goto_4e

    .line 246
    :cond_76
    iget-object v0, v0, Ll/ylr0;->b:Ll/bgw0;

    const/16 v8, 0x8

    .line 247
    invoke-virtual {v0, v8}, Ll/bgw0;->k(I)V

    .line 248
    invoke-virtual {v0}, Ll/bgw0;->v()I

    move-result v2

    invoke-static {v2}, Ll/zlr0;->a(I)I

    move-result v2

    .line 249
    invoke-virtual {v0}, Ll/bgw0;->E()I

    move-result v3

    new-array v4, v3, [J

    new-array v5, v3, [J

    move/from16 v6, v35

    :goto_4b
    if-ge v6, v3, :cond_7a

    const/4 v8, 0x1

    if-ne v2, v8, :cond_77

    .line 250
    invoke-virtual {v0}, Ll/bgw0;->K()J

    move-result-wide v10

    goto :goto_4c

    :cond_77
    invoke-virtual {v0}, Ll/bgw0;->J()J

    move-result-wide v10

    :goto_4c
    aput-wide v10, v4, v6

    if-ne v2, v8, :cond_78

    .line 251
    invoke-virtual {v0}, Ll/bgw0;->I()J

    move-result-wide v10

    goto :goto_4d

    :cond_78
    invoke-virtual {v0}, Ll/bgw0;->v()I

    move-result v7

    int-to-long v10, v7

    :goto_4d
    aput-wide v10, v5, v6

    .line 252
    invoke-virtual {v0}, Ll/bgw0;->d()S

    move-result v7

    if-ne v7, v8, :cond_79

    const/4 v7, 0x2

    .line 253
    invoke-virtual {v0, v7}, Ll/bgw0;->l(I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_4b

    .line 254
    :cond_79
    const-string v0, "Unsupported media rate."

    .line 255
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/16 v17, 0x0

    return-object v17

    .line 256
    :cond_7a
    invoke-static {v4, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    :goto_4e
    if-eqz v2, :cond_7b

    .line 257
    iget-object v0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, [J

    .line 258
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, [J

    move-object/from16 v29, v0

    goto :goto_50

    :cond_7b
    :goto_4f
    const/4 v2, 0x0

    const/16 v29, 0x0

    goto :goto_50

    :cond_7c
    move-object/from16 v1, v45

    goto :goto_4f

    :goto_50
    iget-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    if-nez v0, :cond_7d

    move-object/from16 v0, p7

    const/4 v15, 0x0

    goto :goto_51

    :cond_7d
    move-object/from16 v0, v16

    new-instance v16, Ll/hnr0;

    invoke-static {v0}, Ll/gmr0;->a(Ll/gmr0;)I

    move-result v17

    move-object/from16 v0, v44

    .line 259
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    .line 260
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    iget-object v0, v9, Ll/dmr0;->b:Ll/sqr0;

    iget v3, v9, Ll/dmr0;->d:I

    iget-object v4, v9, Ll/dmr0;->a:[Ll/inr0;

    iget v5, v9, Ll/dmr0;->c:I

    move-object/from16 v25, v0

    move/from16 v28, v5

    move-wide/from16 v23, v26

    move/from16 v18, v30

    move-wide/from16 v21, v36

    move-object/from16 v30, v2

    move/from16 v26, v3

    move-object/from16 v27, v4

    invoke-direct/range {v16 .. v30}, Ll/hnr0;-><init>(IIJJJLl/sqr0;I[Ll/inr0;I[J[J)V

    move-object/from16 v0, p7

    move-object/from16 v15, v16

    .line 261
    :goto_51
    invoke-interface {v0, v15}, Ll/eow0;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/hnr0;

    if-eqz v2, :cond_7e

    const v3, 0x6d646961

    .line 262
    invoke-virtual {v1, v3}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v1

    .line 263
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v3, 0x6d696e66

    .line 264
    invoke-virtual {v1, v3}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v1

    .line 265
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v4, 0x7374626c

    .line 266
    invoke-virtual {v1, v4}, Ll/xlr0;->c(I)Ll/xlr0;

    move-result-object v1

    .line 267
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v3, p1

    .line 268
    invoke-static {v2, v1, v3}, Ll/hmr0;->k(Ll/hnr0;Ll/xlr0;Ll/rfr0;)Ll/knr0;

    move-result-object v1

    move-object/from16 v2, v40

    .line 269
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_52

    :cond_7e
    move-object/from16 v3, p1

    move-object/from16 v2, v40

    :goto_52
    add-int/lit8 v13, v31, 0x1

    move-object/from16 v0, p0

    move-object v11, v2

    goto/16 :goto_0

    .line 270
    :cond_7f
    const-string v0, "Malformed sample table (stbl) missing sample description (stsd)"

    const/4 v2, 0x0

    .line 271
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    move-result-object v0

    throw v0

    :cond_80
    move-object v2, v11

    return-object v2
.end method

.method public static e(Ll/bgw0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-virtual {p0, v1}, Ll/bgw0;->l(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const v2, 0x68646c72    # 4.3148E24f

    .line 14
    .line 15
    .line 16
    if-eq v1, v2, :cond_0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x4

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static f(Ll/bgw0;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v1, v0, 0x7f

    .line 6
    .line 7
    :goto_0
    const/16 v2, 0x80

    .line 8
    .line 9
    and-int/2addr v0, v2

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    shl-int/lit8 v1, v1, 0x7

    .line 17
    .line 18
    and-int/lit8 v2, v0, 0x7f

    .line 19
    .line 20
    or-int/2addr v1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return v1
.end method

.method public static g(Ll/bgw0;)I
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static h(Ll/bgw0;II)Landroid/util/Pair;
    .locals 17
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    :goto_0
    sub-int v2, v1, p1

    .line 8
    .line 9
    move/from16 v4, p2

    .line 10
    .line 11
    if-ge v2, v4, :cond_11

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v5, 0x1

    .line 21
    const/4 v6, 0x0

    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    move v7, v5

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    move v7, v6

    .line 27
    :goto_1
    const-string v8, "childAtomSize must be positive"

    .line 28
    .line 29
    invoke-static {v7, v8}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    const v8, 0x73696e66

    .line 37
    .line 38
    .line 39
    if-ne v7, v8, :cond_10

    .line 40
    .line 41
    add-int/lit8 v7, v1, 0x8

    .line 42
    .line 43
    const/4 v8, -0x1

    .line 44
    move v12, v6

    .line 45
    move v9, v8

    .line 46
    const/4 v10, 0x0

    .line 47
    const/4 v11, 0x0

    .line 48
    :goto_2
    sub-int v13, v7, v1

    .line 49
    .line 50
    const/4 v14, 0x4

    .line 51
    if-ge v13, v2, :cond_4

    .line 52
    .line 53
    invoke-virtual {v0, v7}, Ll/bgw0;->k(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 57
    .line 58
    .line 59
    move-result v13

    .line 60
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 61
    .line 62
    .line 63
    move-result v15

    .line 64
    const/16 v16, 0x0

    .line 65
    .line 66
    const v3, 0x66726d61

    .line 67
    .line 68
    .line 69
    if-ne v15, v3, :cond_1

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    goto :goto_3

    .line 80
    :cond_1
    const v3, 0x7363686d

    .line 81
    .line 82
    .line 83
    if-ne v15, v3, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0, v14}, Ll/bgw0;->l(I)V

    .line 86
    .line 87
    .line 88
    sget-object v3, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 89
    .line 90
    invoke-virtual {v0, v14, v3}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v11

    .line 94
    goto :goto_3

    .line 95
    :cond_2
    const v3, 0x73636869

    .line 96
    .line 97
    .line 98
    if-ne v15, v3, :cond_3

    .line 99
    .line 100
    move v9, v7

    .line 101
    move v12, v13

    .line 102
    :cond_3
    :goto_3
    add-int/2addr v7, v13

    .line 103
    goto :goto_2

    .line 104
    :cond_4
    const/16 v16, 0x0

    .line 105
    .line 106
    const-string v3, "cenc"

    .line 107
    .line 108
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-nez v3, :cond_6

    .line 113
    .line 114
    const-string v3, "cbc1"

    .line 115
    .line 116
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-nez v3, :cond_6

    .line 121
    .line 122
    const-string v3, "cens"

    .line 123
    .line 124
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-nez v3, :cond_6

    .line 129
    .line 130
    const-string v3, "cbcs"

    .line 131
    .line 132
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_5

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_5
    move-object/from16 v3, v16

    .line 140
    .line 141
    goto/16 :goto_c

    .line 142
    .line 143
    :cond_6
    :goto_4
    if-eqz v10, :cond_7

    .line 144
    .line 145
    move v3, v5

    .line 146
    goto :goto_5

    .line 147
    :cond_7
    move v3, v6

    .line 148
    :goto_5
    const-string v7, "frma atom is mandatory"

    .line 149
    .line 150
    invoke-static {v3, v7}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    if-eq v9, v8, :cond_8

    .line 154
    .line 155
    move v3, v5

    .line 156
    goto :goto_6

    .line 157
    :cond_8
    move v3, v6

    .line 158
    :goto_6
    const-string v7, "schi atom is mandatory"

    .line 159
    .line 160
    invoke-static {v3, v7}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    add-int/lit8 v3, v9, 0x8

    .line 164
    .line 165
    :goto_7
    sub-int v7, v3, v9

    .line 166
    .line 167
    if-ge v7, v12, :cond_d

    .line 168
    .line 169
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    const v13, 0x74656e63

    .line 181
    .line 182
    .line 183
    if-ne v8, v13, :cond_c

    .line 184
    .line 185
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    invoke-static {v3}, Ll/zlr0;->a(I)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    invoke-virtual {v0, v5}, Ll/bgw0;->l(I)V

    .line 194
    .line 195
    .line 196
    if-nez v3, :cond_9

    .line 197
    .line 198
    invoke-virtual {v0, v5}, Ll/bgw0;->l(I)V

    .line 199
    .line 200
    .line 201
    move v14, v6

    .line 202
    move v15, v14

    .line 203
    goto :goto_8

    .line 204
    :cond_9
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    and-int/lit16 v7, v3, 0xf0

    .line 209
    .line 210
    shr-int/2addr v7, v14

    .line 211
    and-int/lit8 v3, v3, 0xf

    .line 212
    .line 213
    move v15, v3

    .line 214
    move v14, v7

    .line 215
    :goto_8
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-ne v3, v5, :cond_a

    .line 220
    .line 221
    move-object v3, v10

    .line 222
    move v10, v5

    .line 223
    goto :goto_9

    .line 224
    :cond_a
    move-object v3, v10

    .line 225
    move v10, v6

    .line 226
    :goto_9
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 227
    .line 228
    .line 229
    move-result v12

    .line 230
    const/16 v7, 0x10

    .line 231
    .line 232
    new-array v13, v7, [B

    .line 233
    .line 234
    invoke-virtual {v0, v13, v6, v7}, Ll/bgw0;->g([BII)V

    .line 235
    .line 236
    .line 237
    if-eqz v10, :cond_b

    .line 238
    .line 239
    if-nez v12, :cond_b

    .line 240
    .line 241
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    new-array v8, v7, [B

    .line 246
    .line 247
    invoke-virtual {v0, v8, v6, v7}, Ll/bgw0;->g([BII)V

    .line 248
    .line 249
    .line 250
    move-object/from16 v16, v8

    .line 251
    .line 252
    :cond_b
    new-instance v9, Ll/inr0;

    .line 253
    .line 254
    move-object v8, v3

    .line 255
    invoke-direct/range {v9 .. v16}, Ll/inr0;-><init>(ZLjava/lang/String;I[BII[B)V

    .line 256
    .line 257
    .line 258
    move-object v3, v9

    .line 259
    goto :goto_a

    .line 260
    :cond_c
    move-object v8, v10

    .line 261
    add-int/2addr v3, v7

    .line 262
    goto :goto_7

    .line 263
    :cond_d
    move-object v8, v10

    .line 264
    move-object/from16 v3, v16

    .line 265
    .line 266
    :goto_a
    if-eqz v3, :cond_e

    .line 267
    .line 268
    goto :goto_b

    .line 269
    :cond_e
    move v5, v6

    .line 270
    :goto_b
    const-string v6, "tenc atom is mandatory"

    .line 271
    .line 272
    invoke-static {v5, v6}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 273
    .line 274
    .line 275
    sget v5, Ll/mpw0;->a:I

    .line 276
    .line 277
    invoke-static {v8, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    :goto_c
    if-nez v3, :cond_f

    .line 282
    .line 283
    goto :goto_d

    .line 284
    :cond_f
    return-object v3

    .line 285
    :cond_10
    :goto_d
    add-int/2addr v1, v2

    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :cond_11
    const/16 v16, 0x0

    .line 289
    .line 290
    return-object v16
.end method

.method public static i(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzby;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->d()S

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-virtual {p0, v1}, Ll/bgw0;->l(I)V

    .line 7
    .line 8
    .line 9
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v0, 0x2b

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x2d

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    :try_start_0
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    add-int/lit8 v3, v3, -0x1

    .line 45
    .line 46
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    new-instance v0, Lcom/google/android/gms/internal/ads/zzby;

    .line 55
    .line 56
    new-instance v3, Lcom/google/android/gms/internal/ads/zzgf;

    .line 57
    .line 58
    invoke-direct {v3, v2, p0}, Lcom/google/android/gms/internal/ads/zzgf;-><init>(FF)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    new-array p0, p0, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 63
    .line 64
    aput-object v3, p0, v1

    .line 65
    .line 66
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    invoke-direct {v0, v1, v2, p0}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    return-object v0

    .line 75
    :catch_0
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public static j(Ll/bgw0;I)Ll/bmr0;
    .locals 9

    .line 1
    add-int/lit8 p1, p1, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bgw0;->k(I)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Ll/bgw0;->l(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/hmr0;->f(Ll/bgw0;)I

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    and-int/lit16 v2, v1, 0x80

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    and-int/lit8 v2, v1, 0x40

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p0, v2}, Ll/bgw0;->l(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    and-int/lit8 v1, v1, 0x20

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {p0, p1}, Ll/bgw0;->l(I)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Ll/hmr0;->f(Ll/bgw0;)I

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v0}, Ll/a8t0;->d(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v0, "audio/mpeg"

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    const-string v0, "audio/vnd.dts"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_6

    .line 75
    .line 76
    const-string v0, "audio/vnd.dts.hd"

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    const/4 v0, 0x4

    .line 86
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    invoke-virtual {p0, p1}, Ll/bgw0;->l(I)V

    .line 98
    .line 99
    .line 100
    invoke-static {p0}, Ll/hmr0;->f(Ll/bgw0;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    move-wide v4, v3

    .line 105
    new-array v3, p1, [B

    .line 106
    .line 107
    const/4 v6, 0x0

    .line 108
    invoke-virtual {p0, v3, v6, p1}, Ll/bgw0;->g([BII)V

    .line 109
    .line 110
    .line 111
    const-wide/16 p0, 0x0

    .line 112
    .line 113
    cmp-long v6, v4, p0

    .line 114
    .line 115
    const-wide/16 v7, -0x1

    .line 116
    .line 117
    if-gtz v6, :cond_4

    .line 118
    .line 119
    move-wide v4, v7

    .line 120
    :cond_4
    cmp-long p0, v0, p0

    .line 121
    .line 122
    if-lez p0, :cond_5

    .line 123
    .line 124
    move-wide v6, v0

    .line 125
    goto :goto_0

    .line 126
    :cond_5
    move-wide v6, v7

    .line 127
    :goto_0
    new-instance v1, Ll/bmr0;

    .line 128
    .line 129
    invoke-direct/range {v1 .. v7}, Ll/bmr0;-><init>(Ljava/lang/String;[BJJ)V

    .line 130
    .line 131
    .line 132
    return-object v1

    .line 133
    :cond_6
    :goto_1
    new-instance v1, Ll/bmr0;

    .line 134
    .line 135
    const/4 v3, 0x0

    .line 136
    const-wide/16 v4, -0x1

    .line 137
    .line 138
    move-wide v6, v4

    .line 139
    invoke-direct/range {v1 .. v7}, Ll/bmr0;-><init>(Ljava/lang/String;[BJJ)V

    .line 140
    .line 141
    .line 142
    return-object v1
.end method

.method public static k(Ll/hnr0;Ll/xlr0;Ll/rfr0;)Ll/knr0;
    .locals 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const v3, 0x7374737a

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v3}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    const/4 v4, 0x0

    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    iget-object v5, v1, Ll/hnr0;->f:Ll/sqr0;

    .line 16
    .line 17
    new-instance v6, Ll/emr0;

    .line 18
    .line 19
    invoke-direct {v6, v3, v5}, Ll/emr0;-><init>(Ll/ylr0;Ll/sqr0;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const v3, 0x73747a32

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v3}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_3b

    .line 31
    .line 32
    new-instance v6, Ll/fmr0;

    .line 33
    .line 34
    invoke-direct {v6, v3}, Ll/fmr0;-><init>(Ll/ylr0;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-interface {v6}, Ll/cmr0;->zzb()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v5, 0x0

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    new-instance v0, Ll/knr0;

    .line 45
    .line 46
    new-array v2, v5, [J

    .line 47
    .line 48
    new-array v3, v5, [I

    .line 49
    .line 50
    new-array v4, v5, [J

    .line 51
    .line 52
    new-array v6, v5, [I

    .line 53
    .line 54
    const-wide/16 v7, 0x0

    .line 55
    .line 56
    move-object v5, v4

    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct/range {v0 .. v8}, Ll/knr0;-><init>(Ll/hnr0;[J[II[J[IJ)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_1
    const v7, 0x7374636f

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v7}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    if-nez v7, :cond_2

    .line 70
    .line 71
    const v7, 0x636f3634

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v7}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    const/4 v9, 0x1

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    move v9, v5

    .line 84
    :goto_1
    const v10, 0x73747363

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v10}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    .line 93
    .line 94
    const v11, 0x73747473

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v11}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    const v12, 0x73747373

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v12}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 108
    .line 109
    .line 110
    move-result-object v12

    .line 111
    if-eqz v12, :cond_3

    .line 112
    .line 113
    iget-object v12, v12, Ll/ylr0;->b:Ll/bgw0;

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_3
    move-object v12, v4

    .line 117
    :goto_2
    const v13, 0x63747473

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v13}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    iget-object v0, v0, Ll/ylr0;->b:Ll/bgw0;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_4
    move-object v0, v4

    .line 130
    :goto_3
    iget-object v11, v11, Ll/ylr0;->b:Ll/bgw0;

    .line 131
    .line 132
    iget-object v10, v10, Ll/ylr0;->b:Ll/bgw0;

    .line 133
    .line 134
    iget-object v7, v7, Ll/ylr0;->b:Ll/bgw0;

    .line 135
    .line 136
    new-instance v13, Ll/amr0;

    .line 137
    .line 138
    invoke-direct {v13, v10, v7, v9}, Ll/amr0;-><init>(Ll/bgw0;Ll/bgw0;Z)V

    .line 139
    .line 140
    .line 141
    const/16 v7, 0xc

    .line 142
    .line 143
    invoke-virtual {v11, v7}, Ll/bgw0;->k(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v11}, Ll/bgw0;->E()I

    .line 147
    .line 148
    .line 149
    move-result v9

    .line 150
    const/4 v10, -0x1

    .line 151
    add-int/2addr v9, v10

    .line 152
    invoke-virtual {v11}, Ll/bgw0;->E()I

    .line 153
    .line 154
    .line 155
    move-result v14

    .line 156
    invoke-virtual {v11}, Ll/bgw0;->E()I

    .line 157
    .line 158
    .line 159
    move-result v15

    .line 160
    if-eqz v0, :cond_5

    .line 161
    .line 162
    invoke-virtual {v0, v7}, Ll/bgw0;->k(I)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 166
    .line 167
    .line 168
    move-result v16

    .line 169
    goto :goto_4

    .line 170
    :cond_5
    move/from16 v16, v5

    .line 171
    .line 172
    :goto_4
    if-eqz v12, :cond_7

    .line 173
    .line 174
    invoke-virtual {v12, v7}, Ll/bgw0;->k(I)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v12}, Ll/bgw0;->E()I

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    if-lez v7, :cond_6

    .line 182
    .line 183
    invoke-virtual {v12}, Ll/bgw0;->E()I

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    add-int/2addr v4, v10

    .line 188
    move/from16 v17, v5

    .line 189
    .line 190
    goto :goto_6

    .line 191
    :cond_6
    move-object v12, v4

    .line 192
    move/from16 v17, v5

    .line 193
    .line 194
    :goto_5
    move v4, v10

    .line 195
    goto :goto_6

    .line 196
    :cond_7
    move v7, v5

    .line 197
    move/from16 v17, v7

    .line 198
    .line 199
    goto :goto_5

    .line 200
    :goto_6
    invoke-interface {v6}, Ll/cmr0;->zza()I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    const/16 v18, 0x1

    .line 205
    .line 206
    iget-object v8, v1, Ll/hnr0;->f:Ll/sqr0;

    .line 207
    .line 208
    iget-object v8, v8, Ll/sqr0;->l:Ljava/lang/String;

    .line 209
    .line 210
    move-object/from16 v19, v6

    .line 211
    .line 212
    move/from16 p1, v7

    .line 213
    .line 214
    move/from16 v20, v10

    .line 215
    .line 216
    if-eq v5, v10, :cond_8

    .line 217
    .line 218
    const-string v10, "audio/raw"

    .line 219
    .line 220
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v10

    .line 224
    if-nez v10, :cond_9

    .line 225
    .line 226
    const-string v10, "audio/g711-mlaw"

    .line 227
    .line 228
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    if-nez v10, :cond_9

    .line 233
    .line 234
    const-string v10, "audio/g711-alaw"

    .line 235
    .line 236
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v8

    .line 240
    if-eqz v8, :cond_8

    .line 241
    .line 242
    goto :goto_7

    .line 243
    :cond_8
    const-wide/16 v21, 0x0

    .line 244
    .line 245
    goto/16 :goto_d

    .line 246
    .line 247
    :cond_9
    :goto_7
    if-nez v9, :cond_8

    .line 248
    .line 249
    if-nez v16, :cond_e

    .line 250
    .line 251
    if-nez p1, :cond_e

    .line 252
    .line 253
    iget v0, v13, Ll/amr0;->a:I

    .line 254
    .line 255
    new-array v4, v0, [J

    .line 256
    .line 257
    new-array v8, v0, [I

    .line 258
    .line 259
    :goto_8
    invoke-virtual {v13}, Ll/amr0;->a()Z

    .line 260
    .line 261
    .line 262
    move-result v9

    .line 263
    if-eqz v9, :cond_a

    .line 264
    .line 265
    iget v9, v13, Ll/amr0;->b:I

    .line 266
    .line 267
    iget-wide v10, v13, Ll/amr0;->d:J

    .line 268
    .line 269
    aput-wide v10, v4, v9

    .line 270
    .line 271
    iget v10, v13, Ll/amr0;->c:I

    .line 272
    .line 273
    aput v10, v8, v9

    .line 274
    .line 275
    goto :goto_8

    .line 276
    :cond_a
    int-to-long v9, v15

    .line 277
    const/16 v11, 0x2000

    .line 278
    .line 279
    div-int/2addr v11, v5

    .line 280
    move/from16 v12, v17

    .line 281
    .line 282
    move v13, v12

    .line 283
    :goto_9
    if-ge v12, v0, :cond_b

    .line 284
    .line 285
    aget v14, v8, v12

    .line 286
    .line 287
    sget v15, Ll/mpw0;->a:I

    .line 288
    .line 289
    add-int/2addr v14, v11

    .line 290
    add-int/lit8 v14, v14, -0x1

    .line 291
    .line 292
    div-int/2addr v14, v11

    .line 293
    add-int/2addr v13, v14

    .line 294
    add-int/lit8 v12, v12, 0x1

    .line 295
    .line 296
    goto :goto_9

    .line 297
    :cond_b
    new-array v12, v13, [J

    .line 298
    .line 299
    new-array v14, v13, [I

    .line 300
    .line 301
    new-array v15, v13, [J

    .line 302
    .line 303
    new-array v13, v13, [I

    .line 304
    .line 305
    move/from16 v6, v17

    .line 306
    .line 307
    move v7, v6

    .line 308
    move/from16 v16, v7

    .line 309
    .line 310
    move/from16 v19, v16

    .line 311
    .line 312
    const-wide/16 v21, 0x0

    .line 313
    .line 314
    :goto_a
    if-ge v6, v0, :cond_d

    .line 315
    .line 316
    aget v20, v8, v6

    .line 317
    .line 318
    aget-wide v23, v4, v6

    .line 319
    .line 320
    move/from16 v25, v19

    .line 321
    .line 322
    move/from16 v19, v0

    .line 323
    .line 324
    move/from16 v0, v16

    .line 325
    .line 326
    move/from16 v16, v25

    .line 327
    .line 328
    move-wide/from16 v24, v23

    .line 329
    .line 330
    move-object/from16 v23, v4

    .line 331
    .line 332
    move/from16 v4, v20

    .line 333
    .line 334
    :goto_b
    if-lez v4, :cond_c

    .line 335
    .line 336
    invoke-static {v11, v4}, Ljava/lang/Math;->min(II)I

    .line 337
    .line 338
    .line 339
    move-result v20

    .line 340
    aput-wide v24, v12, v16

    .line 341
    .line 342
    move/from16 p1, v4

    .line 343
    .line 344
    mul-int v4, v5, v20

    .line 345
    .line 346
    aput v4, v14, v16

    .line 347
    .line 348
    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    move/from16 v26, v5

    .line 353
    .line 354
    int-to-long v4, v7

    .line 355
    mul-long/2addr v4, v9

    .line 356
    aput-wide v4, v15, v16

    .line 357
    .line 358
    aput v18, v13, v16

    .line 359
    .line 360
    aget v4, v14, v16

    .line 361
    .line 362
    int-to-long v4, v4

    .line 363
    add-long v24, v24, v4

    .line 364
    .line 365
    add-int v7, v7, v20

    .line 366
    .line 367
    sub-int v4, p1, v20

    .line 368
    .line 369
    add-int/lit8 v16, v16, 0x1

    .line 370
    .line 371
    move/from16 v5, v26

    .line 372
    .line 373
    goto :goto_b

    .line 374
    :cond_c
    move/from16 v26, v5

    .line 375
    .line 376
    add-int/lit8 v6, v6, 0x1

    .line 377
    .line 378
    move/from16 v4, v16

    .line 379
    .line 380
    move/from16 v16, v0

    .line 381
    .line 382
    move/from16 v0, v19

    .line 383
    .line 384
    move/from16 v19, v4

    .line 385
    .line 386
    move-object/from16 v4, v23

    .line 387
    .line 388
    goto :goto_a

    .line 389
    :cond_d
    int-to-long v4, v7

    .line 390
    mul-long/2addr v9, v4

    .line 391
    move-wide v4, v9

    .line 392
    :goto_c
    move-object v2, v12

    .line 393
    goto/16 :goto_1f

    .line 394
    .line 395
    :cond_e
    const-wide/16 v21, 0x0

    .line 396
    .line 397
    move/from16 v9, v17

    .line 398
    .line 399
    :goto_d
    new-array v5, v3, [J

    .line 400
    .line 401
    new-array v6, v3, [I

    .line 402
    .line 403
    new-array v7, v3, [J

    .line 404
    .line 405
    new-array v8, v3, [I

    .line 406
    .line 407
    move/from16 v25, p1

    .line 408
    .line 409
    move-object/from16 p1, v0

    .line 410
    .line 411
    move/from16 v24, v9

    .line 412
    .line 413
    move-object/from16 v31, v11

    .line 414
    .line 415
    move/from16 v0, v17

    .line 416
    .line 417
    move v9, v0

    .line 418
    move v10, v9

    .line 419
    move/from16 v23, v10

    .line 420
    .line 421
    move/from16 v26, v23

    .line 422
    .line 423
    move-wide/from16 v27, v21

    .line 424
    .line 425
    move-wide/from16 v29, v27

    .line 426
    .line 427
    :goto_e
    const-string v11, "AtomParsers"

    .line 428
    .line 429
    if-ge v10, v3, :cond_1a

    .line 430
    .line 431
    move-wide/from16 v32, v27

    .line 432
    .line 433
    move/from16 v27, v18

    .line 434
    .line 435
    :goto_f
    if-nez v23, :cond_10

    .line 436
    .line 437
    invoke-virtual {v13}, Ll/amr0;->a()Z

    .line 438
    .line 439
    .line 440
    move-result v27

    .line 441
    if-eqz v27, :cond_f

    .line 442
    .line 443
    move/from16 v28, v3

    .line 444
    .line 445
    iget-wide v2, v13, Ll/amr0;->d:J

    .line 446
    .line 447
    move-wide/from16 v32, v2

    .line 448
    .line 449
    iget v2, v13, Ll/amr0;->c:I

    .line 450
    .line 451
    move/from16 v23, v2

    .line 452
    .line 453
    move/from16 v3, v28

    .line 454
    .line 455
    goto :goto_f

    .line 456
    :cond_f
    move/from16 v2, v17

    .line 457
    .line 458
    :goto_10
    move/from16 v28, v3

    .line 459
    .line 460
    goto :goto_11

    .line 461
    :cond_10
    move/from16 v2, v23

    .line 462
    .line 463
    goto :goto_10

    .line 464
    :goto_11
    if-nez v27, :cond_11

    .line 465
    .line 466
    const-string v2, "Unexpected end of chunk data"

    .line 467
    .line 468
    invoke-static {v11, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-static {v5, v10}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-static {v6, v10}, Ljava/util/Arrays;->copyOf([II)[I

    .line 476
    .line 477
    .line 478
    move-result-object v3

    .line 479
    invoke-static {v7, v10}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 480
    .line 481
    .line 482
    move-result-object v4

    .line 483
    invoke-static {v8, v10}, Ljava/util/Arrays;->copyOf([II)[I

    .line 484
    .line 485
    .line 486
    move-result-object v5

    .line 487
    move-object v12, v2

    .line 488
    move-object v6, v3

    .line 489
    move-object v15, v4

    .line 490
    move-object v13, v5

    .line 491
    move v3, v10

    .line 492
    goto/16 :goto_16

    .line 493
    .line 494
    :cond_11
    if-nez p1, :cond_12

    .line 495
    .line 496
    goto :goto_13

    .line 497
    :cond_12
    :goto_12
    if-nez v26, :cond_14

    .line 498
    .line 499
    if-lez v16, :cond_13

    .line 500
    .line 501
    add-int/lit8 v16, v16, -0x1

    .line 502
    .line 503
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->E()I

    .line 504
    .line 505
    .line 506
    move-result v26

    .line 507
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->v()I

    .line 508
    .line 509
    .line 510
    move-result v0

    .line 511
    goto :goto_12

    .line 512
    :cond_13
    move/from16 v26, v17

    .line 513
    .line 514
    :cond_14
    add-int/lit8 v26, v26, -0x1

    .line 515
    .line 516
    :goto_13
    aput-wide v32, v5, v10

    .line 517
    .line 518
    invoke-interface/range {v19 .. v19}, Ll/cmr0;->zzc()I

    .line 519
    .line 520
    .line 521
    move-result v3

    .line 522
    aput v3, v6, v10

    .line 523
    .line 524
    if-le v3, v9, :cond_15

    .line 525
    .line 526
    move v9, v3

    .line 527
    :cond_15
    move/from16 v23, v2

    .line 528
    .line 529
    int-to-long v2, v0

    .line 530
    add-long v2, v29, v2

    .line 531
    .line 532
    aput-wide v2, v7, v10

    .line 533
    .line 534
    if-nez v12, :cond_16

    .line 535
    .line 536
    move/from16 v2, v18

    .line 537
    .line 538
    goto :goto_14

    .line 539
    :cond_16
    move/from16 v2, v17

    .line 540
    .line 541
    :goto_14
    aput v2, v8, v10

    .line 542
    .line 543
    if-ne v10, v4, :cond_17

    .line 544
    .line 545
    aput v18, v8, v10

    .line 546
    .line 547
    add-int/lit8 v25, v25, -0x1

    .line 548
    .line 549
    if-lez v25, :cond_17

    .line 550
    .line 551
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v12}, Ll/bgw0;->E()I

    .line 555
    .line 556
    .line 557
    move-result v2

    .line 558
    add-int/lit8 v2, v2, -0x1

    .line 559
    .line 560
    move v4, v2

    .line 561
    :cond_17
    int-to-long v2, v15

    .line 562
    add-long v29, v29, v2

    .line 563
    .line 564
    add-int/lit8 v14, v14, -0x1

    .line 565
    .line 566
    if-nez v14, :cond_19

    .line 567
    .line 568
    if-lez v24, :cond_18

    .line 569
    .line 570
    invoke-virtual/range {v31 .. v31}, Ll/bgw0;->E()I

    .line 571
    .line 572
    .line 573
    move-result v2

    .line 574
    invoke-virtual/range {v31 .. v31}, Ll/bgw0;->v()I

    .line 575
    .line 576
    .line 577
    move-result v3

    .line 578
    add-int/lit8 v24, v24, -0x1

    .line 579
    .line 580
    move v14, v2

    .line 581
    move v15, v3

    .line 582
    goto :goto_15

    .line 583
    :cond_18
    move/from16 v14, v17

    .line 584
    .line 585
    :cond_19
    :goto_15
    aget v2, v6, v10

    .line 586
    .line 587
    int-to-long v2, v2

    .line 588
    add-long v2, v32, v2

    .line 589
    .line 590
    add-int/lit8 v23, v23, -0x1

    .line 591
    .line 592
    add-int/lit8 v10, v10, 0x1

    .line 593
    .line 594
    move-wide/from16 v34, v2

    .line 595
    .line 596
    move/from16 v3, v28

    .line 597
    .line 598
    move-wide/from16 v27, v34

    .line 599
    .line 600
    goto/16 :goto_e

    .line 601
    .line 602
    :cond_1a
    move/from16 v28, v3

    .line 603
    .line 604
    move-object v12, v5

    .line 605
    move-object v15, v7

    .line 606
    move-object v13, v8

    .line 607
    :goto_16
    int-to-long v4, v0

    .line 608
    add-long v4, v29, v4

    .line 609
    .line 610
    if-eqz p1, :cond_1c

    .line 611
    .line 612
    :goto_17
    if-lez v16, :cond_1c

    .line 613
    .line 614
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->E()I

    .line 615
    .line 616
    .line 617
    move-result v0

    .line 618
    if-eqz v0, :cond_1b

    .line 619
    .line 620
    move/from16 v0, v17

    .line 621
    .line 622
    goto :goto_18

    .line 623
    :cond_1b
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->v()I

    .line 624
    .line 625
    .line 626
    add-int/lit8 v16, v16, -0x1

    .line 627
    .line 628
    goto :goto_17

    .line 629
    :cond_1c
    move/from16 v0, v18

    .line 630
    .line 631
    :goto_18
    if-nez v25, :cond_22

    .line 632
    .line 633
    if-nez v14, :cond_21

    .line 634
    .line 635
    if-nez v23, :cond_20

    .line 636
    .line 637
    if-nez v24, :cond_1f

    .line 638
    .line 639
    if-nez v26, :cond_1e

    .line 640
    .line 641
    if-nez v0, :cond_1d

    .line 642
    .line 643
    move/from16 p1, v3

    .line 644
    .line 645
    move/from16 v0, v17

    .line 646
    .line 647
    move v2, v0

    .line 648
    move v7, v2

    .line 649
    move v8, v7

    .line 650
    move v10, v8

    .line 651
    move v14, v10

    .line 652
    goto :goto_1c

    .line 653
    :cond_1d
    move/from16 p1, v3

    .line 654
    .line 655
    move-wide/from16 v19, v4

    .line 656
    .line 657
    goto/16 :goto_1e

    .line 658
    .line 659
    :cond_1e
    move v10, v0

    .line 660
    move/from16 p1, v3

    .line 661
    .line 662
    move/from16 v0, v17

    .line 663
    .line 664
    move v2, v0

    .line 665
    move v7, v2

    .line 666
    move v14, v7

    .line 667
    :goto_19
    move/from16 v8, v26

    .line 668
    .line 669
    goto :goto_1c

    .line 670
    :cond_1f
    move v10, v0

    .line 671
    move/from16 p1, v3

    .line 672
    .line 673
    move/from16 v0, v17

    .line 674
    .line 675
    move v2, v0

    .line 676
    move v14, v2

    .line 677
    :goto_1a
    move/from16 v7, v24

    .line 678
    .line 679
    goto :goto_19

    .line 680
    :cond_20
    move v10, v0

    .line 681
    move/from16 p1, v3

    .line 682
    .line 683
    move/from16 v0, v17

    .line 684
    .line 685
    move v14, v0

    .line 686
    :goto_1b
    move/from16 v2, v23

    .line 687
    .line 688
    goto :goto_1a

    .line 689
    :cond_21
    move v10, v0

    .line 690
    move/from16 p1, v3

    .line 691
    .line 692
    move/from16 v0, v17

    .line 693
    .line 694
    goto :goto_1b

    .line 695
    :cond_22
    move v10, v0

    .line 696
    move/from16 p1, v3

    .line 697
    .line 698
    move/from16 v2, v23

    .line 699
    .line 700
    move/from16 v7, v24

    .line 701
    .line 702
    move/from16 v0, v25

    .line 703
    .line 704
    goto :goto_19

    .line 705
    :goto_1c
    iget v3, v1, Ll/hnr0;->a:I

    .line 706
    .line 707
    move-wide/from16 v19, v4

    .line 708
    .line 709
    new-instance v4, Ljava/lang/StringBuilder;

    .line 710
    .line 711
    const-string v5, "Inconsistent stbl box for track "

    .line 712
    .line 713
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 714
    .line 715
    .line 716
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 717
    .line 718
    .line 719
    const-string v3, ": remainingSynchronizationSamples "

    .line 720
    .line 721
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 722
    .line 723
    .line 724
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 725
    .line 726
    .line 727
    const-string v0, ", remainingSamplesAtTimestampDelta "

    .line 728
    .line 729
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 730
    .line 731
    .line 732
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 733
    .line 734
    .line 735
    const-string v0, ", remainingSamplesInChunk "

    .line 736
    .line 737
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    .line 739
    .line 740
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 741
    .line 742
    .line 743
    const-string v0, ", remainingTimestampDeltaChanges "

    .line 744
    .line 745
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 746
    .line 747
    .line 748
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 749
    .line 750
    .line 751
    const-string v0, ", remainingSamplesAtTimestampOffset "

    .line 752
    .line 753
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 754
    .line 755
    .line 756
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 757
    .line 758
    .line 759
    move/from16 v0, v18

    .line 760
    .line 761
    if-eq v0, v10, :cond_23

    .line 762
    .line 763
    const-string v0, ", ctts invalid"

    .line 764
    .line 765
    goto :goto_1d

    .line 766
    :cond_23
    const-string v0, ""

    .line 767
    .line 768
    :goto_1d
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 769
    .line 770
    .line 771
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v0

    .line 775
    invoke-static {v11, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    .line 777
    .line 778
    :goto_1e
    move/from16 v3, p1

    .line 779
    .line 780
    move-object v14, v6

    .line 781
    move/from16 v16, v9

    .line 782
    .line 783
    move-wide/from16 v4, v19

    .line 784
    .line 785
    goto/16 :goto_c

    .line 786
    .line 787
    :goto_1f
    iget-wide v8, v1, Ll/hnr0;->c:J

    .line 788
    .line 789
    sget-object v29, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 790
    .line 791
    const-wide/32 v6, 0xf4240

    .line 792
    .line 793
    .line 794
    move-object/from16 v10, v29

    .line 795
    .line 796
    invoke-static/range {v4 .. v10}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 797
    .line 798
    .line 799
    move-result-wide v7

    .line 800
    iget-object v0, v1, Ll/hnr0;->h:[J

    .line 801
    .line 802
    const-wide/32 v9, 0xf4240

    .line 803
    .line 804
    .line 805
    if-nez v0, :cond_24

    .line 806
    .line 807
    iget-wide v3, v1, Ll/hnr0;->c:J

    .line 808
    .line 809
    invoke-static {v15, v9, v10, v3, v4}, Ll/mpw0;->e([JJJ)V

    .line 810
    .line 811
    .line 812
    new-instance v0, Ll/knr0;

    .line 813
    .line 814
    move-object v6, v13

    .line 815
    move-object v3, v14

    .line 816
    move-object v5, v15

    .line 817
    move/from16 v4, v16

    .line 818
    .line 819
    invoke-direct/range {v0 .. v8}, Ll/knr0;-><init>(Ll/hnr0;[J[II[J[IJ)V

    .line 820
    .line 821
    .line 822
    return-object v0

    .line 823
    :cond_24
    move v7, v3

    .line 824
    move-wide/from16 v19, v4

    .line 825
    .line 826
    move-object v6, v13

    .line 827
    move-object v3, v14

    .line 828
    move-object v5, v15

    .line 829
    move/from16 v4, v16

    .line 830
    .line 831
    array-length v8, v0

    .line 832
    const/4 v11, 0x1

    .line 833
    if-ne v8, v11, :cond_28

    .line 834
    .line 835
    iget v8, v1, Ll/hnr0;->b:I

    .line 836
    .line 837
    if-ne v8, v11, :cond_28

    .line 838
    .line 839
    array-length v8, v5

    .line 840
    const/4 v11, 0x2

    .line 841
    if-lt v8, v11, :cond_28

    .line 842
    .line 843
    iget-object v11, v1, Ll/hnr0;->i:[J

    .line 844
    .line 845
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 846
    .line 847
    .line 848
    aget-wide v12, v11, v17

    .line 849
    .line 850
    aget-wide v23, v0, v17

    .line 851
    .line 852
    iget-wide v14, v1, Ll/hnr0;->c:J

    .line 853
    .line 854
    iget-wide v9, v1, Ll/hnr0;->d:J

    .line 855
    .line 856
    move-wide/from16 v27, v9

    .line 857
    .line 858
    move-wide/from16 v25, v14

    .line 859
    .line 860
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 861
    .line 862
    .line 863
    move-result-wide v9

    .line 864
    add-long/2addr v9, v12

    .line 865
    add-int/lit8 v0, v8, -0x1

    .line 866
    .line 867
    const/4 v11, 0x4

    .line 868
    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    .line 869
    .line 870
    .line 871
    move-result v11

    .line 872
    move/from16 v14, v17

    .line 873
    .line 874
    invoke-static {v14, v11}, Ljava/lang/Math;->max(II)I

    .line 875
    .line 876
    .line 877
    move-result v11

    .line 878
    add-int/lit8 v8, v8, -0x4

    .line 879
    .line 880
    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    .line 881
    .line 882
    .line 883
    move-result v0

    .line 884
    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    .line 885
    .line 886
    .line 887
    move-result v0

    .line 888
    aget-wide v15, v5, v14

    .line 889
    .line 890
    cmp-long v8, v15, v12

    .line 891
    .line 892
    if-gtz v8, :cond_28

    .line 893
    .line 894
    aget-wide v23, v5, v11

    .line 895
    .line 896
    cmp-long v8, v12, v23

    .line 897
    .line 898
    if-gez v8, :cond_28

    .line 899
    .line 900
    aget-wide v23, v5, v0

    .line 901
    .line 902
    cmp-long v0, v23, v9

    .line 903
    .line 904
    if-gez v0, :cond_28

    .line 905
    .line 906
    cmp-long v0, v9, v19

    .line 907
    .line 908
    if-gtz v0, :cond_28

    .line 909
    .line 910
    sub-long v23, v12, v15

    .line 911
    .line 912
    iget-object v0, v1, Ll/hnr0;->f:Ll/sqr0;

    .line 913
    .line 914
    iget v0, v0, Ll/sqr0;->z:I

    .line 915
    .line 916
    int-to-long v11, v0

    .line 917
    iget-wide v13, v1, Ll/hnr0;->c:J

    .line 918
    .line 919
    move-wide/from16 v25, v11

    .line 920
    .line 921
    move-wide/from16 v27, v13

    .line 922
    .line 923
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 924
    .line 925
    .line 926
    move-result-wide v11

    .line 927
    iget-object v0, v1, Ll/hnr0;->f:Ll/sqr0;

    .line 928
    .line 929
    iget v0, v0, Ll/sqr0;->z:I

    .line 930
    .line 931
    int-to-long v13, v0

    .line 932
    move-object/from16 p1, v2

    .line 933
    .line 934
    move-object v0, v3

    .line 935
    iget-wide v2, v1, Ll/hnr0;->c:J

    .line 936
    .line 937
    sub-long v23, v19, v9

    .line 938
    .line 939
    move-wide/from16 v27, v2

    .line 940
    .line 941
    move-wide/from16 v25, v13

    .line 942
    .line 943
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 944
    .line 945
    .line 946
    move-result-wide v2

    .line 947
    cmp-long v8, v11, v21

    .line 948
    .line 949
    if-nez v8, :cond_26

    .line 950
    .line 951
    cmp-long v8, v2, v21

    .line 952
    .line 953
    if-eqz v8, :cond_25

    .line 954
    .line 955
    move-wide/from16 v11, v21

    .line 956
    .line 957
    goto :goto_21

    .line 958
    :cond_25
    :goto_20
    move-object/from16 v2, p1

    .line 959
    .line 960
    move-object v3, v0

    .line 961
    goto :goto_22

    .line 962
    :cond_26
    :goto_21
    const-wide/32 v8, 0x7fffffff

    .line 963
    .line 964
    .line 965
    cmp-long v10, v11, v8

    .line 966
    .line 967
    if-gtz v10, :cond_25

    .line 968
    .line 969
    cmp-long v8, v2, v8

    .line 970
    .line 971
    if-lez v8, :cond_27

    .line 972
    .line 973
    goto :goto_20

    .line 974
    :cond_27
    long-to-int v7, v11

    .line 975
    move-object/from16 v8, p2

    .line 976
    .line 977
    iput v7, v8, Ll/rfr0;->a:I

    .line 978
    .line 979
    long-to-int v2, v2

    .line 980
    iput v2, v8, Ll/rfr0;->b:I

    .line 981
    .line 982
    iget-wide v2, v1, Ll/hnr0;->c:J

    .line 983
    .line 984
    const-wide/32 v7, 0xf4240

    .line 985
    .line 986
    .line 987
    invoke-static {v5, v7, v8, v2, v3}, Ll/mpw0;->e([JJJ)V

    .line 988
    .line 989
    .line 990
    iget-object v2, v1, Ll/hnr0;->h:[J

    .line 991
    .line 992
    const/16 v17, 0x0

    .line 993
    .line 994
    aget-wide v23, v2, v17

    .line 995
    .line 996
    const-wide/32 v25, 0xf4240

    .line 997
    .line 998
    .line 999
    iget-wide v2, v1, Ll/hnr0;->d:J

    .line 1000
    .line 1001
    move-wide/from16 v27, v2

    .line 1002
    .line 1003
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1004
    .line 1005
    .line 1006
    move-result-wide v7

    .line 1007
    move-object v3, v0

    .line 1008
    new-instance v0, Ll/knr0;

    .line 1009
    .line 1010
    move-object/from16 v2, p1

    .line 1011
    .line 1012
    invoke-direct/range {v0 .. v8}, Ll/knr0;-><init>(Ll/hnr0;[J[II[J[IJ)V

    .line 1013
    .line 1014
    .line 1015
    return-object v0

    .line 1016
    :cond_28
    :goto_22
    iget-object v0, v1, Ll/hnr0;->h:[J

    .line 1017
    .line 1018
    array-length v8, v0

    .line 1019
    const/4 v11, 0x1

    .line 1020
    if-ne v8, v11, :cond_2b

    .line 1021
    .line 1022
    const/16 v17, 0x0

    .line 1023
    .line 1024
    aget-wide v8, v0, v17

    .line 1025
    .line 1026
    cmp-long v0, v8, v21

    .line 1027
    .line 1028
    if-nez v0, :cond_2a

    .line 1029
    .line 1030
    iget-object v0, v1, Ll/hnr0;->i:[J

    .line 1031
    .line 1032
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1033
    .line 1034
    .line 1035
    aget-wide v7, v0, v17

    .line 1036
    .line 1037
    const/4 v0, 0x0

    .line 1038
    :goto_23
    array-length v9, v5

    .line 1039
    if-ge v0, v9, :cond_29

    .line 1040
    .line 1041
    aget-wide v9, v5, v0

    .line 1042
    .line 1043
    sub-long v11, v9, v7

    .line 1044
    .line 1045
    iget-wide v9, v1, Ll/hnr0;->c:J

    .line 1046
    .line 1047
    sget-object v17, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1048
    .line 1049
    const-wide/32 v13, 0xf4240

    .line 1050
    .line 1051
    .line 1052
    move-wide v15, v9

    .line 1053
    invoke-static/range {v11 .. v17}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1054
    .line 1055
    .line 1056
    move-result-wide v9

    .line 1057
    aput-wide v9, v5, v0

    .line 1058
    .line 1059
    add-int/lit8 v0, v0, 0x1

    .line 1060
    .line 1061
    goto :goto_23

    .line 1062
    :cond_29
    sub-long v9, v19, v7

    .line 1063
    .line 1064
    iget-wide v13, v1, Ll/hnr0;->c:J

    .line 1065
    .line 1066
    sget-object v15, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1067
    .line 1068
    const-wide/32 v11, 0xf4240

    .line 1069
    .line 1070
    .line 1071
    invoke-static/range {v9 .. v15}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1072
    .line 1073
    .line 1074
    move-result-wide v7

    .line 1075
    new-instance v0, Ll/knr0;

    .line 1076
    .line 1077
    invoke-direct/range {v0 .. v8}, Ll/knr0;-><init>(Ll/hnr0;[J[II[J[IJ)V

    .line 1078
    .line 1079
    .line 1080
    return-object v0

    .line 1081
    :cond_2a
    const/4 v8, 0x1

    .line 1082
    :cond_2b
    iget v0, v1, Ll/hnr0;->b:I

    .line 1083
    .line 1084
    const/4 v11, 0x1

    .line 1085
    if-ne v0, v11, :cond_2c

    .line 1086
    .line 1087
    const/4 v0, 0x1

    .line 1088
    goto :goto_24

    .line 1089
    :cond_2c
    const/4 v0, 0x0

    .line 1090
    :goto_24
    iget-object v9, v1, Ll/hnr0;->i:[J

    .line 1091
    .line 1092
    new-array v10, v8, [I

    .line 1093
    .line 1094
    new-array v8, v8, [I

    .line 1095
    .line 1096
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1097
    .line 1098
    .line 1099
    const/4 v11, 0x0

    .line 1100
    const/4 v12, 0x0

    .line 1101
    const/4 v13, 0x0

    .line 1102
    const/4 v14, 0x0

    .line 1103
    :goto_25
    iget-object v15, v1, Ll/hnr0;->h:[J

    .line 1104
    .line 1105
    move/from16 p1, v4

    .line 1106
    .line 1107
    array-length v4, v15

    .line 1108
    if-ge v14, v4, :cond_30

    .line 1109
    .line 1110
    move-object/from16 v16, v8

    .line 1111
    .line 1112
    move-object v4, v9

    .line 1113
    aget-wide v8, v4, v14

    .line 1114
    .line 1115
    const-wide/16 v19, -0x1

    .line 1116
    .line 1117
    cmp-long v19, v8, v19

    .line 1118
    .line 1119
    if-eqz v19, :cond_2f

    .line 1120
    .line 1121
    aget-wide v23, v15, v14

    .line 1122
    .line 1123
    move/from16 v19, v14

    .line 1124
    .line 1125
    iget-wide v14, v1, Ll/hnr0;->c:J

    .line 1126
    .line 1127
    move-wide/from16 v25, v14

    .line 1128
    .line 1129
    iget-wide v14, v1, Ll/hnr0;->d:J

    .line 1130
    .line 1131
    sget-object v29, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1132
    .line 1133
    move-wide/from16 v27, v14

    .line 1134
    .line 1135
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1136
    .line 1137
    .line 1138
    move-result-wide v14

    .line 1139
    move-object/from16 p2, v4

    .line 1140
    .line 1141
    const/4 v4, 0x1

    .line 1142
    invoke-static {v5, v8, v9, v4, v4}, Ll/mpw0;->r([JJZZ)I

    .line 1143
    .line 1144
    .line 1145
    move-result v18

    .line 1146
    aput v18, v10, v19

    .line 1147
    .line 1148
    add-long/2addr v8, v14

    .line 1149
    const/4 v14, 0x0

    .line 1150
    invoke-static {v5, v8, v9, v0, v14}, Ll/mpw0;->p([JJZZ)I

    .line 1151
    .line 1152
    .line 1153
    move-result v8

    .line 1154
    aput v8, v16, v19

    .line 1155
    .line 1156
    :goto_26
    aget v8, v10, v19

    .line 1157
    .line 1158
    aget v9, v16, v19

    .line 1159
    .line 1160
    if-ge v8, v9, :cond_2d

    .line 1161
    .line 1162
    aget v15, v6, v8

    .line 1163
    .line 1164
    and-int/2addr v15, v4

    .line 1165
    if-nez v15, :cond_2d

    .line 1166
    .line 1167
    add-int/lit8 v8, v8, 0x1

    .line 1168
    .line 1169
    aput v8, v10, v19

    .line 1170
    .line 1171
    const/4 v4, 0x1

    .line 1172
    goto :goto_26

    .line 1173
    :cond_2d
    sub-int v4, v9, v8

    .line 1174
    .line 1175
    add-int/2addr v11, v4

    .line 1176
    if-eq v13, v8, :cond_2e

    .line 1177
    .line 1178
    const/4 v4, 0x1

    .line 1179
    goto :goto_27

    .line 1180
    :cond_2e
    move v4, v14

    .line 1181
    :goto_27
    or-int/2addr v4, v12

    .line 1182
    move v12, v4

    .line 1183
    move v13, v9

    .line 1184
    goto :goto_28

    .line 1185
    :cond_2f
    move-object/from16 p2, v4

    .line 1186
    .line 1187
    move/from16 v19, v14

    .line 1188
    .line 1189
    const/4 v14, 0x0

    .line 1190
    :goto_28
    add-int/lit8 v4, v19, 0x1

    .line 1191
    .line 1192
    move-object/from16 v9, p2

    .line 1193
    .line 1194
    move v14, v4

    .line 1195
    move-object/from16 v8, v16

    .line 1196
    .line 1197
    move/from16 v4, p1

    .line 1198
    .line 1199
    goto :goto_25

    .line 1200
    :cond_30
    move-object/from16 v16, v8

    .line 1201
    .line 1202
    const/4 v14, 0x0

    .line 1203
    if-eq v11, v7, :cond_31

    .line 1204
    .line 1205
    const/4 v0, 0x1

    .line 1206
    goto :goto_29

    .line 1207
    :cond_31
    move v0, v14

    .line 1208
    :goto_29
    or-int/2addr v0, v12

    .line 1209
    if-eqz v0, :cond_32

    .line 1210
    .line 1211
    new-array v4, v11, [J

    .line 1212
    .line 1213
    goto :goto_2a

    .line 1214
    :cond_32
    move-object v4, v2

    .line 1215
    :goto_2a
    if-eqz v0, :cond_33

    .line 1216
    .line 1217
    new-array v7, v11, [I

    .line 1218
    .line 1219
    :goto_2b
    const/4 v8, 0x1

    .line 1220
    goto :goto_2c

    .line 1221
    :cond_33
    move-object v7, v3

    .line 1222
    goto :goto_2b

    .line 1223
    :goto_2c
    if-ne v8, v0, :cond_34

    .line 1224
    .line 1225
    move v8, v14

    .line 1226
    goto :goto_2d

    .line 1227
    :cond_34
    move/from16 v8, p1

    .line 1228
    .line 1229
    :goto_2d
    if-eqz v0, :cond_35

    .line 1230
    .line 1231
    new-array v13, v11, [I

    .line 1232
    .line 1233
    goto :goto_2e

    .line 1234
    :cond_35
    move-object v13, v6

    .line 1235
    :goto_2e
    new-array v9, v11, [J

    .line 1236
    .line 1237
    move v11, v8

    .line 1238
    move v8, v14

    .line 1239
    move-wide/from16 v23, v21

    .line 1240
    .line 1241
    :goto_2f
    iget-object v12, v1, Ll/hnr0;->h:[J

    .line 1242
    .line 1243
    array-length v12, v12

    .line 1244
    if-ge v14, v12, :cond_3a

    .line 1245
    .line 1246
    iget-object v12, v1, Ll/hnr0;->i:[J

    .line 1247
    .line 1248
    aget-wide v19, v12, v14

    .line 1249
    .line 1250
    aget v12, v10, v14

    .line 1251
    .line 1252
    aget v15, v16, v14

    .line 1253
    .line 1254
    move/from16 p1, v0

    .line 1255
    .line 1256
    if-eqz v0, :cond_36

    .line 1257
    .line 1258
    sub-int v0, v15, v12

    .line 1259
    .line 1260
    invoke-static {v2, v12, v4, v8, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1261
    .line 1262
    .line 1263
    invoke-static {v3, v12, v7, v8, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1264
    .line 1265
    .line 1266
    invoke-static {v6, v12, v13, v8, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1267
    .line 1268
    .line 1269
    :cond_36
    :goto_30
    if-ge v12, v15, :cond_39

    .line 1270
    .line 1271
    move-object v0, v2

    .line 1272
    move-object/from16 v17, v3

    .line 1273
    .line 1274
    iget-wide v2, v1, Ll/hnr0;->d:J

    .line 1275
    .line 1276
    sget-object v29, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1277
    .line 1278
    const-wide/32 v25, 0xf4240

    .line 1279
    .line 1280
    .line 1281
    move-wide/from16 v27, v2

    .line 1282
    .line 1283
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1284
    .line 1285
    .line 1286
    move-result-wide v2

    .line 1287
    aget-wide v25, v5, v12

    .line 1288
    .line 1289
    sub-long v25, v25, v19

    .line 1290
    .line 1291
    const-wide/32 v27, 0xf4240

    .line 1292
    .line 1293
    .line 1294
    move-wide/from16 v32, v2

    .line 1295
    .line 1296
    iget-wide v2, v1, Ll/hnr0;->c:J

    .line 1297
    .line 1298
    move-object/from16 v31, v29

    .line 1299
    .line 1300
    move-wide/from16 v29, v2

    .line 1301
    .line 1302
    invoke-static/range {v25 .. v31}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1303
    .line 1304
    .line 1305
    move-result-wide v2

    .line 1306
    move-object/from16 p2, v0

    .line 1307
    .line 1308
    iget v0, v1, Ll/hnr0;->b:I

    .line 1309
    .line 1310
    move-object/from16 v30, v4

    .line 1311
    .line 1312
    const/4 v4, 0x1

    .line 1313
    if-eq v0, v4, :cond_37

    .line 1314
    .line 1315
    move-object v0, v5

    .line 1316
    move-wide/from16 v4, v21

    .line 1317
    .line 1318
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 1319
    .line 1320
    .line 1321
    move-result-wide v2

    .line 1322
    goto :goto_31

    .line 1323
    :cond_37
    move-object v0, v5

    .line 1324
    move-wide/from16 v4, v21

    .line 1325
    .line 1326
    :goto_31
    add-long v2, v32, v2

    .line 1327
    .line 1328
    aput-wide v2, v9, v8

    .line 1329
    .line 1330
    if-eqz p1, :cond_38

    .line 1331
    .line 1332
    aget v2, v7, v8

    .line 1333
    .line 1334
    if-le v2, v11, :cond_38

    .line 1335
    .line 1336
    aget v11, v17, v12

    .line 1337
    .line 1338
    :cond_38
    add-int/lit8 v8, v8, 0x1

    .line 1339
    .line 1340
    add-int/lit8 v12, v12, 0x1

    .line 1341
    .line 1342
    move-object/from16 v2, p2

    .line 1343
    .line 1344
    move-wide/from16 v21, v4

    .line 1345
    .line 1346
    move-object/from16 v3, v17

    .line 1347
    .line 1348
    move-object/from16 v4, v30

    .line 1349
    .line 1350
    move-object v5, v0

    .line 1351
    goto :goto_30

    .line 1352
    :cond_39
    move-object/from16 p2, v2

    .line 1353
    .line 1354
    move-object/from16 v17, v3

    .line 1355
    .line 1356
    move-object/from16 v30, v4

    .line 1357
    .line 1358
    move-object v0, v5

    .line 1359
    move-wide/from16 v4, v21

    .line 1360
    .line 1361
    iget-object v2, v1, Ll/hnr0;->h:[J

    .line 1362
    .line 1363
    aget-wide v19, v2, v14

    .line 1364
    .line 1365
    add-long v23, v23, v19

    .line 1366
    .line 1367
    add-int/lit8 v14, v14, 0x1

    .line 1368
    .line 1369
    move-object/from16 v2, p2

    .line 1370
    .line 1371
    move-object/from16 v4, v30

    .line 1372
    .line 1373
    move-object v5, v0

    .line 1374
    move/from16 v0, p1

    .line 1375
    .line 1376
    goto/16 :goto_2f

    .line 1377
    .line 1378
    :cond_3a
    move-object/from16 v30, v4

    .line 1379
    .line 1380
    iget-wide v2, v1, Ll/hnr0;->d:J

    .line 1381
    .line 1382
    sget-object v29, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1383
    .line 1384
    const-wide/32 v25, 0xf4240

    .line 1385
    .line 1386
    .line 1387
    move-wide/from16 v27, v2

    .line 1388
    .line 1389
    invoke-static/range {v23 .. v29}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1390
    .line 1391
    .line 1392
    move-result-wide v2

    .line 1393
    new-instance v0, Ll/knr0;

    .line 1394
    .line 1395
    move-wide v4, v2

    .line 1396
    move-object v3, v7

    .line 1397
    move-wide v7, v4

    .line 1398
    move-object v5, v9

    .line 1399
    move v4, v11

    .line 1400
    move-object v6, v13

    .line 1401
    move-object/from16 v2, v30

    .line 1402
    .line 1403
    invoke-direct/range {v0 .. v8}, Ll/knr0;-><init>(Ll/hnr0;[J[II[J[IJ)V

    .line 1404
    .line 1405
    .line 1406
    return-object v0

    .line 1407
    :cond_3b
    const-string v0, "Track has no sample table size information"

    .line 1408
    .line 1409
    invoke-static {v0, v4}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1410
    .line 1411
    .line 1412
    move-result-object v0

    .line 1413
    throw v0
.end method

.method public static l()Ljava/nio/ByteBuffer;
    .locals 2

    .line 1
    const/16 v0, 0x19

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static m(Ll/bgw0;IIIILjava/lang/String;ZLcom/google/android/gms/internal/ads/zzae;Ll/dmr0;I)V
    .locals 29
    .param p7    # Lcom/google/android/gms/internal/ads/zzae;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    move-object/from16 v5, p7

    .line 12
    .line 13
    move-object/from16 v6, p8

    .line 14
    .line 15
    add-int/lit8 v7, v1, 0x10

    .line 16
    .line 17
    invoke-virtual {v0, v7}, Ll/bgw0;->k(I)V

    .line 18
    .line 19
    .line 20
    const/4 v7, 0x6

    .line 21
    const/16 v8, 0x8

    .line 22
    .line 23
    if-eqz p6, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 26
    .line 27
    .line 28
    move-result v10

    .line 29
    invoke-virtual {v0, v7}, Ll/bgw0;->l(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0, v8}, Ll/bgw0;->l(I)V

    .line 34
    .line 35
    .line 36
    const/4 v10, 0x0

    .line 37
    :goto_0
    const/16 v13, 0x20

    .line 38
    .line 39
    const/4 v14, 0x4

    .line 40
    const/4 v11, 0x2

    .line 41
    const/16 v17, 0x3

    .line 42
    .line 43
    const/4 v12, 0x1

    .line 44
    const/16 v9, 0x10

    .line 45
    .line 46
    if-eqz v10, :cond_1

    .line 47
    .line 48
    if-ne v10, v12, :cond_2

    .line 49
    .line 50
    :cond_1
    move/from16 v21, v11

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_2
    if-ne v10, v11, :cond_46

    .line 54
    .line 55
    invoke-virtual {v0, v9}, Ll/bgw0;->l(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ll/bgw0;->I()J

    .line 59
    .line 60
    .line 61
    move-result-wide v19

    .line 62
    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 63
    .line 64
    .line 65
    move-result-wide v19

    .line 66
    move/from16 v21, v11

    .line 67
    .line 68
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->round(D)J

    .line 69
    .line 70
    .line 71
    move-result-wide v11

    .line 72
    long-to-int v7, v11

    .line 73
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    invoke-virtual {v0, v14}, Ll/bgw0;->l(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 85
    .line 86
    .line 87
    move-result v12

    .line 88
    and-int/lit8 v19, v12, 0x1

    .line 89
    .line 90
    and-int/lit8 v12, v12, 0x2

    .line 91
    .line 92
    if-nez v19, :cond_a

    .line 93
    .line 94
    if-ne v11, v8, :cond_3

    .line 95
    .line 96
    move/from16 v9, v17

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    if-ne v11, v9, :cond_5

    .line 100
    .line 101
    if-eqz v12, :cond_4

    .line 102
    .line 103
    const/high16 v9, 0x10000000

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    move/from16 v9, v21

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_5
    const/16 v9, 0x18

    .line 110
    .line 111
    if-ne v11, v9, :cond_7

    .line 112
    .line 113
    if-eqz v12, :cond_6

    .line 114
    .line 115
    const/high16 v9, 0x50000000

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_6
    const/16 v9, 0x15

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_7
    if-ne v11, v13, :cond_9

    .line 122
    .line 123
    if-eqz v12, :cond_8

    .line 124
    .line 125
    const/high16 v9, 0x60000000

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_8
    const/16 v9, 0x16

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_9
    const/4 v9, -0x1

    .line 132
    goto :goto_1

    .line 133
    :cond_a
    if-ne v11, v13, :cond_9

    .line 134
    .line 135
    move v9, v14

    .line 136
    :goto_1
    invoke-virtual {v0, v8}, Ll/bgw0;->l(I)V

    .line 137
    .line 138
    .line 139
    const/4 v11, 0x0

    .line 140
    goto :goto_3

    .line 141
    :goto_2
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 142
    .line 143
    .line 144
    move-result v8

    .line 145
    invoke-virtual {v0, v7}, Ll/bgw0;->l(I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ll/bgw0;->C()I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 153
    .line 154
    .line 155
    move-result v11

    .line 156
    add-int/lit8 v11, v11, -0x4

    .line 157
    .line 158
    invoke-virtual {v0, v11}, Ll/bgw0;->k(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 162
    .line 163
    .line 164
    move-result v11

    .line 165
    const/4 v12, 0x1

    .line 166
    if-ne v10, v12, :cond_b

    .line 167
    .line 168
    invoke-virtual {v0, v9}, Ll/bgw0;->l(I)V

    .line 169
    .line 170
    .line 171
    :cond_b
    move v10, v8

    .line 172
    const/4 v9, -0x1

    .line 173
    :goto_3
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 174
    .line 175
    .line 176
    move-result v8

    .line 177
    const v12, 0x656e6361

    .line 178
    .line 179
    .line 180
    move/from16 v19, v13

    .line 181
    .line 182
    move/from16 v14, p1

    .line 183
    .line 184
    if-ne v14, v12, :cond_e

    .line 185
    .line 186
    invoke-static {v0, v1, v2}, Ll/hmr0;->h(Ll/bgw0;II)Landroid/util/Pair;

    .line 187
    .line 188
    .line 189
    move-result-object v14

    .line 190
    if-eqz v14, :cond_d

    .line 191
    .line 192
    iget-object v12, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast v12, Ljava/lang/Integer;

    .line 195
    .line 196
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 197
    .line 198
    .line 199
    move-result v12

    .line 200
    if-nez v5, :cond_c

    .line 201
    .line 202
    const/4 v13, 0x0

    .line 203
    goto :goto_4

    .line 204
    :cond_c
    iget-object v13, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast v13, Ll/inr0;

    .line 207
    .line 208
    iget-object v13, v13, Ll/inr0;->b:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v5, v13}, Lcom/google/android/gms/internal/ads/zzae;->b(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzae;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    move-object v13, v5

    .line 215
    :goto_4
    iget-object v5, v6, Ll/dmr0;->a:[Ll/inr0;

    .line 216
    .line 217
    iget-object v14, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 218
    .line 219
    check-cast v14, Ll/inr0;

    .line 220
    .line 221
    aput-object v14, v5, p9

    .line 222
    .line 223
    goto :goto_5

    .line 224
    :cond_d
    move-object v13, v5

    .line 225
    :goto_5
    invoke-virtual {v0, v8}, Ll/bgw0;->k(I)V

    .line 226
    .line 227
    .line 228
    goto :goto_6

    .line 229
    :cond_e
    move-object v13, v5

    .line 230
    move v12, v14

    .line 231
    :goto_6
    const v5, 0x61632d33

    .line 232
    .line 233
    .line 234
    const-string v14, "audio/mhm1"

    .line 235
    .line 236
    const-string v15, "audio/ac4"

    .line 237
    .line 238
    if-ne v12, v5, :cond_f

    .line 239
    .line 240
    const-string v5, "audio/ac3"

    .line 241
    .line 242
    goto/16 :goto_a

    .line 243
    .line 244
    :cond_f
    const v5, 0x65632d33

    .line 245
    .line 246
    .line 247
    if-ne v12, v5, :cond_10

    .line 248
    .line 249
    const-string v5, "audio/eac3"

    .line 250
    .line 251
    goto/16 :goto_a

    .line 252
    .line 253
    :cond_10
    const v5, 0x61632d34

    .line 254
    .line 255
    .line 256
    if-ne v12, v5, :cond_11

    .line 257
    .line 258
    move-object v5, v15

    .line 259
    goto/16 :goto_a

    .line 260
    .line 261
    :cond_11
    const v5, 0x64747363

    .line 262
    .line 263
    .line 264
    if-ne v12, v5, :cond_12

    .line 265
    .line 266
    const-string v5, "audio/vnd.dts"

    .line 267
    .line 268
    goto/16 :goto_a

    .line 269
    .line 270
    :cond_12
    const v5, 0x64747368

    .line 271
    .line 272
    .line 273
    if-eq v12, v5, :cond_26

    .line 274
    .line 275
    const v5, 0x6474736c

    .line 276
    .line 277
    .line 278
    if-ne v12, v5, :cond_13

    .line 279
    .line 280
    goto/16 :goto_9

    .line 281
    .line 282
    :cond_13
    const v5, 0x64747365

    .line 283
    .line 284
    .line 285
    if-ne v12, v5, :cond_14

    .line 286
    .line 287
    const-string v5, "audio/vnd.dts.hd;profile=lbr"

    .line 288
    .line 289
    goto/16 :goto_a

    .line 290
    .line 291
    :cond_14
    const v5, 0x64747378

    .line 292
    .line 293
    .line 294
    if-ne v12, v5, :cond_15

    .line 295
    .line 296
    const-string v5, "audio/vnd.dts.uhd;profile=p2"

    .line 297
    .line 298
    goto/16 :goto_a

    .line 299
    .line 300
    :cond_15
    const v5, 0x73616d72

    .line 301
    .line 302
    .line 303
    if-ne v12, v5, :cond_16

    .line 304
    .line 305
    const-string v5, "audio/3gpp"

    .line 306
    .line 307
    goto/16 :goto_a

    .line 308
    .line 309
    :cond_16
    const v5, 0x73617762

    .line 310
    .line 311
    .line 312
    if-ne v12, v5, :cond_17

    .line 313
    .line 314
    const-string v5, "audio/amr-wb"

    .line 315
    .line 316
    goto/16 :goto_a

    .line 317
    .line 318
    :cond_17
    const v5, 0x736f7774

    .line 319
    .line 320
    .line 321
    const-string v23, "audio/raw"

    .line 322
    .line 323
    if-ne v12, v5, :cond_19

    .line 324
    .line 325
    :goto_7
    move/from16 v9, v21

    .line 326
    .line 327
    :cond_18
    move-object/from16 v5, v23

    .line 328
    .line 329
    goto/16 :goto_a

    .line 330
    .line 331
    :cond_19
    const v5, 0x74776f73

    .line 332
    .line 333
    .line 334
    if-ne v12, v5, :cond_1a

    .line 335
    .line 336
    move-object/from16 v5, v23

    .line 337
    .line 338
    const/high16 v9, 0x10000000

    .line 339
    .line 340
    goto/16 :goto_a

    .line 341
    .line 342
    :cond_1a
    const v5, 0x6c70636d

    .line 343
    .line 344
    .line 345
    if-ne v12, v5, :cond_1b

    .line 346
    .line 347
    const/4 v5, -0x1

    .line 348
    if-ne v9, v5, :cond_18

    .line 349
    .line 350
    goto :goto_7

    .line 351
    :cond_1b
    const v5, 0x2e6d7032

    .line 352
    .line 353
    .line 354
    if-eq v12, v5, :cond_25

    .line 355
    .line 356
    const v5, 0x2e6d7033

    .line 357
    .line 358
    .line 359
    if-ne v12, v5, :cond_1c

    .line 360
    .line 361
    goto :goto_8

    .line 362
    :cond_1c
    const v5, 0x6d686131

    .line 363
    .line 364
    .line 365
    if-ne v12, v5, :cond_1d

    .line 366
    .line 367
    const-string v5, "audio/mha1"

    .line 368
    .line 369
    goto :goto_a

    .line 370
    :cond_1d
    const v5, 0x6d686d31

    .line 371
    .line 372
    .line 373
    if-ne v12, v5, :cond_1e

    .line 374
    .line 375
    move-object v5, v14

    .line 376
    goto :goto_a

    .line 377
    :cond_1e
    const v5, 0x616c6163

    .line 378
    .line 379
    .line 380
    if-ne v12, v5, :cond_1f

    .line 381
    .line 382
    const-string v5, "audio/alac"

    .line 383
    .line 384
    goto :goto_a

    .line 385
    :cond_1f
    const v5, 0x616c6177

    .line 386
    .line 387
    .line 388
    if-ne v12, v5, :cond_20

    .line 389
    .line 390
    const-string v5, "audio/g711-alaw"

    .line 391
    .line 392
    goto :goto_a

    .line 393
    :cond_20
    const v5, 0x756c6177

    .line 394
    .line 395
    .line 396
    if-ne v12, v5, :cond_21

    .line 397
    .line 398
    const-string v5, "audio/g711-mlaw"

    .line 399
    .line 400
    goto :goto_a

    .line 401
    :cond_21
    const v5, 0x4f707573

    .line 402
    .line 403
    .line 404
    if-ne v12, v5, :cond_22

    .line 405
    .line 406
    const-string v5, "audio/opus"

    .line 407
    .line 408
    goto :goto_a

    .line 409
    :cond_22
    const v5, 0x664c6143

    .line 410
    .line 411
    .line 412
    if-ne v12, v5, :cond_23

    .line 413
    .line 414
    const-string v5, "audio/flac"

    .line 415
    .line 416
    goto :goto_a

    .line 417
    :cond_23
    const v5, 0x6d6c7061

    .line 418
    .line 419
    .line 420
    if-ne v12, v5, :cond_24

    .line 421
    .line 422
    const-string v5, "audio/true-hd"

    .line 423
    .line 424
    goto :goto_a

    .line 425
    :cond_24
    const/4 v5, 0x0

    .line 426
    goto :goto_a

    .line 427
    :cond_25
    :goto_8
    const-string v5, "audio/mpeg"

    .line 428
    .line 429
    goto :goto_a

    .line 430
    :cond_26
    :goto_9
    const-string v5, "audio/vnd.dts.hd"

    .line 431
    .line 432
    :goto_a
    move/from16 v23, v9

    .line 433
    .line 434
    const/4 v1, 0x0

    .line 435
    const/4 v12, 0x0

    .line 436
    const/16 v16, 0x0

    .line 437
    .line 438
    :goto_b
    sub-int v9, v8, p2

    .line 439
    .line 440
    if-ge v9, v2, :cond_44

    .line 441
    .line 442
    invoke-virtual {v0, v8}, Ll/bgw0;->k(I)V

    .line 443
    .line 444
    .line 445
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 446
    .line 447
    .line 448
    move-result v9

    .line 449
    if-lez v9, :cond_27

    .line 450
    .line 451
    const/4 v2, 0x1

    .line 452
    :goto_c
    move-object/from16 p7, v12

    .line 453
    .line 454
    goto :goto_d

    .line 455
    :cond_27
    const/4 v2, 0x0

    .line 456
    goto :goto_c

    .line 457
    :goto_d
    const-string v12, "childAtomSize must be positive"

    .line 458
    .line 459
    invoke-static {v2, v12}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    move/from16 p9, v7

    .line 467
    .line 468
    const v7, 0x6d686143

    .line 469
    .line 470
    .line 471
    if-ne v2, v7, :cond_2a

    .line 472
    .line 473
    add-int/lit8 v2, v8, 0x8

    .line 474
    .line 475
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 476
    .line 477
    .line 478
    const/4 v12, 0x1

    .line 479
    invoke-virtual {v0, v12}, Ll/bgw0;->l(I)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 483
    .line 484
    .line 485
    move-result v2

    .line 486
    invoke-virtual {v0, v12}, Ll/bgw0;->l(I)V

    .line 487
    .line 488
    .line 489
    invoke-static {v5, v14}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result v7

    .line 493
    if-eqz v7, :cond_28

    .line 494
    .line 495
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    const-string v7, "mhm1.%02X"

    .line 504
    .line 505
    invoke-static {v7, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v2

    .line 509
    :goto_e
    move-object v12, v2

    .line 510
    goto :goto_f

    .line 511
    :cond_28
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 512
    .line 513
    .line 514
    move-result-object v2

    .line 515
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v2

    .line 519
    const-string v7, "mha1.%02X"

    .line 520
    .line 521
    invoke-static {v7, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    goto :goto_e

    .line 526
    :goto_f
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 527
    .line 528
    .line 529
    move-result v2

    .line 530
    new-array v7, v2, [B

    .line 531
    .line 532
    move-object/from16 p7, v12

    .line 533
    .line 534
    const/4 v12, 0x0

    .line 535
    invoke-virtual {v0, v7, v12, v2}, Ll/bgw0;->g([BII)V

    .line 536
    .line 537
    .line 538
    if-nez v1, :cond_29

    .line 539
    .line 540
    invoke-static {v7}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    :goto_10
    move-object/from16 v0, p7

    .line 545
    .line 546
    move/from16 v7, p9

    .line 547
    .line 548
    move/from16 p9, v8

    .line 549
    .line 550
    move/from16 v18, v9

    .line 551
    .line 552
    goto/16 :goto_23

    .line 553
    .line 554
    :cond_29
    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    check-cast v1, [B

    .line 559
    .line 560
    invoke-static {v7, v1}, Lcom/google/android/gms/internal/ads/zzgaa;->zzn(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    :goto_11
    move-object/from16 v0, p7

    .line 565
    .line 566
    move/from16 v7, p9

    .line 567
    .line 568
    move/from16 p9, v8

    .line 569
    .line 570
    move/from16 v18, v9

    .line 571
    .line 572
    const/4 v12, 0x0

    .line 573
    goto/16 :goto_23

    .line 574
    .line 575
    :cond_2a
    const v7, 0x6d686150

    .line 576
    .line 577
    .line 578
    if-ne v2, v7, :cond_2e

    .line 579
    .line 580
    add-int/lit8 v2, v8, 0x8

    .line 581
    .line 582
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 583
    .line 584
    .line 585
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 586
    .line 587
    .line 588
    move-result v2

    .line 589
    if-lez v2, :cond_2c

    .line 590
    .line 591
    new-array v7, v2, [B

    .line 592
    .line 593
    const/4 v12, 0x0

    .line 594
    invoke-virtual {v0, v7, v12, v2}, Ll/bgw0;->g([BII)V

    .line 595
    .line 596
    .line 597
    if-nez v1, :cond_2b

    .line 598
    .line 599
    invoke-static {v7}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 600
    .line 601
    .line 602
    move-result-object v1

    .line 603
    goto :goto_10

    .line 604
    :cond_2b
    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    check-cast v1, [B

    .line 609
    .line 610
    invoke-static {v1, v7}, Lcom/google/android/gms/internal/ads/zzgaa;->zzn(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    goto :goto_11

    .line 615
    :cond_2c
    :goto_12
    move/from16 v7, p9

    .line 616
    .line 617
    :cond_2d
    :goto_13
    move/from16 p9, v8

    .line 618
    .line 619
    move/from16 v18, v9

    .line 620
    .line 621
    const/4 v12, 0x0

    .line 622
    goto/16 :goto_22

    .line 623
    .line 624
    :cond_2e
    const v7, 0x65736473

    .line 625
    .line 626
    .line 627
    if-eq v2, v7, :cond_3e

    .line 628
    .line 629
    if-eqz p6, :cond_33

    .line 630
    .line 631
    const v7, 0x77617665

    .line 632
    .line 633
    .line 634
    if-ne v2, v7, :cond_33

    .line 635
    .line 636
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 637
    .line 638
    .line 639
    move-result v2

    .line 640
    if-lt v2, v8, :cond_2f

    .line 641
    .line 642
    const/4 v7, 0x1

    .line 643
    :goto_14
    move/from16 v25, v2

    .line 644
    .line 645
    const/4 v2, 0x0

    .line 646
    goto :goto_15

    .line 647
    :cond_2f
    const/4 v7, 0x0

    .line 648
    goto :goto_14

    .line 649
    :goto_15
    invoke-static {v7, v2}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 650
    .line 651
    .line 652
    move/from16 v2, v25

    .line 653
    .line 654
    :goto_16
    sub-int v7, v2, v8

    .line 655
    .line 656
    if-ge v7, v9, :cond_32

    .line 657
    .line 658
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 659
    .line 660
    .line 661
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 662
    .line 663
    .line 664
    move-result v7

    .line 665
    if-lez v7, :cond_30

    .line 666
    .line 667
    move/from16 v25, v2

    .line 668
    .line 669
    const/4 v2, 0x1

    .line 670
    goto :goto_17

    .line 671
    :cond_30
    move/from16 v25, v2

    .line 672
    .line 673
    const/4 v2, 0x0

    .line 674
    :goto_17
    invoke-static {v2, v12}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 675
    .line 676
    .line 677
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 678
    .line 679
    .line 680
    move-result v2

    .line 681
    move/from16 v26, v7

    .line 682
    .line 683
    const v7, 0x65736473

    .line 684
    .line 685
    .line 686
    if-eq v2, v7, :cond_31

    .line 687
    .line 688
    add-int v2, v25, v26

    .line 689
    .line 690
    goto :goto_16

    .line 691
    :cond_31
    move/from16 v7, p9

    .line 692
    .line 693
    move/from16 v2, v25

    .line 694
    .line 695
    :goto_18
    const/4 v12, -0x1

    .line 696
    goto/16 :goto_1c

    .line 697
    .line 698
    :cond_32
    move/from16 v7, p9

    .line 699
    .line 700
    const/4 v2, -0x1

    .line 701
    goto :goto_18

    .line 702
    :cond_33
    const v7, 0x64616333

    .line 703
    .line 704
    .line 705
    if-ne v2, v7, :cond_34

    .line 706
    .line 707
    add-int/lit8 v2, v8, 0x8

    .line 708
    .line 709
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 710
    .line 711
    .line 712
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 713
    .line 714
    .line 715
    move-result-object v2

    .line 716
    invoke-static {v0, v2, v4, v13}, Ll/fdr0;->c(Ll/bgw0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzae;)Ll/sqr0;

    .line 717
    .line 718
    .line 719
    move-result-object v2

    .line 720
    iput-object v2, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 721
    .line 722
    goto :goto_12

    .line 723
    :cond_34
    const v7, 0x64656333

    .line 724
    .line 725
    .line 726
    if-ne v2, v7, :cond_35

    .line 727
    .line 728
    add-int/lit8 v2, v8, 0x8

    .line 729
    .line 730
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 731
    .line 732
    .line 733
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v2

    .line 737
    invoke-static {v0, v2, v4, v13}, Ll/fdr0;->d(Ll/bgw0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzae;)Ll/sqr0;

    .line 738
    .line 739
    .line 740
    move-result-object v2

    .line 741
    iput-object v2, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 742
    .line 743
    goto/16 :goto_12

    .line 744
    .line 745
    :cond_35
    const v7, 0x64616334

    .line 746
    .line 747
    .line 748
    if-ne v2, v7, :cond_37

    .line 749
    .line 750
    add-int/lit8 v2, v8, 0x8

    .line 751
    .line 752
    invoke-virtual {v0, v2}, Ll/bgw0;->k(I)V

    .line 753
    .line 754
    .line 755
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v2

    .line 759
    sget-object v7, Ll/idr0;->a:[I

    .line 760
    .line 761
    const/4 v12, 0x1

    .line 762
    invoke-virtual {v0, v12}, Ll/bgw0;->l(I)V

    .line 763
    .line 764
    .line 765
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 766
    .line 767
    .line 768
    move-result v7

    .line 769
    and-int/lit8 v7, v7, 0x20

    .line 770
    .line 771
    new-instance v12, Ll/znr0;

    .line 772
    .line 773
    invoke-direct {v12}, Ll/znr0;-><init>()V

    .line 774
    .line 775
    .line 776
    invoke-virtual {v12, v2}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 777
    .line 778
    .line 779
    invoke-virtual {v12, v15}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 780
    .line 781
    .line 782
    move/from16 v2, v21

    .line 783
    .line 784
    invoke-virtual {v12, v2}, Ll/znr0;->k0(I)Ll/znr0;

    .line 785
    .line 786
    .line 787
    shr-int/lit8 v2, v7, 0x5

    .line 788
    .line 789
    const/4 v7, 0x1

    .line 790
    if-eq v7, v2, :cond_36

    .line 791
    .line 792
    const v2, 0xac44

    .line 793
    .line 794
    .line 795
    goto :goto_19

    .line 796
    :cond_36
    const v2, 0xbb80

    .line 797
    .line 798
    .line 799
    :goto_19
    invoke-virtual {v12, v2}, Ll/znr0;->x(I)Ll/znr0;

    .line 800
    .line 801
    .line 802
    invoke-virtual {v12, v13}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 803
    .line 804
    .line 805
    invoke-virtual {v12, v4}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 806
    .line 807
    .line 808
    invoke-virtual {v12}, Ll/znr0;->D()Ll/sqr0;

    .line 809
    .line 810
    .line 811
    move-result-object v2

    .line 812
    iput-object v2, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 813
    .line 814
    move/from16 v7, p9

    .line 815
    .line 816
    move/from16 p9, v8

    .line 817
    .line 818
    move/from16 v18, v9

    .line 819
    .line 820
    const/4 v12, 0x0

    .line 821
    const/16 v21, 0x2

    .line 822
    .line 823
    goto/16 :goto_22

    .line 824
    .line 825
    :cond_37
    const v7, 0x646d6c70

    .line 826
    .line 827
    .line 828
    if-ne v2, v7, :cond_39

    .line 829
    .line 830
    if-lez v11, :cond_38

    .line 831
    .line 832
    move-object/from16 v0, p7

    .line 833
    .line 834
    move/from16 p9, v8

    .line 835
    .line 836
    move/from16 v18, v9

    .line 837
    .line 838
    move v7, v11

    .line 839
    const/4 v10, 0x2

    .line 840
    :goto_1a
    const/4 v12, 0x0

    .line 841
    const/16 v21, 0x2

    .line 842
    .line 843
    goto/16 :goto_23

    .line 844
    .line 845
    :cond_38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 846
    .line 847
    const-string v1, "Invalid sample rate for Dolby TrueHD MLP stream: "

    .line 848
    .line 849
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 853
    .line 854
    .line 855
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 856
    .line 857
    .line 858
    move-result-object v0

    .line 859
    const/4 v7, 0x0

    .line 860
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 861
    .line 862
    .line 863
    move-result-object v0

    .line 864
    throw v0

    .line 865
    :cond_39
    const/4 v7, 0x0

    .line 866
    const v12, 0x64647473

    .line 867
    .line 868
    .line 869
    if-eq v2, v12, :cond_3a

    .line 870
    .line 871
    const v12, 0x75647473

    .line 872
    .line 873
    .line 874
    if-ne v2, v12, :cond_3b

    .line 875
    .line 876
    :cond_3a
    const/4 v12, 0x4

    .line 877
    const/16 v21, 0x2

    .line 878
    .line 879
    goto/16 :goto_1b

    .line 880
    .line 881
    :cond_3b
    const v12, 0x644f7073

    .line 882
    .line 883
    .line 884
    if-ne v2, v12, :cond_3c

    .line 885
    .line 886
    add-int/lit8 v1, v8, 0x8

    .line 887
    .line 888
    add-int/lit8 v2, v9, -0x8

    .line 889
    .line 890
    sget-object v12, Ll/hmr0;->a:[B

    .line 891
    .line 892
    array-length v7, v12

    .line 893
    add-int/2addr v7, v2

    .line 894
    invoke-static {v12, v7}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 895
    .line 896
    .line 897
    move-result-object v7

    .line 898
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 899
    .line 900
    .line 901
    array-length v1, v12

    .line 902
    invoke-virtual {v0, v7, v1, v2}, Ll/bgw0;->g([BII)V

    .line 903
    .line 904
    .line 905
    invoke-static {v7}, Ll/xfr0;->e([B)Ljava/util/List;

    .line 906
    .line 907
    .line 908
    move-result-object v1

    .line 909
    move-object/from16 v0, p7

    .line 910
    .line 911
    move/from16 v7, p9

    .line 912
    .line 913
    move/from16 p9, v8

    .line 914
    .line 915
    move/from16 v18, v9

    .line 916
    .line 917
    goto :goto_1a

    .line 918
    :cond_3c
    const v7, 0x64664c61

    .line 919
    .line 920
    .line 921
    if-ne v2, v7, :cond_3d

    .line 922
    .line 923
    add-int/lit8 v1, v8, 0xc

    .line 924
    .line 925
    add-int/lit8 v2, v9, -0xc

    .line 926
    .line 927
    add-int/lit8 v7, v9, -0x8

    .line 928
    .line 929
    new-array v7, v7, [B

    .line 930
    .line 931
    const/16 v12, 0x66

    .line 932
    .line 933
    const/16 v18, 0x0

    .line 934
    .line 935
    aput-byte v12, v7, v18

    .line 936
    .line 937
    const/16 v12, 0x4c

    .line 938
    .line 939
    const/16 v22, 0x1

    .line 940
    .line 941
    aput-byte v12, v7, v22

    .line 942
    .line 943
    const/16 v12, 0x61

    .line 944
    .line 945
    const/16 v21, 0x2

    .line 946
    .line 947
    aput-byte v12, v7, v21

    .line 948
    .line 949
    const/16 v12, 0x43

    .line 950
    .line 951
    aput-byte v12, v7, v17

    .line 952
    .line 953
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 954
    .line 955
    .line 956
    const/4 v12, 0x4

    .line 957
    invoke-virtual {v0, v7, v12, v2}, Ll/bgw0;->g([BII)V

    .line 958
    .line 959
    .line 960
    invoke-static {v7}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 961
    .line 962
    .line 963
    move-result-object v1

    .line 964
    goto/16 :goto_11

    .line 965
    .line 966
    :cond_3d
    const v7, 0x616c6163

    .line 967
    .line 968
    .line 969
    const/4 v12, 0x4

    .line 970
    const/16 v21, 0x2

    .line 971
    .line 972
    if-ne v2, v7, :cond_2c

    .line 973
    .line 974
    add-int/lit8 v1, v8, 0xc

    .line 975
    .line 976
    add-int/lit8 v2, v9, -0xc

    .line 977
    .line 978
    new-array v10, v2, [B

    .line 979
    .line 980
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 981
    .line 982
    .line 983
    const/4 v1, 0x0

    .line 984
    invoke-virtual {v0, v10, v1, v2}, Ll/bgw0;->g([BII)V

    .line 985
    .line 986
    .line 987
    sget-object v1, Ll/rgv0;->a:[B

    .line 988
    .line 989
    new-instance v1, Ll/bgw0;

    .line 990
    .line 991
    invoke-direct {v1, v10}, Ll/bgw0;-><init>([B)V

    .line 992
    .line 993
    .line 994
    const/16 v2, 0x9

    .line 995
    .line 996
    invoke-virtual {v1, v2}, Ll/bgw0;->k(I)V

    .line 997
    .line 998
    .line 999
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 1000
    .line 1001
    .line 1002
    move-result v2

    .line 1003
    const/16 v7, 0x14

    .line 1004
    .line 1005
    invoke-virtual {v1, v7}, Ll/bgw0;->k(I)V

    .line 1006
    .line 1007
    .line 1008
    invoke-virtual {v1}, Ll/bgw0;->E()I

    .line 1009
    .line 1010
    .line 1011
    move-result v1

    .line 1012
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v1

    .line 1016
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v2

    .line 1020
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v1

    .line 1024
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 1025
    .line 1026
    check-cast v2, Ljava/lang/Integer;

    .line 1027
    .line 1028
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1029
    .line 1030
    .line 1031
    move-result v2

    .line 1032
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 1033
    .line 1034
    check-cast v1, Ljava/lang/Integer;

    .line 1035
    .line 1036
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 1037
    .line 1038
    .line 1039
    move-result v1

    .line 1040
    invoke-static {v10}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v7

    .line 1044
    move-object/from16 v0, p7

    .line 1045
    .line 1046
    move v10, v1

    .line 1047
    move-object v1, v7

    .line 1048
    move/from16 p9, v8

    .line 1049
    .line 1050
    move/from16 v18, v9

    .line 1051
    .line 1052
    const/4 v12, 0x0

    .line 1053
    move v7, v2

    .line 1054
    goto/16 :goto_23

    .line 1055
    .line 1056
    :goto_1b
    new-instance v2, Ll/znr0;

    .line 1057
    .line 1058
    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 1059
    .line 1060
    .line 1061
    invoke-virtual {v2, v3}, Ll/znr0;->j(I)Ll/znr0;

    .line 1062
    .line 1063
    .line 1064
    invoke-virtual {v2, v5}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 1065
    .line 1066
    .line 1067
    invoke-virtual {v2, v10}, Ll/znr0;->k0(I)Ll/znr0;

    .line 1068
    .line 1069
    .line 1070
    move/from16 v7, p9

    .line 1071
    .line 1072
    invoke-virtual {v2, v7}, Ll/znr0;->x(I)Ll/znr0;

    .line 1073
    .line 1074
    .line 1075
    invoke-virtual {v2, v13}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 1076
    .line 1077
    .line 1078
    invoke-virtual {v2, v4}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 1079
    .line 1080
    .line 1081
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    .line 1082
    .line 1083
    .line 1084
    move-result-object v2

    .line 1085
    iput-object v2, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 1086
    .line 1087
    goto/16 :goto_13

    .line 1088
    .line 1089
    :cond_3e
    move/from16 v7, p9

    .line 1090
    .line 1091
    move v2, v8

    .line 1092
    goto/16 :goto_18

    .line 1093
    .line 1094
    :goto_1c
    if-eq v2, v12, :cond_2d

    .line 1095
    .line 1096
    invoke-static {v0, v2}, Ll/hmr0;->j(Ll/bgw0;I)Ll/bmr0;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v16

    .line 1100
    invoke-static/range {v16 .. v16}, Ll/bmr0;->c(Ll/bmr0;)Ljava/lang/String;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v2

    .line 1104
    invoke-static/range {v16 .. v16}, Ll/bmr0;->d(Ll/bmr0;)[B

    .line 1105
    .line 1106
    .line 1107
    move-result-object v5

    .line 1108
    if-eqz v5, :cond_43

    .line 1109
    .line 1110
    const-string v1, "audio/vorbis"

    .line 1111
    .line 1112
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1113
    .line 1114
    .line 1115
    move-result v1

    .line 1116
    if-eqz v1, :cond_41

    .line 1117
    .line 1118
    new-instance v1, Ll/bgw0;

    .line 1119
    .line 1120
    invoke-direct {v1, v5}, Ll/bgw0;-><init>([B)V

    .line 1121
    .line 1122
    .line 1123
    const/4 v12, 0x1

    .line 1124
    invoke-virtual {v1, v12}, Ll/bgw0;->l(I)V

    .line 1125
    .line 1126
    .line 1127
    const/16 v27, 0x0

    .line 1128
    .line 1129
    :goto_1d
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 1130
    .line 1131
    .line 1132
    move-result v22

    .line 1133
    const/16 v12, 0xff

    .line 1134
    .line 1135
    if-lez v22, :cond_3f

    .line 1136
    .line 1137
    invoke-virtual {v1}, Ll/bgw0;->u()I

    .line 1138
    .line 1139
    .line 1140
    move-result v0

    .line 1141
    if-ne v0, v12, :cond_3f

    .line 1142
    .line 1143
    const/4 v0, 0x1

    .line 1144
    invoke-virtual {v1, v0}, Ll/bgw0;->l(I)V

    .line 1145
    .line 1146
    .line 1147
    move/from16 v0, v27

    .line 1148
    .line 1149
    add-int/lit16 v0, v0, 0xff

    .line 1150
    .line 1151
    move/from16 v27, v0

    .line 1152
    .line 1153
    const/4 v12, 0x1

    .line 1154
    move-object/from16 v0, p0

    .line 1155
    .line 1156
    goto :goto_1d

    .line 1157
    :cond_3f
    move/from16 v0, v27

    .line 1158
    .line 1159
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 1160
    .line 1161
    .line 1162
    move-result v24

    .line 1163
    add-int v0, v0, v24

    .line 1164
    .line 1165
    const/16 v28, 0x0

    .line 1166
    .line 1167
    :goto_1e
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 1168
    .line 1169
    .line 1170
    move-result v24

    .line 1171
    move/from16 p9, v8

    .line 1172
    .line 1173
    if-lez v24, :cond_40

    .line 1174
    .line 1175
    invoke-virtual {v1}, Ll/bgw0;->u()I

    .line 1176
    .line 1177
    .line 1178
    move-result v8

    .line 1179
    if-ne v8, v12, :cond_40

    .line 1180
    .line 1181
    const/4 v8, 0x1

    .line 1182
    invoke-virtual {v1, v8}, Ll/bgw0;->l(I)V

    .line 1183
    .line 1184
    .line 1185
    move/from16 v8, v28

    .line 1186
    .line 1187
    add-int/lit16 v8, v8, 0xff

    .line 1188
    .line 1189
    move/from16 v28, v8

    .line 1190
    .line 1191
    move/from16 v8, p9

    .line 1192
    .line 1193
    goto :goto_1e

    .line 1194
    :cond_40
    move/from16 v8, v28

    .line 1195
    .line 1196
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 1197
    .line 1198
    .line 1199
    move-result v12

    .line 1200
    add-int v28, v8, v12

    .line 1201
    .line 1202
    new-array v8, v0, [B

    .line 1203
    .line 1204
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 1205
    .line 1206
    .line 1207
    move-result v1

    .line 1208
    const/4 v12, 0x0

    .line 1209
    invoke-static {v5, v1, v8, v12, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1210
    .line 1211
    .line 1212
    add-int/2addr v1, v0

    .line 1213
    array-length v0, v5

    .line 1214
    add-int v1, v1, v28

    .line 1215
    .line 1216
    sub-int/2addr v0, v1

    .line 1217
    move/from16 v18, v9

    .line 1218
    .line 1219
    new-array v9, v0, [B

    .line 1220
    .line 1221
    invoke-static {v5, v1, v9, v12, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1222
    .line 1223
    .line 1224
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/ads/zzgaa;->zzn(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 1225
    .line 1226
    .line 1227
    move-result-object v1

    .line 1228
    :goto_1f
    move-object/from16 v0, p7

    .line 1229
    .line 1230
    :goto_20
    move-object v5, v2

    .line 1231
    goto :goto_23

    .line 1232
    :cond_41
    move/from16 p9, v8

    .line 1233
    .line 1234
    move/from16 v18, v9

    .line 1235
    .line 1236
    const/4 v12, 0x0

    .line 1237
    const-string v0, "audio/mp4a-latm"

    .line 1238
    .line 1239
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1240
    .line 1241
    .line 1242
    move-result v0

    .line 1243
    if-eqz v0, :cond_42

    .line 1244
    .line 1245
    invoke-static {v5}, Ll/cdr0;->a([B)Ll/bdr0;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v0

    .line 1249
    iget v7, v0, Ll/bdr0;->a:I

    .line 1250
    .line 1251
    iget v10, v0, Ll/bdr0;->b:I

    .line 1252
    .line 1253
    iget-object v0, v0, Ll/bdr0;->c:Ljava/lang/String;

    .line 1254
    .line 1255
    goto :goto_21

    .line 1256
    :cond_42
    move-object/from16 v0, p7

    .line 1257
    .line 1258
    :goto_21
    invoke-static {v5}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v1

    .line 1262
    goto :goto_20

    .line 1263
    :cond_43
    move/from16 p9, v8

    .line 1264
    .line 1265
    move/from16 v18, v9

    .line 1266
    .line 1267
    const/4 v12, 0x0

    .line 1268
    goto :goto_1f

    .line 1269
    :goto_22
    move-object/from16 v0, p7

    .line 1270
    .line 1271
    :goto_23
    add-int v8, p9, v18

    .line 1272
    .line 1273
    move/from16 v2, p3

    .line 1274
    .line 1275
    move-object v12, v0

    .line 1276
    move-object/from16 v0, p0

    .line 1277
    .line 1278
    goto/16 :goto_b

    .line 1279
    .line 1280
    :cond_44
    move-object/from16 p7, v12

    .line 1281
    .line 1282
    iget-object v0, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 1283
    .line 1284
    if-nez v0, :cond_46

    .line 1285
    .line 1286
    if-eqz v5, :cond_46

    .line 1287
    .line 1288
    new-instance v0, Ll/znr0;

    .line 1289
    .line 1290
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 1291
    .line 1292
    .line 1293
    invoke-virtual {v0, v3}, Ll/znr0;->j(I)Ll/znr0;

    .line 1294
    .line 1295
    .line 1296
    invoke-virtual {v0, v5}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 1297
    .line 1298
    .line 1299
    move-object/from16 v2, p7

    .line 1300
    .line 1301
    invoke-virtual {v0, v2}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 1302
    .line 1303
    .line 1304
    invoke-virtual {v0, v10}, Ll/znr0;->k0(I)Ll/znr0;

    .line 1305
    .line 1306
    .line 1307
    invoke-virtual {v0, v7}, Ll/znr0;->x(I)Ll/znr0;

    .line 1308
    .line 1309
    .line 1310
    move/from16 v9, v23

    .line 1311
    .line 1312
    invoke-virtual {v0, v9}, Ll/znr0;->q(I)Ll/znr0;

    .line 1313
    .line 1314
    .line 1315
    invoke-virtual {v0, v1}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 1316
    .line 1317
    .line 1318
    invoke-virtual {v0, v13}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 1319
    .line 1320
    .line 1321
    invoke-virtual {v0, v4}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 1322
    .line 1323
    .line 1324
    if-eqz v16, :cond_45

    .line 1325
    .line 1326
    invoke-static/range {v16 .. v16}, Ll/bmr0;->a(Ll/bmr0;)J

    .line 1327
    .line 1328
    .line 1329
    move-result-wide v1

    .line 1330
    invoke-static {v1, v2}, Ll/utw0;->c(J)I

    .line 1331
    .line 1332
    .line 1333
    move-result v1

    .line 1334
    invoke-virtual {v0, v1}, Ll/znr0;->j0(I)Ll/znr0;

    .line 1335
    .line 1336
    .line 1337
    invoke-static/range {v16 .. v16}, Ll/bmr0;->b(Ll/bmr0;)J

    .line 1338
    .line 1339
    .line 1340
    move-result-wide v1

    .line 1341
    invoke-static {v1, v2}, Ll/utw0;->c(J)I

    .line 1342
    .line 1343
    .line 1344
    move-result v1

    .line 1345
    invoke-virtual {v0, v1}, Ll/znr0;->r(I)Ll/znr0;

    .line 1346
    .line 1347
    .line 1348
    :cond_45
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 1349
    .line 1350
    .line 1351
    move-result-object v0

    .line 1352
    iput-object v0, v6, Ll/dmr0;->b:Ll/sqr0;

    .line 1353
    .line 1354
    :cond_46
    return-void
.end method
