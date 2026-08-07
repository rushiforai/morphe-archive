.class public final Ll/chv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/t6w0;

.field public final synthetic c:Ll/q6w0;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/uew0;

.field public final synthetic f:Ll/b7w0;

.field public final synthetic g:Ll/ehv0;


# direct methods
.method public constructor <init>(Ll/ehv0;JLl/t6w0;Ll/q6w0;Ljava/lang/String;Ll/uew0;Ll/b7w0;)V
    .locals 0

    .line 1
    iput-wide p2, p0, Ll/chv0;->a:J

    .line 2
    .line 3
    iput-object p4, p0, Ll/chv0;->b:Ll/t6w0;

    .line 4
    .line 5
    iput-object p5, p0, Ll/chv0;->c:Ll/q6w0;

    .line 6
    .line 7
    iput-object p6, p0, Ll/chv0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p7, p0, Ll/chv0;->e:Ll/uew0;

    .line 10
    .line 11
    iput-object p8, p0, Ll/chv0;->f:Ll/b7w0;

    .line 12
    .line 13
    iput-object p1, p0, Ll/chv0;->g:Ll/ehv0;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ehv0;->e(Ll/ehv0;)Lcom/google/android/gms/common/util/Clock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Ll/chv0;->a:J

    .line 12
    .line 13
    sub-long v8, v0, v2

    .line 14
    .line 15
    instance-of v0, p1, Ljava/util/concurrent/TimeoutException;

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    :cond_0
    :goto_0
    move v7, v0

    .line 23
    :goto_1
    move-object v3, v2

    .line 24
    goto :goto_3

    .line 25
    :cond_1
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzelp;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    move v7, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    goto :goto_0

    .line 37
    :cond_3
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzfho;

    .line 38
    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    goto :goto_0

    .line 43
    :cond_4
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzead;

    .line 44
    .line 45
    const/4 v3, 0x6

    .line 46
    if-eqz v0, :cond_6

    .line 47
    .line 48
    invoke-static {p1}, Ll/v8w0;->a(Ljava/lang/Throwable;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v0, v0, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 53
    .line 54
    if-ne v0, v1, :cond_5

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    goto :goto_2

    .line 58
    :cond_5
    move v0, v3

    .line 59
    :goto_2
    sget-object v3, Ll/sgs0;->C1:Ll/dgs0;

    .line 60
    .line 61
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_0

    .line 76
    .line 77
    instance-of v3, p1, Lcom/google/android/gms/internal/ads/zzeir;

    .line 78
    .line 79
    if-eqz v3, :cond_0

    .line 80
    .line 81
    move-object v3, p1

    .line 82
    check-cast v3, Lcom/google/android/gms/internal/ads/zzeir;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzeir;->zzb()Lcom/google/android/gms/ads/internal/client/zze;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    if-eqz v3, :cond_0

    .line 89
    .line 90
    iget v3, v3, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 91
    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    move v7, v0

    .line 97
    goto :goto_3

    .line 98
    :cond_6
    move v7, v3

    .line 99
    goto :goto_1

    .line 100
    :goto_3
    iget-object v11, p0, Ll/chv0;->g:Ll/ehv0;

    .line 101
    .line 102
    monitor-enter v11

    .line 103
    :try_start_0
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 104
    .line 105
    invoke-static {v0}, Ll/ehv0;->n(Ll/ehv0;)Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-eqz v4, :cond_8

    .line 110
    .line 111
    invoke-static {v0}, Ll/ehv0;->c(Ll/ehv0;)Ll/ghv0;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    iget-object v5, p0, Ll/chv0;->b:Ll/t6w0;

    .line 116
    .line 117
    iget-object v6, p0, Ll/chv0;->c:Ll/q6w0;

    .line 118
    .line 119
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzeir;

    .line 120
    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    move-object v2, p1

    .line 124
    check-cast v2, Lcom/google/android/gms/internal/ads/zzeir;

    .line 125
    .line 126
    :cond_7
    move-wide v9, v8

    .line 127
    move-object v8, v2

    .line 128
    goto :goto_4

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    move-object p0, v0

    .line 131
    goto/16 :goto_5

    .line 132
    .line 133
    :goto_4
    invoke-virtual/range {v4 .. v10}, Ll/ghv0;->a(Ll/t6w0;Ll/q6w0;ILcom/google/android/gms/internal/ads/zzeir;J)V

    .line 134
    .line 135
    .line 136
    move-wide v8, v9

    .line 137
    :cond_8
    sget-object v0, Ll/sgs0;->j8:Ll/dgs0;

    .line 138
    .line 139
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_9

    .line 154
    .line 155
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 156
    .line 157
    invoke-static {v0}, Ll/ehv0;->d(Ll/ehv0;)Ll/yew0;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v2, p0, Ll/chv0;->e:Ll/uew0;

    .line 162
    .line 163
    iget-object v4, p0, Ll/chv0;->f:Ll/b7w0;

    .line 164
    .line 165
    iget-object v5, p0, Ll/chv0;->c:Ll/q6w0;

    .line 166
    .line 167
    iget-object v6, v5, Ll/q6w0;->o:Ljava/util/List;

    .line 168
    .line 169
    invoke-virtual {v2, v4, v5, v6}, Ll/uew0;->c(Ll/b7w0;Ll/q6w0;Ljava/util/List;)Ljava/util/List;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {v0, v2}, Ll/yew0;->d(Ljava/util/List;)V

    .line 174
    .line 175
    .line 176
    :cond_9
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 177
    .line 178
    invoke-static {v0}, Ll/ehv0;->o(Ll/ehv0;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_a

    .line 183
    .line 184
    monitor-exit v11

    .line 185
    return-void

    .line 186
    :cond_a
    invoke-static {v0}, Ll/ehv0;->h(Ll/ehv0;)Ljava/util/LinkedHashMap;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object v2, p0, Ll/chv0;->c:Ll/q6w0;

    .line 191
    .line 192
    new-instance v4, Ll/dhv0;

    .line 193
    .line 194
    iget-object v5, p0, Ll/chv0;->d:Ljava/lang/String;

    .line 195
    .line 196
    iget-object v6, v2, Ll/q6w0;->g0:Ljava/lang/String;

    .line 197
    .line 198
    move-object v10, v3

    .line 199
    invoke-direct/range {v4 .. v10}, Ll/dhv0;-><init>(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/Integer;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, v2, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    invoke-static {p1}, Ll/v8w0;->a(Ljava/lang/Throwable;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 210
    .line 211
    if-eq v0, v1, :cond_b

    .line 212
    .line 213
    if-nez v0, :cond_c

    .line 214
    .line 215
    :cond_b
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzd:Lcom/google/android/gms/ads/internal/client/zze;

    .line 216
    .line 217
    if-eqz v0, :cond_c

    .line 218
    .line 219
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zze;->zzc:Ljava/lang/String;

    .line 220
    .line 221
    const-string v1, "com.google.android.gms.ads"

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-nez v0, :cond_c

    .line 228
    .line 229
    new-instance v0, Lcom/google/android/gms/internal/ads/zzeir;

    .line 230
    .line 231
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzd:Lcom/google/android/gms/ads/internal/client/zze;

    .line 232
    .line 233
    const/16 v1, 0xd

    .line 234
    .line 235
    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/ads/zzeir;-><init>(ILcom/google/android/gms/ads/internal/client/zze;)V

    .line 236
    .line 237
    .line 238
    invoke-static {v0}, Ll/v8w0;->a(Ljava/lang/Throwable;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    :cond_c
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 243
    .line 244
    invoke-static {v0}, Ll/ehv0;->b(Ll/ehv0;)Ll/tcv0;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    iget-object p0, p0, Ll/chv0;->c:Ll/q6w0;

    .line 249
    .line 250
    invoke-virtual {v0, p0, v8, v9, p1}, Ll/tcv0;->f(Ll/q6w0;JLcom/google/android/gms/ads/internal/client/zze;)V

    .line 251
    .line 252
    .line 253
    monitor-exit v11

    .line 254
    return-void

    .line 255
    :goto_5
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    throw p0
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 11

    .line 1
    iget-object p1, p0, Ll/chv0;->g:Ll/ehv0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ehv0;->e(Ll/ehv0;)Lcom/google/android/gms/common/util/Clock;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Ll/chv0;->a:J

    .line 12
    .line 13
    sub-long v8, v0, v2

    .line 14
    .line 15
    iget-object p1, p0, Ll/chv0;->g:Ll/ehv0;

    .line 16
    .line 17
    monitor-enter p1

    .line 18
    :try_start_0
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/ehv0;->n(Ll/ehv0;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-static {v0}, Ll/ehv0;->c(Ll/ehv0;)Ll/ghv0;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Ll/chv0;->b:Ll/t6w0;

    .line 31
    .line 32
    iget-object v6, p0, Ll/chv0;->c:Ll/q6w0;

    .line 33
    .line 34
    const/4 v7, 0x0

    .line 35
    move-wide v9, v8

    .line 36
    const/4 v8, 0x0

    .line 37
    invoke-virtual/range {v4 .. v10}, Ll/ghv0;->a(Ll/t6w0;Ll/q6w0;ILcom/google/android/gms/internal/ads/zzeir;J)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_2

    .line 44
    :cond_0
    move-wide v9, v8

    .line 45
    :goto_0
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 46
    .line 47
    invoke-static {v0}, Ll/ehv0;->o(Ll/ehv0;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    monitor-exit p1

    .line 54
    return-void

    .line 55
    :cond_1
    iget-object v1, p0, Ll/chv0;->c:Ll/q6w0;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/ehv0;->p(Ll/ehv0;Ll/q6w0;)Z

    .line 58
    .line 59
    .line 60
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    iget-object v1, p0, Ll/chv0;->g:Ll/ehv0;

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    :try_start_1
    invoke-static {v1}, Ll/ehv0;->h(Ll/ehv0;)Ljava/util/LinkedHashMap;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Ll/chv0;->c:Ll/q6w0;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ll/dhv0;

    .line 76
    .line 77
    iput-wide v9, v0, Ll/dhv0;->d:J

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    invoke-static {v1}, Ll/ehv0;->h(Ll/ehv0;)Ljava/util/LinkedHashMap;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/chv0;->c:Ll/q6w0;

    .line 85
    .line 86
    new-instance v4, Ll/dhv0;

    .line 87
    .line 88
    iget-object v5, p0, Ll/chv0;->d:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v6, v1, Ll/q6w0;->g0:Ljava/lang/String;

    .line 91
    .line 92
    const/4 v7, 0x0

    .line 93
    move-wide v8, v9

    .line 94
    const/4 v10, 0x0

    .line 95
    invoke-direct/range {v4 .. v10}, Ll/dhv0;-><init>(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/Integer;)V

    .line 96
    .line 97
    .line 98
    move-wide v9, v8

    .line 99
    invoke-virtual {v0, v1, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    :goto_1
    iget-object v0, p0, Ll/chv0;->g:Ll/ehv0;

    .line 103
    .line 104
    invoke-static {v0}, Ll/ehv0;->b(Ll/ehv0;)Ll/tcv0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object p0, p0, Ll/chv0;->c:Ll/q6w0;

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {v0, p0, v9, v10, v1}, Ll/tcv0;->g(Ll/q6w0;JLcom/google/android/gms/ads/internal/client/zze;)V

    .line 112
    .line 113
    .line 114
    monitor-exit p1

    .line 115
    return-void

    .line 116
    :goto_2
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    throw p0
.end method
