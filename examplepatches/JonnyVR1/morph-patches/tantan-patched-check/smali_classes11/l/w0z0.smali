.class public final Ll/w0z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x6z0;
.implements Ll/zyy0;


# instance fields
.field public final a:J

.field public final b:Landroid/net/Uri;

.field public final c:Ll/xsx0;

.field public final d:Ll/q0z0;

.field public final e:Ll/ser0;

.field public final f:Ll/bjv0;

.field public final g:Ll/yfr0;

.field public volatile h:Z

.field public i:Z

.field public j:J

.field public k:Ll/akx0;

.field public l:Ll/sgr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Z

.field public final synthetic n:Ll/b1z0;


# direct methods
.method public constructor <init>(Ll/b1z0;Landroid/net/Uri;Ll/fex0;Ll/q0z0;Ll/ser0;Ll/bjv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0z0;->n:Ll/b1z0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/w0z0;->b:Landroid/net/Uri;

    .line 7
    .line 8
    new-instance p1, Ll/xsx0;

    .line 9
    .line 10
    invoke-direct {p1, p3}, Ll/xsx0;-><init>(Ll/fex0;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/w0z0;->c:Ll/xsx0;

    .line 14
    .line 15
    iput-object p4, p0, Ll/w0z0;->d:Ll/q0z0;

    .line 16
    .line 17
    iput-object p5, p0, Ll/w0z0;->e:Ll/ser0;

    .line 18
    .line 19
    iput-object p6, p0, Ll/w0z0;->f:Ll/bjv0;

    .line 20
    .line 21
    new-instance p1, Ll/yfr0;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/yfr0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/w0z0;->g:Ll/yfr0;

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Ll/w0z0;->i:Z

    .line 30
    .line 31
    invoke-static {}, Ll/bzy0;->a()J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iput-wide p1, p0, Ll/w0z0;->a:J

    .line 36
    .line 37
    const-wide/16 p1, 0x0

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Ll/w0z0;->g(J)Ll/akx0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/w0z0;->k:Ll/akx0;

    .line 44
    .line 45
    return-void
.end method

.method public static bridge synthetic a(Ll/w0z0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/w0z0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic c(Ll/w0z0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/w0z0;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic d(Ll/w0z0;)Ll/akx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0z0;->k:Ll/akx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/w0z0;)Ll/xsx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0z0;->c:Ll/xsx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/w0z0;JJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0z0;->g:Ll/yfr0;

    .line 2
    .line 3
    iput-wide p1, v0, Ll/yfr0;->a:J

    .line 4
    .line 5
    iput-wide p3, p0, Ll/w0z0;->j:J

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/w0z0;->i:Z

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/w0z0;->m:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b(Ll/bgw0;)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Ll/w0z0;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-wide v2, p0, Ll/w0z0;->j:J

    .line 7
    .line 8
    :goto_0
    move-wide v5, v2

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/w0z0;->n:Ll/b1z0;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/b1z0;->M(Ll/b1z0;Z)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-wide v4, p0, Ll/w0z0;->j:J

    .line 17
    .line 18
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 24
    .line 25
    .line 26
    move-result v8

    .line 27
    iget-object v4, p0, Ll/w0z0;->l:Ll/sgr0;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    invoke-static {v4, p1, v8}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 33
    .line 34
    .line 35
    const/4 v9, 0x0

    .line 36
    const/4 v10, 0x0

    .line 37
    const/4 v7, 0x1

    .line 38
    invoke-interface/range {v4 .. v10}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 39
    .line 40
    .line 41
    iput-boolean v1, p0, Ll/w0z0;->m:Z

    .line 42
    .line 43
    return-void
.end method

.method public final g(J)Ll/akx0;
    .locals 1

    .line 1
    new-instance v0, Ll/ehx0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ehx0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/w0z0;->b:Landroid/net/Uri;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/ehx0;->d(Landroid/net/Uri;)Ll/ehx0;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ll/ehx0;->c(J)Ll/ehx0;

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x6

    .line 15
    invoke-virtual {v0, p0}, Ll/ehx0;->a(I)Ll/ehx0;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/b1z0;->S()Ljava/util/Map;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ll/ehx0;->b(Ljava/util/Map;)Ll/ehx0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ll/ehx0;->e()Ll/akx0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final zzg()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/w0z0;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final zzh()V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "Invalid metadata interval: "

    .line 4
    .line 5
    :cond_0
    iget-boolean v2, v1, Ll/w0z0;->h:Z

    .line 6
    .line 7
    if-nez v2, :cond_16

    .line 8
    .line 9
    const-wide/16 v2, -0x1

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    const/4 v5, 0x0

    .line 13
    :try_start_0
    iget-object v6, v1, Ll/w0z0;->g:Ll/yfr0;

    .line 14
    .line 15
    iget-wide v11, v6, Ll/yfr0;->a:J

    .line 16
    .line 17
    invoke-virtual {v1, v11, v12}, Ll/w0z0;->g(J)Ll/akx0;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    iput-object v6, v1, Ll/w0z0;->k:Ll/akx0;

    .line 22
    .line 23
    iget-object v7, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 24
    .line 25
    invoke-virtual {v7, v6}, Ll/xsx0;->e(Ll/akx0;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v6

    .line 29
    iget-boolean v8, v1, Ll/w0z0;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    if-eqz v8, :cond_2

    .line 32
    .line 33
    iget-object v0, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/q0z0;->zzb()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    cmp-long v2, v4, v2

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object v2, v1, Ll/w0z0;->g:Ll/yfr0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/q0z0;->zzb()J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 50
    .line 51
    :cond_1
    iget-object v0, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 52
    .line 53
    invoke-static {v0}, Ll/igx0;->a(Ll/fex0;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    cmp-long v8, v6, v2

    .line 58
    .line 59
    if-eqz v8, :cond_3

    .line 60
    .line 61
    add-long/2addr v6, v11

    .line 62
    :try_start_1
    iget-object v8, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 63
    .line 64
    invoke-static {v8}, Ll/b1z0;->q(Ll/b1z0;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    move-wide v13, v6

    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    move-wide/from16 v16, v2

    .line 71
    .line 72
    goto/16 :goto_d

    .line 73
    .line 74
    :goto_0
    iget-object v6, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 75
    .line 76
    iget-object v7, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 77
    .line 78
    invoke-virtual {v7}, Ll/xsx0;->zze()Ljava/util/Map;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v8, "icy-br"

    .line 83
    .line 84
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    check-cast v8, Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    .line 90
    const-string v9, "IcyHeaders"

    .line 91
    .line 92
    const/4 v10, -0x1

    .line 93
    if-eqz v8, :cond_5

    .line 94
    .line 95
    :try_start_2
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    check-cast v8, Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    .line 101
    :try_start_3
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v15
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    mul-int/lit16 v15, v15, 0x3e8

    .line 106
    .line 107
    if-lez v15, :cond_4

    .line 108
    .line 109
    move-wide/from16 v16, v2

    .line 110
    .line 111
    move v2, v4

    .line 112
    :goto_1
    move/from16 v19, v15

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_4
    move-wide/from16 v16, v2

    .line 116
    .line 117
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v3, "Invalid bitrate: "

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-static {v9, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 135
    .line 136
    .line 137
    :goto_2
    move v2, v5

    .line 138
    move/from16 v19, v10

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :catchall_1
    move-exception v0

    .line 142
    goto/16 :goto_d

    .line 143
    .line 144
    :catch_0
    move-wide/from16 v16, v2

    .line 145
    .line 146
    move v15, v10

    .line 147
    :catch_1
    :try_start_5
    const-string v2, "Invalid bitrate header: "

    .line 148
    .line 149
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v9, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    move v2, v5

    .line 161
    goto :goto_1

    .line 162
    :cond_5
    move-wide/from16 v16, v2

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :goto_3
    const-string v3, "icy-genre"

    .line 166
    .line 167
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Ljava/util/List;

    .line 172
    .line 173
    const/4 v8, 0x0

    .line 174
    if-eqz v3, :cond_6

    .line 175
    .line 176
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Ljava/lang/String;

    .line 181
    .line 182
    move-object/from16 v20, v2

    .line 183
    .line 184
    move v2, v4

    .line 185
    goto :goto_4

    .line 186
    :cond_6
    move-object/from16 v20, v8

    .line 187
    .line 188
    :goto_4
    const-string v3, "icy-name"

    .line 189
    .line 190
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    check-cast v3, Ljava/util/List;

    .line 195
    .line 196
    if-eqz v3, :cond_7

    .line 197
    .line 198
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    check-cast v2, Ljava/lang/String;

    .line 203
    .line 204
    move-object/from16 v21, v2

    .line 205
    .line 206
    move v2, v4

    .line 207
    goto :goto_5

    .line 208
    :cond_7
    move-object/from16 v21, v8

    .line 209
    .line 210
    :goto_5
    const-string v3, "icy-url"

    .line 211
    .line 212
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    check-cast v3, Ljava/util/List;

    .line 217
    .line 218
    if-eqz v3, :cond_8

    .line 219
    .line 220
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    check-cast v2, Ljava/lang/String;

    .line 225
    .line 226
    move-object/from16 v22, v2

    .line 227
    .line 228
    move v2, v4

    .line 229
    goto :goto_6

    .line 230
    :cond_8
    move-object/from16 v22, v8

    .line 231
    .line 232
    :goto_6
    const-string v3, "icy-pub"

    .line 233
    .line 234
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Ljava/util/List;

    .line 239
    .line 240
    if-eqz v3, :cond_9

    .line 241
    .line 242
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Ljava/lang/String;

    .line 247
    .line 248
    const-string v3, "1"

    .line 249
    .line 250
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    move/from16 v23, v2

    .line 255
    .line 256
    move v2, v4

    .line 257
    goto :goto_7

    .line 258
    :cond_9
    move/from16 v23, v5

    .line 259
    .line 260
    :goto_7
    const-string v3, "icy-metaint"

    .line 261
    .line 262
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    check-cast v3, Ljava/util/List;

    .line 267
    .line 268
    if-eqz v3, :cond_b

    .line 269
    .line 270
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    check-cast v3, Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 275
    .line 276
    :try_start_6
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 277
    .line 278
    .line 279
    move-result v7
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 280
    if-lez v7, :cond_a

    .line 281
    .line 282
    move v2, v4

    .line 283
    :goto_8
    move/from16 v24, v7

    .line 284
    .line 285
    goto :goto_9

    .line 286
    :cond_a
    :try_start_7
    new-instance v15, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v15

    .line 301
    invoke-static {v9, v15}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 302
    .line 303
    .line 304
    :cond_b
    move/from16 v24, v10

    .line 305
    .line 306
    goto :goto_9

    .line 307
    :catch_2
    move v7, v10

    .line 308
    :catch_3
    :try_start_8
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    goto :goto_8

    .line 320
    :goto_9
    if-eqz v2, :cond_c

    .line 321
    .line 322
    new-instance v18, Lcom/google/android/gms/internal/ads/zzaga;

    .line 323
    .line 324
    invoke-direct/range {v18 .. v24}, Lcom/google/android/gms/internal/ads/zzaga;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 325
    .line 326
    .line 327
    move-object/from16 v8, v18

    .line 328
    .line 329
    :cond_c
    invoke-static {v6, v8}, Ll/b1z0;->p(Ll/b1z0;Lcom/google/android/gms/internal/ads/zzaga;)V

    .line 330
    .line 331
    .line 332
    iget-object v2, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 333
    .line 334
    iget-object v3, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 335
    .line 336
    invoke-static {v3}, Ll/b1z0;->Q(Ll/b1z0;)Lcom/google/android/gms/internal/ads/zzaga;

    .line 337
    .line 338
    .line 339
    move-result-object v6

    .line 340
    if-eqz v6, :cond_d

    .line 341
    .line 342
    invoke-static {v3}, Ll/b1z0;->Q(Ll/b1z0;)Lcom/google/android/gms/internal/ads/zzaga;

    .line 343
    .line 344
    .line 345
    move-result-object v6

    .line 346
    iget v6, v6, Lcom/google/android/gms/internal/ads/zzaga;->zzf:I

    .line 347
    .line 348
    if-eq v6, v10, :cond_d

    .line 349
    .line 350
    new-instance v6, Ll/azy0;

    .line 351
    .line 352
    invoke-static {v3}, Ll/b1z0;->Q(Ll/b1z0;)Lcom/google/android/gms/internal/ads/zzaga;

    .line 353
    .line 354
    .line 355
    move-result-object v3

    .line 356
    iget v3, v3, Lcom/google/android/gms/internal/ads/zzaga;->zzf:I

    .line 357
    .line 358
    invoke-direct {v6, v2, v3, v1}, Ll/azy0;-><init>(Ll/fex0;ILl/zyy0;)V

    .line 359
    .line 360
    .line 361
    iget-object v2, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 362
    .line 363
    invoke-virtual {v2}, Ll/b1z0;->P()Ll/sgr0;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    iput-object v2, v1, Ll/w0z0;->l:Ll/sgr0;

    .line 368
    .line 369
    invoke-static {}, Ll/b1z0;->O()Ll/sqr0;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-interface {v2, v3}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 374
    .line 375
    .line 376
    move-object v8, v6

    .line 377
    goto :goto_a

    .line 378
    :cond_d
    move-object v8, v2

    .line 379
    :goto_a
    iget-object v7, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 380
    .line 381
    iget-object v9, v1, Ll/w0z0;->b:Landroid/net/Uri;

    .line 382
    .line 383
    iget-object v2, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 384
    .line 385
    invoke-virtual {v2}, Ll/xsx0;->zze()Ljava/util/Map;

    .line 386
    .line 387
    .line 388
    move-result-object v10

    .line 389
    iget-object v15, v1, Ll/w0z0;->e:Ll/ser0;

    .line 390
    .line 391
    invoke-interface/range {v7 .. v15}, Ll/q0z0;->c(Ll/nyy0;Landroid/net/Uri;Ljava/util/Map;JJLl/ser0;)V

    .line 392
    .line 393
    .line 394
    iget-object v2, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 395
    .line 396
    invoke-static {v2}, Ll/b1z0;->Q(Ll/b1z0;)Lcom/google/android/gms/internal/ads/zzaga;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    if-eqz v2, :cond_e

    .line 401
    .line 402
    iget-object v2, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 403
    .line 404
    invoke-interface {v2}, Ll/q0z0;->zzc()V

    .line 405
    .line 406
    .line 407
    :cond_e
    iget-boolean v2, v1, Ll/w0z0;->i:Z

    .line 408
    .line 409
    if-eqz v2, :cond_f

    .line 410
    .line 411
    iget-object v2, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 412
    .line 413
    iget-wide v6, v1, Ll/w0z0;->j:J

    .line 414
    .line 415
    invoke-interface {v2, v11, v12, v6, v7}, Ll/q0z0;->a(JJ)V

    .line 416
    .line 417
    .line 418
    iput-boolean v5, v1, Ll/w0z0;->i:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 419
    .line 420
    :cond_f
    move v2, v5

    .line 421
    :cond_10
    :goto_b
    if-nez v2, :cond_12

    .line 422
    .line 423
    :try_start_9
    iget-boolean v3, v1, Ll/w0z0;->h:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 424
    .line 425
    if-nez v3, :cond_11

    .line 426
    .line 427
    :try_start_a
    iget-object v3, v1, Ll/w0z0;->f:Ll/bjv0;

    .line 428
    .line 429
    invoke-virtual {v3}, Ll/bjv0;->a()V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 430
    .line 431
    .line 432
    :try_start_b
    iget-object v3, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 433
    .line 434
    iget-object v6, v1, Ll/w0z0;->g:Ll/yfr0;

    .line 435
    .line 436
    invoke-interface {v3, v6}, Ll/q0z0;->b(Ll/yfr0;)I

    .line 437
    .line 438
    .line 439
    move-result v2

    .line 440
    iget-object v3, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 441
    .line 442
    invoke-interface {v3}, Ll/q0z0;->zzb()J

    .line 443
    .line 444
    .line 445
    move-result-wide v6

    .line 446
    iget-object v3, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 447
    .line 448
    invoke-static {v3}, Ll/b1z0;->K(Ll/b1z0;)J

    .line 449
    .line 450
    .line 451
    move-result-wide v8

    .line 452
    add-long/2addr v8, v11

    .line 453
    cmp-long v3, v6, v8

    .line 454
    .line 455
    if-lez v3, :cond_10

    .line 456
    .line 457
    iget-object v3, v1, Ll/w0z0;->f:Ll/bjv0;

    .line 458
    .line 459
    invoke-virtual {v3}, Ll/bjv0;->c()Z

    .line 460
    .line 461
    .line 462
    iget-object v3, v1, Ll/w0z0;->n:Ll/b1z0;

    .line 463
    .line 464
    invoke-static {v3}, Ll/b1z0;->N(Ll/b1z0;)Landroid/os/Handler;

    .line 465
    .line 466
    .line 467
    move-result-object v8

    .line 468
    invoke-static {v3}, Ll/b1z0;->R(Ll/b1z0;)Ljava/lang/Runnable;

    .line 469
    .line 470
    .line 471
    move-result-object v3

    .line 472
    invoke-virtual {v8, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 473
    .line 474
    .line 475
    move-wide v11, v6

    .line 476
    goto :goto_b

    .line 477
    :catchall_2
    move-exception v0

    .line 478
    move v5, v2

    .line 479
    goto :goto_d

    .line 480
    :catch_4
    new-instance v0, Ljava/io/InterruptedIOException;

    .line 481
    .line 482
    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 483
    .line 484
    .line 485
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 486
    :cond_11
    move v2, v5

    .line 487
    :cond_12
    if-ne v2, v4, :cond_13

    .line 488
    .line 489
    goto :goto_c

    .line 490
    :cond_13
    iget-object v3, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 491
    .line 492
    invoke-interface {v3}, Ll/q0z0;->zzb()J

    .line 493
    .line 494
    .line 495
    move-result-wide v4

    .line 496
    cmp-long v4, v4, v16

    .line 497
    .line 498
    if-eqz v4, :cond_14

    .line 499
    .line 500
    iget-object v4, v1, Ll/w0z0;->g:Ll/yfr0;

    .line 501
    .line 502
    invoke-interface {v3}, Ll/q0z0;->zzb()J

    .line 503
    .line 504
    .line 505
    move-result-wide v5

    .line 506
    iput-wide v5, v4, Ll/yfr0;->a:J

    .line 507
    .line 508
    :cond_14
    move v5, v2

    .line 509
    :goto_c
    iget-object v2, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 510
    .line 511
    invoke-static {v2}, Ll/igx0;->a(Ll/fex0;)V

    .line 512
    .line 513
    .line 514
    if-eqz v5, :cond_0

    .line 515
    .line 516
    goto :goto_e

    .line 517
    :goto_d
    if-eq v5, v4, :cond_15

    .line 518
    .line 519
    iget-object v2, v1, Ll/w0z0;->d:Ll/q0z0;

    .line 520
    .line 521
    invoke-interface {v2}, Ll/q0z0;->zzb()J

    .line 522
    .line 523
    .line 524
    move-result-wide v3

    .line 525
    cmp-long v3, v3, v16

    .line 526
    .line 527
    if-eqz v3, :cond_15

    .line 528
    .line 529
    iget-object v3, v1, Ll/w0z0;->g:Ll/yfr0;

    .line 530
    .line 531
    invoke-interface {v2}, Ll/q0z0;->zzb()J

    .line 532
    .line 533
    .line 534
    move-result-wide v4

    .line 535
    iput-wide v4, v3, Ll/yfr0;->a:J

    .line 536
    .line 537
    :cond_15
    iget-object v1, v1, Ll/w0z0;->c:Ll/xsx0;

    .line 538
    .line 539
    invoke-static {v1}, Ll/igx0;->a(Ll/fex0;)V

    .line 540
    .line 541
    .line 542
    throw v0

    .line 543
    :cond_16
    :goto_e
    return-void
.end method
