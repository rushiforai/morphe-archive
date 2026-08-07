.class public final Ll/bpv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# static fields
.field public static final j:Ljava/lang/Object;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ll/t1u0;

.field public final e:Ll/b9w0;

.field public final f:Ll/o7w0;

.field public final g:Ll/grw0;

.field public final h:Ll/swu0;

.field public final i:Ll/g2u0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bpv0;->j:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ll/t1u0;Ll/b9w0;Ll/o7w0;Ll/swu0;Ll/g2u0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bpv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bpv0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bpv0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bpv0;->d:Ll/t1u0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/bpv0;->e:Ll/b9w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 15
    .line 16
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/ebt0;->i()Ll/grw0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/bpv0;->g:Ll/grw0;

    .line 25
    .line 26
    iput-object p7, p0, Ll/bpv0;->h:Ll/swu0;

    .line 27
    .line 28
    iput-object p8, p0, Ll/bpv0;->i:Ll/g2u0;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final synthetic a(Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    sget-object v0, Ll/sgs0;->A5:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "quality_signals"

    .line 20
    .line 21
    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p1, Ll/sgs0;->z5:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    sget-object p1, Ll/bpv0;->j:Ljava/lang/Object;

    .line 44
    .line 45
    monitor-enter p1

    .line 46
    :try_start_0
    iget-object v0, p0, Ll/bpv0;->d:Ll/t1u0;

    .line 47
    .line 48
    iget-object v1, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 49
    .line 50
    iget-object v1, v1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/t1u0;->k(Lcom/google/android/gms/ads/internal/client/zzl;)V

    .line 53
    .line 54
    .line 55
    const-string v0, "quality_signals"

    .line 56
    .line 57
    iget-object v1, p0, Ll/bpv0;->e:Ll/b9w0;

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/b9w0;->a()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 64
    .line 65
    .line 66
    monitor-exit p1

    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0

    .line 71
    :cond_1
    iget-object p1, p0, Ll/bpv0;->d:Ll/t1u0;

    .line 72
    .line 73
    iget-object v0, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 74
    .line 75
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ll/t1u0;->k(Lcom/google/android/gms/ads/internal/client/zzl;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/bpv0;->e:Ll/b9w0;

    .line 81
    .line 82
    const-string v0, "quality_signals"

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/b9w0;->a()Landroid/os/Bundle;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object p1, p0, Ll/bpv0;->b:Ljava/lang/String;

    .line 92
    .line 93
    const-string v0, "seq_num"

    .line 94
    .line 95
    invoke-virtual {p2, v0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/bpv0;->g:Ll/grw0;

    .line 99
    .line 100
    invoke-interface {p1}, Ll/grw0;->f()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Ll/bpv0;->c:Ljava/lang/String;

    .line 107
    .line 108
    const-string v0, "session_id"

    .line 109
    .line 110
    invoke-virtual {p2, v0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    iget-object p1, p0, Ll/bpv0;->g:Ll/grw0;

    .line 114
    .line 115
    invoke-interface {p1}, Ll/grw0;->f()Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    xor-int/lit8 p1, p1, 0x1

    .line 120
    .line 121
    const-string v0, "client_purpose_one"

    .line 122
    .line 123
    invoke-virtual {p2, v0, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 124
    .line 125
    .line 126
    sget-object p1, Ll/sgs0;->B5:Ll/dgs0;

    .line 127
    .line 128
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Ljava/lang/Boolean;

    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_3

    .line 143
    .line 144
    :try_start_1
    const-string p1, "_app_id"

    .line 145
    .line 146
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/bpv0;->a:Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->R(Landroid/content/Context;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {p2, p1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :catch_0
    move-exception p1

    .line 160
    const-string v0, "AppStatsSignal_AppId"

    .line 161
    .line 162
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    :cond_3
    :goto_1
    sget-object p1, Ll/sgs0;->C5:Ll/dgs0;

    .line 170
    .line 171
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Ljava/lang/Boolean;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_4

    .line 186
    .line 187
    iget-object p1, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 188
    .line 189
    iget-object p1, p1, Ll/o7w0;->f:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz p1, :cond_4

    .line 192
    .line 193
    new-instance p1, Landroid/os/Bundle;

    .line 194
    .line 195
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Ll/bpv0;->i:Ll/g2u0;

    .line 199
    .line 200
    iget-object v1, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 201
    .line 202
    iget-object v1, v1, Ll/o7w0;->f:Ljava/lang/String;

    .line 203
    .line 204
    const-string v2, "dload"

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ll/g2u0;->b(Ljava/lang/String;)J

    .line 207
    .line 208
    .line 209
    move-result-wide v0

    .line 210
    invoke-virtual {p1, v2, v0, v1}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Ll/bpv0;->i:Ll/g2u0;

    .line 214
    .line 215
    iget-object p0, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 216
    .line 217
    iget-object p0, p0, Ll/o7w0;->f:Ljava/lang/String;

    .line 218
    .line 219
    const-string v1, "pcc"

    .line 220
    .line 221
    invoke-virtual {v0, p0}, Ll/g2u0;->a(Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    invoke-virtual {p1, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 226
    .line 227
    .line 228
    const-string p0, "ad_unit_quality_signals"

    .line 229
    .line 230
    invoke-virtual {p2, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 231
    .line 232
    .line 233
    :cond_4
    sget-object p0, Ll/sgs0;->y9:Ll/dgs0;

    .line 234
    .line 235
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p1, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    check-cast p0, Ljava/lang/Boolean;

    .line 244
    .line 245
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    if-eqz p0, :cond_5

    .line 250
    .line 251
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {p0}, Ll/ebt0;->a()I

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-lez p0, :cond_5

    .line 260
    .line 261
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {p0}, Ll/ebt0;->a()I

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    const-string p1, "nrwv"

    .line 270
    .line 271
    invoke-virtual {p2, p1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 272
    .line 273
    .line 274
    :cond_5
    return-void
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0xc

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/sgs0;->y7:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/bpv0;->h:Ll/swu0;

    .line 25
    .line 26
    iget-object v2, p0, Ll/bpv0;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/swu0;->a()Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v3, "seq_num"

    .line 33
    .line 34
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    sget-object v1, Ll/sgs0;->A5:Ll/dgs0;

    .line 38
    .line 39
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Ll/bpv0;->d:Ll/t1u0;

    .line 56
    .line 57
    iget-object v2, p0, Ll/bpv0;->f:Ll/o7w0;

    .line 58
    .line 59
    iget-object v2, v2, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/t1u0;->k(Lcom/google/android/gms/ads/internal/client/zzl;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/bpv0;->e:Ll/b9w0;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/b9w0;->a()Landroid/os/Bundle;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    new-instance v1, Ll/apv0;

    .line 74
    .line 75
    invoke-direct {v1, p0, v0}, Ll/apv0;-><init>(Ll/bpv0;Landroid/os/Bundle;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
