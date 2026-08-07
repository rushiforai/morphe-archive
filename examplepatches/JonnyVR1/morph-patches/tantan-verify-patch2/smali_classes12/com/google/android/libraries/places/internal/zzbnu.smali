.class final Lcom/google/android/libraries/places/internal/zzbnu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbde;


# static fields
.field private static final zza:Ljava/util/logging/Logger;

.field private static final zzb:Lcom/google/android/libraries/places/internal/zznc;

.field private static final zze:Lcom/google/android/libraries/places/internal/zzbns;


# instance fields
.field private final zzc:Lcom/google/android/libraries/places/internal/zznc;

.field private final zzd:Ljava/net/InetSocketAddress;

.field private final zzf:Lcom/google/android/libraries/places/internal/zzbns;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbnu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 12
    .line 13
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbns;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbns;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnu;->zze:Lcom/google/android/libraries/places/internal/zzbns;

    .line 19
    .line 20
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnt;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbnt;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnu;->zzb:Lcom/google/android/libraries/places/internal/zznc;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbnu;->zzb:Lcom/google/android/libraries/places/internal/zznc;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbnu;->zze:Lcom/google/android/libraries/places/internal/zzbns;

    .line 4
    .line 5
    const-string v2, "GRPC_PROXY_EXP"

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnu;->zzc:Lcom/google/android/libraries/places/internal/zznc;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnu;->zzf:Lcom/google/android/libraries/places/internal/zzbns;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    const-string v0, ":"

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    array-length v1, v0

    .line 34
    const/4 v2, 0x1

    .line 35
    if-le v1, v2, :cond_0

    .line 36
    .line 37
    aget-object v1, v0, v2

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/16 v1, 0x50

    .line 45
    .line 46
    :goto_0
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 47
    .line 48
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 49
    .line 50
    const-string v4, "overrideProxy"

    .line 51
    .line 52
    const-string v5, "Detected GRPC_PROXY_EXP and will honor it, but this feature will be removed in a future release. Use the JVM flags \"-Dhttps.proxyHost=HOST -Dhttps.proxyPort=PORT\" to set the https proxy for this JVM."

    .line 53
    .line 54
    const-string v6, "io.grpc.internal.ProxyDetectorImpl"

    .line 55
    .line 56
    invoke-virtual {v2, v3, v6, v4, v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance v2, Ljava/net/InetSocketAddress;

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    aget-object v0, v0, v3

    .line 63
    .line 64
    invoke-direct {v2, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnu;->zzd:Ljava/net/InetSocketAddress;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnu;->zzd:Ljava/net/InetSocketAddress;

    .line 72
    .line 73
    return-void
.end method

.method public static bridge synthetic zzb()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private static final zzc(Ljava/net/InetSocketAddress;)Lcom/google/android/libraries/places/internal/zzbdd;
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
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbjd;->zze(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    :try_start_1
    new-instance v2, Ljava/net/URI;

    .line 7
    .line 8
    const-string v3, "https"

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getPort()I

    .line 11
    .line 12
    .line 13
    move-result v6

    .line 14
    const/4 v8, 0x0

    .line 15
    const/4 v9, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v7, 0x0

    .line 18
    invoke-direct/range {v2 .. v9}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v3, "detectProxy"

    .line 26
    .line 27
    const-string v4, "io.grpc.internal.ProxyDetectorImpl"

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 32
    .line 33
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 34
    .line 35
    const-string v2, "proxy selector is null, so continuing without proxy lookup"

    .line 36
    .line 37
    invoke-virtual {p0, v0, v4, v3, v2}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_0
    invoke-virtual {v0, v2}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v5, 0x1

    .line 50
    if-le v2, v5, :cond_1

    .line 51
    .line 52
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 53
    .line 54
    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 55
    .line 56
    const-string v6, "More than 1 proxy detected, gRPC will select the first one"

    .line 57
    .line 58
    invoke-virtual {v2, v5, v4, v3, v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    const/4 v2, 0x0

    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/net/Proxy;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget-object v3, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 73
    .line 74
    if-ne v2, v3, :cond_2

    .line 75
    .line 76
    return-object v1

    .line 77
    :cond_2
    invoke-virtual {v0}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ljava/net/InetSocketAddress;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbjd;->zze(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    const-string v6, ""

    .line 96
    .line 97
    const/4 v7, 0x0

    .line 98
    const-string v5, "https"

    .line 99
    .line 100
    invoke-static/range {v2 .. v7}, Lcom/google/android/libraries/places/internal/zzbns;->zza(Ljava/lang/String;Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/PasswordAuthentication;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    new-instance v4, Ljava/net/InetSocketAddress;

    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-direct {v4, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 125
    .line 126
    .line 127
    move-object v0, v4

    .line 128
    :cond_3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbaa;->zza()Lcom/google/android/libraries/places/internal/zzazy;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3, p0}, Lcom/google/android/libraries/places/internal/zzazy;->zzc(Ljava/net/InetSocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v0}, Lcom/google/android/libraries/places/internal/zzazy;->zzb(Ljava/net/SocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 136
    .line 137
    .line 138
    if-nez v2, :cond_4

    .line 139
    .line 140
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzazy;->zze()Lcom/google/android/libraries/places/internal/zzbaa;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :cond_4
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v3, p0}, Lcom/google/android/libraries/places/internal/zzazy;->zzd(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getPassword()[C

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    if-nez p0, :cond_5

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_5
    new-instance v1, Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getPassword()[C

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([C)V

    .line 166
    .line 167
    .line 168
    :goto_0
    invoke-virtual {v3, v1}, Lcom/google/android/libraries/places/internal/zzazy;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzazy;->zze()Lcom/google/android/libraries/places/internal/zzbaa;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :catch_0
    move-exception v0

    .line 177
    move-object p0, v0

    .line 178
    move-object v7, p0

    .line 179
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 180
    .line 181
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 182
    .line 183
    const-string v5, "detectProxy"

    .line 184
    .line 185
    const-string v6, "Failed to construct URI for proxy lookup, proceeding without proxy"

    .line 186
    .line 187
    const-string v4, "io.grpc.internal.ProxyDetectorImpl"

    .line 188
    .line 189
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    return-object v1

    .line 193
    :catchall_0
    move-exception v0

    .line 194
    move-object v13, v0

    .line 195
    sget-object v8, Lcom/google/android/libraries/places/internal/zzbnu;->zza:Ljava/util/logging/Logger;

    .line 196
    .line 197
    sget-object v9, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 198
    .line 199
    const-string v11, "detectProxy"

    .line 200
    .line 201
    const-string v12, "Failed to get host for proxy lookup, proceeding without proxy"

    .line 202
    .line 203
    const-string v10, "io.grpc.internal.ProxyDetectorImpl"

    .line 204
    .line 205
    invoke-virtual/range {v8 .. v13}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 206
    .line 207
    .line 208
    return-object v1
.end method


# virtual methods
.method public final zza(Ljava/net/SocketAddress;)Lcom/google/android/libraries/places/internal/zzbdd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/net/InetSocketAddress;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnu;->zzd:Ljava/net/InetSocketAddress;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbaa;->zza()Lcom/google/android/libraries/places/internal/zzazy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzazy;->zzb(Ljava/net/SocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 16
    .line 17
    .line 18
    check-cast p1, Ljava/net/InetSocketAddress;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzazy;->zzc(Ljava/net/InetSocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzazy;->zze()Lcom/google/android/libraries/places/internal/zzbaa;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    check-cast p1, Ljava/net/InetSocketAddress;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnu;->zzc(Ljava/net/InetSocketAddress;)Lcom/google/android/libraries/places/internal/zzbdd;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method
