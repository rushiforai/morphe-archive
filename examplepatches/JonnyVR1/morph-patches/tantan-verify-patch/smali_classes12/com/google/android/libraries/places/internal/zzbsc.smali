.class final Lcom/google/android/libraries/places/internal/zzbsc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/util/concurrent/CountDownLatch;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbri;

.field final synthetic zzc:Lcom/google/android/libraries/places/internal/zzbsf;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbsf;Ljava/util/concurrent/CountDownLatch;Lcom/google/android/libraries/places/internal/zzbri;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zza:Ljava/util/concurrent/CountDownLatch;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    const-string v0, "Unsupported SocketAddress implementation "

    .line 2
    .line 3
    const-string v1, "Only "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zza:Ljava/util/concurrent/CountDownLatch;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 16
    .line 17
    .line 18
    :goto_0
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbsb;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Lcom/google/android/libraries/places/internal/zzbsb;-><init>(Lcom/google/android/libraries/places/internal/zzbsc;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbwh;->zzb(Lcom/google/android/libraries/places/internal/zzbws;)Lcom/google/android/libraries/places/internal/zzbwd;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x1

    .line 29
    :try_start_1
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 30
    .line 31
    iget-object v6, v5, Lcom/google/android/libraries/places/internal/zzbsf;->zza:Lcom/google/android/libraries/places/internal/zzbaa;

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    if-nez v6, :cond_0

    .line 35
    .line 36
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzE(Lcom/google/android/libraries/places/internal/zzbsf;)Ljavax/net/SocketFactory;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzz(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/net/InetSocketAddress;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 49
    .line 50
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbsf;->zzz(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/net/InetSocketAddress;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {v6}, Ljava/net/InetSocketAddress;->getPort()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    invoke-virtual {v0, v5, v6}, Ljavax/net/SocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzbaa;->zze()Ljava/net/SocketAddress;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    instance-of v8, v8, Ljava/net/InetSocketAddress;

    .line 68
    .line 69
    if-eqz v8, :cond_7

    .line 70
    .line 71
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzbaa;->zzd()Ljava/net/InetSocketAddress;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzbaa;->zze()Ljava/net/SocketAddress;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    iget-object v8, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 80
    .line 81
    iget-object v8, v8, Lcom/google/android/libraries/places/internal/zzbsf;->zza:Lcom/google/android/libraries/places/internal/zzbaa;

    .line 82
    .line 83
    invoke-virtual {v8}, Lcom/google/android/libraries/places/internal/zzbaa;->zzc()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    iget-object v9, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 88
    .line 89
    iget-object v9, v9, Lcom/google/android/libraries/places/internal/zzbsf;->zza:Lcom/google/android/libraries/places/internal/zzbaa;

    .line 90
    .line 91
    invoke-virtual {v9}, Lcom/google/android/libraries/places/internal/zzbaa;->zzb()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    check-cast v6, Ljava/net/InetSocketAddress;

    .line 96
    .line 97
    invoke-static {v5, v0, v6, v8, v9}, Lcom/google/android/libraries/places/internal/zzbsf;->zzA(Lcom/google/android/libraries/places/internal/zzbsf;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Ljava/lang/String;Ljava/lang/String;)Ljava/net/Socket;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    :goto_1
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 102
    .line 103
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzF(Lcom/google/android/libraries/places/internal/zzbsf;)Ljavax/net/ssl/SSLSocketFactory;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    if-eqz v6, :cond_4

    .line 108
    .line 109
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzF(Lcom/google/android/libraries/places/internal/zzbsf;)Ljavax/net/ssl/SSLSocketFactory;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzy()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    iget-object v8, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 118
    .line 119
    invoke-virtual {v8}, Lcom/google/android/libraries/places/internal/zzbsf;->zzi()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    iget-object v9, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 124
    .line 125
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzbsf;->zzu(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbsz;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    const-string v10, "sslSocketFactory"

    .line 130
    .line 131
    invoke-static {v6, v10}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    const-string v10, "socket"

    .line 135
    .line 136
    invoke-static {v0, v10}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    const-string v10, "spec"

    .line 140
    .line 141
    invoke-static {v9, v10}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6, v0, v5, v8, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 149
    .line 150
    invoke-virtual {v9, v0, v3}, Lcom/google/android/libraries/places/internal/zzbsz;->zza(Ljavax/net/ssl/SSLSocket;Z)V

    .line 151
    .line 152
    .line 153
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsk;->zzd()Lcom/google/android/libraries/places/internal/zzbsk;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    invoke-virtual {v9}, Lcom/google/android/libraries/places/internal/zzbsz;->zzb()Z

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    if-eqz v8, :cond_1

    .line 162
    .line 163
    sget-object v7, Lcom/google/android/libraries/places/internal/zzbsm;->zza:Ljava/util/List;

    .line 164
    .line 165
    :cond_1
    invoke-virtual {v6, v0, v5, v7}, Lcom/google/android/libraries/places/internal/zzbsk;->zzb(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v6

    .line 169
    sget-object v7, Lcom/google/android/libraries/places/internal/zzbsm;->zza:Ljava/util/List;

    .line 170
    .line 171
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbtm;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbtm;

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v8

    .line 179
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v7

    .line 183
    new-instance v9, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v9, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v1, " are supported, but negotiated protocol is %s"

    .line 192
    .line 193
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-static {v8, v1, v6}, Lcom/google/android/libraries/places/internal/zzmt;->zzr(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbte;->zza:Lcom/google/android/libraries/places/internal/zzbte;

    .line 204
    .line 205
    const-string v6, "["

    .line 206
    .line 207
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v6

    .line 211
    if-eqz v6, :cond_2

    .line 212
    .line 213
    const-string v6, "]"

    .line 214
    .line 215
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result v6

    .line 219
    if-eqz v6, :cond_2

    .line 220
    .line 221
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 222
    .line 223
    .line 224
    move-result v6

    .line 225
    add-int/lit8 v6, v6, -0x1

    .line 226
    .line 227
    invoke-virtual {v5, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v6

    .line 231
    goto :goto_2

    .line 232
    :cond_2
    move-object v6, v5

    .line 233
    :goto_2
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 234
    .line 235
    .line 236
    move-result-object v7

    .line 237
    invoke-interface {v1, v6, v7}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_3

    .line 242
    .line 243
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 244
    .line 245
    .line 246
    move-result-object v7

    .line 247
    goto :goto_3

    .line 248
    :cond_3
    new-instance v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 249
    .line 250
    const-string v1, "Cannot verify hostname: "

    .line 251
    .line 252
    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    throw v0

    .line 260
    :cond_4
    :goto_3
    invoke-virtual {v0, v4}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 261
    .line 262
    .line 263
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwh;->zzd(Ljava/net/Socket;)Lcom/google/android/libraries/places/internal/zzbws;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbwh;->zzb(Lcom/google/android/libraries/places/internal/zzbws;)Lcom/google/android/libraries/places/internal/zzbwd;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwh;->zzc(Ljava/net/Socket;)Lcom/google/android/libraries/places/internal/zzbwq;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-virtual {v1, v5, v0}, Lcom/google/android/libraries/places/internal/zzbri;->zzm(Lcom/google/android/libraries/places/internal/zzbwq;Ljava/net/Socket;)V

    .line 278
    .line 279
    .line 280
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 281
    .line 282
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzk(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzaye;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaye;->zzb()Lcom/google/android/libraries/places/internal/zzayb;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    sget-object v6, Lcom/google/android/libraries/places/internal/zzazw;->zza:Lcom/google/android/libraries/places/internal/zzayc;

    .line 291
    .line 292
    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    .line 293
    .line 294
    .line 295
    move-result-object v8

    .line 296
    invoke-virtual {v5, v6, v8}, Lcom/google/android/libraries/places/internal/zzayb;->zzb(Lcom/google/android/libraries/places/internal/zzayc;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayb;

    .line 297
    .line 298
    .line 299
    sget-object v6, Lcom/google/android/libraries/places/internal/zzazw;->zzb:Lcom/google/android/libraries/places/internal/zzayc;

    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    .line 302
    .line 303
    .line 304
    move-result-object v8

    .line 305
    invoke-virtual {v5, v6, v8}, Lcom/google/android/libraries/places/internal/zzayb;->zzb(Lcom/google/android/libraries/places/internal/zzayc;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayb;

    .line 306
    .line 307
    .line 308
    sget-object v6, Lcom/google/android/libraries/places/internal/zzazw;->zzc:Lcom/google/android/libraries/places/internal/zzayc;

    .line 309
    .line 310
    invoke-virtual {v5, v6, v7}, Lcom/google/android/libraries/places/internal/zzayb;->zzb(Lcom/google/android/libraries/places/internal/zzayc;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayb;

    .line 311
    .line 312
    .line 313
    sget-object v6, Lcom/google/android/libraries/places/internal/zzbit;->zza:Lcom/google/android/libraries/places/internal/zzayc;

    .line 314
    .line 315
    if-nez v7, :cond_5

    .line 316
    .line 317
    sget-object v8, Lcom/google/android/libraries/places/internal/zzbdf;->zza:Lcom/google/android/libraries/places/internal/zzbdf;

    .line 318
    .line 319
    goto :goto_4

    .line 320
    :catchall_0
    move-exception v0

    .line 321
    goto/16 :goto_a

    .line 322
    .line 323
    :catch_1
    move-exception v0

    .line 324
    goto :goto_7

    .line 325
    :catch_2
    move-exception v0

    .line 326
    goto :goto_8

    .line 327
    :cond_5
    sget-object v8, Lcom/google/android/libraries/places/internal/zzbdf;->zzc:Lcom/google/android/libraries/places/internal/zzbdf;

    .line 328
    .line 329
    :goto_4
    invoke-virtual {v5, v6, v8}, Lcom/google/android/libraries/places/internal/zzayb;->zzb(Lcom/google/android/libraries/places/internal/zzayc;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayb;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzayb;->zzc()Lcom/google/android/libraries/places/internal/zzaye;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    invoke-static {v1, v5}, Lcom/google/android/libraries/places/internal/zzbsf;->zzG(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzaye;)V
    :try_end_1
    .catch Lcom/google/android/libraries/places/internal/zzbdp; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 337
    .line 338
    .line 339
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 340
    .line 341
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbse;

    .line 342
    .line 343
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzv(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbuf;

    .line 344
    .line 345
    .line 346
    move-result-object v5

    .line 347
    invoke-interface {v5, v2, v4}, Lcom/google/android/libraries/places/internal/zzbuf;->zzc(Lcom/google/android/libraries/places/internal/zzbwd;Z)Lcom/google/android/libraries/places/internal/zzbtr;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-direct {v3, v1, v2}, Lcom/google/android/libraries/places/internal/zzbse;-><init>(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtr;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v1, v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzH(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbse;)V

    .line 355
    .line 356
    .line 357
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 358
    .line 359
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    monitor-enter v1

    .line 364
    :try_start_2
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 365
    .line 366
    const-string v3, "socket"

    .line 367
    .line 368
    invoke-static {v0, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    invoke-static {v2, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzM(Lcom/google/android/libraries/places/internal/zzbsf;Ljava/net/Socket;)V

    .line 372
    .line 373
    .line 374
    if-eqz v7, :cond_6

    .line 375
    .line 376
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 377
    .line 378
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbaf;

    .line 379
    .line 380
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbag;

    .line 381
    .line 382
    invoke-direct {v2, v7}, Lcom/google/android/libraries/places/internal/zzbag;-><init>(Ljavax/net/ssl/SSLSession;)V

    .line 383
    .line 384
    .line 385
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzbaf;-><init>(Lcom/google/android/libraries/places/internal/zzbag;)V

    .line 386
    .line 387
    .line 388
    invoke-static {p0, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzL(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbaf;)V

    .line 389
    .line 390
    .line 391
    goto :goto_5

    .line 392
    :catchall_1
    move-exception p0

    .line 393
    goto :goto_6

    .line 394
    :cond_6
    :goto_5
    monitor-exit v1

    .line 395
    return-void

    .line 396
    :goto_6
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 397
    throw p0

    .line 398
    :cond_7
    :try_start_3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 399
    .line 400
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 401
    .line 402
    iget-object v5, v5, Lcom/google/android/libraries/places/internal/zzbsf;->zza:Lcom/google/android/libraries/places/internal/zzbaa;

    .line 403
    .line 404
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbaa;->zze()Ljava/net/SocketAddress;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 409
    .line 410
    .line 411
    move-result-object v5

    .line 412
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v5

    .line 416
    invoke-virtual {v0, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbdp;

    .line 425
    .line 426
    invoke-direct {v1, v0, v7}, Lcom/google/android/libraries/places/internal/zzbdp;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 427
    .line 428
    .line 429
    throw v1
    :try_end_3
    .catch Lcom/google/android/libraries/places/internal/zzbdp; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 430
    :goto_7
    :try_start_4
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 431
    .line 432
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzb(Ljava/lang/Throwable;)V

    .line 433
    .line 434
    .line 435
    goto :goto_9

    .line 436
    :goto_8
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 437
    .line 438
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbtp;->zzg:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 439
    .line 440
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdp;->zza()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-static {v1, v3, v5, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzO(Lcom/google/android/libraries/places/internal/zzbsf;ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbdo;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 445
    .line 446
    .line 447
    :goto_9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 448
    .line 449
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbse;

    .line 450
    .line 451
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzv(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbuf;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    invoke-interface {v1, v2, v4}, Lcom/google/android/libraries/places/internal/zzbuf;->zzc(Lcom/google/android/libraries/places/internal/zzbwd;Z)Lcom/google/android/libraries/places/internal/zzbtr;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    invoke-direct {v0, p0, v1}, Lcom/google/android/libraries/places/internal/zzbse;-><init>(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtr;)V

    .line 460
    .line 461
    .line 462
    invoke-static {p0, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzH(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbse;)V

    .line 463
    .line 464
    .line 465
    return-void

    .line 466
    :goto_a
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsc;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 467
    .line 468
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbse;

    .line 469
    .line 470
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzv(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbuf;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    invoke-interface {v3, v2, v4}, Lcom/google/android/libraries/places/internal/zzbuf;->zzc(Lcom/google/android/libraries/places/internal/zzbwd;Z)Lcom/google/android/libraries/places/internal/zzbtr;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/places/internal/zzbse;-><init>(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtr;)V

    .line 479
    .line 480
    .line 481
    invoke-static {p0, v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzH(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbse;)V

    .line 482
    .line 483
    .line 484
    throw v0
.end method
