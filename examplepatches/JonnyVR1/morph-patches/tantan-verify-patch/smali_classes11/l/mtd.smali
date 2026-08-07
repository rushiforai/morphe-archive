.class public final Ll/mtd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jkj0$c;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0}, Ll/mtd;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, v0}, Ll/mtd;-><init>(ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Ll/mtd;->a:I

    .line 12
    iput-object p2, p0, Ll/mtd;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public a()Landroid/util/SparseArray;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Ll/jkj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(ILl/jkj0$b;)Ll/jkj0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_e

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    if-eq p1, v1, :cond_d

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    if-eq p1, v1, :cond_d

    .line 9
    .line 10
    const/16 v2, 0x15

    .line 11
    .line 12
    if-eq p1, v2, :cond_c

    .line 13
    .line 14
    const/16 v2, 0x1b

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-eq p1, v2, :cond_a

    .line 18
    .line 19
    const/16 v1, 0x24

    .line 20
    .line 21
    if-eq p1, v1, :cond_9

    .line 22
    .line 23
    const/16 v1, 0x59

    .line 24
    .line 25
    if-eq p1, v1, :cond_8

    .line 26
    .line 27
    const/16 v1, 0x8a

    .line 28
    .line 29
    if-eq p1, v1, :cond_7

    .line 30
    .line 31
    const/16 v1, 0xac

    .line 32
    .line 33
    if-eq p1, v1, :cond_6

    .line 34
    .line 35
    const/16 v1, 0x101

    .line 36
    .line 37
    if-eq p1, v1, :cond_5

    .line 38
    .line 39
    const/16 v1, 0x86

    .line 40
    .line 41
    if-eq p1, v1, :cond_3

    .line 42
    .line 43
    const/16 v1, 0x87

    .line 44
    .line 45
    if-eq p1, v1, :cond_2

    .line 46
    .line 47
    packed-switch p1, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    packed-switch p1, :pswitch_data_1

    .line 51
    .line 52
    .line 53
    return-object v3

    .line 54
    :pswitch_0
    const/16 p1, 0x40

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/mtd;->f(I)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_7

    .line 61
    .line 62
    return-object v3

    .line 63
    :pswitch_1
    invoke-virtual {p0, v0}, Ll/mtd;->f(I)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_0

    .line 68
    .line 69
    return-object v3

    .line 70
    :cond_0
    new-instance p0, Ll/yw60;

    .line 71
    .line 72
    new-instance p1, Ll/e9r;

    .line 73
    .line 74
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {p1, p2}, Ll/e9r;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 80
    .line 81
    .line 82
    return-object p0

    .line 83
    :pswitch_2
    new-instance p1, Ll/yw60;

    .line 84
    .line 85
    new-instance v0, Ll/owk;

    .line 86
    .line 87
    invoke-virtual {p0, p2}, Ll/mtd;->d(Ll/jkj0$b;)Ll/bek0;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-direct {v0, p0}, Ll/owk;-><init>(Ll/bek0;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p1, v0}, Ll/yw60;-><init>(Ll/hte;)V

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    :pswitch_3
    invoke-virtual {p0, v0}, Ll/mtd;->f(I)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_1

    .line 103
    .line 104
    return-object v3

    .line 105
    :cond_1
    new-instance p0, Ll/yw60;

    .line 106
    .line 107
    new-instance p1, Ll/w90;

    .line 108
    .line 109
    const/4 v0, 0x0

    .line 110
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 111
    .line 112
    invoke-direct {p1, v0, p2}, Ll/w90;-><init>(ZLjava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 116
    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_2
    :pswitch_4
    new-instance p0, Ll/yw60;

    .line 120
    .line 121
    new-instance p1, Ll/y8;

    .line 122
    .line 123
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 124
    .line 125
    invoke-direct {p1, p2}, Ll/y8;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 129
    .line 130
    .line 131
    return-object p0

    .line 132
    :cond_3
    const/16 p1, 0x10

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ll/mtd;->f(I)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_4

    .line 139
    .line 140
    return-object v3

    .line 141
    :cond_4
    new-instance p0, Ll/zee0;

    .line 142
    .line 143
    new-instance p1, Ll/yg60;

    .line 144
    .line 145
    const-string p2, "application/x-scte35"

    .line 146
    .line 147
    invoke-direct {p1, p2}, Ll/yg60;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-direct {p0, p1}, Ll/zee0;-><init>(Ll/yee0;)V

    .line 151
    .line 152
    .line 153
    return-object p0

    .line 154
    :cond_5
    new-instance p0, Ll/zee0;

    .line 155
    .line 156
    new-instance p1, Ll/yg60;

    .line 157
    .line 158
    const-string p2, "application/vnd.dvb.ait"

    .line 159
    .line 160
    invoke-direct {p1, p2}, Ll/yg60;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0, p1}, Ll/zee0;-><init>(Ll/yee0;)V

    .line 164
    .line 165
    .line 166
    return-object p0

    .line 167
    :cond_6
    new-instance p0, Ll/yw60;

    .line 168
    .line 169
    new-instance p1, Ll/c9;

    .line 170
    .line 171
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 172
    .line 173
    invoke-direct {p1, p2}, Ll/c9;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 177
    .line 178
    .line 179
    return-object p0

    .line 180
    :cond_7
    new-instance p0, Ll/yw60;

    .line 181
    .line 182
    new-instance p1, Ll/nfe;

    .line 183
    .line 184
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 185
    .line 186
    invoke-direct {p1, p2}, Ll/nfe;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 190
    .line 191
    .line 192
    return-object p0

    .line 193
    :cond_8
    new-instance p0, Ll/yw60;

    .line 194
    .line 195
    new-instance p1, Ll/yfe;

    .line 196
    .line 197
    iget-object p2, p2, Ll/jkj0$b;->c:Ljava/util/List;

    .line 198
    .line 199
    invoke-direct {p1, p2}, Ll/yfe;-><init>(Ljava/util/List;)V

    .line 200
    .line 201
    .line 202
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 203
    .line 204
    .line 205
    return-object p0

    .line 206
    :cond_9
    new-instance p1, Ll/yw60;

    .line 207
    .line 208
    new-instance v0, Ll/rwk;

    .line 209
    .line 210
    invoke-virtual {p0, p2}, Ll/mtd;->c(Ll/jkj0$b;)Ll/vke0;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-direct {v0, p0}, Ll/rwk;-><init>(Ll/vke0;)V

    .line 215
    .line 216
    .line 217
    invoke-direct {p1, v0}, Ll/yw60;-><init>(Ll/hte;)V

    .line 218
    .line 219
    .line 220
    return-object p1

    .line 221
    :cond_a
    invoke-virtual {p0, v1}, Ll/mtd;->f(I)Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-eqz p1, :cond_b

    .line 226
    .line 227
    return-object v3

    .line 228
    :cond_b
    new-instance p1, Ll/yw60;

    .line 229
    .line 230
    new-instance v0, Ll/qwk;

    .line 231
    .line 232
    invoke-virtual {p0, p2}, Ll/mtd;->c(Ll/jkj0$b;)Ll/vke0;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    const/4 v1, 0x1

    .line 237
    invoke-virtual {p0, v1}, Ll/mtd;->f(I)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    const/16 v2, 0x8

    .line 242
    .line 243
    invoke-virtual {p0, v2}, Ll/mtd;->f(I)Z

    .line 244
    .line 245
    .line 246
    move-result p0

    .line 247
    invoke-direct {v0, p2, v1, p0}, Ll/qwk;-><init>(Ll/vke0;ZZ)V

    .line 248
    .line 249
    .line 250
    invoke-direct {p1, v0}, Ll/yw60;-><init>(Ll/hte;)V

    .line 251
    .line 252
    .line 253
    return-object p1

    .line 254
    :cond_c
    new-instance p0, Ll/yw60;

    .line 255
    .line 256
    new-instance p1, Ll/mdm;

    .line 257
    .line 258
    invoke-direct {p1}, Ll/mdm;-><init>()V

    .line 259
    .line 260
    .line 261
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 262
    .line 263
    .line 264
    return-object p0

    .line 265
    :cond_d
    new-instance p0, Ll/yw60;

    .line 266
    .line 267
    new-instance p1, Ll/h710;

    .line 268
    .line 269
    iget-object p2, p2, Ll/jkj0$b;->b:Ljava/lang/String;

    .line 270
    .line 271
    invoke-direct {p1, p2}, Ll/h710;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-direct {p0, p1}, Ll/yw60;-><init>(Ll/hte;)V

    .line 275
    .line 276
    .line 277
    return-object p0

    .line 278
    :cond_e
    :pswitch_5
    new-instance p1, Ll/yw60;

    .line 279
    .line 280
    new-instance v0, Ll/nwk;

    .line 281
    .line 282
    invoke-virtual {p0, p2}, Ll/mtd;->d(Ll/jkj0$b;)Ll/bek0;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-direct {v0, p0}, Ll/nwk;-><init>(Ll/bek0;)V

    .line 287
    .line 288
    .line 289
    invoke-direct {p1, v0}, Ll/yw60;-><init>(Ll/hte;)V

    .line 290
    .line 291
    .line 292
    return-object p1

    .line 293
    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    :pswitch_data_1
    .packed-switch 0x80
        :pswitch_5
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ll/jkj0$b;)Ll/vke0;
    .locals 1

    .line 1
    new-instance v0, Ll/vke0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mtd;->e(Ll/jkj0$b;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/vke0;-><init>(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final d(Ll/jkj0$b;)Ll/bek0;
    .locals 1

    .line 1
    new-instance v0, Ll/bek0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mtd;->e(Ll/jkj0$b;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/bek0;-><init>(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final e(Ll/jkj0$b;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jkj0$b;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/mtd;->f(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mtd;->b:Ljava/util/List;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/ig60;

    .line 13
    .line 14
    iget-object p1, p1, Ll/jkj0$b;->d:[B

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/ig60;-><init>([B)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/mtd;->b:Ljava/util/List;

    .line 20
    .line 21
    :goto_0
    invoke-virtual {v0}, Ll/ig60;->a()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-lez p1, :cond_6

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-int/2addr v2, v1

    .line 40
    const/16 v1, 0x86

    .line 41
    .line 42
    if-ne p1, v1, :cond_5

    .line 43
    .line 44
    new-instance p0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    and-int/lit8 p1, p1, 0x1f

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    move v3, v1

    .line 57
    :goto_1
    if-ge v3, p1, :cond_5

    .line 58
    .line 59
    const/4 v4, 0x3

    .line 60
    invoke-virtual {v0, v4}, Ll/ig60;->E(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    and-int/lit16 v6, v5, 0x80

    .line 69
    .line 70
    const/4 v7, 0x1

    .line 71
    if-eqz v6, :cond_1

    .line 72
    .line 73
    move v6, v7

    .line 74
    goto :goto_2

    .line 75
    :cond_1
    move v6, v1

    .line 76
    :goto_2
    if-eqz v6, :cond_2

    .line 77
    .line 78
    and-int/lit8 v5, v5, 0x3f

    .line 79
    .line 80
    const-string v8, "application/cea-708"

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_2
    const-string v8, "application/cea-608"

    .line 84
    .line 85
    move v5, v7

    .line 86
    :goto_3
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 87
    .line 88
    .line 89
    move-result v9

    .line 90
    int-to-byte v9, v9

    .line 91
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 92
    .line 93
    .line 94
    if-eqz v6, :cond_4

    .line 95
    .line 96
    and-int/lit8 v6, v9, 0x40

    .line 97
    .line 98
    if-eqz v6, :cond_3

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_3
    move v7, v1

    .line 102
    :goto_4
    invoke-static {v7}, Ll/lc5;->b(Z)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    goto :goto_5

    .line 107
    :cond_4
    const/4 v6, 0x0

    .line 108
    :goto_5
    new-instance v7, Lcom/google/android/exoplayer2/k$b;

    .line 109
    .line 110
    invoke-direct {v7}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-virtual {v7, v4}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->H(I)Lcom/google/android/exoplayer2/k$b;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v4, v6}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    add-int/lit8 v3, v3, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    invoke-virtual {v0, v2}, Ll/ig60;->U(I)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_6
    return-object p0
.end method

.method public final f(I)Z
    .locals 0

    .line 1
    iget p0, p0, Ll/mtd;->a:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
