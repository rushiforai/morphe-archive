.class final Lcom/google/android/libraries/places/internal/zzbtz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbtr;


# instance fields
.field final zza:Lcom/google/android/libraries/places/internal/zzbtu;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbwd;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbtx;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbwd;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 5
    .line 6
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbtx;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Lcom/google/android/libraries/places/internal/zzbtx;-><init>(Lcom/google/android/libraries/places/internal/zzbwd;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzc:Lcom/google/android/libraries/places/internal/zzbtx;

    .line 12
    .line 13
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbtu;

    .line 14
    .line 15
    const/16 p3, 0x1000

    .line 16
    .line 17
    invoke-direct {p1, p3, p3, p2}, Lcom/google/android/libraries/places/internal/zzbtu;-><init>(IILcom/google/android/libraries/places/internal/zzbws;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zza:Lcom/google/android/libraries/places/internal/zzbtu;

    .line 21
    .line 22
    return-void
.end method

.method private final zzb(ISBI)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzc:Lcom/google/android/libraries/places/internal/zzbtx;

    .line 2
    .line 3
    iput p1, v0, Lcom/google/android/libraries/places/internal/zzbtx;->zzd:I

    .line 4
    .line 5
    iput p1, v0, Lcom/google/android/libraries/places/internal/zzbtx;->zza:I

    .line 6
    .line 7
    iput-short p2, v0, Lcom/google/android/libraries/places/internal/zzbtx;->zze:S

    .line 8
    .line 9
    iput-byte p3, v0, Lcom/google/android/libraries/places/internal/zzbtx;->zzb:B

    .line 10
    .line 11
    iput p4, v0, Lcom/google/android/libraries/places/internal/zzbtx;->zzc:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zza:Lcom/google/android/libraries/places/internal/zzbtu;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbtu;->zze()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zza:Lcom/google/android/libraries/places/internal/zzbtu;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzb()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method private final zzc(Lcom/google/android/libraries/places/internal/zzbtq;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zza(Lcom/google/android/libraries/places/internal/zzbtq;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 3
    .line 4
    const-wide/16 v3, 0x9

    .line 5
    .line 6
    invoke-interface {v2, v3, v4}, Lcom/google/android/libraries/places/internal/zzbwd;->zzD(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 10
    .line 11
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbub;->zzb(Lcom/google/android/libraries/places/internal/zzbwd;)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const/16 v2, 0x4000

    .line 16
    .line 17
    if-gt v5, v2, :cond_22

    .line 18
    .line 19
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 20
    .line 21
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    and-int/lit16 v3, v3, 0xff

    .line 26
    .line 27
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 28
    .line 29
    invoke-interface {v4}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    and-int/lit16 v4, v4, 0xff

    .line 34
    .line 35
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 36
    .line 37
    invoke-interface {v6}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    int-to-byte v3, v3

    .line 42
    int-to-byte v4, v4

    .line 43
    const v7, 0x7fffffff

    .line 44
    .line 45
    .line 46
    and-int/2addr v6, v7

    .line 47
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbub;->zzg()Ljava/util/logging/Logger;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 52
    .line 53
    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    const/4 v10, 0x1

    .line 58
    if-eqz v8, :cond_0

    .line 59
    .line 60
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbub;->zzg()Ljava/util/logging/Logger;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-static {v10, v6, v5, v3, v4}, Lcom/google/android/libraries/places/internal/zzbty;->zza(ZIIBB)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    const-string v12, "io.grpc.okhttp.internal.framed.Http2$Reader"

    .line 69
    .line 70
    const-string v13, "nextFrame"

    .line 71
    .line 72
    invoke-virtual {v8, v9, v12, v13, v11}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    const/4 v8, 0x4

    .line 76
    const/16 v9, 0x8

    .line 77
    .line 78
    packed-switch v3, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 82
    .line 83
    int-to-long v0, v5

    .line 84
    invoke-interface {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zzF(J)V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_8

    .line 88
    .line 89
    :pswitch_0
    if-ne v5, v8, :cond_2

    .line 90
    .line 91
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 92
    .line 93
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    int-to-long v2, p0

    .line 98
    const-wide/32 v4, 0x7fffffff

    .line 99
    .line 100
    .line 101
    and-long/2addr v2, v4

    .line 102
    const-wide/16 v4, 0x0

    .line 103
    .line 104
    cmp-long p0, v2, v4

    .line 105
    .line 106
    if-eqz p0, :cond_1

    .line 107
    .line 108
    invoke-interface {p1, v6, v2, v3}, Lcom/google/android/libraries/places/internal/zzbtq;->zzg(IJ)V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_8

    .line 112
    .line 113
    :cond_1
    new-array p0, v1, [Ljava/lang/Object;

    .line 114
    .line 115
    const-string v0, "windowSizeIncrement was 0"

    .line 116
    .line 117
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    throw p0

    .line 122
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string v0, "TYPE_WINDOW_UPDATE length !=4: %s"

    .line 131
    .line 132
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    throw p0

    .line 137
    :pswitch_1
    if-lt v5, v9, :cond_6

    .line 138
    .line 139
    if-nez v6, :cond_5

    .line 140
    .line 141
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 142
    .line 143
    add-int/lit8 v5, v5, -0x8

    .line 144
    .line 145
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbtp;->zza(I)Lcom/google/android/libraries/places/internal/zzbtp;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    if-eqz v3, :cond_4

    .line 158
    .line 159
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbwf;->zzb:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 160
    .line 161
    if-lez v5, :cond_3

    .line 162
    .line 163
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 164
    .line 165
    int-to-long v4, v5

    .line 166
    invoke-interface {p0, v4, v5}, Lcom/google/android/libraries/places/internal/zzbwd;->zzy(J)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    :cond_3
    invoke-interface {p1, v2, v3, v1}, Lcom/google/android/libraries/places/internal/zzbtq;->zzb(ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 171
    .line 172
    .line 173
    goto/16 :goto_8

    .line 174
    .line 175
    :cond_4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const-string v0, "TYPE_GOAWAY unexpected error code: %d"

    .line 184
    .line 185
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    throw p0

    .line 190
    :cond_5
    new-array p0, v1, [Ljava/lang/Object;

    .line 191
    .line 192
    const-string v0, "TYPE_GOAWAY streamId != 0"

    .line 193
    .line 194
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    throw p0

    .line 199
    :cond_6
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    const-string v0, "TYPE_GOAWAY length < 8: %s"

    .line 208
    .line 209
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    throw p0

    .line 214
    :pswitch_2
    if-ne v5, v9, :cond_9

    .line 215
    .line 216
    if-nez v6, :cond_8

    .line 217
    .line 218
    and-int/lit8 v2, v4, 0x1

    .line 219
    .line 220
    if-eq v10, v2, :cond_7

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_7
    move v1, v10

    .line 224
    :goto_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 225
    .line 226
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    invoke-interface {p1, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzbtq;->zzc(ZII)V

    .line 235
    .line 236
    .line 237
    goto/16 :goto_8

    .line 238
    .line 239
    :cond_8
    new-array p0, v1, [Ljava/lang/Object;

    .line 240
    .line 241
    const-string v0, "TYPE_PING streamId != 0"

    .line 242
    .line 243
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    throw p0

    .line 248
    :cond_9
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    const-string v0, "TYPE_PING length != 8: %s"

    .line 257
    .line 258
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    throw p0

    .line 263
    :pswitch_3
    if-eqz v6, :cond_b

    .line 264
    .line 265
    and-int/lit8 v2, v4, 0x8

    .line 266
    .line 267
    if-eqz v2, :cond_a

    .line 268
    .line 269
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 270
    .line 271
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    and-int/lit16 v1, v1, 0xff

    .line 276
    .line 277
    :cond_a
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 278
    .line 279
    invoke-interface {v2}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    and-int/2addr v2, v7

    .line 284
    add-int/lit8 v5, v5, -0x4

    .line 285
    .line 286
    int-to-short v1, v1

    .line 287
    invoke-static {v5, v4, v1}, Lcom/google/android/libraries/places/internal/zzbub;->zza(IBS)I

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    invoke-direct {p0, v3, v1, v4, v6}, Lcom/google/android/libraries/places/internal/zzbtz;->zzb(ISBI)Ljava/util/List;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-interface {p1, v6, v2, p0}, Lcom/google/android/libraries/places/internal/zzbtq;->zzd(IILjava/util/List;)V

    .line 296
    .line 297
    .line 298
    goto/16 :goto_8

    .line 299
    .line 300
    :cond_b
    new-array p0, v1, [Ljava/lang/Object;

    .line 301
    .line 302
    const-string v0, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    .line 303
    .line 304
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    throw p0

    .line 309
    :pswitch_4
    if-nez v6, :cond_14

    .line 310
    .line 311
    and-int/lit8 v3, v4, 0x1

    .line 312
    .line 313
    if-eqz v3, :cond_d

    .line 314
    .line 315
    if-nez v5, :cond_c

    .line 316
    .line 317
    goto/16 :goto_8

    .line 318
    .line 319
    :cond_c
    new-array p0, v1, [Ljava/lang/Object;

    .line 320
    .line 321
    const-string v0, "FRAME_SIZE_ERROR ack frame should be empty!"

    .line 322
    .line 323
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    throw p0

    .line 328
    :cond_d
    rem-int/lit8 v3, v5, 0x6

    .line 329
    .line 330
    if-nez v3, :cond_13

    .line 331
    .line 332
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbue;

    .line 333
    .line 334
    invoke-direct {v3}, Lcom/google/android/libraries/places/internal/zzbue;-><init>()V

    .line 335
    .line 336
    .line 337
    move v4, v1

    .line 338
    :goto_1
    if-ge v4, v5, :cond_12

    .line 339
    .line 340
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 341
    .line 342
    move-object v7, v6

    .line 343
    check-cast v7, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 344
    .line 345
    const-wide/16 v11, 0x2

    .line 346
    .line 347
    invoke-virtual {v7, v11, v12}, Lcom/google/android/libraries/places/internal/zzbwl;->zzD(J)V

    .line 348
    .line 349
    .line 350
    iget-object v7, v7, Lcom/google/android/libraries/places/internal/zzbwl;->zzb:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 351
    .line 352
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzbwb;->zzC()S

    .line 353
    .line 354
    .line 355
    move-result v7

    .line 356
    invoke-interface {v6}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    packed-switch v7, :pswitch_data_1

    .line 361
    .line 362
    .line 363
    goto :goto_3

    .line 364
    :pswitch_5
    if-lt v6, v2, :cond_e

    .line 365
    .line 366
    const v9, 0xffffff

    .line 367
    .line 368
    .line 369
    if-gt v6, v9, :cond_e

    .line 370
    .line 371
    goto :goto_2

    .line 372
    :cond_e
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    const-string v0, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: %s"

    .line 381
    .line 382
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    throw p0

    .line 387
    :pswitch_6
    if-ltz v6, :cond_f

    .line 388
    .line 389
    const/4 v7, 0x7

    .line 390
    goto :goto_2

    .line 391
    :cond_f
    new-array p0, v1, [Ljava/lang/Object;

    .line 392
    .line 393
    const-string v0, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    .line 394
    .line 395
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    throw p0

    .line 400
    :pswitch_7
    move v7, v8

    .line 401
    goto :goto_2

    .line 402
    :pswitch_8
    if-eqz v6, :cond_11

    .line 403
    .line 404
    if-ne v6, v10, :cond_10

    .line 405
    .line 406
    goto :goto_2

    .line 407
    :cond_10
    new-array p0, v1, [Ljava/lang/Object;

    .line 408
    .line 409
    const-string v0, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    .line 410
    .line 411
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 412
    .line 413
    .line 414
    move-result-object p0

    .line 415
    throw p0

    .line 416
    :cond_11
    :goto_2
    :pswitch_9
    invoke-virtual {v3, v7, v1, v6}, Lcom/google/android/libraries/places/internal/zzbue;->zze(III)Lcom/google/android/libraries/places/internal/zzbue;

    .line 417
    .line 418
    .line 419
    :goto_3
    add-int/lit8 v4, v4, 0x6

    .line 420
    .line 421
    goto :goto_1

    .line 422
    :cond_12
    invoke-interface {p1, v1, v3}, Lcom/google/android/libraries/places/internal/zzbtq;->zzf(ZLcom/google/android/libraries/places/internal/zzbue;)V

    .line 423
    .line 424
    .line 425
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbue;->zzb()I

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-ltz v0, :cond_20

    .line 430
    .line 431
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zza:Lcom/google/android/libraries/places/internal/zzbtu;

    .line 432
    .line 433
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbue;->zzb()I

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzd(I)V

    .line 438
    .line 439
    .line 440
    goto/16 :goto_8

    .line 441
    .line 442
    :cond_13
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    const-string v0, "TYPE_SETTINGS length %% 6 != 0: %s"

    .line 451
    .line 452
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    throw p0

    .line 457
    :cond_14
    new-array p0, v1, [Ljava/lang/Object;

    .line 458
    .line 459
    const-string v0, "TYPE_SETTINGS streamId != 0"

    .line 460
    .line 461
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    throw p0

    .line 466
    :pswitch_a
    if-ne v5, v8, :cond_17

    .line 467
    .line 468
    if-eqz v6, :cond_16

    .line 469
    .line 470
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 471
    .line 472
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 473
    .line 474
    .line 475
    move-result p0

    .line 476
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbtp;->zza(I)Lcom/google/android/libraries/places/internal/zzbtp;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    if-eqz v1, :cond_15

    .line 481
    .line 482
    invoke-interface {p1, v6, v1}, Lcom/google/android/libraries/places/internal/zzbtq;->zze(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 483
    .line 484
    .line 485
    goto/16 :goto_8

    .line 486
    .line 487
    :cond_15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 488
    .line 489
    .line 490
    move-result-object p0

    .line 491
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object p0

    .line 495
    const-string v0, "TYPE_RST_STREAM unexpected error code: %d"

    .line 496
    .line 497
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    throw p0

    .line 502
    :cond_16
    new-array p0, v1, [Ljava/lang/Object;

    .line 503
    .line 504
    const-string v0, "TYPE_RST_STREAM streamId == 0"

    .line 505
    .line 506
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 507
    .line 508
    .line 509
    move-result-object p0

    .line 510
    throw p0

    .line 511
    :cond_17
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    const-string v0, "TYPE_RST_STREAM length: %d != 4"

    .line 520
    .line 521
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 522
    .line 523
    .line 524
    move-result-object p0

    .line 525
    throw p0

    .line 526
    :pswitch_b
    const/4 v2, 0x5

    .line 527
    if-ne v5, v2, :cond_19

    .line 528
    .line 529
    if-eqz v6, :cond_18

    .line 530
    .line 531
    invoke-direct {p0, p1, v6}, Lcom/google/android/libraries/places/internal/zzbtz;->zzc(Lcom/google/android/libraries/places/internal/zzbtq;I)V

    .line 532
    .line 533
    .line 534
    goto/16 :goto_8

    .line 535
    .line 536
    :cond_18
    new-array p0, v1, [Ljava/lang/Object;

    .line 537
    .line 538
    const-string v0, "TYPE_PRIORITY streamId == 0"

    .line 539
    .line 540
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    throw p0

    .line 545
    :cond_19
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    const-string v0, "TYPE_PRIORITY length: %d != 5"

    .line 554
    .line 555
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 556
    .line 557
    .line 558
    move-result-object p0

    .line 559
    throw p0

    .line 560
    :pswitch_c
    if-eqz v6, :cond_1d

    .line 561
    .line 562
    and-int/lit8 v2, v4, 0x8

    .line 563
    .line 564
    and-int/lit8 v3, v4, 0x20

    .line 565
    .line 566
    and-int/lit8 v7, v4, 0x1

    .line 567
    .line 568
    if-eqz v2, :cond_1a

    .line 569
    .line 570
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 571
    .line 572
    invoke-interface {v2}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    and-int/lit16 v2, v2, 0xff

    .line 577
    .line 578
    goto :goto_4

    .line 579
    :cond_1a
    move v2, v1

    .line 580
    :goto_4
    if-eqz v3, :cond_1b

    .line 581
    .line 582
    invoke-direct {p0, p1, v6}, Lcom/google/android/libraries/places/internal/zzbtz;->zzc(Lcom/google/android/libraries/places/internal/zzbtq;I)V

    .line 583
    .line 584
    .line 585
    add-int/lit8 v5, v5, -0x5

    .line 586
    .line 587
    :cond_1b
    int-to-short v2, v2

    .line 588
    if-eq v10, v7, :cond_1c

    .line 589
    .line 590
    goto :goto_5

    .line 591
    :cond_1c
    move v1, v10

    .line 592
    :goto_5
    invoke-static {v5, v4, v2}, Lcom/google/android/libraries/places/internal/zzbub;->zza(IBS)I

    .line 593
    .line 594
    .line 595
    move-result v3

    .line 596
    invoke-direct {p0, v3, v2, v4, v6}, Lcom/google/android/libraries/places/internal/zzbtz;->zzb(ISBI)Ljava/util/List;

    .line 597
    .line 598
    .line 599
    move-result-object v5

    .line 600
    move v2, v6

    .line 601
    const/4 v6, 0x4

    .line 602
    move v3, v2

    .line 603
    move v2, v1

    .line 604
    const/4 v1, 0x0

    .line 605
    const/4 v4, -0x1

    .line 606
    move-object v0, p1

    .line 607
    invoke-interface/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzbtq;->zzh(ZZIILjava/util/List;I)V

    .line 608
    .line 609
    .line 610
    goto :goto_8

    .line 611
    :cond_1d
    new-array p0, v1, [Ljava/lang/Object;

    .line 612
    .line 613
    const-string v0, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    .line 614
    .line 615
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 616
    .line 617
    .line 618
    move-result-object p0

    .line 619
    throw p0

    .line 620
    :pswitch_d
    move v2, v6

    .line 621
    and-int/lit8 v0, v4, 0x1

    .line 622
    .line 623
    and-int/lit8 v3, v4, 0x20

    .line 624
    .line 625
    if-nez v3, :cond_21

    .line 626
    .line 627
    and-int/lit8 v3, v4, 0x8

    .line 628
    .line 629
    if-eqz v3, :cond_1e

    .line 630
    .line 631
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 632
    .line 633
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 634
    .line 635
    .line 636
    move-result v3

    .line 637
    and-int/lit16 v3, v3, 0xff

    .line 638
    .line 639
    move v6, v3

    .line 640
    goto :goto_6

    .line 641
    :cond_1e
    move v6, v1

    .line 642
    :goto_6
    if-eq v10, v0, :cond_1f

    .line 643
    .line 644
    goto :goto_7

    .line 645
    :cond_1f
    move v1, v10

    .line 646
    :goto_7
    int-to-short v0, v6

    .line 647
    invoke-static {v5, v4, v0}, Lcom/google/android/libraries/places/internal/zzbub;->zza(IBS)I

    .line 648
    .line 649
    .line 650
    move-result v4

    .line 651
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 652
    .line 653
    move-object v0, p1

    .line 654
    invoke-interface/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbtq;->zza(ZILcom/google/android/libraries/places/internal/zzbwd;II)V

    .line 655
    .line 656
    .line 657
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtz;->zzb:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 658
    .line 659
    int-to-long v0, v6

    .line 660
    invoke-interface {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zzF(J)V

    .line 661
    .line 662
    .line 663
    :cond_20
    :goto_8
    return v10

    .line 664
    :cond_21
    new-array p0, v1, [Ljava/lang/Object;

    .line 665
    .line 666
    const-string v0, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    .line 667
    .line 668
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 669
    .line 670
    .line 671
    move-result-object p0

    .line 672
    throw p0

    .line 673
    :cond_22
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 674
    .line 675
    .line 676
    move-result-object p0

    .line 677
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 678
    .line 679
    .line 680
    move-result-object p0

    .line 681
    const-string v0, "FRAME_SIZE_ERROR: %s"

    .line 682
    .line 683
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 684
    .line 685
    .line 686
    move-result-object p0

    .line 687
    throw p0

    .line 688
    :catch_0
    return v1

    .line 689
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_9
    .end packed-switch
.end method
