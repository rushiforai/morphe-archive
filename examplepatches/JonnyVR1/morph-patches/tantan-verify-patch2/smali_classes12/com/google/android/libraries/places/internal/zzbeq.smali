.class public final Lcom/google/android/libraries/places/internal/zzbeq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbey;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbbd;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbbm;

.field private zzd:Lcom/google/android/libraries/places/internal/zzbbo;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbey;Lcom/google/android/libraries/places/internal/zzbbd;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zza:Lcom/google/android/libraries/places/internal/zzbey;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbey;->zzb(Lcom/google/android/libraries/places/internal/zzbey;)Lcom/google/android/libraries/places/internal/zzbbq;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbey;->zzd(Lcom/google/android/libraries/places/internal/zzbey;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbbq;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbbo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzd:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Lcom/google/android/libraries/places/internal/zzbbb;->zza(Lcom/google/android/libraries/places/internal/zzbbd;)Lcom/google/android/libraries/places/internal/zzbbm;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbey;->zzd(Lcom/google/android/libraries/places/internal/zzbey;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "Could not find policy \'"

    .line 36
    .line 37
    const-string p2, "\'. Make sure its implementation is either registered to LoadBalancerRegistry or included in META-INF/services/io.grpc.LoadBalancerProvider from your jar files."

    .line 38
    .line 39
    invoke-static {p1, p0, p2}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    throw p0
.end method


# virtual methods
.method public final zza()Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbbi;)Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zzd()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbqg;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zza:Lcom/google/android/libraries/places/internal/zzbey;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbey;->zzd(Lcom/google/android/libraries/places/internal/zzbey;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "using default policy"

    .line 17
    .line 18
    invoke-static {v0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbey;->zza(Lcom/google/android/libraries/places/internal/zzbey;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbbo;

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_0
    .catch Lcom/google/android/libraries/places/internal/zzbex; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbqg;

    .line 23
    .line 24
    invoke-direct {v2, v0, v1}, Lcom/google/android/libraries/places/internal/zzbqg;-><init>(Lcom/google/android/libraries/places/internal/zzbbo;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    move-object v0, v2

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception p1

    .line 30
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 41
    .line 42
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 43
    .line 44
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbet;

    .line 45
    .line 46
    invoke-direct {v3, p1}, Lcom/google/android/libraries/places/internal/zzbet;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbbd;->zze(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzd:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 58
    .line 59
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbev;

    .line 60
    .line 61
    invoke-direct {p1, v1}, Lcom/google/android/libraries/places/internal/zzbev;-><init>(Lcom/google/android/libraries/places/internal/zzbeu;)V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 65
    .line 66
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbdo;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzd:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 70
    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbqg;->zza:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbbo;->zzd()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbbo;->zzd()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_2

    .line 88
    .line 89
    :cond_1
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 90
    .line 91
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 92
    .line 93
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbes;

    .line 94
    .line 95
    invoke-direct {v4, v1}, Lcom/google/android/libraries/places/internal/zzbes;-><init>(Lcom/google/android/libraries/places/internal/zzber;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v3, v4}, Lcom/google/android/libraries/places/internal/zzbbd;->zze(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 104
    .line 105
    .line 106
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbqg;->zza:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 107
    .line 108
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzd:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 109
    .line 110
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 113
    .line 114
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/internal/zzbbb;->zza(Lcom/google/android/libraries/places/internal/zzbbd;)Lcom/google/android/libraries/places/internal/zzbbm;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 121
    .line 122
    check-cast v1, Lcom/google/android/libraries/places/internal/zzblg;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzblg;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzg(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzaym;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 139
    .line 140
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const/4 v3, 0x2

    .line 153
    const-string v4, "Load balancer changed from {0} to {1}"

    .line 154
    .line 155
    invoke-virtual {v1, v3, v4, v2}, Lcom/google/android/libraries/places/internal/zzaym;->zzb(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    :cond_2
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbqg;->zzb:Ljava/lang/Object;

    .line 159
    .line 160
    if-eqz v0, :cond_3

    .line 161
    .line 162
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzb:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 163
    .line 164
    check-cast v1, Lcom/google/android/libraries/places/internal/zzblg;

    .line 165
    .line 166
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzblg;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 167
    .line 168
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzg(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzaym;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    const/4 v3, 0x1

    .line 177
    const-string v4, "Load-balancing config: {0}"

    .line 178
    .line 179
    invoke-virtual {v1, v3, v4, v2}, Lcom/google/android/libraries/places/internal/zzaym;->zzb(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    :cond_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 183
    .line 184
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbbi;->zzb()Lcom/google/android/libraries/places/internal/zzbbg;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zze()Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/internal/zzbbg;->zza(Ljava/util/List;)Lcom/google/android/libraries/places/internal/zzbbg;

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzbbg;->zzb(Lcom/google/android/libraries/places/internal/zzaye;)Lcom/google/android/libraries/places/internal/zzbbg;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbbg;->zzc(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbbg;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbg;->zzd()Lcom/google/android/libraries/places/internal/zzbbi;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbbm;->zza(Lcom/google/android/libraries/places/internal/zzbbi;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0
.end method

.method public final zzc()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeq;->zzc:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 8
    .line 9
    return-void
.end method
