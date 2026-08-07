.class public final Lcom/google/android/libraries/places/internal/zzbih;
.super Lcom/google/android/libraries/places/internal/zzbcv;
.source "SourceFile"


# static fields
.field static final zza:Z

.field static final zzb:Z

.field protected static final zzc:Z

.field private static final zzg:Ljava/util/logging/Logger;

.field private static final zzh:Ljava/util/Set;

.field private static final zzi:Ljava/lang/String;

.field private static final zzj:Ljava/lang/String;

.field private static final zzk:Ljava/lang/String;

.field private static final zzl:Lcom/google/android/libraries/places/internal/zzbig;

.field private static zzm:Ljava/lang/String;


# instance fields
.field private zzA:Z

.field private zzB:Lcom/google/android/libraries/places/internal/zzbcr;

.field final zzd:Lcom/google/android/libraries/places/internal/zzbde;

.field protected volatile zze:Lcom/google/android/libraries/places/internal/zzbhz;

.field protected zzf:Z

.field private final zzn:Ljava/util/Random;

.field private final zzo:Ljava/util/concurrent/atomic/AtomicReference;

.field private final zzp:Ljava/lang/String;

.field private final zzq:Ljava/lang/String;

.field private final zzr:I

.field private final zzs:Lcom/google/android/libraries/places/internal/zzbql;

.field private final zzt:J

.field private final zzu:Lcom/google/android/libraries/places/internal/zzbdw;

.field private final zzv:Lcom/google/android/libraries/places/internal/zzna;

.field private zzw:Z

.field private zzx:Ljava/util/concurrent/Executor;

.field private final zzy:Z

