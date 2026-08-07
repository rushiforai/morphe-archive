.class public final Ll/p1z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/hpr;

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzccx;

.field public final synthetic c:Ll/bat0;

.field public final synthetic d:Ll/rdw0;

.field public final synthetic e:J

.field public final synthetic f:Ll/tar0;


# direct methods
.method public constructor <init>(Ll/tar0;Ll/hpr;Lcom/google/android/gms/internal/ads/zzccx;Ll/bat0;Ll/rdw0;J)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/p1z0;->a:Ll/hpr;

    .line 2
    .line 3
    iput-object p3, p0, Ll/p1z0;->b:Lcom/google/android/gms/internal/ads/zzccx;

    .line 4
    .line 5
    iput-object p4, p0, Ll/p1z0;->c:Ll/bat0;

    .line 6
    .line 7
    iput-object p5, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 8
    .line 9
    iput-wide p6, p0, Ll/p1z0;->e:J

    .line 10
    .line 11
    iput-object p1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 9

    .line 1
    const-string v0, "Internal error. "

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iget-wide v3, p0, Ll/p1z0;->e:J

    .line 12
    .line 13
    sub-long/2addr v1, v3

    .line 14
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const-string v5, "SignalGeneratorImpl.generateSignals"

    .line 23
    .line 24
    invoke-virtual {v4, p1, v5}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v4, p0, Ll/p1z0;->f:Ll/tar0;

    .line 28
    .line 29
    invoke-static {v4}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-static {v4}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    new-instance v6, Landroid/util/Pair;

    .line 38
    .line 39
    const-string v7, "sgf_reason"

    .line 40
    .line 41
    invoke-direct {v6, v7, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    new-instance v7, Landroid/util/Pair;

    .line 45
    .line 46
    const-string v8, "tqgt"

    .line 47
    .line 48
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v7, v8, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    filled-new-array {v6, v7}, [Landroid/util/Pair;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "sgf"

    .line 60
    .line 61
    invoke-static {v5, v4, v2, v1}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/p1z0;->a:Ll/hpr;

    .line 65
    .line 66
    iget-object v2, p0, Ll/p1z0;->b:Lcom/google/android/gms/internal/ads/zzccx;

    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/tar0;->Z8(Ll/hpr;Lcom/google/android/gms/internal/ads/zzccx;)Ll/cew0;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v2, Ll/ris0;->e:Ll/kis0;

    .line 73
    .line 74
    invoke-virtual {v2}, Ll/kis0;->e()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_0

    .line 85
    .line 86
    if-eqz v1, :cond_0

    .line 87
    .line 88
    iget-object v2, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 89
    .line 90
    invoke-interface {v2, p1}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 91
    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    invoke-interface {v2, p1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v2}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1}, Ll/cew0;->g()V

    .line 101
    .line 102
    .line 103
    :cond_0
    :try_start_0
    const-string p1, "Unknown format is no longer supported."

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    :goto_0
    iget-object p0, p0, Ll/p1z0;->c:Ll/bat0;

    .line 125
    .line 126
    invoke-interface {p0, v3}, Ll/bat0;->zzb(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :catch_0
    move-exception p0

    .line 131
    const-string p1, ""

    .line 132
    .line 133
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 14
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "sgf_reason"

    .line 2
    .line 3
    const-string v1, "sgf"

    .line 4
    .line 5
    const-string v2, "QueryInfo generation has been disabled."

    .line 6
    .line 7
    const-string v3, "Internal error for request JSON: "

    .line 8
    .line 9
    iget-object v4, p0, Ll/p1z0;->a:Ll/hpr;

    .line 10
    .line 11
    check-cast p1, Ll/rqr0;

    .line 12
    .line 13
    iget-object v5, p0, Ll/p1z0;->b:Lcom/google/android/gms/internal/ads/zzccx;

    .line 14
    .line 15
    invoke-static {v4, v5}, Ll/tar0;->Z8(Ll/hpr;Lcom/google/android/gms/internal/ads/zzccx;)Ll/cew0;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-object v5, p0, Ll/p1z0;->f:Ll/tar0;

    .line 20
    .line 21
    invoke-static {v5}, Ll/tar0;->t8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const/4 v6, 0x1

    .line 26
    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 27
    .line 28
    .line 29
    sget-object v5, Ll/sgs0;->D7:Ll/dgs0;

    .line 30
    .line 31
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    invoke-virtual {v7, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    check-cast v5, Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    const/4 v7, 0x0

    .line 46
    if-nez v5, :cond_0

    .line 47
    .line 48
    :try_start_0
    iget-object p1, p0, Ll/p1z0;->c:Ll/bat0;

    .line 49
    .line 50
    invoke-interface {p1, v2}, Ll/bat0;->zzb(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p1

    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_8

    .line 79
    .line 80
    if-eqz v4, :cond_8

    .line 81
    .line 82
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 83
    .line 84
    invoke-interface {p0, v2}, Ll/rdw0;->zzc(Ljava/lang/String;)Ll/rdw0;

    .line 85
    .line 86
    .line 87
    invoke-interface {p0, v7}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v8

    .line 105
    iget-wide v10, p0, Ll/p1z0;->e:J

    .line 106
    .line 107
    sub-long/2addr v8, v10

    .line 108
    const-string v2, "SignalGeneratorImpl.generateSignals.onSuccess"

    .line 109
    .line 110
    const-string v5, ""

    .line 111
    .line 112
    const-string v10, "sgs"

    .line 113
    .line 114
    if-nez p1, :cond_1

    .line 115
    .line 116
    :try_start_1
    iget-object p1, p0, Ll/p1z0;->c:Ll/bat0;

    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-interface {p1, v0, v0, v0}, Ll/bat0;->R4(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 123
    .line 124
    invoke-static {p1}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {p1}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    new-instance v1, Landroid/util/Pair;

    .line 133
    .line 134
    const-string v3, "rid"

    .line 135
    .line 136
    const-string v8, "-1"

    .line 137
    .line 138
    invoke-direct {v1, v3, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {v0, p1, v10, v1}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 149
    .line 150
    invoke-interface {p1, v6}, Ll/rdw0;->S(Z)Ll/rdw0;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    .line 152
    .line 153
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    check-cast p1, Ljava/lang/Boolean;

    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_8

    .line 166
    .line 167
    if-eqz v4, :cond_8

    .line 168
    .line 169
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 170
    .line 171
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :catchall_0
    move-exception p1

    .line 179
    goto/16 :goto_4

    .line 180
    .line 181
    :catch_1
    move-exception p1

    .line 182
    goto/16 :goto_3

    .line 183
    .line 184
    :cond_1
    :try_start_2
    new-instance v11, Lorg/json/JSONObject;

    .line 185
    .line 186
    iget-object v12, p1, Ll/rqr0;->b:Ljava/lang/String;

    .line 187
    .line 188
    invoke-direct {v11, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 189
    .line 190
    .line 191
    :try_start_3
    const-string v3, "request_id"

    .line 192
    .line 193
    invoke-virtual {v11, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result v12

    .line 201
    if-eqz v12, :cond_2

    .line 202
    .line 203
    const-string p1, "The request ID is empty in request JSON."

    .line 204
    .line 205
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/p1z0;->c:Ll/bat0;

    .line 209
    .line 210
    const-string v3, "Internal error: request ID is empty in request JSON."

    .line 211
    .line 212
    invoke-interface {p1, v3}, Ll/bat0;->zzb(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 216
    .line 217
    invoke-static {p1}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-static {p1}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    new-instance v6, Landroid/util/Pair;

    .line 226
    .line 227
    const-string v8, "rid_missing"

    .line 228
    .line 229
    invoke-direct {v6, v0, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    filled-new-array {v6}, [Landroid/util/Pair;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v3, p1, v1, v0}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 240
    .line 241
    const-string v0, "Request ID empty"

    .line 242
    .line 243
    invoke-interface {p1, v0}, Ll/rdw0;->zzc(Ljava/lang/String;)Ll/rdw0;

    .line 244
    .line 245
    .line 246
    invoke-interface {p1, v7}, Ll/rdw0;->S(Z)Ll/rdw0;
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 247
    .line 248
    .line 249
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 250
    .line 251
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Ljava/lang/Boolean;

    .line 256
    .line 257
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-eqz p1, :cond_8

    .line 262
    .line 263
    if-eqz v4, :cond_8

    .line 264
    .line 265
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 266
    .line 267
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_2
    :try_start_4
    iget-object v0, p0, Ll/p1z0;->f:Ll/tar0;

    .line 275
    .line 276
    iget-object v1, p1, Ll/rqr0;->b:Ljava/lang/String;

    .line 277
    .line 278
    invoke-static {v0}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 279
    .line 280
    .line 281
    move-result-object v12

    .line 282
    invoke-static {v0, v3, v1, v12}, Ll/tar0;->z8(Ll/tar0;Ljava/lang/String;Ljava/lang/String;Ll/swu0;)V

    .line 283
    .line 284
    .line 285
    iget-object v0, p1, Ll/rqr0;->c:Landroid/os/Bundle;

    .line 286
    .line 287
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 288
    .line 289
    invoke-static {v1}, Ll/tar0;->C8(Ll/tar0;)Z

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    if-eqz v3, :cond_3

    .line 294
    .line 295
    if-eqz v0, :cond_3

    .line 296
    .line 297
    invoke-static {v1}, Ll/tar0;->g9(Ll/tar0;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    const/4 v3, -0x1

    .line 302
    invoke-virtual {v0, v1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    if-ne v1, v3, :cond_3

    .line 307
    .line 308
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 309
    .line 310
    invoke-static {v1}, Ll/tar0;->g9(Ll/tar0;)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v3

    .line 314
    invoke-static {v1}, Ll/tar0;->v8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 323
    .line 324
    .line 325
    :cond_3
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 326
    .line 327
    invoke-static {v1}, Ll/tar0;->D8(Ll/tar0;)Z

    .line 328
    .line 329
    .line 330
    move-result v3

    .line 331
    if-eqz v3, :cond_5

    .line 332
    .line 333
    if-eqz v0, :cond_5

    .line 334
    .line 335
    invoke-static {v1}, Ll/tar0;->q8(Ll/tar0;)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v1, :cond_5

    .line 348
    .line 349
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 350
    .line 351
    invoke-static {v1}, Ll/tar0;->p8(Ll/tar0;)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    if-eqz v1, :cond_4

    .line 360
    .line 361
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 362
    .line 363
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    iget-object v12, p0, Ll/p1z0;->f:Ll/tar0;

    .line 368
    .line 369
    invoke-static {v12}, Ll/tar0;->S8(Ll/tar0;)Landroid/content/Context;

    .line 370
    .line 371
    .line 372
    move-result-object v13

    .line 373
    invoke-static {v12}, Ll/tar0;->V8(Ll/tar0;)Lcom/google/android/gms/internal/ads/zzcei;

    .line 374
    .line 375
    .line 376
    move-result-object v12

    .line 377
    iget-object v12, v12, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {v3, v13, v12}, Lcom/google/android/gms/ads/internal/util/b;->E(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-static {v1, v3}, Ll/tar0;->w8(Ll/tar0;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    :cond_4
    iget-object v1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 387
    .line 388
    invoke-static {v1}, Ll/tar0;->q8(Ll/tar0;)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    invoke-static {v1}, Ll/tar0;->p8(Ll/tar0;)Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    :cond_5
    iget-object v1, p0, Ll/p1z0;->c:Ll/bat0;

    .line 400
    .line 401
    iget-object v3, p1, Ll/rqr0;->a:Ljava/lang/String;

    .line 402
    .line 403
    iget-object p1, p1, Ll/rqr0;->b:Ljava/lang/String;

    .line 404
    .line 405
    invoke-interface {v1, v3, p1, v0}, Ll/bat0;->R4(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Ll/p1z0;->f:Ll/tar0;

    .line 409
    .line 410
    invoke-static {p1}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    invoke-static {p1}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    new-instance v1, Landroid/util/Pair;

    .line 419
    .line 420
    const-string v3, "tqgt"

    .line 421
    .line 422
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v8

    .line 426
    invoke-direct {v1, v3, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 427
    .line 428
    .line 429
    new-instance v3, Landroid/util/Pair;

    .line 430
    .line 431
    const-string v8, "tpc"

    .line 432
    .line 433
    const-string v9, "na"

    .line 434
    .line 435
    sget-object v12, Ll/sgs0;->u9:Ll/dgs0;

    .line 436
    .line 437
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 438
    .line 439
    .line 440
    move-result-object v13

    .line 441
    invoke-virtual {v13, v12}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    move-result-object v12

    .line 445
    check-cast v12, Ljava/lang/Boolean;

    .line 446
    .line 447
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 448
    .line 449
    .line 450
    move-result v12
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 451
    if-nez v12, :cond_6

    .line 452
    .line 453
    goto :goto_2

    .line 454
    :cond_6
    :try_start_5
    const-string v12, "extras"

    .line 455
    .line 456
    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 457
    .line 458
    .line 459
    move-result-object v11

    .line 460
    const-string v12, "accept_3p_cookie"

    .line 461
    .line 462
    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 463
    .line 464
    .line 465
    move-result v11

    .line 466
    if-eqz v11, :cond_7

    .line 467
    .line 468
    const-string v9, "1"

    .line 469
    .line 470
    goto :goto_2

    .line 471
    :catch_2
    move-exception v11

    .line 472
    goto :goto_1

    .line 473
    :cond_7
    const-string v9, "0"
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 474
    .line 475
    goto :goto_2

    .line 476
    :goto_1
    :try_start_6
    const-string v12, "Error retrieving JSONObject from the requestJson, "

    .line 477
    .line 478
    invoke-static {v12, v11}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 479
    .line 480
    .line 481
    :goto_2
    invoke-direct {v3, v8, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 482
    .line 483
    .line 484
    filled-new-array {v1, v3}, [Landroid/util/Pair;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    invoke-static {v0, p1, v10, v1}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 489
    .line 490
    .line 491
    iget-object p1, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 492
    .line 493
    invoke-interface {p1, v6}, Ll/rdw0;->S(Z)Ll/rdw0;
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 494
    .line 495
    .line 496
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 497
    .line 498
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    check-cast p1, Ljava/lang/Boolean;

    .line 503
    .line 504
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 505
    .line 506
    .line 507
    move-result p1

    .line 508
    if-eqz p1, :cond_8

    .line 509
    .line 510
    if-eqz v4, :cond_8

    .line 511
    .line 512
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 513
    .line 514
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 518
    .line 519
    .line 520
    return-void

    .line 521
    :catch_3
    move-exception p1

    .line 522
    :try_start_7
    const-string v6, "Failed to create JSON object from the request string."

    .line 523
    .line 524
    invoke-static {v6}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    iget-object v6, p0, Ll/p1z0;->c:Ll/bat0;

    .line 528
    .line 529
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v8

    .line 533
    new-instance v9, Ljava/lang/StringBuilder;

    .line 534
    .line 535
    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 536
    .line 537
    .line 538
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v3

    .line 545
    invoke-interface {v6, v3}, Ll/bat0;->zzb(Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    iget-object v3, p0, Ll/p1z0;->f:Ll/tar0;

    .line 549
    .line 550
    invoke-static {v3}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 551
    .line 552
    .line 553
    move-result-object v6

    .line 554
    invoke-static {v3}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 555
    .line 556
    .line 557
    move-result-object v3

    .line 558
    new-instance v8, Landroid/util/Pair;

    .line 559
    .line 560
    const-string v9, "request_invalid"

    .line 561
    .line 562
    invoke-direct {v8, v0, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 563
    .line 564
    .line 565
    filled-new-array {v8}, [Landroid/util/Pair;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    invoke-static {v6, v3, v1, v0}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 570
    .line 571
    .line 572
    iget-object v0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 573
    .line 574
    invoke-interface {v0, p1}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 575
    .line 576
    .line 577
    invoke-interface {v0, v7}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 578
    .line 579
    .line 580
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 581
    .line 582
    .line 583
    move-result-object v0

    .line 584
    invoke-virtual {v0, p1, v2}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 585
    .line 586
    .line 587
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 588
    .line 589
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object p1

    .line 593
    check-cast p1, Ljava/lang/Boolean;

    .line 594
    .line 595
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 596
    .line 597
    .line 598
    move-result p1

    .line 599
    if-eqz p1, :cond_8

    .line 600
    .line 601
    if-eqz v4, :cond_8

    .line 602
    .line 603
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 604
    .line 605
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 609
    .line 610
    .line 611
    return-void

    .line 612
    :goto_3
    :try_start_8
    iget-object v0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 613
    .line 614
    invoke-interface {v0, p1}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 615
    .line 616
    .line 617
    invoke-interface {v0, v7}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 618
    .line 619
    .line 620
    invoke-static {v5, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 621
    .line 622
    .line 623
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 624
    .line 625
    .line 626
    move-result-object v0

    .line 627
    invoke-virtual {v0, p1, v2}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 628
    .line 629
    .line 630
    sget-object p1, Ll/ris0;->e:Ll/kis0;

    .line 631
    .line 632
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    move-result-object p1

    .line 636
    check-cast p1, Ljava/lang/Boolean;

    .line 637
    .line 638
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 639
    .line 640
    .line 641
    move-result p1

    .line 642
    if-eqz p1, :cond_8

    .line 643
    .line 644
    if-eqz v4, :cond_8

    .line 645
    .line 646
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 647
    .line 648
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 649
    .line 650
    .line 651
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 652
    .line 653
    .line 654
    :cond_8
    return-void

    .line 655
    :goto_4
    sget-object v0, Ll/ris0;->e:Ll/kis0;

    .line 656
    .line 657
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    check-cast v0, Ljava/lang/Boolean;

    .line 662
    .line 663
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 664
    .line 665
    .line 666
    move-result v0

    .line 667
    if-eqz v0, :cond_9

    .line 668
    .line 669
    if-eqz v4, :cond_9

    .line 670
    .line 671
    iget-object p0, p0, Ll/p1z0;->d:Ll/rdw0;

    .line 672
    .line 673
    invoke-virtual {v4, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 674
    .line 675
    .line 676
    invoke-virtual {v4}, Ll/cew0;->g()V

    .line 677
    .line 678
    .line 679
    :cond_9
    throw p1
.end method
