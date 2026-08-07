.class public final Lcom/google/android/libraries/places/internal/zzbpw;
.super Lcom/google/android/libraries/places/internal/zzbcu;
.source "SourceFile"


# instance fields
.field private final zza:Z

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbey;


# direct methods
.method public constructor <init>(ZIILcom/google/android/libraries/places/internal/zzbey;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcu;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbpw;->zza:Z

    .line 5
    .line 6
    const-string p1, "autoLoadBalancerFactory"

    .line 7
    .line 8
    invoke-static {p4, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbpw;->zzb:Lcom/google/android/libraries/places/internal/zzbey;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final zza(Ljava/util/Map;)Lcom/google/android/libraries/places/internal/zzbcp;
    .locals 14

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpw;->zzb:Lcom/google/android/libraries/places/internal/zzbey;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbey;->zzc(Ljava/util/Map;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    move-object v7, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzc()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzc()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzd()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v7, v0

    .line 32
    :goto_0
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbpw;->zza:Z

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    if-nez p1, :cond_3

    .line 39
    .line 40
    :cond_2
    :goto_1
    move-object v6, v1

    .line 41
    goto :goto_4

    .line 42
    :cond_3
    const-string v3, "retryThrottling"

    .line 43
    .line 44
    invoke-static {p1, v3}, Lcom/google/android/libraries/places/internal/zzbkg;->zzj(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-nez v3, :cond_4

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    const-string v4, "maxTokens"

    .line 52
    .line 53
    invoke-static {v3, v4}, Lcom/google/android/libraries/places/internal/zzbkg;->zzb(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Double;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4}, Ljava/lang/Double;->floatValue()F

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    const-string v5, "tokenRatio"

    .line 62
    .line 63
    invoke-static {v3, v5}, Lcom/google/android/libraries/places/internal/zzbkg;->zzb(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Double;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3}, Ljava/lang/Double;->floatValue()F

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v5, 0x0

    .line 72
    cmpl-float v6, v4, v5

    .line 73
    .line 74
    if-lez v6, :cond_5

    .line 75
    .line 76
    move v6, v2

    .line 77
    goto :goto_2

    .line 78
    :cond_5
    move v6, v0

    .line 79
    :goto_2
    const-string v8, "maxToken should be greater than zero"

    .line 80
    .line 81
    invoke-static {v6, v8}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    cmpl-float v5, v3, v5

    .line 85
    .line 86
    if-lez v5, :cond_6

    .line 87
    .line 88
    move v5, v2

    .line 89
    goto :goto_3

    .line 90
    :cond_6
    move v5, v0

    .line 91
    :goto_3
    const-string v6, "tokenRatio should be greater than zero"

    .line 92
    .line 93
    invoke-static {v5, v6}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbpn;

    .line 97
    .line 98
    invoke-direct {v5, v4, v3}, Lcom/google/android/libraries/places/internal/zzbpn;-><init>(FF)V

    .line 99
    .line 100
    .line 101
    move-object v6, v5

    .line 102
    :goto_4
    new-instance v4, Ljava/util/HashMap;

    .line 103
    .line 104
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 105
    .line 106
    .line 107
    new-instance v5, Ljava/util/HashMap;

    .line 108
    .line 109
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 110
    .line 111
    .line 112
    if-nez p1, :cond_7

    .line 113
    .line 114
    move-object v8, v1

    .line 115
    goto :goto_5

    .line 116
    :cond_7
    const-string v3, "healthCheckConfig"

    .line 117
    .line 118
    invoke-static {p1, v3}, Lcom/google/android/libraries/places/internal/zzbkg;->zzj(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    move-object v8, v3

    .line 123
    :goto_5
    const-string v3, "methodConfig"

    .line 124
    .line 125
    invoke-static {p1, v3}, Lcom/google/android/libraries/places/internal/zzbkg;->zzh(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    if-nez v3, :cond_8

    .line 130
    .line 131
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbmj;

    .line 132
    .line 133
    const/4 v3, 0x0

    .line 134
    invoke-direct/range {v2 .. v8}, Lcom/google/android/libraries/places/internal/zzbmj;-><init>(Lcom/google/android/libraries/places/internal/zzbmg;Ljava/util/Map;Ljava/util/Map;Lcom/google/android/libraries/places/internal/zzbpn;Ljava/lang/Object;Ljava/util/Map;)V

    .line 135
    .line 136
    .line 137
    goto/16 :goto_8

    .line 138
    .line 139
    :cond_8
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    if-eqz v9, :cond_d

    .line 148
    .line 149
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    check-cast v9, Ljava/util/Map;

    .line 154
    .line 155
    new-instance v10, Lcom/google/android/libraries/places/internal/zzbmg;

    .line 156
    .line 157
    const/4 v11, 0x5

    .line 158
    invoke-direct {v10, v9, p0, v11, v11}, Lcom/google/android/libraries/places/internal/zzbmg;-><init>(Ljava/util/Map;ZII)V

    .line 159
    .line 160
    .line 161
    const-string v11, "name"

    .line 162
    .line 163
    invoke-static {v9, v11}, Lcom/google/android/libraries/places/internal/zzbkg;->zzh(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    .line 164
    .line 165
    .line 166
    move-result-object v9

    .line 167
    if-eqz v9, :cond_9

    .line 168
    .line 169
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    if-nez v11, :cond_9

    .line 174
    .line 175
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 180
    .line 181
    .line 182
    move-result v11

    .line 183
    if-eqz v11, :cond_9

    .line 184
    .line 185
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v11

    .line 189
    check-cast v11, Ljava/util/Map;

    .line 190
    .line 191
    const-string v12, "service"

    .line 192
    .line 193
    invoke-static {v11, v12}, Lcom/google/android/libraries/places/internal/zzbkg;->zze(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v12

    .line 197
    const-string v13, "method"

    .line 198
    .line 199
    invoke-static {v11, v13}, Lcom/google/android/libraries/places/internal/zzbkg;->zze(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v11

    .line 203
    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zznb;->zzd(Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result v13

    .line 207
    if-eqz v13, :cond_b

    .line 208
    .line 209
    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zznb;->zzd(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v12

    .line 213
    const-string v13, "missing service name for method %s"

    .line 214
    .line 215
    invoke-static {v12, v13, v11}, Lcom/google/android/libraries/places/internal/zzmt;->zzj(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    if-nez v1, :cond_a

    .line 219
    .line 220
    move v1, v2

    .line 221
    goto :goto_7

    .line 222
    :cond_a
    move v1, v0

    .line 223
    :goto_7
    const-string v11, "Duplicate default method config in service config %s"

    .line 224
    .line 225
    invoke-static {v1, v11, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzj(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    move-object v1, v10

    .line 229
    goto :goto_6

    .line 230
    :cond_b
    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zznb;->zzd(Ljava/lang/String;)Z

    .line 231
    .line 232
    .line 233
    move-result v13

    .line 234
    if-eqz v13, :cond_c

    .line 235
    .line 236
    invoke-interface {v5, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v11

    .line 240
    xor-int/2addr v11, v2

    .line 241
    const-string v13, "Duplicate service %s"

    .line 242
    .line 243
    invoke-static {v11, v13, v12}, Lcom/google/android/libraries/places/internal/zzmt;->zzj(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    invoke-interface {v5, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    goto :goto_6

    .line 250
    :cond_c
    invoke-static {v12, v11}, Lcom/google/android/libraries/places/internal/zzbcl;->zze(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v11

    .line 254
    invoke-interface {v4, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v12

    .line 258
    xor-int/2addr v12, v2

    .line 259
    const-string v13, "Duplicate method name %s"

    .line 260
    .line 261
    invoke-static {v12, v13, v11}, Lcom/google/android/libraries/places/internal/zzmt;->zzj(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    invoke-interface {v4, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    goto :goto_6

    .line 268
    :cond_d
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbmj;

    .line 269
    .line 270
    move-object v3, v1

    .line 271
    invoke-direct/range {v2 .. v8}, Lcom/google/android/libraries/places/internal/zzbmj;-><init>(Lcom/google/android/libraries/places/internal/zzbmg;Ljava/util/Map;Ljava/util/Map;Lcom/google/android/libraries/places/internal/zzbpn;Ljava/lang/Object;Ljava/util/Map;)V

    .line 272
    .line 273
    .line 274
    :goto_8
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbcp;->zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 275
    .line 276
    .line 277
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    return-object p0

    .line 279
    :catch_0
    move-exception v0

    .line 280
    move-object p0, v0

    .line 281
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 282
    .line 283
    const-string v0, "failed to parse service config"

    .line 284
    .line 285
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    return-object p0
.end method
