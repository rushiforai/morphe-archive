.class public final Ll/nir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# instance fields
.field public final a:Ll/bgw0;

.field public b:Ll/ser0;

.field public c:I

.field public d:I

.field public e:I

.field public f:J

.field public g:Lcom/google/android/gms/internal/ads/zzahe;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/qer0;

.field public i:Ll/qir0;

.field public j:Ll/cnr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    iput-wide v0, p0, Ll/nir0;->f:J

    .line 15
    .line 16
    return-void
.end method

.method private final a(Ll/qer0;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast p1, Ll/fer0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p1, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method private final b()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/nir0;->g([Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nir0;->b:Ll/ser0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-interface {v0}, Ll/ser0;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/nir0;->b:Ll/ser0;

    .line 16
    .line 17
    new-instance v1, Ll/agr0;

    .line 18
    .line 19
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    const-wide/16 v4, 0x0

    .line 25
    .line 26
    invoke-direct {v1, v2, v3, v4, v5}, Ll/agr0;-><init>(JJ)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x6

    .line 33
    iput v0, p0, Ll/nir0;->c:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/nir0;->c:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/nir0;->j:Ll/cnr0;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Ll/nir0;->c:I

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/nir0;->j:Ll/cnr0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cnr0;->c(JJ)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/nir0;->a(Ll/qer0;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xffd8

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    invoke-direct {p0, p1}, Ll/nir0;->a(Ll/qer0;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/nir0;->d:I

    .line 17
    .line 18
    const v1, 0xffe0

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Ll/bgw0;->h(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    move-object v1, p1

    .line 36
    check-cast v1, Ll/fer0;

    .line 37
    .line 38
    invoke-virtual {v1, v0, v2, v3, v2}, Ll/fer0;->c([BIIZ)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/lit8 v0, v0, -0x2

    .line 48
    .line 49
    invoke-virtual {v1, v0, v2}, Ll/fer0;->j(IZ)Z

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p1}, Ll/nir0;->a(Ll/qer0;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Ll/nir0;->d:I

    .line 57
    .line 58
    :cond_1
    const v1, 0xffe1

    .line 59
    .line 60
    .line 61
    if-ne v0, v1, :cond_2

    .line 62
    .line 63
    check-cast p1, Ll/fer0;

    .line 64
    .line 65
    invoke-virtual {p1, v3, v2}, Ll/fer0;->j(IZ)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 69
    .line 70
    const/4 v1, 0x6

    .line 71
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/nir0;->a:Ll/bgw0;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/bgw0;->J()J

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    const-wide/32 v3, 0x45786966    # 5.758429993E-315

    .line 90
    .line 91
    .line 92
    cmp-long p1, v0, v3

    .line 93
    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    iget-object p0, p0, Ll/nir0;->a:Ll/bgw0;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_2

    .line 103
    .line 104
    const/4 p0, 0x1

    .line 105
    return p0

    .line 106
    :cond_2
    return v2
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nir0;->b:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget v3, v0, Ll/nir0;->c:I

    .line 8
    .line 9
    const/4 v4, 0x4

    .line 10
    const/4 v5, 0x1

    .line 11
    const-wide/16 v6, -0x1

    .line 12
    .line 13
    const/4 v8, 0x2

    .line 14
    const/4 v9, 0x0

    .line 15
    if-eqz v3, :cond_18

    .line 16
    .line 17
    if-eq v3, v5, :cond_17

    .line 18
    .line 19
    const/4 v10, -0x1

    .line 20
    if-eq v3, v8, :cond_a

    .line 21
    .line 22
    const/4 v6, 0x5

    .line 23
    if-eq v3, v4, :cond_5

    .line 24
    .line 25
    if-eq v3, v6, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x6

    .line 28
    if-ne v3, v0, :cond_0

    .line 29
    .line 30
    return v10

    .line 31
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 32
    .line 33
    .line 34
    return v9

    .line 35
    :cond_1
    iget-object v3, v0, Ll/nir0;->i:Ll/qir0;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    iget-object v3, v0, Ll/nir0;->h:Ll/qer0;

    .line 40
    .line 41
    if-eq v1, v3, :cond_3

    .line 42
    .line 43
    :cond_2
    iput-object v1, v0, Ll/nir0;->h:Ll/qer0;

    .line 44
    .line 45
    new-instance v3, Ll/qir0;

    .line 46
    .line 47
    iget-wide v6, v0, Ll/nir0;->f:J

    .line 48
    .line 49
    invoke-direct {v3, v1, v6, v7}, Ll/qir0;-><init>(Ll/qer0;J)V

    .line 50
    .line 51
    .line 52
    iput-object v3, v0, Ll/nir0;->i:Ll/qir0;

    .line 53
    .line 54
    :cond_3
    iget-object v1, v0, Ll/nir0;->j:Ll/cnr0;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    iget-object v3, v0, Ll/nir0;->i:Ll/qir0;

    .line 60
    .line 61
    invoke-virtual {v1, v3, v2}, Ll/cnr0;->f(Ll/qer0;Ll/yfr0;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-ne v1, v5, :cond_4

    .line 66
    .line 67
    iget-wide v3, v2, Ll/yfr0;->a:J

    .line 68
    .line 69
    iget-wide v5, v0, Ll/nir0;->f:J

    .line 70
    .line 71
    add-long/2addr v3, v5

    .line 72
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 73
    .line 74
    :cond_4
    return v1

    .line 75
    :cond_5
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    iget-wide v7, v0, Ll/nir0;->f:J

    .line 80
    .line 81
    cmp-long v3, v3, v7

    .line 82
    .line 83
    if-nez v3, :cond_9

    .line 84
    .line 85
    iget-object v2, v0, Ll/nir0;->a:Ll/bgw0;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-interface {v1, v2, v9, v5, v5}, Ll/qer0;->c([BIIZ)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_6

    .line 96
    .line 97
    invoke-direct {v0}, Ll/nir0;->b()V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_6
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 102
    .line 103
    .line 104
    iget-object v2, v0, Ll/nir0;->j:Ll/cnr0;

    .line 105
    .line 106
    if-nez v2, :cond_7

    .line 107
    .line 108
    new-instance v2, Ll/cnr0;

    .line 109
    .line 110
    sget-object v3, Ll/vor0;->a:Ll/vor0;

    .line 111
    .line 112
    const/16 v4, 0x8

    .line 113
    .line 114
    invoke-direct {v2, v3, v4}, Ll/cnr0;-><init>(Ll/vor0;I)V

    .line 115
    .line 116
    .line 117
    iput-object v2, v0, Ll/nir0;->j:Ll/cnr0;

    .line 118
    .line 119
    :cond_7
    new-instance v2, Ll/qir0;

    .line 120
    .line 121
    iget-wide v3, v0, Ll/nir0;->f:J

    .line 122
    .line 123
    invoke-direct {v2, v1, v3, v4}, Ll/qir0;-><init>(Ll/qer0;J)V

    .line 124
    .line 125
    .line 126
    iput-object v2, v0, Ll/nir0;->i:Ll/qir0;

    .line 127
    .line 128
    iget-object v1, v0, Ll/nir0;->j:Ll/cnr0;

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Ll/cnr0;->d(Ll/qer0;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    iget-object v1, v0, Ll/nir0;->j:Ll/cnr0;

    .line 137
    .line 138
    new-instance v2, Ll/sir0;

    .line 139
    .line 140
    iget-wide v3, v0, Ll/nir0;->f:J

    .line 141
    .line 142
    iget-object v7, v0, Ll/nir0;->b:Ll/ser0;

    .line 143
    .line 144
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    invoke-direct {v2, v3, v4, v7}, Ll/sir0;-><init>(JLl/ser0;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v2}, Ll/cnr0;->e(Ll/ser0;)V

    .line 151
    .line 152
    .line 153
    iget-object v1, v0, Ll/nir0;->g:Lcom/google/android/gms/internal/ads/zzahe;

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    new-array v2, v5, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 159
    .line 160
    aput-object v1, v2, v9

    .line 161
    .line 162
    invoke-virtual {v0, v2}, Ll/nir0;->g([Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 163
    .line 164
    .line 165
    iput v6, v0, Ll/nir0;->c:I

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_8
    invoke-direct {v0}, Ll/nir0;->b()V

    .line 169
    .line 170
    .line 171
    :goto_0
    return v9

    .line 172
    :cond_9
    iput-wide v7, v2, Ll/yfr0;->a:J

    .line 173
    .line 174
    return v5

    .line 175
    :cond_a
    iget v2, v0, Ll/nir0;->d:I

    .line 176
    .line 177
    const v3, 0xffe1

    .line 178
    .line 179
    .line 180
    if-ne v2, v3, :cond_15

    .line 181
    .line 182
    new-instance v2, Ll/bgw0;

    .line 183
    .line 184
    iget v3, v0, Ll/nir0;->e:I

    .line 185
    .line 186
    invoke-direct {v2, v3}, Ll/bgw0;-><init>(I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    iget v4, v0, Ll/nir0;->e:I

    .line 194
    .line 195
    move-object v5, v1

    .line 196
    check-cast v5, Ll/fer0;

    .line 197
    .line 198
    invoke-virtual {v5, v3, v9, v4, v9}, Ll/fer0;->b([BIIZ)Z

    .line 199
    .line 200
    .line 201
    iget-object v3, v0, Ll/nir0;->g:Lcom/google/android/gms/internal/ads/zzahe;

    .line 202
    .line 203
    if-nez v3, :cond_16

    .line 204
    .line 205
    invoke-virtual {v2, v9}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    const-string v4, "http://ns.adobe.com/xap/1.0/"

    .line 210
    .line 211
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_16

    .line 216
    .line 217
    invoke-virtual {v2, v9}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    if-eqz v2, :cond_16

    .line 222
    .line 223
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 224
    .line 225
    .line 226
    move-result-wide v3

    .line 227
    cmp-long v1, v3, v6

    .line 228
    .line 229
    if-nez v1, :cond_c

    .line 230
    .line 231
    :cond_b
    :goto_1
    const/4 v5, 0x0

    .line 232
    goto/16 :goto_6

    .line 233
    .line 234
    :cond_c
    invoke-static {v2}, Ll/tir0;->a(Ljava/lang/String;)Ll/pir0;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    if-nez v1, :cond_d

    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_d
    iget-object v2, v1, Ll/pir0;->b:Ljava/util/List;

    .line 242
    .line 243
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-ge v2, v8, :cond_e

    .line 248
    .line 249
    goto :goto_1

    .line 250
    :cond_e
    iget-object v2, v1, Ll/pir0;->b:Ljava/util/List;

    .line 251
    .line 252
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    add-int/2addr v2, v10

    .line 257
    move-wide v11, v6

    .line 258
    move-wide v13, v11

    .line 259
    move-wide/from16 v17, v13

    .line 260
    .line 261
    move-wide/from16 v19, v17

    .line 262
    .line 263
    move v8, v9

    .line 264
    :goto_2
    if-ltz v2, :cond_13

    .line 265
    .line 266
    iget-object v10, v1, Ll/pir0;->b:Ljava/util/List;

    .line 267
    .line 268
    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v10

    .line 272
    check-cast v10, Ll/oir0;

    .line 273
    .line 274
    iget-object v15, v10, Ll/oir0;->a:Ljava/lang/String;

    .line 275
    .line 276
    const-string v5, "video/mp4"

    .line 277
    .line 278
    invoke-virtual {v5, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result v5

    .line 282
    or-int/2addr v5, v8

    .line 283
    if-nez v2, :cond_f

    .line 284
    .line 285
    move-wide v15, v6

    .line 286
    iget-wide v6, v10, Ll/oir0;->d:J

    .line 287
    .line 288
    sub-long/2addr v3, v6

    .line 289
    const-wide/16 v6, 0x0

    .line 290
    .line 291
    :goto_3
    move-wide/from16 v21, v6

    .line 292
    .line 293
    move-wide v6, v3

    .line 294
    move-wide/from16 v3, v21

    .line 295
    .line 296
    goto :goto_4

    .line 297
    :cond_f
    move-wide v15, v6

    .line 298
    iget-wide v6, v10, Ll/oir0;->c:J

    .line 299
    .line 300
    sub-long v6, v3, v6

    .line 301
    .line 302
    goto :goto_3

    .line 303
    :goto_4
    if-eqz v5, :cond_10

    .line 304
    .line 305
    cmp-long v8, v3, v6

    .line 306
    .line 307
    if-eqz v8, :cond_10

    .line 308
    .line 309
    sub-long v19, v6, v3

    .line 310
    .line 311
    move-wide/from16 v17, v3

    .line 312
    .line 313
    move v8, v9

    .line 314
    goto :goto_5

    .line 315
    :cond_10
    move v8, v5

    .line 316
    :goto_5
    if-nez v2, :cond_11

    .line 317
    .line 318
    move-wide v13, v6

    .line 319
    :cond_11
    if-nez v2, :cond_12

    .line 320
    .line 321
    move-wide v11, v3

    .line 322
    :cond_12
    add-int/lit8 v2, v2, -0x1

    .line 323
    .line 324
    move-wide v6, v15

    .line 325
    goto :goto_2

    .line 326
    :cond_13
    move-wide v15, v6

    .line 327
    cmp-long v2, v17, v15

    .line 328
    .line 329
    if-eqz v2, :cond_b

    .line 330
    .line 331
    cmp-long v2, v19, v15

    .line 332
    .line 333
    if-eqz v2, :cond_b

    .line 334
    .line 335
    cmp-long v2, v11, v15

    .line 336
    .line 337
    if-eqz v2, :cond_b

    .line 338
    .line 339
    cmp-long v2, v13, v15

    .line 340
    .line 341
    if-nez v2, :cond_14

    .line 342
    .line 343
    goto :goto_1

    .line 344
    :cond_14
    iget-wide v1, v1, Ll/pir0;->a:J

    .line 345
    .line 346
    new-instance v10, Lcom/google/android/gms/internal/ads/zzahe;

    .line 347
    .line 348
    move-wide v15, v1

    .line 349
    invoke-direct/range {v10 .. v20}, Lcom/google/android/gms/internal/ads/zzahe;-><init>(JJJJJ)V

    .line 350
    .line 351
    .line 352
    move-object v5, v10

    .line 353
    :goto_6
    iput-object v5, v0, Ll/nir0;->g:Lcom/google/android/gms/internal/ads/zzahe;

    .line 354
    .line 355
    if-eqz v5, :cond_16

    .line 356
    .line 357
    iget-wide v1, v5, Lcom/google/android/gms/internal/ads/zzahe;->zzd:J

    .line 358
    .line 359
    iput-wide v1, v0, Ll/nir0;->f:J

    .line 360
    .line 361
    goto :goto_7

    .line 362
    :cond_15
    iget v2, v0, Ll/nir0;->e:I

    .line 363
    .line 364
    check-cast v1, Ll/fer0;

    .line 365
    .line 366
    invoke-virtual {v1, v2, v9}, Ll/fer0;->k(IZ)Z

    .line 367
    .line 368
    .line 369
    :cond_16
    :goto_7
    iput v9, v0, Ll/nir0;->c:I

    .line 370
    .line 371
    return v9

    .line 372
    :cond_17
    iget-object v2, v0, Ll/nir0;->a:Ll/bgw0;

    .line 373
    .line 374
    invoke-virtual {v2, v8}, Ll/bgw0;->h(I)V

    .line 375
    .line 376
    .line 377
    iget-object v2, v0, Ll/nir0;->a:Ll/bgw0;

    .line 378
    .line 379
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    check-cast v1, Ll/fer0;

    .line 384
    .line 385
    invoke-virtual {v1, v2, v9, v8, v9}, Ll/fer0;->b([BIIZ)Z

    .line 386
    .line 387
    .line 388
    iget-object v1, v0, Ll/nir0;->a:Ll/bgw0;

    .line 389
    .line 390
    invoke-virtual {v1}, Ll/bgw0;->F()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    add-int/lit8 v1, v1, -0x2

    .line 395
    .line 396
    iput v1, v0, Ll/nir0;->e:I

    .line 397
    .line 398
    iput v8, v0, Ll/nir0;->c:I

    .line 399
    .line 400
    return v9

    .line 401
    :cond_18
    move-wide v15, v6

    .line 402
    iget-object v2, v0, Ll/nir0;->a:Ll/bgw0;

    .line 403
    .line 404
    invoke-virtual {v2, v8}, Ll/bgw0;->h(I)V

    .line 405
    .line 406
    .line 407
    iget-object v2, v0, Ll/nir0;->a:Ll/bgw0;

    .line 408
    .line 409
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v1, Ll/fer0;

    .line 414
    .line 415
    invoke-virtual {v1, v2, v9, v8, v9}, Ll/fer0;->b([BIIZ)Z

    .line 416
    .line 417
    .line 418
    iget-object v1, v0, Ll/nir0;->a:Ll/bgw0;

    .line 419
    .line 420
    invoke-virtual {v1}, Ll/bgw0;->F()I

    .line 421
    .line 422
    .line 423
    move-result v1

    .line 424
    iput v1, v0, Ll/nir0;->d:I

    .line 425
    .line 426
    const v2, 0xffda

    .line 427
    .line 428
    .line 429
    if-ne v1, v2, :cond_1a

    .line 430
    .line 431
    iget-wide v1, v0, Ll/nir0;->f:J

    .line 432
    .line 433
    cmp-long v1, v1, v15

    .line 434
    .line 435
    if-eqz v1, :cond_19

    .line 436
    .line 437
    iput v4, v0, Ll/nir0;->c:I

    .line 438
    .line 439
    goto :goto_8

    .line 440
    :cond_19
    invoke-direct {v0}, Ll/nir0;->b()V

    .line 441
    .line 442
    .line 443
    goto :goto_8

    .line 444
    :cond_1a
    const v2, 0xffd0

    .line 445
    .line 446
    .line 447
    if-lt v1, v2, :cond_1b

    .line 448
    .line 449
    const v2, 0xffd9

    .line 450
    .line 451
    .line 452
    if-le v1, v2, :cond_1c

    .line 453
    .line 454
    :cond_1b
    const v2, 0xff01

    .line 455
    .line 456
    .line 457
    if-eq v1, v2, :cond_1c

    .line 458
    .line 459
    iput v5, v0, Ll/nir0;->c:I

    .line 460
    .line 461
    :cond_1c
    :goto_8
    return v9
.end method

.method public final varargs g([Lcom/google/android/gms/internal/ads/zzbx;)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/nir0;->b:Ll/ser0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x400

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-interface {p0, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/znr0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "image/jpeg"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/znr0;->b(Ljava/lang/String;)Ll/znr0;

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/google/android/gms/internal/ads/zzby;

    .line 24
    .line 25
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p0, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
