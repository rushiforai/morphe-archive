.class public final Ll/ftv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/xvw0;

.field public final c:Ll/o7w0;

.field public final d:Lcom/google/android/gms/internal/ads/zzcei;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/xvw0;Ll/o7w0;Lcom/google/android/gms/internal/ads/zzcei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ftv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ftv0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ftv0;->c:Ll/o7w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ftv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/gtv0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ftv0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ftv0;->c:Ll/o7w0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/o7w0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    new-instance v1, Ll/glw0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/glw0;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/glw0;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/glw0;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v7, :cond_0

    .line 21
    .line 22
    sget-object v4, Ll/sgs0;->O2:Ll/dgs0;

    .line 23
    .line 24
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    check-cast v4, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_0

    .line 39
    .line 40
    new-instance v0, Ll/gtv0;

    .line 41
    .line 42
    invoke-direct {v0, v3}, Ll/gtv0;-><init>(Z)V

    .line 43
    .line 44
    .line 45
    return-object v0

    .line 46
    :catch_0
    move-exception v0

    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :cond_0
    if-nez v7, :cond_1

    .line 50
    .line 51
    sget-object v4, Ll/sgs0;->K2:Ll/dgs0;

    .line 52
    .line 53
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_2

    .line 68
    .line 69
    :cond_1
    if-eqz v7, :cond_3

    .line 70
    .line 71
    sget-object v4, Ll/sgs0;->M2:Ll/dgs0;

    .line 72
    .line 73
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_3

    .line 88
    .line 89
    :cond_2
    invoke-static {v0}, Ll/klw0;->k(Landroid/content/Context;)Ll/klw0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget-object v4, Ll/sgs0;->Y2:Ll/dgs0;

    .line 94
    .line 95
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    check-cast v4, Ljava/lang/Long;

    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 106
    .line 107
    .line 108
    move-result-wide v4

    .line 109
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-virtual {v6}, Ll/ebt0;->i()Ll/grw0;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-interface {v6}, Ll/grw0;->f()Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    invoke-virtual {v1, v4, v5, v6}, Ll/klw0;->i(JZ)Ll/glw0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    :cond_3
    sget-object v4, Ll/sgs0;->V2:Ll/dgs0;

    .line 126
    .line 127
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-eqz v4, :cond_4

    .line 142
    .line 143
    iget-object v4, p0, Ll/ftv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 144
    .line 145
    iget v4, v4, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 146
    .line 147
    sget-object v5, Ll/sgs0;->U2:Ll/dgs0;

    .line 148
    .line 149
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    check-cast v5, Ljava/lang/Integer;

    .line 158
    .line 159
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    if-ge v4, v5, :cond_4

    .line 164
    .line 165
    invoke-static {v0}, Ll/llw0;->j(Landroid/content/Context;)Ll/llw0;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual {v4}, Ll/llw0;->k()V

    .line 170
    .line 171
    .line 172
    :cond_4
    if-nez v7, :cond_5

    .line 173
    .line 174
    sget-object v4, Ll/sgs0;->L2:Ll/dgs0;

    .line 175
    .line 176
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 177
    .line 178
    .line 179
    move-result-object v5

    .line 180
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    check-cast v4, Ljava/lang/Boolean;

    .line 185
    .line 186
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-nez v4, :cond_6

    .line 191
    .line 192
    :cond_5
    if-eqz v7, :cond_8

    .line 193
    .line 194
    sget-object v4, Ll/sgs0;->N2:Ll/dgs0;

    .line 195
    .line 196
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    check-cast v4, Ljava/lang/Boolean;

    .line 205
    .line 206
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-eqz v4, :cond_8

    .line 211
    .line 212
    :cond_6
    invoke-static {v0}, Ll/llw0;->j(Landroid/content/Context;)Ll/llw0;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v4, p0, Ll/ftv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 217
    .line 218
    iget v4, v4, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 219
    .line 220
    sget-object v5, Ll/sgs0;->U2:Ll/dgs0;

    .line 221
    .line 222
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 223
    .line 224
    .line 225
    move-result-object v6

    .line 226
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    check-cast v5, Ljava/lang/Integer;

    .line 231
    .line 232
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    if-lt v4, v5, :cond_7

    .line 237
    .line 238
    sget-object v2, Ll/sgs0;->Z2:Ll/dgs0;

    .line 239
    .line 240
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    check-cast v2, Ljava/lang/Long;

    .line 249
    .line 250
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 251
    .line 252
    .line 253
    move-result-wide v2

    .line 254
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    invoke-virtual {v4}, Ll/ebt0;->i()Ll/grw0;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-interface {v4}, Ll/grw0;->f()Z

    .line 263
    .line 264
    .line 265
    move-result v4

    .line 266
    invoke-virtual {v0, v2, v3, v4}, Ll/llw0;->i(JZ)Ll/glw0;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v0}, Ll/llw0;->p()Z

    .line 271
    .line 272
    .line 273
    move-result v3

    .line 274
    :cond_7
    invoke-virtual {v0}, Ll/llw0;->q()Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    move v6, v0

    .line 279
    move-object v4, v2

    .line 280
    move v5, v3

    .line 281
    goto :goto_0

    .line 282
    :cond_8
    move-object v4, v2

    .line 283
    move v5, v3

    .line 284
    move v6, v5

    .line 285
    :goto_0
    new-instance v2, Ll/gtv0;

    .line 286
    .line 287
    move-object v3, v1

    .line 288
    invoke-direct/range {v2 .. v7}, Ll/gtv0;-><init>(Ll/glw0;Ll/glw0;ZZZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    .line 290
    .line 291
    return-object v2

    .line 292
    :goto_1
    const-string v1, "PerAppIdSignal"

    .line 293
    .line 294
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v2, v0, v1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Ll/ftv0;->c:Ll/o7w0;

    .line 302
    .line 303
    new-instance v0, Ll/gtv0;

    .line 304
    .line 305
    invoke-virtual {p0}, Ll/o7w0;->b()Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    invoke-direct {v0, p0}, Ll/gtv0;-><init>(Z)V

    .line 310
    .line 311
    .line 312
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x35

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/etv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/etv0;-><init>(Ll/ftv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ftv0;->b:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
