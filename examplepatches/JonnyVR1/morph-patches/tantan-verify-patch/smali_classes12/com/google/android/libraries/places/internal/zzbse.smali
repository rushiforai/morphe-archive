.class final Lcom/google/android/libraries/places/internal/zzbse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/google/android/libraries/places/internal/zzbtq;


# instance fields
.field final zza:Lcom/google/android/libraries/places/internal/zzbtr;

.field zzb:Z

.field final synthetic zzc:Lcom/google/android/libraries/places/internal/zzbsf;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzbsi;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtr;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbsi;

    .line 7
    .line 8
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 9
    .line 10
    const-class v1, Lcom/google/android/libraries/places/internal/zzbsf;

    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbsi;-><init>(Ljava/util/logging/Level;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzb:Z

    .line 19
    .line 20
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zza:Lcom/google/android/libraries/places/internal/zzbtr;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "OkHttpClientTransport"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 19
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zza:Lcom/google/android/libraries/places/internal/zzbtr;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Lcom/google/android/libraries/places/internal/zzbtr;->zza(Lcom/google/android/libraries/places/internal/zzbtq;)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :try_start_1
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzo(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbkh;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzo(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbkh;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbkh;->zza()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    :try_start_2
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzl(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    :try_start_3
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzp:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 60
    .line 61
    const-string v3, "End of stream or IOException"

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    :cond_2
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 68
    .line 69
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbtp;->zzg:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 70
    .line 71
    invoke-static {v3, v2, v4, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzO(Lcom/google/android/libraries/places/internal/zzbsf;ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbdo;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :catchall_1
    move-exception v0

    .line 76
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 77
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 78
    :goto_1
    :try_start_6
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 79
    .line 80
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbtp;->zzb:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 81
    .line 82
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 83
    .line 84
    const-string v6, "error in frame handler"

    .line 85
    .line 86
    invoke-virtual {v5, v6}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v5, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v3, v2, v4, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzO(Lcom/google/android/libraries/places/internal/zzbsf;ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbdo;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 95
    .line 96
    .line 97
    :goto_2
    :try_start_7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zza:Lcom/google/android/libraries/places/internal/zzbtr;

    .line 98
    .line 99
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0

    .line 100
    .line 101
    .line 102
    goto :goto_5

    .line 103
    :catch_0
    move-exception v0

    .line 104
    goto :goto_3

    .line 105
    :catch_1
    move-exception v0

    .line 106
    move-object v7, v0

    .line 107
    goto :goto_4

    .line 108
    :goto_3
    const-string v2, "bio == null"

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    goto :goto_5

    .line 121
    :cond_3
    throw v0

    .line 122
    :goto_4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsf;->zzD()Ljava/util/logging/Logger;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    sget-object v3, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 127
    .line 128
    const-string v4, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler"

    .line 129
    .line 130
    const-string v5, "run"

    .line 131
    .line 132
    const-string v6, "Exception closing frame reader"

    .line 133
    .line 134
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 135
    .line 136
    .line 137
    :goto_5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 138
    .line 139
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzp(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbmk;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbmk;->zze()V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :catchall_2
    move-exception v0

    .line 155
    move-object v2, v0

    .line 156
    :try_start_8
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zza:Lcom/google/android/libraries/places/internal/zzbtr;

    .line 157
    .line 158
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_2

    .line 159
    .line 160
    .line 161
    goto :goto_8

    .line 162
    :catch_2
    move-exception v0

    .line 163
    goto :goto_6

    .line 164
    :catch_3
    move-exception v0

    .line 165
    move-object v8, v0

    .line 166
    goto :goto_7

    .line 167
    :goto_6
    const-string v3, "bio == null"

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-nez v3, :cond_4

    .line 178
    .line 179
    throw v0

    .line 180
    :goto_7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsf;->zzD()Ljava/util/logging/Logger;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    sget-object v4, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 185
    .line 186
    const-string v5, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler"

    .line 187
    .line 188
    const-string v6, "run"

    .line 189
    .line 190
    const-string v7, "Exception closing frame reader"

    .line 191
    .line 192
    invoke-virtual/range {v3 .. v8}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :cond_4
    :goto_8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 196
    .line 197
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzp(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbmk;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbmk;->zze()V

    .line 202
    .line 203
    .line 204
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-virtual {p0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    throw v2
.end method

.method public final zza(ZILcom/google/android/libraries/places/internal/zzbwd;II)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v0, p3

    .line 2
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 3
    .line 4
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbwl;->zzb:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    move v6, p1

    .line 10
    move v3, p2

    .line 11
    move v5, p4

    .line 12
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbsi;->zza(IILcom/google/android/libraries/places/internal/zzbwb;IZ)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 16
    .line 17
    invoke-virtual {p1, v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzr(I)Lcom/google/android/libraries/places/internal/zzbry;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 24
    .line 25
    invoke-virtual {p1, v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzU(I)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    monitor-enter p1

    .line 38
    :try_start_0
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 39
    .line 40
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget-object p4, Lcom/google/android/libraries/places/internal/zzbtp;->zzi:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 45
    .line 46
    invoke-virtual {p2, v3, p4}, Lcom/google/android/libraries/places/internal/zzbrk;->zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 47
    .line 48
    .line 49
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    int-to-long p1, v5

    .line 51
    invoke-interface {p3, p1, p2}, Lcom/google/android/libraries/places/internal/zzbwd;->zzF(J)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    move-object p0, v0

    .line 57
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p0

    .line 59
    :cond_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbtp;->zzb:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string p3, "Received data for unknown stream: "

    .line 64
    .line 65
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p2, p0, p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzN(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtp;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    int-to-long v0, v5

    .line 80
    invoke-interface {p3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zzD(J)V

    .line 81
    .line 82
    .line 83
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 84
    .line 85
    invoke-direct {p2}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 86
    .line 87
    .line 88
    check-cast p3, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 89
    .line 90
    iget-object p3, p3, Lcom/google/android/libraries/places/internal/zzbwl;->zzb:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 91
    .line 92
    invoke-virtual {p2, p3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzn(Lcom/google/android/libraries/places/internal/zzbwb;J)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbrx;->zzI()Lcom/google/android/libraries/places/internal/zzbvs;

    .line 100
    .line 101
    .line 102
    sget p3, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 103
    .line 104
    iget-object p3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 105
    .line 106
    invoke-static {p3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    monitor-enter p3

    .line 111
    :try_start_2
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sub-int p4, p5, v5

    .line 116
    .line 117
    invoke-virtual {p1, p2, v6, p4}, Lcom/google/android/libraries/places/internal/zzbrx;->zzO(Lcom/google/android/libraries/places/internal/zzbwb;ZI)V

    .line 118
    .line 119
    .line 120
    monitor-exit p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 121
    :goto_0
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 122
    .line 123
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzf(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    add-int/2addr p2, p5

    .line 128
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzI(Lcom/google/android/libraries/places/internal/zzbsf;I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzf(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    int-to-float p2, p2

    .line 138
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzg(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 139
    .line 140
    .line 141
    move-result p3

    .line 142
    int-to-float p3, p3

    .line 143
    const/high16 p4, 0x3f000000    # 0.5f

    .line 144
    .line 145
    mul-float/2addr p3, p4

    .line 146
    cmpl-float p2, p2, p3

    .line 147
    .line 148
    if-ltz p2, :cond_2

    .line 149
    .line 150
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    monitor-enter p1

    .line 155
    :try_start_3
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 156
    .line 157
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzf(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    int-to-long p4, p2

    .line 166
    const/4 p2, 0x0

    .line 167
    invoke-virtual {p3, p2, p4, p5}, Lcom/google/android/libraries/places/internal/zzbrk;->zzk(IJ)V

    .line 168
    .line 169
    .line 170
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 171
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 172
    .line 173
    invoke-static {p0, p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzI(Lcom/google/android/libraries/places/internal/zzbsf;I)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :catchall_1
    move-exception v0

    .line 178
    move-object p0, v0

    .line 179
    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 180
    throw p0

    .line 181
    :cond_2
    return-void

    .line 182
    :catchall_2
    move-exception v0

    .line 183
    move-object p0, v0

    .line 184
    :try_start_5
    monitor-exit p3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 185
    throw p0
.end method

.method public final zzb(ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbwf;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbsi;->zzb(IILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtp;->zzo:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 8
    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbwf;->zzf()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsf;->zzD()Ljava/util/logging/Logger;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 20
    .line 21
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v4, "%s: Received GOAWAY with ENHANCE_YOUR_CALM. Debug data: %s"

    .line 26
    .line 27
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler"

    .line 32
    .line 33
    const-string v5, "goAway"

    .line 34
    .line 35
    invoke-virtual {v1, v2, v4, v5, v3}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "too_many_pings"

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzx(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Runnable;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbrs;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbrs;->zza:Lcom/google/android/libraries/places/internal/zzben;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzben;->zza()V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget p2, p2, Lcom/google/android/libraries/places/internal/zzbtp;->zzs:I

    .line 60
    .line 61
    int-to-long v0, p2

    .line 62
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbjb;->zza(J)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    const-string v0, "Received Goaway"

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-lez v0, :cond_1

    .line 77
    .line 78
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbwf;->zzf()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p2, p3}, Lcom/google/android/libraries/places/internal/zzbdo;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    :cond_1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 87
    .line 88
    const/4 p3, 0x0

    .line 89
    invoke-static {p0, p1, p3, p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzO(Lcom/google/android/libraries/places/internal/zzbsf;ILcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final zzc(ZII)V
    .locals 9

    .line 1
    int-to-long v0, p2

    .line 2
    int-to-long v2, p3

    .line 3
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 4
    .line 5
    const/16 v5, 0x20

    .line 6
    .line 7
    shl-long/2addr v0, v5

    .line 8
    const-wide v5, 0xffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    and-long/2addr v2, v5

    .line 14
    or-long/2addr v0, v2

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v4, v2, v0, v1}, Lcom/google/android/libraries/places/internal/zzbsi;->zzd(IJ)V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    monitor-enter p1

    .line 28
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v2, p2, p3}, Lcom/google/android/libraries/places/internal/zzbrk;->zzb(ZII)V

    .line 35
    .line 36
    .line 37
    monitor-exit p1

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0

    .line 42
    :cond_0
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    monitor-enter p1

    .line 47
    :try_start_1
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 48
    .line 49
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzn(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbjh;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    const/4 v2, 0x0

    .line 54
    if-eqz p3, :cond_2

    .line 55
    .line 56
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzn(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbjh;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbjh;->zza()J

    .line 61
    .line 62
    .line 63
    move-result-wide p2

    .line 64
    cmp-long p2, p2, v0

    .line 65
    .line 66
    if-nez p2, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 69
    .line 70
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzn(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbjh;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p0, v2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzK(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbjh;)V

    .line 75
    .line 76
    .line 77
    move-object v2, p2

    .line 78
    goto :goto_0

    .line 79
    :catchall_1
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsf;->zzD()Ljava/util/logging/Logger;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    sget-object p3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 86
    .line 87
    const-string v3, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler"

    .line 88
    .line 89
    const-string v4, "ping"

    .line 90
    .line 91
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 92
    .line 93
    const-string v6, "Received unexpected ping ack. Expecting %d, got %d"

    .line 94
    .line 95
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 96
    .line 97
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzn(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbjh;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbjh;->zza()J

    .line 102
    .line 103
    .line 104
    move-result-wide v7

    .line 105
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {v5, v6, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p2, p3, v3, v4, p0}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbsf;->zzD()Ljava/util/logging/Logger;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    sget-object p2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 130
    .line 131
    const-string p3, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler"

    .line 132
    .line 133
    const-string v0, "ping"

    .line 134
    .line 135
    const-string v1, "Received unexpected ping ack. No ping outstanding"

    .line 136
    .line 137
    invoke-virtual {p0, p2, p3, v0, v1}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :goto_0
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 141
    if-eqz v2, :cond_3

    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbjh;->zzc()Z

    .line 144
    .line 145
    .line 146
    :cond_3
    return-void

    .line 147
    :goto_1
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 148
    throw p0
.end method

.method public final zzd(IILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbsi;->zzf(IIILjava/util/List;)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    monitor-enter p2

    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object p3, Lcom/google/android/libraries/places/internal/zzbtp;->zzb:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p3}, Lcom/google/android/libraries/places/internal/zzbrk;->zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 23
    .line 24
    .line 25
    monitor-exit p2

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public final zze(ILcom/google/android/libraries/places/internal/zzbtp;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/libraries/places/internal/zzbsi;->zzg(IILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzm(Lcom/google/android/libraries/places/internal/zzbtp;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v2, "Rst Stream"

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbdj;->zzb:Lcom/google/android/libraries/places/internal/zzbdj;

    .line 22
    .line 23
    if-eq v0, v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbdj;->zze:Lcom/google/android/libraries/places/internal/zzbdj;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    :cond_0
    :goto_0
    move v7, v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 v1, 0x0

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    monitor-enter v1

    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzB(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbry;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbrx;->zzI()Lcom/google/android/libraries/places/internal/zzbvs;

    .line 67
    .line 68
    .line 69
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 70
    .line 71
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 72
    .line 73
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbtp;->zzk:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 74
    .line 75
    if-ne p2, p0, :cond_2

    .line 76
    .line 77
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbfs;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 78
    .line 79
    :goto_2
    move-object v6, p0

    .line 80
    goto :goto_3

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    move-object p0, v0

    .line 83
    goto :goto_4

    .line 84
    :cond_2
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbfs;->zza:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :goto_3
    const/4 v8, 0x0

    .line 88
    const/4 v9, 0x0

    .line 89
    move v4, p1

    .line 90
    invoke-virtual/range {v3 .. v9}, Lcom/google/android/libraries/places/internal/zzbsf;->zzP(ILcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;ZLcom/google/android/libraries/places/internal/zzbtp;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    monitor-exit v1

    .line 94
    return-void

    .line 95
    :goto_4
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    throw p0
.end method

.method public final zzf(ZLcom/google/android/libraries/places/internal/zzbue;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0, p2}, Lcom/google/android/libraries/places/internal/zzbsi;->zzh(ILcom/google/android/libraries/places/internal/zzbue;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    monitor-enter p1

    .line 14
    const/4 v0, 0x4

    .line 15
    :try_start_0
    invoke-virtual {p2, v0}, Lcom/google/android/libraries/places/internal/zzbue;->zzf(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Lcom/google/android/libraries/places/internal/zzbue;->zza(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzJ(Lcom/google/android/libraries/places/internal/zzbsf;I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :goto_0
    const/4 v0, 0x7

    .line 34
    invoke-virtual {p2, v0}, Lcom/google/android/libraries/places/internal/zzbue;->zzf(I)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Lcom/google/android/libraries/places/internal/zzbue;->zza(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzt(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbsu;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbsu;->zzh(I)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v0, v2

    .line 57
    :goto_1
    iget-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzb:Z

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzp(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbmk;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzk(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzaye;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-interface {v3, v4}, Lcom/google/android/libraries/places/internal/zzbmk;->zza(Lcom/google/android/libraries/places/internal/zzaye;)Lcom/google/android/libraries/places/internal/zzaye;

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v4}, Lcom/google/android/libraries/places/internal/zzbsf;->zzG(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzaye;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 78
    .line 79
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzp(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbmk;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbmk;->zzc()V

    .line 84
    .line 85
    .line 86
    iput-boolean v2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzb:Z

    .line 87
    .line 88
    :cond_2
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 89
    .line 90
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1, p2}, Lcom/google/android/libraries/places/internal/zzbrk;->zza(Lcom/google/android/libraries/places/internal/zzbue;)V

    .line 95
    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 100
    .line 101
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzt(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbsu;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbsu;->zzg()V

    .line 106
    .line 107
    .line 108
    :cond_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 109
    .line 110
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzS(Lcom/google/android/libraries/places/internal/zzbsf;)Z

    .line 111
    .line 112
    .line 113
    monitor-exit p1

    .line 114
    return-void

    .line 115
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    throw p0
.end method

.method public final zzg(IJ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbsi;->zzj(IIJ)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    monitor-enter v0

    .line 14
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    :try_start_0
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzt(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbsu;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    long-to-int p2, p2

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbsu;->zza(Lcom/google/android/libraries/places/internal/zzbsq;I)I

    .line 25
    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzB(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    :try_start_1
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzt(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbsu;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbrx;->zzH()Lcom/google/android/libraries/places/internal/zzbsq;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    long-to-int p2, p2

    .line 63
    invoke-virtual {v1, v2, p2}, Lcom/google/android/libraries/places/internal/zzbsu;->zza(Lcom/google/android/libraries/places/internal/zzbsq;I)I

    .line 64
    .line 65
    .line 66
    :cond_1
    move v1, v4

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {v3, p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzU(I)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_1

    .line 73
    .line 74
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 78
    .line 79
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbtp;->zzb:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 80
    .line 81
    new-instance p3, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v0, "Received window_update for unknown stream: "

    .line 84
    .line 85
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p0, p2, p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzN(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtp;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    return-void

    .line 99
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    throw p0
.end method

.method public final zzh(ZZIILjava/util/List;I)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzd:Lcom/google/android/libraries/places/internal/zzbsi;

    .line 2
    .line 3
    const/4 p4, 0x1

    .line 4
    invoke-virtual {p1, p4, p3, p5, p2}, Lcom/google/android/libraries/places/internal/zzbsi;->zzc(IILjava/util/List;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzh(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const p6, 0x7fffffff

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eq p1, p6, :cond_2

    .line 19
    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    move p1, v1

    .line 23
    :goto_0
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result p6

    .line 27
    if-ge p1, p6, :cond_0

    .line 28
    .line 29
    invoke-interface {p5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p6

    .line 33
    check-cast p6, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 34
    .line 35
    iget-object v4, p6, Lcom/google/android/libraries/places/internal/zzbtt;->zzh:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 36
    .line 37
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    add-int/lit8 v4, v4, 0x20

    .line 42
    .line 43
    iget-object p6, p6, Lcom/google/android/libraries/places/internal/zzbtt;->zzi:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 44
    .line 45
    invoke-virtual {p6}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 46
    .line 47
    .line 48
    move-result p6

    .line 49
    add-int/2addr v4, p6

    .line 50
    int-to-long v4, v4

    .line 51
    add-long/2addr v2, v4

    .line 52
    add-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-wide/32 v4, 0x7fffffff

    .line 56
    .line 57
    .line 58
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    long-to-int p1, v2

    .line 63
    iget-object p6, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 64
    .line 65
    invoke-static {p6}, Lcom/google/android/libraries/places/internal/zzbsf;->zzh(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 66
    .line 67
    .line 68
    move-result p6

    .line 69
    if-le p1, p6, :cond_2

    .line 70
    .line 71
    sget-object p6, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 72
    .line 73
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 74
    .line 75
    if-eq p4, p2, :cond_1

    .line 76
    .line 77
    const-string v2, "header"

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const-string v2, "trailer"

    .line 81
    .line 82
    :goto_1
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 83
    .line 84
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzh(Lcom/google/android/libraries/places/internal/zzbsf;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    filled-new-array {v2, v3, p1}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string v2, "Response %s metadata larger than %d: %d"

    .line 101
    .line 102
    invoke-static {v0, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p6, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :cond_2
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 111
    .line 112
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbsf;->zzw(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    monitor-enter p1

    .line 117
    :try_start_0
    iget-object p6, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 118
    .line 119
    invoke-static {p6}, Lcom/google/android/libraries/places/internal/zzbsf;->zzB(Lcom/google/android/libraries/places/internal/zzbsf;)Ljava/util/Map;

    .line 120
    .line 121
    .line 122
    move-result-object p6

    .line 123
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-interface {p6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p6

    .line 131
    check-cast p6, Lcom/google/android/libraries/places/internal/zzbry;

    .line 132
    .line 133
    if-nez p6, :cond_3

    .line 134
    .line 135
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 136
    .line 137
    invoke-virtual {p2, p3}, Lcom/google/android/libraries/places/internal/zzbsf;->zzU(I)Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_6

    .line 142
    .line 143
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 144
    .line 145
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    sget-object p4, Lcom/google/android/libraries/places/internal/zzbtp;->zzi:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 150
    .line 151
    invoke-virtual {p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbrk;->zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 152
    .line 153
    .line 154
    :goto_2
    move p4, v1

    .line 155
    goto :goto_3

    .line 156
    :catchall_0
    move-exception p0

    .line 157
    goto :goto_4

    .line 158
    :cond_3
    if-nez v0, :cond_4

    .line 159
    .line 160
    invoke-virtual {p6}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 161
    .line 162
    .line 163
    move-result-object p4

    .line 164
    invoke-virtual {p4}, Lcom/google/android/libraries/places/internal/zzbrx;->zzI()Lcom/google/android/libraries/places/internal/zzbvs;

    .line 165
    .line 166
    .line 167
    sget p4, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 168
    .line 169
    invoke-virtual {p6}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 170
    .line 171
    .line 172
    move-result-object p4

    .line 173
    invoke-virtual {p4, p5, p2}, Lcom/google/android/libraries/places/internal/zzbrx;->zzP(Ljava/util/List;Z)V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_4
    if-nez p2, :cond_5

    .line 178
    .line 179
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 180
    .line 181
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzq(Lcom/google/android/libraries/places/internal/zzbsf;)Lcom/google/android/libraries/places/internal/zzbrk;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    sget-object p4, Lcom/google/android/libraries/places/internal/zzbtp;->zzl:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 186
    .line 187
    invoke-virtual {p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbrk;->zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 188
    .line 189
    .line 190
    :cond_5
    invoke-virtual {p6}, Lcom/google/android/libraries/places/internal/zzbry;->zzD()Lcom/google/android/libraries/places/internal/zzbrx;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    new-instance p4, Lcom/google/android/libraries/places/internal/zzbcf;

    .line 195
    .line 196
    invoke-direct {p4}, Lcom/google/android/libraries/places/internal/zzbcf;-><init>()V

    .line 197
    .line 198
    .line 199
    sget-object p5, Lcom/google/android/libraries/places/internal/zzbfs;->zza:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 200
    .line 201
    invoke-virtual {p2, v0, p5, v1, p4}, Lcom/google/android/libraries/places/internal/zzbee;->zzj(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;ZLcom/google/android/libraries/places/internal/zzbcf;)V

    .line 202
    .line 203
    .line 204
    goto :goto_2

    .line 205
    :cond_6
    :goto_3
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    if-eqz p4, :cond_7

    .line 207
    .line 208
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbse;->zzc:Lcom/google/android/libraries/places/internal/zzbsf;

    .line 209
    .line 210
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbtp;->zzb:Lcom/google/android/libraries/places/internal/zzbtp;

    .line 211
    .line 212
    new-instance p2, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    const-string p4, "Received header for unknown stream: "

    .line 215
    .line 216
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbsf;->zzN(Lcom/google/android/libraries/places/internal/zzbsf;Lcom/google/android/libraries/places/internal/zzbtp;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_7
    return-void

    .line 230
    :goto_4
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 231
    throw p0
.end method
