.class public final Ll/ffy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/google/android/gms/measurement/internal/zzbf;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;ZLcom/google/android/gms/measurement/internal/zzo;ZLcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/ffy0;->a:Z

    .line 2
    .line 3
    iput-object p3, p0, Ll/ffy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 4
    .line 5
    iput-boolean p4, p0, Ll/ffy0;->c:Z

    .line 6
    .line 7
    iput-object p5, p0, Ll/ffy0;->d:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 8
    .line 9
    iput-object p6, p0, Ll/ffy0;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hcy0;->v(Ll/hcy0;)Ll/isw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "Discarding data. Failed to send event to service"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-boolean v1, p0, Ll/ffy0;->a:Z

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Ll/ffy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 35
    .line 36
    iget-boolean v2, p0, Ll/ffy0;->c:Z

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v2, p0, Ll/ffy0;->d:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 43
    .line 44
    :goto_0
    iget-object v3, p0, Ll/ffy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 45
    .line 46
    invoke-virtual {v1, v0, v2, v3}, Ll/hcy0;->K(Ll/isw0;Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 47
    .line 48
    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :cond_2
    iget-object v1, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget-object v2, Ll/whs0;->F0:Ll/zpw0;

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const-wide/16 v2, 0x0

    .line 64
    .line 65
    :try_start_0
    iget-object v4, p0, Ll/ffy0;->e:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_4

    .line 72
    .line 73
    iget-object v4, p0, Ll/ffy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 74
    .line 75
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    iget-object v4, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 81
    .line 82
    iget-object v4, v4, Ll/yyx0;->a:Ll/atx0;

    .line 83
    .line 84
    invoke-virtual {v4}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 89
    .line 90
    .line 91
    move-result-wide v4
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 92
    :try_start_1
    iget-object v6, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 93
    .line 94
    iget-object v6, v6, Ll/yyx0;->a:Ll/atx0;

    .line 95
    .line 96
    invoke-virtual {v6}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-interface {v6}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 101
    .line 102
    .line 103
    move-result-wide v6
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 104
    move-wide v12, v6

    .line 105
    move-wide v7, v4

    .line 106
    goto :goto_1

    .line 107
    :catch_0
    move-exception v0

    .line 108
    move-wide v12, v2

    .line 109
    move-wide v7, v4

    .line 110
    goto :goto_2

    .line 111
    :catch_1
    move-exception v0

    .line 112
    move-wide v7, v2

    .line 113
    move-wide v12, v7

    .line 114
    goto :goto_2

    .line 115
    :cond_3
    move-wide v7, v2

    .line 116
    move-wide v12, v7

    .line 117
    :goto_1
    :try_start_2
    iget-object v4, p0, Ll/ffy0;->d:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 118
    .line 119
    iget-object v5, p0, Ll/ffy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 120
    .line 121
    invoke-interface {v0, v4, v5}, Ll/isw0;->r4(Lcom/google/android/gms/measurement/internal/zzbf;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 122
    .line 123
    .line 124
    if-eqz v1, :cond_5

    .line 125
    .line 126
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const-string v4, "Logging telemetry for logEvent"

    .line 137
    .line 138
    invoke-virtual {v0, v4}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 142
    .line 143
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 144
    .line 145
    invoke-static {v0}, Ll/v3x0;->a(Ll/atx0;)Ll/v3x0;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 150
    .line 151
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 158
    .line 159
    .line 160
    move-result-wide v9

    .line 161
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 162
    .line 163
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 170
    .line 171
    .line 172
    move-result-wide v5

    .line 173
    sub-long/2addr v5, v12

    .line 174
    long-to-int v11, v5

    .line 175
    const v5, 0x8dcd

    .line 176
    .line 177
    .line 178
    const/4 v6, 0x0

    .line 179
    invoke-virtual/range {v4 .. v11}, Ll/v3x0;->b(IIJJI)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :catch_2
    move-exception v0

    .line 184
    goto :goto_2

    .line 185
    :cond_4
    :try_start_3
    iget-object v4, p0, Ll/ffy0;->d:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 186
    .line 187
    iget-object v5, p0, Ll/ffy0;->e:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v6, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 190
    .line 191
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-virtual {v6}, Ll/d6x0;->I()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    invoke-interface {v0, v4, v5, v6}, Ll/isw0;->y5(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    .line 200
    .line 201
    .line 202
    goto :goto_3

    .line 203
    :goto_2
    iget-object v4, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 204
    .line 205
    invoke-virtual {v4}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-virtual {v4}, Ll/d6x0;->A()Ll/l8x0;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    const-string v5, "Failed to send event to the service"

    .line 214
    .line 215
    invoke-virtual {v4, v5, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    if-eqz v1, :cond_5

    .line 219
    .line 220
    cmp-long v0, v7, v2

    .line 221
    .line 222
    if-eqz v0, :cond_5

    .line 223
    .line 224
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 225
    .line 226
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 227
    .line 228
    invoke-static {v0}, Ll/v3x0;->a(Ll/atx0;)Ll/v3x0;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 233
    .line 234
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 235
    .line 236
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 241
    .line 242
    .line 243
    move-result-wide v9

    .line 244
    iget-object v0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 245
    .line 246
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 247
    .line 248
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 253
    .line 254
    .line 255
    move-result-wide v0

    .line 256
    sub-long/2addr v0, v12

    .line 257
    long-to-int v11, v0

    .line 258
    const v5, 0x8dcd

    .line 259
    .line 260
    .line 261
    const/16 v6, 0xd

    .line 262
    .line 263
    invoke-virtual/range {v4 .. v11}, Ll/v3x0;->b(IIJJI)V

    .line 264
    .line 265
    .line 266
    :cond_5
    :goto_3
    iget-object p0, p0, Ll/ffy0;->f:Ll/hcy0;

    .line 267
    .line 268
    invoke-static {p0}, Ll/hcy0;->m0(Ll/hcy0;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method