.field private final zzz:Lcom/google/android/libraries/places/internal/zzbcu;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbih;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 12
    .line 13
    new-instance v1, Ljava/util/HashSet;

    .line 14
    .line 15
    const-string v3, "clientHostname"

    .line 16
    .line 17
    const-string v4, "serviceConfig"

    .line 18
    .line 19
    const-string v5, "clientLanguage"

    .line 20
    .line 21
    const-string v6, "percentage"

    .line 22
    .line 23
    filled-new-array {v5, v6, v3, v4}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbih;->zzh:Ljava/util/Set;

    .line 39
    .line 40
    const-string v1, "io.grpc.internal.DnsNameResolverProvider.enable_jndi"

    .line 41
    .line 42
    const-string v3, "true"

    .line 43
    .line 44
    invoke-static {v1, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbih;->zzi:Ljava/lang/String;

    .line 49
    .line 50
    const-string v3, "io.grpc.internal.DnsNameResolverProvider.enable_jndi_localhost"

    .line 51
    .line 52
    const-string v4, "false"

    .line 53
    .line 54
    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    sput-object v3, Lcom/google/android/libraries/places/internal/zzbih;->zzj:Ljava/lang/String;

    .line 59
    .line 60
    const-string v5, "io.grpc.internal.DnsNameResolverProvider.enable_service_config"

    .line 61
    .line 62
    invoke-static {v5, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    sput-object v4, Lcom/google/android/libraries/places/internal/zzbih;->zzk:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    sput-boolean v1, Lcom/google/android/libraries/places/internal/zzbih;->zza:Z

    .line 73
    .line 74
    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    sput-boolean v1, Lcom/google/android/libraries/places/internal/zzbih;->zzb:Z

    .line 79
    .line 80
    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    sput-boolean v1, Lcom/google/android/libraries/places/internal/zzbih;->zzc:Z

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x0

    .line 91
    :try_start_0
    const-string v3, "io.grpc.internal.JndiResourceResolverFactory"

    .line 92
    .line 93
    const/4 v4, 0x1

    .line 94
    invoke-static {v3, v4, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-class v3, Lcom/google/android/libraries/places/internal/zzbig;

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_2

    .line 104
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 105
    .line 106
    .line 107
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 108
    :try_start_2
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbig;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 113
    .line 114
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbig;->zzb()Ljava/lang/Throwable;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    if-eqz v3, :cond_0

    .line 119
    .line 120
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 121
    .line 122
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbig;->zzb()Ljava/lang/Throwable;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    const-string v5, "getResourceResolverFactory"

    .line 127
    .line 128
    const-string v6, "JndiResourceResolverFactory not available, skipping."

    .line 129
    .line 130
    const-string v4, "io.grpc.internal.DnsNameResolver"

    .line 131
    .line 132
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_0
    move-object v1, v0

    .line 137
    goto :goto_2

    .line 138
    :catch_0
    move-exception v0

    .line 139
    move-object v7, v0

    .line 140
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 141
    .line 142
    const-string v6, "Can\'t construct JndiResourceResolverFactory, skipping."

    .line 143
    .line 144
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 145
    .line 146
    const-string v4, "io.grpc.internal.DnsNameResolver"

    .line 147
    .line 148
    const-string v5, "getResourceResolverFactory"

    .line 149
    .line 150
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :catch_1
    move-exception v0

    .line 155
    move-object v13, v0

    .line 156
    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 157
    .line 158
    const-string v12, "Can\'t find JndiResourceResolverFactory ctor, skipping."

    .line 159
    .line 160
    sget-object v8, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 161
    .line 162
    const-string v10, "io.grpc.internal.DnsNameResolver"

    .line 163
    .line 164
    const-string v11, "getResourceResolverFactory"

    .line 165
    .line 166
    invoke-virtual/range {v8 .. v13}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :catch_2
    move-exception v0

    .line 171
    move-object v7, v0

    .line 172
    goto :goto_0

    .line 173
    :catch_3
    move-exception v0

    .line 174
    move-object v7, v0

    .line 175
    goto :goto_1

    .line 176
    :goto_0
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 177
    .line 178
    const-string v6, "Unable to cast JndiResourceResolverFactory, skipping."

    .line 179
    .line 180
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 181
    .line 182
    const-string v4, "io.grpc.internal.DnsNameResolver"

    .line 183
    .line 184
    const-string v5, "getResourceResolverFactory"

    .line 185
    .line 186
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :goto_1
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 191
    .line 192
    const-string v6, "Unable to find JndiResourceResolverFactory, skipping."

    .line 193
    .line 194
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 195
    .line 196
    const-string v4, "io.grpc.internal.DnsNameResolver"

    .line 197
    .line 198
    const-string v5, "getResourceResolverFactory"

    .line 199
    .line 200
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    :goto_2
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbih;->zzl:Lcom/google/android/libraries/places/internal/zzbig;

    .line 204
    .line 205
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzbco;Lcom/google/android/libraries/places/internal/zzbql;Lcom/google/android/libraries/places/internal/zzna;Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbcv;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ljava/util/Random;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzn:Ljava/util/Random;

    .line 14
    .line 15
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbic;->zza:Lcom/google/android/libraries/places/internal/zzbic;

    .line 16
    .line 17
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzbih;->zze:Lcom/google/android/libraries/places/internal/zzbhz;

    .line 18
    .line 19
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    const-string v2, "args"

    .line 27
    .line 28
    move-object/from16 v3, p3

    .line 29
    .line 30
    invoke-static {v3, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-object/from16 v2, p4

    .line 34
    .line 35
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzs:Lcom/google/android/libraries/places/internal/zzbql;

    .line 36
    .line 37
    const-string v2, "name"

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    const-string v2, "//"

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const/4 v5, 0x0

    .line 57
    const/4 v6, 0x1

    .line 58
    if-eqz v4, :cond_0

    .line 59
    .line 60
    move v4, v6

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v4, v5

    .line 63
    :goto_0
    const-string v7, "Invalid DNS name: %s"

    .line 64
    .line 65
    invoke-static {v4, v7, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzj(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v4, "nameUri (%s) doesn\'t have an authority"

    .line 73
    .line 74
    invoke-static {v1, v4, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzd(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzp:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/net/URI;->getPort()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    const/4 v4, -0x1

    .line 90
    if-ne v1, v4, :cond_1

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbco;->zza()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzr:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {v2}, Ljava/net/URI;->getPort()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzr:I

    .line 104
    .line 105
    :goto_1
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbco;->zzd()Lcom/google/android/libraries/places/internal/zzbde;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzd:Lcom/google/android/libraries/places/internal/zzbde;

    .line 110
    .line 111
    const-wide/16 v1, 0x0

    .line 112
    .line 113
    if-eqz p6, :cond_2

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_2
    const-string v4, "networkaddress.cache.ttl"

    .line 117
    .line 118
    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    const-wide/16 v8, 0x1e

    .line 123
    .line 124
    if-eqz v7, :cond_3

    .line 125
    .line 126
    :try_start_0
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v8
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    goto :goto_2

    .line 131
    :catch_0
    sget-object v10, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 132
    .line 133
    sget-object v11, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 134
    .line 135
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 136
    .line 137
    .line 138
    move-result-object v12

    .line 139
    filled-new-array {v4, v7, v12}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v15

    .line 143
    const-string v13, "getNetworkAddressCacheTtlNanos"

    .line 144
    .line 145
    const-string v14, "Property({0}) valid is not valid number format({1}), fall back to default({2})"

    .line 146
    .line 147
    const-string v12, "io.grpc.internal.DnsNameResolver"

    .line 148
    .line 149
    invoke-virtual/range {v10 .. v15}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    :goto_2
    cmp-long v1, v8, v1

    .line 153
    .line 154
    if-lez v1, :cond_4

    .line 155
    .line 156
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 157
    .line 158
    invoke-virtual {v1, v8, v9}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 159
    .line 160
    .line 161
    move-result-wide v1

    .line 162
    goto :goto_3

    .line 163
    :cond_4
    move-wide v1, v8

    .line 164
    :goto_3
    iput-wide v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzt:J

    .line 165
    .line 166
    move-object/from16 v1, p5

    .line 167
    .line 168
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzv:Lcom/google/android/libraries/places/internal/zzna;

    .line 169
    .line 170
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbco;->zze()Lcom/google/android/libraries/places/internal/zzbdw;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzu:Lcom/google/android/libraries/places/internal/zzbdw;

    .line 175
    .line 176
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbco;->zzf()Ljava/util/concurrent/Executor;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzx:Ljava/util/concurrent/Executor;

    .line 181
    .line 182
    if-nez v1, :cond_5

    .line 183
    .line 184
    move v5, v6

    .line 185
    :cond_5
    iput-boolean v5, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzy:Z

    .line 186
    .line 187
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbco;->zzc()Lcom/google/android/libraries/places/internal/zzbcu;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzz:Lcom/google/android/libraries/places/internal/zzbcu;

    .line 192
    .line 193
    return-void
.end method

.method public static bridge synthetic zze(Lcom/google/android/libraries/places/internal/zzbih;)J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzt:J

    return-wide v0
.end method

.method public static bridge synthetic zzf(Lcom/google/android/libraries/places/internal/zzbih;)Lcom/google/android/libraries/places/internal/zzna;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzv:Lcom/google/android/libraries/places/internal/zzna;

    return-object p0
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbih;)Lcom/google/android/libraries/places/internal/zzazs;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzr:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzd:Lcom/google/android/libraries/places/internal/zzbde;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzbde;->zza(Ljava/net/SocketAddress;)Lcom/google/android/libraries/places/internal/zzbdd;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/google/android/libraries/places/internal/zzazs;

    .line 18
    .line 19
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaye;->zza:Lcom/google/android/libraries/places/internal/zzaye;

    .line 20
    .line 21
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, p0, v1}, Lcom/google/android/libraries/places/internal/zzazs;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzaye;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public static bridge synthetic zzh(Lcom/google/android/libraries/places/internal/zzbih;)Lcom/google/android/libraries/places/internal/zzbdw;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzu:Lcom/google/android/libraries/places/internal/zzbdw;

    return-object p0
.end method

.method public static bridge synthetic zzj(Lcom/google/android/libraries/places/internal/zzbih;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic zzk()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    return-object v0
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbih;Z)V
    .locals 0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzA:Z

    return-void
.end method

.method private static zzm()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbih;->zzm:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbih;->zzm:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    return-object v0

    .line 22
    :cond_0
    :goto_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbih;->zzm:Ljava/lang/String;

    .line 23
    .line 24
    return-object v0
.end method

.method private final zzn()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzA:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzw:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzf:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzt:J

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzv:Lcom/google/android/libraries/places/internal/zzna;

    .line 24
    .line 25
    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzna;->zza(Ljava/util/concurrent/TimeUnit;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzt:J

    .line 32
    .line 33
    cmp-long v0, v0, v2

    .line 34
    .line 35
    if-lez v0, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzA:Z

    .line 39
    .line 40
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzx:Ljava/util/concurrent/Executor;

    .line 41
    .line 42
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbie;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzB:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 45
    .line 46
    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/places/internal/zzbie;-><init>(Lcom/google/android/libraries/places/internal/zzbih;Lcom/google/android/libraries/places/internal/zzbcr;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzp:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzB:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    const-string v1, "not started"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbih;->zzn()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final zzc()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzw:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzw:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzx:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzy:Z

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzs:Lcom/google/android/libraries/places/internal/zzbql;

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzbqm;->zzc(Lcom/google/android/libraries/places/internal/zzbql;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzx:Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public final zzd(Lcom/google/android/libraries/places/internal/zzbcr;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzB:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    const-string v1, "already started"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzy:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzs:Lcom/google/android/libraries/places/internal/zzbql;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbqm;->zza(Lcom/google/android/libraries/places/internal/zzbql;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzx:Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    :cond_1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbih;->zzB:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbih;->zzn()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final zzi(Z)Lcom/google/android/libraries/places/internal/zzbib;
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "serviceConfig"

    .line 4
    .line 5
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbib;

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    invoke-direct {v3, v4}, Lcom/google/android/libraries/places/internal/zzbib;-><init>(Lcom/google/android/libraries/places/internal/zzbia;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    new-instance v5, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-eqz v6, :cond_0

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    check-cast v6, Ljava/net/InetAddress;

    .line 49
    .line 50
    new-instance v7, Lcom/google/android/libraries/places/internal/zzazs;

    .line 51
    .line 52
    new-instance v8, Ljava/net/InetSocketAddress;

    .line 53
    .line 54
    iget v9, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzr:I

    .line 55
    .line 56
    invoke-direct {v8, v6, v9}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 57
    .line 58
    .line 59
    sget-object v6, Lcom/google/android/libraries/places/internal/zzaye;->zza:Lcom/google/android/libraries/places/internal/zzaye;

    .line 60
    .line 61
    invoke-static {v8}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-direct {v7, v8, v6}, Lcom/google/android/libraries/places/internal/zzazs;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzaye;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    move-exception v0

    .line 73
    goto/16 :goto_14

    .line 74
    .line 75
    :cond_0
    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v3, v0}, Lcom/google/android/libraries/places/internal/zzbib;->zzd(Lcom/google/android/libraries/places/internal/zzbib;Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 80
    .line 81
    .line 82
    sget-boolean v0, Lcom/google/android/libraries/places/internal/zzbih;->zzc:Z

    .line 83
    .line 84
    if-eqz v0, :cond_1c

    .line 85
    .line 86
    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 87
    .line 88
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 89
    .line 90
    sget-boolean v6, Lcom/google/android/libraries/places/internal/zzbih;->zza:Z

    .line 91
    .line 92
    sget-boolean v7, Lcom/google/android/libraries/places/internal/zzbih;->zzb:Z

    .line 93
    .line 94
    const/4 v8, 0x1

    .line 95
    const/4 v9, 0x0

    .line 96
    if-nez v6, :cond_1

    .line 97
    .line 98
    :goto_1
    move-object v0, v4

    .line 99
    goto :goto_4

    .line 100
    :cond_1
    const-string v6, "localhost"

    .line 101
    .line 102
    invoke-virtual {v6, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    if-eqz v6, :cond_2

    .line 107
    .line 108
    if-nez v7, :cond_7

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    const-string v6, ":"

    .line 112
    .line 113
    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-eqz v6, :cond_3

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    move v7, v8

    .line 121
    move v6, v9

    .line 122
    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result v10

    .line 126
    if-ge v6, v10, :cond_6

    .line 127
    .line 128
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 129
    .line 130
    .line 131
    move-result v10

    .line 132
    const/16 v11, 0x2e

    .line 133
    .line 134
    if-eq v10, v11, :cond_5

    .line 135
    .line 136
    const/16 v11, 0x30

    .line 137
    .line 138
    if-lt v10, v11, :cond_4

    .line 139
    .line 140
    const/16 v11, 0x39

    .line 141
    .line 142
    if-gt v10, v11, :cond_4

    .line 143
    .line 144
    move v10, v8

    .line 145
    goto :goto_3

    .line 146
    :cond_4
    move v10, v9

    .line 147
    :goto_3
    and-int/2addr v7, v10

    .line 148
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_6
    if-eqz v7, :cond_7

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_7
    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbif;

    .line 161
    .line 162
    if-nez v0, :cond_8

    .line 163
    .line 164
    sget-object v6, Lcom/google/android/libraries/places/internal/zzbih;->zzl:Lcom/google/android/libraries/places/internal/zzbig;

    .line 165
    .line 166
    if-eqz v6, :cond_8

    .line 167
    .line 168
    invoke-interface {v6}, Lcom/google/android/libraries/places/internal/zzbig;->zza()Lcom/google/android/libraries/places/internal/zzbif;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    :cond_8
    :goto_4
    if-eqz v0, :cond_9

    .line 173
    .line 174
    :try_start_2
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbif;->zza()Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 178
    goto :goto_5

    .line 179
    :catch_1
    move-exception v0

    .line 180
    move-object v15, v0

    .line 181
    sget-object v10, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 182
    .line 183
    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 184
    .line 185
    const-string v13, "resolveServiceConfig"

    .line 186
    .line 187
    const-string v14, "ServiceConfig resolution failure"

    .line 188
    .line 189
    const-string v12, "io.grpc.internal.DnsNameResolver"

    .line 190
    .line 191
    invoke-virtual/range {v10 .. v15}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    :cond_9
    :goto_5
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_1a

    .line 199
    .line 200
    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzn:Ljava/util/Random;

    .line 201
    .line 202
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbih;->zzm()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    :try_start_3
    new-instance v7, Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result v10

    .line 219
    if-eqz v10, :cond_c

    .line 220
    .line 221
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v10

    .line 225
    check-cast v10, Ljava/lang/String;

    .line 226
    .line 227
    const-string v11, "grpc_config="

    .line 228
    .line 229
    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 230
    .line 231
    .line 232
    move-result v11

    .line 233
    if-nez v11, :cond_a

    .line 234
    .line 235
    sget-object v12, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 236
    .line 237
    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 238
    .line 239
    const-string v14, "io.grpc.internal.DnsNameResolver"

    .line 240
    .line 241
    const-string v15, "parseTxtResults"

    .line 242
    .line 243
    const-string v16, "Ignoring non service config {0}"

    .line 244
    .line 245
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v17

    .line 249
    invoke-virtual/range {v12 .. v17}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    goto :goto_6

    .line 253
    :catch_2
    move-exception v0

    .line 254
    goto/16 :goto_e

    .line 255
    .line 256
    :catch_3
    move-exception v0

    .line 257
    goto/16 :goto_e

    .line 258
    .line 259
    :cond_a
    const/16 v11, 0xc

    .line 260
    .line 261
    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v10

    .line 265
    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzbkf;->zza(Ljava/lang/String;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v10

    .line 269
    instance-of v11, v10, Ljava/util/List;

    .line 270
    .line 271
    if-eqz v11, :cond_b

    .line 272
    .line 273
    check-cast v10, Ljava/util/List;

    .line 274
    .line 275
    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzbkg;->zzf(Ljava/util/List;)Ljava/util/List;

    .line 276
    .line 277
    .line 278
    invoke-interface {v7, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 279
    .line 280
    .line 281
    goto :goto_6

    .line 282
    :cond_b
    new-instance v0, Ljava/lang/ClassCastException;

    .line 283
    .line 284
    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    const-string v5, "wrong type "

    .line 289
    .line 290
    invoke-virtual {v5, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    invoke-direct {v0, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    throw v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2

    .line 298
    :cond_c
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    move-object v7, v4

    .line 303
    :cond_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 304
    .line 305
    .line 306
    move-result v10

    .line 307
    if-eqz v10, :cond_17

    .line 308
    .line 309
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    check-cast v7, Ljava/util/Map;

    .line 314
    .line 315
    :try_start_4
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 316
    .line 317
    .line 318
    move-result-object v10

    .line 319
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 320
    .line 321
    .line 322
    move-result-object v10

    .line 323
    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 324
    .line 325
    .line 326
    move-result v11

    .line 327
    if-eqz v11, :cond_e

    .line 328
    .line 329
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v11

    .line 333
    check-cast v11, Ljava/util/Map$Entry;

    .line 334
    .line 335
    sget-object v12, Lcom/google/android/libraries/places/internal/zzbih;->zzh:Ljava/util/Set;

    .line 336
    .line 337
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v13

    .line 341
    invoke-interface {v12, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result v12

    .line 345
    const-string v13, "Bad key: %s"

    .line 346
    .line 347
    invoke-static {v12, v13, v11}, Lcom/google/android/libraries/places/internal/zzng;->zza(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 348
    .line 349
    .line 350
    goto :goto_7

    .line 351
    :catch_4
    move-exception v0

    .line 352
    goto/16 :goto_c

    .line 353
    .line 354
    :cond_e
    const-string v10, "clientLanguage"

    .line 355
    .line 356
    invoke-static {v7, v10}, Lcom/google/android/libraries/places/internal/zzbkg;->zzi(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    .line 357
    .line 358
    .line 359
    move-result-object v10

    .line 360
    if-eqz v10, :cond_11

    .line 361
    .line 362
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 363
    .line 364
    .line 365
    move-result v11

    .line 366
    if-nez v11, :cond_11

    .line 367
    .line 368
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 369
    .line 370
    .line 371
    move-result-object v10

    .line 372
    :cond_f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 373
    .line 374
    .line 375
    move-result v11

    .line 376
    if-eqz v11, :cond_10

    .line 377
    .line 378
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v11

    .line 382
    check-cast v11, Ljava/lang/String;

    .line 383
    .line 384
    const-string v12, "java"

    .line 385
    .line 386
    invoke-virtual {v12, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 387
    .line 388
    .line 389
    move-result v11

    .line 390
    if-eqz v11, :cond_f

    .line 391
    .line 392
    goto :goto_9

    .line 393
    :cond_10
    :goto_8
    move-object v7, v4

    .line 394
    goto :goto_b

    .line 395
    :cond_11
    :goto_9
    const-string v10, "percentage"

    .line 396
    .line 397
    invoke-static {v7, v10}, Lcom/google/android/libraries/places/internal/zzbkg;->zzb(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Double;

    .line 398
    .line 399
    .line 400
    move-result-object v10

    .line 401
    if-eqz v10, :cond_13

    .line 402
    .line 403
    invoke-virtual {v10}, Ljava/lang/Double;->intValue()I

    .line 404
    .line 405
    .line 406
    move-result v11

    .line 407
    const/16 v12, 0x64

    .line 408
    .line 409
    if-ltz v11, :cond_12

    .line 410
    .line 411
    if-gt v11, v12, :cond_12

    .line 412
    .line 413
    move v13, v8

    .line 414
    goto :goto_a

    .line 415
    :cond_12
    move v13, v9

    .line 416
    :goto_a
    const-string v14, "Bad percentage: %s"

    .line 417
    .line 418
    invoke-static {v13, v14, v10}, Lcom/google/android/libraries/places/internal/zzng;->zza(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v0, v12}, Ljava/util/Random;->nextInt(I)I

    .line 422
    .line 423
    .line 424
    move-result v10

    .line 425
    if-lt v10, v11, :cond_13

    .line 426
    .line 427
    goto :goto_8

    .line 428
    :cond_13
    const-string v10, "clientHostname"

    .line 429
    .line 430
    invoke-static {v7, v10}, Lcom/google/android/libraries/places/internal/zzbkg;->zzi(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    .line 431
    .line 432
    .line 433
    move-result-object v10

    .line 434
    if-eqz v10, :cond_15

    .line 435
    .line 436
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 437
    .line 438
    .line 439
    move-result v11

    .line 440
    if-nez v11, :cond_15

    .line 441
    .line 442
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 443
    .line 444
    .line 445
    move-result-object v10

    .line 446
    :cond_14
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 447
    .line 448
    .line 449
    move-result v11

    .line 450
    if-eqz v11, :cond_10

    .line 451
    .line 452
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v11

    .line 456
    check-cast v11, Ljava/lang/String;

    .line 457
    .line 458
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 459
    .line 460
    .line 461
    move-result v11

    .line 462
    if-eqz v11, :cond_14

    .line 463
    .line 464
    :cond_15
    invoke-static {v7, v2}, Lcom/google/android/libraries/places/internal/zzbkg;->zzj(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 465
    .line 466
    .line 467
    move-result-object v10

    .line 468
    if-eqz v10, :cond_16

    .line 469
    .line 470
    move-object v7, v10

    .line 471
    :goto_b
    if-eqz v7, :cond_d

    .line 472
    .line 473
    goto :goto_d

    .line 474
    :cond_16
    new-instance v0, Lcom/google/android/libraries/places/internal/zznh;

    .line 475
    .line 476
    const-string v5, "key \'%s\' missing in \'%s\'"

    .line 477
    .line 478
    filled-new-array {v7, v2}, [Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zznh;-><init>(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    throw v0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_4

    .line 490
    :goto_c
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbdo;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 491
    .line 492
    const-string v5, "failed to pick service config choice"

    .line 493
    .line 494
    invoke-virtual {v2, v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    invoke-virtual {v2, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    goto :goto_f

    .line 507
    :cond_17
    :goto_d
    if-nez v7, :cond_18

    .line 508
    .line 509
    move-object v0, v4

    .line 510
    goto :goto_f

    .line 511
    :cond_18
    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbcp;->zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    goto :goto_f

    .line 516
    :goto_e
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbdo;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 517
    .line 518
    const-string v5, "failed to parse TXT records"

    .line 519
    .line 520
    invoke-virtual {v2, v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 521
    .line 522
    .line 523
    move-result-object v2

    .line 524
    invoke-virtual {v2, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    :goto_f
    if-eqz v0, :cond_1b

    .line 533
    .line 534
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzc()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    if-eqz v2, :cond_19

    .line 539
    .line 540
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzc()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 541
    .line 542
    .line 543
    move-result-object v0

    .line 544
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    goto :goto_10

    .line 549
    :cond_19
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcp;->zzd()Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    check-cast v0, Ljava/util/Map;

    .line 554
    .line 555
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzz:Lcom/google/android/libraries/places/internal/zzbcu;

    .line 556
    .line 557
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbcu;->zza(Ljava/util/Map;)Lcom/google/android/libraries/places/internal/zzbcp;

    .line 558
    .line 559
    .line 560
    move-result-object v4

    .line 561
    goto :goto_10

    .line 562
    :cond_1a
    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 563
    .line 564
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 565
    .line 566
    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 567
    .line 568
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    move-result-object v10

    .line 572
    const-string v8, "resolveServiceConfig"

    .line 573
    .line 574
    const-string v9, "No TXT records found for {0}"

    .line 575
    .line 576
    const-string v7, "io.grpc.internal.DnsNameResolver"

    .line 577
    .line 578
    invoke-virtual/range {v5 .. v10}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    :cond_1b
    :goto_10
    invoke-static {v3, v4}, Lcom/google/android/libraries/places/internal/zzbib;->zze(Lcom/google/android/libraries/places/internal/zzbib;Lcom/google/android/libraries/places/internal/zzbcp;)V

    .line 582
    .line 583
    .line 584
    :cond_1c
    return-object v3

    .line 585
    :catchall_0
    move-exception v0

    .line 586
    goto :goto_11

    .line 587
    :catch_5
    move-exception v0

    .line 588
    move-object v4, v0

    .line 589
    goto :goto_12

    .line 590
    :goto_11
    move-object v9, v4

    .line 591
    goto :goto_13

    .line 592
    :goto_12
    :try_start_5
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zznd;->zza(Ljava/lang/Throwable;)V

    .line 593
    .line 594
    .line 595
    new-instance v0, Ljava/lang/RuntimeException;

    .line 596
    .line 597
    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 598
    .line 599
    .line 600
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 601
    :goto_13
    if-eqz v9, :cond_1d

    .line 602
    .line 603
    :try_start_6
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbih;->zzg:Ljava/util/logging/Logger;

    .line 604
    .line 605
    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 606
    .line 607
    const-string v6, "io.grpc.internal.DnsNameResolver"

    .line 608
    .line 609
    const-string v7, "resolveAddresses"

    .line 610
    .line 611
    const-string v8, "Address resolution failure"

    .line 612
    .line 613
    invoke-virtual/range {v4 .. v9}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 614
    .line 615
    .line 616
    :cond_1d
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 617
    :goto_14
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbih;->zzq:Ljava/lang/String;

    .line 618
    .line 619
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v1

    .line 623
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbdo;->zzp:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 624
    .line 625
    const-string v4, "Unable to resolve host "

    .line 626
    .line 627
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v1

    .line 631
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    invoke-static {v3, v0}, Lcom/google/android/libraries/places/internal/zzbib;->zzf(Lcom/google/android/libraries/places/internal/zzbib;Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 640
    .line 641
    .line 642
    return-object v3
.end method
