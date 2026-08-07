.class public final Lcom/google/android/libraries/places/internal/zzbmq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Lcom/google/android/libraries/places/internal/zzbgj;


# instance fields
.field private zza:Lcom/google/android/libraries/places/internal/zzbmm;

.field private zzb:I

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbqo;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzbqz;

.field private zze:Lcom/google/android/libraries/places/internal/zzazo;

.field private zzf:I

.field private zzg:Z

.field private zzh:Lcom/google/android/libraries/places/internal/zzbge;

.field private zzi:Lcom/google/android/libraries/places/internal/zzbge;

.field private zzj:J

.field private zzk:Z

.field private zzl:I

.field private zzm:I

.field private zzn:Z

.field private volatile zzo:Z

.field private zzp:I


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbmm;Lcom/google/android/libraries/places/internal/zzazo;ILcom/google/android/libraries/places/internal/zzbqo;Lcom/google/android/libraries/places/internal/zzbqz;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzf:I

    .line 9
    .line 10
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbge;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbge;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzk:Z

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzl:I

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzn:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzo:Z

    .line 26
    .line 27
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zze:Lcom/google/android/libraries/places/internal/zzazo;

    .line 30
    .line 31
    iput p3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzb:I

    .line 32
    .line 33
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 34
    .line 35
    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzd:Lcom/google/android/libraries/places/internal/zzbqz;

    .line 36
    .line 37
    return-void
.end method

