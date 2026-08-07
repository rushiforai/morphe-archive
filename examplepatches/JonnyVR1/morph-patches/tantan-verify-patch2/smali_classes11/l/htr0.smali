.class public final Ll/htr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final l:Ll/ifr0;


# instance fields
.field public final a:Ll/nnw0;

.field public final b:Landroid/util/SparseArray;

.field public final c:Ll/bgw0;

.field public final d:Ll/etr0;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:J

.field public i:Ll/dtr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/ser0;

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/ftr0;->b:Ll/ftr0;

    .line 2
    .line 3
    sput-object v0, Ll/htr0;->l:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    new-instance v0, Ll/nnw0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Ll/nnw0;-><init>(J)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/htr0;->a:Ll/nnw0;

    .line 12
    .line 13
    new-instance v0, Ll/bgw0;

    .line 14
    .line 15
    const/16 v1, 0x1000

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 21
    .line 22
    new-instance v0, Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/htr0;->b:Landroid/util/SparseArray;

    .line 28
    .line 29
    new-instance v0, Ll/etr0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/etr0;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/htr0;->d:Ll/etr0;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/htr0;->a:Ll/nnw0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nnw0;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long p2, v0, v2

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/nnw0;->d()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    cmp-long p2, v0, v2

    .line 21
    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long p2, v0, v2

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    cmp-long p2, v0, p3

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    :cond_0
    invoke-virtual {p1, p3, p4}, Ll/nnw0;->i(J)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/htr0;->i:Ll/dtr0;

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1, p3, p4}, Ll/ber0;->d(J)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/htr0;->b:Landroid/util/SparseArray;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-ge p2, p1, :cond_3

    .line 52
    .line 53
    iget-object p1, p0, Ll/htr0;->b:Landroid/util/SparseArray;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Ll/gtr0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/gtr0;->b()V

    .line 62
    .line 63
    .line 64
    add-int/lit8 p2, p2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    new-array v0, p0, [B

    .line 4
    .line 5
    check-cast p1, Ll/fer0;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1, p0, v1}, Ll/fer0;->c([BIIZ)Z

    .line 9
    .line 10
    .line 11
    aget-byte p0, v0, v1

    .line 12
    .line 13
    and-int/lit16 p0, p0, 0xff

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    aget-byte v3, v0, v2

    .line 17
    .line 18
    and-int/lit16 v3, v3, 0xff

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    aget-byte v5, v0, v4

    .line 22
    .line 23
    and-int/lit16 v5, v5, 0xff

    .line 24
    .line 25
    const/4 v6, 0x3

    .line 26
    aget-byte v7, v0, v6

    .line 27
    .line 28
    and-int/lit16 v7, v7, 0xff

    .line 29
    .line 30
    shl-int/lit8 p0, p0, 0x18

    .line 31
    .line 32
    shl-int/lit8 v3, v3, 0x10

    .line 33
    .line 34
    or-int/2addr p0, v3

    .line 35
    const/16 v3, 0x8

    .line 36
    .line 37
    shl-int/2addr v5, v3

    .line 38
    or-int/2addr p0, v5

    .line 39
    or-int/2addr p0, v7

    .line 40
    const/16 v5, 0x1ba

    .line 41
    .line 42
    if-eq p0, v5, :cond_0

    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    const/4 p0, 0x4

    .line 46
    aget-byte v5, v0, p0

    .line 47
    .line 48
    and-int/lit16 v5, v5, 0xc4

    .line 49
    .line 50
    const/16 v7, 0x44

    .line 51
    .line 52
    if-eq v5, v7, :cond_1

    .line 53
    .line 54
    return v1

    .line 55
    :cond_1
    const/4 v5, 0x6

    .line 56
    aget-byte v5, v0, v5

    .line 57
    .line 58
    and-int/2addr v5, p0

    .line 59
    if-eq v5, p0, :cond_2

    .line 60
    .line 61
    return v1

    .line 62
    :cond_2
    aget-byte v5, v0, v3

    .line 63
    .line 64
    and-int/2addr v5, p0

    .line 65
    if-eq v5, p0, :cond_3

    .line 66
    .line 67
    return v1

    .line 68
    :cond_3
    const/16 p0, 0x9

    .line 69
    .line 70
    aget-byte p0, v0, p0

    .line 71
    .line 72
    and-int/2addr p0, v2

    .line 73
    if-eq p0, v2, :cond_4

    .line 74
    .line 75
    return v1

    .line 76
    :cond_4
    const/16 p0, 0xc

    .line 77
    .line 78
    aget-byte p0, v0, p0

    .line 79
    .line 80
    and-int/2addr p0, v6

    .line 81
    if-eq p0, v6, :cond_5

    .line 82
    .line 83
    return v1

    .line 84
    :cond_5
    const/16 p0, 0xd

    .line 85
    .line 86
    aget-byte p0, v0, p0

    .line 87
    .line 88
    and-int/lit8 p0, p0, 0x7

    .line 89
    .line 90
    invoke-virtual {p1, p0, v1}, Ll/fer0;->j(IZ)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0, v1, v6, v1}, Ll/fer0;->c([BIIZ)Z

    .line 94
    .line 95
    .line 96
    aget-byte p0, v0, v1

    .line 97
    .line 98
    and-int/lit16 p0, p0, 0xff

    .line 99
    .line 100
    shl-int/lit8 p0, p0, 0x10

    .line 101
    .line 102
    aget-byte p1, v0, v2

    .line 103
    .line 104
    and-int/lit16 p1, p1, 0xff

    .line 105
    .line 106
    shl-int/2addr p1, v3

    .line 107
    aget-byte v0, v0, v4

    .line 108
    .line 109
    and-int/lit16 v0, v0, 0xff

    .line 110
    .line 111
    or-int/2addr p0, p1

    .line 112
    or-int/2addr p0, v0

    .line 113
    if-ne p0, v2, :cond_6

    .line 114
    .line 115
    return v2

    .line 116
    :cond_6
    return v1
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/htr0;->j:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/htr0;->j:Ll/ser0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 7
    .line 8
    .line 9
    move-result-wide v5

    .line 10
    const-wide/16 v7, -0x1

    .line 11
    .line 12
    cmp-long v0, v5, v7

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/htr0;->d:Ll/etr0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/etr0;->e()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v1, p1, p2}, Ll/etr0;->a(Ll/qer0;Ll/yfr0;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    iget-boolean v1, p0, Ll/htr0;->k:Z

    .line 31
    .line 32
    const/4 v9, 0x1

    .line 33
    if-nez v1, :cond_3

    .line 34
    .line 35
    iput-boolean v9, p0, Ll/htr0;->k:Z

    .line 36
    .line 37
    iget-object v1, p0, Ll/htr0;->d:Ll/etr0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/etr0;->b()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    cmp-long v2, v2, v10

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    move-object v2, v1

    .line 53
    new-instance v1, Ll/dtr0;

    .line 54
    .line 55
    move-object v3, v2

    .line 56
    invoke-virtual {v3}, Ll/etr0;->d()Ll/nnw0;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v3}, Ll/etr0;->b()J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    invoke-direct/range {v1 .. v6}, Ll/dtr0;-><init>(Ll/nnw0;JJ)V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Ll/htr0;->i:Ll/dtr0;

    .line 68
    .line 69
    iget-object v2, p0, Ll/htr0;->j:Ll/ser0;

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/ber0;->b()Ll/bgr0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v2, v1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    move-object v3, v1

    .line 80
    iget-object v1, p0, Ll/htr0;->j:Ll/ser0;

    .line 81
    .line 82
    new-instance v2, Ll/agr0;

    .line 83
    .line 84
    invoke-virtual {v3}, Ll/etr0;->b()J

    .line 85
    .line 86
    .line 87
    move-result-wide v3

    .line 88
    const-wide/16 v10, 0x0

    .line 89
    .line 90
    invoke-direct {v2, v3, v4, v10, v11}, Ll/agr0;-><init>(JJ)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v1, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    :goto_1
    iget-object v1, p0, Ll/htr0;->i:Ll/dtr0;

    .line 97
    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/ber0;->e()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_4

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_4
    invoke-virtual {v1, p1, p2}, Ll/ber0;->a(Ll/qer0;Ll/yfr0;)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0

    .line 112
    :cond_5
    :goto_2
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 113
    .line 114
    .line 115
    if-eqz v0, :cond_6

    .line 116
    .line 117
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    sub-long/2addr v5, v0

    .line 122
    goto :goto_3

    .line 123
    :cond_6
    move-wide v5, v7

    .line 124
    :goto_3
    cmp-long p2, v5, v7

    .line 125
    .line 126
    const/4 v0, -0x1

    .line 127
    if-eqz p2, :cond_8

    .line 128
    .line 129
    const-wide/16 v1, 0x4

    .line 130
    .line 131
    cmp-long p2, v5, v1

    .line 132
    .line 133
    if-ltz p2, :cond_7

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_7
    return v0

    .line 137
    :cond_8
    :goto_4
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 138
    .line 139
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    const/4 v1, 0x4

    .line 144
    const/4 v2, 0x0

    .line 145
    invoke-interface {p1, p2, v2, v1, v9}, Ll/qer0;->c([BIIZ)Z

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-nez p2, :cond_9

    .line 150
    .line 151
    return v0

    .line 152
    :cond_9
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 153
    .line 154
    invoke-virtual {p2, v2}, Ll/bgw0;->k(I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 158
    .line 159
    invoke-virtual {p2}, Ll/bgw0;->v()I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    const/16 v1, 0x1b9

    .line 164
    .line 165
    if-ne p2, v1, :cond_a

    .line 166
    .line 167
    return v0

    .line 168
    :cond_a
    const/16 v0, 0x1ba

    .line 169
    .line 170
    if-ne p2, v0, :cond_b

    .line 171
    .line 172
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 173
    .line 174
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    check-cast p1, Ll/fer0;

    .line 179
    .line 180
    const/16 v0, 0xa

    .line 181
    .line 182
    invoke-virtual {p1, p2, v2, v0, v2}, Ll/fer0;->c([BIIZ)Z

    .line 183
    .line 184
    .line 185
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 186
    .line 187
    const/16 v0, 0x9

    .line 188
    .line 189
    invoke-virtual {p2, v0}, Ll/bgw0;->k(I)V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    and-int/lit8 p0, p0, 0x7

    .line 199
    .line 200
    add-int/lit8 p0, p0, 0xe

    .line 201
    .line 202
    invoke-virtual {p1, p0, v2}, Ll/fer0;->k(IZ)Z

    .line 203
    .line 204
    .line 205
    return v2

    .line 206
    :cond_b
    const/16 v0, 0x1bb

    .line 207
    .line 208
    const/4 v1, 0x2

    .line 209
    const/4 v3, 0x6

    .line 210
    if-ne p2, v0, :cond_c

    .line 211
    .line 212
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 213
    .line 214
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    check-cast p1, Ll/fer0;

    .line 219
    .line 220
    invoke-virtual {p1, p2, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 221
    .line 222
    .line 223
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 224
    .line 225
    invoke-virtual {p2, v2}, Ll/bgw0;->k(I)V

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    add-int/2addr p0, v3

    .line 235
    invoke-virtual {p1, p0, v2}, Ll/fer0;->k(IZ)Z

    .line 236
    .line 237
    .line 238
    return v2

    .line 239
    :cond_c
    shr-int/lit8 v0, p2, 0x8

    .line 240
    .line 241
    if-eq v0, v9, :cond_d

    .line 242
    .line 243
    check-cast p1, Ll/fer0;

    .line 244
    .line 245
    invoke-virtual {p1, v9, v2}, Ll/fer0;->k(IZ)Z

    .line 246
    .line 247
    .line 248
    return v2

    .line 249
    :cond_d
    and-int/lit16 v0, p2, 0xff

    .line 250
    .line 251
    iget-object v4, p0, Ll/htr0;->b:Landroid/util/SparseArray;

    .line 252
    .line 253
    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    check-cast v4, Ll/gtr0;

    .line 258
    .line 259
    iget-boolean v5, p0, Ll/htr0;->e:Z

    .line 260
    .line 261
    if-nez v5, :cond_13

    .line 262
    .line 263
    if-nez v4, :cond_11

    .line 264
    .line 265
    const/16 v5, 0xbd

    .line 266
    .line 267
    const/4 v6, 0x0

    .line 268
    if-ne v0, v5, :cond_e

    .line 269
    .line 270
    new-instance p2, Ll/orr0;

    .line 271
    .line 272
    invoke-direct {p2, v6}, Ll/orr0;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iput-boolean v9, p0, Ll/htr0;->f:Z

    .line 276
    .line 277
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 278
    .line 279
    .line 280
    move-result-wide v5

    .line 281
    iput-wide v5, p0, Ll/htr0;->h:J

    .line 282
    .line 283
    :goto_5
    move-object v6, p2

    .line 284
    goto :goto_6

    .line 285
    :cond_e
    and-int/lit16 v5, p2, 0xe0

    .line 286
    .line 287
    const/16 v7, 0xc0

    .line 288
    .line 289
    if-ne v5, v7, :cond_f

    .line 290
    .line 291
    new-instance p2, Ll/xsr0;

    .line 292
    .line 293
    invoke-direct {p2, v6}, Ll/xsr0;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iput-boolean v9, p0, Ll/htr0;->f:Z

    .line 297
    .line 298
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 299
    .line 300
    .line 301
    move-result-wide v5

    .line 302
    iput-wide v5, p0, Ll/htr0;->h:J

    .line 303
    .line 304
    goto :goto_5

    .line 305
    :cond_f
    and-int/lit16 p2, p2, 0xf0

    .line 306
    .line 307
    const/16 v5, 0xe0

    .line 308
    .line 309
    if-ne p2, v5, :cond_10

    .line 310
    .line 311
    new-instance p2, Ll/lsr0;

    .line 312
    .line 313
    invoke-direct {p2, v6}, Ll/lsr0;-><init>(Ll/jur0;)V

    .line 314
    .line 315
    .line 316
    iput-boolean v9, p0, Ll/htr0;->g:Z

    .line 317
    .line 318
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 319
    .line 320
    .line 321
    move-result-wide v5

    .line 322
    iput-wide v5, p0, Ll/htr0;->h:J

    .line 323
    .line 324
    goto :goto_5

    .line 325
    :cond_10
    :goto_6
    if-eqz v6, :cond_11

    .line 326
    .line 327
    new-instance p2, Ll/gur0;

    .line 328
    .line 329
    const/high16 v4, -0x80000000

    .line 330
    .line 331
    const/16 v5, 0x100

    .line 332
    .line 333
    invoke-direct {p2, v4, v0, v5}, Ll/gur0;-><init>(III)V

    .line 334
    .line 335
    .line 336
    iget-object v4, p0, Ll/htr0;->j:Ll/ser0;

    .line 337
    .line 338
    invoke-interface {v6, v4, p2}, Ll/yrr0;->d(Ll/ser0;Ll/gur0;)V

    .line 339
    .line 340
    .line 341
    iget-object p2, p0, Ll/htr0;->a:Ll/nnw0;

    .line 342
    .line 343
    new-instance v4, Ll/gtr0;

    .line 344
    .line 345
    invoke-direct {v4, v6, p2}, Ll/gtr0;-><init>(Ll/yrr0;Ll/nnw0;)V

    .line 346
    .line 347
    .line 348
    iget-object p2, p0, Ll/htr0;->b:Landroid/util/SparseArray;

    .line 349
    .line 350
    invoke-virtual {p2, v0, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 351
    .line 352
    .line 353
    :cond_11
    iget-boolean p2, p0, Ll/htr0;->f:Z

    .line 354
    .line 355
    const-wide/32 v5, 0x100000

    .line 356
    .line 357
    .line 358
    if-eqz p2, :cond_12

    .line 359
    .line 360
    iget-boolean p2, p0, Ll/htr0;->g:Z

    .line 361
    .line 362
    if-eqz p2, :cond_12

    .line 363
    .line 364
    iget-wide v5, p0, Ll/htr0;->h:J

    .line 365
    .line 366
    const-wide/16 v7, 0x2000

    .line 367
    .line 368
    add-long/2addr v5, v7

    .line 369
    :cond_12
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 370
    .line 371
    .line 372
    move-result-wide v7

    .line 373
    cmp-long p2, v7, v5

    .line 374
    .line 375
    if-lez p2, :cond_13

    .line 376
    .line 377
    iput-boolean v9, p0, Ll/htr0;->e:Z

    .line 378
    .line 379
    iget-object p2, p0, Ll/htr0;->j:Ll/ser0;

    .line 380
    .line 381
    invoke-interface {p2}, Ll/ser0;->c()V

    .line 382
    .line 383
    .line 384
    :cond_13
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 385
    .line 386
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 387
    .line 388
    .line 389
    move-result-object p2

    .line 390
    check-cast p1, Ll/fer0;

    .line 391
    .line 392
    invoke-virtual {p1, p2, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 393
    .line 394
    .line 395
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 396
    .line 397
    invoke-virtual {p2, v2}, Ll/bgw0;->k(I)V

    .line 398
    .line 399
    .line 400
    iget-object p2, p0, Ll/htr0;->c:Ll/bgw0;

    .line 401
    .line 402
    invoke-virtual {p2}, Ll/bgw0;->F()I

    .line 403
    .line 404
    .line 405
    move-result p2

    .line 406
    add-int/2addr p2, v3

    .line 407
    if-nez v4, :cond_14

    .line 408
    .line 409
    invoke-virtual {p1, p2, v2}, Ll/fer0;->k(IZ)Z

    .line 410
    .line 411
    .line 412
    goto :goto_7

    .line 413
    :cond_14
    iget-object v0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 414
    .line 415
    invoke-virtual {v0, p2}, Ll/bgw0;->h(I)V

    .line 416
    .line 417
    .line 418
    iget-object v0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 419
    .line 420
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-virtual {p1, v0, v2, p2, v2}, Ll/fer0;->b([BIIZ)Z

    .line 425
    .line 426
    .line 427
    iget-object p1, p0, Ll/htr0;->c:Ll/bgw0;

    .line 428
    .line 429
    invoke-virtual {p1, v3}, Ll/bgw0;->k(I)V

    .line 430
    .line 431
    .line 432
    iget-object p1, p0, Ll/htr0;->c:Ll/bgw0;

    .line 433
    .line 434
    invoke-virtual {v4, p1}, Ll/gtr0;->a(Ll/bgw0;)V

    .line 435
    .line 436
    .line 437
    iget-object p0, p0, Ll/htr0;->c:Ll/bgw0;

    .line 438
    .line 439
    invoke-virtual {p0}, Ll/bgw0;->r()I

    .line 440
    .line 441
    .line 442
    move-result p1

    .line 443
    invoke-virtual {p0, p1}, Ll/bgw0;->j(I)V

    .line 444
    .line 445
    .line 446
    :goto_7
    return v2
.end method
