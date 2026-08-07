.class public final Ll/kiv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ltu0;

.field public final c:Ll/o7w0;

.field public final d:Lcom/google/android/gms/internal/ads/zzcei;

.field public final e:Ll/q6w0;

.field public final f:Ll/hpr;

.field public final g:Ll/wit0;

.field public final h:Ll/dqs0;

.field public final i:Z

.field public final j:Ll/qbv0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/ltu0;Ll/o7w0;Lcom/google/android/gms/internal/ads/zzcei;Ll/q6w0;Ll/hpr;Ll/wit0;Ll/dqs0;ZLl/qbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kiv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kiv0;->b:Ll/ltu0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/kiv0;->c:Ll/o7w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/kiv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 11
    .line 12
    iput-object p5, p0, Ll/kiv0;->e:Ll/q6w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/kiv0;->f:Ll/hpr;

    .line 15
    .line 16
    iput-object p7, p0, Ll/kiv0;->g:Ll/wit0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/kiv0;->h:Ll/dqs0;

    .line 19
    .line 20
    iput-boolean p9, p0, Ll/kiv0;->i:Z

    .line 21
    .line 22
    iput-object p10, p0, Ll/kiv0;->j:Ll/qbv0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/kiv0;->f:Ll/hpr;

    .line 4
    .line 5
    invoke-static {v1}, Ll/pvw0;->q(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/lsu0;

    .line 10
    .line 11
    :try_start_0
    iget-object v2, v0, Ll/kiv0;->e:Ll/q6w0;

    .line 12
    .line 13
    iget-object v3, v0, Ll/kiv0;->g:Ll/wit0;

    .line 14
    .line 15
    invoke-interface {v3}, Ll/wit0;->c0()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x1

    .line 20
    const/4 v5, 0x0

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    iget-object v2, v0, Ll/kiv0;->g:Ll/wit0;

    .line 24
    .line 25
    :goto_0
    move-object v11, v2

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    sget-object v3, Ll/sgs0;->M0:Ll/dgs0;

    .line 28
    .line 29
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v6, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    iget-object v2, v0, Ll/kiv0;->g:Ll/wit0;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v3, v0, Ll/kiv0;->b:Ll/ltu0;

    .line 49
    .line 50
    iget-object v6, v0, Ll/kiv0;->c:Ll/o7w0;

    .line 51
    .line 52
    iget-object v6, v6, Ll/o7w0;->e:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 53
    .line 54
    invoke-virtual {v3, v6, v5, v5}, Ll/ltu0;->a(Lcom/google/android/gms/ads/internal/client/zzq;Ll/q6w0;Ll/t6w0;)Ll/wit0;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v1}, Ll/lsu0;->i()Ll/xgu0;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-static {v3, v6}, Ll/sqs0;->b(Ll/wit0;Ll/rqs0;)V

    .line 63
    .line 64
    .line 65
    new-instance v6, Ll/otu0;

    .line 66
    .line 67
    invoke-direct {v6}, Ll/otu0;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-object v7, v0, Ll/kiv0;->a:Landroid/content/Context;

    .line 71
    .line 72
    move-object v8, v3

    .line 73
    check-cast v8, Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v6, v7, v8}, Ll/otu0;->a(Landroid/content/Context;Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ll/lsu0;->l()Ll/ktu0;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    iget-boolean v8, v0, Ll/kiv0;->i:Z

    .line 83
    .line 84
    if-eqz v8, :cond_2

    .line 85
    .line 86
    iget-object v8, v0, Ll/kiv0;->h:Ll/dqs0;

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    move-object v8, v5

    .line 90
    :goto_1
    invoke-virtual {v7, v3, v4, v8}, Ll/ktu0;->i(Ll/wit0;ZLl/dqs0;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v3}, Ll/wit0;->zzN()Ll/nkt0;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    new-instance v8, Ll/iiv0;

    .line 98
    .line 99
    invoke-direct {v8, v6, v3}, Ll/iiv0;-><init>(Ll/otu0;Ll/wit0;)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v7, v8}, Ll/nkt0;->zzB(Ll/lkt0;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v3}, Ll/wit0;->zzN()Ll/nkt0;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    new-instance v7, Ll/jiv0;

    .line 110
    .line 111
    invoke-direct {v7, v3}, Ll/jiv0;-><init>(Ll/wit0;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v6, v7}, Ll/nkt0;->zzH(Ll/mkt0;)V

    .line 115
    .line 116
    .line 117
    iget-object v2, v2, Ll/q6w0;->t:Ll/u6w0;

    .line 118
    .line 119
    iget-object v6, v2, Ll/u6w0;->b:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v2, v2, Ll/u6w0;->a:Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {v3, v6, v2, v5}, Ll/wit0;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcjw; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    move-object v11, v3

    .line 127
    :goto_2
    invoke-interface {v11, v4}, Ll/wit0;->y0(Z)V

    .line 128
    .line 129
    .line 130
    iget-boolean v2, v0, Ll/kiv0;->i:Z

    .line 131
    .line 132
    new-instance v12, Lcom/google/android/gms/ads/internal/zzj;

    .line 133
    .line 134
    const/4 v3, 0x0

    .line 135
    if-eqz v2, :cond_3

    .line 136
    .line 137
    iget-object v2, v0, Ll/kiv0;->h:Ll/dqs0;

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Ll/dqs0;->e(Z)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    move v13, v2

    .line 144
    goto :goto_3

    .line 145
    :cond_3
    move v13, v3

    .line 146
    :goto_3
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 147
    .line 148
    .line 149
    iget-object v2, v0, Ll/kiv0;->a:Landroid/content/Context;

    .line 150
    .line 151
    iget-boolean v6, v0, Ll/kiv0;->i:Z

    .line 152
    .line 153
    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/b;->h(Landroid/content/Context;)Z

    .line 154
    .line 155
    .line 156
    move-result v14

    .line 157
    if-eqz v6, :cond_4

    .line 158
    .line 159
    iget-object v2, v0, Ll/kiv0;->h:Ll/dqs0;

    .line 160
    .line 161
    invoke-virtual {v2}, Ll/dqs0;->d()Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    :cond_4
    move v15, v3

    .line 166
    iget-boolean v2, v0, Ll/kiv0;->i:Z

    .line 167
    .line 168
    if-eqz v2, :cond_5

    .line 169
    .line 170
    iget-object v2, v0, Ll/kiv0;->h:Ll/dqs0;

    .line 171
    .line 172
    invoke-virtual {v2}, Ll/dqs0;->a()F

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    :goto_4
    move/from16 v16, v2

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_5
    const/4 v2, 0x0

    .line 180
    goto :goto_4

    .line 181
    :goto_5
    iget-object v2, v0, Ll/kiv0;->e:Ll/q6w0;

    .line 182
    .line 183
    iget-boolean v3, v2, Ll/q6w0;->P:Z

    .line 184
    .line 185
    iget-boolean v2, v2, Ll/q6w0;->Q:Z

    .line 186
    .line 187
    const/16 v17, -0x1

    .line 188
    .line 189
    move/from16 v18, p1

    .line 190
    .line 191
    move/from16 v20, v2

    .line 192
    .line 193
    move/from16 v19, v3

    .line 194
    .line 195
    invoke-direct/range {v12 .. v20}, Lcom/google/android/gms/ads/internal/zzj;-><init>(ZZZFIZZZ)V

    .line 196
    .line 197
    .line 198
    if-eqz p3, :cond_6

    .line 199
    .line 200
    invoke-virtual/range {p3 .. p3}, Ll/c7u0;->zzf()V

    .line 201
    .line 202
    .line 203
    :cond_6
    invoke-static {}, Ll/bxy0;->k()Ll/ghy0;

    .line 204
    .line 205
    .line 206
    new-instance v7, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 207
    .line 208
    invoke-virtual {v1}, Ll/lsu0;->j()Ll/miu0;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    iget-object v1, v0, Ll/kiv0;->e:Ll/q6w0;

    .line 213
    .line 214
    iget-object v13, v0, Ll/kiv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 215
    .line 216
    move-object v15, v12

    .line 217
    iget v12, v1, Ll/q6w0;->R:I

    .line 218
    .line 219
    iget-object v14, v1, Ll/q6w0;->C:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v2, v1, Ll/q6w0;->t:Ll/u6w0;

    .line 222
    .line 223
    iget-object v3, v2, Ll/u6w0;->b:Ljava/lang/String;

    .line 224
    .line 225
    iget-object v2, v2, Ll/u6w0;->a:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v6, v0, Ll/kiv0;->c:Ll/o7w0;

    .line 228
    .line 229
    iget-boolean v1, v1, Ll/q6w0;->j0:Z

    .line 230
    .line 231
    if-eqz v1, :cond_7

    .line 232
    .line 233
    iget-object v5, v0, Ll/kiv0;->j:Ll/qbv0;

    .line 234
    .line 235
    :cond_7
    move-object/from16 v20, v5

    .line 236
    .line 237
    const/4 v10, 0x0

    .line 238
    iget-object v0, v6, Ll/o7w0;->f:Ljava/lang/String;

    .line 239
    .line 240
    const/4 v8, 0x0

    .line 241
    move-object/from16 v19, p3

    .line 242
    .line 243
    move-object/from16 v18, v0

    .line 244
    .line 245
    move-object/from16 v17, v2

    .line 246
    .line 247
    move-object/from16 v16, v3

    .line 248
    .line 249
    invoke-direct/range {v7 .. v20}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/rar0;Ll/wit0;ILcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Lcom/google/android/gms/ads/internal/zzj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/c7u0;Ll/k1t0;)V

    .line 250
    .line 251
    .line 252
    move-object/from16 v0, p2

    .line 253
    .line 254
    invoke-static {v0, v7, v4}, Ll/ghy0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :catch_0
    move-exception v0

    .line 259
    const-string v1, ""

    .line 260
    .line 261
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 262
    .line 263
    .line 264
    return-void
.end method