.method private final zzh()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzk:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzk:Z

    .line 8
    .line 9
    :goto_0
    const/4 v1, 0x0

    .line 10
    :try_start_0
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzj:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    if-lez v2, :cond_f

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    :try_start_1
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 20
    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbge;

    .line 24
    .line 25
    invoke-direct {v3}, Lcom/google/android/libraries/places/internal/zzbge;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    :cond_1
    move v3, v1

    .line 31
    goto :goto_1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto/16 :goto_5

    .line 34
    .line 35
    :goto_1
    :try_start_2
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzf:I

    .line 36
    .line 37
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 38
    .line 39
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    sub-int/2addr v4, v5

    .line 44
    if-lez v4, :cond_3

    .line 45
    .line 46
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 47
    .line 48
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 49
    .line 50
    .line 51
    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 52
    if-nez v5, :cond_2

    .line 53
    .line 54
    if-lez v3, :cond_f

    .line 55
    .line 56
    :try_start_3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 57
    .line 58
    invoke-interface {v0, v3}, Lcom/google/android/libraries/places/internal/zzbmm;->zzE(I)V

    .line 59
    .line 60
    .line 61
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 62
    .line 63
    if-ne v0, v2, :cond_f

    .line 64
    .line 65
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 66
    .line 67
    int-to-long v4, v3

    .line 68
    invoke-virtual {v0, v4, v5}, Lcom/google/android/libraries/places/internal/zzbqo;->zzh(J)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 72
    .line 73
    add-int/2addr v0, v3

    .line 74
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    .line 76
    goto/16 :goto_7

    .line 77
    .line 78
    :catchall_1
    move-exception v0

    .line 79
    goto/16 :goto_8

    .line 80
    .line 81
    :cond_2
    :try_start_4
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 82
    .line 83
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    add-int/2addr v3, v4

    .line 92
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 93
    .line 94
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 95
    .line 96
    invoke-virtual {v6, v4}, Lcom/google/android/libraries/places/internal/zzbge;->zzg(I)Lcom/google/android/libraries/places/internal/zzbnv;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v5, v4}, Lcom/google/android/libraries/places/internal/zzbge;->zzh(Lcom/google/android/libraries/places/internal/zzbnv;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :catchall_2
    move-exception v0

    .line 105
    goto/16 :goto_6

    .line 106
    .line 107
    :cond_3
    if-lez v3, :cond_4

    .line 108
    .line 109
    :try_start_5
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 110
    .line 111
    invoke-interface {v4, v3}, Lcom/google/android/libraries/places/internal/zzbmm;->zzE(I)V

    .line 112
    .line 113
    .line 114
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 115
    .line 116
    if-ne v4, v2, :cond_4

    .line 117
    .line 118
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 119
    .line 120
    int-to-long v5, v3

    .line 121
    invoke-virtual {v4, v5, v6}, Lcom/google/android/libraries/places/internal/zzbqo;->zzh(J)V

    .line 122
    .line 123
    .line 124
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 125
    .line 126
    add-int/2addr v4, v3

    .line 127
    iput v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 128
    .line 129
    :cond_4
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 130
    .line 131
    add-int/lit8 v4, v3, -0x1

    .line 132
    .line 133
    const/4 v5, 0x0

    .line 134
    if-eqz v3, :cond_d

    .line 135
    .line 136
    if-eqz v4, :cond_9

    .line 137
    .line 138
    if-eq v4, v0, :cond_6

    .line 139
    .line 140
    new-instance v2, Ljava/lang/AssertionError;

    .line 141
    .line 142
    if-eq v3, v0, :cond_5

    .line 143
    .line 144
    const-string v0, "BODY"

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_5
    const-string v0, "HEADER"

    .line 148
    .line 149
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v4, "Invalid state: "

    .line 155
    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    throw v2

    .line 170
    :cond_6
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 171
    .line 172
    iget v7, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzl:I

    .line 173
    .line 174
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 175
    .line 176
    int-to-long v8, v2

    .line 177
    const-wide/16 v10, -0x1

    .line 178
    .line 179
    invoke-virtual/range {v6 .. v11}, Lcom/google/android/libraries/places/internal/zzbqo;->zzf(IJJ)V

    .line 180
    .line 181
    .line 182
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 183
    .line 184
    iget-boolean v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzg:Z

    .line 185
    .line 186
    if-eqz v2, :cond_8

    .line 187
    .line 188
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zze:Lcom/google/android/libraries/places/internal/zzazo;

    .line 189
    .line 190
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 191
    .line 192
    if-eq v2, v3, :cond_7

    .line 193
    .line 194
    :try_start_6
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 195
    .line 196
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbnw;

    .line 197
    .line 198
    invoke-direct {v4, v3}, Lcom/google/android/libraries/places/internal/zzbnw;-><init>(Lcom/google/android/libraries/places/internal/zzbnv;)V

    .line 199
    .line 200
    .line 201
    invoke-interface {v2, v4}, Lcom/google/android/libraries/places/internal/zzazo;->zza(Ljava/io/InputStream;)Ljava/io/InputStream;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbmp;

    .line 206
    .line 207
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzb:I

    .line 208
    .line 209
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 210
    .line 211
    invoke-direct {v3, v2, v4, v6}, Lcom/google/android/libraries/places/internal/zzbmp;-><init>(Ljava/io/InputStream;ILcom/google/android/libraries/places/internal/zzbqo;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 212
    .line 213
    .line 214
    goto :goto_3

    .line 215
    :catch_0
    move-exception v0

    .line 216
    :try_start_7
    new-instance v2, Ljava/lang/RuntimeException;

    .line 217
    .line 218
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 219
    .line 220
    .line 221
    throw v2

    .line 222
    :cond_7
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 223
    .line 224
    const-string v2, "Can\'t decode compressed gRPC message as compression not configured"

    .line 225
    .line 226
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 231
    .line 232
    invoke-direct {v2, v0, v5}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 233
    .line 234
    .line 235
    throw v2

    .line 236
    :cond_8
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 237
    .line 238
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 239
    .line 240
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    int-to-long v3, v3

    .line 245
    invoke-virtual {v2, v3, v4}, Lcom/google/android/libraries/places/internal/zzbqo;->zzg(J)V

    .line 246
    .line 247
    .line 248
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 249
    .line 250
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbnw;

    .line 251
    .line 252
    invoke-direct {v3, v2}, Lcom/google/android/libraries/places/internal/zzbnw;-><init>(Lcom/google/android/libraries/places/internal/zzbnv;)V

    .line 253
    .line 254
    .line 255
    :goto_3
    iput-object v5, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 256
    .line 257
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 258
    .line 259
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbmo;

    .line 260
    .line 261
    invoke-direct {v4, v3, v5}, Lcom/google/android/libraries/places/internal/zzbmo;-><init>(Ljava/io/InputStream;Lcom/google/android/libraries/places/internal/zzbmn;)V

    .line 262
    .line 263
    .line 264
    invoke-interface {v2, v4}, Lcom/google/android/libraries/places/internal/zzbmm;->zzr(Lcom/google/android/libraries/places/internal/zzbqq;)V

    .line 265
    .line 266
    .line 267
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 268
    .line 269
    const/4 v2, 0x5

    .line 270
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzf:I

    .line 271
    .line 272
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzj:J

    .line 273
    .line 274
    const-wide/16 v4, -0x1

    .line 275
    .line 276
    add-long/2addr v2, v4

    .line 277
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzj:J

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :cond_9
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 282
    .line 283
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbge;->zze()I

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    and-int/lit16 v4, v3, 0xfe

    .line 288
    .line 289
    if-nez v4, :cond_c

    .line 290
    .line 291
    and-int/lit8 v3, v3, 0x1

    .line 292
    .line 293
    if-eq v0, v3, :cond_a

    .line 294
    .line 295
    move v3, v1

    .line 296
    goto :goto_4

    .line 297
    :cond_a
    move v3, v0

    .line 298
    :goto_4
    iput-boolean v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzg:Z

    .line 299
    .line 300
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 301
    .line 302
    const/4 v4, 0x4

    .line 303
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 304
    .line 305
    .line 306
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbnv;->zze()I

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbnv;->zze()I

    .line 311
    .line 312
    .line 313
    move-result v6

    .line 314
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbnv;->zze()I

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbnv;->zze()I

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    shl-int/lit8 v4, v4, 0x18

    .line 323
    .line 324
    shl-int/lit8 v6, v6, 0x10

    .line 325
    .line 326
    shl-int/lit8 v7, v7, 0x8

    .line 327
    .line 328
    or-int/2addr v4, v6

    .line 329
    or-int/2addr v4, v7

    .line 330
    or-int/2addr v3, v4

    .line 331
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzf:I

    .line 332
    .line 333
    if-ltz v3, :cond_b

    .line 334
    .line 335
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzb:I

    .line 336
    .line 337
    if-gt v3, v4, :cond_b

    .line 338
    .line 339
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzl:I

    .line 340
    .line 341
    add-int/2addr v3, v0

    .line 342
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzl:I

    .line 343
    .line 344
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 345
    .line 346
    invoke-virtual {v4, v3}, Lcom/google/android/libraries/places/internal/zzbqo;->zze(I)V

    .line 347
    .line 348
    .line 349
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzd:Lcom/google/android/libraries/places/internal/zzbqz;

    .line 350
    .line 351
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbqz;->zzc()V

    .line 352
    .line 353
    .line 354
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 355
    .line 356
    goto/16 :goto_0

    .line 357
    .line 358
    :cond_b
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 359
    .line 360
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 361
    .line 362
    const-string v3, "gRPC message exceeds maximum size %d: %d"

    .line 363
    .line 364
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzb:I

    .line 365
    .line 366
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 367
    .line 368
    .line 369
    move-result-object v4

    .line 370
    iget v6, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzf:I

    .line 371
    .line 372
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v4

    .line 380
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 389
    .line 390
    invoke-direct {v2, v0, v5}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 391
    .line 392
    .line 393
    throw v2

    .line 394
    :cond_c
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 395
    .line 396
    const-string v2, "gRPC frame header malformed: reserved bits not zero"

    .line 397
    .line 398
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 403
    .line 404
    invoke-direct {v2, v0, v5}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 405
    .line 406
    .line 407
    throw v2

    .line 408
    :cond_d
    throw v5

    .line 409
    :goto_5
    move v3, v1

    .line 410
    :goto_6
    if-lez v3, :cond_e

    .line 411
    .line 412
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 413
    .line 414
    invoke-interface {v4, v3}, Lcom/google/android/libraries/places/internal/zzbmm;->zzE(I)V

    .line 415
    .line 416
    .line 417
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzp:I

    .line 418
    .line 419
    if-ne v4, v2, :cond_e

    .line 420
    .line 421
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzc:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 422
    .line 423
    int-to-long v4, v3

    .line 424
    invoke-virtual {v2, v4, v5}, Lcom/google/android/libraries/places/internal/zzbqo;->zzh(J)V

    .line 425
    .line 426
    .line 427
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 428
    .line 429
    add-int/2addr v2, v3

    .line 430
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzm:I

    .line 431
    .line 432
    :cond_e
    throw v0

    .line 433
    :cond_f
    :goto_7
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzn:Z

    .line 434
    .line 435
    if-eqz v0, :cond_10

    .line 436
    .line 437
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzi()Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-eqz v0, :cond_10

    .line 442
    .line 443
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 444
    .line 445
    .line 446
    :cond_10
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzk:Z

    .line 447
    .line 448
    return-void

    .line 449
    :goto_8
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzk:Z

    .line 450
    .line 451
    throw v0
.end method

.method private final zzi()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public final close()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzg()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbge;->zzf()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :try_start_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbeg;->close()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 32
    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbeg;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    :cond_3
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    .line 43
    .line 44
    invoke-interface {p0, v1}, Lcom/google/android/libraries/places/internal/zzbmm;->zze(Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :goto_1
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzh:Lcom/google/android/libraries/places/internal/zzbge;

    .line 51
    .line 52
    throw v1
.end method

.method public final zza()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzg()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzi()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->close()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzn:Z

    .line 20
    .line 21
    return-void
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbnv;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzg()Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzn:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzbge;->zzh(Lcom/google/android/libraries/places/internal/zzbnv;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    .line 17
    .line 18
    :try_start_1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzh()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    const/4 v0, 0x0

    .line 24
    goto :goto_1

    .line 25
    :catchall_1
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :goto_1
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 34
    .line 35
    .line 36
    :cond_2
    throw p0
.end method

.method public final zzc(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzg()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzj:J

    .line 9
    .line 10
    const-wide/16 v2, 0x2

    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzj:J

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzh()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final zzd(Lcom/google/android/libraries/places/internal/zzazo;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zze:Lcom/google/android/libraries/places/internal/zzazo;

    return-void
.end method

.method public final zze(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzb:I

    return-void
.end method

.method public final zzf(Lcom/google/android/libraries/places/internal/zzbmm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zza:Lcom/google/android/libraries/places/internal/zzbmm;

    return-void
.end method

.method public final zzg()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmq;->zzi:Lcom/google/android/libraries/places/internal/zzbge;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
